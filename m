Return-Path: <linuxppc-dev+bounces-1011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B796C6A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 20:45:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzWdr45F9z2yfm;
	Thu,  5 Sep 2024 04:45:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725475536;
	cv=none; b=lQWaJ+UD/COgqGx1VQyVIX7tDmb3dGT1gS96/LG+hGYk1TzSyr5KcHJNx1Fjknh4r1REjJf5liJZcHWAQKzToLqveVR4whjHVw+Ar/Duacoy7dFBsJvs1zzf0odomUkOd1IY49TyqrFcHF9UySJKgxDMxVHBrmgh7r4TBmmZkzSDRE5bjEx3vMMGENQHdyMN9L5AOAEuqlHhAWvmAYuO+IIs0mZ86ceBYqwkMSlNg4sOyKI5sbKPnukfpiuuK41/GPH8kpSVlpin8VhhnUWOjWlXJPKuayQjOwJDT9WKuYs4f1Yp2iPjJpwsECenTLBHEcMsmCXFRK2/AxDz2FRd3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725475536; c=relaxed/relaxed;
	bh=A2cJF63QP/c5w3ieUuwO3beX5UgVacLYpP/NWWLTmBU=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:Date:Message-ID:
	 References:MIME-version:Content-type; b=aV25SdfUTQYfjWRMD7oqZbY/T4y0swYWpmyPmXO0caMUsQ8lHWbHTSWzyZjy2IG/YEEoXab/Q9J3EbCD7OzSi4KPLBkPrO5v8CF/A9l3E+iJphxhAriy0DV6pqDPQVxFhduHdl/QtV2xVpgcLRt0DE/3QhJDOtF0/m5BsBYZWWQJ0DZoXWJIQlod5EClCXJTDaAlqGYG93/H/liKLOSjqc40UgUHG9M5IuA/anuLX4pkLzTiGYtEpmWQZNV/ubCABn8JiHmTA35AcHueGPb88ZU3X+hMxG/nAwAWTBN8IZHQeUDqX8HkSw9llFNfl2ZWniCT/sDuFm0pKpxrvo/b0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fOla3e0r; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fOla3e0r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzWdr2Wq0z2yWy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 04:45:36 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2d88690837eso3840207a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 11:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725475534; x=1726080334; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2cJF63QP/c5w3ieUuwO3beX5UgVacLYpP/NWWLTmBU=;
        b=fOla3e0rjlTyDgwhreu9dzAfyp1B7w2tyaPpab25gmTF6BGQZKRF/UExSfo1OiPNwM
         cy7m9RmsF6rlTCPfJ5DAslyQF8taeu5NxejNjW1l9S+B6zFswkXa9w1In+sc6YafXCbO
         5NFVLxktDwpNlN6JcjKci0AtH59Y/oZp/D5ojf8pKhnVPkrYXRPynyZJGnKX9gzu3GiF
         L77z1oY5jme3E2wsrB23gjDRLgp02KkZyIsCtlBPnPCwQ6F+hpKHEHASWLhqh/NOWkSg
         SuVpBoQoBQyqd51E8wRhYK2aLQU6TSgGGFnfT0kZ6BCYa282vGAHgTxcFMU4d4/qMyv6
         ibfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475534; x=1726080334;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2cJF63QP/c5w3ieUuwO3beX5UgVacLYpP/NWWLTmBU=;
        b=MiHvDrD/ZnHve4VwIl7aKJw7XcFmKOytLrYUA+cBXPl+T8I+aLWa9PznEWi2XOSsvd
         jwEPqkO1kNdSkeJYbX7eLlT+JBJ1CxxXYELpUM5QWWe8R1iFbercG/a9ZubJiMWc/eIB
         sEcV5sGZRZyaMQQXLTysos+ense3iB9NrcSc22l2hGmI3/2tMP0Kjj2hFWYH4gFxoC0F
         M8sCXbvrLYnrSwDuK/NZhp8uHrVU11xji19u4JK+J4NIxYhgfF5HxJ1OM95ohWBIBdqm
         l9cuASdGUjUmQ4gGwZPMCHmVRkM4JX3SeTa9f4ziiG4zecvBZjwsuW1YL33gqidgo8qA
         lHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZSnkQdw6sLD7+9OUK/cvTCwjzcXVMBKQoOCau5DLIfgnmxEz1aUHIC7g1xTvTFfj3nekPtX4Y7KE4Qlg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzm0+b6DEoweuk/HTyC5WONDOcWLrbcW1I7rikuZ2ZUL9Ahe6Mb
	ww10UKEAVYj8rRbRistTJeRcJ/xVzjShZPem96Fpbt+ivRbEtf8N
X-Google-Smtp-Source: AGHT+IHc2e2vLMtpgUXS1tI52gf1buiD4YvgfCEcYTpqHrkvHGaoZfMMzMZorhVoVrjYeCTSItHnJg==
X-Received: by 2002:a17:90a:eb0f:b0:2d8:8138:fa11 with SMTP id 98e67ed59e1d1-2da6344d3d4mr6980158a91.37.1725475533704;
        Wed, 04 Sep 2024 11:45:33 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b3b95cesm13848845a91.53.2024.09.04.11.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:45:33 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Donet Tom <donettom@linux.vnet.ibm.com>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
Subject: Re: [RFC v1 10/10] book3s64/hash: Disable kfence if not early init
In-Reply-To: <8fc490bc-b0e6-4730-87ff-ee247fea887d@csgroup.eu>
Date: Thu, 05 Sep 2024 00:14:31 +0530
Message-ID: <878qw72r8w.fsf@gmail.com>
References: <cover.1722408881.git.ritesh.list@gmail.com> <fd77730375a0ab6ae0a89f934385750b239d3113.1722408881.git.ritesh.list@gmail.com> <8fc490bc-b0e6-4730-87ff-ee247fea887d@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 31/07/2024 à 09:56, Ritesh Harjani (IBM) a écrit :
>> [Vous ne recevez pas souvent de courriers de ritesh.list@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>> 
>> Enable kfence on book3s64 hash only when early init is enabled.
>> This is because, kfence could cause the kernel linear map to be mapped
>> at PAGE_SIZE level instead of 16M (which I guess we don't want).
>> 
>> Also currently there is no way to -
>> 1. Make multiple page size entries for the SLB used for kernel linear
>>     map.
>> 2. No easy way of getting the hash slot details after the page table
>>     mapping for kernel linear setup. So even if kfence allocate the
>>     pool in late init, we won't be able to get the hash slot details in
>>     kfence linear map.
>> 
>> Thus this patch disables kfence on hash if kfence early init is not
>> enabled.
>> 
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/mm/book3s64/hash_utils.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
>> index c66b9921fc7d..759dbcbf1483 100644
>> --- a/arch/powerpc/mm/book3s64/hash_utils.c
>> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
>> @@ -410,6 +410,8 @@ static phys_addr_t kfence_pool;
>> 
>>   static inline void hash_kfence_alloc_pool(void)
>>   {
>> +       if (!kfence_early_init)
>> +               goto err;
>> 
>>          // allocate linear map for kfence within RMA region
>>          linear_map_kf_hash_count = KFENCE_POOL_SIZE >> PAGE_SHIFT;
>> @@ -1074,7 +1076,8 @@ static void __init htab_init_page_sizes(void)
>>          bool aligned = true;
>>          init_hpte_page_sizes();
>> 
>> -       if (!debug_pagealloc_enabled_or_kfence()) {
>> +       if (!debug_pagealloc_enabled() &&
>> +           !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {
>
> Looks complex, can we do simpler ?
>

Yes, kfence_early_init anyway needs clean up. Will make it simpler.

Thanks for the review!

-ritesh

