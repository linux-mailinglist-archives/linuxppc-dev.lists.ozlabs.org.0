Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1875A0C10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 10:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCxjG5VYxz3c6P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 18:59:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xd48x7em;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xd48x7em;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCxhb29mHz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 18:58:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661417919; x=1692953919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/0WWmiRPF3uFY9MzfKxoOf7bMrDf+HChU7RPdgkXq9c=;
  b=Xd48x7emxDSqqcomFFG3tZHAYsDateViz1qH5+9wVqB8i0emQcUDBRhu
   SKY79yRr/Gl7B1FBynfjq+amGyHsK0APl2FOxrmn/SqV1uieUpT2RRseb
   7i4Wvyu44CoV0g5IarCkwViQAHvRr8izluwTTg3VBKwUum/wqbonueN9E
   lWUA1Nx4SiWfRTfiKt6hm7kyteRcBHTwvZ6B9AHX9eCVlbeGDHwcfCm1A
   M+Glw2RUVLc6/+V7Di7lEqbhdaf0Iwm31PLEspx4PddjO5XsFLZZnNlEU
   XWOOLTS0vo2dGZ4q+nsgszPUDzIW1KN6IgCImn7XYto/7lOYbh1wBkyNx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="294190284"
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; 
   d="scan'208";a="294190284"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 01:58:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; 
   d="scan'208";a="670893909"
Received: from mblazque-mobl1.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.249.44.101])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 01:58:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	Timur Tabi <timur@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] serial: ucc_uart: Remove custom frame size calculation
Date: Thu, 25 Aug 2022 11:58:06 +0300
Message-Id: <20220825085810.7290-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825085810.7290-1-ilpo.jarvinen@linux.intel.com>
References: <20220825085810.7290-1-ilpo.jarvinen@linux.intel.com>
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The number of bits can be calculated using tty_get_frame_size(), no
need for the driver to do it on its own.

Also remove a comment on number of bits that doesn't match the code nor
the comment on ucc_uart_pram's rx_length ("minus 1" part differs). That
comment seems a verbatim copy of that in cpm_uart/cpm_uart_core.c
anyway so perhaps it was just copied over w/o much thinking.

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

