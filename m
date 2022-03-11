Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A524D570F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 02:00:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF7020y1Xz3bZS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 12:00:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jYaUA3A0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jYaUA3A0; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF6y61M9Sz2y6K
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 11:58:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646960334; x=1678496334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9siIY6FLOfYc5ocEKvjG/SmhAvdKrtM6lD3UINVbS4o=;
 b=jYaUA3A0rRLiYS2AG4WxwSXUyYk96WWdI3W1UqB4O+eA4fehAK9VQ7Zw
 P8q+MITQ1hMAweKubQQn681Qm6cTkt2Rzf6GC3skeyYNvRJbowoY6di7u
 HPHeGb1KqZFRtnjL27hRTiFfi7R+J7TJXGUH65eKYvqWo9Xk67c0L/oS4
 SC/8ralXTcNH/juTb21bQm2+e/Ym4O3TcRJ2kN5NpY0C9CRhpX9+yG/Uy
 fcjFH20qpTJVFf/x5Tqrvd+cE5h5BagmG8RreOQzfHzDKUoTgOJ0RLhJL
 Xb94C/75moTI3pc+jqexNaoikCuOY0lRr51b/xjwRvwfTKcOk68SIZl3v w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="341883872"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="341883872"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="554989174"
Received: from gdavids1-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.65.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 16:57:46 -0800
From: ira.weiny@intel.com
To: Dave Hansen <dave.hansen@linux.intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [PATCH 2/5] x86/pkeys: Remove __arch_set_user_pkey_access()
 declaration
Date: Thu, 10 Mar 2022 16:57:39 -0800
Message-Id: <20220311005742.1060992-3-ira.weiny@intel.com>
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

In the x86 code __arch_set_user_pkey_access() is not used and is not
defined.

Remove the dead declaration.

To: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V1:
	Make this part of a series of pkey clean ups
---
 arch/x86/include/asm/pkeys.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
index 9c530530b9a7..2e6c04d8a45b 100644
--- a/arch/x86/include/asm/pkeys.h
+++ b/arch/x86/include/asm/pkeys.h
@@ -41,9 +41,6 @@ static inline int arch_override_mprotect_pkey(struct vm_area_struct *vma,
 	return __arch_override_mprotect_pkey(vma, prot, pkey);
 }
 
-extern int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-		unsigned long init_val);
-
 #define ARCH_VM_PKEY_FLAGS (VM_PKEY_BIT0 | VM_PKEY_BIT1 | VM_PKEY_BIT2 | VM_PKEY_BIT3)
 
 #define mm_pkey_allocation_map(mm)	(mm->context.pkey_allocation_map)
@@ -118,9 +115,6 @@ int mm_pkey_free(struct mm_struct *mm, int pkey)
 	return 0;
 }
 
-extern int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-		unsigned long init_val);
-
 static inline int vma_pkey(struct vm_area_struct *vma)
 {
 	unsigned long vma_pkey_mask = VM_PKEY_BIT0 | VM_PKEY_BIT1 |
-- 
2.35.1

