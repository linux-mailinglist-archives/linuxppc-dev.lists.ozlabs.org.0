Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F094A70148C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 07:59:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QJFLz6J6wz3fXv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 15:59:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+iRnGYI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+iRnGYI;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QJFL504lqz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 15:58:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=JwvBlXffIR0HVqcitR36C1vwkyoUehqX0Gm5NBSTvZk=; b=I+iRnGYIbH0GzESG0nV955gJUa
	0UPKyS/3Qb6BMiTbeTDcCOdZb6t8rJdRYDvFibJjoDDonE/XO1JsdC8BigzdBGV+1XQMUYDN1ilsi
	2qw908Jr765lQtgmh5i9NvGx2y5UGEEwdrKcPepoeExmP11o8zlVXSnrdSKTayT6U0WY1jh2L3C84
	iq+q935gdVdCRN32X0qWWlqn7dccEOqU7m5spB1uEBTo/W5Ex55QgNHeczWkLIWDJ/dzesIGwJC+e
	MXjwSqBFH7N3PX1PvB7OfzjFl6o0hdZ5MHH8iQ1uwmBd+xoc3IVTY3k3bmtWWX+ipK5kjLC1CrsKl
	tUnFsPRQ==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pxiGc-00DlRD-1n;
	Sat, 13 May 2023 05:58:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH] powerpc: udbg: export udbg_putc
Date: Fri, 12 May 2023 22:58:04 -0700
Message-Id: <20230513055804.23775-1-rdunlap@infradead.org>
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
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In a randconfig with CONFIG_SERIAL_CPM=m and
CONFIG_PPC_EARLY_DEBUG_CPM=y, there is a build error:
ERROR: modpost: "udbg_putc" [drivers/tty/serial/cpm_uart/cpm_uart.ko] undefined!

The build can be fixed by exporting "udbg_putc" in udbg.c.

OTOH, maybe something like this is more appropriate in
arch/powerpc/Kconfig.debug?

config PPC_EARLY_DEBUG_CPM
	bool "Early serial debugging for Freescale CPM-based serial ports"
-	depends on SERIAL_CPM
+	depends on SERIAL_CPM=y

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "Pali Rohár" <pali@kernel.org>
---
 arch/powerpc/kernel/udbg.c |    1 +
 1 file changed, 1 insertion(+)

diff -- a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
--- a/arch/powerpc/kernel/udbg.c
+++ b/arch/powerpc/kernel/udbg.c
@@ -14,6 +14,7 @@
 #include <asm/udbg.h>
 
 void (*udbg_putc)(char c);
+EXPORT_SYMBOL(udbg_putc);
 void (*udbg_flush)(void);
 int (*udbg_getc)(void);
 int (*udbg_getc_poll)(void);
