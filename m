Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E6A88F9E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 09:16:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ggd1eF+l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4xGF0s4hz3vmD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 19:16:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ggd1eF+l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4xFT0dlsz3vdp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 19:16:12 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-368a694dce3so2447775ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 01:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711613769; x=1712218569; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg/mTl/gZQBBVLX4ap1mVzi903wSdDhAIBYr54tqh6E=;
        b=ggd1eF+lz1bNngZQZKkkcgJ+YydQhcrdQ+77uT9mEU/sLmo2TAlQLAy1IOUucM5Y6j
         A4PLoF0nNapodUJW+unDbBAb3vr8sQtgXloeCtPdeJqr4k4a9hc8CTRMB6IB8xVSVkI1
         gY6u0CFXrVLWlsJZHBu0+W7QaFQDXH1GJr1LjPua/ssyfaaEX2FURsw5ENXpF2skhp71
         wjZm1Kh4IWe5vMpXRqM4jkT8+e7FD2MMvikSuAHgU9q249YmR7/tVI9IC7iqYsWLk4p7
         L4EyIkYbiWAIvg3hKG8j7TVK4Pefbu5zUtqpNM120doukN5ZrDTicQ2jxGbBqyWmVeF5
         hmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613769; x=1712218569;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dg/mTl/gZQBBVLX4ap1mVzi903wSdDhAIBYr54tqh6E=;
        b=KFSsi95/DcT0SyR0ySuh50WZvbyJKHmNOCZ/Id8UjX2K87UBVhKhDiCH87S0Sok+Pp
         2T//sMOmXkzR9tJK/J2ZUbYv/+44TkhlMWO72mqjjcUZrsamhaPsNL4+doCHrxEb/NCm
         skUSb90MHPb9k5YiUnUJzUN4HsRQEX4StqfOtUQJywu3ZGsXTD50Zk5guebQBttUSnsZ
         GMUaP8XnpoQ1FeydDW1vSkxr8zvESCsQIVIMnRrr6h9eoFVT/qRCGoaR2/VTvVdSrJ9G
         jdX1nipZCBbkQIk4zVF/n74j+9Z3f7lxEWAwRJiRZihNxKIvlxkrx3/ZDg6a4hJBlpSJ
         wP9g==
X-Forwarded-Encrypted: i=1; AJvYcCWKGW3ZMfcsaJig8gpOn8dkYaU8/+gc9yfNWo86q1hv2USUukUX499Ccu9RRdcnISU554CRQNL1zuxGwWbXWKPh0USXGpDWFh/mFSsWQQ==
X-Gm-Message-State: AOJu0YzgqPYt33KbASQ6lcFwATYFQWt4tPqCeWL+7DzrjNLgC8aOmjrg
	nx8kCcrIEmdMQU9M3G8Z2N7z2ge4eFYs/9RNp+PctBSUSJtvAdQw
X-Google-Smtp-Source: AGHT+IH+KaecwF3RwYZB0cv1SBJhdImRZrrY8YeVsJ1nJSXdi5yIxyolvTctIVwOl1LXGmnuj4ETdA==
X-Received: by 2002:a92:dd0f:0:b0:368:9ab5:6482 with SMTP id n15-20020a92dd0f000000b003689ab56482mr2435442ilm.13.1711613769423;
        Thu, 28 Mar 2024 01:16:09 -0700 (PDT)
Received: from localhost ([118.210.97.62])
        by smtp.gmail.com with ESMTPSA id t23-20020a63f357000000b005dc4da2121fsm756659pgj.6.2024.03.28.01.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 01:16:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Mar 2024 18:16:04 +1000
Message-Id: <D058FW7AZ5NH.2TFDC2YABBB05@wheely>
Subject: Re: [kvm-unit-tests PATCH v7 06/35] gitlab-ci: Run migration
 selftest on s390x and powerpc
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240319075926.2422707-1-npiggin@gmail.com>
 <20240319075926.2422707-7-npiggin@gmail.com>
 <91a6724d-5247-4f43-9400-1b8c03cb6cb3@redhat.com>
In-Reply-To: <91a6724d-5247-4f43-9400-1b8c03cb6cb3@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Mar 26, 2024 at 2:08 AM AEST, Thomas Huth wrote:
> On 19/03/2024 08.58, Nicholas Piggin wrote:
> > The migration harness is complicated and easy to break so CI will
> > be helpful.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   .gitlab-ci.yml      | 18 +++++++++++-------
> >   s390x/unittests.cfg |  8 ++++++++
> >   2 files changed, 19 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index ff34b1f50..bd34da04f 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -92,26 +92,28 @@ build-arm:
> >   build-ppc64be:
> >    extends: .outoftree_template
> >    script:
> > - - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
> > + - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
> >    - mkdir build
> >    - cd build
> >    - ../configure --arch=3Dppc64 --endian=3Dbig --cross-prefix=3Dpowerp=
c64-linux-gnu-
> >    - make -j2
> >    - ACCEL=3Dtcg ./run_tests.sh
> > -     selftest-setup spapr_hcall rtas-get-time-of-day rtas-get-time-of-=
day-base
> > -     rtas-set-time-of-day emulator
> > +     selftest-setup selftest-migration selftest-migration-skip spapr_h=
call
> > +     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-d=
ay
>
> I used to squash as much as possible into one line in the past, but nowad=
ays=20
> I rather prefer one test per line (like it is done for s390x below), so t=
hat=20
> it is easier to identify the changes ...
> So if you like, I think you could also put each test on a separate line h=
ere=20
> now (since you're touching all lines with tests here anyway).

Yeah it is nicer.

>
> > +     emulator
> >        | tee results.txt
> >    - if grep -q FAIL results.txt ; then exit 1 ; fi
> >  =20
> >   build-ppc64le:
> >    extends: .intree_template
> >    script:
> > - - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
> > + - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
> >    - ./configure --arch=3Dppc64 --endian=3Dlittle --cross-prefix=3Dpowe=
rpc64-linux-gnu-
> >    - make -j2
> >    - ACCEL=3Dtcg ./run_tests.sh
> > -     selftest-setup spapr_hcall rtas-get-time-of-day rtas-get-time-of-=
day-base
> > -     rtas-set-time-of-day emulator
> > +     selftest-setup selftest-migration selftest-migration-skip spapr_h=
call
> > +     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-d=
ay
> > +     emulator
> >        | tee results.txt
> >    - if grep -q FAIL results.txt ; then exit 1 ; fi
> >  =20
> > @@ -135,7 +137,7 @@ build-riscv64:
> >   build-s390x:
> >    extends: .outoftree_template
> >    script:
> > - - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu
> > + - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu nmap-ncat
> >    - mkdir build
> >    - cd build
> >    - ../configure --arch=3Ds390x --cross-prefix=3Ds390x-linux-gnu-
> > @@ -161,6 +163,8 @@ build-s390x:
> >         sclp-1g
> >         sclp-3g
> >         selftest-setup
> > +      selftest-migration-kvm
> > +      selftest-migration-skip
> >         sieve
> >         smp
> >         stsi
> > diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
> > index 49e3e4608..b79b99416 100644
> > --- a/s390x/unittests.cfg
> > +++ b/s390x/unittests.cfg
> > @@ -31,6 +31,14 @@ groups =3D selftest migration
> >   # https://lore.kernel.org/qemu-devel/20240219061731.232570-1-npiggin@=
gmail.com/
> >   accel =3D kvm
> >  =20
> > +[selftest-migration-kvm]
> > +file =3D selftest-migration.elf
> > +groups =3D nodefault
> > +accel =3D kvm
> > +# This is a special test for gitlab-ci that can must not use TCG until=
 the
>
> "can" or "must"?

I think it must be "must not".

Thanks,
Nick
