Return-Path: <linuxppc-dev+bounces-793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A99657C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 08:42:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww7r30mqLz3054;
	Fri, 30 Aug 2024 16:42:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725000163;
	cv=none; b=nX4EBNnLBSQAAK53VjXrXnjEXp8WkhkkUym32BDHIIZ90g8k2pG6r/pvODr1K+qMTyyDiBmFWgifEdL+k5zPhMi/kLbUUWdvyh1x4UXvMDX7bgtLFKvUh4Ww4CSyyVtGNtlmL3xzFDi3bQ4Fj9bSHhoOOqefHhSKEtgCrKwO/QBd2B1c300E1wPG1IgNoA1Goryvbp8etvbENpqaVBV81H7yjfGR4E59hIG6Cq7Uy1f65SwsR6VBaeuurYJPDB3Ttorb589UJTNJp362malzpR8Rbd6SOuDevgXZOZbJE5BJ5tuMUQOocThAWgSVhfp7uqJWA78CMLPy+e6OUDhv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725000163; c=relaxed/relaxed;
	bh=sAPIQ+0oTzbZ3F2sniQtCFwQ1sSVebQi1669/F3+Skk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=Okjc4d9YDT1g8AEEbCm3fMUURXnPn8o7vq41EZOC9EyUvADBE+f4lVzftc+2ILGjhTzAxttCj4H3Bgl1GrcJ14cyU47NSap1D8JMifJSnjJIPPDjwWrvW/lztUGTAH3onQOUEsFAaoEyyBeffUpJnpkouFlWOFvP2yBlPwE1pT0Px59aBrtKq8Iwb2JUcfYjmVVv1qTY/YTitn1uqzd4KJJiXWsm6xuH3vjLI8RVqXzO38j9Gq5/RKd7Y/wMe5CX/LFsEVcZYE51zelzwpd9tKwtJDD1Ts/+wKZ3tXztoHllbxV3xUSvSiQgSpVvQL7v8qlUWdrPRVX1qlrFAyDU6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BCtEQ/Ay; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BCtEQ/Ay;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww7r25VDCz304B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 16:42:42 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-6bce380eb96so831866a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 23:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725000160; x=1725604960; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAPIQ+0oTzbZ3F2sniQtCFwQ1sSVebQi1669/F3+Skk=;
        b=BCtEQ/Ay6KiaInJES/j06WYdn1LIz0mcanHHSDNCF24moOH2H+Kj8fVmC8IgeUVPJe
         Ivl8IS458EPiVkIo/ObX3xU2SnR1sOSc7q6SPnmPC48zt6LOWIRMBPvqAlqOmRlHHuqg
         aRm0g9SyWikHErm2+5w3OVIeZbjpt8hLCQD9gJZgJCP5LMSsdl4s3p1w0V9hdczcA7cO
         bINFWo3+7/B25YtEnzune4x/de6Fcx+f0jEPoXtsaFAsJfy/EC/ExW9CU/tnCiP15aEi
         Oty/T04yn6ZBH2/DyN7oWIYw/8WU6atOU9ulixxwfq37y9TQrc9Yw+0qm5jGU9AmYQiU
         T1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725000160; x=1725604960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAPIQ+0oTzbZ3F2sniQtCFwQ1sSVebQi1669/F3+Skk=;
        b=WmJvQO8VXxx9LhmLjvvn3+B18DQfIu8hXIfrP/hSprmrGM0s6mgxAwKYn99Ha3FJsj
         whtPYB1a8/0P2lLdRB9m7bfoTjG8zGDt2ul+YZNQ8glju442DgksIcTJk/vVx9ZDMGpS
         eCw1QjyI0k0CeiqK39CdaTf/qQX6I6Olz/3TtxvAFnLe1rMENBeoX/ZZ09Wyka5Reyjx
         CmEwgHOXPoewKgh/51cUwdHzOaso7/t/2ezHHBm+qwoFVmVHUzy2Z3vPRUAM39SALdg8
         mZUYZOrw9pYG6gVDzEoejB/9BLjc0tOWYbcL1s1qPtTOjMrq0tGAzHJ3/2fgwntRox4J
         OAAw==
X-Forwarded-Encrypted: i=1; AJvYcCWTBUN85RU4W+BcDP05YSu8qZNd8Luqqv7AWazSJxEhRZP/7llQlyDqjrjtB2afDO4MbsQHeFrRRdaakTY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzj7MPl+YBzbUYhIG5LSm5/C2kZB3j9LiypxkE84C2kM2YNbbQX
	QWuaSlYtmmRB8y+uzexHgq/bCNVvfFs2VaRgOHQ5tlSo7ydnwbWGWFlVPksGjJ9Dyp2MDDXql5N
	0
X-Google-Smtp-Source: AGHT+IFX6MWdATn3PHJECm84KknThK0jKPALrJmyAm2CUCVW6pc6Pf0GS8/g/1o4RkhLk/GIua405Q==
X-Received: by 2002:a17:902:da90:b0:1fd:8c25:415d with SMTP id d9443c01a7336-2050c3d2a05mr57644625ad.36.1725000159781;
        Thu, 29 Aug 2024 23:42:39 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b14c4sm20794075ad.46.2024.08.29.23.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 23:42:39 -0700 (PDT)
Message-ID: <fe146c6c-60e6-4ff1-bb93-6c818f71b3de@bytedance.com>
Date: Fri, 30 Aug 2024 14:42:30 +0800
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
Subject: Re: [PATCH v2 08/14] mm: copy_pte_range() use
 pte_offset_map_rw_nolock()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: hughd@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
 vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <71100c3867c4cf6f5f429ce9f2db8432066d0e99.1724310149.git.zhengqi.arch@bytedance.com>
 <4101a941-6286-4128-a16c-29c7cffcbe8c@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <4101a941-6286-4128-a16c-29c7cffcbe8c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/8/29 23:36, David Hildenbrand wrote:
> On 22.08.24 09:13, Qi Zheng wrote:
>> In copy_pte_range(), we may modify the src_pte entry after holding the
>> src_ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
>> already hold the write lock of mmap_lock, there is no need to get pmdval
>> to do pmd_same() check, just pass a dummy variable to it.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   mm/memory.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 7b6071a0e21e2..30d98025b2a40 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -1083,6 +1083,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, 
>> struct vm_area_struct *src_vma,
>>       struct mm_struct *src_mm = src_vma->vm_mm;
>>       pte_t *orig_src_pte, *orig_dst_pte;
>>       pte_t *src_pte, *dst_pte;
>> +    pmd_t dummy_pmdval;
>>       pte_t ptent;
>>       spinlock_t *src_ptl, *dst_ptl;
>>       int progress, max_nr, ret = 0;
>> @@ -1108,7 +1109,15 @@ copy_pte_range(struct vm_area_struct *dst_vma, 
>> struct vm_area_struct *src_vma,
>>           ret = -ENOMEM;
>>           goto out;
>>       }
>> -    src_pte = pte_offset_map_nolock(src_mm, src_pmd, addr, &src_ptl);
>> +
>> +    /*
>> +     * Use the maywrite version to indicate that dst_pte will be 
>> modified,
>> +     * but since we already hold the write lock of mmap_lock, there 
>> is no
>> +     * need to get pmdval to do pmd_same() check, just pass a dummy 
>> variable
>> +     * to it.
> 
> As we hold the mmap lock write lock, I assume it will prevent any page 
> table removal, because they need *at least* the mmap lock in read mode, 
> right?

Except for retract_page_tables(), all others hold the read lock of
mmap_lock.

> 
> We should probably document the rules for removing a page table -- which 
> locks must be held in which mode (if not already done).

Agree, I will document it in the v3.

> 

