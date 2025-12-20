Return-Path: <linuxppc-dev+bounces-14923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B9CD34C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Dec 2025 19:01:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dYXKJ4M3fz2y6G;
	Sun, 21 Dec 2025 05:01:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766253700;
	cv=none; b=Yb0MAunLQYzWO55AsAem9iAGA+WBRTHeYBbw7bOmVN7dx5mBTwzoTfu0nMHYApu3unC8ktLPdg7yJ5wl/SdRtn6te9eSooX1ToEbE0Cl3toikHa2FVYoBkQdMEURWRQoREQwHe3SJENjVxMMQb6vPzqmqIQgpm+UUzU+mbnkb/crFe2NleEvX7Juw7OYVdyVk1UljKqT/uOrfeY8cajoDyv00gD0/B0ByKNF6aGKFUGMp5xdDct75vBz3+PIelXazKbZ2ws/NlUsfUHpXx4h+vNQyCP1eqC44HElflNvSGz3t2Ri/4XHbsNtuf3XnNp5cmAwmUyNt4Nq/Ms3ofkFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766253700; c=relaxed/relaxed;
	bh=QtlkPGS9gN+fPpKVNbPdXmBnw8cfj4ynSegqaZGKMT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+i3djWVSqOSzDEaAgPpK4GpNcu6bhdWQCXujd2VC6Mo2QUd0kjngwK4xczi12/QsSqkollObz9nURrFDnsRvTMdYju41nVakoCSucNh1pxgbeXh3WEHTpQy7EXkqHKcQ4Vkcq7pfiyLReCPJePX8xcuVsknezY09yuxJk4x6As3AU/nGu65dV9SUqNl8D/N7V7oqQHR9aGgPBSAkpEWbO9cWhq6rMp14jF3x9dK8aw2uVqF/6YZiEVsNLweOBYxm0LRqICnmDkWsLZ9yHjQKYddT/p35piPteC7t0Q50T75AlowomxLKyv4/YUA3nblZPTeTL+mixKVYVGi2XiwHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LvVMSUf8; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LvVMSUf8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dYXKH1rZyz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Dec 2025 05:01:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CE6160053;
	Sat, 20 Dec 2025 18:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C20C4CEF5;
	Sat, 20 Dec 2025 18:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766253695;
	bh=rNegeb1NXvndOVs5fOFiH3UyPRPJyzu8EuRv+VEVlfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LvVMSUf83ppKaV7chSbm+K1gtYhiFB5qD2gxYym2r/e++UJG/hOeod3tUgrrObC9q
	 S+o20S3jS31CLhyAMgdq4cxDhDhY9pkJNTWABfqD2/lTIt1azX7SVcc4Z3nomwSiP4
	 xR7VCcUXz6L7+afwLgpEXN/yiRb+RfcSHNo4j28ut8Y12IUuzm0ZroNBq3wxiAkYDC
	 AwP8jA8hJoJpRRA57ViBJ70JPtiOlevU/aXB3P9I5yUGmsCC2s5bLkf/PeSw3e3BtS
	 r5E//YLrO3g3BrpZcWqr248DT6xiFou8CqalF2z++GVIheQ8NorC8T1fqoK8X5u6Cu
	 LzQv4JRTS6rnA==
Message-ID: <aeab7b8c-cc9a-4db8-a36b-f54b842d3c18@kernel.org>
Date: Sat, 20 Dec 2025 19:01:32 +0100
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
Subject: Re: [PATCH] powerpc/fsl_rio: fix a improper release in
 fsl_rio_setup()
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: alex.bou9@gmail.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 mporter@kernel.crashing.org, npiggin@gmail.com
References: <b371cc50-4b3d-4b0c-8948-6af78baac041@kernel.org>
 <20251220134230.712676-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251220134230.712676-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 20/12/2025 à 14:42, Haoxiang Li a écrit :
> [Vous ne recevez pas souvent de courriers de lihaoxiang@isrc.iscas.ac.cn. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Sat, 20 Dec 2025 11:45:10 +0100, Christophe Leroy wrote:
>> Your explanation is unclear. It is correct that put_device() is the
>> correct way to drop the device reference, and it is already what
>> rio_register_mport() does. Why do you need to move it out of
>> rio_register_mport() ? This is what you have to explain.
> 
> Sorry for the unclear changelog. I think if device_register() in
> rio_register_mport() fails, put_device() is already called. Then,
> the error path in fsl_rio_setup() also kfree() the port. I suspected
> a potential double-free issue here, although I am unsure whether this interpretation is correct.

The put_device() in rio_register_mport() releases the reference to 
port->dev taken by device_register(). See the documentation in 
https://elixir.bootlin.com/linux/v6.18/source/drivers/base/core.c#L3750

The kfree(port) in fsl_rio_setup() is to free the memory allocated by 
the kzalloc() at 
https://elixir.bootlin.com/linux/v6.18/source/arch/powerpc/sysdev/fsl_rio.c#L583

Those are two independant things.

> 
>> AI code review or human code review ?
> 
> Human review.
> 
>> Why do you remove this kfree() ? By doing this you will leak the port
>> pointer allocated earlier in the loop by kzalloc()
> 
> I just thought after device_register(), the cleanup should be done by
> put_device().

You are talking about the cleanup of port->dev. Once you have cleaned up 
port->dev you also have to cleanup port.

> 
> I would appreciate your clarification.

See above.

I might be wrong but from my point of view the existing code is correct.

Christophe


