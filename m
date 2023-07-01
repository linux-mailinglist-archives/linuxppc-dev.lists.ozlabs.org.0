Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD317446D0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 07:48:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B7zw9yit;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QtLnd3Mwnz3c2L
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 15:48:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B7zw9yit;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QtLmn1CMkz3c2T
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jul 2023 15:47:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=8RecPPsiSTWBxpWdpzI5Sl/AYU7LBN8bZWqUZfNxw00=; b=B7zw9yitHEQTmDn2kjTgWPrHOh
	WPMiXKAvJiw89W5PVFiIWljU0g7oQmHwQ/1zQOQbFc2feJyCz9x3egbwTkathgRDkXfEJfLwZp8xz
	sV35J02ktnzA0LjbkTmLeZFhhUWWFZ25f+cKB2mmqnfc1tbuhEn0ZHHbcf77wupPqH6B9hVpCvcJ0
	2PVs7pDJR5yKjw/Or8Hmz5YGk1TyNYyRxan6vJpx8QcVMudlOfaF+4Gvva1wFZdAHoJjN1pys7PQx
	VaSyTwf3Xkmi7FnI1G7miGTzb4a0Juf5DhX6/x9JUfWBfA5C3CmFeFbvKFrHuOPyvDEx/fr/PUgPl
	xZba4xhg==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qFTRz-005E95-1c;
	Sat, 01 Jul 2023 05:47:15 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=y
Date: Fri, 30 Jun 2023 22:47:12 -0700
Message-ID: <20230701054714.30512-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, Kumar Gala <galak@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In a randconfig with CONFIG_SERIAL_CPM=m and
CONFIG_PPC_EARLY_DEBUG_CPM=y, there is a build error:
ERROR: modpost: "udbg_putc" [drivers/tty/serial/cpm_uart/cpm_uart.ko] undefined!

Prevent the build error by allowing PPC_EARLY_DEBUG_CPM only when
SERIAL_CPM=y.

Fixes: c374e00e17f1 ("[POWERPC] Add early debug console for CPM serial ports.")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Kumar Gala <galak@kernel.crashing.org>
Cc: "Pali Rohár" <pali@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Pali Rohár <pali@kernel.org>
---
v2: add Pali's R-b;
    drop Scott Wood from Cc: list

 arch/powerpc/Kconfig.debug |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -240,7 +240,7 @@ config PPC_EARLY_DEBUG_40x
 
 config PPC_EARLY_DEBUG_CPM
 	bool "Early serial debugging for Freescale CPM-based serial ports"
-	depends on SERIAL_CPM
+	depends on SERIAL_CPM=y
 	help
 	  Select this to enable early debugging for Freescale chips
 	  using a CPM-based serial port.  This assumes that the bootwrapper
