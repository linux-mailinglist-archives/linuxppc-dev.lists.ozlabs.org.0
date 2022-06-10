Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D078054700B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 01:36:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKcmy3qTmz3dQL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 09:36:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Du1hwDz4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Du1hwDz4;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKclg4fkNz3brd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 09:35:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654904143; x=1686440143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E0S7lAVxIGr1gPnTIVSUeXKWXCH1YKeQN7klBTJ1vLE=;
  b=Du1hwDz4O4Pbao+KCYxLbOm02gHBA/Q0EIpiQOsPyyJeg23DqldjzMB5
   xgSOp6czBX3qu7PcRztbODCYfqPTH/IyfY9g+3Krz76TXsNqQGAC59yAR
   idxwFWVFnJ60e+Lf/U01PRBotIuCY3+wOhR8acJHkaMVwYhbQwIFmvp9l
   k1WDE82UKH3ys060e4sT6JTsGrftSb243u1zQ2eBe0IxL2EXHfknxHHFX
   UqHm5uxfvecqP7TM57dP2AyaiwIWQg6NmNuYIboLg4ROfbLUb9cXjFoDS
   1JTIYdNO3m++QSXKXfVTsMF83o+DEKLvtaxp9GCqIwkUs0CGTCBxdnCt0
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="278579385"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="278579385"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="909166943"
Received: from pleung-mobl1.amr.corp.intel.com (HELO localhost) ([10.212.33.34])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:40 -0700
From: ira.weiny@intel.com
To: linux-api@vger.kernel.org
Subject: [RFC PATCH 5/6] pkeys: Up level pkey_free() checks
Date: Fri, 10 Jun 2022 16:35:32 -0700
Message-Id: <20220610233533.3649584-6-ira.weiny@intel.com>
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

x86 is missing a hardware check for pkey support in pkey_free().  While
the net result is the same (-EINVAL returned), pkey_free() has well
defined behavior which will be easier to maintain in one place.

For powerpc the return code is -1 rather than -EINVAL.  This changes
that behavior slightly but this is very unlikely to break any user
space.

Lift the checks for pkey_free() to the core mm code and ensure
consistency with returning -EINVAL.

Cc: ahaas@chromium.org
Cc: clemensb@chromium.org
Cc: gdeepti@chromium.org
Cc: jkummerow@chromium.org
Cc: manoskouk@chromium.org
Cc: thibaudm@chromium.org
Cc: Florian Weimer <fweimer@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-api@vger.kernel.org
Cc: Sohil Mehta <sohil.mehta@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Thanks to Sohil for suggesting I mention the powerpc return value in the
commit message.

Also Sohil suggested changing mm_pkey_free() from int to void.  This is
added as a separate patch with his suggested by.
---
 arch/powerpc/include/asm/pkeys.h | 6 ------
 arch/x86/include/asm/pkeys.h     | 3 ---
 mm/mprotect.c                    | 8 ++++++--
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 2c8351248793..e96aa91f817b 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -107,12 +107,6 @@ static inline int mm_pkey_alloc(struct mm_struct *mm)
 
 static inline int mm_pkey_free(struct mm_struct *mm, int pkey)
 {
-	if (!mmu_has_feature(MMU_FTR_PKEY))
-		return -1;
-
-	if (!mm_pkey_is_allocated(mm, pkey))
-		return -EINVAL;
-
 	__mm_pkey_free(mm, pkey);
 
 	return 0;
diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
index 2e6c04d8a45b..da02737cc4d1 100644
--- a/arch/x86/include/asm/pkeys.h
+++ b/arch/x86/include/asm/pkeys.h
@@ -107,9 +107,6 @@ int mm_pkey_alloc(struct mm_struct *mm)
 static inline
 int mm_pkey_free(struct mm_struct *mm, int pkey)
 {
-	if (!mm_pkey_is_allocated(mm, pkey))
-		return -EINVAL;
-
 	mm_set_pkey_free(mm, pkey);
 
 	return 0;
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 56d35de33725..41458e729c27 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -803,10 +803,14 @@ SYSCALL_DEFINE2(pkey_alloc, unsigned long, flags, unsigned long, init_val)
 
 SYSCALL_DEFINE1(pkey_free, int, pkey)
 {
-	int ret;
+	int ret = -EINVAL;
+
+	if (!arch_pkeys_enabled())
+		return ret;
 
 	mmap_write_lock(current->mm);
-	ret = mm_pkey_free(current->mm, pkey);
+	if (mm_pkey_is_allocated(current->mm, pkey))
+		ret = mm_pkey_free(current->mm, pkey);
 	mmap_write_unlock(current->mm);
 
 	/*
-- 
2.35.1

