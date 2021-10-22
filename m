Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 771844374BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 11:31:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbJxZ0Ndcz3cTH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 20:30:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bPdiZnym;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bPdiZnym; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbJwv4Qvxz2ywK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 20:30:22 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id f11so3069972pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 02:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=y+3XJCBQZO05zmAzAE0qZdto5aQaryuy8ArBAo5K6us=;
 b=bPdiZnymUheBRVxYTP17MvFMxLJLDEICuwRm7D90G8TgI6dGISb3CAukKrLZ/H1BUt
 db3ecz5u8gJh1fn7xtNP4XcF31cc0yL3BzecK4ogQwWG5oJOkw82cDHsu0mbdRUg4/cG
 OgatM8Jn7CTJSH1mqHH2hi/YSR+Pxdzix6cvucXo2A7pCjjF1SlJqdp8bstTN4zxIXLP
 rBHkuTRSNfcdex07751yd2Ott/3NxqpjWiEYsuyVEs3UWuyZ0ymh1UqaAztSQ7oog7Vb
 GXcnAjhd4aY3egmJonE2yGVtTJNUxuQPXnJNLWKmBvTz3Q9rQK16LjJJLjNPCFpvSh79
 7y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=y+3XJCBQZO05zmAzAE0qZdto5aQaryuy8ArBAo5K6us=;
 b=nKQ2f4CdqfTA82LC/daRpcx204EQOrDsXQ2aktCQREUd8as1QNgT5lZFWM2Z3cSWCP
 gJYfnhB8wDzDXBmriv7UlYCjHiXm7KaBYSBtWQk9RRYod4FY515SMUQPP0OgWK+tRNTm
 gFXF6Oo3Y5XOLs2ocI5bUA+1Idtyq+uijmnFRMnZvi1tih2DzpxbdU8RRw0mH7bj4bks
 z/biPrmLsGI8wa7ovFUc2fUj3N2Lzduv3l7nAzyhSJTIXUIECZDqXj3ONvHrrELdiaXp
 GFkMy++7zia6/K7/QpC7EOnkuTXBzVd6/DjoS96hwFjOnrtbrNrhtx06cio9bnGu4qlz
 frhw==
X-Gm-Message-State: AOAM531C1vn97ueUB/rxRsy2/IEkt2zJrba27mZEHF5WcYr3K/YnyOW6
 hrEV5W1C9akZn7vw0vGyrHg=
X-Google-Smtp-Source: ABdhPJzFG3JUmZV3Wvmt26mdQYRshftPb+GqjosMGQJVBj+Zb49p375+Kc64qL9C1eS1c+wGC57afg==
X-Received: by 2002:a05:6a00:230e:b0:44c:4f2d:9b00 with SMTP id
 h14-20020a056a00230e00b0044c4f2d9b00mr11164126pfh.24.1634895018821; 
 Fri, 22 Oct 2021 02:30:18 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id u193sm7468190pgc.34.2021.10.22.02.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 02:30:18 -0700 (PDT)
Date: Fri, 22 Oct 2021 19:30:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 15/18] powerpc/64s: Make hash MMU support configurable
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211021223013.2641952-1-npiggin@gmail.com>
 <20211021223013.2641952-16-npiggin@gmail.com>
 <7e10f779-e968-e723-cdbc-4510acdf64a8@csgroup.eu>
In-Reply-To: <7e10f779-e968-e723-cdbc-4510acdf64a8@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634894498.go7wwenl1p.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of October 22, 2021 5:02 pm:
>=20
>=20
> Le 22/10/2021 =C3=A0 00:30, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This adds Kconfig selection which allows 64s hash MMU support to be
>> disabled. It can be disabled if radix support is enabled, the minimum
>> supported CPU type is POWER9 (or higher), and KVM is not selected.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/Kconfig                     |  3 ++-
>>   arch/powerpc/include/asm/mmu.h           | 16 ++++++++++---
>>   arch/powerpc/kernel/dt_cpu_ftrs.c        | 14 ++++++++----
>>   arch/powerpc/kvm/Kconfig                 |  1 +
>>   arch/powerpc/mm/init_64.c                | 15 +++++++++---
>>   arch/powerpc/platforms/Kconfig.cputype   | 29 ++++++++++++++++++++++--
>>   arch/powerpc/platforms/cell/Kconfig      |  1 +
>>   arch/powerpc/platforms/maple/Kconfig     |  1 +
>>   arch/powerpc/platforms/microwatt/Kconfig |  2 +-
>>   arch/powerpc/platforms/pasemi/Kconfig    |  1 +
>>   arch/powerpc/platforms/powermac/Kconfig  |  1 +
>>   arch/powerpc/platforms/powernv/Kconfig   |  2 +-
>>   12 files changed, 71 insertions(+), 15 deletions(-)
>>=20
>=20
>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platf=
orms/Kconfig.cputype
>> index a208997ade88..1cf254a5d5d4 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>=20
>> @@ -364,6 +371,17 @@ config SPE
>>  =20
>>   	  If in doubt, say Y here.
>>  =20
>> +config PPC_64S_HASH_MMU
>> +	bool "Hash MMU Support"
>> +	depends on PPC_BOOK3S_64
>> +	select PPC_MM_SLICES
>> +	default y
>> +	help
>> +	  Enable support for the Power ISA Hash style MMU. This is implemented
>> +	  by all IBM Power and other Book3S CPUs.
>> +
>> +	  If you're unsure, say Y.
>> +
>>   config PPC_RADIX_MMU
>>   	bool "Radix MMU Support"
>>   	depends on PPC_BOOK3S_64
>> @@ -374,9 +392,10 @@ config PPC_RADIX_MMU
>>   	  is only implemented by IBM Power9 CPUs, if you don't have one of th=
em
>>   	  you can probably disable this.
>>  =20
>> -config PPC_RADIX_MMU_DEFAULT
>> +config PPC_RADIX_MMU_DEFAULT_OPTION
>>   	bool "Default to using the Radix MMU when possible"
>>   	depends on PPC_RADIX_MMU
>> +	depends on PPC_64S_HASH_MMU
>>   	default y
>>   	help
>>   	  When the hardware supports the Radix MMU, default to using it unles=
s
>> @@ -387,6 +406,12 @@ config PPC_RADIX_MMU_DEFAULT
>>  =20
>>   	  If you're unsure, say Y.
>>  =20
>> +config PPC_RADIX_MMU_DEFAULT
>> +	bool
>> +	depends on PPC_BOOK3S_64
>> +	depends on PPC_RADIX_MMU_DEFAULT_OPTION || !PPC_64S_HASH_MMU
>> +	default y
>> +
>=20
> Why do you need that PPC_RADIX_MMU_DEFAULT_OPTION ?
>=20
> What about
>=20
> 	config PPC_RADIX_MMU_DEFAULT
> 		bool "Default to using the Radix MMU when possible" if PPC_64S_HASH_MMU
> 		depends on PPC_RADIX_MMU
> 		depends on PPC_BOOK3S_64
> 		default y

That's what I was trying to do I guess, I forget about the if clause on=20
the bool option.

>> diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platform=
s/cell/Kconfig
>> index db4465c51b56..faa894714a2a 100644
>> --- a/arch/powerpc/platforms/cell/Kconfig
>> +++ b/arch/powerpc/platforms/cell/Kconfig
>> @@ -8,6 +8,7 @@ config PPC_CELL_COMMON
>>   	select PPC_DCR_MMIO
>>   	select PPC_INDIRECT_PIO
>>   	select PPC_INDIRECT_MMIO
>> +	select PPC_64S_HASH_MMU
>=20
> Is this one (and the others) needed ?
>=20
> Because it PPC_64S_HASH_MMU is 'default y', selection shouldn't be=20
> needed I think.
>=20
> Did you check with savedefconfig ?

The platform ones maybe aren't needed but it's because the cpu type=20
support selects hash (I don't want it to be configurable even if it=20
defaults to y). But it probably makes better sense to select this with=20
CPU type support rather than platform.

Thanks,
Nick
