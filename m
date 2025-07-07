Return-Path: <linuxppc-dev+bounces-10136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47199AFAD4C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 09:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbGHj53ZQz30T9;
	Mon,  7 Jul 2025 17:35:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751873745;
	cv=none; b=jKjgurc+sEr05dvtA1ks25eyQk601FtVtDe8A0MHhsHkr3OR5/67/EFV2HziGiZLB5L2frG/CCGGt18q1MExNo15HsUxZP15vJj3yiZEEejSx6du7/Q+V52Bja3awQmiTsqGkhIALv5/ToPHlwcWuBUWsRRAnwGEd3YyORYvKsW+9AwJZCCHUuRt923jg6Ho22phl0PFN/uCBEe61rIVPpvTKSN+Tf/zMAdzPep3k2AOr+WZlmjG9UxjnD3/+TnBS2ep7xPwGHbyK2Ey7JXk+kByj1JoHjUNRWiNvO4Yu92sEcZS8E9e5RX9NTfTTls6VOMTJ0Vr1BIs0gQsEL4SjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751873745; c=relaxed/relaxed;
	bh=ABXH3onFi97YtWynUEy9vMOpnm1vPcc5/a/67nL0tkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlqYU8+v7gzcO0xl7fdgggWsGxh61vGDPTke1Ts98fY4H696nCKEGQHE2315ZOWF/KVxbnPmvFPhnRvKoi+qGcwBFiulRcV3EKizvwjz9FX0qupZl5ho/dWAMr+stemdBYFcG6Tko0suXgr3jdtcsJrt6pYYxsg5jDZyaOn2dP38vUgLg6VoAkY6ii3pA2ZSC2f3/B3ROasacP1v4rly7eiSuz7/D2KkJRexDwfx9i3Hno7fs69lc71SJoOegQZWU9W6t6gqb1aQokT6PlAVwKIKip85QqzqTZoRFDKJDH/eh5GZl/QyRR9o4YKMFJWTTS9ZgkPcv38yBsYt1GDBzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FExtB27K; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FExtB27K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbGHh4w3jz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 17:35:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0737BA534BF;
	Mon,  7 Jul 2025 07:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92734C4CEE3;
	Mon,  7 Jul 2025 07:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751873741;
	bh=EP4cluLD4EQvDCJMBqKTtGlaim/x7ix4T0eX4OGdEUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FExtB27KAZEB2pRey+DTLaXkmXZOoS8VNXFIdp08+Z8tnwztOGF0W6raMzuEvY6aG
	 5GYSp1XN9bBC2661BCVOgku65y8cvUxP3qdpOVIUXFbVE/z6Ob4wLcSoADFlVHpVCV
	 njGCNsbk3LcM7zVUp2Iv5bfOEqVM1qw9orZ/69keSxdzwZtMkk3Rh14JzpjGX5RPGs
	 dcIax/3YcZ0WQpn3zbT5NOmNg9OavCXa1L7/crII7EWT+9gyXucRLPpyazoJ7AqZI2
	 4FqYHNGgNcAzpKwxFZZpBrcg3/xQ2mhZfQukouTQ4IhHNqL+6GlCF4zIzU0L/wZOs2
	 aId8/CkqktyOA==
Message-ID: <5cb4a9fc-50a8-4b13-8ad7-21610fb5cfe4@kernel.org>
Date: Mon, 7 Jul 2025 09:35:37 +0200
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 7/9] powerpc/pseries: Enable HVPIPE event message
 interrupt
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
 hbabu@us.ibm.com
References: <20250702221444.879256-1-haren@linux.ibm.com>
 <20250702221444.879256-8-haren@linux.ibm.com>
 <6824e14b-8f79-4fee-85f6-e5f78a8ef265@kernel.org>
 <b9d2274ae6f4f53ea5ee6ffa23bdeea953181040.camel@linux.ibm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <b9d2274ae6f4f53ea5ee6ffa23bdeea953181040.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07/07/2025 09:02, Haren Myneni wrote:
> On Thu, 2025-07-03 at 09:00 +0200, Krzysztof Kozlowski wrote:
>> On 03/07/2025 00:14, Haren Myneni wrote:
>>> +static int __init enable_hvpipe_IRQ(void)
>>> +{
>>> +	struct device_node *np;
>>> +
>>> +	hvpipe_check_exception_token =
>>> rtas_function_token(RTAS_FN_CHECK_EXCEPTION);
>>> +	if (hvpipe_check_exception_token  == RTAS_UNKNOWN_SERVICE)
>>> +		return -ENODEV;
>>> +
>>> +	/* hvpipe events */
>>> +	np = of_find_node_by_path("/event-sources/ibm,hvpipe-msg-
>>> events");
>>
>> Undocumented ABI, NAK. Plus node names should not be used at all as
>> ABI... and naming does not follow DT spec/style, not sure if you care
>> about it, though.
> 
> These new interfaces are documented in new version of PAPR. Please note

Which version? PAPR defines standard, but not the kernel ABI. You still
need to document kernel ABI, just like every other OF usage.


> that /proc/device-tree/event-sources node is different which will not
> have ibm,phandle unlike in some other node. event-sources already has
> several event messages such as io, EPOW, hot-plug, internal-errors
> events and adding hvpipe-msg events now. We can see the similar
> of_find_node_by_path() usage in the current code.
> 
> io_event_irq.c:	np = of_find_node_by_path("/event-sources/ibm,io-
> events");
> ras.c:	np = of_find_node_by_path("/event-sources/hot-plug-events");
> ras.c	np = of_find_node_by_path("/event-sources/internal-errors");
> ras.c:	np = of_find_node_by_path("/event-sources/epow-events");

So you find more issues. Are you going to fix them? What are such
arguments proving? Nothing. If these are bugs, are you allowed to do the
same? Obviously not.

Bring argument about the ABI - ABI is documented here or ABI is does not
need documentation, because of something, or this is not ABI because of
something (although it is). I don't see usage of these in DTS, so
probably there is something I don't get, but your arguments are not
helping at all.

Best regards,
Krzysztof

