Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE30547010
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 01:39:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKcrD2Vn3z3f4H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 09:39:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mTC8DNzY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mTC8DNzY;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKcll27LMz3brd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 09:35:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654904147; x=1686440147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XfSsZjEZ1l0M6Je8ux0RlvZeHHKfZHKU8L8K8HX1yVc=;
  b=mTC8DNzY5u1c32ZR0NABeObfCmwIWV0+xodT3khVF5mVCmEQPn5heW00
   bgSV1ltcfQUZbm8/+4iC9vYHv6lTiDaprt8YEv1sM7JSR0Dq5pj8ke7hJ
   9v425XQoGPLX9dlNW6nxHJQ+wJ4aC6Vc9qc0oubnlW7ZsKXjon38b7n/B
   OcQSnCFkZc1l+bPfRd6EaF6GgVMMpLqKe57x3acQKPfVV9HrFZ2jxuo5b
   grHSfvi5xjQnwUkCfXFQ31E041NyZ6WNXvS0MPFp0P292lVE/ipv85NVF
   jM+NB7OxI9U72apCUPZXvB76XbOhJBiXjg3OkrcN6R5T0D+bUqFzPv9WV
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="278909259"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="278909259"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="760716868"
Received: from pleung-mobl1.amr.corp.intel.com (HELO localhost) ([10.212.33.34])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:41 -0700
From: ira.weiny@intel.com
To: linux-api@vger.kernel.org
Subject: [RFC PATCH 6/6] pkeys: Change mm_pkey_free() to void
Date: Fri, 10 Jun 2022 16:35:33 -0700
Message-Id: <20220610233533.3649584-7-ira.weiny@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610233533.3649584-1-ira.weiny@intel.com>
References: <20220610233533.3649584-1-ira.weiny@intel.com>
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
Cc: x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, Sohil Mehta <sohil.mehta@intel.com>, Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

Now that the pkey arch support is no longer checked in mm_pkey_free()
there is no reason to have it return int.

Change the return value to void.

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Suggested-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/powerpc/include/asm/pkeys.h | 4 +---
 arch/x86/include/asm/pkeys.h     | 4 +---
 include/linux/pkeys.h            | 5 +----
 mm/mprotect.c                    | 6 ++++--
 4 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index e96aa91f817b..4d01a48ab941 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -105,11 +105,9 @@ static inline int mm_pkey_alloc(struct mm_struct *mm)
 	return ret;
 }
 
-static inline int mm_pkey_free(struct mm_struct *mm, int pkey)
+static inline void mm_pkey_free(struct mm_struct *mm, int pkey)
 {
 	__mm_pkey_free(mm, pkey);
-
-	return 0;
 }
 
 /*
diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
index da02737cc4d1..1f408f46fa9a 100644
--- a/arch/x86/include/asm/pkeys.h
+++ b/arch/x86/include/asm/pkeys.h
@@ -105,11 +105,9 @@ int mm_pkey_alloc(struct mm_struct *mm)
 }
 
 static inline
-int mm_pkey_free(struct mm_struct *mm, int pkey)
+void mm_pkey_free(struct mm_struct *mm, int pkey)
 {
 	mm_set_pkey_free(mm, pkey);
-
-	return 0;
 }
 
 static inline int vma_pkey(struct vm_area_struct *vma)
diff --git a/include/linux/pkeys.h b/include/linux/pkeys.h
index 86be8bf27b41..bf98c50a3437 100644
--- a/include/linux/pkeys.h
+++ b/include/linux/pkeys.h
@@ -30,10 +30,7 @@ static inline int mm_pkey_alloc(struct mm_struct *mm)
 	return -1;
 }
 
-static inline int mm_pkey_free(struct mm_struct *mm, int pkey)
-{
-	return -EINVAL;
-}
+static inline void mm_pkey_free(struct mm_struct *mm, int pkey) { }
 
 static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 			unsigned long init_val)
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 41458e729c27..e872bdd2e228 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -809,8 +809,10 @@ SYSCALL_DEFINE1(pkey_free, int, pkey)
 		return ret;
 
 	mmap_write_lock(current->mm);
-	if (mm_pkey_is_allocated(current->mm, pkey))
-		ret = mm_pkey_free(current->mm, pkey);
+	if (mm_pkey_is_allocated(current->mm, pkey)) {
+		mm_pkey_free(current->mm, pkey);
+		ret = 0;
+	}
 	mmap_write_unlock(current->mm);
 
 	/*
-- 
2.35.1

