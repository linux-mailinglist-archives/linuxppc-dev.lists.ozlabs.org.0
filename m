Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F5B30EAE7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 04:29:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWPDg3sQCzDwqr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 14:29:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DFsz0fQK; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWPBy4K0wzDwqH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 14:28:10 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id o16so1177435pgg.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Feb 2021 19:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=P1Y2qpBWowZcEgW3prkebJuZhL90BVd+BEcnsYQcBvA=;
 b=DFsz0fQKCsakTGYJibq33e04xGc38x6ARFZbGWmz/zvVtKpCLhYos7Se0Nawhtke7I
 6pGC3OFc+J5Va+98mFiFQu/pAAqdlNOzBN8W85w/vpp7sCGcuKMQLdEzeqA19LE+iMSI
 0Xfu8QGgRBXjSCF0N1ydaTUbiGRuyFZetzwikucGR7ZOyQTaYHIaU3cYsYe1zxE2JdBq
 KNcjEY0ZzpsMdVrnFneC5JvBVAatjJn6PY9gn429oRLr3JTcpxYP0Jp6GHenMcvnApOe
 5UN8dMhgV2PmkQdEnynD1pEXTG2FccL0UWXckUhGmAU05Vg9PVm8KMIjYx6tXQbOe+3p
 vJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=P1Y2qpBWowZcEgW3prkebJuZhL90BVd+BEcnsYQcBvA=;
 b=oIYhBuuKGHiXG1M/sd8mWyTJD7UAo9bWf2jy28IVStVMTDtAaO9jG/m2/qzMK5tCyH
 yatcs87wvNxww56pEPFbknspmpeLMSW30+JrMZY+P8nclieaYLw0+rtFsfdD0VHn59Po
 0sP90zbRuPXSl3yAqf5tKLD+YfegArUTBA/c7v5ZOtG7XIMGSvjQtrSoDOIy0X9Q942m
 stqp4Xd2bc7DEQMke4cFsoPLAUEQZK4sK3lKGnbZp23QOHJv5B2binGvAgUiFjSE3vBg
 Xx6Om6fpZFCCV3gXgFuLKhzwl9hJcIJ8Bo4/HX+HrfbsTcb8exrQt3sbf6OitnYWlZfg
 rfVA==
X-Gm-Message-State: AOAM531l2loyZ3lg7LaGlN31Aw/O9GbgxHeqhq0ISE8kEe0nGJ0eA5TZ
 7RHh6VK/s6mLWKoKMcHCINU=
X-Google-Smtp-Source: ABdhPJxeQL5MzA4Hy0jRL0m955o9x/K8zInLy+4tTgU/rR9ijf1K9Gs6DPdcoL1/RLyRgT2bKggYdw==
X-Received: by 2002:a63:78ca:: with SMTP id t193mr7040301pgc.391.1612409285583; 
 Wed, 03 Feb 2021 19:28:05 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id g3sm34695pfo.149.2021.02.03.19.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 19:28:05 -0800 (PST)
Date: Thu, 04 Feb 2021 13:27:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 28/32] powerpc/64s: interrupt implement exit logic in C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-29-npiggin@gmail.com>
 <37c2a8e1-2c4b-2e55-6753-0a804ce00cac@csgroup.eu>
In-Reply-To: <37c2a8e1-2c4b-2e55-6753-0a804ce00cac@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612409077.fadt3kvld9.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of February 4, 2021 2:25 am:
>=20
>=20
> Le 25/02/2020 =C3=A0 18:35, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Implement the bulk of interrupt return logic in C. The asm return code
>> must handle a few cases: restoring full GPRs, and emulating stack store.
>>=20
>=20
>=20
>> +notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *reg=
s, unsigned long msr)
>> +{
>> +	unsigned long *ti_flagsp =3D &current_thread_info()->flags;
>> +	unsigned long flags;
>> +
>> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && unlikely(!(regs->msr & MSR_RI)))
>> +		unrecoverable_exception(regs);
>> +	BUG_ON(regs->msr & MSR_PR);
>> +	BUG_ON(!FULL_REGS(regs));
>> +
>> +	local_irq_save(flags);
>> +
>> +	if (regs->softe =3D=3D IRQS_ENABLED) {
>> +		/* Returning to a kernel context with local irqs enabled. */
>> +		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>> +again:
>> +		if (IS_ENABLED(CONFIG_PREEMPT)) {
>> +			/* Return to preemptible kernel context */
>> +			if (unlikely(*ti_flagsp & _TIF_NEED_RESCHED)) {
>> +				if (preempt_count() =3D=3D 0)
>> +					preempt_schedule_irq();
>> +			}
>> +		}
>> +
>> +		trace_hardirqs_on();
>> +		__hard_EE_RI_disable();
>> +		if (unlikely(lazy_irq_pending())) {
>> +			__hard_RI_enable();
>> +			irq_soft_mask_set(IRQS_ALL_DISABLED);
>> +			trace_hardirqs_off();
>> +			local_paca->irq_happened |=3D PACA_IRQ_HARD_DIS;
>> +			/*
>> +			 * Can't local_irq_enable in case we are in interrupt
>> +			 * context. Must replay directly.
>> +			 */
>> +			replay_soft_interrupts();
>> +			irq_soft_mask_set(flags);
>> +			/* Took an interrupt, may have more exit work to do. */
>> +			goto again;
>> +		}
>> +		local_paca->irq_happened =3D 0;
>> +		irq_soft_mask_set(IRQS_ENABLED);
>> +	} else {
>> +		/* Returning to a kernel context with local irqs disabled. */
>> +		trace_hardirqs_on();
>> +		__hard_EE_RI_disable();
>> +		if (regs->msr & MSR_EE)
>> +			local_paca->irq_happened &=3D ~PACA_IRQ_HARD_DIS;
>> +	}
>> +
>> +
>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> +	local_paca->tm_scratch =3D regs->msr;
>> +#endif
>> +
>> +	/*
>> +	 * We don't need to restore AMR on the way back to userspace for KUAP.
>> +	 * The value of AMR only matters while we're in the kernel.
>> +	 */
>> +	kuap_restore_amr(regs);
>=20
> Is that correct to restore KUAP state here ? Shouldn't we have it at lowe=
r level in assembly ?
>=20
> Isn't there a risk that someone manages to call interrupt_exit_kernel_pre=
pare() or the end of it in=20
> a way or another, and get the previous KUAP state restored by this way ?

I'm not sure if there much more risk if it's here rather than the=20
instruction being in another place in the code.

There's a lot of user access around the kernel too if you want to find a=20
gadget to unlock KUAP then I suppose there is a pretty large attack
surface.

> Also, it looks a bit strange to have kuap_save_amr_and_lock() done at low=
est level in assembly, and=20
> kuap_restore_amr() done in upper level. That looks unbalanced.

I'd like to bring the entry assembly into C.

Thanks,
Nick
