Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A143FB001
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 05:25:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GybLV0ZCSz2ymc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 13:25:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NQpxxMrz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NQpxxMrz; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GybKn41z9z2xrT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 13:25:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GybKl1zvJz9sWX;
 Mon, 30 Aug 2021 13:24:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630293899;
 bh=azDy/pRXd6rkN42GHj46yzloDrZGNbZBeY0LIDbt0jI=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=NQpxxMrz4TrxM2YU2X+D/DzRCrFH5NgmTddX9dS2ke3vx1jhv5c16XMl7+Lqx/cDv
 s3LKz0uyFHKAx9yMpQTYXL7tEgbvwC7HCovtGHfmFqQ8XLqqT85UX38NjxZd4S4Gp/
 DS6Q5ZIgcfXZPbJu4OjgQGKCFGYGnb559ewUX8y7/+qxKKGPk/D6cI8iHIu95NdUSV
 FwvvFU4JVxqr1ldmCA+1qxQXiSsoFcG2FK7H+uFfLE8162zw77EEoPnXiNmcNFqU0j
 2YlojzcyvuXisgQDg9NjI60ffONdxz/+iHBt/zjhSDv1ylHFGE2b/TNnhZHBodHyTZ
 YF++4KU+rJqvQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 6/6] powerpc/microwatt: Stop building the hash MMU code
In-Reply-To: <1d1484fe-70db-bafc-016f-29671e941bc8@csgroup.eu>
References: <20210827163410.1177154-1-npiggin@gmail.com>
 <20210827163410.1177154-7-npiggin@gmail.com>
 <1d1484fe-70db-bafc-016f-29671e941bc8@csgroup.eu>
Date: Mon, 30 Aug 2021 13:24:54 +1000
Message-ID: <87y28jehrt.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 27/08/2021 =C3=A0 18:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Microwatt is radix-only, so stop selecting the hash MMU code.
>>=20
>> This saves 20kB compressed dtbImage and 56kB vmlinux size.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/configs/microwatt_defconfig | 1 -
>>   arch/powerpc/platforms/Kconfig.cputype   | 1 +
>>   arch/powerpc/platforms/microwatt/Kconfig | 1 -
>>   3 files changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/con=
figs/microwatt_defconfig
>> index bf5f2e5905eb..6fbad42f9e3d 100644
>> --- a/arch/powerpc/configs/microwatt_defconfig
>> +++ b/arch/powerpc/configs/microwatt_defconfig
>> @@ -26,7 +26,6 @@ CONFIG_PPC_MICROWATT=3Dy
>>   # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
>>   CONFIG_CPU_FREQ=3Dy
>>   CONFIG_HZ_100=3Dy
>> -# CONFIG_PPC_MEM_KEYS is not set
>>   # CONFIG_SECCOMP is not set
>>   # CONFIG_MQ_IOSCHED_KYBER is not set
>>   # CONFIG_COREDUMP is not set
>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platf=
orms/Kconfig.cputype
>> index 9b90fc501ed4..b9acd6c68c81 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>> @@ -371,6 +371,7 @@ config SPE
>>   config PPC_64S_HASH_MMU
>>   	bool "Hash MMU Support"
>>   	depends on PPC_BOOK3S_64
>> +	depends on !PPC_MICROWATT
>
> Do we really want to start nit picking which platforms can select such or=
 such option ?
> Isn't it enough to get it off through the defconfig ?
>
> Is PPC_MICROWATT mutually exclusive with other book3s64 configs ? Don't w=
e build multiplatform kernels ?

Yeah that belongs in the microwatt defconfig, not as a forced exclusion
in Kconfig.

cheers
