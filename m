Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D30578D7AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 18:45:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=oXnA5SJ8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbVXk6pRrz3c2J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 02:45:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=oXnA5SJ8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ackerleytng.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3bxlvzaskdnq02a4hb4ojd66ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--ackerleytng.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbVWs6QvXz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 02:44:56 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58fc7afa4beso81751607b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 09:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693413893; x=1694018693; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q7U5WETyc0Qx792+SyKBjLV43d3DHT0ObMpMrFVoeXw=;
        b=oXnA5SJ8iayUkW+SH/WnXsv9+bF4Py1X6Jey5rq2Cun4YkR6f8OdND6bKhGDq/If0R
         8yKaIKWrcf4g8tbffXPYPtGUbk0UPdcQ+SfXyKYI8B8v/CBeciSTaxrpzZdNXai6IH5H
         i+W6cJpcNaaTRvosZ/QM2Sgh0NcIgOhK8qfM9/B0W91ryML4Eb9i0873XqBMYzFiqmr0
         jvrXbzkPcNU+R8GUF/koaJStD6+eUnnnou3p4qA5wtNv0s/NKejSiqJMm2Kx0QiXBcBh
         u8ekhgLpZI1Q+8woOnsYo0qOYlPMcXjZYg5toPbIpmAzzgY7Xlf66+SiJ+GX0+d45K3Y
         YS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693413893; x=1694018693;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7U5WETyc0Qx792+SyKBjLV43d3DHT0ObMpMrFVoeXw=;
        b=JMc4CK+UW1XSVzmPU5Hff4ObbzIB/Q9pQh16eLhtBKZWhiAIH1sNbgeXvs4G+u9bhL
         1B/cTGtrY8QLmpfILV6nJY+K0ErjqwbIJbcIDWM2Oue/+pjCMCZwMfqGBZFwlx/FzsV9
         7px8uXN+4WSYgZZc3U9XeJ2DTsFeaSvPKR4EoBhGfxOgOpI6Z5Yapc43m37iuQdxbZxa
         Fb5Kkpv9hTxFOXM67WmE3uYf4ppDSA1f4MOEW004xsPOAu89Uo9UODuSKYOki8TTyNzm
         srh949ddhJliQexBHnKYmhvxbPjpyyzzgSiC7W8UlfdUvmE5SqPsbPyDIOMnzc9+hJrL
         ry7w==
X-Gm-Message-State: AOJu0Yy5aUDAJLbizST5sRK5UdGruhvvbnuBm6ZDmvm3NqzucJSxq553
	hqlNfAExxM7F3ysGFGgCd7MvhwmAss0Y17IVIQ==
X-Google-Smtp-Source: AGHT+IHtp9pD/5ci3MqPyr+0sXpcwrOb70482adH4y9FFBhT1onMN4Y2Yo7VfYMaFeFIQUgnoauWykiqo7sAzbNhxQ==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a81:eb0b:0:b0:57a:793:7fb0 with SMTP
 id n11-20020a81eb0b000000b0057a07937fb0mr78438ywm.3.1693413893177; Wed, 30
 Aug 2023 09:44:53 -0700 (PDT)
Date: Wed, 30 Aug 2023 16:44:51 +0000
In-Reply-To: <30ffe039-c9e2-b996-500d-5e11bf6ea789@linux.intel.com> (message
 from Binbin Wu on Wed, 30 Aug 2023 23:12:19 +0800)
Mime-Version: 1.0
Message-ID: <diqz5y4wfpj0.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Ackerley Tng <ackerleytng@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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

Binbin Wu <binbin.wu@linux.intel.com> writes:

>> <snip>
>>
>> +static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
>> +{
>> +	struct address_space *mapping = inode->i_mapping;
>> +	pgoff_t start, index, end;
>> +	int r;
>> +
>> +	/* Dedicated guest is immutable by default. */
>> +	if (offset + len > i_size_read(inode))
>> +		return -EINVAL;
>> +
>> +	filemap_invalidate_lock_shared(mapping);
>> +
>> +	start = offset >> PAGE_SHIFT;
>> +	end = (offset + len) >> PAGE_SHIFT;
>> +
>> +	r = 0;
>> +	for (index = start; index < end; ) {
>> +		struct folio *folio;
>> +
>> +		if (signal_pending(current)) {
>> +			r = -EINTR;
>> +			break;
>> +		}
>> +
>> +		folio = kvm_gmem_get_folio(inode, index);
>> +		if (!folio) {
>> +			r = -ENOMEM;
>> +			break;
>> +		}
>> +
>> +		index = folio_next_index(folio);
>> +
>> +		folio_unlock(folio);
>> +		folio_put(folio);
> May be a dumb question, why we get the folio and then put it immediately?
> Will it make the folio be released back to the page allocator?
>

I was wondering this too, but it is correct.

In filemap_grab_folio(), the refcount is incremented in three places:

+ When the folio is created in filemap_alloc_folio(), it is given a
  refcount of 1 in

    filemap_alloc_folio() -> folio_alloc() -> __folio_alloc_node() ->
    __folio_alloc() -> __alloc_pages() -> get_page_from_freelist() ->
    prep_new_page() -> post_alloc_hook() -> set_page_refcounted()

+ Then, in filemap_add_folio(), the refcount is incremented twice:

    + The first is from the filemap (1 refcount per page if this is a
      hugepage):

        filemap_add_folio() -> __filemap_add_folio() -> folio_ref_add()

    + The second is a refcount from the lru list

        filemap_add_folio() -> folio_add_lru() -> folio_get() ->
        folio_ref_inc()

In the other path, if the folio exists in the page cache (filemap), the
refcount is also incremented through

    filemap_grab_folio() -> __filemap_get_folio() -> filemap_get_entry()
    -> folio_try_get_rcu()

I believe all the branches in kvm_gmem_get_folio() are taking a refcount
on the folio while the kernel does some work on the folio like clearing
the folio in clear_highpage() or getting the next index, and then when
done, the kernel does folio_put().

This pattern is also used in shmem and hugetlb. :)

I'm not sure whose refcount the folio_put() in kvm_gmem_allocate() is
dropping though:

+ The refcount for the filemap depends on whether this is a hugepage or
  not, but folio_put() strictly drops a refcount of 1.
+ The refcount for the lru list is just 1, but doesn't the page still
  remain in the lru list?

>> +
>> +		/* 64-bit only, wrapping the index should be impossible. */
>> +		if (WARN_ON_ONCE(!index))
>> +			break;
>> +
>> +		cond_resched();
>> +	}
>> +
>> +	filemap_invalidate_unlock_shared(mapping);
>> +
>> +	return r;
>> +}
>> +
>>
>> <snip>
