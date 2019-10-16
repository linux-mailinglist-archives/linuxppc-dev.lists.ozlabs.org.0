Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3507D8C93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 11:34:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tRwD0hRvzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 20:34:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tRtJ0cPvzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 20:33:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="aRciCog4"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46tRtH57fQz9sP3;
 Wed, 16 Oct 2019 20:33:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1571218391;
 bh=pjVc29H4bZtGuE5SgY2LVplntFwXPBG67IBZzDY04AA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aRciCog4aQbTDlib+FMZmE8hQpUAoz51x1PhPzPWoQmHJP31msdpBp2gSBgW188KM
 8w1rI1B2NQlyY5gBytuLYnRlUsbpjgo+1MxYfdpupMk9VZ0Zk7fejnV70YKyhZY0WQ
 sUzi14Lj+TObxgLUSm625eECZR79+Fh0ZWfVpgebz9LbFlzb5j5HoCBJq7mqsICw7R
 GbsIeMuaigeAyur/K/cx3L3NeoQuIpKL4+oKyNToAR8mPFbOPldNoklhL0OVHkJLK1
 JJmgF0K4mIBKo4E7zdP05BDqFv1bC9/838XrblQj28Thbr7rxQ3iNZD1Y/wKKA3eFj
 QEQAFQt5lISLw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/34] powerpc: Use CONFIG_PREEMPTION
In-Reply-To: <156db456-af80-1f5e-6234-2e78283569b6@c-s.fr>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-4-bigeasy@linutronix.de>
 <156db456-af80-1f5e-6234-2e78283569b6@c-s.fr>
Date: Wed, 16 Oct 2019 20:33:08 +1100
Message-ID: <87d0ext4q3.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 15/10/2019 =C3=A0 21:17, Sebastian Andrzej Siewior a =C3=A9crit=C2=A0:
>> From: Thomas Gleixner <tglx@linutronix.de>
>>=20
>> CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
>> Both PREEMPT and PREEMPT_RT require the same functionality which today
>> depends on CONFIG_PREEMPT.
>>=20
>> Switch the entry code over to use CONFIG_PREEMPTION. Add PREEMPT_RT
>> output in __die().
>
> powerpc doesn't select ARCH_SUPPORTS_RT, so this change is useless as=20
> CONFIG_PREEMPT_RT cannot be selected.

Yeah I don't think there's any point adding the "_RT" to the __die()
output until/if we ever start supporting PREEMPT_RT.

cheers


>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 3e56c9c2f16ee..8ead8d6e1cbc8 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -106,7 +106,7 @@ config LOCKDEP_SUPPORT
>>   config GENERIC_LOCKBREAK
>>   	bool
>>   	default y
>> -	depends on SMP && PREEMPT
>> +	depends on SMP && PREEMPTION
>>=20=20=20
>>   config GENERIC_HWEIGHT
>>   	bool
>> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_=
32.S
>> index d60908ea37fb9..e1a4c39b83b86 100644
>> --- a/arch/powerpc/kernel/entry_32.S
>> +++ b/arch/powerpc/kernel/entry_32.S
>> @@ -897,7 +897,7 @@ user_exc_return:		/* r10 contains MSR_KERNEL here */
>>   	bne-	0b
>>   1:
>>=20=20=20
>> -#ifdef CONFIG_PREEMPT
>> +#ifdef CONFIG_PREEMPTION
>>   	/* check current_thread_info->preempt_count */
>>   	lwz	r0,TI_PREEMPT(r2)
>>   	cmpwi	0,r0,0		/* if non-zero, just restore regs and return */
>> @@ -921,7 +921,7 @@ user_exc_return:		/* r10 contains MSR_KERNEL here */
>>   	 */
>>   	bl	trace_hardirqs_on
>>   #endif
>> -#endif /* CONFIG_PREEMPT */
>> +#endif /* CONFIG_PREEMPTION */
>>   restore_kuap:
>>   	kuap_restore r1, r2, r9, r10, r0
>>=20=20=20
>> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_=
64.S
>> index 6467bdab8d405..83733376533e8 100644
>> --- a/arch/powerpc/kernel/entry_64.S
>> +++ b/arch/powerpc/kernel/entry_64.S
>> @@ -840,7 +840,7 @@ _GLOBAL(ret_from_except_lite)
>>   	bne-	0b
>>   1:
>>=20=20=20
>> -#ifdef CONFIG_PREEMPT
>> +#ifdef CONFIG_PREEMPTION
>>   	/* Check if we need to preempt */
>>   	andi.	r0,r4,_TIF_NEED_RESCHED
>>   	beq+	restore
>> @@ -871,7 +871,7 @@ _GLOBAL(ret_from_except_lite)
>>   	li	r10,MSR_RI
>>   	mtmsrd	r10,1		  /* Update machine state */
>>   #endif /* CONFIG_PPC_BOOK3E */
>> -#endif /* CONFIG_PREEMPT */
>> +#endif /* CONFIG_PREEMPTION */
>>=20=20=20
>>   	.globl	fast_exc_return_irq
>>   fast_exc_return_irq:
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index 82f43535e6867..23d2f20be4f2e 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>> @@ -252,14 +252,19 @@ NOKPROBE_SYMBOL(oops_end);
>>=20=20=20
>>   static int __die(const char *str, struct pt_regs *regs, long err)
>>   {
>> +	const char *pr =3D "";
>> +
>
> Please follow the same approach as already existing. Don't add a local=20
> var for that.
>
>>   	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
>>=20=20=20
>> +	if (IS_ENABLED(CONFIG_PREEMPTION))
>> +		pr =3D IS_ENABLED(CONFIG_PREEMPT_RT) ? " PREEMPT_RT" : " PREEMPT";
>> +
>
> drop
>
>>   	printk("%s PAGE_SIZE=3D%luK%s%s%s%s%s%s%s %s\n",
>
> Add one %s
>
>>   	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>>   	       PAGE_SIZE / 1024,
>>   	       early_radix_enabled() ? " MMU=3DRadix" : "",
>>   	       early_mmu_has_feature(MMU_FTR_HPTE_TABLE) ? " MMU=3DHash" : "",
>> -	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
>
> Replace by: 	IS_ENABLED(CONFIG_PREEMPTION) ? " PREEMPT" : ""
>
>> +	       pr,
>
> add something like: IS_ENABLED(CONFIG_PREEMPT_RT) ? "_RT" : ""
>
>>   	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>>   	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=3D" __stringify(NR_CPUS)) =
: "",
>>   	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
>>=20
>
> Christophe
