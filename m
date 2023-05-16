Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB65705222
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 17:30:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLKtK3SpCz3f8y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 01:30:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DLokU4Xo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DLokU4Xo;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLKsM6jR9z3cMw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 01:29:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3qcDLPtKnom2z9UP3ge/ixu7VFSWfqsntSxlq8RNFFo=; b=DLokU4XoHJl0zbKFoPEUs22CFm
	jWN6sh0JDV+PgG9syludfl3Uu9y7W4zuYbU/C7G3qKtH4HzJAEIhgKpvzzMyB8os7Evl3UzQ8vOsj
	yJ72JFBYZ5HXcaIQz4eM18ftvkMWCzbkpnIyM/GNGk8Gha5+fPOsK1YFCjbXOrF3ETQtxtAZ0TNZx
	BsjZ5bvUkLGcCJ0+lplYs46yBbsAowEIlEWf9TFOJxrfb5C8jeJ0eAzwoWQBGVPRv/vTdt1XzdKkQ
	rF2TVnZC7AKSsK4EaHFRNU7+kSOFnVUjYW7lXZPAmDyVR56OOA85oM/sBTNsigsK3osmTYvIY3VH0
	00iwsB2g==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pywbg-006FRC-0N;
	Tue, 16 May 2023 15:28:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=y
Date: Tue, 16 May 2023 08:28:54 -0700
Message-Id: <20230516152854.22465-1-rdunlap@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, Kumar Gala <galak@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <scottwood@freescale.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In a randconfig with CONFIG_SERIAL_CPM=m and
CONFIG_PPC_EARLY_DEBUG_CPM=y, there is a build error:
ERROR: modpost: "udbg_putc" [drivers/tty/serial/cpm_uart/cpm_uart.ko] undefined!

Prevent the build error by allowing PPC_EARLY_DEBUG_CPM only when
SERIAL_CPM=y.

Fixes: c374e00e17f1 ("[POWERPC] Add early debug console for CPM serial ports.")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Scott Wood <scottwood@freescale.com>
Cc: Kumar Gala <galak@kernel.crashing.org>
Cc: "Pali Rohár" <pali@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
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
