Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE7E649C27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 11:28:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVyXK6Nmbz3cD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 21:28:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XGTT9Io5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVyWP2R5Kz3bbh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 21:28:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XGTT9Io5;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NVyWN4fhFz4xTy;
	Mon, 12 Dec 2022 21:28:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1670840881;
	bh=iOvAsyw5BbmnxwQJWCoQVJ7Qpts5NGtp1mjbOwPl9Pg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XGTT9Io5lJrouaUapoGccZjqVvP63HUU+8cuD1JOO04YPe7TAGGuQxbZEn98btcpy
	 KKlii8U7xORf/BO1SDIXhhyzV2ej7+zs2+pSnqBm6h1I80Y7bclZFYGR9S7trKNIt6
	 fakfl7hGLoQfYwBs/qFuAwomSpYoWW/YFj/ANCjlrekKQuXSwYia0E4ayLugvzQs2v
	 mrsUEra066DNNUp8Ork/nieJ/JBeVg2h7e1vcVdbmGecL5nuLASmuafAlLXK524i3/
	 JY4EFv7iFiL+hCobRj9NYBxpZ6BnOiVIFRIMWzooekv7RtKBHZrfXBbKXPcAEuiCLM
	 b+XnzC8c+fibg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Pali =?utf-8?Q?Roh?=
 =?utf-8?Q?=C3=A1r?=
 <pali@kernel.org>
Subject: Re: [PATCH v1 5/5] powerpc/64e: Fix build failure with GCC 12
 (unrecognized opcode: `wrteei')
In-Reply-To: <101320ce-8f0c-d4d8-9d73-7f231d651f4e@csgroup.eu>
References: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
 <77255a5a957967723b84d0356d9e5fb21569f4e8.1657549153.git.christophe.leroy@csgroup.eu>
 <20221211173232.7hvgnadyr7wrdm2f@pali>
 <101320ce-8f0c-d4d8-9d73-7f231d651f4e@csgroup.eu>
Date: Mon, 12 Dec 2022 21:27:59 +1100
Message-ID: <87edt4kjbk.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 11/12/2022 =C3=A0 18:32, Pali Roh=C3=A1r a =C3=A9crit=C2=A0:
>> On Monday 11 July 2022 16:19:33 Christophe Leroy wrote:
>>> With GCC 12, corenet64_smp_defconfig leads to the following build error=
s:
>>>
>>>    CC      arch/powerpc/kernel/irq.o
>>> {standard input}: Assembler messages:
>>> {standard input}:3616: Error: unrecognized opcode: `wrteei'
>>> {standard input}:5689: Error: unrecognized opcode: `wrteei'
>>>    CC      arch/powerpc/kernel/pmc.o
>>> {standard input}: Assembler messages:
>>> {standard input}:42: Error: unrecognized opcode: `mfpmr'
>>> {standard input}:53: Error: unrecognized opcode: `mtpmr'
>>>    CC      arch/powerpc/kernel/io.o
>>> {standard input}: Assembler messages:
>>> {standard input}:376: Error: unrecognized opcode: `mbar'
>>> ...
>>>    CC      arch/powerpc/mm/nohash/book3e_hugetlbpage.o
>>> {standard input}: Assembler messages:
>>> {standard input}:291: Error: unrecognized opcode: `tlbsx'
>>> {standard input}:482: Error: unrecognized opcode: `tlbwe'
>>> {standard input}:608: Error: unrecognized opcode: `lbarx'
>>> {standard input}:608: Error: unrecognized opcode: `stbcx.'
>>>
>>> -mpcu=3Dpowerpc64 cannot be used anymore for book3e, it must be a booke=
 CPU.
>>>
>>> But then we get:
>>>
>>>    CC      arch/powerpc/lib/xor_vmx.o
>>> cc1: error: AltiVec not supported in this target
>>>
>>> Altivec is not supported with -mcpu=3De5500 so don't allow selection
>>> of altivec when e5500 is selected.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/Makefile                  | 8 +-------
>>>   arch/powerpc/platforms/Kconfig.cputype | 8 ++++----
>>>   2 files changed, 5 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>>> index d54e1fe03551..02742facf895 100644
>>> --- a/arch/powerpc/Makefile
>>> +++ b/arch/powerpc/Makefile
>>> @@ -168,13 +168,7 @@ endif
>>>   CFLAGS-$(CONFIG_TARGET_CPU_BOOL) +=3D $(call cc-option,-mcpu=3D$(CONF=
IG_TARGET_CPU))
>>>   AFLAGS-$(CONFIG_TARGET_CPU_BOOL) +=3D $(call cc-option,-mcpu=3D$(CONF=
IG_TARGET_CPU))
>>>=20=20=20
>>> -# Altivec option not allowed with e500mc64 in GCC.
>>> -ifdef CONFIG_ALTIVEC
>>> -E5500_CPU :=3D -mcpu=3Dpowerpc64
>>> -else
>>> -E5500_CPU :=3D $(call cc-option,-mcpu=3De500mc64,-mcpu=3Dpowerpc64)
>>> -endif
>>> -CFLAGS-$(CONFIG_E5500_CPU) +=3D $(E5500_CPU)
>>> +CFLAGS-$(CONFIG_E5500_CPU) +=3D $(call cc-option,-mcpu=3De500mc64,-mcp=
u=3Dpowerpc64)
>>>   CFLAGS-$(CONFIG_E6500_CPU) +=3D $(call cc-option,-mcpu=3De6500,$(E550=
0_CPU))
>>=20
>> Hello! I think that there is an issue. After removal of E5500_CPU
>> variable few line above, it cannot be used in CFLAGS-$(CONFIG_E6500_CPU)
>> assignment, because it is empty.
>>=20
>
> Ah yes, you are right.
>
> It should be fixed by=20
> https://github.com/linuxppc/linux/commit/f2636eaac7dee1d7d096cc115ff4f511=
1b0c508c
>
> Michael, I see the patch is in next-test. Can you add:
>
> Fixes: d6b551b8f90c ("powerpc/64e: Fix build failure with GCC 12=20
> (unrecognized opcode: `wrteei')")

Yep, will do.

cheers
