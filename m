Return-Path: <linuxppc-dev+bounces-10640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B21B1AF44
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 09:18:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx4Ws0Ynwz3bh6;
	Tue,  5 Aug 2025 17:18:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.187.169.70
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754378281;
	cv=none; b=ThLYWgsgB9OgRk10SKVA47aMvyTLjvHidsPLq5Yox+gJoo8ckilSQHdJgXK3wjG+LVhQPT/33zRs9OTI0LtgSEuwAIdFn9RHWkIGRjBX9cclzeELOsonEfdgoMsqQwXEdiHeSgebUjCISVXUYMLJAUxa8joxpMdmKTjfw12hy0LqEnkoic3i/wm08vp8R/QRu26t36PY3g2q2MVuwB2Lsr/q1LVijzoucqwQtV3aH+KwZQYbnRZiNmmHoK0cOZxwjpQ56qZXAKl/4QOY7hqwdI7X8/Zmz72eXXZwj4bisTB/8du7+I0MJLI8rL42/KPZieWrpRaZaK9cPiS2RdP0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754378281; c=relaxed/relaxed;
	bh=QQl+hB7Csyy6I7YCKs0ymgsTb9OeTENPHuER3l/L980=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdzQh19U4VGN84Zqh2f0GnYxZzbCYde/c+6KQ1StrMws4xVW42x8P2Cep9ZZ3yTCRBN9TpuEXCkVdpiEjjrnynQh7cDkT+Grpi8U6/6nye5wsskvpPCGe9DfcyHtmARpJOsNbZqc5sV/EaRyb2mz7//qRO0KwThhSy8tPb7SzNOCdp/nRJqGzgXsznOBP08PKhoxcIMsfbTuunua84EfIfLxg9UhaMJuj6BDHgTcCHduB5wpSiZX8hPohBQPUeYFuqTOKML+7oL/XlYd5h4195VPnKpvfZe9qd4evcBJx/u4hyH9ULf7vjwVijRP3YAs/2fpNqzzYiq2yiqp+b+sYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass (client-ip=185.187.169.70; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org) smtp.mailfrom=hogyros.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hogyros.de (client-ip=185.187.169.70; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 95606 seconds by postgrey-1.37 at boromir; Tue, 05 Aug 2025 17:17:59 AEST
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bx4Wq55fQz3064
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 17:17:58 +1000 (AEST)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id AE0C53F1DF;
	Tue,  5 Aug 2025 09:17:52 +0200 (CEST)
Message-ID: <854efc41-c40f-46c9-b8ae-84bda9d17faa@hogyros.de>
Date: Tue, 5 Aug 2025 16:17:49 +0900
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
Subject: Re: Crypto use cases
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
 <913e23f9-d039-4de1-a0d3-d1067dcda8ac@hogyros.de>
 <20250805045846.GA10695@sol>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250805045846.GA10695@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 8/5/25 13:58, Eric Biggers wrote:

> What does this have to do with this thread, which is about the PowerPC
> optimized MD5 code?

Hence the new subject. It is still related to removal of code, but asks 
about the bigger picture.

The code removal changes you've been pushing lately absolutely make 
sense in the context of "the crypto subsystem is for internal use by the 
kernel, and all known users will only ever submit small work items."

However, there is also the userspace API, and hardware accelerators also 
register with the crypto subsystem, so it is *also* the way for 
userspace to use specialized hardware.

If these are separate, then it makes sense to acknowledge that the 
kernel will never use asynchronous transforms for anything, simplify the 
internal API, and move all the hardware support to a separate registry 
that is for userspace applications only.

However if we don't want separate registries, then it makes no sense for 
the kernel to set policy for userspace here; it should offer all the 
alternatives. The kernel can, and should, define policy for itself, and 
I wholeheartedly agree that offloading small requests does not make 
sense, unless we're on battery power.

I'm also not convinced that fscrypt cannot ever learn to submit a single 
large request or a large batch of small requests if it is asked to 
decrypt a large file, so in my opinion the common registry makes more sense.

Making sure that hardware support actually works and is tested is the 
responsibility of the driver and port maintainers. We understand that 
subsystem maintainers do not have all the hardware available, but the 
same goes for all the other subsystems -- the DRM maintainers routinely 
merge drivers for hardware they do not own, because the changes come 
from people who *do* own the hardware, and have tested the changes.

The latter is a project management issue, mostly: if there is a lack of 
working relationships with driver and port maintainers, then that needs 
to be fixed, not assumed to be an unchangeable part of the environment 
that technical decisions are made in.

    Simon

