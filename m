Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0B87DBED7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 18:25:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d5pMZdq9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d5pMZdq9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK0Xs5T9kz3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 04:25:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d5pMZdq9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d5pMZdq9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK0Wy4Jr3z3c82
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 04:25:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698686699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aTBFgLt9uRovWwF2IMctF7UYTEbuVr1QbBbWiOdNkAA=;
	b=d5pMZdq9UfdY5Q+5cW3i2Tie20HSEZYcl01bg+mkClpTtcZTI7XF/UXyqhOuV1IRliDNOO
	mcn58fs66/U9LZBmSpI78HyG4flOPNLRAIRMnv7IkshsjtqvSFq6+lmeqXSzkw9nC6JSfN
	1k2xMNL7oHU5aPL1d7YNr+187mAFjS8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698686699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aTBFgLt9uRovWwF2IMctF7UYTEbuVr1QbBbWiOdNkAA=;
	b=d5pMZdq9UfdY5Q+5cW3i2Tie20HSEZYcl01bg+mkClpTtcZTI7XF/UXyqhOuV1IRliDNOO
	mcn58fs66/U9LZBmSpI78HyG4flOPNLRAIRMnv7IkshsjtqvSFq6+lmeqXSzkw9nC6JSfN
	1k2xMNL7oHU5aPL1d7YNr+187mAFjS8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-M9HbJCYSP-SqI0dqObPkVA-1; Mon, 30 Oct 2023 13:24:52 -0400
X-MC-Unique: M9HbJCYSP-SqI0dqObPkVA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2c50dcd377eso50278631fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 10:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698686691; x=1699291491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTBFgLt9uRovWwF2IMctF7UYTEbuVr1QbBbWiOdNkAA=;
        b=tz2Z8+phQkSANNpMI+ayh6VcR9uZRzjEJWzuhn4BuTfCpXCZIZhndrACqpCSI0U7Na
         9rKK9oLOTFLrC1Hb+QujUJTLZZYQzKMEGixK7O5kx9WF3RcR2g8pTHSoIgbaSnRaeh2n
         RgwADyyAvbWxKIcjObN+xtY2WzdORxolbFDlyHVhEaXiZkFhEMkLEh5Qnb2Z8lrSmqMl
         TOugdxB6Z/4HLaZ83/ql/JjHKVv+25406T84jQjOxfbvH+7le+ZF3sR+XN2gY5f6/oja
         Rsvx/EXxCbM/p9P6IrlT9+oTXa5n9jWCICV7s5ypdaVd4Cr5wppQmbvL3BhnHkMUc2Kx
         7Pug==
X-Gm-Message-State: AOJu0YwJ5/Omag6b9x0jyG2g4+0lK7QCMu1Mz7n4BJvnvtGzCqeMO5mC
	f6sGEpCdVlW1X+THQf+SqOKQ54j5aPyymyXC6KhyA5lvquIgOOQOwJgqroDEjLu9dK8pzyigEG7
	/U43W5jSq2MqNxTxYwM9a36eyKw==
X-Received: by 2002:a05:651c:c98:b0:2c5:13b1:b450 with SMTP id bz24-20020a05651c0c9800b002c513b1b450mr10090915ljb.26.1698686691292;
        Mon, 30 Oct 2023 10:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH4GpuJ4hd8lDIQ6vW1HWByPqqh+IwG7ee+zcxusmVo9be7cbvygAsUC7OMmwHWlxrzIuEsg==
X-Received: by 2002:a05:651c:c98:b0:2c5:13b1:b450 with SMTP id bz24-20020a05651c0c9800b002c513b1b450mr10090869ljb.26.1698686690900;
        Mon, 30 Oct 2023 10:24:50 -0700 (PDT)
Received: from [192.168.1.174] ([151.81.68.207])
        by smtp.googlemail.com with ESMTPSA id n13-20020a05600c500d00b0040772934b12sm13131967wmr.7.2023.10.30.10.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 10:24:49 -0700 (PDT)
Message-ID: <601f24a0-cb55-458e-aa15-3970f2290172@redhat.com>
Date: Mon, 30 Oct 2023 18:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 14/35] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-15-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231027182217.3615211-15-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, Vlastimil Babka <vbabka@suse.cz>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal A
 nnapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/27/23 20:21, Sean Christopherson wrote:
> Add an "unmovable" flag for mappings that cannot be migrated under any
> circumstance.  KVM will use the flag for its upcoming GUEST_MEMFD support,
> which will not support compaction/migration, at least not in the
> foreseeable future.
> 
> Test AS_UNMOVABLE under folio lock as already done for the async
> compaction/dirty folio case, as the mapping can be removed by truncation
> while compaction is running.  To avoid having to lock every folio with a
> mapping, assume/require that unmovable mappings are also unevictable, and
> have mapping_set_unmovable() also set AS_UNEVICTABLE.
> 
> Cc: Matthew Wilcox <willy@infradead.org>
> Co-developed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

I think this could even be "From: Vlastimil", but no biggie.

Paolo

> ---
>   include/linux/pagemap.h | 19 +++++++++++++++++-
>   mm/compaction.c         | 43 +++++++++++++++++++++++++++++------------
>   mm/migrate.c            |  2 ++
>   3 files changed, 51 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 351c3b7f93a1..82c9bf506b79 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -203,7 +203,8 @@ enum mapping_flags {
>   	/* writeback related tags are not used */
>   	AS_NO_WRITEBACK_TAGS = 5,
>   	AS_LARGE_FOLIO_SUPPORT = 6,
> -	AS_RELEASE_ALWAYS,	/* Call ->release_folio(), even if no private data */
> +	AS_RELEASE_ALWAYS = 7,	/* Call ->release_folio(), even if no private data */
> +	AS_UNMOVABLE	= 8,	/* The mapping cannot be moved, ever */
>   };
>   
>   /**
> @@ -289,6 +290,22 @@ static inline void mapping_clear_release_always(struct address_space *mapping)
>   	clear_bit(AS_RELEASE_ALWAYS, &mapping->flags);
>   }
>   
> +static inline void mapping_set_unmovable(struct address_space *mapping)
> +{
> +	/*
> +	 * It's expected unmovable mappings are also unevictable. Compaction
> +	 * migrate scanner (isolate_migratepages_block()) relies on this to
> +	 * reduce page locking.
> +	 */
> +	set_bit(AS_UNEVICTABLE, &mapping->flags);
> +	set_bit(AS_UNMOVABLE, &mapping->flags);
> +}
> +
> +static inline bool mapping_unmovable(struct address_space *mapping)
> +{
> +	return test_bit(AS_UNMOVABLE, &mapping->flags);
> +}
> +
>   static inline gfp_t mapping_gfp_mask(struct address_space * mapping)
>   {
>   	return mapping->gfp_mask;
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 38c8d216c6a3..12b828aed7c8 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -883,6 +883,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>   
>   	/* Time to isolate some pages for migration */
>   	for (; low_pfn < end_pfn; low_pfn++) {
> +		bool is_dirty, is_unevictable;
>   
>   		if (skip_on_failure && low_pfn >= next_skip_pfn) {
>   			/*
> @@ -1080,8 +1081,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>   		if (!folio_test_lru(folio))
>   			goto isolate_fail_put;
>   
> +		is_unevictable = folio_test_unevictable(folio);
> +
>   		/* Compaction might skip unevictable pages but CMA takes them */
> -		if (!(mode & ISOLATE_UNEVICTABLE) && folio_test_unevictable(folio))
> +		if (!(mode & ISOLATE_UNEVICTABLE) && is_unevictable)
>   			goto isolate_fail_put;
>   
>   		/*
> @@ -1093,26 +1096,42 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>   		if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_writeback(folio))
>   			goto isolate_fail_put;
>   
> -		if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_dirty(folio)) {
> -			bool migrate_dirty;
> +		is_dirty = folio_test_dirty(folio);
> +
> +		if (((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) ||
> +		    (mapping && is_unevictable)) {
> +			bool migrate_dirty = true;
> +			bool is_unmovable;
>   
>   			/*
>   			 * Only folios without mappings or that have
> -			 * a ->migrate_folio callback are possible to
> -			 * migrate without blocking.  However, we may
> -			 * be racing with truncation, which can free
> -			 * the mapping.  Truncation holds the folio lock
> -			 * until after the folio is removed from the page
> -			 * cache so holding it ourselves is sufficient.
> +			 * a ->migrate_folio callback are possible to migrate
> +			 * without blocking.
> +			 *
> +			 * Folios from unmovable mappings are not migratable.
> +			 *
> +			 * However, we can be racing with truncation, which can
> +			 * free the mapping that we need to check. Truncation
> +			 * holds the folio lock until after the folio is removed
> +			 * from the page so holding it ourselves is sufficient.
> +			 *
> +			 * To avoid locking the folio just to check unmovable,
> +			 * assume every unmovable folio is also unevictable,
> +			 * which is a cheaper test.  If our assumption goes
> +			 * wrong, it's not a correctness bug, just potentially
> +			 * wasted cycles.
>   			 */
>   			if (!folio_trylock(folio))
>   				goto isolate_fail_put;
>   
>   			mapping = folio_mapping(folio);
> -			migrate_dirty = !mapping ||
> -					mapping->a_ops->migrate_folio;
> +			if ((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) {
> +				migrate_dirty = !mapping ||
> +						mapping->a_ops->migrate_folio;
> +			}
> +			is_unmovable = mapping && mapping_unmovable(mapping);
>   			folio_unlock(folio);
> -			if (!migrate_dirty)
> +			if (!migrate_dirty || is_unmovable)
>   				goto isolate_fail_put;
>   		}
>   
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 2053b54556ca..ed874e43ecd7 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -956,6 +956,8 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
>   
>   		if (!mapping)
>   			rc = migrate_folio(mapping, dst, src, mode);
> +		else if (mapping_unmovable(mapping))
> +			rc = -EOPNOTSUPP;
>   		else if (mapping->a_ops->migrate_folio)
>   			/*
>   			 * Most folios have a mapping and most filesystems

