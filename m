Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C317300B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 05:51:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48THDX1dSCzDrGv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 15:51:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pFWtCafE; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48THBd0WnDzDrCt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 15:49:28 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id j7so749091plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 20:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=feIZem0x3q8sV1Os/LGaE2gLfI8cGD8u8Tige16duIY=;
 b=pFWtCafEZiR+cYriuahKky4BndUETp2+uKoGUvdPOTqYrIE2dfENmARDnASSvULVHA
 7LbGwg3x4S4MBR5+EPkwJwQcyce91geEyVAL+xj1b4D9peOz33k8/8eBhsbMh+IoOMeq
 LnExOODOSWYz7evxoAHYwD8sXk5BKBWHZ7WrdurcQRkBPsMt0WWZjjgNgwr8l0Jk47sL
 vuYeL7LzvRWuGoJyhPMfmmxtLsqd9EfQbQfddxKOPG0v9qzzpZ5NuHvEMTcY9+w5yR2J
 3odDkiZQ0JldiRawN4Umdes0iX5xGpULjCDixAmyxf/b5eToW32/pbw+hsWAVHi8TJKK
 hBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=feIZem0x3q8sV1Os/LGaE2gLfI8cGD8u8Tige16duIY=;
 b=ukIBg/l+rRH/zp0luKIyJug6O2Z7BlO8KixgNuDADGQXFAalpcWhE5lRcvDRDPEVB8
 b5iidin7/zaYX9K3ux5Bl3ym29HUAUb5PWpebA8DNaMQPmk3otFF6AWUGgzYm85IQpge
 kaRlB8/skMFYcC5zxTith/wjobAg7NaAS4S8uxJPRMsuF0whH1y/i6lHFjbFG/hO1yIb
 gQCq12v+xDG6kQ7Fx2ks6k1KfHMqLL3+R9qkjKtKAHQBMzkgjWHFiqQhgMIeG9cojLhu
 hJ1uf3e0Tyummb0FiTn+HS3YZXppUSCmgz+YcdrUp7htrFsOYYcGHHsAkZbDd0z08k6s
 k64g==
X-Gm-Message-State: APjAAAU3Es4nNGLM1WOT1XGziYs6B+P/wi45XvkIkhbXv3dAwrVS9zZ/
 OD6FtHjJJEXNdTbiouNLkGM=
X-Google-Smtp-Source: APXvYqx4pte272cdDix+xONo1y2wEjrN+3MS3h592/8rZ+yauPv/GJfKt1XhN4hlnTpNASyh0wyhJA==
X-Received: by 2002:a17:90a:ead8:: with SMTP id
 ev24mr2596375pjb.91.1582865364894; 
 Thu, 27 Feb 2020 20:49:24 -0800 (PST)
Received: from localhost (193-116-109-34.tpgi.com.au. [193.116.109.34])
 by smtp.gmail.com with ESMTPSA id 23sm8926604pfh.28.2020.02.27.20.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 20:49:24 -0800 (PST)
Date: Fri, 28 Feb 2020 14:48:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 01/14] powerpc: Enable Prefixed Instructions
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-2-jniethe5@gmail.com>
 <1582698829.pxzksoow7n.astroid@bobo.none>
 <CACzsE9oQSnEsbD=ftCOd51cPRrDyvv4EHY-1pn+DUUO=AVyTGg@mail.gmail.com>
In-Reply-To: <CACzsE9oQSnEsbD=ftCOd51cPRrDyvv4EHY-1pn+DUUO=AVyTGg@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582864874.q013n2u3v1.astroid@bobo.none>
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
Cc: Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on February 28, 2020 12:52 pm:
> On Wed, Feb 26, 2020 at 5:50 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> Jordan Niethe's on February 26, 2020 2:07 pm:
>> > From: Alistair Popple <alistair@popple.id.au>
>> >
>> > Prefix instructions have their own FSCR bit which needs to enabled via
>> > a CPU feature. The kernel will save the FSCR for problem state but it
>> > needs to be enabled initially.
>> >
>> > Signed-off-by: Alistair Popple <alistair@popple.id.au>
>> > ---
>> >  arch/powerpc/include/asm/reg.h    |  3 +++
>> >  arch/powerpc/kernel/dt_cpu_ftrs.c | 23 +++++++++++++++++++++++
>> >  2 files changed, 26 insertions(+)
>> >
>> > diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm=
/reg.h
>> > index 1aa46dff0957..c7758c2ccc5f 100644
>> > --- a/arch/powerpc/include/asm/reg.h
>> > +++ b/arch/powerpc/include/asm/reg.h
>> > @@ -397,6 +397,7 @@
>> >  #define SPRN_RWMR    0x375   /* Region-Weighting Mode Register */
>> >
>> >  /* HFSCR and FSCR bit numbers are the same */
>> > +#define FSCR_PREFIX_LG       13      /* Enable Prefix Instructions */
>> >  #define FSCR_SCV_LG  12      /* Enable System Call Vectored */
>> >  #define FSCR_MSGP_LG 10      /* Enable MSGP */
>> >  #define FSCR_TAR_LG  8       /* Enable Target Address Register */
>> > @@ -408,11 +409,13 @@
>> >  #define FSCR_VECVSX_LG       1       /* Enable VMX/VSX  */
>> >  #define FSCR_FP_LG   0       /* Enable Floating Point */
>> >  #define SPRN_FSCR    0x099   /* Facility Status & Control Register */
>> > +#define   FSCR_PREFIX        __MASK(FSCR_PREFIX_LG)
>>
>> When you add a new FSCR, there's a couple more things to do, check
>> out traps.c.
>>
>> >  #define   FSCR_SCV   __MASK(FSCR_SCV_LG)
>> >  #define   FSCR_TAR   __MASK(FSCR_TAR_LG)
>> >  #define   FSCR_EBB   __MASK(FSCR_EBB_LG)
>> >  #define   FSCR_DSCR  __MASK(FSCR_DSCR_LG)
>> >  #define SPRN_HFSCR   0xbe    /* HV=3D1 Facility Status & Control Regi=
ster */
>> > +#define   HFSCR_PREFIX       __MASK(FSCR_PREFIX_LG)
>> >  #define   HFSCR_MSGP __MASK(FSCR_MSGP_LG)
>> >  #define   HFSCR_TAR  __MASK(FSCR_TAR_LG)
>> >  #define   HFSCR_EBB  __MASK(FSCR_EBB_LG)
>> > diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/d=
t_cpu_ftrs.c
>> > index 182b4047c1ef..396f2c6c588e 100644
>> > --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
>> > +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> > @@ -553,6 +553,28 @@ static int __init feat_enable_large_ci(struct dt_=
cpu_feature *f)
>> >       return 1;
>> >  }
>> >
>> > +static int __init feat_enable_prefix(struct dt_cpu_feature *f)
>> > +{
>> > +     u64 fscr, hfscr;
>> > +
>> > +     if (f->usable_privilege & USABLE_HV) {
>> > +             hfscr =3D mfspr(SPRN_HFSCR);
>> > +             hfscr |=3D HFSCR_PREFIX;
>> > +             mtspr(SPRN_HFSCR, hfscr);
>> > +     }
>> > +
>> > +     if (f->usable_privilege & USABLE_OS) {
>> > +             fscr =3D mfspr(SPRN_FSCR);
>> > +             fscr |=3D FSCR_PREFIX;
>> > +             mtspr(SPRN_FSCR, fscr);
>> > +
>> > +             if (f->usable_privilege & USABLE_PR)
>> > +                     current->thread.fscr |=3D FSCR_PREFIX;
>> > +     }
>> > +
>> > +     return 1;
>> > +}
>>
>> It would be good to be able to just use the default feature matching
>> for this, if possible? Do we not do the right thing with
>> init_thread.fscr?
> The default feature matching do you mean feat_enable()?
> I just tested using that again, within feat_enable() I can print and
> see that the [h]fscr gets the bits set for enabling prefixed
> instructions. However once I get to the shell and start xmon, the fscr
> bit for prefixed instructions can be seen to be unset. What we are
> doing in feat_enable_prefix() avoids that problem. So it seems maybe
> something is not quite right with the init_thread.fscr. I will look
> into further.

Okay it probably gets overwritten somewhere.

But hmm, the dt_cpu_ftrs parsing should be picking those up and setting
them by default I would think (or maybe not because you don't expect
FSCR bit if OS support is not required).

All the other FSCR bits are done similarly to this AFAIKS:

 https://patchwork.ozlabs.org/patch/1244476/

I would do that for now rather than digging into it too far, but we
should look at cleaning that up and doing something more like what
you have here.

>> >  struct dt_cpu_feature_match {
>> >       const char *name;
>> >       int (*enable)(struct dt_cpu_feature *f);
>> > @@ -626,6 +648,7 @@ static struct dt_cpu_feature_match __initdata
>> >       {"vector-binary128", feat_enable, 0},
>> >       {"vector-binary16", feat_enable, 0},
>> >       {"wait-v3", feat_enable, 0},
>> > +     {"prefix-instructions", feat_enable_prefix, 0},
>>
>> That's reasonable to make that a feature, will it specify a minimum
>> base set of prefix instructions or just that prefix instructions
>> with the prefix/suffix arrangement exist?
> This was just going to be that they exist.
>>
>> You may not need "-instructions" on the end, none of the other
>> instructions do.
> Good point.
>>
>> I would maybe just hold off upstreaming the dt_cpu_ftrs changes for
>> a bit. We have to do a pass over new CPU feature device tree, and
>> some compatibility questions have come up recently.
>>
>> If you wouldn't mind just adding the new [H]FSCR bits and faults
>> upstream for now, that would be good.
> No problem.

Thanks,
Nick
=
