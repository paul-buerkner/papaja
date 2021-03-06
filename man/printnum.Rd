% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/printnum.R
\name{printnum}
\alias{printnum}
\alias{printnum.default}
\alias{printnum.list}
\alias{printnum.integer}
\alias{printnum.numeric}
\alias{printnum.data.frame}
\alias{printnum.matrix}
\alias{printnum.papaja_labelled}
\title{Prepare numeric values for printing}
\usage{
printnum(x, ...)

\method{printnum}{default}(x, na_string = getOption("papaja.na_string"),
  ...)

\method{printnum}{list}(x, ...)

\method{printnum}{integer}(x, numerals = TRUE, capitalize = FALSE,
  na_string = getOption("papaja.na_string"), ...)

\method{printnum}{numeric}(x, gt1 = TRUE, zero = TRUE, margin = 1,
  na_string = getOption("papaja.na_string"), use_math = TRUE, ...)

\method{printnum}{data.frame}(x, margin = 2, ...)

\method{printnum}{matrix}(x, margin = 2, ...)

\method{printnum}{papaja_labelled}(x, ...)
}
\arguments{
\item{x}{Numeric. Can be either a single value, vector, or matrix.}

\item{...}{Arguments passed on to \code{base::formatC}
\describe{
  \item{digits}{the desired number of digits after the decimal
    point (\code{format = "f"}) or \emph{significant} digits
    (\code{format = "g"}, \code{= "e"} or \code{= "fg"}).

    Default: 2 for integer, 4 for real numbers.  If less than 0,
    the C default of 6 digits is used.  If specified as more than 50, 50
    will be used with a warning unless \code{format = "f"} where it is
    limited to typically 324. (Not more than 15--21 digits need be
    accurate, depending on the OS and compiler used.  This limit is
    just a precaution against segfaults in the underlying C runtime.)
  }
  \item{width}{the total field width; if both \code{digits} and
    \code{width} are unspecified, \code{width} defaults to 1,
    otherwise to \code{digits + 1}.  \code{width = 0} will use
    \code{width = digits}, \code{width < 0} means left
    justify the number in this field (equivalent to \code{flag = "-"}).
    If necessary, the result will have more characters than
    \code{width}.  For character data this is interpreted in characters
    (not bytes nor display width).
  }
  \item{format}{equal to \code{"d"}  (for integers), \code{"f"},
    \code{"e"}, \code{"E"}, \code{"g"}, \code{"G"}, \code{"fg"} (for
    reals), or \code{"s"} (for strings).  Default is \code{"d"} for
    integers, \code{"g"} for reals.

    \code{"f"} gives numbers in the usual
    \code{xxx.xxx} format;  \code{"e"} and \code{"E"} give \code{n.ddde+nn} or
    \code{n.dddE+nn} (scientific format); \code{"g"} and \code{"G"} put
    \code{x[i]} into scientific format only if it saves space to do so.

    \code{"fg"} uses fixed format as \code{"f"}, but \code{digits} as
    the minimum number of \emph{significant} digits.  This can lead
    to quite long result strings, see examples below.  Note that unlike
    \code{\link{signif}} this prints large numbers with
    more significant digits than \code{digits}.  Trailing zeros are
    \emph{dropped} in this format, unless \code{flag} contains
    \code{"#"}.}
  \item{flag}{for \code{formatC}, a character string giving a
    format modifier as in Kernighan and Ritchie (1988, page 243) or the
    C+99 standard.
    \code{"0"} pads leading zeros; \code{"-"} does left adjustment,
    others are \code{"+"}, \code{" "}, and \code{"#"}; on some
    platform--locale combination, \code{"'"} activates
    \dQuote{thousands' grouping} for decimal conversion, and versions of
    \file{glibc} allow \code{"I"} for integer conversion to use the locale's
    alternative output digits, if any.

    There can be more than one of these, in any order.  Other characters
    used to have no effect for \code{character} formatting, but signal
    an error since \R 3.4.0.
  }
  \item{mode}{\code{"double"} (or \code{"real"}), \code{"integer"} or
    \code{"character"}.
    Default: Determined from the storage mode of \code{x}.}
  \item{big.mark}{character; if not empty used as mark between every
    \code{big.interval} decimals \emph{before} (hence \code{big}) the
    decimal point.}
  \item{big.interval}{see \code{big.mark} above; defaults to 3.}
  \item{small.mark}{character; if not empty used as mark between every
    \code{small.interval} decimals \emph{after} (hence \code{small}) the
    decimal point.}
  \item{small.interval}{see \code{small.mark} above; defaults to 5.}
  \item{decimal.mark}{the character to be used to indicate the numeric
    decimal point.}
  \item{preserve.width}{string specifying if the string widths should
    be preserved where possible in those cases where marks
    (\code{big.mark} or \code{small.mark}) are added.  \code{"common"},
    the default, corresponds to \code{\link{format}}-like behavior
    whereas \code{"individual"} is the default in
    \code{formatC()}. Value can be abbreviated.}
  \item{zero.print}{logical, character string or \code{NULL} specifying
    if and how \emph{zeros} should be formatted specially.  Useful for
    pretty printing \sQuote{sparse} objects.}
  \item{drop0trailing}{logical, indicating if trailing zeros,
    i.e., \code{"0"} \emph{after} the decimal mark, should be removed;
    also drops \code{"e+00"} in exponential formats.}
}}

\item{na_string}{Character. String to print if element of \code{x} is \code{NA}.}

\item{numerals}{Logical. Indicates if integer should be returned as words.}

\item{capitalize}{Logical. Indicates if first letter should be capitalized. Ignored if \code{numberals = TURE}.}

\item{gt1}{Logical. Indicates if the absolute value of the statistic can, in principal, greater than 1.}

\item{zero}{Logical. Indicates if the statistic can, in principal, be 0.}

\item{margin}{Integer. If \code{x} is a matrix, the function is applied either across rows (\code{margin = 1})
or columns (\code{margin = 2}).}

\item{use_math}{Logical. Indicates whether to insert \code{$} into the output so that \code{Inf} or scientific
notation is rendered correctly.}
}
\description{
Converts numeric values to character strings for reporting.
}
\details{
If \code{x} is a vector, \code{digits}, \code{gt1}, and \code{zero} can be vectors
   according to which each element of the vector is formated. Parameters are recycled if length of \code{x}
   exceeds length of the parameter vectors. If \code{x} is a matrix, the vectors specify the formating
   of either rows or columns according to the value of \code{margin}.
}
\examples{
printnum(1/3)
printnum(1/3, gt1 = FALSE)
printnum(1/3, digits = 5)

printnum(0)
printnum(0, zero = FALSE)

printp(0.0001)
}
