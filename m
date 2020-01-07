Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3DE131CD2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 01:41:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sD8b4CxMzDqSC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 11:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sD6D2s9HzDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 11:39:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="COme/140"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47sD6868DMz9sPn;
 Tue,  7 Jan 2020 11:39:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1578357571;
 bh=gEy8/XmvrwhJ7zXU9Kgcq82Oqt0uvoWrH3tqQSHf+ho=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=COme/140tYl4h6k9CnUqlDiAANv6KA4f/AlVEENmwEA0YgvdZl16ALe9sH+QgfMx4
 nDmE+nhVnKfB3HF930Ud8b109CLJYQ37+xuhI96oHK2z4h5uYumAt49fbTckPZvSlK
 MLCXIF9k99tIXl+0CLkMGaGvGmaD5BXEwXd0VVW+ZvsFzdUtw8PwlJAIxsn0+sGcYq
 FRYDn1ugNO9+rLOxclV1tDz5c9k0TrOnyKcfqOrBowgcm0CeQcb24spXTx3+cZvaVZ
 txOrKFYBOvG4XHKUeeePi2J/bg9KeBt4ead4qyHDb3LUOfK/lE1FjzFnQa3euLaiPZ
 XlhNiOE3GBs9Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Romain Dolbeau <romain@dolbeau.org>
Subject: Re: PPC64: G5 & 4k/64k page size (was: Re: Call for report -
 G5/PPC970 status)
In-Reply-To: <874kx81xxt.fsf@linux.ibm.com>
References: <CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
 <e87e2397-a8d4-c928-d3d4-7ae700603770@physik.fu-berlin.de>
 <CA+7wUsxBkmG-jW_UVBUuMriZbDkJko3kg0hzmMrVMoJLu2+rPw@mail.gmail.com>
 <CADuzgbqoX3DQ6OVqdR6dw1oqnNn-Q0zLPshDi23DwDtYukDYdg@mail.gmail.com>
 <CADuzgboWQtVqp7-Ru4uQQaPerkhLnaS9=WiwX2dD4-5VypT2MA@mail.gmail.com>
 <CADuzgboYv69FQxQRvJ_Bd563OPO0e=USd+cTChfDK60D5x75hw@mail.gmail.com>
 <b2256437-efe1-909d-1488-174b6522f9e0@physik.fu-berlin.de>
 <87eexbk3gw.fsf@linux.ibm.com>
 <CADuzgbq-P8mgf9zLaxhdqUfQcqfRpSzjgRoofF84rp+-S064xg@mail.gmail.com>
 <87mubxl82x.fsf@igel.home>
 <CADuzgbqU-SVy5U_4Pkv2G8SJcT9JhyirhFGamnQusZBSRSgcPw@mail.gmail.com>
 <87immlkytp.fsf@igel.home>
 <CADuzgbo=Yr09hxrkbkwj7Crg0aUfx+RQZOt0sCSNOeYUfR0SmA@mail.gmail.com>
 <87lfr62tbf.fsf@linux.ibm.com>
 <CADuzgbq3V0F=vob-tB=rroBaLwNR4viS2-=39TRBMyQwdj+xuw@mail.gmail.com>
 <874kx81xxt.fsf@linux.ibm.com>
Date: Tue, 07 Jan 2020 11:39:26 +1100
Message-ID: <8736cs2j7l.fsf@mpe.ellerman.id.au>
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
Cc: Andreas Schwab <schwab@linux-m68k.org>,
 PowerPC List Debian <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org, jjhdiederen <jjhdiederen@zonnet.nl>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Romain Dolbeau <romain@dolbeau.org> writes:
>
>> Le sam. 21 d=C3=A9c. 2019 =C3=A0 05:31, Aneesh Kumar K.V
>> <aneesh.kumar@linux.ibm.com> a =C3=A9crit :
>>> I don't have direct access to this system, I have asked if we can get a=
 run
>>> with 64K.
>>
>> OK, thanks! Do you know which model it is? It seems to be working on
>> some systems,
>> but we don't have enough samples to figure out why at this time, I think.
>>
>>> Meanwhile is there a way to find out what caused MachineCheck? more
>>> details on this? I was checking the manual and I don't see any
>>> restrictions w.r.t effective address. We now have very high EA with 64K
>>> page size.
>>
>> Sorry, no idea, completely out of my depth here. I can try some kernel
>> (build, runtime) options and/or patch, but someone will have to tell
>> me what to try,
>> as I have no ideas.
>
>
> Can you try this change.
>
> modified   arch/powerpc/include/asm/book3s/64/mmu-hash.h
> @@ -580,7 +580,7 @@ extern void slb_set_size(u16 size);
>  #if (MAX_PHYSMEM_BITS > MAX_EA_BITS_PER_CONTEXT)
>  #define MAX_KERNEL_CTX_CNT	(1UL << (MAX_PHYSMEM_BITS - MAX_EA_BITS_PER_C=
ONTEXT))
>  #else
> -#define MAX_KERNEL_CTX_CNT	1
> +#define MAX_KERNEL_CTX_CNT	4
>  #endif

Didn't help.

Same crash, here's a previous one OCR'ed from a photo:

Oops: Machine check, sig: 7 [#1]
BE PAGE SIZE-64 MMU-Hash SMP NR_CPUS 4 NUMA PowerMac
Modules linked in:
CPU: PID: 1 Comn: init Tainted: G M 5.5.0-rc4-gcc-8.2.0-00919-g443b9413a05e=
 #1465
NIP: c00000000026f528 LR: c000000000296138 CTR: 0000000000000000
REGS: ce0000000ffa3d70 TRAP: 0200 Tainted: G M (5.5.0-rc-gcc-8.2.0-00919-g4=
43b9413a05e)
MSR: 9000000000109032 <SF, HV, EE, ME, IR, DR, RI> CR: 24282048 XER: 000000=
00
DAR: c00c000000612c80 DSISR: 00000400 IRQ MASK: 8
GPR00: c0000000002970d0 c0000001bc343a90 c000000001399600 c0000001bc01c800
GPR04: ce000001bc390000 ce000001bc3439d4 c0000001bc343a9c c0000001bb4b73b8
GPR08: c0000001bc320000 0000000000612c78 c000000001442a98 0000000000000fe0
GPR12: 7f7f7f7f7f7f7f7f c0000000016a0000 0000000000000000 00000000f7df38c8
GPR16: 0000000000000002 0000000000000000 00000000ffb14bac 00000000f7df5690
GPRZ0: 00000000f7df26c4 000000000000000d 0000000000008000 00000000f7ddfc0c
GPR24: ffffffffffffff9c 0000000000000010 0000000000000002 c0000001bc343db8
GPR28: c000000000296138 c00c000000612c78 c0000001bc390000 c0000001bc01c800
NIP [c0000000626f528] .kmem_cache_free+8x58/0x140
LR [c000000000296138] .putname.0x08/0xa
Call Trace:
c0000001bc343b40 [c000000000296138] .putname+0x88/0xa0
c0000001bc343bc0 [c0000000002970d0] .filename_lookup.part.76+0xb0/0x160
ce000001bc343d40 [c000008000279b20] .do_faccessat+0xe0/0x380
c0000001bc343e20 [c00000000000a40c] systen_call+0x5c/0x68
Instruction dump:
408201e8 2fa30000 419e0080 fb8100c0 fb4100080 fb610088 789d8502 3d22000b
39499498 1d3d0038 ebaa0000 7fbd4a14 <e93d0008> 712a0001 40820240 3422001e


cheers

