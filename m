Return-Path: <linuxppc-dev+bounces-541-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4766D95F507
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 17:28:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsvhg1rswz2yDr;
	Tue, 27 Aug 2024 01:28:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724686115;
	cv=none; b=l2r5vJbk8nDlMILn0KXMx7d9YihBrSSh/vcbkt1/keoABo++jZmEIdNMO80+yyxOYp5K+lFJIHkDQ5ex7NzZEkOE9ayp1wJsFu4FDWd2dOU0mN40a1/csBTXUpijvNQ8t8SJd3D45+wPYPcDbKouctOq3vzDtOKxkIFXrocg/sMaTjBd60/r132rjz2Etta64IWJK+iCCRMQZcMYzEmhtqfNyBNThwT2sxwCwOaWBMjO0l6oGRiJ+zT92jJPHMz23naHYfPY9W9roO4KLqjhWjpKqNITSZ4nrJOFXF0n1ZvZfXLG1A6tZhky6IVvhDMxbAJL7rDeeSD7L00F2LJrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724686115; c=relaxed/relaxed;
	bh=/0/D/mqx8S/GSlZdjVOSgTAjgr7RwUJb4ayF8dILTNw=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Autocrypt:Organization:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding; b=FiiLBC+TCJbvb31Y/HSCapHneeYsbX75Rc4HQnIW4QIGD9SJ+O6Z4QsiFyTB2OqDqIuehGdS/PQYsA3YwBGp3rH2r+w0bPRMty7v4+BH9jThLVQprhdGS+qOiSbk3C4YmTmXt4JuQli6XE+ecphpLeAmoKEnyzxViqYhIUrvm+IVLWZXwh8Ln3tP9fYRIcXnavH5cMuKzCaK/hrNV+vYF+9rK5YxJ5SIcMokshFQBT5GZEd79u2Hm8IUevcRq1wraaakDgBhsJAcRmiLYykoeZsIABf5tvdfmITHAGw9mDbhb+AoBUR5khaug3toD77q2fK1gtVdUBdEjiKVER1Lmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VwkRvTp+; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VwkRvTp+; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VwkRvTp+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VwkRvTp+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsvhf5SNVz2xxw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 01:28:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724686111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/0/D/mqx8S/GSlZdjVOSgTAjgr7RwUJb4ayF8dILTNw=;
	b=VwkRvTp+t6Q9CD4JlaY3urzV8meUhd4UWQM0+Bo52FnFLyCgMUgqxfvx6Vc5f9oGwLA8x1
	f12HLy2mEPSEizdamglXKfhUmR+Ly2JJ+3k/4dxSoCnEPcxYlw2zkz5KPOwFatXjZWLuhn
	nHCfZYlFJywbsSWpInIInIF68UgqCnc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724686111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/0/D/mqx8S/GSlZdjVOSgTAjgr7RwUJb4ayF8dILTNw=;
	b=VwkRvTp+t6Q9CD4JlaY3urzV8meUhd4UWQM0+Bo52FnFLyCgMUgqxfvx6Vc5f9oGwLA8x1
	f12HLy2mEPSEizdamglXKfhUmR+Ly2JJ+3k/4dxSoCnEPcxYlw2zkz5KPOwFatXjZWLuhn
	nHCfZYlFJywbsSWpInIInIF68UgqCnc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-oPYVob1lOOmX2KNKf-1vPw-1; Mon, 26 Aug 2024 11:28:30 -0400
X-MC-Unique: oPYVob1lOOmX2KNKf-1vPw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-367990b4beeso2293481f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 08:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724686109; x=1725290909;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/0/D/mqx8S/GSlZdjVOSgTAjgr7RwUJb4ayF8dILTNw=;
        b=M4wVDU+dfzusAXxjiZpZ0HA79evbhkL2SvylqDMdJ/FiXp1bUd2S0kK+WF5YO3a8tv
         UqSC8BEt16tGWNAd7B2N0rs7R3rVX6rm9A6itMeITiy5GsouT0YOh8+cUviPbj08fEgR
         HJFkmDWIZFPpeHDMqsvu/WzL3K0IBvvxO3p8FeFurJJTvMl90unOySqEdMNB4oMK2jbW
         hzM54RDinfT/bLRndE54vL2yrLDa0kxqcbTAw8BtuXz/NlMC1pMEdAjXRcZIohi5ae7L
         15o/j2BYWhGD2gMC4+R/IRdohFUlVeFYepYMe+t/o+BM7deCSJ2NM9A73R6ZMu2OsDr7
         +ydA==
X-Forwarded-Encrypted: i=1; AJvYcCVnLFmfZ3oRKWiY9xuxnaLPAkNV7bs3Xc5+LbrLzyv7A8wph6yidZv4Infw0PagV81aLcFpSdk9lRacAB4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw5wEBIm8J+mZeKhZvF15dM4oIRQNEPf+aP4LYUC76BQVsVTcHJ
	ujNpo3IzBlANpIW0xReGcAr+G1QvcO66fKQDpV8rebrbUR+dxAkX/l++kIyRKrcXhM6lYj3/cWW
	WqLg3Hx6S9mhQFgDjRm8xP7CICg6HFF0pO66/SKAlbQqbMbs/CEjCbI7vNQHOAsc=
X-Received: by 2002:adf:e512:0:b0:371:8682:467e with SMTP id ffacd0b85a97d-373118d0bd7mr6501069f8f.46.1724686108900;
        Mon, 26 Aug 2024 08:28:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuJF3qiUb+lUyCxaaobbsWcSjJJvrd35TRHfa7m+0xI9NSwN4+kDr5E4Gf+YbVT31YWsDeqw==
X-Received: by 2002:adf:e512:0:b0:371:8682:467e with SMTP id ffacd0b85a97d-373118d0bd7mr6501036f8f.46.1724686108008;
        Mon, 26 Aug 2024 08:28:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c737:1900:16b0:8dc:77e:31af? (p200300cbc737190016b008dc077e31af.dip0.t-ipconnect.de. [2003:cb:c737:1900:16b0:8dc:77e:31af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abed8b6a8sm197305465e9.2.2024.08.26.08.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 08:28:27 -0700 (PDT)
Message-ID: <0cc7b49c-8e6a-459a-8541-eea6d15f8e5b@redhat.com>
Date: Mon, 26 Aug 2024 17:28:25 +0200
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
Subject: Re: [PATCH v2 03/14] powerpc: assert_pte_locked() use
 pte_offset_map_ro_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>, hughd@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <89ae94f722996b4ee7ef20d44cd7f5e2f0495c47.1724310149.git.zhengqi.arch@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <89ae94f722996b4ee7ef20d44cd7f5e2f0495c47.1724310149.git.zhengqi.arch@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.08.24 09:13, Qi Zheng wrote:
> In assert_pte_locked(), we just get the ptl and assert if it was already
> held, so convert it to using pte_offset_map_ro_nolock().
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   arch/powerpc/mm/pgtable.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 7316396e452d8..61df5aed79894 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -398,7 +398,7 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
>   	 */
>   	if (pmd_none(*pmd))
>   		return;
> -	pte = pte_offset_map_nolock(mm, pmd, addr, &ptl);
> +	pte = pte_offset_map_ro_nolock(mm, pmd, addr, &ptl);
>   	BUG_ON(!pte);
>   	assert_spin_locked(ptl);
>   	pte_unmap(pte);

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


