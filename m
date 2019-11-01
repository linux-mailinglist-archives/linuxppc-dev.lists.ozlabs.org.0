Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83770EC4E9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 15:44:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474Q1c0hz5zF6mM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 01:44:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="f/fMT4qn"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474MKz3HdDzF58H
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 23:43:03 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id g3so4005707ljl.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 05:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rl5uwkPm7ODgb0mKXC73DMWhjRD0JTB3vFmrVrN5ZB0=;
 b=f/fMT4qnGn36cfXIZU+9WqU7PKzlWuxSvy4OA9GfJ3DZQNR+X8lpgyBQpBtHZWrDet
 MFY1GEto+tIwTd5AX3zlfaDcUnphDQQLWWrldQasSQxYPGiUvZHz4B4wbzR8n8Thxbg8
 kRKqubck2mt87Sb8mjWd21kRiGkeHA8bc+egg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rl5uwkPm7ODgb0mKXC73DMWhjRD0JTB3vFmrVrN5ZB0=;
 b=tEftb36+sRxk1jtC0cgtu7hHU7FEk0ao6LBB8jLbmj8KDef0oYBN8IXrD2+3NSTyU7
 coit7ta8XfGaFJeGe2wARVlwM0qONTa0x0aVnXhA18yUtzF54A9S2wARPsf1CVj7c4sr
 djeAT3+ZKBtKGAXew3nahRSvJrjkfSfZAWHPBoTIVwcOqZk/4JtCqKs8INflK+FLj9HC
 foh4HUnCA9VVmSU+k+WaWsvSGjJNvPhpNp/aBqZ3//IaQbdErh/HC2T5iW2bYhYpAc80
 AfJ4xSUtV+TsC5QqEpzr7FBeVvNi/HGu7gQ5W0SBLI2gvHG3ewBJUM7prkhKeiku0+KE
 tIWA==
X-Gm-Message-State: APjAAAWwQdmKynZeHjLDhhfqAQ5Ys7zmVGrjbHOR9GakMg/iDmkoloUT
 J7RLcmXqGbvIetUPcAYyU1t9Og==
X-Google-Smtp-Source: APXvYqwmyi32FUjiCLfaeVSLCItzNSl5u5Xct5wycLzlAxgtX29tMH2hvUooRJdJTIIrmknHbE9nxg==
X-Received: by 2002:a2e:b604:: with SMTP id r4mr1067016ljn.134.1572612175328; 
 Fri, 01 Nov 2019 05:42:55 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o26sm2458540lfi.57.2019.11.01.05.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 05:42:54 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 33/36] serial: ucc_uart: access __be32 field using
 be32_to_cpu
Date: Fri,  1 Nov 2019 13:42:07 +0100
Message-Id: <20191101124210.14510-34-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101124210.14510-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
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
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The buf member of struct qe_bd is a __be32, so to make this work on
little-endian hosts, use be32_to_cpu when reading it.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/tty/serial/ucc_uart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index f5ea84928a3b..a5330582b610 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -343,7 +343,7 @@ static int qe_uart_tx_pump(struct uart_qe_port *qe_port)
 		/* Pick next descriptor and fill from buffer */
 		bdp = qe_port->tx_cur;
 
-		p = qe2cpu_addr(bdp->buf, qe_port);
+		p = qe2cpu_addr(be32_to_cpu(bdp->buf), qe_port);
 
 		*p++ = port->x_char;
 		qe_iowrite16be(1, &bdp->length);
@@ -371,7 +371,7 @@ static int qe_uart_tx_pump(struct uart_qe_port *qe_port)
 	while (!(qe_ioread16be(&bdp->status) & BD_SC_READY) &&
 	       (xmit->tail != xmit->head)) {
 		count = 0;
-		p = qe2cpu_addr(bdp->buf, qe_port);
+		p = qe2cpu_addr(be32_to_cpu(bdp->buf), qe_port);
 		while (count < qe_port->tx_fifosize) {
 			*p++ = xmit->buf[xmit->tail];
 			xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
@@ -491,7 +491,7 @@ static void qe_uart_int_rx(struct uart_qe_port *qe_port)
 		}
 
 		/* get pointer */
-		cp = qe2cpu_addr(bdp->buf, qe_port);
+		cp = qe2cpu_addr(be32_to_cpu(bdp->buf), qe_port);
 
 		/* loop through the buffer */
 		while (i-- > 0) {
-- 
2.23.0

