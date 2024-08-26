Return-Path: <linuxppc-dev+bounces-540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E806A95F4FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 17:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsvfy4pMzz2y7J;
	Tue, 27 Aug 2024 01:27:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724686026;
	cv=none; b=ZnyyazXXGHI9YZkwzxVoyOnFs8Tb1iQv8k3Nf5Qzz9Wp9BZC5yo3dzan5vFSKMv3WqU5CTIOi1vQ04av7IBhzLRZYz0HNObcxgGhckgqxW1x/Fm3eD2CXWvE9QBnQ72xIuCjRMJThxxW2t14p4t0g0GZtaNvNCJl+Vz9nDK4qW8q6cCE8UTzFwnPLe0uxp3iPcMFBDyyCKTGhaLKFJ3MP/yZGinruu74IqD/CYTZ4EMEBdCS5TENyflb7LS65HrN+fT4pTOBDPu/WzjPyolIRTkmEWQt0cJyQRsotjPQu9YxOXcpWTKUM2/XqMPhyCZMRzRyhvdCxvKmXh1CHAFMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724686026; c=relaxed/relaxed;
	bh=hR+Akr9YWsoJTBZs851mAQJ1H/l3mr5q9WxzD4AcF4s=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Autocrypt:Organization:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding; b=WzGGK920r67swMqmO5jaueYjFAPCouXIO27zyolSnTs9QDraxR7KU5Pd2qEvOGbikOgGhFs6XSuHOKeLqBskkgBmdBMJqcmFuBHeYDUEoNPsrK0wPu1I9FnKiQZS3FVZ1egoYppgzZaBoq17jZq8uk0mN2V4fJP5t+zzltOGAG4Tlqrl6OQ46WaNuUSXgKBt1OyUIOZ80YZET8VC4T8/VNdyCeM6r25jxslrE/IfWiXovbIEoEB0Zgi5NLarxPKMvO4G2sFGpHAVUc1nZvDVAeD5hu8HSxwG4UosFpGBdcduPjUzJPIPHV4qCWYAmdIEWHIGMs6stO9mejy3WZVRdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ENhEXh2l; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ENhEXh2l; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ENhEXh2l;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ENhEXh2l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsvfy1KRgz2xxw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 01:27:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724686022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hR+Akr9YWsoJTBZs851mAQJ1H/l3mr5q9WxzD4AcF4s=;
	b=ENhEXh2lbMcFICmSkLLxxOKOOy8mv5e8HI8JBivZU6NI1JjT2HEODCo9Nca4YzdCDIVx5w
	U9jBG19gkK8oAxI+OOhgGxnyg74oCDepocLSLrvopN8KhhmRJjXdVwr68+11butP93PHIx
	VFYwnRQbLGVmO8TOQYSw6r4KlDaesBQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724686022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hR+Akr9YWsoJTBZs851mAQJ1H/l3mr5q9WxzD4AcF4s=;
	b=ENhEXh2lbMcFICmSkLLxxOKOOy8mv5e8HI8JBivZU6NI1JjT2HEODCo9Nca4YzdCDIVx5w
	U9jBG19gkK8oAxI+OOhgGxnyg74oCDepocLSLrvopN8KhhmRJjXdVwr68+11butP93PHIx
	VFYwnRQbLGVmO8TOQYSw6r4KlDaesBQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-N56CxuAzMU66zdmUzu35QA-1; Mon, 26 Aug 2024 11:27:00 -0400
X-MC-Unique: N56CxuAzMU66zdmUzu35QA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4280f233115so41854985e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 08:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724686019; x=1725290819;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hR+Akr9YWsoJTBZs851mAQJ1H/l3mr5q9WxzD4AcF4s=;
        b=haXXt4qAu5zMMpT29y8mof1hokMB3OGXy1v7RD+bykde9sYzhCrfd2U7JlQI9Ko1LI
         0zLvs/HhEVJ6LKfsIOyEewlAo1cqzVhkgG0mM8d3nvrU6AUE3q6rYZnRB6mt9PVeXPSY
         XjNs3qd3xwTWE6Ri3b0A0An+GnuExs2z8kr7gtQaVgOw6MJZUyWAm9bdp+J67gz+UBJM
         6ocKQ1KrFybJZPgCkxJIUre0LXJyDnoa1O1LWfxHJdjBxTZlVq4gJTZaX+KDZiW7Ub2k
         7CFajmbOD8QYT/VhqQ2+d8EdUdKW+94S206nXWD11hA0C85mvz8Z1ZYaMdKLnKke3ua7
         /vqA==
X-Forwarded-Encrypted: i=1; AJvYcCUYSuZaMlrMTdDfb9RDFmjzyH+026TPy8oOdlHpen3YvQG+ZhGyik7cNGFaMTrYADowMndgTtTdmnJMqvM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAAQoT0xZ2hP/CmWzffCXAbiZvNJilHq8bYtIKCWQnf6hGeUhR
	p2Gt5nXxr9MI+GPWjiGjlBjQJ81Hl69AFdJIB+UnQNGAEs6oEFwQWouL41U2gBOheOuk8ZYIoPP
	uh2enwDo0Nl9QjoIGtXe0mQnUBSDZeE6CG76sBpkrnfgsTEsIRyqfK2M+qfwOYvI=
X-Received: by 2002:a05:600c:a01:b0:426:6f0e:a60 with SMTP id 5b1f17b1804b1-42acd57b683mr71398205e9.17.1724686018758;
        Mon, 26 Aug 2024 08:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL26zEvaE9x4Y8E/1fGQyz00aSNDZBMSxihsSd1bwRQ2Nt/7nonJyiEDJ8zLCLCIUUJU6hNA==
X-Received: by 2002:a05:600c:a01:b0:426:6f0e:a60 with SMTP id 5b1f17b1804b1-42acd57b683mr71397925e9.17.1724686017969;
        Mon, 26 Aug 2024 08:26:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c737:1900:16b0:8dc:77e:31af? (p200300cbc737190016b008dc077e31af.dip0.t-ipconnect.de. [2003:cb:c737:1900:16b0:8dc:77e:31af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac624bb23sm156716575e9.32.2024.08.26.08.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 08:26:57 -0700 (PDT)
Message-ID: <77f3f5ce-dd12-4ca2-90cd-0f2226fe26ba@redhat.com>
Date: Mon, 26 Aug 2024 17:26:55 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] arm: adjust_pte() use pte_offset_map_rw_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>, hughd@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <7915acf5887e7bf0c5cc71ff30ad2fe8447d005d.1724310149.git.zhengqi.arch@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7915acf5887e7bf0c5cc71ff30ad2fe8447d005d.1724310149.git.zhengqi.arch@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.08.24 09:13, Qi Zheng wrote:
> In do_adjust_pte(), we may modify the pte entry. At this time, the write
> lock of mmap_lock is not held, and the pte_same() check is not performed
> after the PTL held. The corresponding pmd entry may have been modified
> concurrently. Therefore, in order to ensure the stability if pmd entry,
> use pte_offset_map_rw_nolock() to replace pte_offset_map_nolock(), and do
> pmd_same() check after holding the PTL.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   arch/arm/mm/fault-armv.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
> index 831793cd6ff94..de6c7d8a2ddfc 100644
> --- a/arch/arm/mm/fault-armv.c
> +++ b/arch/arm/mm/fault-armv.c
> @@ -94,6 +94,7 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
>   	pud_t *pud;
>   	pmd_t *pmd;
>   	pte_t *pte;
> +	pmd_t pmdval;
>   	int ret;
>   
>   	pgd = pgd_offset(vma->vm_mm, address);
> @@ -112,16 +113,22 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
>   	if (pmd_none_or_clear_bad(pmd))
>   		return 0;
>   
> +again:
>   	/*
>   	 * This is called while another page table is mapped, so we
>   	 * must use the nested version.  This also means we need to
>   	 * open-code the spin-locking.
>   	 */
> -	pte = pte_offset_map_nolock(vma->vm_mm, pmd, address, &ptl);
> +	pte = pte_offset_map_rw_nolock(vma->vm_mm, pmd, address, &pmdval, &ptl);
>   	if (!pte)
>   		return 0;
>   
>   	do_pte_lock(ptl);
> +	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
> +		do_pte_unlock(ptl);
> +		pte_unmap(pte);
> +		goto again;
> +	}
>   
>   	ret = do_adjust_pte(vma, address, pfn, pte);
>   

Looks correct to me, but I wonder why the missing pmd_same check is not 
an issue so far ... any experts? THP on __LINUX_ARM_ARCH__ < 6 is not 
really used/possible?

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


