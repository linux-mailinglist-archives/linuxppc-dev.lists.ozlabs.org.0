Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 138244CDF82
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 22:07:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9L5s6vxBz3bY6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 08:07:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bWrhhxDk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bWrhhxDk; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9L5970ygz2xKJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 08:06:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646428015; x=1677964015;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y39UWfeG5t/f8koENMZSdik7oyaXSsbs1Bgp7FvTwlY=;
 b=bWrhhxDk1/xmsZbWhhxPRC/pCe8NOR3Upb/HYi3nHGd/mb1Dp8gw51Nq
 UBgOGAbg+KP33u3D/xdNRlvcWWIN7631uIS5InQYN3CrcmJwgMcSqbeFL
 PWycV0tUBgKMngWfHstA4Hvu/u9NpnSRCp3BPtYtSGsaXkdLqyd2YZXgy
 5s1EToIDcJEh/e4sefNz3+axCgL/dgqbqw/2pt9O/b1oeTdmcGmDg9vj0
 Kjb9E1Jr+Ua4cjSzTddCUbiUJiid+Zemo2bOAUrb7Obl6usjht/a69EHD
 1Sceh85D3/2Dn5vz8N5mSaDvbOlTIEdcG2/e9vbqmAzNfuPgjereLhgZu A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="253997857"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="253997857"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 13:05:49 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="810884761"
Received: from fushengl-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.212.64.239])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 13:05:48 -0800
From: ira.weiny@intel.com
To: Michael Ellerman <mpe@ellerman.id.au>,
 Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH] pkeys: Make pkey unsigned in arch_set_user_pkey_access()
Date: Fri,  4 Mar 2022 13:05:43 -0800
Message-Id: <20220304210543.3490880-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linuxppc-dev@lists.ozlabs.org, Ira Weiny <ira.weiny@intel.com>,
 linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

The WARN_ON check in arch_set_user_pkey_access() in the x86 architecture
fails to check for an invalid negative value.

A simple check for less than 0 would fix this issue however, in the call
stack below arch_set_user_pkey_access() the pkey should never be
negative on any architecture.  It is always best to use correct types
when possible.  x86 only supports 16 keys while ppc supports 32, u8 is
therefore large enough for all current architectures and likely those in
the future.

Change the type of the pkey passed to arch_set_user_pkey_access() to u8.

To: Dave Hansen <dave.hansen@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/powerpc/include/asm/pkeys.h | 4 ++--
 arch/powerpc/mm/book3s64/pkeys.c | 2 +-
 arch/x86/include/asm/pkeys.h     | 4 ++--
 arch/x86/kernel/fpu/xstate.c     | 2 +-
 include/linux/pkeys.h            | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 59a2c7dbc78f..e70615a1da9b 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -143,9 +143,9 @@ static inline int arch_override_mprotect_pkey(struct vm_area_struct *vma,
 	return __arch_override_mprotect_pkey(vma, prot, pkey);
 }
 
-extern int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
+extern int __arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
 				       unsigned long init_val);
-static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
+static inline int arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
 					    unsigned long init_val)
 {
 	if (!mmu_has_feature(MMU_FTR_PKEY))
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 753e62ba67af..c048467669df 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -333,7 +333,7 @@ static inline void init_iamr(int pkey, u8 init_bits)
  * Set the access rights in AMR IAMR and UAMOR registers for @pkey to that
  * specified in @init_val.
  */
-int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
+int __arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
 				unsigned long init_val)
 {
 	u64 new_amr_bits = 0x0ul;
diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
index 5292e6dfe2a7..48efb81f6cc6 100644
--- a/arch/x86/include/asm/pkeys.h
+++ b/arch/x86/include/asm/pkeys.h
@@ -9,7 +9,7 @@
  */
 #define arch_max_pkey() (cpu_feature_enabled(X86_FEATURE_OSPKE) ? 16 : 1)
 
-extern int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
+extern int arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
 		unsigned long init_val);
 
 static inline bool arch_pkeys_enabled(void)
@@ -115,7 +115,7 @@ int mm_pkey_free(struct mm_struct *mm, int pkey)
 	return 0;
 }
 
-extern int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
+extern int arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
 		unsigned long init_val);
 
 static inline int vma_pkey(struct vm_area_struct *vma)
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 7c7824ae7862..db511bec57e5 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -1068,7 +1068,7 @@ void *get_xsave_addr(struct xregs_state *xsave, int xfeature_nr)
  * This will go out and modify PKRU register to set the access
  * rights for @pkey to @init_val.
  */
-int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
+int arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
 			      unsigned long init_val)
 {
 	u32 old_pkru, new_pkru_bits = 0;
diff --git a/include/linux/pkeys.h b/include/linux/pkeys.h
index 86be8bf27b41..aa40ed2fb0fc 100644
--- a/include/linux/pkeys.h
+++ b/include/linux/pkeys.h
@@ -35,7 +35,7 @@ static inline int mm_pkey_free(struct mm_struct *mm, int pkey)
 	return -EINVAL;
 }
 
-static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
+static inline int arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
 			unsigned long init_val)
 {
 	return 0;
-- 
2.35.1

