Return-Path: <linuxppc-dev+bounces-11533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42061B3C8B0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 09:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDRXq06g6z2yvv;
	Sat, 30 Aug 2025 17:27:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756538826;
	cv=none; b=ikqbVZ/+ZXYgze/A/dwmkUOAjSuYMJzEF+Hz9gOE8nyKUqHjYQvAdUxJqvKsEhYnuhJl2X70ndB9PvNtk9a32msTmmFVzmdrgHC4KXPETTjcML2THCvPXJ6hU+vMhjRwYD8iiH9MwtpVGihXIuN9IYt1xLR+tH8ycepk4TJeBrDaUMYj+TM4yLZWI369foNQQsUdv2vUzvVhk82dWuNDhCxWrDWtvkvAMirQnWLwe+CY9ENQSEia5kd0rDpkx9v/xGdprVAfrcdSfaUW9ADx5PBHoz9KaCC4FSXUBPPwC2O+sY5ZZ+sWUq4+056XuOeD7WlvUZKl2kJZgceJCWjpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756538826; c=relaxed/relaxed;
	bh=5ISyIR88byJ1xzBu4RO31FrBG8EHIYsHh+pFtfb71NE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=etlU3Pq24P5CrHheG4TH1EmeS4DBh4VAb6oDqkQBra6pxj4It7RcFnRrtQliVOqXuDWUuMWo6NNPqiVQx4mkqGglJI1RexlWrbLsYYcdtlQzI7vCK5zspTuAeNOdNEW1a0knrO/dorF5nk2PGKKy6TdPjBImhxKSScDD1pniy/vOas9PDaHCNX2k9ezriex/pvsqpCL2SB0NHd8i8dqz4lY+1Fe6e6dKVRzizyDKZVOhp3CORnToObolT11Dwk36te+lWkVgKAffILhvHw4OIOhTK/sqMmjCiD7LelWVCJH7JOEi56GcsHNxvA2sYUrmVxCk+yPwpQtXQhe9uFGDvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HrH5Jx6q; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HrH5Jx6q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDRXn5ph1z2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 17:27:04 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-77201f3d389so3068573b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756538822; x=1757143622; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ISyIR88byJ1xzBu4RO31FrBG8EHIYsHh+pFtfb71NE=;
        b=HrH5Jx6qFkq5swuuWk07ompQeBGsU7tYc2i9mYQisvze13gIpMqEv/wYQ+kq4vWT3d
         Ky7zASwEKS+ngB3Ng2N0Q/9/bOoBGQYYHetKFDyBEaw7M6sK86gB8QCNGiQhdMBQSmU2
         ka3e8Ows7u00f+54elAGIUB5M6yWpRrBRw6A0PpsxauuTpADFmRL/pWWiFTopa0NLMkr
         R3QEK0+Y7alqR+Ky549MVxoIVZKEv/HTtzRTWhjLxTWDvc0LxJMptiyoOiQJIuTi0p3V
         TvZci4iVhLLHph+skaL0VpYiLS8RLaY4Fg7xo2j0IV4ubQ2DcM8Cz5/PSe9O2C0gbbdZ
         mI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756538822; x=1757143622;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ISyIR88byJ1xzBu4RO31FrBG8EHIYsHh+pFtfb71NE=;
        b=mf9OIpo3xUVykLklym2xHTXVE7lTy8fe+whzd//jZFRkH4vd5EWxRljprFPU34fmtu
         6PyItD20hkOtT+zAHSUlSmf3Y4QUO7WPwwvlfmHi9+zmYWazXaUL3z4jGeEkCnL3C/+j
         z89WbhApZCbIQ9tuz6YG5UNyccoAb5hmqwH7NomAlBJxPwLsWtAUMmDg3h626s8MKPd9
         LmaarT2bR+nFMS7VeeiqhB51JB+gVhWwKRqAohzATcv/5CuJqn/w+eFtuKy3/9ucPsGZ
         vTJ1aFlF4zyrWAPPI0dCMDVye7GQWk+pOFgceoLCigMfraCjZ0+7GK5SZqjHYP8H2awm
         mTvg==
X-Forwarded-Encrypted: i=1; AJvYcCWIuyvKC8GsGHcB2n6qKW5uDhUKw33Ym5cfgRPCOvRBxHDpJPhR7j3OdYuT208RA3K4w1GjLOGmckI0C/A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGUIDvMiJBLp7POh6KzddxVu8K3CgOuSogorFP1imsf7jWznAq
	+5FJsWqr52/qKGkaflCAwcNHVUvdZCyUMbLBe2EGag+3/cYU95RX+Wla
X-Gm-Gg: ASbGncsMX5P3+Gu3QSky79yinY8pGpLageIFhl/rEvjogssPWiw0+Dt9gRMRYE1lPN+
	nVItM3JHeeF2z46H7JFmA+8oLjIwKbayncv3EaDPkq7e0FNs4SRRuwe4FfrsEq3lXRDL9VQoT6N
	B8Ojjeje4PRJHd3bIxTB6g1xf+grdwI/dRRr4CtFsaMMOB5nqO4LSvY319IqL/bJQhVQrSpbkDC
	9NrYPsuSxgCNem7iGn+Icr9N4B+kBVFvjdenSCnp6ElrbqscYyATOf501r4qD+Y5rhWuK7AFU9/
	8fcOKhy9s7uukWFavK9Wa9hMtgBEiHZazBn9hDBoSZD9sjBntQv44WkSLZpneCqosPqQseTmMFs
	HHPSOYnqW9OzDPe7SzfI/QSVrkA==
X-Google-Smtp-Source: AGHT+IG5ppTvFgvfe3RrV3eizhBPvjO/ibEub9MSBJrTc9ASSzYV+xJVFYWLreNM2LEAxY11zO2nCw==
X-Received: by 2002:a05:6a20:4324:b0:23d:6a77:78c9 with SMTP id adf61e73a8af0-243d6dd15camr1865813637.7.1756538821743;
        Sat, 30 Aug 2025 00:27:01 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a269e9csm4481642b3a.17.2025.08.30.00.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 00:27:01 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@ozlabs.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.ibm.com>
Subject: Re: [RFC 5/8] powerpc/ptdump: Dump PXX level info for kernel_page_tables
In-Reply-To: <12739812-aa4e-4124-8296-b98adecbc6eb@csgroup.eu>
Date: Sat, 30 Aug 2025 12:55:49 +0530
Message-ID: <87wm6ljmo2.fsf@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com> <3c3dfc8d2e6c45f9d0fc4a3f969b93a3b7520c46.1756522067.git.ritesh.list@gmail.com> <12739812-aa4e-4124-8296-b98adecbc6eb@csgroup.eu>
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
>> This patch adds PGD/PUD/PMD/PTE level information while dumping kernel
>> page tables. Before this patch it was hard to identify which entries
>> belongs to which page table level e.g.
>> 
>> ~ # dmesg |grep -i radix
>> [0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000005400000 with 2.00 MiB pages (exec)
>> [0.000000] radix-mmu: Mapped 0x0000000005400000-0x0000000040000000 with 2.00 MiB pages
>> [0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000000100000000 with 1.00 GiB pages
>> [0.000000] radix-mmu: Initializing Radix MMU
>> 
>> Before:
>> ---[ Start of kernel VM ]---
>> 0xc000000000000000-0xc000000003ffffff  XXX   64M   r      X   pte  valid  present  dirty  accessed
>> 0xc000000004000000-0xc00000003fffffff  XXX  960M   r  w       pte  valid  present  dirty  accessed
>> 0xc000000040000000-0xc0000000ffffffff  XXX    3G   r  w       pte  valid  present  dirty  accessed
>> ...
>> ---[ vmemmap start ]---
>> 0xc00c000000000000-0xc00c0000003fffff  XXX    4M   r  w       pte  valid  present  dirty  accessed
>> 
>> After:
>> ---[ Start of kernel VM ]---
>> 0xc000000000000000-0xc000000003ffffff  XXX   64M PMD  r      X   pte  valid  present  dirty  accessed
>> 0xc000000004000000-0xc00000003fffffff  XXX  960M PMD  r  w       pte  valid  present  dirty  accessed
>> 0xc000000040000000-0xc0000000ffffffff  XXX    3G PUD  r  w       pte  valid  present  dirty  accessed
>> ...
>> ---[ vmemmap start ]---
>> 0xc00c000000000000-0xc00c0000003fffff  XXX    4M PMD  r  w       pte  valid  present  dirty  accessed
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
>>   arch/powerpc/mm/ptdump/8xx.c      | 5 +++++
>>   arch/powerpc/mm/ptdump/book3s64.c | 5 +++++
>>   arch/powerpc/mm/ptdump/ptdump.c   | 1 +
>>   arch/powerpc/mm/ptdump/ptdump.h   | 1 +
>>   arch/powerpc/mm/ptdump/shared.c   | 5 +++++
>>   5 files changed, 17 insertions(+)
>> 
>> diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
>> index b5c79b11ea3c..1dc0f2438a73 100644
>> --- a/arch/powerpc/mm/ptdump/8xx.c
>> +++ b/arch/powerpc/mm/ptdump/8xx.c
>> @@ -71,18 +71,23 @@ static const struct flag_info flag_array[] = {
>> 
>>   struct pgtable_level pg_level[5] = {
>>   	{ /* pgd */
>> +		.name	= "PGD",
>>   		.flag	= flag_array,
>>   		.num	= ARRAY_SIZE(flag_array),
>>   	}, { /* p4d */
>> +		.name	= "P4D",
>>   		.flag	= flag_array,
>>   		.num	= ARRAY_SIZE(flag_array),
>>   	}, { /* pud */
>> +		.name	= "PUD",
>>   		.flag	= flag_array,
>>   		.num	= ARRAY_SIZE(flag_array),
>>   	}, { /* pmd */
>> +		.name	= "PMD",
>>   		.flag	= flag_array,
>>   		.num	= ARRAY_SIZE(flag_array),
>>   	}, { /* pte */
>> +		.name	= "PTX",
>
> Why PTX not PTE ?
>

My bad I was checking something on 8xx and I missed reverting that back. 
Thanks for pointing out. Will fix it in the next revision.

-ritesh

