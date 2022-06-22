Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F2554088
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 04:27:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSS3J6fZ2z2yJQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 12:27:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n41Lv86J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSS2h28zrz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 12:27:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n41Lv86J;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSS2d4vzDz4xYD;
	Wed, 22 Jun 2022 12:27:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1655864842;
	bh=7wPtZzilp6XrJMCgGLGRvDuLvLC6U9nqxWFY5hLeiBI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n41Lv86JCLLl20DlEOzBjcnAn1OC1vElApH2qZCKvox+q4g7enU6aF6epC4RabuDS
	 Rf80qAlUnXvfmOUTHpW159oRvnK5yYKSiEYqEP/UobHU9cltf1AIcdbbu2gzssFLhx
	 5WPIGJrMz9jMf5ahU23TzAw8NruEH0OHAWbSKtZsigbudrhTroTdqCyx5qrjOkU6HB
	 EkAOlRCrXq29ZIRZwOTxOMJraMOmnWXl3GHfadOtpo+MX0IE9N6cBdc9jmyVzn3+zy
	 nwXMBQHfXL6UGvYnU49sXOCCjyo/iu3jKfi/7Rc+3TTG6mG/rCVMBDynuOFF9Pe2uy
	 60TkysKix9/Eg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Subject: Re: [PATCH v5] powerpc/powernv: wire up rng during setup_arch
In-Reply-To: <a354de5e-1d07-3759-a55e-a9179890cfaa@csgroup.eu>
References: <20220620124531.78075-1-Jason@zx2c4.com>
 <20220621140849.127227-1-Jason@zx2c4.com>
 <246d8bf0-2bee-7e1b-e0af-408920ece309@csgroup.eu>
 <YrISWLwm8m7OPFom@zx2c4.com>
 <a354de5e-1d07-3759-a55e-a9179890cfaa@csgroup.eu>
Date: Wed, 22 Jun 2022 12:27:20 +1000
Message-ID: <87bkulzb3r.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 21/06/2022 =C3=A0 20:47, Jason A. Donenfeld a =C3=A9crit=C2=A0:
>> On Tue, Jun 21, 2022 at 06:33:11PM +0000, Christophe Leroy wrote:
>>> Le 21/06/2022 =C3=A0 16:08, Jason A. Donenfeld a =C3=A9crit=C2=A0:
>>>> The platform's RNG must be available before random_init() in order to =
be
>>>> useful for initial seeding, which in turn means that it needs to be
>>>> called from setup_arch(), rather than from an init call. Fortunately,
>>>> each platform already has a setup_arch function pointer, which means we
>>>> can wire it up that way. Complicating things, however, is that POWER8
>>>> systems need some per-cpu state and kmalloc, which isn't available at
>>>> this stage. So we split things up into an early phase and a later
>>>> opportunistic phase. This commit also removes some noisy log messages
>>>> that don't add much.
>>>
>>> Regarding the kmalloc(), I have not looked at it in details, but usually
>>> you can use memblock_alloc() when kmalloc is not available yet.
>>=20
>> That seems a bit excessive, especially as those allocations are long
>> lived. And we don't even *need* it that early, but just before
>> random_init(). Michael is running this v5 on the test rig overnight, so
>> we'll learn in the Australian morning whether this finally did the trick
>> (I hope).
>
> The fact that they are long lived make them a good candidate for=20
> memblock_alloc().
>
> But fair enough, if they are not required that early then just do it late=
r.

memblock works but then we trip on ioremap vs early_ioremap.

Fixing that is a bit of a pain as we'd have to stop using of_iomap() and
we'd also need to switch the mappings to ioremap() later in boot.

We'd also have to defer the percpu initialisation.

So it's all just a bit of a pain when we actually only need to get the
hook ready before random_init() which is called much later in boot when
slab/ioremap/percpu are all ready.

cheers
