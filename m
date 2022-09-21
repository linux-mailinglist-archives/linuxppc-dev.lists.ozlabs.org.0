Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5997C5BF289
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 03:02:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXKrB1Vtxz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 11:02:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iLJLvUe0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iLJLvUe0;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXKqW34pBz308w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 11:01:26 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id y11so4837546pjv.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 18:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=n6V55hfpd/IpNBQsuhOppMXoilc1FpyWyhYZfk6um3M=;
        b=iLJLvUe0BXGz3DFz+Kq1qCukLs2WMaWmpYSYE8U1z5/fSdC+gIcEGtkjYwbnEC4/MM
         E+lKD66eeS5T1zTPNcRTAuDuI9Rgg4iqftHNEI5bYgsGi3cWer71neHk8A7U0w7z3Pfc
         WFbHwDvH6GLwXYcNmNf/3wS0gSoNOtCIEze9l+s+Hpt9EIOQ8Rs78zahh7+/19LNii3a
         IGuSniu4AGUeNyyz7EEuButuuBcFxGWyr/l0xactsq7/guqy4Wjz6Mv08U5JMXgSIUO8
         BObliC3jpxXc0u85E1sCV2NtBkFjgw/C7RuHJwG0K3i/heHuKfZS8SKe1EBvxKguadXP
         0tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=n6V55hfpd/IpNBQsuhOppMXoilc1FpyWyhYZfk6um3M=;
        b=LI88GXp73T+ddeAIOubkrnKUndbzjjBSbRSohjKB/+WiiKTihIfIQd/CUBi1G42xwM
         pOTmZHBGCef6/sP9wH8fHQBvwrXT3lbZ7J6gqxgIdzpe3+YVX36z/lrWDkWcrFafTRwd
         IgvQKkLty63l5qHPn19L1Q++fWp9Qsp31XL14BAa+CpQ097mjf3kuGLm4WAzkS4m3sQe
         kUiI3k/qk3elZVa9uDvzdUPDBTfzfYfTvn6vX/DYvxm/OCix+qacvXVFkCDoYxvcTkDi
         dyQtOvPrCQr1mM+oALsgD2Sl39RKBGlNNa5buPMtLA0Cph9uKxtzj3sWQL22YCT3a/Ce
         joaw==
X-Gm-Message-State: ACrzQf15y63w6lu33fbAWnvflIu8+I43H0LdMFtf1N3HDD5NW/J4r36I
	dTQOuxWwsJarJ3IkW266yedw2WtwRkw=
X-Google-Smtp-Source: AMsMyM6yw25tj6XV13SOe0m0IWpubF8iz2/XtkpIHcGc/o7b63fAIBSy6PLpOuFjNZci7ngQ/fDtoA==
X-Received: by 2002:a17:90a:ab91:b0:202:a520:56c9 with SMTP id n17-20020a17090aab9100b00202a52056c9mr6918372pjq.1.1663722083850;
        Tue, 20 Sep 2022 18:01:23 -0700 (PDT)
Received: from localhost ([203.219.227.147])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902b68100b0017519b86996sm513757pls.218.2022.09.20.18.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 18:01:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Sep 2022 11:01:18 +1000
Message-Id: <CN1O97PLNVSM.VDXMAFRIPU9S@bobo>
To: "Segher Boessenkool" <segher@kernel.crashing.org>
Subject: Re: [RFC PATCH 5/7] powerpc/64s: update generic cpu option name and
 compiler flags
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220919140149.4018927-1-npiggin@gmail.com>
 <20220919140149.4018927-6-npiggin@gmail.com>
 <20220920221608.GB25951@gate.crashing.org>
In-Reply-To: <20220920221608.GB25951@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Sep 21, 2022 at 8:16 AM AEST, Segher Boessenkool wrote:
> Hi!
>
> On Tue, Sep 20, 2022 at 12:01:47AM +1000, Nicholas Piggin wrote:
> > Update the 64s GENERIC_CPU option. POWER4 support has been dropped, so
> > make that clear in the option name.
>
> AFAIR the minimum now is POWER4+ (ISA 2.01), not POWER5 (ISA 2.02).

It's POWER5 now, because of commit 471d7ff8b5 ("powerpc/64s: Remove
POWER4 support"), which is misguided about POWER4+ and also introduced
the -mcpu=3Dpower5 bug on 970 builds :\

Not sure it's worth adding POWER4+ support back but if someone has a
POWER4+ or adds it to QEMU TCG, I will do the patch.

> > -mtune=3D before power8 is dropped because the minimum gcc version
> > supports power8, and tuning is made consistent between big and little
> > endian.
>
> Tuning for p8 on e.g. 970 gives quite bad results.  No idea if anyone
> cares, but this is a serious regression if so.

It's for "generic" kernel so we set low minimum but higher tune,
assuming that people would usually have newer, so it was already
doing -mtune=3Dpower7.

We could make a specific 970/G5 entry though, since those still
have users.

> > Big endian drops -mcpu=3Dpower4 in favour of power5. Effectively the
> > minimum compiler version means power5 was always being selected here,
> > so this should not change anything. 970 / G5 code generation does not
> > seem to have been a problem with -mcpu=3Dpower5, but it's possible we
> > should go back to power4 to be really safe.
>
> Yes, -mcpu=3Dpower5 code does *not* run on 970, if you are unlucky enough
> that the compiler does something smart with popcntb (the sole non-float
> insn new on p5, not counting hrfid).
>
> > +# -mcpu=3Dpower5 should generate 970 compatible kernel code
>
> It doesn't.  Even if it did, it would need more explanation!

Okay, sounds like we should go back to power4.

Thanks,
Nick
