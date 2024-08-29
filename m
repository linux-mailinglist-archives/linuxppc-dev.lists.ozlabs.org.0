Return-Path: <linuxppc-dev+bounces-743-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9C3964273
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 12:59:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvdZx5L5Jz2ytN;
	Thu, 29 Aug 2024 20:59:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724929177;
	cv=none; b=TDDJDac4c4SGvf8fAMTx/FxrUab5LK0+tLNGB57SD9engXSn57kD1W+IQegXVDPfj5ZcquUxMwwu+/KwgNDziwBGoTA61xILdb4a/isos4Hu3H8C/Va25QZSNnh5HfWgBHsXLGRI6pg8SwIGFtlRLsMKO9pKnqrl79XMvd//TLFMed5KUKzRKAQVp4RwpInOfrEZIOqzeKcORWJtUbi9eCBg9qJiyJnx3JD5Le4vr1LD4kvi2gbS7xgB3ShBcxdV66OP9Gc7Fvpc4oSzYZHHDxFXLuI7uyUfCmiaUem+qWVtQBmGnXIVAn5mkQwBLEsdFGxSbRHpqKG/vSk/h8r7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724929177; c=relaxed/relaxed;
	bh=AkCs8X+rOG2k0a+0P5TyFf8pKHMHEP/2u//VabkdfQg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=BIPZ9a6PUZV5JROukAiJTGrY5g1aJueRV/SBGcBKUcypb+TKT1+Bi509KdFNj4++di2IeEVVQ9BhynFekLgIQm/u+ms8doPZeZNKNdelTnvSgu4ejr2QaIkD+R7FTmCpr/BKn+Wi8bujgYBs48pI8S/S5YC/DSJ1qBvoWbqf+r2Ml8+IvUlrCuuK4CbOYkoljVCbQfSUMHwker5XbKrPAfymFVQQfyykwN/CGs2Q8M6d/0Cca0BaztAv1DXCvf+ECKi8/4nmJ3p82k6aooZiuJxMyc1B/ooiH1aUyOTtDMzLgZ4T+dNvURaJYejW5gToaddqCnotuYG1rpX16aJG4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BHM/x7yn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BHM/x7yn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvdZw44j9z2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 20:59:34 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-714186ce2f2so452327b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 03:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724929169; x=1725533969; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AkCs8X+rOG2k0a+0P5TyFf8pKHMHEP/2u//VabkdfQg=;
        b=BHM/x7ynwp51zjrFFTh6B6yQWjNHngDNb5U5yKsb30e4ReDz35Pd4YukZzY6e/LCET
         H/gmAFrDv0AUuts3/qD2NW9dx+uZfDg7/utStMTESnfkCBmknmWFIv/rPxcbOK2S7btN
         2myewJhp35kx1RMicOTWP+mpbBGojxJFF0M8YQyrFGu4berjWPHEJ4RW0AlhrRQIIzKi
         SLHXI/5BQD9xxpPixGKRBnuBPJjSm19lVEXmIrtV009dOTyLvjR5V98A3dVCX9n0NWQs
         LKxOyxO124gbr3O8jagKMQBtC9769kWhde2vpHYQjk1pa8bMgrB88EkAPefY6Jc17kDs
         10/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929169; x=1725533969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AkCs8X+rOG2k0a+0P5TyFf8pKHMHEP/2u//VabkdfQg=;
        b=ExI5myDilIHlTE6/7u/CnF3MbajsSEGJYtiTV2qHm2kPBID2cC5hdaD5depGJxiD36
         WkgWR94pckAj47NENzZMNWtp2EZnP46E/k2aQe1kfc6s02NlOkAFBzgdz7UBGieqBIDp
         yaSjPl+QV3330+z8YP70YjhD+7oAKHbWgXxBHZgbf6yveUoFbtZTV85Ry2dKl6CeXIJg
         8GGeGAtUOAidzyGlH0OiflFv7d+sWpic57kk+9E79rPP7BVrFkjiWYk1GBnJdg4V3iCX
         PUDAoKsN3IPNTDpVpmZ4LSYhULvaA3vuCTIiZRibWINMpI1jJzS4W9U9dLawBjzn0llQ
         Ts/g==
X-Forwarded-Encrypted: i=1; AJvYcCWAxmDN/+I+gN5VA8jCeFteMySfxlsvU9DGVr7JoeYlrFoVkAcrirPrKPvyXh2Z8FSkWmPoH0sje71tv6s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz24CTOvKfmPjl2tH+JmZGJvFOiqC5rmdEb4pZkRa4nHwy6Y+D3
	jN7lP+U5p0UndVft0tHAdkye+bjuYrBMJWe7gHmX1VkOCjX3VTkcsZtNCR09kFw=
X-Google-Smtp-Source: AGHT+IHFavp3iD65n8I4MxM7X0z+O7YmVJGdY6pd4itbZCENaYUbQg/MTJWkKQgP47jm0Y5MTqQ9gg==
X-Received: by 2002:a05:6a20:6f08:b0:1c6:ae03:6607 with SMTP id adf61e73a8af0-1cce0feac29mr2109334637.6.1724929169241;
        Thu, 29 Aug 2024 03:59:29 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e57629f4sm881857b3a.205.2024.08.29.03.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:59:28 -0700 (PDT)
Message-ID: <63ef0611-50c2-49b5-ba3f-c6ea81f9fbce@bytedance.com>
Date: Thu, 29 Aug 2024 18:59:21 +0800
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
Subject: Re: [PATCH v2 01/14] mm: pgtable: introduce
 pte_offset_map_{ro|rw}_nolock()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, muchun.song@linux.dev
Cc: hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <e866151ccd257ca14a9361ba59f8c3086aa76e4f.1724310149.git.zhengqi.arch@bytedance.com>
 <f318f65d-4198-481c-98a0-00415664614c@redhat.com>
 <4481a0e4-a7a5-4223-a8ab-d1215d7c6352@bytedance.com>
 <42aba316-2b01-4fdb-9aff-9e670aac4c6e@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <42aba316-2b01-4fdb-9aff-9e670aac4c6e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/8/28 18:48, David Hildenbrand wrote:
> On 27.08.24 06:33, Qi Zheng wrote:

[...]

>> sufficient AFAIUK.
> 
> Drop the "AFAIUK" :)
> 
> "For R/O access this is sufficient."
> 
>>
>> pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
>> pte_offset_map_ro_nolock(); but when successful, it also outputs the
>> pdmval. For R/W access, the callers can not accept that the page table
>> it sees has been unmapped and is about to get freed. The pmdval can help
>> callers to recheck pmd_same() to identify this case once the spinlock is
>> taken. For some cases where exclusivity is already guaranteed, such as
>> holding the write lock of mmap_lock, or in cases where checking is
>> sufficient, such as a !pte_none() pte will be rechecked after the
>> spinlock is taken, there is no need to recheck pdmval.
> 
> Right, using pte_same() one can achieve a similar result, assuming that 
> the freed page table gets all ptes set to pte_none().
> 
> page_table_check_pte_clear_range() before pte_free_defer() in 
> retract_page_tables/collapse_pte_mapped_thp() sanity checks that I think.

Since commit 1d65b771bc08, retract_page_tables() only holds the
i_mmap_lock_read(mapping) but not mmap_lock, so it seems that
holding the write lock of mmap_lock cannot guarantee the stability
of the PTE page.

IIUC, I will also perform a pmd_same() check on the case where the
write lock of mmap_lock is held in v3. Or do I miss something?

> 
> In collapse_huge_page() that is not the case. But here, we also 
> currently grab all heavily locks, to prevent any concurrent page table 
> walker.
> 
>>
>> Note: "RO" / "RW" expresses the intended semantics, not that the *kmap*
>> will be RO/RW protected.
> 
> 
> Good. Please also incorporate the feedback from Muchun.
> 

