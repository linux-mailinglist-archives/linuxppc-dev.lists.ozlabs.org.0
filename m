Return-Path: <linuxppc-dev+bounces-9880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBFBAEDC5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 14:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW4jw4Y98z2xS9;
	Mon, 30 Jun 2025 22:10:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751285428;
	cv=none; b=n4i0hqsvs0XfZ8ONpo72RjvJNMowSblYPrZjCZC84mZ3mGuzO8KnsByknN8cD5K09a7CkMePXQI1rNsTti+OjkkyCypdb+mxc1MzLYtvwZn9D43Fh4Hvz1+FlieS6N1qFOHX4nzRV8aP9hCKPEOEE4UuU4ZfWHVn2vWN67PdPt0p5AnWDcXB5Lrhe37mlWxaS1KprB12xw79Gs4ewadJZJN393hbSR9IWfeMM5nwckIp+t3z6n4MmhCfOq9PeeJpJBiLQDrxX+1Mw4iP1H6VnZ+1zRh061bsyzGmjNcbgpBPdXdeWyAl3RH0jYVDv+8oqmF/z8B+ix8K0QTgyYI2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751285428; c=relaxed/relaxed;
	bh=Op50PqPeT0HmpJeycMvUHdwxGaCisgrxovBuhS5pGjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxI52cuythq03hMkhLwUePgCiCs9DChD0aeiUBisHSzAuhHX1P9Qr9WePRgW+pt73B1OabZ/vz6hAfvN7dqedI8Q6y9TsYXxgl3kLNBSt2aEN5pTPGZ0PiQvQ1HopTQyedzulBnz3iDns+bFdi0vL1ch5jd+lEdIGEtmjxRC4gQCWX/BvFii2DSnJOPEcUSxH8UY9l5BNzEAs+oOH5aHQ4xYigMEtEFuYU8LxoEb8D5ORC7rUlHefCtH+uMJ+3l1mtqauvVroDovl6LVqmLHOn2X/cf91QPXFqfevOix/hpl2KewjGKGmuK9hI+ZGad6B6wy/xI++s7xpOUYnMLSKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B/kIz41s; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B/kIz41s; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B/kIz41s;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B/kIz41s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW4jv2rpJz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 22:10:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751285422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Op50PqPeT0HmpJeycMvUHdwxGaCisgrxovBuhS5pGjg=;
	b=B/kIz41s6INSjf0Frq6WPPEBBiFFq5UuVmUitS6/4aLNmtVGlmaXlQn6j5UkwBPli/M07r
	LUs6oq8vLYBUD3JyxsCt6aDP+GQL2DHykEyN/nubar/JwzFAGI0Fipyy3T4ioHAthdRF7x
	9NZcH0gM3OVWZGCX+p9uQXzLToIL03g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751285422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Op50PqPeT0HmpJeycMvUHdwxGaCisgrxovBuhS5pGjg=;
	b=B/kIz41s6INSjf0Frq6WPPEBBiFFq5UuVmUitS6/4aLNmtVGlmaXlQn6j5UkwBPli/M07r
	LUs6oq8vLYBUD3JyxsCt6aDP+GQL2DHykEyN/nubar/JwzFAGI0Fipyy3T4ioHAthdRF7x
	9NZcH0gM3OVWZGCX+p9uQXzLToIL03g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-wlFpT89cOiioPyjXpHf5TA-1; Mon, 30 Jun 2025 08:07:51 -0400
X-MC-Unique: wlFpT89cOiioPyjXpHf5TA-1
X-Mimecast-MFC-AGG-ID: wlFpT89cOiioPyjXpHf5TA_1751285270
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4532ff43376so18233815e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 05:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751285270; x=1751890070;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Op50PqPeT0HmpJeycMvUHdwxGaCisgrxovBuhS5pGjg=;
        b=vNdlxNldjm8DcJHRpxIS+6H5QQ8WPnQOkuOfJZOoYhZu+NIFqFRmc+a2SiLAneVFeL
         OhgBiJH1ZEF+zyIZuUIO5aj4v0xu5sx3GUS5au6ruZl+B1rnfznDRBJNpN+TY8R9JE2H
         jYz9YWDYgJLmvwMlrpbWq+V/KaV90uUvuYrkQMbRGeB+2VmxGTu227I0focOF1FYz9Xk
         OGGruChxwp5V2roBU8/k8/aWFnVRmRfwzquQs//n4RH918RMgx2UNGgQ3rxmfBzGhdML
         Sy1fcie3ITKsd3irZ9I5/594C5e/MfQLgbAyTUCzQsJQ8Xzm9tlBpA+zjSvr8BeITttI
         8rPw==
X-Forwarded-Encrypted: i=1; AJvYcCV3UFIcCeJQXl/0+3sv8LvwxY/w0QPMQXapA51CvrFLdSQ0H+A8ZJ03gf/a2q2BjXRm31e+hC5lLLGaRvM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGWrkqxGJaYxG1hK0kkGKJt7hdNE0s4lFqDtodLy+JVQWmiHJx
	UHcQaqKAnqbRFC+q8oGzyxjdwfK65/H8LTmelYCEWp8NsGbfJduLgFPC0GN+x/sbuUJEpiEkYOJ
	xoWAPJAUxwLRJBbuIg2GYTnrx4TRoP2kxeofa0rOd2QNcT+L8ur4eLX8vi9rL2Q9b/r4=
X-Gm-Gg: ASbGncteJYEAUS3x/CkAJ3ROvv1COLv8AFQ3/4V/BnuRjcBVVRGvCS+D7EUc2CDzF7e
	nVhGCk1Ktr+0Y4DPCvn5HnTWiyhSPbx3VUYbRbn/FyTsQ/OAh6/O+bGLXxAEyUmTPhxxP+GhVvm
	SByHtH/Dv5v1mb+BzGHKB3oCO2niC4+EXVVXTu8CD8lpx7mFuDSIJMc/gHcA1fQ4hjsehHVLxBt
	DavNVewyB9U3znxl73QMmE8HtRLdJKN4hAvKpMMgjSpg7JTXtodEm+v1kRhH/4SRAdYJSI/tvBt
	JC7dhIaxOKCeFTi00iEfw3CFMYJPMgHRPzoJhq+pCi5AP4+sgdQAbk5Xpou1pssUBZvkvHklqkC
	mQO42dixHA+8WoForGiUSnjxns+6xgee5253hBjhcWW8QFcWRxw==
X-Received: by 2002:a05:600c:608a:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-4538ee4f7c2mr121744115e9.7.1751285269716;
        Mon, 30 Jun 2025 05:07:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWCKm3o+0u7J/9o+MJEl+ALenW0yv9KxJ4HHuTU2e7vVeBpaNUvnmxNrecr9Wrf8EXQo2MMg==
X-Received: by 2002:a05:600c:608a:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-4538ee4f7c2mr121743605e9.7.1751285269149;
        Mon, 30 Jun 2025 05:07:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c0812sm162261985e9.34.2025.06.30.05.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:07:48 -0700 (PDT)
Message-ID: <c08d13ba-d199-4a9a-8be2-56074fac3f74@redhat.com>
Date: Mon, 30 Jun 2025 14:07:46 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/29] mm/migrate: move movable_ops page handling out
 of move_to_new_folio()
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-12-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250618174014.1168640-12-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L4e0Pox8-sEDakAypm0pWEe6n1BOj8hqfAy320fyt1Y_1751285270
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18.06.25 19:39, David Hildenbrand wrote:
> Let's move that handling directly into migrate_folio_move(), so we can
> simplify move_to_new_folio(). While at it, fixup the documentation a
> bit.
> 
> Note that unmap_and_move_huge_page() does not care, because it only
> deals with actual folios. (we only support migration of
> individual movable_ops pages)
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/migrate.c | 61 ++++++++++++++++++++++++----------------------------
>   1 file changed, 28 insertions(+), 33 deletions(-)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 456e41dad83a2..db807f9bbf975 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1024,11 +1024,12 @@ static int fallback_migrate_folio(struct address_space *mapping,
>   }
>   
>   /*
> - * Move a page to a newly allocated page
> - * The page is locked and all ptes have been successfully removed.
> + * Move a src folio to a newly allocated dst folio.
>    *
> - * The new page will have replaced the old page if this function
> - * is successful.
> + * The src and dst folios are locked and the src folios was unmapped from
> + * the page tables.
> + *
> + * On success, the src folio was replaced by the dst folio.
>    *
>    * Return value:
>    *   < 0 - error code
> @@ -1037,34 +1038,30 @@ static int fallback_migrate_folio(struct address_space *mapping,
>   static int move_to_new_folio(struct folio *dst, struct folio *src,
>   				enum migrate_mode mode)
>   {
> +	struct address_space *mapping = folio_mapping(src);
>   	int rc = -EAGAIN;
> -	bool is_lru = !__folio_test_movable(src);
>   
>   	VM_BUG_ON_FOLIO(!folio_test_locked(src), src);
>   	VM_BUG_ON_FOLIO(!folio_test_locked(dst), dst);
>   
> -	if (likely(is_lru)) {
> -		struct address_space *mapping = folio_mapping(src);
> -
> -		if (!mapping)
> -			rc = migrate_folio(mapping, dst, src, mode);
> -		else if (mapping_inaccessible(mapping))
> -			rc = -EOPNOTSUPP;
> -		else if (mapping->a_ops->migrate_folio)
> -			/*
> -			 * Most folios have a mapping and most filesystems
> -			 * provide a migrate_folio callback. Anonymous folios
> -			 * are part of swap space which also has its own
> -			 * migrate_folio callback. This is the most common path
> -			 * for page migration.
> -			 */
> -			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
> -								mode);
> -		else
> -			rc = fallback_migrate_folio(mapping, dst, src, mode);
> +	if (!mapping)
> +		rc = migrate_folio(mapping, dst, src, mode);
> +	else if (mapping_inaccessible(mapping))
> +		rc = -EOPNOTSUPP;
> +	else if (mapping->a_ops->migrate_folio)
> +		/*
> +		 * Most folios have a mapping and most filesystems
> +		 * provide a migrate_folio callback. Anonymous folios
> +		 * are part of swap space which also has its own
> +		 * migrate_folio callback. This is the most common path
> +		 * for page migration.
> +		 */
> +		rc = mapping->a_ops->migrate_folio(mapping, dst, src,
> +							mode);
> +	else
> +		rc = fallback_migrate_folio(mapping, dst, src, mode);
>   
> -		if (rc != MIGRATEPAGE_SUCCESS)
> -			goto out;
> +	if (rc == MIGRATEPAGE_SUCCESS) {
>   		/*
>   		 * For pagecache folios, src->mapping must be cleared before src
>   		 * is freed. Anonymous folios must stay anonymous until freed.
> @@ -1074,10 +1071,7 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
>   
>   		if (likely(!folio_is_zone_device(dst)))
>   			flush_dcache_folio(dst);
> -	} else {
> -		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
>   	}
> -out:
>   	return rc;
>   }
>   
> @@ -1328,20 +1322,21 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
>   	int rc;
>   	int old_page_state = 0;
>   	struct anon_vma *anon_vma = NULL;
> -	bool is_lru = !__folio_test_movable(src);
>   	struct list_head *prev;
>   
>   	__migrate_folio_extract(dst, &old_page_state, &anon_vma);
>   	prev = dst->lru.prev;
>   	list_del(&dst->lru);
>   
> +	if (unlikely(__folio_test_movable(src))) {
> +		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
> +		goto out_unlock_both;
> +	}
> +


I suspect this was the issue I was chasing:

diff --git a/mm/migrate.c b/mm/migrate.c
index 9dd327a63abc5..22c115710d0e2 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1330,6 +1330,8 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
  
         if (unlikely(__folio_test_movable(src))) {
                 rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
+               if (rc)
+                       goto out;
                 goto out_unlock_both;
         }
  

Testing ...

-- 
Cheers,

David / dhildenb


