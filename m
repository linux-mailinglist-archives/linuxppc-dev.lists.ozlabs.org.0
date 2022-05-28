Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3E536CCA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 14:19:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9LMc1lW1z3bnH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 22:19:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AvzMe7jv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9LLy1PHzz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 22:19:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AvzMe7jv;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4L9LLs5N2mz4xXD;
	Sat, 28 May 2022 22:19:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1653740342;
	bh=/j+HIJmMfkmbpjk2Y+U/BctRdFWGNX7s73NW0Zng82A=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=AvzMe7jvohW394Rjvn3pJ+e0jKko/D/ajHbShZQA4YepGUdgnOvGY5Ps4ScqLliMc
	 hIkO7HCRI/0oXN9fhl07YSyWpjpPR+5cFRKiwUhW+tu+N9FMpBatR1ZE8HfjCsvZYo
	 CmmVCrXjGuhYKRekaBV1Z+82qxXyVb+sT6qpWvGmkDBSCpO6RJr9jJzFHQckMFMekX
	 pydPd+Lcw6fqWXzmdkkcSlv6B8A1kDiekxJ2oLotiJPGRqUdMateOctBdqMzgNPP7k
	 mLeW87cXjt4P2m5RwJfgE9aip3n2TuzdDQKmzQdGXAk6fb15ij2K1ZXb8zIFnyhjhz
	 44Ioql1onKyyg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/64: Include cache.h directly in paca.h
In-Reply-To: <dbb8260a-ee02-9fd8-707a-92166ba217be@csgroup.eu>
References: <20220527112035.2842155-1-mpe@ellerman.id.au>
 <dbb8260a-ee02-9fd8-707a-92166ba217be@csgroup.eu>
Date: Sat, 28 May 2022 22:18:54 +1000
Message-ID: <87v8tpluj5.fsf@mpe.ellerman.id.au>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 27/05/2022 =C3=A0 13:20, Michael Ellerman a =C3=A9crit=C2=A0:
>> paca.h uses ____cacheline_aligned without directly including cache.h,
>> where it's defined.
>>=20
>> For Book3S builds that's OK because paca.h includes lppaca.h, and it
>> does include cache.h.
>>=20
>> But Book3E builds have been getting cache.h indirectly via printk.h,
>> which is dicey, and in fact that include was recently removed, leading
>> to build errors such as:
>>=20
>>    ld: fs/isofs/dir.o:(.bss+0x0): multiple definition of `____cacheline_=
aligned'; fs/isofs/namei.o:(.bss+0x0): first defined here
>>=20
>> So include cache.h directly to fix the build error.
>>=20
>> Fixes: 534aa1dc975a ("printk: stop including cache.h from printk.h")
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> You've got other candidates for the fix:
>
> $ git grep -L linux/cache.h `git grep -l ____cacheline_aligned=20
> arch/powerpc`
> arch/powerpc/include/asm/hardirq.h
> arch/powerpc/include/asm/iommu.h
> arch/powerpc/include/asm/paca.h
> arch/powerpc/include/asm/processor.h
> arch/powerpc/kernel/prom_init.c
>
> Discussion at=20
> https://lore.kernel.org/lkml/e3c8b2bf-b55d-4c2c-a1cf-d5e9941e26b0@csgroup=
.eu/t/

Adding it to paca.h seems to also fix those build errors, so I'll leave
it at that for now.

Adding cache.h to those other headers should be fine, but I don't want
to do it just before sending my pull request, because changing include
order can easily cause bugs, and they're not always easy to find.

cheers
