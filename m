Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 705085F0BF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 14:48:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf94j572sz3cdx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 22:48:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jIpQd3O4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf9480cF7z2xyB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 22:47:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jIpQd3O4;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mf9405MRlz4xG6;
	Fri, 30 Sep 2022 22:47:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664542050;
	bh=bHL0vqUrjIu+1JdWXaJUil0M78bFUEWVnPClNNQGSeU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jIpQd3O4kOlOPP8oeQ0QhASrK8jbG+oBeM8+1tbxdftK5Us2Z6A/GEIVbwSyV4EVT
	 AEI4FhiU2JgL+aYKCurG3qFEwCdHQ/S4Z0NLR5RgSavk2rn/SM76Clg0vg8SWb9msF
	 4XeyDRKpQr0DzYEZdN9E3jvpFkYXshm9v9tsdJxdAlmB66HuepZgxqBUSUPqC4Pm//
	 3Dl1kUJTIJc8kDKxNeT9po65vs0/Uey+LPNeZi92mSnydPTpX/790RzcNVf63gYP7L
	 caWvnupEthnbrV1Ts/8dXE/ymoQo13SB+Ew7ugqE5vlDefmbi83if1s+j8O2VEe45U
	 /Lg6uQlklzJhg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] powerpc: update config files
In-Reply-To: <CAKXUXMxe5EagwsQVyt_WLf2mMXZbUqzaEaiUjBj9ZwRRZywx0g@mail.gmail.com>
References: <20220929101502.32527-1-lukas.bulwahn@gmail.com>
 <87pmfdpatr.fsf@mpe.ellerman.id.au>
 <CAKXUXMxe5EagwsQVyt_WLf2mMXZbUqzaEaiUjBj9ZwRRZywx0g@mail.gmail.com>
Date: Fri, 30 Sep 2022 22:47:28 +1000
Message-ID: <87k05lowpr.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
> On Fri, Sep 30, 2022 at 9:42 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
>> > Clean up config files by:
>> >   - removing configs that were deleted in the past
>> >   - removing configs not in tree and without recently pending patches
>> >   - adding new configs that are replacements for old configs in the file
>> >
>> > For some detailed information, see Link.
>> >
>> > Link: https://lore.kernel.org/kernel-janitors/20220929090645.1389-1-lukas.bulwahn@gmail.com/
>>
>> Ideally I'd like a list in the change log of each symbol and why they're
>> being removed/changed. It's pretty easy to accidentally drop something
>> otherwise.
>>
>> I think this is the list in this case:
>>
>> Renamed:
>>   - CONFIG_PPC_PTDUMP -> CONFIG_GENERIC_PTDUMP
>>     e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")
...
>>
>> I'll fold that into the change log.
>
> Sure. Go ahead. I have provided all information I collected in the
> linked email (and this information drove my scripts to take actions)
> and I am happy to provide it in any form a maintainer may think is
> good for them. But I assume you did this with a simple script
> yourself.

I did it manually actually - just a bunch of "git log -G <symbol>".
A script would have been better :)

> After going through the changes of Kconfig from the last decade, it
> seems feasible that the information on Kconfig changes is actually
> maintained somewhere and that would allow updating of arbitrary kernel
> configs to newer kernel versions. It is not completely out of reach at
> least.
>
> And to really improve the situation, I would like to reduce all these
> defconfigs in the repository to minimal kernel fragments that really
> focus on what these config for specific machines intend to tell. E.g.,
> these configs below (powerpc-configs) are about ensuring specific
> hardware support, not about setting "CONFIG_CRYPTO_XYZ" one way or the
> other. That is actually just "noise".

Yes I agree. In most cases for a lot of options we just want whatever
the default is for that subsystem.

> I do not know how to do this right yet, but with a bit of
> experimentation and investigation, I might come with a first idea and
> then we will see.

IMHO the best solution we have at the moment is generating the configs
with merge_config.sh.

See for example the way our ppc_defconfig is generated:

PHONY += ppc_defconfig
ppc_defconfig:
	$(call merge_into_defconfig,book3s_32.config,)

$ cat arch/powerpc/configs/book3s_32.config
CONFIG_PPC64=n
CONFIG_PPC_BOOK3S_32=y

Everything else just gets the default.

We have some more fully featured examples too, see
arch/powerpc/Makefile.

There's a few drawbacks of that technique though.

One is that those generated configs aren't shown in 'make help'.

And the other is that there's no way to run something like savedefconfig
on those .config files to minimise them.

You have to expand them out into a full .config, run savedefconfig on
that, and then manually grep through the .config to find any symbols
that are no longer needed. You also need to be careful that any symbol
that's no longer needed is no longer needed for all the generated
configs that use that .config file.

cheers
