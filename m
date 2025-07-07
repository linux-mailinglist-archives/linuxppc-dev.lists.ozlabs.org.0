Return-Path: <linuxppc-dev+bounces-10137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF145AFAD70
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 09:43:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbGSr12s9z30TY;
	Mon,  7 Jul 2025 17:43:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751874220;
	cv=none; b=Z3AF0hwvPq7UzLHIpYlOzfx7jp0zXwp5weuM6OG/GvNQpjle7HcA3pjhOR+kFMMXjTzEXSo/QqN6J4DtyIhlJWuSToOF9U60H/JSFlyP0FSfU/zdsrVg9jWA8T5kV2rLGqIL1TfzdkFD2gKhrYNcfeLwFMAWSwk7PMp5/eq34NjRwTQ/AUtvkTg7Dvh9ycgr07ilFJvbWftTmzrZMxWqGfJHJRnLzANDMrCPyvl2GLwDekOnfnQrx0N+ovt3LIxx4zjhJiSjE/ka8x4Wo0WCFpiiHaJ/n3UNJl12sslVXRfffqMMsIXDVzXvvXxdj2qeq5tAUtTijeEykDZFc4TKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751874220; c=relaxed/relaxed;
	bh=EwXnxxdnVvnCjxZxZ6I8QfcFkUgZYLfqjV4jaFYM3go=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bf5JOU3P5z5rTJwx9Nm8XS9hclY3wDaQ+e0xxAwlrYrGDXOXQ+SbsdsF4NIVYv3P2oqhn4qY8NZL5soZnWkF1knTGEwpK5Xzm7Gb2eAIliG9mOOLgn3h308EiOiYTch/6zwvltrIVRG8numahLN9Duv8sD9VmQm+dUBiOqJWhoItFVv5h94UdpOjVvGYlu0AZJuJS3mW+hTfSO5vkhS2T4Ewx13GDZuCkxkc09nCikoJhFLpBSmnUr8aHVpZDDIM2HF+AlTohTTAAWqc9AJnbpgvpSPF7sIGZEAPC5Vb324cKfK9D+uckB88M3F2+lozs9jOEy96Z5TSykWbGf6N7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WrzucuMS; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WrzucuMS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbGSq25Jcz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 17:43:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9AFC61130;
	Mon,  7 Jul 2025 07:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58206C4CEF1;
	Mon,  7 Jul 2025 07:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751874216;
	bh=3Ke6aXW6YoppDJzVu3xQy7YrXkx0H6XvpDlKZBbNpRk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=WrzucuMSGq9hPSWekeqS59OPp3NZQEga+pObhSLzRI//C7Lv3C4D8iVDdKY0KjDyh
	 6z4bVbywOMLd84n640nlPRxuvcItpVKEtEFaHCvgZzUZRqCUn7kgv5V+3tBwBOl+ha
	 GjyHitgwYxiiDbQGTbG90nT4ZYopyeQLjYG2A0Si930LsCXOwcNKzwmF2Zn123Akfw
	 scgAjAfAQzQKp9+XykDA0FmoQH+F52qGIUubGUqtaIRUfwyVqs44cP4Vnectpa03UH
	 xUfaRufYGttSgAxFi4XeAusGanMo7AK4HZMkmT75ytZ0X0jsSqB6IHqTCZ5g9/TYK4
	 Hu7PS5ckFosZA==
Message-ID: <d42ba792-6051-4035-bffd-a984d11c7b7c@kernel.org>
Date: Mon, 7 Jul 2025 09:43:31 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
 hbabu@us.ibm.com
References: <20250702221444.879256-1-haren@linux.ibm.com>
 <20250702221444.879256-8-haren@linux.ibm.com>
 <6824e14b-8f79-4fee-85f6-e5f78a8ef265@kernel.org>
 <b9d2274ae6f4f53ea5ee6ffa23bdeea953181040.camel@linux.ibm.com>
 <5cb4a9fc-50a8-4b13-8ad7-21610fb5cfe4@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <5cb4a9fc-50a8-4b13-8ad7-21610fb5cfe4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07/07/2025 09:35, Krzysztof Kozlowski wrote:
> On 07/07/2025 09:02, Haren Myneni wrote:
>> On Thu, 2025-07-03 at 09:00 +0200, Krzysztof Kozlowski wrote:
>>> On 03/07/2025 00:14, Haren Myneni wrote:
>>>> +static int __init enable_hvpipe_IRQ(void)
>>>> +{
>>>> +	struct device_node *np;
>>>> +
>>>> +	hvpipe_check_exception_token =
>>>> rtas_function_token(RTAS_FN_CHECK_EXCEPTION);
>>>> +	if (hvpipe_check_exception_token  == RTAS_UNKNOWN_SERVICE)
>>>> +		return -ENODEV;
>>>> +
>>>> +	/* hvpipe events */
>>>> +	np = of_find_node_by_path("/event-sources/ibm,hvpipe-msg-
>>>> events");
>>>
>>> Undocumented ABI, NAK. Plus node names should not be used at all as
>>> ABI... and naming does not follow DT spec/style, not sure if you care
>>> about it, though.
>>
>> These new interfaces are documented in new version of PAPR. Please note
> 
> Which version? PAPR defines standard, but not the kernel ABI. You still
> need to document kernel ABI, just like every other OF usage.
> 
> 
>> that /proc/device-tree/event-sources node is different which will not
>> have ibm,phandle unlike in some other node. event-sources already has
>> several event messages such as io, EPOW, hot-plug, internal-errors
>> events and adding hvpipe-msg events now. We can see the similar
>> of_find_node_by_path() usage in the current code.
>>
>> io_event_irq.c:	np = of_find_node_by_path("/event-sources/ibm,io-
>> events");
>> ras.c:	np = of_find_node_by_path("/event-sources/hot-plug-events");
>> ras.c	np = of_find_node_by_path("/event-sources/internal-errors");
>> ras.c:	np = of_find_node_by_path("/event-sources/epow-events");
> 
> So you find more issues. Are you going to fix them? What are such
> arguments proving? Nothing. If these are bugs, are you allowed to do the
> same? Obviously not.
> 
> Bring argument about the ABI - ABI is documented here or ABI is does not
> need documentation, because of something, or this is not ABI because of
> something (although it is). I don't see usage of these in DTS, so
> probably there is something I don't get, but your arguments are not
> helping at all.

Although probably if you do not have any DTS, or let's say in-kernel DTS
for these, it is indeed enough that PAPR spec defines it and no need to
document it twice.

Best regards,
Krzysztof

