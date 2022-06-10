Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A023A54700F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 01:39:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKcqZ3LCkz3f1L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 09:39:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H3PWXX7s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H3PWXX7s;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKclk6rmgz3bsl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 09:35:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654904147; x=1686440147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MchtFdici9/LHAAi4sFR4mcD0phAyK+8tBE2Ictb0Iw=;
  b=H3PWXX7swU59nKtgN+ZEcRbD9PpABbPEgcCFAPNCPYcg+b45rL8MiMlR
   b51nPY0TrILvfYJjC59G0/asrtF8IQ92WCxk0oz+Zm8hygWE7hwpanppo
   sYsGyEXgGUUeH3v/dyGk1Lr5E1KwTtKNRQHZeVEYy304nDnU1/LxZ+isy
   kJeny6MvxIsmu1T3r18Pd0nI9B0+u08FKpwG7r7S4Xe2Xe01gIHPVdGMQ
   /cot8UPlikYgsPMwxXdjOQE9athC+sWZysqaWwH9+6m77AU4j434ICFgz
   7BPmgkm/Yl3qo7SUU8Ch7JYMte5qVI4kUREwkvXygTTqLkeiwDKxPidGv
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341834940"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="341834940"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="581302597"
Received: from pleung-mobl1.amr.corp.intel.com (HELO localhost) ([10.212.33.34])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:38 -0700
From: ira.weiny@intel.com
To: linux-api@vger.kernel.org
Subject: [RFC PATCH 4/6] pkeys: Lift pkey hardware check for pkey_alloc()
Date: Fri, 10 Jun 2022 16:35:31 -0700
Message-Id: <20220610233533.3649584-5-ira.weiny@intel.com>
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
Cc: Florian Weimer <fweimer@redhat.com>, x86@kernel.org, clemensb@chromium.org, jkummerow@chromium.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, ahaas@chromium.org, linux-kernel@vger.kernel.org, gdeepti@chromium.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, Sohil Mehta <sohil.mehta@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>, manoskouk@chromium.org, thibaudm@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

pkey_alloc() is documented to return ENOSPC when the hardware does not
support pkeys.  On x86, pkey_alloc() incorrectly returns EINVAL.

This is because mm_pkey_alloc() does not check for pkey support before
returning a key.  Therefore, if the keys are not exhausted pkey_alloc()
continues on to call arch_set_user_pkey_access().  Unfortunately, when
arch_set_user_pkey_access() detects the failed support it overwrites the
ENOSPC return value with EINVAL.

Ensure consistent behavior across architectures by lifting this check to
the core mm code.

Remove a couple of 'we' references in code comments as well.

Cc: ahaas@chromium.org
Cc: clemensb@chromium.org
Cc: gdeepti@chromium.org
Cc: jkummerow@chromium.org
Cc: manoskouk@chromium.org
Cc: thibaudm@chromium.org
Cc: Florian Weimer <fweimer@redhat.com>
Cc: Sohil Mehta <sohil.mehta@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: linux-api@vger.kernel.org
Fixes: e8c24d3a23a4 ("x86/pkeys: Allocation/free syscalls")
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Thanks to Sohil for pointing out that the commit message could be more
clear WRT how EINVAL is returned incorrectly.
---
 arch/powerpc/include/asm/pkeys.h | 8 +++-----
 mm/mprotect.c                    | 3 +++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 59a2c7dbc78f..2c8351248793 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -85,18 +85,16 @@ static inline bool mm_pkey_is_allocated(struct mm_struct *mm, int pkey)
 static inline int mm_pkey_alloc(struct mm_struct *mm)
 {
 	/*
-	 * Note: this is the one and only place we make sure that the pkey is
+	 * Note: this is the one and only place to make sure that the pkey is
 	 * valid as far as the hardware is concerned. The rest of the kernel
 	 * trusts that only good, valid pkeys come out of here.
 	 */
 	u32 all_pkeys_mask = (u32)(~(0x0));
 	int ret;
 
-	if (!mmu_has_feature(MMU_FTR_PKEY))
-		return -1;
 	/*
-	 * Are we out of pkeys? We must handle this specially because ffz()
-	 * behavior is undefined if there are no zeros.
+	 * Out of pkeys?  Handle this specially because ffz() behavior is
+	 * undefined if there are no zeros.
 	 */
 	if (mm_pkey_allocation_map(mm) == all_pkeys_mask)
 		return -1;
diff --git a/mm/mprotect.c b/mm/mprotect.c
index ba5592655ee3..56d35de33725 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -773,6 +773,9 @@ SYSCALL_DEFINE2(pkey_alloc, unsigned long, flags, unsigned long, init_val)
 	int pkey;
 	int ret;
 
+	if (!arch_pkeys_enabled())
+		return -ENOSPC;
+
 	/* No flags supported yet. */
 	if (flags)
 		return -EINVAL;
-- 
2.35.1

