Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E261559B2E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 16:15:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTzgB27MHz3cgP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 00:15:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Y1s5r4Kh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=w98e=w7=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Y1s5r4Kh;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTzfV4KWJz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 00:15:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3E872B828D6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 14:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2C2C3411C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 14:15:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Y1s5r4Kh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1656080106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpWcY0NYNZuezo2Tw0JtyiSfj9c/CF2JU5aAznNpM8M=;
	b=Y1s5r4KhWMGGLtWRMz0m53TqO+2HVN6EzdpbVeQB/he3PkOZ+gRFK2y2IDbAoPcrBsyun+
	7TbkC2jCthSeTFADtebhiEgLk3qSKaFy1BcPBlI2WUySrSlY4uORNVdgTAjRu7fgrJp7mB
	UtK8UtlG6x/s/673UrhKQZKMybmPtMA=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id acc78c89 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Fri, 24 Jun 2022 14:15:06 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id l24so2774800ion.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 07:15:06 -0700 (PDT)
X-Gm-Message-State: AJIora93qCvIQ9RE9AUQkZWMjqS6zxyEsVOn3frV4+JdMaYCiHLyWcM3
	8c6BgncC23Pmipd3bRkYndEWPWs7GiqCHkEGvy0=
X-Google-Smtp-Source: AGRyM1t1InIqxukka1FzW9hva/iu0Be7xBboO5VNY8Vzat7NBpl5N1IllrbmNr4RPAeG8SjpJkBdnVQx0iRMYpNWvUw=
X-Received: by 2002:a05:6638:470a:b0:331:bd53:87a2 with SMTP id
 cs10-20020a056638470a00b00331bd5387a2mr8932516jab.204.1656080105550; Fri, 24
 Jun 2022 07:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220622105435.203922-1-Jason@zx2c4.com> <87a6a2qirw.fsf@linux.ibm.com>
In-Reply-To: <87a6a2qirw.fsf@linux.ibm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Jun 2022 16:14:54 +0200
X-Gmail-Original-Message-ID: <CAHmME9q9XY=nWvfbV+sV_frRaKPGBWSyShUShQyMayA_FpNWPg@mail.gmail.com>
Message-ID: <CAHmME9q9XY=nWvfbV+sV_frRaKPGBWSyShUShQyMayA_FpNWPg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/kvm: don't crash on missing rng, and use darn
To: Fabiano Rosas <farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Fabiano,

On Fri, Jun 24, 2022 at 3:43 PM Fabiano Rosas <farosas@linux.ibm.com> wrote:
>
> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
>
> > On POWER8 systems that don't have ibm,power-rng available, a guest that
> > ignores the KVM_CAP_PPC_HWRNG flag and calls H_RANDOM anyway will
> > dereference a NULL pointer. And on machines with darn instead of
> > ibm,power-rng, H_RANDOM won't work at all.
> >
> > This patch kills two birds with one stone, by routing H_RANDOM calls to
> > ppc_md.get_random_seed, and doing the real mode check inside of it.
> >
> > Cc: stable@vger.kernel.org # v4.1+
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Fixes: e928e9cb3601 ("KVM: PPC: Book3S HV: Add fast real-mode H_RANDOM implementation.")
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> >
> > This patch must be applied ontop of:
> > 1) https://github.com/linuxppc/linux/commit/f3eac426657d985b97c92fa5f7ae1d43f04721f3
> > 2) https://lore.kernel.org/all/20220622102532.173393-1-Jason@zx2c4.com/
> >
> >
> >  arch/powerpc/include/asm/archrandom.h |  5 ----
> >  arch/powerpc/kvm/book3s_hv_builtin.c  |  5 ++--
> >  arch/powerpc/platforms/powernv/rng.c  | 33 +++++++--------------------
> >  3 files changed, 11 insertions(+), 32 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
> > index 11d4815841ab..3af27bb84a3d 100644
> > --- a/arch/powerpc/include/asm/archrandom.h
> > +++ b/arch/powerpc/include/asm/archrandom.h
> > @@ -38,12 +38,7 @@ static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
> >  #endif /* CONFIG_ARCH_RANDOM */
> >
> >  #ifdef CONFIG_PPC_POWERNV
> > -int pnv_hwrng_present(void);
> >  int pnv_get_random_long(unsigned long *v);
> > -int pnv_get_random_real_mode(unsigned long *v);
> > -#else
> > -static inline int pnv_hwrng_present(void) { return 0; }
> > -static inline int pnv_get_random_real_mode(unsigned long *v) { return 0; }
> >  #endif
> >
> >  #endif /* _ASM_POWERPC_ARCHRANDOM_H */
> > diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
> > index 799d40c2ab4f..1c6672826db5 100644
> > --- a/arch/powerpc/kvm/book3s_hv_builtin.c
> > +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
> > @@ -176,13 +176,14 @@ EXPORT_SYMBOL_GPL(kvmppc_hcall_impl_hv_realmode);
> >
> >  int kvmppc_hwrng_present(void)
> >  {
> > -     return pnv_hwrng_present();
> > +     return ppc_md.get_random_seed != NULL;
> >  }
> >  EXPORT_SYMBOL_GPL(kvmppc_hwrng_present);
> >
> >  long kvmppc_rm_h_random(struct kvm_vcpu *vcpu)
> >  {
> > -     if (pnv_get_random_real_mode(&vcpu->arch.regs.gpr[4]))
> > +     if (ppc_md.get_random_seed &&
> > +         ppc_md.get_random_seed(&vcpu->arch.regs.gpr[4]))
> >               return H_SUCCESS;
>
> This is the same as arch_get_random_seed_long, perhaps you could use it
> instead.

Sure, why not. Will send a v2.

Jason
