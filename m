Return-Path: <linuxppc-dev+bounces-2897-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E899A9BDF1C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 08:06:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xjx8b1cDbz2yh1;
	Wed,  6 Nov 2024 18:06:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730876815;
	cv=none; b=JiT3tNa/gPazBtdSB1Eq0EiJrwr6ErvcfMih/QTV3uduy/OvtGzI0mwZOtdGrjXcD4m8Kd3YyxlNmHqDASvw+nXIf1amnDotidvZ3uyRzi9K/yX1lHdIg/uoicjtfHvkX5uvLFJ4D3wnm4PSLmDJOqwp7cqlpb+3IfZHoqzBqDq/v1Q4nnN1+lu44Yy4/piVQZmqsKJA+LDskxvD3zgJD8cQWyXxHHqiMgiqkDbBMfKOxxStF31rXUO+XBit3TDCCY1tFZ6DATCKPvQKJ7czxzAZSgYrzaUgL1jgBhth5/YbWDlgX326qYQX51Zttgk80kWqEz9qNX304AlGT19oYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730876815; c=relaxed/relaxed;
	bh=yAUFaVAsNQ/ccJyGlmMcytG2+Qr2oEjByXJHlP+rk68=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ke+WkWHrITTSCW7QCa8nQue9AlMs2aM1JADFqu9OOWftDp/9UJP5rRDciK+b7fu732ShaAq2E+zoa2YIpsK5kSblaZEDYyHZOeIrfAJOzi6EWJNouhkeDBNSAcRCM1p2bIDHprtADzdjic2T62asqn/bbEy4F/7pDzCfgc7wO+p1CGsR4HXZT97/ivGtVHGJk9uuxPn38zmmd92fSzW/AfGFHDwMz9fDi/51nVKgVZqgwpbDNPLU7yV806lOrKSWVeXTCubMZTXg2xgFdaNxZb87VLjwUHbh1IQaE5OxOn+O20nLJl2HRCxWDR70dFnI7TV3UYXpc0EjDLBUlDtvLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h80rEgtJ; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h80rEgtJ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xjx8X35h0z2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 18:06:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730876806;
	bh=yAUFaVAsNQ/ccJyGlmMcytG2+Qr2oEjByXJHlP+rk68=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h80rEgtJ7qD9jyDyLJcISbRk3INZH8ZPcYosK4VrHHZVogREXxmMdnucgdz5uGIVq
	 2FKIvnwHaCmTCM5h2wCPV5BHvVPqGtTkGb8EMAQ3QpqRcFOIuuN9J+N+f2mo7sMJe/
	 dU4VVqU+Z1FcyNgWJiu6rzNqueMfO3e6FKKNop6UZT1IVzPlW79wIw8rl8ikKnhRpJ
	 +n1/bbdRaP9EQPbjeaxIqHG5JuYMBpoWql3abi4yDgJ1tGm3FhgLFRk5m7yklMr2OW
	 JsGlZDD1354L3XGFFlQ4dOrEE1hpvtyE9IKa50nyhPWS+nOpSyzlxB/+3KkxmrZtK5
	 AOEEtdbWDj8jw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xjx8D1mmSz4x11;
	Wed,  6 Nov 2024 18:06:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner
 <tglx@linutronix.de>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Russell
 King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nam Cao
 <namcao@linutronix.de>
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
In-Reply-To: <e33569c8-1591-462c-9388-4a514e156bfa@csgroup.eu>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <871pzxzuny.ffs@tglx> <e33569c8-1591-462c-9388-4a514e156bfa@csgroup.eu>
Date: Wed, 06 Nov 2024 18:06:35 +1100
Message-ID: <877c9glu2s.fsf@mpe.ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 30/10/2024 =C3=A0 12:39, Thomas Gleixner a =C3=A9crit=C2=A0:
>> Folks!
>>=20
>> On Thu, Oct 10 2024 at 09:01, Thomas Wei=C3=9Fschuh wrote:
>>> Historically each architecture defined their own datapage to store the
>>> VDSO data. This stands in contrast to the generic nature of the VDSO
>>> code itself.
>>> We plan to introduce a generic framework for the management of the VDSO
>>> data storage that can be used by all architectures and which works
>>> together with the existing generic VDSO code.
>>>
>>> Before that is possible align the different architectures by
>>> standardizing on the existing generic infrastructure and moving things
>>> out of the VDSO data page which does not belong there.
>>>
>>> Patches	 1- 2:	csky
>>> Patch	    3:	s390
>>> Patches	 4- 5:	arm64
>>> Patch	    6:	riscv
>>> Patch	    7:	arm
>>> Patch	    8:	LoongArch
>>> Patch	    9:	MIPS
>>> Patches 10-20:	x86
>>> Patches 21-27:	powerpc
>>> Patch      28: 	Renamings to avoid a name clash with the new code.
>>=20
>> As this has been sitting for two weeks now without major comments, I'm
>> planning to merge that through the tip tree tomorrow.
>
> To avoid any future conflicts with powerpc tree, I suggest you merge=20
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git=20
> topic/vdso into your tree before applying this series.

I thought the same, but there actually isn't any conflict at the moment
between the two trees.

Some of Thomas W's later changes to convert arches to generic VDSO
storage do conflict, but they look to be destined for the next merge
window.

cheers

