Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A67B30EF0E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 09:55:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWXSD0pNBzDwjr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 19:55:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FIQtMLF/; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWXQT6T7YzDwr9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 19:53:37 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id x9so1399913plb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 00:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=tFSqQuvu6uTvkAeK+KXmU2v2X/IEM0t3saedzu7Z9Wc=;
 b=FIQtMLF/ukbYUzLYB8jN8gfJbz8bZHGvAjcp1b3aZ/Y69AYyD1U0K062QOaPKHVh0T
 +M0sP1xFzNcx8CpNKRwMiGt5nALqCrdyyb7+Ta1Mur6XWckeM/0me7ZR/EdvWX3b3CsA
 oX08u1Jkw3RlUUO3GWsHR5aZEnuUAoujP//FW+UtUK6HIH/vsqQJEBQzeJU9m0wwzuiX
 B3UCJXG+SrLBhqyn28fMcI2ulPtoWUr+NogNZakjhmFFsZL0MGGh93tItKMQ5mhtvkBw
 MDA70yAOzaqlwwqDvJVYyqyKQbxl4b0HKW1YoJYcsdYk3kaqbisje5pe/ZsCSYJllNNv
 R+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tFSqQuvu6uTvkAeK+KXmU2v2X/IEM0t3saedzu7Z9Wc=;
 b=gfjW7zYqFOch0umP/9oarL1U92t4mx6yLvjJffnadXz9UBNShlS880G1omDys0YPFp
 Br7xonKII/h3cJAak2zSsFkod9dQUvHdFXfCX2TJBrvYbI/4fZqq52em4JPrBmmhddeM
 mpHjabnKXmHl7asEJBQUJpyEE1Uvqs4hvBx1zIdRtNtkxs2w6Wzx0CnTz2aIMDLwEUxo
 LyzJQ8SXcUh1kcfdYwxe6/zQ8nIsei+r1Bl9biM1vGV36/hfue0UKPyn5AMfNZerOncW
 YQWBKQJWwjcEgDKDbri9sEJckCSbW+X8dsxtHKim7pi4SSHp5YXc2wYCe6rKLUAsla6X
 NZfg==
X-Gm-Message-State: AOAM5330hBHIOPMucusALCX83gmp5GQ93yJmK4/mRgc6laHWuse63tQz
 kNG7eE3C5Jl7nsy4VLpKsfI05ehqzwxAjg==
X-Google-Smtp-Source: ABdhPJzjkbuEOMLliYDnNtV/lL0vjf6NA9m5NGcr+4IO0pwqN38KvBygX1rVDa5HAG5DXZwRRAenXw==
X-Received: by 2002:a17:902:e812:b029:de:5af2:3d09 with SMTP id
 u18-20020a170902e812b02900de5af23d09mr7207478plg.33.1612428813515; 
 Thu, 04 Feb 2021 00:53:33 -0800 (PST)
Received: from localhost ([1.132.250.219])
 by smtp.gmail.com with ESMTPSA id j26sm4598985pfa.35.2021.02.04.00.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 00:53:32 -0800 (PST)
Date: Thu, 04 Feb 2021 18:53:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 28/32] powerpc/64s: interrupt implement exit logic in C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-29-npiggin@gmail.com>
 <37c2a8e1-2c4b-2e55-6753-0a804ce00cac@csgroup.eu>
 <1612409077.fadt3kvld9.astroid@bobo.none>
 <65686b53-feb4-2788-88e1-76c3714d3e97@csgroup.eu>
In-Reply-To: <65686b53-feb4-2788-88e1-76c3714d3e97@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612428699.u023r42mj3.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 4, 2021 6:03 pm:
>=20
>=20
> Le 04/02/2021 =C3=A0 04:27, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of February 4, 2021 2:25 am:
>>>
>>>
>>> Le 25/02/2020 =C3=A0 18:35, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> Implement the bulk of interrupt return logic in C. The asm return code
>>>> must handle a few cases: restoring full GPRs, and emulating stack stor=
e.
>>>>
>>>
>>>
>>>> +notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *r=
egs, unsigned long msr)
>>>> +{
>>>> +	unsigned long *ti_flagsp =3D &current_thread_info()->flags;
>>>> +	unsigned long flags;
>>>> +
>>>> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && unlikely(!(regs->msr & MSR_RI))=
)
>>>> +		unrecoverable_exception(regs);
>>>> +	BUG_ON(regs->msr & MSR_PR);
>>>> +	BUG_ON(!FULL_REGS(regs));
>>>> +
>>>> +	local_irq_save(flags);
>>>> +
>>>> +	if (regs->softe =3D=3D IRQS_ENABLED) {
>>>> +		/* Returning to a kernel context with local irqs enabled. */
>>>> +		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>>>> +again:
>>>> +		if (IS_ENABLED(CONFIG_PREEMPT)) {
>>>> +			/* Return to preemptible kernel context */
>>>> +			if (unlikely(*ti_flagsp & _TIF_NEED_RESCHED)) {
>>>> +				if (preempt_count() =3D=3D 0)
>>>> +					preempt_schedule_irq();
>>>> +			}
>>>> +		}
>>>> +
>>>> +		trace_hardirqs_on();
>>>> +		__hard_EE_RI_disable();
>>>> +		if (unlikely(lazy_irq_pending())) {
>>>> +			__hard_RI_enable();
>>>> +			irq_soft_mask_set(IRQS_ALL_DISABLED);
>>>> +			trace_hardirqs_off();
>>>> +			local_paca->irq_happened |=3D PACA_IRQ_HARD_DIS;
>>>> +			/*
>>>> +			 * Can't local_irq_enable in case we are in interrupt
>>>> +			 * context. Must replay directly.
>>>> +			 */
>>>> +			replay_soft_interrupts();
>>>> +			irq_soft_mask_set(flags);
>>>> +			/* Took an interrupt, may have more exit work to do. */
>>>> +			goto again;
>>>> +		}
>>>> +		local_paca->irq_happened =3D 0;
>>>> +		irq_soft_mask_set(IRQS_ENABLED);
>>>> +	} else {
>>>> +		/* Returning to a kernel context with local irqs disabled. */
>>>> +		trace_hardirqs_on();
>>>> +		__hard_EE_RI_disable();
>>>> +		if (regs->msr & MSR_EE)
>>>> +			local_paca->irq_happened &=3D ~PACA_IRQ_HARD_DIS;
>>>> +	}
>>>> +
>>>> +
>>>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>>> +	local_paca->tm_scratch =3D regs->msr;
>>>> +#endif
>>>> +
>>>> +	/*
>>>> +	 * We don't need to restore AMR on the way back to userspace for KUA=
P.
>>>> +	 * The value of AMR only matters while we're in the kernel.
>>>> +	 */
>>>> +	kuap_restore_amr(regs);
>>>
>>> Is that correct to restore KUAP state here ? Shouldn't we have it at lo=
wer level in assembly ?
>>>
>>> Isn't there a risk that someone manages to call interrupt_exit_kernel_p=
repare() or the end of it in
>>> a way or another, and get the previous KUAP state restored by this way =
?
>>=20
>> I'm not sure if there much more risk if it's here rather than the
>> instruction being in another place in the code.
>>=20
>> There's a lot of user access around the kernel too if you want to find a
>> gadget to unlock KUAP then I suppose there is a pretty large attack
>> surface.
>=20
> My understanding is that user access scope is strictly limited, for insta=
nce we enforce the=20
> begin/end of user access to be in the same function, and we refrain from =
calling any other function=20
> inside the user access window. x86 even have 'objtool' to enforce it at b=
uild time. So in theory=20
> there is no way to get out of the function while user access is open.
>=20
> Here with the interrupt exit function it is free beer. You have a place w=
here you re-open user=20
> access and return with a simple blr. So that's open bar. If someone manag=
es to just call the=20
> interrupt exit function, then user access remains open

Hmm okay maybe that's a good point.

>>> Also, it looks a bit strange to have kuap_save_amr_and_lock() done at l=
owest level in assembly, and
>>> kuap_restore_amr() done in upper level. That looks unbalanced.
>>=20
>> I'd like to bring the entry assembly into C.
>>=20
>=20
> I really think it's not a good idea. We'll get better control and readabi=
lity by keeping it at the=20
> lowest possible level in assembly.
>=20
> x86 only save and restore SMAC state in assembly.

Okay we could go the other way and move the unlock into asm then.

Thanks,
Nick

