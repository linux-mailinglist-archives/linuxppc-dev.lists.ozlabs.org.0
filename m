Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CD7606953
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 22:06:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mtdsr2fN0z3dv4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 07:06:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HoP+2256;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HoP+2256;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mtdrs21RJz3c5v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 07:05:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666296365; x=1697832365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Df31rUtnrw/F7hIheI4Cx6bl73pYnzh4BvNXaOx9ZRU=;
  b=HoP+2256JznQBKZuVzj+ZmLwLvUvEnvrutucaVuKba0gy+NQWcOHDTRc
   ZgzcbCYwfMsGrwDHEqliqRSIq345PvT1t5HcsF0eFubEbdyWbm7dIU0y8
   +ztWjTHGYQw7xhQCRCVP/uS5i3PfPzDlK14uPhDEQ0r6CuTTU855AQeUi
   eTGH1tsEpIQWxUh6/JVfRcq/M6Oi9LRdwAOVEODlSmZN6c7QxatgH/4Tl
   2gRZTh/PQC636B7pfhKBfUoO8WT+ePllPUCDvwwWOZaQijsepxkvueg3m
   qC9QnzxpzBqQx1uRsYDjFMQXRKFDqnGw8bsQvsBIJwtKBCuUATD8Dm2w4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="307922666"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="307922666"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 13:05:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="632471154"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="632471154"
Received: from agluck-desk3.sc.intel.com ([172.25.222.78])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 13:05:46 -0700
Date: Thu, 20 Oct 2022 13:05:45 -0700
From: Tony Luck <tony.luck@intel.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v2] mm, hwpoison: Try to recover from copy-on write faults
Message-ID: <Y1GqGbBNk6fX/OnD@agluck-desk3.sc.intel.com>
References: <SJ1PR11MB60838C1F65CA293188BB442DFC289@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20221019170835.155381-1-tony.luck@intel.com>
 <893b681b-726e-94e3-441e-4d68c767778a@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <893b681b-726e-94e3-441e-4d68c767778a@linux.alibaba.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 20, 2022 at 09:57:04AM +0800, Shuai Xue wrote:
> 
> 
> 在 2022/10/20 AM1:08, Tony Luck 写道:
> > If the kernel is copying a page as the result of a copy-on-write
> > fault and runs into an uncorrectable error, Linux will crash because
> > it does not have recovery code for this case where poison is consumed
> > by the kernel.
> > 
> > It is easy to set up a test case. Just inject an error into a private
> > page, fork(2), and have the child process write to the page.
> > 
> > I wrapped that neatly into a test at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/aegl/ras-tools.git
> > 
> > just enable ACPI error injection and run:
> > 
> >   # ./einj_mem-uc -f copy-on-write
> > 
> > Add a new copy_user_highpage_mc() function that uses copy_mc_to_kernel()
> > on architectures where that is available (currently x86 and powerpc).
> > When an error is detected during the page copy, return VM_FAULT_HWPOISON
> > to caller of wp_page_copy(). This propagates up the call stack. Both x86
> > and powerpc have code in their fault handler to deal with this code by
> > sending a SIGBUS to the application.
> 
> Does it send SIGBUS to only child process or both parent and child process?

This only sends a SIGBUS to the process that wrote the page (typically
the child, but also possible that the parent is the one that does the
write that causes the COW).

> > 
> > Note that this patch avoids a system crash and signals the process that
> > triggered the copy-on-write action. It does not take any action for the
> > memory error that is still in the shared page. To handle that a call to
> > memory_failure() is needed. 
> 
> If the error page is not poisoned, should the return value of wp_page_copy
> be VM_FAULT_HWPOISON or VM_FAULT_SIGBUS? When is_hwpoison_entry(entry) or
> PageHWPoison(page) is true, do_swap_page return VM_FAULT_HWPOISON to caller.
> And when is_swapin_error_entry is true, do_swap_page return VM_FAULT_SIGBUS.

The page has uncorrected data in it, but this patch doesn't mark it
as poisoned.  Returning VM_FAULT_SIGBUS would send an "ordinary" SIGBUS
that doesn't include the BUS_MCEERR_AR and "lsb" information. It would
also skip the:

	"MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n"

console message. So might result in confusion and attepmts to debug a
s/w problem with the application instead of blaming the death on a bad
DIMM.

> > But this cannot be done from wp_page_copy()
> > because it holds mmap_lock(). Perhaps the architecture fault handlers
> > can deal with this loose end in a subsequent patch?

I started looking at this for x86 ... but I have changed my mind
about this being a good place for a fix. When control returns back
to the architecture fault handler it no longer has easy access to
the physical page frame number. It has the virtual address, so it
could descend back into somee new mm/memory.c function to get the
physical address ... but that seems silly.

I'm experimenting with using sched_work() to handle the call to
memory_failure() (echoing what the machine check handler does using
task_work)_add() to avoid the same problem of not being able to directly
call memory_failure()).

So far it seems to be working. Patch below (goes on top of original
patch ... well on top of the internal version with mods based on
feedback from Dan Williams ... but should show the general idea)

With this patch applied the page does get unmapped from all users.
Other tasks that shared the page will get a SIGBUS if they attempt
to access it later (from the page fault handler because of
is_hwpoison_entry() as you mention above.

-Tony

From d3879e83bf91cd6c61e12d32d3e15eb6ef069204 Mon Sep 17 00:00:00 2001
From: Tony Luck <tony.luck@intel.com>
Date: Thu, 20 Oct 2022 09:57:28 -0700
Subject: [PATCH] mm, hwpoison: Call memory_failure() for source page of COW
 failure

Cannot call memory_failure() directly from the fault handler because
mmap_lock (and others) are held.

It is important, but not urgent, to mark the source page as h/w poisoned
and unmap it from other tasks.

Use schedule_work() to queue a request to call memory_failure() for the
page with the error.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 mm/memory.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index b6056eef2f72..4a1304cf1f4e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2848,6 +2848,37 @@ static inline int pte_unmap_same(struct vm_fault *vmf)
 	return same;
 }
 
+#ifdef CONFIG_MEMORY_FAILURE
+struct pfn_work {
+	struct work_struct work;
+	unsigned long pfn;
+};
+
+static void do_sched_memory_failure(struct work_struct *w)
+{
+	struct pfn_work *p = container_of(w, struct pfn_work, work);
+
+	memory_failure(p->pfn, 0);
+	kfree(p);
+}
+
+static void sched_memory_failure(unsigned long pfn)
+{
+	struct pfn_work *p;
+
+	p = kmalloc(sizeof *p, GFP_KERNEL);
+	if (!p)
+		return;
+	INIT_WORK(&p->work, do_sched_memory_failure);
+	p->pfn = pfn;
+	schedule_work(&p->work);
+}
+#else
+static void sched_memory_failure(unsigned long pfn)
+{
+}
+#endif
+
 /*
  * Return:
  *	0:		copied succeeded
@@ -2866,8 +2897,10 @@ static inline int __wp_page_copy_user(struct page *dst, struct page *src,
 	unsigned long addr = vmf->address;
 
 	if (likely(src)) {
-		if (copy_mc_user_highpage(dst, src, addr, vma))
+		if (copy_mc_user_highpage(dst, src, addr, vma)) {
+			sched_memory_failure(page_to_pfn(src));
 			return -EHWPOISON;
+		}
 		return 0;
 	}
 
-- 
2.37.3

