Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2EB2CD12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 19:05:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45D0Zw0t6JzDqJs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 03:05:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45D0YJ1TpRzDqCx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 03:03:48 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45D0YB2pz3z9tyRn;
 Tue, 28 May 2019 19:03:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zifMpZ7Ll3nN; Tue, 28 May 2019 19:03:42 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45D0YB21rQz9tyRm;
 Tue, 28 May 2019 19:03:42 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 0690589D; Tue, 28 May 2019 19:03:41 +0200 (CEST)
Received: from 37-170-84-163.coucou-networks.fr
 (37-170-84-163.coucou-networks.fr [37.170.84.163]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Tue, 28 May 2019 19:03:41 +0200
Date: Tue, 28 May 2019 19:03:41 +0200
Message-ID: <20190528190341.Horde.nTXOule-IO2ReXFiNIqNbg8@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 14/16] powerpc/32: implement fast entry for syscalls
 on BOOKE
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
 <3e254178a157e7eaeef48f983880f71f97d1f296.1556627571.git.christophe.leroy@c-s.fr>
 <20190523061427.GA19655@blackberry>
 <98bf5745-88ae-7f17-fcb9-7d06ba5b9e49@c-s.fr>
 <58f0e70f-ed9d-965e-e8d2-cc5d13a4c9eb@c-s.fr>
 <87r28jp2b0.fsf@concordia.ellerman.id.au>
In-Reply-To: <87r28jp2b0.fsf@concordia.ellerman.id.au>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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

Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:

> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Le 23/05/2019 =C3=A0 09:00, Christophe Leroy a =C3=A9crit=C2=A0:
>>
>> [...]
>>
>>>> arch/powerpc/kernel/head_fsl_booke.o: In function `SystemCall':
>>>> arch/powerpc/kernel/head_fsl_booke.S:416: undefined reference to
>>>> `kvmppc_handler_BOOKE_INTERRUPT_SYSCALL_SPRN_SRR1'
>>>> Makefile:1052: recipe for target 'vmlinux' failed
>>>>
>>>>> +.macro SYSCALL_ENTRY trapno intno
>>>>> +=C2=A0=C2=A0=C2=A0 mfspr=C2=A0=C2=A0=C2=A0 r10, SPRN_SPRG_THREAD
>>>>> +#ifdef CONFIG_KVM_BOOKE_HV
>>>>> +BEGIN_FTR_SECTION
>>>>> +=C2=A0=C2=A0=C2=A0 mtspr=C2=A0=C2=A0=C2=A0 SPRN_SPRG_WSCRATCH0, r10
>>>>> +=C2=A0=C2=A0=C2=A0 stw=C2=A0=C2=A0=C2=A0 r11, THREAD_NORMSAVE(0)(r10=
)
>>>>> +=C2=A0=C2=A0=C2=A0 stw=C2=A0=C2=A0=C2=A0 r13, THREAD_NORMSAVE(2)(r10=
)
>>>>> +=C2=A0=C2=A0=C2=A0 mfcr=C2=A0=C2=A0=C2=A0 r13=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* save CR in r13 for now=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +=C2=A0=C2=A0=C2=A0 mfspr=C2=A0=C2=A0=C2=A0 r11, SPRN_SRR1
>>>>> +=C2=A0=C2=A0=C2=A0 mtocrf=C2=A0=C2=A0=C2=A0 0x80, r11=C2=A0=C2=A0=C2=
=A0 /* check MSR[GS] without clobbering reg */
>>>>> +=C2=A0=C2=A0=C2=A0 bf=C2=A0=C2=A0=C2=A0 3, 1975f
>>>>> +=C2=A0=C2=A0=C2=A0 b=C2=A0=C2=A0=C2=A0 kvmppc_handler_BOOKE_INTERRUP=
T_\intno\()_SPRN_SRR1
>>>>
>>>> It seems to me that the "_SPRN_SRR1" on the end of this line
>>>> isn't meant to be there...=C2=A0 However, it still fails to link with =
that
>>>> removed.
>>
>> It looks like I missed the macro expansion.
>>
>> The called function should be kvmppc_handler_8_0x01B
>>
>> Seems like kisskb doesn't build any config like this.
>
> I thought we did, ie:
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/13817941/

That's a ppc64 config it seems. The problem was on booke32.

Christophe

>
> But clearly something is missing to trigger the bug.
>
> cheers


