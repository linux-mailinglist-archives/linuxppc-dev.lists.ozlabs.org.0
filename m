Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC01613EC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 21:13:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1PVR2L65z3dvd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 07:13:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dN+2m2qU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dN+2m2qU;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1PRV5D3Sz30NS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 07:11:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667247062; x=1698783062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/v2ZvqyUX9QuQjryssW2yaZzhbAsEUWDkNYvgzcoQls=;
  b=dN+2m2qUi/CbwKUW3aHuF+QIhRyDdq7ayinOigzuzfjNpOP+Nv47OZZ1
   M0O8DpFsLWqzKTFZaatbRNTIW1QiQ/Vm3zjm3OaZtrcyx92CM8xfUosZj
   CnhWRfpcY/tRLTlTHT8tl2Hhtmjud6pW87WSy9oW/egASV33IVPnluIn6
   unDiK6ZO5D3Ahg3tCGzJAGStoFJ7rrc4mvnfvxpZsECEVGPaDdSsr320G
   L4hHDXxJbkoBJ1dkvINIF0OPIngRzYi6uSW2wQpfzWRob9e2wgIbzzXsR
   GhTY6zQ5g7HolRY+pN06AllADyT1mHG7um/LWtWoHhuWk5EVJFaabiO6r
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="296408521"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="296408521"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 13:10:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="722931446"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; 
   d="scan'208";a="722931446"
Received: from agluck-desk3.sc.intel.com ([172.25.222.78])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 13:10:47 -0700
From: Tony Luck <tony.luck@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 2/2] mm, hwpoison: When copy-on-write hits poison, take page offline
Date: Mon, 31 Oct 2022 13:10:29 -0700
Message-Id: <20221031201029.102123-3-tony.luck@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221031201029.102123-1-tony.luck@intel.com>
References: <20221021200120.175753-1-tony.luck@intel.com>
 <20221031201029.102123-1-tony.luck@intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Tony Luck <tony.luck@intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Alexander Potapenko <glider@google.com>, Shuai Xue <xueshuai@linux.alibaba.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cannot call memory_failure() directly from the fault handler because
mmap_lock (and others) are held.

It is important, but not urgent, to mark the source page as h/w poisoned
and unmap it from other tasks.

Use memory_failure_queue() to request a call to memory_failure() for the
page with the error.

Also provide a stub version for CONFIG_MEMORY_FAILURE=n

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
Message-Id: <20221021200120.175753-3-tony.luck@intel.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/mm.h | 5 ++++-
 mm/memory.c        | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8bbcccbc5565..03ced659eb58 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3268,7 +3268,6 @@ enum mf_flags {
 int mf_dax_kill_procs(struct address_space *mapping, pgoff_t index,
 		      unsigned long count, int mf_flags);
 extern int memory_failure(unsigned long pfn, int flags);
-extern void memory_failure_queue(unsigned long pfn, int flags);
 extern void memory_failure_queue_kick(int cpu);
 extern int unpoison_memory(unsigned long pfn);
 extern int sysctl_memory_failure_early_kill;
@@ -3277,8 +3276,12 @@ extern void shake_page(struct page *p);
 extern atomic_long_t num_poisoned_pages __read_mostly;
 extern int soft_offline_page(unsigned long pfn, int flags);
 #ifdef CONFIG_MEMORY_FAILURE
+extern void memory_failure_queue(unsigned long pfn, int flags);
 extern int __get_huge_page_for_hwpoison(unsigned long pfn, int flags);
 #else
+static inline void memory_failure_queue(unsigned long pfn, int flags)
+{
+}
 static inline int __get_huge_page_for_hwpoison(unsigned long pfn, int flags)
 {
 	return 0;
diff --git a/mm/memory.c b/mm/memory.c
index b6056eef2f72..eae242351726 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2866,8 +2866,10 @@ static inline int __wp_page_copy_user(struct page *dst, struct page *src,
 	unsigned long addr = vmf->address;
 
 	if (likely(src)) {
-		if (copy_mc_user_highpage(dst, src, addr, vma))
+		if (copy_mc_user_highpage(dst, src, addr, vma)) {
+			memory_failure_queue(page_to_pfn(src), 0);
 			return -EHWPOISON;
+		}
 		return 0;
 	}
 
-- 
2.37.3

