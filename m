Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F19DD5A5E96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 10:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MH1Gx6JN6z3c87
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 18:50:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HdPne+/o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HdPne+/o;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MH1GD0BLCz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 18:49:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661849396; x=1693385396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QY5pcFaRk9Pil+zQdIFM0ph2NdnnrO8rptdre2dGddM=;
  b=HdPne+/owTbAFGdwij1KkT+DiSxKL1q+85nHGg0mcybiNzu0lxOhrYiB
   cexnu7Np3LvNmnbZH1GuHdbJwnDjYSNYC6W3WJoFMZEba7uvLGS9geSew
   N/AlvjMfZjaHIZ8VO6JEw6rfvAS2g0cGexh1hY3qS4JgE6Lw2fvD6EvEL
   eE/oXvaFEW++WFFhL4Ng14lRl5+CvrrZpNgTtDYqLxcStkmcwy65yxlzv
   ANvO4FeTZcFrZpwegD/DgNGgzmovBQx+6LspAnS2pFLZN6+vConw9UGUE
   I7oPKf5mWAmqcKOCqSDfhZo3EQcEkb2Z3iK+2zo4OA8q9XLt4TjPRokbU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="381418844"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="381418844"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 01:49:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="672761845"
Received: from arnesgom-mobl.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.252.54.235])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 01:49:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Timur Tabi <timur@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] serial: ucc_uart: Remove custom frame size calculation
Date: Tue, 30 Aug 2022 11:49:21 +0300
Message-Id: <20220830084925.5608-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220830084925.5608-1-ilpo.jarvinen@linux.intel.com>
References: <20220830084925.5608-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The number of bits can be calculated using tty_get_frame_size(), no
need for the driver to do it on its own.

Also remove a comment on number of bits that doesn't match the code nor
the comment on ucc_uart_pram's rx_length ("minus 1" part differs). That
comment seems a verbatim copy of that in cpm_uart/cpm_uart_core.c
anyway so perhaps it was just copied over w/o much thinking.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/tty/serial/ucc_uart.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 3cc9ef08455c..7331964163c5 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -853,13 +853,6 @@ static void qe_uart_set_termios(struct uart_port *port,
 	u16 upsmr = ioread16be(&uccp->upsmr);
 	struct ucc_uart_pram __iomem *uccup = qe_port->uccup;
 	u16 supsmr = ioread16be(&uccup->supsmr);
-	u8 char_length = 2; /* 1 + CL + PEN + 1 + SL */
-
-	/* Character length programmed into the mode register is the
-	 * sum of: 1 start bit, number of data bits, 0 or 1 parity bit,
-	 * 1 or 2 stop bits, minus 1.
-	 * The value 'bits' counts this for us.
-	 */
 
 	/* byte size */
 	upsmr &= UCC_UART_UPSMR_CL_MASK;
@@ -869,22 +862,18 @@ static void qe_uart_set_termios(struct uart_port *port,
 	case CS5:
 		upsmr |= UCC_UART_UPSMR_CL_5;
 		supsmr |= UCC_UART_SUPSMR_CL_5;
-		char_length += 5;
 		break;
 	case CS6:
 		upsmr |= UCC_UART_UPSMR_CL_6;
 		supsmr |= UCC_UART_SUPSMR_CL_6;
-		char_length += 6;
 		break;
 	case CS7:
 		upsmr |= UCC_UART_UPSMR_CL_7;
 		supsmr |= UCC_UART_SUPSMR_CL_7;
-		char_length += 7;
 		break;
 	default:	/* case CS8 */
 		upsmr |= UCC_UART_UPSMR_CL_8;
 		supsmr |= UCC_UART_SUPSMR_CL_8;
-		char_length += 8;
 		break;
 	}
 
@@ -892,13 +881,11 @@ static void qe_uart_set_termios(struct uart_port *port,
 	if (termios->c_cflag & CSTOPB) {
 		upsmr |= UCC_UART_UPSMR_SL;
 		supsmr |= UCC_UART_SUPSMR_SL;
-		char_length++;  /* + SL */
 	}
 
 	if (termios->c_cflag & PARENB) {
 		upsmr |= UCC_UART_UPSMR_PEN;
 		supsmr |= UCC_UART_SUPSMR_PEN;
-		char_length++;  /* + PEN */
 
 		if (!(termios->c_cflag & PARODD)) {
 			upsmr &= ~(UCC_UART_UPSMR_RPM_MASK |
@@ -953,7 +940,7 @@ static void qe_uart_set_termios(struct uart_port *port,
 	iowrite16be(upsmr, &uccp->upsmr);
 	if (soft_uart) {
 		iowrite16be(supsmr, &uccup->supsmr);
-		iowrite8(char_length, &uccup->rx_length);
+		iowrite8(tty_get_frame_size(termios->c_cflag), &uccup->rx_length);
 
 		/* Soft-UART requires a 1X multiplier for TX */
 		qe_setbrg(qe_port->us_info.rx_clock, baud, 16);
-- 
2.30.2

