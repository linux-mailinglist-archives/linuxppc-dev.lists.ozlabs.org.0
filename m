Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C3D1A7240
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 06:07:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491X4T0hRpzDqW8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 14:07:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a6BlHTzB; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491X2Y6GhFzDqMN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 14:05:23 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id j16so9345266oih.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 21:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Tg2WSh831FNsYBv0b1Z6yZuwq3dfkUIjSqBChy52co4=;
 b=a6BlHTzB/xon0enFlcpOTS6p3YfbVx7JypaA95SnXxU2Lu1SOreC5FpaBfOxQAROmd
 eFUrJjjN884ladpHMW6BTXf04byhvl2YJ0VsLm1AY1sY5o30F9TOFnm3mAGbahiMyGgn
 oGBnHB98cOrf0xvGY7bqXx3hZkz0UaSTv1vYPPDEn/V4H9a040qIS8KsbkiagHOvQkjZ
 2LAlSH5AJepgCkaNYrZGo65M8atMNYYSqATxso+htzvIRSIwNwfPHymqpmXBraXNFYqA
 sJnF8771SqUQylWE6HPSynejLmOrtlrWVf7MeLdFPC9bhPnQEJG+PjXF4urmkGefCDUs
 2PJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tg2WSh831FNsYBv0b1Z6yZuwq3dfkUIjSqBChy52co4=;
 b=uY0JhIPUELif1cmVwwnIi+C47BQVCf2hScKu/YElkLsvUBQSivPAMmO43tsEcPNxMC
 4WXZkNhkNJ0WvOLqqnaTYBVf+ThMcRnxg42yTOKbQFXuAMtWbtx4SWY7HO+NYEtb65gc
 LoH+dg1Li9Ba2Nvzv4Z67xgn1Dj5aC5kDS0tNkPoK1W/tL225q011/KecsoDmDsdeia6
 KSeed1ltmK7858FyOZN4pTIozmVl0DihQTu6dX0Ra2Q86mZFme6P5+05z7iwAMqieMjS
 mkITESPSHBk/cCDbv4+ej1lPKHL09lIq6/ZaiJGiO5cl4fuxFSTRPMf7KbUKddcZdGm2
 CFWw==
X-Gm-Message-State: AGi0PuahUIuJlJiaRQWjIQifXzbAdljbvD8HKRn9J0UY+v66clXy8sr9
 Z2/WokWKm0uasrPr7mVrrh4=
X-Google-Smtp-Source: APiQypLXFqd/qfevw0nE4+wkwvGzhAeOaNcSzuw0BWByzycZA6kckMmKb9Y7k8qKdE7lGqdPGSvEIw==
X-Received: by 2002:aca:f4c4:: with SMTP id s187mr14254390oih.83.1586837117864; 
 Mon, 13 Apr 2020 21:05:17 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id u199sm5360896oif.25.2020.04.13.21.05.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Apr 2020 21:05:17 -0700 (PDT)
Date: Mon, 13 Apr 2020 21:05:15 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Boot flakiness with QEMU 3.1.0 and Clang built kernels
Message-ID: <20200414040515.GA22855@ubuntu-s3-xlarge-x86>
References: <20200410205932.GA880@ubuntu-s3-xlarge-x86>
 <1586564375.zt8lm9finh.astroid@bobo.none>
 <20200411005354.GA24145@ubuntu-s3-xlarge-x86>
 <1586597161.xyshvdbjo6.astroid@bobo.none>
 <1586612535.6kk4az03np.astroid@bobo.none>
 <20200414020553.GD48061@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414020553.GD48061@umbus.fritz.box>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux@googlegroups.com,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 12:05:53PM +1000, David Gibson wrote:
> On Sat, Apr 11, 2020 at 11:57:23PM +1000, Nicholas Piggin wrote:
> > Nicholas Piggin's on April 11, 2020 7:32 pm:
> > > Nathan Chancellor's on April 11, 2020 10:53 am:
> > >> The tt.config values are needed to reproduce but I did not verify that
> > >> ONLY tt.config was needed. Other than that, no, we are just building
> > >> either pseries_defconfig or powernv_defconfig with those configs and
> > >> letting it boot up with a simple initramfs, which prints the version
> > >> string then shuts the machine down.
> > >> 
> > >> Let me know if you need any more information, cheers!
> > > 
> > > Okay I can reproduce it. Sometimes it eventually recovers after a long
> > > pause, and some keyboard input often helps it along. So that seems like 
> > > it might be a lost interrupt.
> > > 
> > > POWER8 vs POWER9 might just be a timing thing if P9 is still hanging
> > > sometimes. I wasn't able to reproduce it with defconfig+tt.config, I
> > > needed your other config with various other debug options.
> > > 
> > > Thanks for the very good report. I'll let you know what I find.
> > 
> > It looks like a qemu bug. Booting with '-d int' shows the decrementer 
> > simply stops firing at the point of the hang, even though MSR[EE]=1 and 
> > the DEC register is wrapping. Linux appears to be doing the right thing 
> > as far as I can tell (not losing interrupts).
> > 
> > This qemu patch fixes the boot hang for me. I don't know that qemu 
> > really has the right idea of "context synchronizing" as defined in the
> > powerpc architecture -- mtmsrd L=1 is not context synchronizing but that
> > does not mean it can avoid looking at exceptions until the next such
> > event. It looks like the decrementer exception goes high but the
> > execution of mtmsrd L=1 is ignoring it.
> > 
> > Prior to the Linux patch 3282a3da25b you bisected to, interrupt replay
> > code would return with an 'rfi' instruction as part of interrupt return,
> > which probably helped to get things moving along a bit. However it would
> > not be foolproof, and Cedric did say he encountered some mysterious
> > lockups under load with qemu powernv before that patch was merged, so
> > maybe it's the same issue?
> > 
> > Thanks,
> > Nick
> > 
> > The patch is a bit of a hack, but if you can run it and verify it fixes
> > your boot hang would be good.
> 
> So a bug in this handling wouldn't surprise me at all.  However a
> report against QEMU 3.1 isn't particularly useful.
> 
>  * Does the problem occur with current upstream master qemu?

Yes, I can reproduce the hang on 5.0.0-rc2.

>  * Does the problem occur with qemu-2.12 (a pretty widely deployed
>    "stable" qemu, e.g. in RHEL)?

No idea but I would assume so. I might have time later this week to test
but I assume it is kind of irrelevant if it is reproducible at ToT.

> > ---
> > 
> > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > index b207fb5386..1d997f5c32 100644
> > --- a/target/ppc/translate.c
> > +++ b/target/ppc/translate.c
> > @@ -4364,12 +4364,21 @@ static void gen_mtmsrd(DisasContext *ctx)
> >      if (ctx->opcode & 0x00010000) {
> >          /* Special form that does not need any synchronisation */
> >          TCGv t0 = tcg_temp_new();
> > +        TCGv t1 = tcg_temp_new();
> >          tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
> >                          (1 << MSR_RI) | (1 << MSR_EE));
> > -        tcg_gen_andi_tl(cpu_msr, cpu_msr,
> > +        tcg_gen_andi_tl(t1, cpu_msr,
> >                          ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
> > -        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
> > +        tcg_gen_or_tl(t1, t1, t0);
> > +
> > +        gen_update_nip(ctx, ctx->base.pc_next);
> > +        gen_helper_store_msr(cpu_env, t1);
> >          tcg_temp_free(t0);
> > +        tcg_temp_free(t1);
> > +        /* Must stop the translation as machine state (may have) changed */
> > +        /* Note that mtmsr is not always defined as context-synchronizing */
> > +        gen_stop_exception(ctx);
> > +
> >      } else {
> >          /*
> >           * XXX: we need to update nip before the store if we enter
> > 
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

Cheers,
Nathan
