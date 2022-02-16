Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DE64B89B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:21:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJX36mvMz3f0p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:21:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sjI1N/Ys;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sjI1N/Ys; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJQs1BS5z3cbG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:17:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D795961655;
 Wed, 16 Feb 2022 13:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB5FC340F1;
 Wed, 16 Feb 2022 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017443;
 bh=MxlH7OSdWg2oRBDys6vsaBDtcNFNrqae9GgCDj46MDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sjI1N/Ysf6UohThwc+VXydeUqwNugfP8doF9H67EicATD6oaAkDsrCNS3AC/ubFNd
 ziBIxKGEAeyq4Bw3XdZgjBuNcKHeB1enctrHaLGU2ykGVgZHDsnbC5Wzwde0sZPsGo
 WD7WBQJHRS/PhCcVbk/s6TQX9q0zFJnPZsK3bgY0sTLsXoxe2RYo46AhoXLG6T8vLY
 ptfvBD5j0ki8uiIVLlwxNojr8S73bqQ6CnNgAESnFCyQrATHgA3qg0Clpwhp7O6ene
 UNjiTeS5j4av8zOGlm3gJWoU7z2Cw6gaTV6tNodGA/Zj7EYErzSRxKmSguUvyWCtWL
 X2GGlpG3o7PVg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: [PATCH v2 10/18] m68k: fix access_ok for coldfire
Date: Wed, 16 Feb 2022 14:13:24 +0100
Message-Id: <20220216131332.1489939-11-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 mingo@redhat.com, geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com, shorne@gmail.com,
 monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 nickhu@andestech.com, linux-mips@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

While most m68k platforms use separate address spaces for user
and kernel space, at least coldfire does not, and the other
ones have a TASK_SIZE that is less than the entire 4GB address
range.

Using the default implementation of __access_ok() stops coldfire
user space from trivially accessing kernel memory.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/include/asm/uaccess.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 79617c0b2f91..8eb625e75452 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -12,14 +12,21 @@
 #include <asm/extable.h>
 
 /* We let the MMU do all checking */
-static inline int access_ok(const void __user *addr,
+static inline int access_ok(const void __user *ptr,
 			    unsigned long size)
 {
+	unsigned long limit = TASK_SIZE;
+	unsigned long addr = (unsigned long)ptr;
+
 	/*
 	 * XXX: for !CONFIG_CPU_HAS_ADDRESS_SPACES this really needs to check
 	 * for TASK_SIZE!
+	 * Removing this helper is probably sufficient.
 	 */
-	return 1;
+	if (IS_ENABLED(CONFIG_CPU_HAS_ADDRESS_SPACES))
+		return 1;
+
+	return (size <= limit) && (addr <= (limit - size));
 }
 
 /*
-- 
2.29.2

