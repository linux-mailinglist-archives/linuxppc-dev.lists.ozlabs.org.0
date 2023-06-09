Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B26C7728C81
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 02:34:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qcht63h6Tz3fH6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 10:34:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IMvII713;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IMvII713;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qchs473Yfz3dvx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 10:33:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=07+hV5uSDDJLUm8XLuemkRmQ1/NA1t2O44DKghOBv+g=; b=IMvII713AqfhBro+1bWtv24I/j
	+na2Q4M5jPhrGex1+xBgwJL0Ky/SKldSBfpsGtbFPiBBFnb9l9+AsqffLboMQR8d0K5iDdoWwDseN
	gbqCEQytGNAcbJHkCh1mxMQ1cD+5qAOTVF09eFFTAZqj2Fg1MbsYZpd2VNEo//BquYL8hnIf9/2zB
	b49wKBH8ee/SdPPRUIUSHNUJBkdqBrL7SNx78waCio4SJeHUJ+kol/yEIl8/Pa9UvjlbMmxaFU2Tx
	mcMdMjwbFnejubjsdY34HDFghHtqnVZ+bfB9ME/YuyMr+QuPwJq9J+oiBdAXcD/ASdhluTmjTHidJ
	nIgwzJ1Q==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Q4I-00B4uV-2L;
	Fri, 09 Jun 2023 00:33:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/legacy_serial: check CONFIG_SERIAL_8250_CONSOLE
Date: Thu,  8 Jun 2023 17:33:28 -0700
Message-Id: <20230609003328.15008-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When SERIAL_8250_CONSOLE is not set but PPC_UDBG_16550=y,
the legacy_serial code references fsl8250_handle_irq, which is
only built when SERIAL_8250_CONSOLE is set.

Be consistent in referencing the used CONFIG_SERIAL_8250*
symbols so that the build errors do not happen.

Prevents these build errors:

powerpc-linux-ld: arch/powerpc/kernel/legacy_serial.o: in function `serial_dev_init':
legacy_serial.c:(.init.text+0x2aa): undefined reference to `fsl8250_handle_irq'
powerpc-linux-ld: legacy_serial.c:(.init.text+0x2b2): undefined reference to `fsl8250_handle_irq'

Fixes: 66eff0ef528b ("powerpc/legacy_serial: Warn about 8250 devices operated without active FSL workarounds")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/legacy_serial.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -508,9 +508,9 @@ static void __init fixup_port_irq(int in
 
 	port->irq = virq;
 
-	if (IS_ENABLED(CONFIG_SERIAL_8250) &&
+	if (IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE) &&
 	    of_device_is_compatible(np, "fsl,ns16550")) {
-		if (IS_REACHABLE(CONFIG_SERIAL_8250)) {
+		if (IS_REACHABLE(CONFIG_SERIAL_8250_CONSOLE)) {
 			port->handle_irq = fsl8250_handle_irq;
 			port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
 		} else {
