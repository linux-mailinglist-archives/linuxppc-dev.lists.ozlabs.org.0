Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8BB172EE8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 03:54:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TDdz2GXgzDr8q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 13:54:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=No/PRhwL; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TDby0J9TzDr7V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 13:52:45 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id a36so1274921otb.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 18:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KzQCVGkFK0kK26YJZqhBGMPTYs8N10rd6EaaNfcNt1g=;
 b=No/PRhwL7GKUcbZENAJ02IPAq+nXifcyuz1/1ZC7A1DhmU7JeNhZkRAN03xDMIumjs
 b82lC7C9K+g8gzRxvTkxck/bOFZWlUWxWT6ratjYYKxP6XWh01pyOLgJSjbSsRBpm2YI
 gEHAzjIYNg9FprlD8UD8SZkzIlqFTuYc9phCaHebfta8e92p1gbVPSxUdZEkZXBV0klM
 Ky8duvM6y2mgswaok7Z2/JsiO2d5v5e8eFgbmG11Zi3SOMrmBV1FrFo7XfdLDkWZumtZ
 pc6szLicT6DlwwcL3NHHFIjXYgfCRvoJ7kuGmTpw0i53EhbSKOoD6eRapA+9dYdEjwff
 UrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KzQCVGkFK0kK26YJZqhBGMPTYs8N10rd6EaaNfcNt1g=;
 b=FzLxQeJHpbN0Z5nHNwbPiOFgJUK9UeFlfXyPYGZwEAfZqFtHCP7wLBkiu86VUsZU52
 IuMgJvZuBDKt1A2BsRCCaSFSMxoyh/Vy1vJqkkI00+gT8tDXQjh0xKwsgrXiaJSqf3lf
 s7sSb/wCZUTFMQ9TKai2DMbAzF8/ZJQsh0N5Rw3POUs9tgy1kI5NfTfUZt+FFCi7GxB2
 LEXMv9UVGVmSLx08uwI4Fip+yQWaT7k2xBCuV9p/mXTPY+tfw4XDF36vY6ObNUolICLC
 nBhaghA9lxulv3TZfTxN/xbfLICXbFa+gwn3NuvOVXKMZ1Qs/ZHzN88V4nJ9ygXA0s6R
 /hNQ==
X-Gm-Message-State: APjAAAUEBMq3ZBYPIgfMnXtfB/t9XkqxNZAz+NcwgZaVzVYygjjatZeE
 OgQOLN/+C5g1dHSOkzNsaM5bNQtOL3dn4oJxBBs=
X-Google-Smtp-Source: APXvYqy4axsTwMCoVt+ZrIeYdJcGuPXDHnQ8u4UHRkWHsUhvg71QBQoCLrdWDzePeJviXRRBKaiTYveMbOmBINj5+jU=
X-Received: by 2002:a9d:5e18:: with SMTP id d24mr1670323oti.155.1582858362410; 
 Thu, 27 Feb 2020 18:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-2-jniethe5@gmail.com>
 <1582698829.pxzksoow7n.astroid@bobo.none>
In-Reply-To: <1582698829.pxzksoow7n.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 28 Feb 2020 13:52:31 +1100
Message-ID: <CACzsE9oQSnEsbD=ftCOd51cPRrDyvv4EHY-1pn+DUUO=AVyTGg@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] powerpc: Enable Prefixed Instructions
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 26, 2020 at 5:50 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on February 26, 2020 2:07 pm:
> > From: Alistair Popple <alistair@popple.id.au>
> >
> > Prefix instructions have their own FSCR bit which needs to enabled via
> > a CPU feature. The kernel will save the FSCR for problem state but it
> > needs to be enabled initially.
> >
> > Signed-off-by: Alistair Popple <alistair@popple.id.au>
> > ---
> >  arch/powerpc/include/asm/reg.h    |  3 +++
> >  arch/powerpc/kernel/dt_cpu_ftrs.c | 23 +++++++++++++++++++++++
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> > index 1aa46dff0957..c7758c2ccc5f 100644
> > --- a/arch/powerpc/include/asm/reg.h
> > +++ b/arch/powerpc/include/asm/reg.h
> > @@ -397,6 +397,7 @@
> >  #define SPRN_RWMR    0x375   /* Region-Weighting Mode Register */
> >
> >  /* HFSCR and FSCR bit numbers are the same */
> > +#define FSCR_PREFIX_LG       13      /* Enable Prefix Instructions */
> >  #define FSCR_SCV_LG  12      /* Enable System Call Vectored */
> >  #define FSCR_MSGP_LG 10      /* Enable MSGP */
> >  #define FSCR_TAR_LG  8       /* Enable Target Address Register */
> > @@ -408,11 +409,13 @@
> >  #define FSCR_VECVSX_LG       1       /* Enable VMX/VSX  */
> >  #define FSCR_FP_LG   0       /* Enable Floating Point */
> >  #define SPRN_FSCR    0x099   /* Facility Status & Control Register */
> > +#define   FSCR_PREFIX        __MASK(FSCR_PREFIX_LG)
>
> When you add a new FSCR, there's a couple more things to do, check
> out traps.c.
>
> >  #define   FSCR_SCV   __MASK(FSCR_SCV_LG)
> >  #define   FSCR_TAR   __MASK(FSCR_TAR_LG)
> >  #define   FSCR_EBB   __MASK(FSCR_EBB_LG)
> >  #define   FSCR_DSCR  __MASK(FSCR_DSCR_LG)
> >  #define SPRN_HFSCR   0xbe    /* HV=1 Facility Status & Control Register */
> > +#define   HFSCR_PREFIX       __MASK(FSCR_PREFIX_LG)
> >  #define   HFSCR_MSGP __MASK(FSCR_MSGP_LG)
> >  #define   HFSCR_TAR  __MASK(FSCR_TAR_LG)
> >  #define   HFSCR_EBB  __MASK(FSCR_EBB_LG)
> > diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> > index 182b4047c1ef..396f2c6c588e 100644
> > --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> > +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> > @@ -553,6 +553,28 @@ static int __init feat_enable_large_ci(struct dt_cpu_feature *f)
> >       return 1;
> >  }
> >
> > +static int __init feat_enable_prefix(struct dt_cpu_feature *f)
> > +{
> > +     u64 fscr, hfscr;
> > +
> > +     if (f->usable_privilege & USABLE_HV) {
> > +             hfscr = mfspr(SPRN_HFSCR);
> > +             hfscr |= HFSCR_PREFIX;
> > +             mtspr(SPRN_HFSCR, hfscr);
> > +     }
> > +
> > +     if (f->usable_privilege & USABLE_OS) {
> > +             fscr = mfspr(SPRN_FSCR);
> > +             fscr |= FSCR_PREFIX;
> > +             mtspr(SPRN_FSCR, fscr);
> > +
> > +             if (f->usable_privilege & USABLE_PR)
> > +                     current->thread.fscr |= FSCR_PREFIX;
> > +     }
> > +
> > +     return 1;
> > +}
>
> It would be good to be able to just use the default feature matching
> for this, if possible? Do we not do the right thing with
> init_thread.fscr?
The default feature matching do you mean feat_enable()?
I just tested using that again, within feat_enable() I can print and
see that the [h]fscr gets the bits set for enabling prefixed
instructions. However once I get to the shell and start xmon, the fscr
bit for prefixed instructions can be seen to be unset. What we are
doing in feat_enable_prefix() avoids that problem. So it seems maybe
something is not quite right with the init_thread.fscr. I will look
into further.
>
>
> > +
> >  struct dt_cpu_feature_match {
> >       const char *name;
> >       int (*enable)(struct dt_cpu_feature *f);
> > @@ -626,6 +648,7 @@ static struct dt_cpu_feature_match __initdata
> >       {"vector-binary128", feat_enable, 0},
> >       {"vector-binary16", feat_enable, 0},
> >       {"wait-v3", feat_enable, 0},
> > +     {"prefix-instructions", feat_enable_prefix, 0},
>
> That's reasonable to make that a feature, will it specify a minimum
> base set of prefix instructions or just that prefix instructions
> with the prefix/suffix arrangement exist?
This was just going to be that they exist.
>
> You may not need "-instructions" on the end, none of the other
> instructions do.
Good point.
>
> I would maybe just hold off upstreaming the dt_cpu_ftrs changes for
> a bit. We have to do a pass over new CPU feature device tree, and
> some compatibility questions have come up recently.
>
> If you wouldn't mind just adding the new [H]FSCR bits and faults
> upstream for now, that would be good.
No problem.
>
> Thanks,
> Nick
