Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9234C2A71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 12:14:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K49K1259Vz3bd4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 22:14:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jirg0vzi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Jirg0vzi; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K49JH6RYVz2xC6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 22:13:33 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso5413745pjk.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 03:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=WjQC5Y7ro/c9MdCjVexTb0YJtz1qK4y19XmmyHlyFew=;
 b=Jirg0vziGW8V3SRKvS+PjhON7lmoM4owOMTYOfacsP7PA1kucpsNi1ShKnC1Xkovyw
 o6U9yMSJlGTp/9bdcko9RMowA7lWuUecDmFzi+XEIU8N0VGjsiQpJZu1tXNBvuyMs/p2
 rbCJzpbTs4etXqH/zrJ3B4vY3NwUmDan5gFm5+guije2IkK/PL83p0+na++9vFREa4W4
 ArHXY4YXbYTIFTn95zCxQOQz6HcTe5XGs4vkROZUfpVuMcPdX7MbSwcnlAglD3ApP9Jx
 lWwz3Oy0jJU+P8hF7OM/qdSde4sPYz/DR+kmgZ6Fea+azQZS46sldPZe+9sBPmJhsJ8u
 +1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=WjQC5Y7ro/c9MdCjVexTb0YJtz1qK4y19XmmyHlyFew=;
 b=QnNohILWaEXdOmARIq53IhAOkeTVgXBNiBe0KVoMgTb+LHQvrMEc4FnbS+MGlLH4CV
 wowKPODdEV2scgDCDEcse1PNoLMDpbjDlTjV3+xhbxUnnDllBVrYTLxLAVhD1B6nbJQR
 YLRlo/xpcH9gs6nhr8bSbGI87UQ2IxxuloSJ7jFMaNuaiipZk1u68AN17M7FB5F/cDpI
 E/r/DjYr1jK4n5K55zL1iyxF9qR2jBW1OEi3hKlmBz1f5YKWGqFyzvc4ws3I4+9wSVtD
 vknMyDoD/msJq6itlknvFnOeZnZIY3/0rX/wDjGdmtK6PI1aLeMhK7Hg68ntJEdkuRaS
 BQqQ==
X-Gm-Message-State: AOAM533Yg9EtoZAvEVPXNInbuEg2WrF8OI1hfu61dHvOUOfK9f0Wp8T1
 U3s5Ib9UeSzlmMHkdJLuHek=
X-Google-Smtp-Source: ABdhPJyounr1R+DBw3MY3a4cGgCM4BABVn40lZPd0jyri1ZanC2IX019OiKZipTBZMe59x5+BtL/Dw==
X-Received: by 2002:a17:90b:400c:b0:1bc:7190:5696 with SMTP id
 ie12-20020a17090b400c00b001bc71905696mr2284455pjb.109.1645701211364; 
 Thu, 24 Feb 2022 03:13:31 -0800 (PST)
Received: from localhost (115-64-212-59.static.tpgi.com.au. [115.64.212.59])
 by smtp.gmail.com with ESMTPSA id q1sm2911458pfs.112.2022.02.24.03.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:13:30 -0800 (PST)
Date: Thu, 24 Feb 2022 21:13:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Arnd Bergmann <arnd@arndb.de>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
 <CAK8P3a28XEN7aH-WdR=doBQKGskiTAeNsjbfvaD5YqEZNM=v0g@mail.gmail.com>
 <1645694174.z03tip9set.astroid@bobo.none>
 <CAK8P3a1LgZkAV2wX03hAgx527MuiFt5ABWFp1bGdsTGc=8OmMg@mail.gmail.com>
In-Reply-To: <CAK8P3a1LgZkAV2wX03hAgx527MuiFt5ABWFp1bGdsTGc=8OmMg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1645700767.qxyu8a9wl9.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 3.4.x" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Arnd Bergmann's message of February 24, 2022 8:20 pm:
> On Thu, Feb 24, 2022 at 11:11 AM Nicholas Piggin <npiggin@gmail.com> wrot=
e:
>> Excerpts from Arnd Bergmann's message of February 24, 2022 6:55 pm:
>> > On Thu, Feb 24, 2022 at 6:05 AM Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>> > We had the same thing on Arm a few years ago when binutils
>> > started enforcing this more strictly, and it does catch actual
>> > bugs. I think annotating individual inline asm statements is
>> > the best choice here, as that documents what the intention is.
>>
>> A few cases where there are differences in privileged instructions
>> (that won't be compiler generated), that will be done anyway.
>>
>> For new instructions added to the ISA though? I think it's ugly and
>> unecesaary. There is no ambiguity about the intention when you see
>> a lharx instruction is there?
>>
>> It would delinate instructions that can't be used on all processors
>> but I don't see  much advantage there, it's not an exhaustive check
>> because we have other restrictions on instructions in the kernel
>> environment. And why would inline asm be special but not the rest
>> of the asm? Would you propose to put these .machine directives
>> everywhere in thousands of lines of asm code in the kernel? I
>> don't know that it's an improvement. And inline asm is a small
>> fraction of instructions.
>=20
> Most of the code is fine, as we tend to only build .S files that
> are for the given target CPU,

That's not true on powerpc at least. grep FTR_SECTION.

Not all of them are different ISA, but it's more than just the
CPU_FTR_ARCH ones which only started about POWER7.

> the explicit .machine directives are
> only needed when you have a file that mixes instructions for
> incompatible machines, using a runtime detection.

Right. There are .S files are in that category. And a lot of
it for inline and .S we probably skirt entirely due to using raw=20
instruction encoding because of old toolchains (which gets no error=20
checking at all) which we really should tidy up and trim.

>=20
>> Right that should be caught if you just pass -m<superset> architecture
>> to the assembler that does not include the mtpmr. 32-bit is a lot more
>> complicated than 64s like this though, so it's pssible in some cases
>> you will want more checking and -m<subset> + some .machine directives
>> will work better.
>>
>> Once you add the .machine directive to your inline asm though, you lose
>> *all* such static checking for the instruction. So it's really not a
>> panacea and has its own downsides.
>=20
> Again, there should be a minimum number of those .machine directives
> in inline asm as well, which tends to work out fine as long as the
> entire kernel is built with the correct -march=3D option for the minimum
> supported CPU, and stays away from inline asm that requires a higher
> CPU level.

There's really no advantage to them, and they're ugly and annoying
and if we applied the concept consistently for all asm they would grow=20
to a very large number.

The idea they'll give you good static checking just doesn't really
pan out.

Thanks,
Nick
