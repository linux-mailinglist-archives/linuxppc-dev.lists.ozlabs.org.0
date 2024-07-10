Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E6592D192
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 14:28:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qpIvD5RT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJxwq0Pvkz3dLH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 22:28:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qpIvD5RT;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJxw63Lklz3cBd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 22:28:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720614483;
	bh=Dk9oQcXatpAOcTNW8F66wOLoyQ5TH0P2B5WSusLytqQ=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=qpIvD5RTkuF9fGU3j3NgGN1Vt5MfoHL2HHmrNHOJyC91we37pZlyXosmrger+PW3P
	 xYNcM4NoKB6F+zS3op6Adh4aUQ/GO5X3anLbHBKJBpZuEGM7OY4dWFcTZgPjeEY5f4
	 JZSBu8EIjk95riKS/NmG964c07ZcIUEbYhx9tlr3KHNr2PWsQWKh82az1UaD9qeMmx
	 V7mc2L8OrExqqsImzjcs0xgLrIvvbHjxEdjyOKOitHRQ0LXY9MtICWlf1hi71K6M4v
	 6ajrqWSis8hBkINxnV3zI8uphyFN8xWUS0l9RxNYVASz8AwVdz74wXaxI2aPSx11Sq
	 JQW2dbFkU6AuA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJxw23dKxz4w2M;
	Wed, 10 Jul 2024 22:28:02 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, linux-mm@kvack.org, Andrew Morton
 <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, sidhartha.kumar@oracle.com, "Paul E
 . McKenney" <paulmck@kernel.org>, Bert Karwatzki <spasswolf@web.de>, Jiri
 Olsa <olsajiri@gmail.com>, linux-kernel@vger.kernel.org, Kees Cook
 <kees@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 16/16] mm/mmap: Move may_expand_vm() check in
 mmap_region()
In-Reply-To: <0998f05b-9d5f-4b24-9030-22421e1dd859@lucifer.local>
References: <20240704182718.2653918-1-Liam.Howlett@oracle.com>
 <20240704182718.2653918-17-Liam.Howlett@oracle.com>
 <8fbb424d-a781-4e61-af7a-904e281eba8c@lucifer.local>
 <e5ldsusdn3som7wn2rw76wtrhnlrxk3vkyk3iyimh6qv3ptvwu@24zfmamllev6>
 <0998f05b-9d5f-4b24-9030-22421e1dd859@lucifer.local>
Date: Wed, 10 Jul 2024 22:28:01 +1000
Message-ID: <874j8x5t4e.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
> On Mon, Jul 08, 2024 at 04:43:15PM GMT, Liam R. Howlett wrote:
>>
...
>> The functionality here has changed
>> --- from ---
>> may_expand_vm() check
>> can_modify_mm() check
>> arch_unmap()
>> vms_gather_munmap_vmas()
>> ...
>>
>> --- to ---
>> can_modify_mm() check
>> arch_unmap()
>> vms_gather_munmap_vmas()
>> may_expand_vm() check
>> ...
>>
>> vms_gather_munmap_vmas() does nothing but figures out what to do later,
>> but could use memory and can fail.
>>
>> The user implications are:
>>
>> 1. The return type on the error may change to -EPERM from -ENOMEM, if
>> you are not allowed to expand and are trying to overwrite mseal()'ed
>> VMAs. That seems so very rare that I'm not sure it's worth mentioning.
>>
>>
>> 2. arch_unmap() called prior to may_expand_vm().
>> powerpc uses this to set mm->context.vdso = NULL if mm->context.vdso is
>> within the unmap range.  User implication of this means that an
>> application my set the vdso to NULL prior to hitting the -ENOMEM case in
>> may_expand_vm() due to the address space limit.
>>
>> Assuming the removal of the vdso does not cause the application to seg
>> fault, then the user visible change is that any vdso call after a failed
>> mmap(MAP_FIXED) call would result in a seg fault.  The only reason it
>> would fail is if the mapping process was attempting to map a large
>> enough area over the vdso (which is accounted and in the vma tree,
>> afaict) and ran out of memory. Note that this situation could arise
>> already since we could run out of memory (not accounting) after the
>> arch_unmap() call within the kernel.
>>
>> The code today can suffer the same fate, but not by the accounting
>> failure.  It can happen due to failure to allocate a new vma,
>> do_vmi_munmap() failure after the arch_unmap() call, or any of the other
>> failure scenarios later in the mmap_region() function.
>>
>> At the very least, this requires an expanded change log.
>
> Indeed, also (as mentioned on IRC) I feel like we need to look at whether
> we _truly_ need this arch_unmap() call for a single, rather antiquated,
> architecture.

You can call it "niche" or "irrelevant" or "fringe", but "antiquated" is
factually wrong :) Power10 came out of the fab just a few years ago at
7nm.

> I mean why are they unmapping the VDSO, why is that valid, why does it need
> that field to be set to NULL, is it possible to signify that in some other
> way etc.?

It was originally for CRIU. So a niche workload on a niche architecture.

But from the commit that added it, it sounds like CRIU was using mremap,
which should be handled these days by vdso_mremap(). So it could be that
arch_unmap() is not actually needed for CRIU anymore.

Then I guess we have to decide if removing our arch_unmap() would be an
ABI break, regardless of whether CRIU needs it or not.

cheers
