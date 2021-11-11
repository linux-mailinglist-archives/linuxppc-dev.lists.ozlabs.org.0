Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E1544D509
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 11:33:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqdN05sZSz3c60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 21:33:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o3WOB0Xf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqdML54jLz2yPp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 21:32:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o3WOB0Xf; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HqdML24Ldz4xbc;
 Thu, 11 Nov 2021 21:32:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636626750;
 bh=SiMMARNVve8WQYY6T28cnDWh52KGuXpXuiB584amZyc=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=o3WOB0Xfoo69eugahPlnU4kc6Tx0tbJd6WqaLRc2GCQGTILC0bt0GlUpJS4QWWJTO
 +t9ErEpysmyoPkErjj8gj89L3ATxTngHc1vyHV2psPQRHpaJLq8z6W4wMrINr8LWbX
 CvMBRx6nz1wCPpHZzTNnEt9xPKWj0E2kFPRTq3AVxPUgr/Hg70D0tcin/lnBfWoioC
 0RorYqpCIbHs1Rjoif0A5hFpR9hIlQp5G1Ffuv2yVYDev3hz5mzkJLhx2q4yNEk7kw
 5eYpfgCSqLktoGHIGzZ0gCOl9qhOOM5jFP7fvwYrJPC0aNavbI/KwF+6w/VqqN/0gt
 MXPkr+uNGvT/w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/64s: introduce CONFIG_MAXSMP to test very
 large SMP
In-Reply-To: <c363e53c-cba5-5711-e8c4-6d74c44f99be@csgroup.eu>
References: <20211109065131.2041720-1-npiggin@gmail.com>
 <c363e53c-cba5-5711-e8c4-6d74c44f99be@csgroup.eu>
Date: Thu, 11 Nov 2021 21:32:28 +1100
Message-ID: <87ilwzm18j.fsf@mpe.ellerman.id.au>
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
> Le 09/11/2021 =C3=A0 07:51, Nicholas Piggin a =C3=A9crit=C2=A0:
...
>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platf=
orms/Kconfig.cputype
>> index a208997ade88..14c275e0ff93 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>> @@ -475,9 +475,14 @@ config SMP
>>=20=20=20
>>   	  If you don't know what to do here, say N.
>>=20=20=20
>> +# MAXSMP sets 8192 if COMPILE_TEST because that's what x86 has flushed =
out.
>> +# Exceeding that will cause a lot of compile errors. Have to deal with =
those
>> +# first.
>>   config NR_CPUS
>> -	int "Maximum number of CPUs (2-8192)" if SMP
>> -	range 2 8192 if SMP
>> +	int "Maximum number of CPUs (2-8192)" if SMP && !MAXSMP
>> +	range 2 16384 if SMP
>> +	default 16384 if MAXSMP && !COMPILE_TEST
>> +	default 8192 if MAXSMP && COMPILE_TEST
>
> You can do less complex. First hit becomes the default, so you can do:
>
> 	default 8192 if MAXSMP && COMPILE_TEST
> 	default 16384 if MAXSMP

I did that when applying.

cheers
