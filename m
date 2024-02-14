Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4DC85563D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 23:41:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JqwgPOiN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JqwgPOiN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZtTS15kCz3dV3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 09:41:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JqwgPOiN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JqwgPOiN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZtSZ3Pnsz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 09:40:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707950426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WN/1wnCbyZpZRJItW2gMIOPbx328LkZgbs4KqytUNcM=;
	b=JqwgPOiNEI5rmQPtNMFQqIDLs9T6pRkAjoQQ+Ge/qLWCl4F2uhX3UFOr+WeexQkRc73Cfr
	ynegD85xePH5tREm6Ana2AzSrDv2RhylDd05xEJKERmMuDHQQMN+IP/KI0yMJLj0fGlyVe
	KHcyjcivwZAXNd1wWWJhuMC+BkUtLz4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707950426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WN/1wnCbyZpZRJItW2gMIOPbx328LkZgbs4KqytUNcM=;
	b=JqwgPOiNEI5rmQPtNMFQqIDLs9T6pRkAjoQQ+Ge/qLWCl4F2uhX3UFOr+WeexQkRc73Cfr
	ynegD85xePH5tREm6Ana2AzSrDv2RhylDd05xEJKERmMuDHQQMN+IP/KI0yMJLj0fGlyVe
	KHcyjcivwZAXNd1wWWJhuMC+BkUtLz4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-cJgMPYPNOFSAWoc-s4EVsw-1; Wed, 14 Feb 2024 17:40:25 -0500
X-MC-Unique: cJgMPYPNOFSAWoc-s4EVsw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-411ac839dc5so1079675e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 14:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707950424; x=1708555224;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WN/1wnCbyZpZRJItW2gMIOPbx328LkZgbs4KqytUNcM=;
        b=hpmXCGlJYi6TAHlLsvtZqNfyPMZq88CGHdJxBrqrHa7o7qCto1F2fS6bek9JpzUynQ
         h/dgYz/xcAVlUsCzjVa3w1FsqUsvZMLjQg07b6CT4bmwb2FgOlfzDnu7FtyazSED06i3
         NDfeSi2F22mSAWSs5KGMM3qwDmXiBuK4rG9uTBmjAhfn1XO8J6vG/9MeiL0IycyIuKrU
         2tb10IMyYKi7BQ8787s6VX/iv8SV5giBnUkgZxgCCUQi5MPWk8ZL+3MUattAxZUB7EG4
         706kQs9588CWrvbHZOQKg2WHO4QHPbQgrn5gZjPNpI07/Gy1ngrOnwVXs6IIMfYUxaq3
         wqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcKZWTF6/5VKzhgLl8yfeXlJLx5wO4XPxEewQrUIjRsXnlLcDjQq6IClCD0GRdE+3zdJ5RcZxXGPqvCAQ84KbfiYZhtTwdDYgBJzXHlQ==
X-Gm-Message-State: AOJu0YxwVwJCkAxe8aAN7qaH2nYdaMUwDIxDwYNo5EYDt/tBZv+ysdSI
	bk//Yz83C/3d2+RtGpfSzFSwHLIGJkPzH8mGRzYcJsRhKoLjn3pkxAknXkquVub0vE0bRVO7dCD
	EngUL+uD6nm3Pxl0A1W8r0IiaZrobHh0NH3yytkgw19FcrILjMxL3X/SHahz7IkE=
X-Received: by 2002:a05:600c:2805:b0:411:a5f9:26f5 with SMTP id m5-20020a05600c280500b00411a5f926f5mr10974wmb.38.1707950424305;
        Wed, 14 Feb 2024 14:40:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJPxLWaIZx311unv4D5LeFL6QRVjrs/qethDlI9UQEHWlU/k8z7sxXPYEJCZWf9jK5YYpPQQ==
X-Received: by 2002:a05:600c:2805:b0:411:a5f9:26f5 with SMTP id m5-20020a05600c280500b00411a5f926f5mr10943wmb.38.1707950423914;
        Wed, 14 Feb 2024 14:40:23 -0800 (PST)
Received: from ?IPV6:2003:d8:2f3c:3f00:7177:eb0c:d3d2:4b0e? (p200300d82f3c3f007177eb0cd3d24b0e.dip0.t-ipconnect.de. [2003:d8:2f3c:3f00:7177:eb0c:d3d2:4b0e])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b00410232ffb2csm43012wmo.25.2024.02.14.14.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 14:40:23 -0800 (PST)
Message-ID: <13f296b8-e882-47fd-b939-c2141dc28717@redhat.com>
Date: Wed, 14 Feb 2024 23:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] mm/memory: pass PTE to copy_present_pte()
To: linux-kernel@vger.kernel.org
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-13-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240129124649.189745-13-david@redhat.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29.01.24 13:46, David Hildenbrand wrote:
> We already read it, let's just forward it.
> 
> This patch is based on work by Ryan Roberts.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/memory.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index a3bdb25f4c8d..41b24da5be38 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -959,10 +959,9 @@ static inline void __copy_present_pte(struct vm_area_struct *dst_vma,
>    */
>   static inline int
>   copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
> -		 pte_t *dst_pte, pte_t *src_pte, unsigned long addr, int *rss,
> -		 struct folio **prealloc)
> +		 pte_t *dst_pte, pte_t *src_pte, pte_t pte, unsigned long addr,
> +		 int *rss, struct folio **prealloc)
>   {
> -	pte_t pte = ptep_get(src_pte);
>   	struct page *page;
>   	struct folio *folio;
>   
> @@ -1103,7 +1102,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>   		}
>   		/* copy_present_pte() will clear `*prealloc' if consumed */
>   		ret = copy_present_pte(dst_vma, src_vma, dst_pte, src_pte,
> -				       addr, rss, &prealloc);
> +				       ptent, addr, rss, &prealloc);
>   		/*
>   		 * If we need a pre-allocated page for this pte, drop the
>   		 * locks, allocate, and try again.

The following fixup for that device-exclusive thingy on top (fixing a hmm
selftest I just discovered to be broken).


 From 8f9e44f25087dc71890b8d9bd680375691232e85 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Wed, 14 Feb 2024 23:09:29 +0100
Subject: [PATCH] fixup: mm/memory: pass PTE to copy_present_pte()

For device-exclusive nonswp entries (is_device_exclusive_entry()),
copy_nonpresent_pte() can turn the PTEs into actual present PTEs while
holding the page table lock.

We hae to re-read the PTE after that operation, such that we won't be
working on the stale non-present PTE, assuming it would be present.

This fixes the hmm "exclusive_cow" selftest.

  ./run_vmtests.sh -t hmm
  # #  RUN           hmm.hmm_device_private.exclusive_cow ...
  # #            OK  hmm.hmm_device_private.exclusive_cow
  # ok 23 hmm.hmm_device_private.exclusive_cow

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  mm/memory.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 3b8e56eb08a3..29a75f38df7c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1208,6 +1208,8 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
  				progress += 8;
  				continue;
  			}
+			ptent = ptep_get(src_pte);
+			VM_WARN_ON_ONCE(!pte_present(ptent));
  
  			/*
  			 * Device exclusive entry restored, continue by copying
-- 
2.43.0


-- 
Cheers,

David / dhildenb

