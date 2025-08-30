Return-Path: <linuxppc-dev+bounces-11534-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6949EB3C8B1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 09:28:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDRZY2XLSz2yx7;
	Sat, 30 Aug 2025 17:28:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756538917;
	cv=none; b=Wa0I4R+4W0ppzRSqsP0fwM7ovepSqP4jO7FDD+Gaf+3Jii3S5Pdc0oFPwreJYnE8S+bL9jOkIuu0uie8DnQrvHZUuw5vlu9fg4ly7/SZ+uh0ZHVXLU+FaV0hD710QtGc+XAnzxf8R345Ps34PtURXqyt3ukZTgDbwc0dExR/5d8pQQGj9vFRytFbTiArifAD6DD6h1qoQR+5mgNHp1VpgITWopfuDDdawF/3F3r46sMpXMgMRjP9OkD7ase6dXaPS/BxLiNLlAqcLsCh6I81fyUhFiRY3q6mipq2VRfeaAwHjb507ZBCXB/h0i6Ovo3YzxkQnS5mRcpVZ/WfXs8wqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756538917; c=relaxed/relaxed;
	bh=BulcYTog25qHtQX7qAAj6sN/P023AUpTRc4mUeXzid8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=TRe6ZKdE0LG/SOAf36xMQEU/BR1Dmnktsju4ihxwiejRibxO8azYK2doJ5kEucOAKy6V5gD4g8rZeDM+6ewQlkjSSFCTetLUR0Cn8oiok2T31cjU5dXngL9LqqJYUZ7JSeOxxiKZtm8EilT+BDEPev7fnEJA51hfUemyCJ8yWK39w6ieHUJZ6ezOH4HpIYrNVPWKz/abVargNzV0y1IBNsUBQIwtmkBRNUd9Jx81cKAehlVnkHO85blCBGB+83SQBdXsL2AY1HX6VYAf7IUCaXvXX2ob9DDloLg8tPWFtLcCef93NwLHAL1b6PR9mQn7r4Gk9RFhdM1hkRoSuj2c9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PScFTtd5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PScFTtd5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDRZX4646z2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 17:28:36 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-327b3e24637so1755298a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 00:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756538914; x=1757143714; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BulcYTog25qHtQX7qAAj6sN/P023AUpTRc4mUeXzid8=;
        b=PScFTtd5gH0GUnhB9XuGvtVsnd7jLb9Z3BR1vUf4WOxyhFGHs5wcCjLRFYE6rIi7rk
         LPFcyzkb/B7YvpoGrowbFiT5uQmAiJgiEFko1rzkeZP5uGeAKr8qySumjuTW7zVb/ecN
         m8IYI1AYZS3PJho58Iv3UzqgKGnqdcgvLhdVCbG+hbfUJH/7zLEz9bCUOmXMU1FAzwhT
         2tsg1DyOr7l3uBdwsKH3y+cuV8cH9+HMrXYjuuJ6Chq3JA6WHoNnoWn4iEaFT2tqcqt0
         evmDoTnk9cyvmtnhpfr+33NkDfNAlVNy1kGvcKgO98f7z6svGPHw7z7miUbDo+8G7AoJ
         5kBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756538914; x=1757143714;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BulcYTog25qHtQX7qAAj6sN/P023AUpTRc4mUeXzid8=;
        b=U4JZwXQxx+Ah8D8UBk6KdHxOraWO59lGBhl36xeiw9MxrBgl5Mhlj3OhFGSDv/kDmf
         InkUpyGP6/Bn+TyCdwFSdOpT3IzsLW/38lsW6iFT9plJCukdUfqK7ygjAI2i4ENGUaWJ
         W+vC1tewp4LbUptoMY4JmzCFTgqqBgpRK5reMj446R8dO+Y7x6WNkKOD2L4gv8eF/wR9
         NH377JdqNBPu2N57nza86VoDISGrQO08+vm/W8pkd+fCVRDlCPf/fuiVUegPCNAAfMxv
         tUC4DIciKNqHTu4me4lLCFjVpc8gr5GDPmOurpZIrfBBvUMwaz++TFuYRw/PwJKD/Tlc
         hx9A==
X-Forwarded-Encrypted: i=1; AJvYcCWH/NVl39mx3tMd07m6GDPaH77GMN3MF2iEn/pHoh94Iff6r6WED1IxdmeayY44avkyxqx8Fm3t6X5KIGM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySDaaFmLXPjNAsBuopoz2E1/xC7CQEPOynH3ROGyawdb3Sn5a+
	sJD8uVEq1hux9PlQf7EAcwEqZ1FDZcecQIuoLLQ8xjhm24uhIkd0OwWk
X-Gm-Gg: ASbGncvIPtm07nXeAQcTJGIoe9fDCM2WfatR7Jy2+Wl/86co+rCaaAXuJRwgbkzbMJj
	gEQLNS6HQ73lpr7ox4MLdvbxn2z91+X+K92i73WLH+5fPC3IK03GPOOpaC+4taidS0MgEbdDrT1
	QxTn67h0jdCnwgpaGvUUAziBZ7hWUyeHrvu8GsCoelxz83ugGDG0a1qZkErt18rPkvBQUmh3ZdR
	zKgNwa+uEHBqhPNWBDz7wx8xg5wQ9JfcKgrE8Ia+NByLfpiwtAnyefhSvq89yyO6PdmkcKJ+gpF
	GohiaSTTY24egf3phtGs5zUtT3uYfuHbKva+EA62KgVCFIAM/Wy6Cr9umv39XXsP6hY/rw6Cytg
	54h7UdBAqsGeoTahR4L3FX9JjxA==
X-Google-Smtp-Source: AGHT+IF/LnvUgcRGxglyGMY8aWb5IEgtYu0JhgLOihqe57/HfWsT8kgHPF+8m4nzjg/DegXZgj52ZA==
X-Received: by 2002:a17:90b:2ec7:b0:327:f20b:90b5 with SMTP id 98e67ed59e1d1-32815412230mr2133938a91.4.1756538914237;
        Sat, 30 Aug 2025 00:28:34 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm10390759a91.23.2025.08.30.00.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 00:28:33 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@ozlabs.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.ibm.com>
Subject: Re: [RFC 6/8] powerpc/book3s64/slb: Make preload_add return type as void
In-Reply-To: <e1222528-911d-4558-b483-bceed8a99f2b@csgroup.eu>
Date: Sat, 30 Aug 2025 12:57:20 +0530
Message-ID: <87v7m5jmlj.fsf@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com> <90acc8e1de6e9575f31f41182077571e7c34a794.1756522067.git.ritesh.list@gmail.com> <e1222528-911d-4558-b483-bceed8a99f2b@csgroup.eu>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 30/08/2025 à 05:51, Ritesh Harjani (IBM) a écrit :
>> We dropped preload_new_slb_context() in the previous patch. That means
>
> slb_setup_new_exec() was also checking preload_add() returned value but 
> is also gone.
>

Right. Will add that.

>> we don't really need preload_add() return type anymore. So let's make
>> it's return type to void.
>
> s/it's/its
>

Sure.

>> 
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Paul Mackerras <paulus@ozlabs.org>
>> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
>> Cc: Donet Tom <donettom@linux.ibm.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/mm/book3s64/slb.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
>> index 7e053c561a09..780792b9a1e5 100644
>> --- a/arch/powerpc/mm/book3s64/slb.c
>> +++ b/arch/powerpc/mm/book3s64/slb.c
>> @@ -294,7 +294,7 @@ static bool preload_hit(struct thread_info *ti, unsigned long esid)
>>   	return false;
>>   }
>> 
>> -static bool preload_add(struct thread_info *ti, unsigned long ea)
>> +static void preload_add(struct thread_info *ti, unsigned long ea)
>>   {
>>   	unsigned char idx;
>>   	unsigned long esid;
>> @@ -308,7 +308,7 @@ static bool preload_add(struct thread_info *ti, unsigned long ea)
>>   	esid = ea >> SID_SHIFT;
>> 
>>   	if (preload_hit(ti, esid))
>> -		return false;
>> +		return;
>> 
>>   	idx = (ti->slb_preload_tail + ti->slb_preload_nr) % SLB_PRELOAD_NR;
>>   	ti->slb_preload_esid[idx] = esid;
>> @@ -317,7 +317,7 @@ static bool preload_add(struct thread_info *ti, unsigned long ea)
>>   	else
>>   		ti->slb_preload_nr++;
>> 
>> -	return true;
>> +	return;
>
> You don't need a valueless return at the end of a function
>

Right make sense. I will fix these in the next revision. 
Thanks for the review!

-ritesh

