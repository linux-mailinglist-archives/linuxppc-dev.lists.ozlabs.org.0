Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 420CD72E7C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 18:03:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgYJS1Pgjz3cM3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 02:03:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgYGN4LSCz30M1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 02:02:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 60FCA637EB;
	Tue, 13 Jun 2023 15:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C635C433D9;
	Tue, 13 Jun 2023 15:52:53 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/3] microblaze: Move the ARCH_{DMA,SLAB}_MINALIGN definitions to asm/cache.h
Date: Tue, 13 Jun 2023 16:52:44 +0100
Message-Id: <20230613155245.1228274-3-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613155245.1228274-1-catalin.marinas@arm.com>
References: <20230613155245.1228274-1-catalin.marinas@arm.com>
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
Cc: Michal Simek <monstr@monstr.eu>, Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The microblaze architecture defines ARCH_DMA_MINALIGN in asm/page.h.
Move it to asm/cache.h to allow a generic ARCH_DMA_MINALIGN definition
in linux/cache.h without redefine errors/warnings.

While at it, also move ARCH_SLAB_MINALIGN to asm/cache.h for
consistency.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Michal Simek <monstr@monstr.eu>
---
 arch/microblaze/include/asm/cache.h | 5 +++++
 arch/microblaze/include/asm/page.h  | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/microblaze/include/asm/cache.h b/arch/microblaze/include/asm/cache.h
index a149b3e711ec..1903988b9e23 100644
--- a/arch/microblaze/include/asm/cache.h
+++ b/arch/microblaze/include/asm/cache.h
@@ -18,4 +18,9 @@
 
 #define SMP_CACHE_BYTES	L1_CACHE_BYTES
 
+/* MS be sure that SLAB allocates aligned objects */
+#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
+
+#define ARCH_SLAB_MINALIGN	L1_CACHE_BYTES
+
 #endif /* _ASM_MICROBLAZE_CACHE_H */
diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
index 7b9861bcd458..337f23eabc71 100644
--- a/arch/microblaze/include/asm/page.h
+++ b/arch/microblaze/include/asm/page.h
@@ -30,11 +30,6 @@
 
 #ifndef __ASSEMBLY__
 
-/* MS be sure that SLAB allocates aligned objects */
-#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
-
-#define ARCH_SLAB_MINALIGN	L1_CACHE_BYTES
-
 /*
  * PAGE_OFFSET -- the first address of the first page of memory. With MMU
  * it is set to the kernel start address (aligned on a page boundary).
