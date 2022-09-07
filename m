Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9735B0D4E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 21:35:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNCBx0p8Pz3br9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 05:35:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b4E/bKw9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b4E/bKw9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b4E/bKw9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b4E/bKw9;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNCBB593vz2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 05:34:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662579260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7MsVI8c1fxq0sSSjaJXYEOch1npprYIC2451+xAyYa0=;
	b=b4E/bKw9gcIbXNBPHperZshHaMNC/lbaC6w+8/032/sz9NqJAELulu+TTHamO44gehi6c+
	Wr0U44JIOB3YjDmNf7BQXyAwvkngQRje2flD7Hw2XaJBpDnbC5o7IYehhH9nwxwPBSj5m2
	Qdqv0gSjadZdTlC11mYc2zeYpzw5UCI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662579260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7MsVI8c1fxq0sSSjaJXYEOch1npprYIC2451+xAyYa0=;
	b=b4E/bKw9gcIbXNBPHperZshHaMNC/lbaC6w+8/032/sz9NqJAELulu+TTHamO44gehi6c+
	Wr0U44JIOB3YjDmNf7BQXyAwvkngQRje2flD7Hw2XaJBpDnbC5o7IYehhH9nwxwPBSj5m2
	Qdqv0gSjadZdTlC11mYc2zeYpzw5UCI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-naky-qdtNZGDKfkiZZ8IMQ-1; Wed, 07 Sep 2022 15:34:19 -0400
X-MC-Unique: naky-qdtNZGDKfkiZZ8IMQ-1
Received: by mail-wr1-f72.google.com with SMTP id b17-20020adfc751000000b00228732b437aso3279251wrh.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 12:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=7MsVI8c1fxq0sSSjaJXYEOch1npprYIC2451+xAyYa0=;
        b=Q0CjLE/z4gZh65jnCbMLbkCrFczn9hwfRofFtCIvRAToDyvOsZqgCVHWw7RvPuLGV6
         EPFaALZuC2GlSNWppjmQJ15aoFG9+i5hlt5brvuoqKxnWE3xjWB17dajO6cSEsfD6zCd
         J9CdPTWeoIA6b6RqxS/oHsZ0Mb7VC4SwNzn/OvWol0DsMpnViMGtv5ro17BDwsDpmUJy
         de5qO+X4kaR8IeJnccLHsp2yDlp+mj+TYsRpDiv3mN91Nt4LMTAnsvQoKYu9dX0AP3H0
         1hVLRNQx6ckinGWDUtL9/oK/VzKqVm+T2TW9TeeMq5FuIYATFRTtow/WI4Yaz5SXF1Ce
         lTog==
X-Gm-Message-State: ACgBeo2FEFoW9g5BiUBzmrp7K+VJHk1tekpjejiasFJQWSDs7FmlM22o
	DsERoWSAKIqt0VrPQ8odqGfJbrAPzif7UV1rNZITOB6Oy/ojMUKlXjIlOEYdp3JgpIEABDJE24l
	OlPdDI8JlCeHA770R1vI7r9wYkw==
X-Received: by 2002:adf:e9c2:0:b0:228:62a5:a59b with SMTP id l2-20020adfe9c2000000b0022862a5a59bmr3023775wrn.47.1662579257739;
        Wed, 07 Sep 2022 12:34:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR47W6WNql5ZeWImeEUS0k3WgwW8frzlFbU39PqtW0jo90OD5KShj425J9bGCwCzIr1xpbbM3g==
X-Received: by 2002:adf:e9c2:0:b0:228:62a5:a59b with SMTP id l2-20020adfe9c2000000b0022862a5a59bmr3023766wrn.47.1662579257500;
        Wed, 07 Sep 2022 12:34:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0? (p200300d82f0dba00c95131d7b2b08ba0.dip0.t-ipconnect.de. [2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0])
        by smtp.gmail.com with ESMTPSA id bz9-20020a056000090900b0022584c82c80sm19260207wrb.19.2022.09.07.12.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 12:34:17 -0700 (PDT)
Message-ID: <684b9004-fad2-3727-b215-a4b2bfe36712@redhat.com>
Date: Wed, 7 Sep 2022 21:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [v2 PATCH 2/2] powerpc/64s/radix: don't need to broadcast IPI for
 radix pmd collapse flush
To: Yang Shi <shy828301@gmail.com>, peterx@redhat.com,
 kirill.shutemov@linux.intel.com, jhubbard@nvidia.com, jgg@nvidia.com,
 hughd@google.com, akpm@linux-foundation.org, aneesh.kumar@linux.ibm.com
References: <20220907180144.555485-1-shy828301@gmail.com>
 <20220907180144.555485-2-shy828301@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220907180144.555485-2-shy828301@gmail.com>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07.09.22 20:01, Yang Shi wrote:
> The IPI broadcast is used to serialize against fast-GUP, but fast-GUP
> will move to use RCU instead of disabling local interrupts in fast-GUP.
> Using an IPI is the old-styled way of serializing against fast-GUP
> although it still works as expected now.
> 
> And fast-GUP now fixed the potential race with THP collapse by checking
> whether PMD is changed or not.  So IPI broadcast in radix pmd collapse
> flush is not necessary anymore.  But it is still needed for hash TLB.
> 
> Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Yang Shi <shy828301@gmail.com>
> ---
>   arch/powerpc/mm/book3s64/radix_pgtable.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 698274109c91..e712f80fe189 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -937,15 +937,6 @@ pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addre
>   	pmd = *pmdp;
>   	pmd_clear(pmdp);
>   
> -	/*
> -	 * pmdp collapse_flush need to ensure that there are no parallel gup
> -	 * walk after this call. This is needed so that we can have stable
> -	 * page ref count when collapsing a page. We don't allow a collapse page
> -	 * if we have gup taken on the page. We can ensure that by sending IPI
> -	 * because gup walk happens with IRQ disabled.
> -	 */
> -	serialize_against_pte_lookup(vma->vm_mm);
> -
>   	radix__flush_tlb_collapsed_pmd(vma->vm_mm, address);
>   
>   	return pmd;

Makes sense to me

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

