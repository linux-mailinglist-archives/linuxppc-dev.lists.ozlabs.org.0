Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D75E8821
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 06:01:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZFh94rG4z3cj8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 14:01:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jwxCtyrU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jwxCtyrU;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZFgQ517Rz3c4N
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 14:01:04 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id fv3so1748664pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 21:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=siq4IcBVR5DSXY5et4N/hDfecxS0FiRN49vF9Lazl6M=;
        b=jwxCtyrUq4SL3a1OIWF3RQWRKiG6sh7HzSwBLVIR/NB9xW4DMV+6ZUsPa6gHJbpGwQ
         vQM1hAMMdVf7c0ukNAHuICrMmEEVbMH6GL2QOlThcv4HYoiZeV3oBiKlZPMZTPE9PqRR
         davlzctJ3KClPuA0Wvm82akDpSrHUihYwL0OQ5IAHfBDU+cmox/gWV+Q6WN0JJ7WcKPW
         kWVD0n5rjZVSytnniqXslt4qblCgAvoz6okPYQjWxffPiqUYnQy7qSdtXcGWP+Z23iX7
         z/YvA0nQK1Xr4L0JZ7SStpfhS3FxVF/VDlyopRlDrLfaoGw+8YAsjoKWg8ehZNn14SMR
         yL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=siq4IcBVR5DSXY5et4N/hDfecxS0FiRN49vF9Lazl6M=;
        b=sirjfaOi1fRTfFqFWu9iSPLaodxg96kVzhntHvMApMy6f3RkX1T2EizailomOzug8k
         fW7jj3F9imkm4VYUPyFqjXK4VJyDtSgnfS49zy1FbMNFinjdRGBa9rsA4akOuyPxBFQh
         Tc7u8sIuXnsq4luvlEwdq54tPHGjxJfvzcCZ2TqVpF9lV/9outzjvXbG+Em6L4I9SBWB
         YDuPZoJKeMHzrx8igVxqXr7Kz68bAIWFqHYAt5vLe2hgwJoiteZ2XDnEoLZaH5p1C/pj
         LVQRMg/bp0nN9BXARzN89/02VeP5a8y6PqQRt86F9ysHIZUMjFkwJ7T1yrz/czlDfA0a
         X3Cw==
X-Gm-Message-State: ACrzQf2qiigOVzkDVzWgW2fk53mLZqMRDLZCImVf9EWOB59LcJw3z4wo
	Mq/C5qwVZzbG9sZVNX5M2tk=
X-Google-Smtp-Source: AMsMyM71BHiGhhNRu5mNRFmTiLS3aoi9IMqVOur57PNOa65KLfhKxHOUXUH4syzlfz7oiMqMM2bYWg==
X-Received: by 2002:a17:90b:3504:b0:202:5d53:86c with SMTP id ls4-20020a17090b350400b002025d53086cmr12899317pjb.182.1663992062751;
        Fri, 23 Sep 2022 21:01:02 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902e9d100b001755e4278a6sm6681934plk.261.2022.09.23.21.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 21:01:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Sep 2022 14:00:55 +1000
Message-Id: <CN4BYDAY75PX.33LJ1P2VQJXD9@bobo>
Subject: Re: [PATCH] powerpc/irq: Modernise inline assembly in
 irq_soft_mask_{set,return}
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Segher Boessenkool" <segher@kernel.crashing.org>
X-Mailer: aerc 0.11.0
References: <178f30ff62c0317061f019b3dbbc079073f104c3.1663656058.git.christophe.leroy@csgroup.eu> <CN3LB8F3D9LM.3W1RQRVS64UXU@bobo> <20220923121829.GL25951@gate.crashing.org> <CN3X6YN1FRQ3.1Z9BVD6WYQY3M@bobo> <20220923221543.GN25951@gate.crashing.org>
In-Reply-To: <20220923221543.GN25951@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Sep 24, 2022 at 8:15 AM AEST, Segher Boessenkool wrote:
> On Sat, Sep 24, 2022 at 02:26:52AM +1000, Nicholas Piggin wrote:
> > I still don't see what clauses guarantees asm("%0" ::"r"(foo)) to give
> > 13. It doesn't say access via inline assembly is special,
>
> But it is.  It is for all register variables, local and global.  I agree
> this isn't documented clearly.  For local register variables this is the
> *only* thing guaranteed; for global register vars there is more (it
> changes the ABI, there are safe/restore effects, that kind of thing).
>
> Never it is guaranteed that all accesses through this variable will use
> the register directly: this fundamentally cannot work on all archs, and
> also not at -O0.  More in general it doesn't work if some basic
> optimisations are not done, be it because of a compiler deficiency, or a
> straight out bug, or maybe it is a conscious choice in some cases.

Right, and we know better than to rely on a spec that is not 100% air
tight with no possibility of lawyering. This may be what the intention is,
it may be what gcc and clang do now, and everybody involved today agrees
with that interpretation. We still have to maintain the kernel tomorrow
though, so explicit r13 it must be.

>
> > I think if it was obviously guaranteed then this might be marginally
> > better than explicit r13 in the asm
> >=20
> >        asm volatile(
> >                "stb %0,%2(%1)"
> >                :
> >                : "r" (mask),
> > 	         "r" (local_paca),
> >                  "i" (offsetof(struct paca_struct, irq_soft_mask))
> >                : "memory");
>
> (Please use "n" instead of "i".  Doesn't matter here, but it does in
> many other places.)

What is the difference? Just "i" allows assmebly-time constants?

How about "I"? that looks like it was made for it. Gives much better
errors.

Thanks,
Nick
