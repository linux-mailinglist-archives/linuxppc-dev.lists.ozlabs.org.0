Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7920606EA7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 06:09:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtrZM4dMvz3dsW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 15:09:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Eg81x3J7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Eg81x3J7;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtrYS0Pw1z2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 15:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666325308; x=1697861308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bf5sIebrRjerkXBiHhejNDTo9YDTgaUUT5P8ABmQ1vI=;
  b=Eg81x3J76Mf7d3uluRNPcSmBM2ROPoaGoPZgx9+txOWqOw4CFI9dNKXe
   yZpIXEXxsm+/xxjfBaXX3hWYW+EmZEp/1GFBfjp0jujxIGVmhk69hoK9V
   z0O+oNQnSjBXRvjYb0G/l6RzP5meBj1qnL6ZSf2fiP6Pb9oT7EFcXXRye
   QDAYC3lluDWr1qtt2Sygax2N+2QaEHvJQxqJwWEkpaNIeQUo6ajfebXff
   Uq+VEa9ewKWgUgjKxffpwGvFeUPYsbp3ZKHlkPRhmiKjFK4/peeBPgVGA
   lQNusfAo6xg7qcKRb+8Xo55fdMpT9IwMlvv5xpwk0bpn6aEUkXNfIBO9K
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="368952651"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="368952651"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 21:08:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="735297385"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="735297385"
Received: from agluck-desk3.sc.intel.com ([172.25.222.78])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 21:08:25 -0700
Date: Thu, 20 Oct 2022 21:08:24 -0700
From: Tony Luck <tony.luck@intel.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v2] mm, hwpoison: Try to recover from copy-on write faults
Message-ID: <Y1IbOAvpGzA8bst1@agluck-desk3.sc.intel.com>
References: <SJ1PR11MB60838C1F65CA293188BB442DFC289@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20221019170835.155381-1-tony.luck@intel.com>
 <893b681b-726e-94e3-441e-4d68c767778a@linux.alibaba.com>
 <Y1GqGbBNk6fX/OnD@agluck-desk3.sc.intel.com>
 <359bae4e-6ce3-cc7e-33d0-252064157bc6@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <359bae4e-6ce3-cc7e-33d0-252064157bc6@linux.alibaba.com>
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

On Fri, Oct 21, 2022 at 09:52:01AM +0800, Shuai Xue wrote:
> 
> 
> 在 2022/10/21 AM4:05, Tony Luck 写道:
> > On Thu, Oct 20, 2022 at 09:57:04AM +0800, Shuai Xue wrote:
> >>
> >>
> >> 在 2022/10/20 AM1:08, Tony Luck 写道:

> > I'm experimenting with using sched_work() to handle the call to
> > memory_failure() (echoing what the machine check handler does using
> > task_work)_add() to avoid the same problem of not being able to directly
> > call memory_failure()).
> 
> Work queues permit work to be deferred outside of the interrupt context
> into the kernel process context. If we return to user-space before the
> queued memory_failure() work is processed, we will take the fault again,
> as we discussed recently.
> 
>     commit 7f17b4a121d0d ACPI: APEI: Kick the memory_failure() queue for synchronous errors
>     commit 415fed694fe11 ACPI: APEI: do not add task_work to kernel thread to avoid memory leak
> 
> So, in my opinion, we should add memory failure as a task work, like
> do_machine_check does, e.g.
> 
>     queue_task_work(&m, msg, kill_me_maybe);

Maybe ... but this case isn't pending back to a user instruction
that is trying to READ the poison memory address. The task is just
trying to WRITE to any address within the page.

So this is much more like a patrol scrub error found asynchronously
by the memory controller (in this case found asynchronously by the
Linux page copy function).  So I don't feel that it's really the
responsibility of the current task.

When we do return to user mode the task is going to be busy servicing
a SIGBUS ... so shouldn't try to touch the poison page before the
memory_failure() called by the worker thread cleans things up.

> > +	INIT_WORK(&p->work, do_sched_memory_failure);
> > +	p->pfn = pfn;
> > +	schedule_work(&p->work);
> > +}
> 
> I think there is already a function to do such work in mm/memory-failure.c.
> 
> 	void memory_failure_queue(unsigned long pfn, int flags)

Also pointed out by Miaohe Lin <linmiaohe@huawei.com> ... this does
exacly what I want, and is working well in tests so far. So perhaps
a cleaner solution than making the kill_me_maybe() function globally
visible.

-Tony
