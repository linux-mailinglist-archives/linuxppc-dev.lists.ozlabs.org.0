Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F098BB7E2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 01:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWRJZ4Ww9z3w8P
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 09:06:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW9vJ3JH1z3cNc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 23:02:36 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B60E31477;
	Fri,  3 May 2024 06:02:30 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 650863F73F;
	Fri,  3 May 2024 06:02:02 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 03/29] mm: use ARCH_PKEY_BITS to define VM_PKEY_BITN
Date: Fri,  3 May 2024 14:01:21 +0100
Message-Id: <20240503130147.1154804-4-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240503130147.1154804-1-joey.gouly@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 04 May 2024 09:04:52 +1000
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, joey.gouly@arm.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the new CONFIG_ARCH_PKEY_BITS to simplify setting these bits
for different architectures.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
---
 fs/proc/task_mmu.c |  2 ++
 include/linux/mm.h | 16 ++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 23fbab954c20..0d152f460dcc 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -692,7 +692,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 		[ilog2(VM_PKEY_BIT0)]	= "",
 		[ilog2(VM_PKEY_BIT1)]	= "",
 		[ilog2(VM_PKEY_BIT2)]	= "",
+#if VM_PKEY_BIT3
 		[ilog2(VM_PKEY_BIT3)]	= "",
+#endif
 #if VM_PKEY_BIT4
 		[ilog2(VM_PKEY_BIT4)]	= "",
 #endif
diff --git a/include/linux/mm.h b/include/linux/mm.h
index b6bdaa18b9e9..5605b938acce 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -329,12 +329,16 @@ extern unsigned int kobjsize(const void *objp);
 #endif /* CONFIG_ARCH_USES_HIGH_VMA_FLAGS */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
-# define VM_PKEY_SHIFT	VM_HIGH_ARCH_BIT_0
-# define VM_PKEY_BIT0	VM_HIGH_ARCH_0	/* A protection key is a 4-bit value */
-# define VM_PKEY_BIT1	VM_HIGH_ARCH_1	/* on x86 and 5-bit value on ppc64   */
-# define VM_PKEY_BIT2	VM_HIGH_ARCH_2
-# define VM_PKEY_BIT3	VM_HIGH_ARCH_3
-#ifdef CONFIG_PPC
+# define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0
+# define VM_PKEY_BIT0  VM_HIGH_ARCH_0
+# define VM_PKEY_BIT1  VM_HIGH_ARCH_1
+# define VM_PKEY_BIT2  VM_HIGH_ARCH_2
+#if CONFIG_ARCH_PKEY_BITS > 3
+# define VM_PKEY_BIT3  VM_HIGH_ARCH_3
+#else
+# define VM_PKEY_BIT3  0
+#endif
+#if CONFIG_ARCH_PKEY_BITS > 4
 # define VM_PKEY_BIT4  VM_HIGH_ARCH_4
 #else
 # define VM_PKEY_BIT4  0
-- 
2.25.1

