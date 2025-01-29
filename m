Return-Path: <linuxppc-dev+bounces-5680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03096A21D99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 14:12:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjjJ10WjQz2yGC;
	Thu, 30 Jan 2025 00:12:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.54 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738156369;
	cv=pass; b=XO/7sUbxxDtAYbL6Sls1FjOO+1YFWbdu/2LuRN/IsEryzA+svZVNzjLsO4dC2w6w85YQWntP5lzZ/pagiGfm6tpHrvoKx7QMnw9xrIF29LLi5qDZOF+WGgi+LtYY9Ld9AL68jLZ/HCFEPdeGFmkkje90lIkLlSSvV7PHVkOyJhMZoYzjIqULjvF+HaMDAhxBaajmnPRxqe/BjDPjcn+kBrm6jpoLTy+Nm76PcN51kKiTYYhW8R4/td/wyr+nNleZCfQzP7UAf/o3+v6+Vbb28ikWBoV4c0SUGkoWzKY3VnSkdDaQyNj4Zl7latxtz9wWWW3NZHRDIzyHECG++BVYFw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738156369; c=relaxed/relaxed;
	bh=uzBQUaADaT9X6e+ocBW34aBeG1bWGt9xdJM2MVWFZc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDYOO2r/QMtczcDItwXuGdooIKUrovqC1wKAW3eUP8h0A2u1ZJIYrxFkMBkVxqSDTESKupkTedZBz+rdGF07OAecKTdoHr5QChsKkUnxcgIRAY7RC7aNX8XKHYdnGBb7gYbCTdnNVl39OuMGRF1RphO8T7W/s4s/APtKNPJd46kuiaCzL4kjoEjwX2cR199JAf9FSPIlNh7zYuWvaUB6Ct1oydKM6pKwblcuJo5J1jWakmZ+ctYhrjDwHbEtrDOMpWNPY3jFnLPwPbIsMbXpsdCBUWiFOqwBuw8DbdFPHMvh72GJojvSC/mZXmEm2kRFFHkH84H/qxltaMuSCK9M2w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=outer-limits.org; dkim=pass (2048-bit key; unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CM8P44Xr; dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=kKrWkhqA; dkim-atps=neutral; spf=pass (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=julian@outer-limits.org; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=outer-limits.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CM8P44Xr;
	dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=kKrWkhqA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=julian@outer-limits.org; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjjHx70Hvz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 00:12:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1738156353; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aE3bYAq1FbBcIX/lIiGQ6nVq6ylnLSyG6mR0YfGJ5mpEMw84iU+LDlu1Q6t73f5uTT
    3havSt0Ujd7Lp3AA4CS4iADrUq7ZOdd+O8nTBBmW0YAe6aj9l7OdRaZsRxwZMafxfvt1
    qR/Ccn/q1T40w13K80qCQG1iuTpaLEVyL4/gsqr6ztYpgxM1wNnvhX0CYxvc1sNWcdaI
    ORGDLwhhFj2HrBS3FBdObeQVPGvqdMCB21mRa5EsIhRYSbQyRIYMuznBuI1XN52kYkjI
    MIBvX5p8Cp6oQb0utZqRud8TBT8pRww0G5KIjzcjWVslw4GCU3mzdgowomPnMEUA8BpD
    198Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738156353;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=uzBQUaADaT9X6e+ocBW34aBeG1bWGt9xdJM2MVWFZc0=;
    b=ln4REf+EJ3z28m/wl2kH2jM9PqXZvllLBVG6LaJ0/P10gJ5RwFPGVyA1qJ9imcYiWf
    ivJ7dCvVsS8NuusXGyP94D/pDHuq40ODUw8B0WpsSQpI1gwKDlVzqoGfUx2LSC7nzLzR
    uByx1Jq8ermFp3rIfH4lUp1A7DqANd83uyVyeelcSUf59GDE4mP/2DHyRDlwSGCJGYgH
    QcrmtpV367pdwMQJ830zHXwaYEfNXW5lS8U36pBPy51kTTCdOW+9admDcLzbQJ4o+JDi
    G52KCPIIucvpv9w5ZKfErqA8Kc0FMjXN+4CvMIvQSvoetSNG+W/hC85R2zP28XpW0V95
    jPkw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738156353;
    s=strato-dkim-0002; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=uzBQUaADaT9X6e+ocBW34aBeG1bWGt9xdJM2MVWFZc0=;
    b=CM8P44XrDs1EiLulq48LSl8UZzRUC+e4WEKBMOgj38YEdbqCOfmxr6onSfbZgg8QuX
    sNH83uov/zNs3V+FOzTV/BWjmHpUgrCC3n7ltNJ6tXgNLpJTs/e4nm1StfssQjdSUznA
    lt9Up7mhd0s6ADzkOjVErTBu6XbMB4peVk7RjobkzPR3mKqo32QUx8N8U54O+ZW/wIVB
    w1klBx7Gsa81NGcbqcTOpHSNWvmp8pnK58ZDFAzc2535l3XgZkW5G3Z9qDEWOyWgzG2K
    h3CCiFQQp5AX7yI+bkwQopyHBY1GQJQba2msyv2s2YUP0PDjbRSlOwqpIWGCAxzSGK0Q
    vR7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738156353;
    s=strato-dkim-0003; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=uzBQUaADaT9X6e+ocBW34aBeG1bWGt9xdJM2MVWFZc0=;
    b=kKrWkhqAOIlanpDcHYtyM+bzRvbzCMbib2RKmzsl9iPUlbWubGlcw/a2SKGE9ddSrm
    wx8cLtCBX6QBoP+G8zDg==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBFXdk5Zv9blcw/Guou9tnmlcuycliY/oO10qRVR49K0dCxuYmC2vBE="
Received: from [IPV6:2a02:8429:5895:8b01:f6c7:bedc:b0a0:6b80]
    by smtp.strato.de (RZmta 51.2.17 AUTH)
    with ESMTPSA id J1a25110TDCWGps
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 29 Jan 2025 14:12:32 +0100 (CET)
Message-ID: <4994ffc2-d662-42cf-9099-ccddaf4ec22c@outer-limits.org>
Date: Wed, 29 Jan 2025 14:12:32 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc: Remove eieio() in PowerPC IO functions
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250129094510.2038339-1-julian@outer-limits.org>
 <20250129111406.GW20626@gate.crashing.org>
Content-Language: en-US
From: Julian Vetter <julian@outer-limits.org>
In-Reply-To: <20250129111406.GW20626@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=2.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE,TVD_SUBJ_WIPE_DEBT autolearn=disabled
	version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 29.01.25 12:14, Segher Boessenkool wrote:
> On Wed, Jan 29, 2025 at 10:45:10AM +0100, Julian Vetter wrote:
>> Remove the eieio() calls in IO functions for PowerPC. While other
>> architectures permit prefetching, combining, and reordering, the eieio()
>> calls on PowerPC prevent such optimizations.
> 
> Yes, and it is crucial to prevent combining, it is part of the semantics
> of these functions.  This is a much bigger problem on PowerPC than on
> architectures which optimise memory accesses much less.  So most other
> archs can get away with it much easier (but it is still completely wrong
> there).
> 
> You are keeping the trap;isync things, which a) have a way bigger
> performance impact, and b) are merely a debugging aid (if some i/o
> access kills the system, it will be clear where that came from).  And
> that isn't even the biggest thing of course, there is a heavyweight
> sync in there as well.  Is there any benefit to this patch, or is it
> only sabotage?
>

Hello Segher,
thank you for your explanation. Yes, indeed, it was a bit rude to just 
send this patch out of the blue. I should have explained what the 
purpose of this patch was in the first place. I would like to align 
"most" arch specific implementations of memcpy_fromio, memcpy_toio, and 
memset_io, so they can all use the one from lib/iomem_copy.c instead of 
having all their own. So, I wanted to first bring the implementation on, 
e.g., powerpc closer to the "generic" one. Because I had the impression 
that it's very similar, except this eieio() after every read.
But if it's really mandatory to have these eieio() instructions, then 
the alternative be to either keep the powerpc implementation or add a 
generic '#define __io_mbr' (or different name) that is called after 
every read and resolves to eieio() on powerpc, and maybe to nothing or 
something else on other architectures.

Julian

> 
> Segher


