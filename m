Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E46978F783
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 05:46:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kbuFz6Dk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcP980bsTz3bhy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 13:46:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kbuFz6Dk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcP8B6DW6z2ykV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 13:46:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693539962; x=1725075962;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dQBtg8NKz/pLl187/eYnyafMQC+Yh2bQyqEr25y1Bps=;
  b=kbuFz6DkuNISkb8r910V5pMF7Jy6TmbYYKwmDyfrIVKa1zEeooGjVLUa
   X/4pp0O/8CFkwdKu8JI/1bCrCfGbIhiPQSE4/FIK8vYc6ckKR9/Ds673P
   KlsGu3qgyVAskqRWabpCswQtX1yfm1nEBWHmSij2lxCgg2InRSeCrrk0k
   A8tOSrhiujfoDncaA9y3R918tGgMg18dZD6ZeACYg5Ecrsd/O5D6KgHvQ
   9DVj4L/r2eSh8Jvv6XGBQzUnMSjpBpzxrsYvwuYsBUx5QwKaTbzSbkZDl
   tPIXyZzO3Lho6Itsd7xPc20fdDO6qLSMiRmM1g4O2vgJng8M13tFEuXg0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356441913"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="356441913"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 20:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742962743"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="742962743"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.93.2.44]) ([10.93.2.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 20:45:45 -0700
Message-ID: <f7aaf097-6f83-0ee9-e16d-713d392b2299@linux.intel.com>
Date: Fri, 1 Sep 2023 11:45:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Ackerley Tng <ackerleytng@google.com>
References: <diqz5y4wfpj0.fsf@ackerleytng-ctop.c.googlers.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <diqz5y4wfpj0.fsf@ackerleytng-ctop.c.googlers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, maz@kernel.org, paul@paul-moore.com, anup@brainfault.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, seanjc@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/31/2023 12:44 AM, Ackerley Tng wrote:
> Binbin Wu <binbin.wu@linux.intel.com> writes:
>
>>> <snip>
>>>
>>> +static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
>>> +{
>>> +	struct address_space *mapping = inode->i_mapping;
>>> +	pgoff_t start, index, end;
>>> +	int r;
>>> +
>>> +	/* Dedicated guest is immutable by default. */
>>> +	if (offset + len > i_size_read(inode))
>>> +		return -EINVAL;
>>> +
>>> +	filemap_invalidate_lock_shared(mapping);
>>> +
>>> +	start = offset >> PAGE_SHIFT;
>>> +	end = (offset + len) >> PAGE_SHIFT;
>>> +
>>> +	r = 0;
>>> +	for (index = start; index < end; ) {
>>> +		struct folio *folio;
>>> +
>>> +		if (signal_pending(current)) {
>>> +			r = -EINTR;
>>> +			break;
>>> +		}
>>> +
>>> +		folio = kvm_gmem_get_folio(inode, index);
>>> +		if (!folio) {
>>> +			r = -ENOMEM;
>>> +			break;
>>> +		}
>>> +
>>> +		index = folio_next_index(folio);
>>> +
>>> +		folio_unlock(folio);
>>> +		folio_put(folio);
>> May be a dumb question, why we get the folio and then put it immediately?
>> Will it make the folio be released back to the page allocator?
>>
> I was wondering this too, but it is correct.
>
> In filemap_grab_folio(), the refcount is incremented in three places:
>
> + When the folio is created in filemap_alloc_folio(), it is given a
>    refcount of 1 in
>
>      filemap_alloc_folio() -> folio_alloc() -> __folio_alloc_node() ->
>      __folio_alloc() -> __alloc_pages() -> get_page_from_freelist() ->
>      prep_new_page() -> post_alloc_hook() -> set_page_refcounted()
>
> + Then, in filemap_add_folio(), the refcount is incremented twice:
>
>      + The first is from the filemap (1 refcount per page if this is a
>        hugepage):
>
>          filemap_add_folio() -> __filemap_add_folio() -> folio_ref_add()
>
>      + The second is a refcount from the lru list
>
>          filemap_add_folio() -> folio_add_lru() -> folio_get() ->
>          folio_ref_inc()
>
> In the other path, if the folio exists in the page cache (filemap), the
> refcount is also incremented through
>
>      filemap_grab_folio() -> __filemap_get_folio() -> filemap_get_entry()
>      -> folio_try_get_rcu()
>
> I believe all the branches in kvm_gmem_get_folio() are taking a refcount
> on the folio while the kernel does some work on the folio like clearing
> the folio in clear_highpage() or getting the next index, and then when
> done, the kernel does folio_put().
>
> This pattern is also used in shmem and hugetlb. :)

Thanks for your explanation. It helps a lot.

>
> I'm not sure whose refcount the folio_put() in kvm_gmem_allocate() is
> dropping though:
>
> + The refcount for the filemap depends on whether this is a hugepage or
>    not, but folio_put() strictly drops a refcount of 1.
> + The refcount for the lru list is just 1, but doesn't the page still
>    remain in the lru list?

I guess the refcount drop here is the one get on the fresh allocation.
Now the filemap has grabbed the folio, so the lifecycle of the folio now 
is decided by the filemap/inode?

>
>>> +
>>> +		/* 64-bit only, wrapping the index should be impossible. */
>>> +		if (WARN_ON_ONCE(!index))
>>> +			break;
>>> +
>>> +		cond_resched();
>>> +	}
>>> +
>>> +	filemap_invalidate_unlock_shared(mapping);
>>> +
>>> +	return r;
>>> +}
>>> +
>>>
>>> <snip>

