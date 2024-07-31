Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B47E942E4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 14:24:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WpTzbINQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OHD7pNNI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYrqs3D81z3dC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 22:24:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WpTzbINQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OHD7pNNI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYrpn16Rxz3dFH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 22:23:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722428589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lfxTcnFebnrWlkOb97VAeZdiPmi1gpc/ztv0geOissE=;
	b=WpTzbINQHN1Fldow35KJ8Y3jyEmCvgee2wpAPND5zBBvCjUsSAyMF3d2mT6IpaXbg95yaH
	5YxqR9WMLd+JDjBWJaPkNMqAv5U/ZG17xDu2Dfl8XFS6A7/MFBjC3twyCby4D+QyaRUdqO
	A1OJ4VeBAPZjFIGqjRTpiBjhytNhQr8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722428590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lfxTcnFebnrWlkOb97VAeZdiPmi1gpc/ztv0geOissE=;
	b=OHD7pNNIOCCz3q9nmRk3i/QNNuHPNxEY8ctRaHQxVg5UpUqugDQWPFMmIyecjVLsiKLdaE
	87OIFQAdDEuM1ZwFrWWDGvQpwkAgyRexhcl5vZ0OiDDvv4jciDewYHvpKLx8oQODkZMf3i
	K5RIb8BcUf61/djFC1dT6JfKQJsXSsA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-kPY6XFSKOrCfl_CM1AadCg-1; Wed, 31 Jul 2024 08:18:29 -0400
X-MC-Unique: kPY6XFSKOrCfl_CM1AadCg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4281ca9f4dbso28365175e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 05:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722428309; x=1723033109;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lfxTcnFebnrWlkOb97VAeZdiPmi1gpc/ztv0geOissE=;
        b=TcOo/PWf9ifJ+fehyONmb/KMatZakQD/sLETcuen5dPuvMwFjYSxKH8TJe0RmOInak
         /Tj8eazDP3Oky3EvuBVo3hOG0W4RUm8jXp8gJGn64lq/e5JG7BBJP2YR9od3iOy6fzUf
         VB/yIv3FVCaRIX2DjNxZjv29Nj74Ere8L71eqjvHFn8QOFJW+UiGAsqvlSOdLoWRCO0m
         ac0yOwdTHc1dMLBn2QcRIdtvuQkkb4N592V6O8F8i9tvoKsF61jkqJW9xNeHnWPj9xOX
         2RxIn7E0mAOZ/9a1IHwqZx1dLjDeFGdi4M1hsrB1RBeZFFE40ceYmQkH6oSavOFMhc8i
         VoUg==
X-Forwarded-Encrypted: i=1; AJvYcCVXO/zusm9TrCvSU1HvVSeNE9Pl9Cyrw4iAqK1U/iMNkl+9r6vwWja3CBM5nOLSPQ4j+Jb5H1yua07rqco=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywbz7Yxtb08O8FCwY5fkgs+onrYWs/d4tma6Tx6ZacmY/AUlAA2
	7EVHTeSiNzvhnOo45bWiM9CUhvQ0Adz5kupNvkDbG+K9Ey1oC+CRiN6dmBmoAH3JNZ7X+DwkoXp
	DpDoxAvUqHoxmZwnA0AmYsUDLviXhMBbeFs5gnYvvQ8Qsya/XUpLVyC3GF8Qe3Lg=
X-Received: by 2002:a05:600c:4748:b0:428:1799:35e3 with SMTP id 5b1f17b1804b1-4281799370amr87275255e9.21.1722428308739;
        Wed, 31 Jul 2024 05:18:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjy90TRpI10k3uzmJp4x6xYArbwGo+0KGNBK+2d60CTkDKtfWsjnoTpqbansB0Zgz4mqaD3Q==
X-Received: by 2002:a05:600c:4748:b0:428:1799:35e3 with SMTP id 5b1f17b1804b1-4281799370amr87275025e9.21.1722428308281;
        Wed, 31 Jul 2024 05:18:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:5f00:9b61:28a2:eea1:fa49? (p200300cbc70b5f009b6128a2eea1fa49.dip0.t-ipconnect.de. [2003:cb:c70b:5f00:9b61:28a2:eea1:fa49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b5fec25sm19813185e9.0.2024.07.31.05.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 05:18:27 -0700 (PDT)
Message-ID: <added2d0-b8be-4108-82ca-1367a388d0b1@redhat.com>
Date: Wed, 31 Jul 2024 14:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] mm/mprotect: Remove NUMA_HUGE_PTE_UPDATES
To: Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20240715192142.3241557-1-peterx@redhat.com>
 <20240715192142.3241557-3-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240715192142.3241557-3-peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Alex Thorlton <athorlton@sgi.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15.07.24 21:21, Peter Xu wrote:
> In 2013, commit 72403b4a0fbd ("mm: numa: return the number of base pages
> altered by protection changes") introduced "numa_huge_pte_updates" vmstat
> entry, trying to capture how many huge ptes (in reality, PMD thps at that
> time) are marked by NUMA balancing.
> 
> This patch proposes to remove it for some reasons.
> 
> Firstly, the name is misleading. We can have more than one way to have a
> "huge pte" at least nowadays, and that's also the major goal of this patch,
> where it paves way for PUD handling in change protection code paths.
> 
> PUDs are coming not only for dax (which has already came and yet broken..),
> but also for pfnmaps and hugetlb pages.  The name will simply stop making
> sense when PUD will start to be involved in mprotect() world.
> 
> It'll also make it not reasonable either if we boost the counter for both
> pmd/puds.  In short, current accounting won't be right when PUD comes, so
> the scheme was only suitable at that point in time where PUD wasn't even
> possible.
> 
> Secondly, the accounting was simply not right from the start as long as it
> was also affected by other call sites besides NUMA.  mprotect() is one,
> while userfaultfd-wp also leverages change protection path to modify
> pgtables.  If it wants to do right it needs to check the caller but it
> never did; at least mprotect() should be there even in 2013.
> 
> It gives me the impression that nobody is seriously using this field, and
> it's also impossible to be serious.

It's weird and the implementation is ugly. The intention really was to 
only consider MM_CP_PROT_NUMA, but that apparently is not the case.

hugetlb/mprotect/... should have never been accounted.

[...]

>   
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index 73d791d1caad..53656227f70d 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1313,7 +1313,6 @@ const char * const vmstat_text[] = {
>   
>   #ifdef CONFIG_NUMA_BALANCING
>   	"numa_pte_updates",
> -	"numa_huge_pte_updates",
>   	"numa_hint_faults",
>   	"numa_hint_faults_local",
>   	"numa_pages_migrated",

It's a user-visible update. I assume most tools should be prepared for 
this stat missing (just like handling !CONFIG_NUMA_BALANCING).

Apparently it's documented [1][2] for some distros:

"The amount of transparent huge pages that were marked for NUMA hinting 
faults. In combination with numa_pte_updates the total address space 
that was marked can be calculated."

And now I realize that change_prot_numa() would account these PMD 
updates as well in numa_pte_updates and I am confused about the SUSE 
documentation: "In combination with numa_pte_updates" doesn't really 
apply, right?

At this point I don't know what's right or wrong.

If we'd want to fix it instead, the right thing to do would be doing the 
accounting only with MM_CP_PROT_NUMA. But then, numa_pte_updates is also 
wrongly updated I believe :(


[1] 
https://documentation.suse.com/de-de/sles/12-SP5/html/SLES-all/cha-tuning-numactl.html
[2] 
https://support.oracle.com/knowledge/Oracle%20Linux%20and%20Virtualization/2749259_1.html

-- 
Cheers,

David / dhildenb

