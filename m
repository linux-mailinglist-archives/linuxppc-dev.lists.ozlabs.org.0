Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 906FB1AD3E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 02:59:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Hmg61rPzF09x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 10:59:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493Hjl51sKzDsP1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 10:56:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=baoRF3XB; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 493Hjl0gpQz9sSG; Fri, 17 Apr 2020 10:56:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 493Hjk6BKpz9sRN;
 Fri, 17 Apr 2020 10:56:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587085018;
 bh=gZiFHwBUJ3y5pN+65F3FPUoC3+G0poKNBpEBHgvfozU=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=baoRF3XBiwIHFnsJ4yt9WaoSFPjh+n0Gs88KDJsZ00RwT+b8psLV0d5eN9bSxalZS
 d7Dj4iaF4uHKcaKK37q37YMUkCcDJd8PNeMFbE6dtS0WtEDs2AhfSgtwxQuZx9MrvX
 pOO+/nz2cUkyU/DZvFxkK4yQmJnDChnFG0TWbF5QIbcubvJ1HJ1sVbTPZAuiPfclC6
 QFtCasQ2g8xgup7QNwHfbqABrLTMaNOIhHjFl+c/N56cdKvrwLbLq6TmKjU2kDI3jf
 iLWz5eoVGkspiEHtAfJnFhaXxbmHQxyDte+T+tOub35fdvlZQCMRRELfhHK14dowUE
 U5Zlg3mLiGuBA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Christopher M Riedl <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
Subject: Re: [RFC PATCH 2/3] powerpc/lib: Initialize a temporary mm for code
 patching
In-Reply-To: <8ff6d279-fdd9-4e4d-b4e0-f5c5cba480a4@c-s.fr>
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <20200323045205.20314-3-cmr@informatik.wtf>
 <ecccbeb2-731b-f9a3-1039-f2a662e3a9a5@c-s.fr>
 <1782990079.111623.1585624792778@privateemail.com>
 <8ff6d279-fdd9-4e4d-b4e0-f5c5cba480a4@c-s.fr>
Date: Fri, 17 Apr 2020 10:57:10 +1000
Message-ID: <87mu7bhqu1.fsf@mpe.ellerman.id.au>
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

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 31/03/2020 =C3=A0 05:19, Christopher M Riedl a =C3=A9crit=C2=A0:
>>> On March 24, 2020 11:10 AM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
>>> Le 23/03/2020 =C3=A0 05:52, Christopher M. Riedl a =C3=A9crit=C2=A0:
>>>> When code patching a STRICT_KERNEL_RWX kernel the page containing the
>>>> address to be patched is temporarily mapped with permissive memory
>>>> protections. Currently, a per-cpu vmalloc patch area is used for this
>>>> purpose. While the patch area is per-cpu, the temporary page mapping is
>>>> inserted into the kernel page tables for the duration of the patching.
>>>> The mapping is exposed to CPUs other than the patching CPU - this is
>>>> undesirable from a hardening perspective.
>>>>
>>>> Use the `poking_init` init hook to prepare a temporary mm and patching
>>>> address. Initialize the temporary mm by copying the init mm. Choose a
>>>> randomized patching address inside the temporary mm userspace address
>>>> portion. The next patch uses the temporary mm and patching address for
>>>> code patching.
>>>>
>>>> Based on x86 implementation:
>>>>
>>>> commit 4fc19708b165
>>>> ("x86/alternatives: Initialize temporary mm for patching")
>>>>
>>>> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
>>>> ---
>>>>    arch/powerpc/lib/code-patching.c | 26 ++++++++++++++++++++++++++
>>>>    1 file changed, 26 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-=
patching.c
>>>> index 3345f039a876..18b88ecfc5a8 100644
>>>> --- a/arch/powerpc/lib/code-patching.c
>>>> +++ b/arch/powerpc/lib/code-patching.c
>>>> @@ -11,6 +11,8 @@
>>>>    #include <linux/cpuhotplug.h>
>>>>    #include <linux/slab.h>
>>>>    #include <linux/uaccess.h>
>>>> +#include <linux/sched/task.h>
>>>> +#include <linux/random.h>
>>>>=20=20=20=20
>>>>    #include <asm/pgtable.h>
>>>>    #include <asm/tlbflush.h>
>>>> @@ -39,6 +41,30 @@ int raw_patch_instruction(unsigned int *addr, unsig=
ned int instr)
>>>>    }
>>>>=20=20=20=20
>>>>    #ifdef CONFIG_STRICT_KERNEL_RWX
>>>> +
>>>> +__ro_after_init struct mm_struct *patching_mm;
>>>> +__ro_after_init unsigned long patching_addr;
>>>
>>> Can we make those those static ?
>>>
>>=20
>> Yes, makes sense to me.
>>=20
>>>> +
>>>> +void __init poking_init(void)
>>>> +{
>>>> +	spinlock_t *ptl; /* for protecting pte table */
>>>> +	pte_t *ptep;
>>>> +
>>>> +	patching_mm =3D copy_init_mm();
>>>> +	BUG_ON(!patching_mm);
>>>
>>> Does it needs to be a BUG_ON() ? Can't we fail gracefully with just a
>>> WARN_ON ?
>>>
>>=20
>> I'm not sure what failing gracefully means here? The main reason this co=
uld
>> fail is if there is not enough memory to allocate the patching_mm. The
>> previous implementation had this justification for BUG_ON():
>
> But the system can continue running just fine after this failure.
> Only the things that make use of code patching will fail (ftrace, kgdb, .=
..)

That's probably true of ftrace, but we can't fail patching for jump
labels (static keys).

See:

void arch_jump_label_transform(struct jump_entry *entry,
			       enum jump_label_type type)
{
	u32 *addr =3D (u32 *)(unsigned long)entry->code;

	if (type =3D=3D JUMP_LABEL_JMP)
		patch_branch(addr, entry->target, 0);
	else
		patch_instruction(addr, PPC_INST_NOP);
}

cheers
