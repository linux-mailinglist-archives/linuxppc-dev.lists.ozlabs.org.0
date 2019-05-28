Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 215CB2BEB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 07:43:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CjRq4ndszDq8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 15:43:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CjKM1R6PzDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 15:37:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45CjKM0Ldgz9sB3;
 Tue, 28 May 2019 15:37:27 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v3 14/16] powerpc/32: implement fast entry for syscalls on
 BOOKE
In-Reply-To: <58f0e70f-ed9d-965e-e8d2-cc5d13a4c9eb@c-s.fr>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
 <3e254178a157e7eaeef48f983880f71f97d1f296.1556627571.git.christophe.leroy@c-s.fr>
 <20190523061427.GA19655@blackberry>
 <98bf5745-88ae-7f17-fcb9-7d06ba5b9e49@c-s.fr>
 <58f0e70f-ed9d-965e-e8d2-cc5d13a4c9eb@c-s.fr>
Date: Tue, 28 May 2019 15:37:23 +1000
Message-ID: <87r28jp2b0.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 23/05/2019 =C3=A0 09:00, Christophe Leroy a =C3=A9crit=C2=A0:
>
> [...]
>
>>> arch/powerpc/kernel/head_fsl_booke.o: In function `SystemCall':
>>> arch/powerpc/kernel/head_fsl_booke.S:416: undefined reference to=20
>>> `kvmppc_handler_BOOKE_INTERRUPT_SYSCALL_SPRN_SRR1'
>>> Makefile:1052: recipe for target 'vmlinux' failed
>>>
>>>> +.macro SYSCALL_ENTRY trapno intno
>>>> +=C2=A0=C2=A0=C2=A0 mfspr=C2=A0=C2=A0=C2=A0 r10, SPRN_SPRG_THREAD
>>>> +#ifdef CONFIG_KVM_BOOKE_HV
>>>> +BEGIN_FTR_SECTION
>>>> +=C2=A0=C2=A0=C2=A0 mtspr=C2=A0=C2=A0=C2=A0 SPRN_SPRG_WSCRATCH0, r10
>>>> +=C2=A0=C2=A0=C2=A0 stw=C2=A0=C2=A0=C2=A0 r11, THREAD_NORMSAVE(0)(r10)
>>>> +=C2=A0=C2=A0=C2=A0 stw=C2=A0=C2=A0=C2=A0 r13, THREAD_NORMSAVE(2)(r10)
>>>> +=C2=A0=C2=A0=C2=A0 mfcr=C2=A0=C2=A0=C2=A0 r13=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* save CR in r13 for now=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 mfspr=C2=A0=C2=A0=C2=A0 r11, SPRN_SRR1
>>>> +=C2=A0=C2=A0=C2=A0 mtocrf=C2=A0=C2=A0=C2=A0 0x80, r11=C2=A0=C2=A0=C2=
=A0 /* check MSR[GS] without clobbering reg */
>>>> +=C2=A0=C2=A0=C2=A0 bf=C2=A0=C2=A0=C2=A0 3, 1975f
>>>> +=C2=A0=C2=A0=C2=A0 b=C2=A0=C2=A0=C2=A0 kvmppc_handler_BOOKE_INTERRUPT=
_\intno\()_SPRN_SRR1
>>>
>>> It seems to me that the "_SPRN_SRR1" on the end of this line
>>> isn't meant to be there...=C2=A0 However, it still fails to link with t=
hat
>>> removed.
>
> It looks like I missed the macro expansion.
>
> The called function should be kvmppc_handler_8_0x01B
>
> Seems like kisskb doesn't build any config like this.

I thought we did, ie:

http://kisskb.ellerman.id.au/kisskb/buildresult/13817941/

But clearly something is missing to trigger the bug.

cheers
