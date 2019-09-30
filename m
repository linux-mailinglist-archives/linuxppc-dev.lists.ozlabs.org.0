Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9923C291D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 23:49:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hwzK4VKSzDqPn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 07:49:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="osL0/h+o"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hwxY0n10zDqPK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 07:48:00 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d9278130001>; Mon, 30 Sep 2019 14:48:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 30 Sep 2019 14:47:55 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 30 Sep 2019 14:47:55 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Sep
 2019 21:47:55 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Sep
 2019 21:47:54 +0000
Subject: Re: [PATCH v4 01/11] powerpc/mm: Adds counting method to monitor
 lockless pgtable walks
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <kvm-ppc@vger.kernel.org>,
 <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>
References: <20190927234008.11513-1-leonardo@linux.ibm.com>
 <20190927234008.11513-2-leonardo@linux.ibm.com>
 <4ff1e8e8-929b-9cfc-9bf8-ee88e34de888@nvidia.com>
 <2533a13f226a6e1fab387669b6cced2aa8d2e129.camel@linux.ibm.com>
 <48bf32ca-5d3e-5d69-4cd1-6720364a0d81@nvidia.com>
 <673bcb94b7752e086cc4133fb6cceb24394c02c0.camel@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <8534727b-72ed-b974-219e-02155bcd17a8@nvidia.com>
Date: Mon, 30 Sep 2019 14:47:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <673bcb94b7752e086cc4133fb6cceb24394c02c0.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569880083; bh=VM1+3qVJNvRJ86vH2XX4HqIVEaILMvKyXYsbaBxCGt0=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=osL0/h+oo7DmiT87UhgWP3aBg4HLSvayBotd7x1wIJ9AutqVUo0q6uV6o1yockGKP
 SAD/c00L+PuhHl1v4HX97+ls9RM9h0hfs3jmh49iN3VW9JAg7Rn6NZzSHVqpl+ISA7
 SYwb2KbWRK808n1vPoysbBJSu2lL9oMwlNJxe+ysR3jxa3gHgDnLOcY9ToS6V7wigM
 mxJLYSIWO9ct5ld0fq8SNF+pkghzhTkz9rvtFzBnF2AIkQz3dIpLBGWzya3DJ1/QdW
 G1jHsafQAIqrlStuaWO4EINd60O+/0EF8CG9uaK0bG0lTre58WLfOLfTGr9tr9ScGw
 IvHLCtFSVIjjQ==
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
Cc: Dan Williams <dan.j.williams@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 YueHaibing <yuehaibing@huawei.com>, Nicholas
 Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Keith Busch <keith.busch@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/30/19 11:42 AM, Leonardo Bras wrote:
> On Mon, 2019-09-30 at 10:57 -0700, John Hubbard wrote:
>>> As I told before, there are cases where this function is called from
>>> 'real mode' in powerpc, which doesn't disable irqs and may have a
>>> tricky behavior if we do. So, encapsulate the irq disable in this
>>> function can be a bad choice.
>>
>> You still haven't explained how this works in that case. So far, the
>> synchronization we've discussed has depended upon interrupt disabling
>> as part of the solution, in order to hold off page splitting and page
>> table freeing.
> 
> The irqs are already disabled by another mechanism (hw): MSR_EE=0.
> So, serialize will work as expected.

I get that they're disabled. But will this interlock with the code that
issues IPIs?? Because it's not just disabling interrupts that matters, but
rather, synchronizing with the code (TLB flushing) that *happens* to 
require issuing IPIs, which in turn interact with disabling interrupts.

So I'm still not seeing how that could work here, unless there is something
interesting about the smp_call_function_many() on ppc with MSR_EE=0 mode...?

> 
>> Simply skipping that means that an additional mechanism is required...which
>> btw might involve a new, ppc-specific routine, so maybe this is going to end
>> up pretty close to what I pasted in after all...
>>> Of course, if we really need that, we can add a bool parameter to the
>>> function to choose about disabling/enabling irqs.
>>>> * This is really a core mm function, so don't hide it away in arch layers.
>>>>     (If you're changing mm/ files, that's a big hint.)
>>>
>>> My idea here is to let the arch decide on how this 'register' is going
>>> to work, as archs may have different needs (in powerpc for example, we
>>> can't always disable irqs, since we may be in realmode).

Yes, the tension there is that a) some things are per-arch, and b) it's easy 
to get it wrong. The commit below (d9101bfa6adc) is IMHO a perfect example of
that.

So, I would like core mm/ functions that guide the way, but the interrupt
behavior complicates it. I think your original passing of just struct_mm
is probably the right balance, assuming that I'm wrong about interrupts.


>>>
>>> Maybe we can create a generic function instead of a dummy, and let it
>>> be replaced in case the arch needs to do so.
>>
>> Yes, that might be what we need, if it turns out that ppc can't use this
>> approach (although let's see about that).
>>
> 
> I initially used the dummy approach because I did not see anything like
> serialize in other archs. 
> 
> I mean, even if I put some generic function here, if there is no
> function to use the 'lockless_pgtbl_walk_count', it becomes only a
> overhead.
> 

Not really: the memory barrier is required in all cases, and this code
would be good I think:

+void register_lockless_pgtable_walker(struct mm_struct *mm)
+{
+#ifdef LOCKLESS_PAGE_TABLE_WALK_TRACKING
+       atomic_inc(&mm->lockless_pgtbl_nr_walkers);
+#endif
+       /*
+        * This memory barrier pairs with any code that is either trying to
+        * delete page tables, or split huge pages.
+        */
+       smp_mb();
+}
+EXPORT_SYMBOL_GPL(gup_fast_lock_acquire);

And this is the same as your original patch, with just a minor name change:

@@ -2341,9 +2395,11 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 
        if (IS_ENABLED(CONFIG_HAVE_FAST_GUP) &&
            gup_fast_permitted(start, end)) {
+               register_lockless_pgtable_walker(current->mm);
                local_irq_save(flags);
                gup_pgd_range(start, end, write ? FOLL_WRITE : 0, pages, &nr);
                local_irq_restore(flags);
+               deregister_lockless_pgtable_walker(current->mm);


Btw, hopefully minor note: it also looks like there's a number of changes in the same 
area that conflict, for example:

    commit d9101bfa6adc ("powerpc/mm/mce: Keep irqs disabled during lockless 
         page table walk") <Aneesh Kumar K.V> (Thu, 19 Sep 2019)

...so it would be good to rebase this onto 5.4-rc1, now that that's here.


thanks,
-- 
John Hubbard
NVIDIA
