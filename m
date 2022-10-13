Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377B65FD40C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 07:04:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mny9h0TXjz3cfB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 16:04:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bcVimODQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bcVimODQ;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mny8j3Z6Bz2xfV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 16:03:31 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id f23so826894plr.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 22:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOUHW4edaDPc30w4Q72U75HlzxLHjOv/NovN59CFHDo=;
        b=bcVimODQIkTzmBZATGN+HUNmrIPW7jl5u2ZoEq4MhJfe2NQPUGrsODGTaliEVfn120
         ZiEX6ziSF71cpeL2ySmyQh2tnptI2QyBdbEqMjpMVlkVKOPB9TR87Fts6VMHefDWMcY8
         Z/MRIRJxs6TCoEjbVcfXVElblf/eiWrdOgXRLTfKu6NPe7IKRIEt7TKoZnSZ4EGh0d+/
         2m/vRr55Y9IGqZJQMn3tp/61yExuABpZ6waSytwyxjs958AHydI8QUiT1nr7lV4axcL+
         YIu2DdTu1gAGoZ3jAQ2oii+TNrWZvNgczw2ZFVo11hkEsTs3SHLzxHryOJic7KEi8xOs
         eJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kOUHW4edaDPc30w4Q72U75HlzxLHjOv/NovN59CFHDo=;
        b=Hh5I7JnBk1qKKSvUeM1oii+AMyZWyFYh2tdKAS+dm150Zwltc+EfzeQKM9c+vF5PO4
         HCL3jj/dZtuED8X/2TJq6IBUBW3irsxd9rOtZKuoj4ti3XB+JOye1RWKhHkoeoNPp2bP
         vp0mkDADsbaaBdWs2TSnx82KN7E7DRsI2rZ+ByfIY7gHbEHf92xposNQ1NGtj/mXP89p
         urVyIov8nq/2apktg7bQ16wBZ+jEhYJQmYzZti7+yMpgfrmcXadMGuY4kZoSUKveYlz8
         6nwG2P0985HmgSpThHP6tIvbcvcLdp+VSg8SeQDH7Tt6glJ+9NB+xa9CmEYCB+GVYVO9
         dGcg==
X-Gm-Message-State: ACrzQf1zFZQj1M7EshtQIb23HBB4lCoQLb6A25BGsO7ZKsopuIGotqWW
	05jy/849EZUWV5ad1KwplDw=
X-Google-Smtp-Source: AMsMyM5HrtXYYUPeglv/QrNpQaQjSDvfseDShdHPPKEKELYYob599hfe6Dl7LoTscUY+VaieU/EMZQ==
X-Received: by 2002:a17:902:f707:b0:184:e44f:88cc with SMTP id h7-20020a170902f70700b00184e44f88ccmr4206961plo.42.1665637408464;
        Wed, 12 Oct 2022 22:03:28 -0700 (PDT)
Received: from localhost ([202.173.165.98])
        by smtp.gmail.com with ESMTPSA id b3-20020a62cf03000000b005625ef68eecsm833834pfg.31.2022.10.12.22.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 22:03:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Oct 2022 15:03:14 +1000
Message-Id: <CNKJ6FE6U35I.3ERMDQR9MHRLX@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Guenter Roeck" <linux@roeck-us.net>, "Michael Ellerman"
 <mpe@ellerman.id.au>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
X-Mailer: aerc 0.11.0
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net> <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net> <Y0b3ZsTRHWG6jGK8@zx2c4.com>
 <20221012221615.GA364143@roeck-us.net> <87bkqgmvxl.fsf@mpe.ellerman.id.au>
 <20221013002148.GA535574@roeck-us.net>
In-Reply-To: <20221013002148.GA535574@roeck-us.net>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Oct 13, 2022 at 10:21 AM AEST, Guenter Roeck wrote:
> On Thu, Oct 13, 2022 at 11:03:34AM +1100, Michael Ellerman wrote:
> > Guenter Roeck <linux@roeck-us.net> writes:
> > > On Wed, Oct 12, 2022 at 11:20:38AM -0600, Jason A. Donenfeld wrote:
> > >>=20
> > >> I've also managed to not hit this bug a few times. When it triggers,
> > >> after "kprobes: kprobe jump-optimization is enabled. All kprobes are
> > >> optimized if possible.", there's a long hang - tens seconds before i=
t
> > >> continues. When it doesn't trigger, there's no hang at that point in=
 the
> > >> boot process.
> > >>=20
> > >
> > > I managed to bisect the problem. See below for results. Reverting the
> > > offending patch fixes the problem for me.
> >=20
> > Thanks.
> >=20
> > This is probably down to me/us not testing with PREEMPT enabled enough.
> >=20
> Not sure. My configuration has
>
> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set

Thanks very much for helping with this. The config snippet you posted here
https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-October/249758.html
has CONFIG_PREEMPT=3Dy. How do you turn that into a .config, olddefconfig?

I can't reproduce this so far using your config and qemu command line,
but the patch you've bisected it to definitely could cause this. I'll
keep trying...

Thanks,
Nick

[...]
> > > # first bad commit: [e485f6c751e0a969327336c635ca602feea117f0] powerp=
c/64/interrupt: Fix return to masked context after hard-mask irq becomes pe=
nding

