Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B764B4D5715
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 02:02:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF728499yz3c8g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 12:02:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gl8XLlPK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gl8XLlPK; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF6yz6qpCz3bNr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 11:59:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646960380; x=1678496380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vM08ag580GDO+fflJK8POCmsH9pEVzp+hsefHBAzboI=;
 b=gl8XLlPK+db7m59pytVITC0y17jWCBbhe97D1rabElQVO4dv7QqLw8qc
 MNk4S3U+c/IjlY6lcn8pGdlFO3+OgoI8rLyJUVXqAGFQ8ZLsDs6/R2e3u
 /d3kuytqg0152MhcFP1mWncLW+dfKOkyW+8mk4TLkkB80A8co5Sr1fFtW
 q5RVP9K5koUKxFo6geDVIE4ekh9LqTCpbW692CVgPMsuo8dJ0j32pLyqX
 bi0aF13h2VBeS75qg6d2umnsdZ9MiNB1KgKdFeyL8LYg3kKeDMdoaB3N8
 ebhCL+7A4+zYg3X+KuWd0Zwl/GpbyVMdWInkbVoJ608Bjd4rb36DCyjAj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="242904720"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="242904720"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:49 -0800
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="511163178"
Received: from gdavids1-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.65.108])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:48 -0800
From: ira.weiny@intel.com
To: Dave Hansen <dave.hansen@linux.intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [PATCH 4/5] mm/pkeys: Make pkey unsigned in
 arch_set_user_pkey_access()
Date: Thu, 10 Mar 2022 16:57:41 -0800
Message-Id: <20220311005742.1060992-5-ira.weiny@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311005742.1060992-1-ira.weiny@intel.com>
References: <20220311005742.1060992-1-ira.weiny@intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

The WARN_ON check in arch_set_user_pkey_access() in the x86 architecture
fails to check for an invalid negative value.

A simple check for less than 0 would fix this issue however, in the call
stack below arch_set_user_pkey_access() the pkey should never be
negative on any architecture.  x86 only supports 16 keys while ppc
supports 32, u8 is therefore large enough for all current architectures
and likely those in the future.

Change the type of the pkey passed to arch_set_user_pkey_access() to u8.

To: Dave Hansen <dave.hansen@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V1:
	Make this part of a generic pkey clean up series.
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
index d6456f8846de..310feb9efd57 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -333,7 +333,7 @@ static inline void init_iamr(u8 pkey, u8 init_bits)
  * Set the access rights in AMR IAMR and UAMOR registers for @pkey to that
  * specified in @init_val.
  */
-int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
+int __arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
 				unsigned long init_val)
 {
 	u64 new_amr_bits = 0x0ul;
diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
index 2e6c04d8a45b..3f5c236e34cd 100644
--- a/arch/x86/include/asm/pkeys.h
+++ b/arch/x86/include/asm/pkeys.h
@@ -9,8 +9,8 @@
  */
 #define arch_max_pkey() (cpu_feature_enabled(X86_FEATURE_OSPKE) ? 16 : 1)
 
-extern int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-		unsigned long init_val);
+extern int arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
+				     unsigned long init_val);
 
 static inline bool arch_pkeys_enabled(void)
 {
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

