Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 482F18713B0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:39:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DlWqrAg5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpfs70V72z3dXH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:39:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DlWqrAg5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpfrQ48pDz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:38:29 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e5760eeb7aso4163447b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709606308; x=1710211108; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyy/z7rMU4Pt5i35c66uzuip5ZuV2JKh4HderjIItWU=;
        b=DlWqrAg5/jlBWveP9teFlwmRFUx1kPnA53RJRSGTSYNMgNBEgj4RF3ktGcuWH/0Hgj
         vQDKPaoVa4D6XXQNoi5UI+MkxN0zuQmhUYjGBpQjSZTY1NwxCeVtzQFAVq+RFsy4BGJK
         LMADg41jNlRJHHmVyu75YBVP/sIeVE+IRS6q3KLbJkRzBiwjxnftS5ykdagA+fDsNInq
         tmI3EDt0ofvR8/gUbtZ0Y/vraaMl+ljhClD5i+uIbBw9w5hh1e5yekxtij0n29xjeE2s
         N9m1a2gW/bpK9CE+weQWWtwOanBNLsveyrC4MRIOM36TBVpziBXuilIRBuH8C9WZjhfA
         WxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709606308; x=1710211108;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tyy/z7rMU4Pt5i35c66uzuip5ZuV2JKh4HderjIItWU=;
        b=C1sjn8WauLOF7PsmHALqM09xd/qiJ4mBLpyK4eHp+hhEF0ibf+nQeH8boPvqY8gOLU
         fIaOYFndvMnHHEiL8ao0kJv6EEaT48hzAkkRM+RtnGBxZY550hWcFnWE7UMwf4qxePH7
         9yX1yCPU31kYWRcAn1EJ4hPCS4D85SF2zKLGFO81p5a00/J1yfPZdTV/6OYjta2KJKY1
         jGw09j9X5o8ButzbowDVOnhDEgdUeBstV5f5LJfwnFlC9M8AUTsPxQXfKDHY62bKAT+4
         Jpkt6t5oSCJ73ThwsJp29FA4plJA+J/ZBIXekkWI0shcf6gkGdnXwwAiMN91u/3+FF70
         XIYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsmx4AGKvj9OFnp+buXE44K3afUJMIa3Cn8Ba/ZHZymoADiXZ2ZNSklcrtuIToy4MwPNgo9+oqtnLUpSieA36tYydklGNySKwfo7pGvg==
X-Gm-Message-State: AOJu0YzwL3M3yUryP9qmWZlFF8IVa2+JWH6ih+rOxu+SBTgsMayzdyPZ
	QtffSOIMCIohEYu1FID2/+sW4I/UxdOoPIe3O0d7kAyAhKdVzVm2SpC8SA9n
X-Google-Smtp-Source: AGHT+IEKWe065y9WsZvbuFfENkJW8uphvHaaQx9DKUXf0yz0WkmuCLdKUw5eHSp2vKXMroyA8a06BQ==
X-Received: by 2002:a05:6a00:27a0:b0:6e5:584d:e511 with SMTP id bd32-20020a056a0027a000b006e5584de511mr13144227pfb.17.1709606307957;
        Mon, 04 Mar 2024 18:38:27 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id h27-20020a056a00001b00b006e5eab773efsm4638161pfk.171.2024.03.04.18.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:38:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:38:19 +1000
Message-Id: <CZLGURIYNKHG.1JRG53746LHWI@wheely>
Subject: Re: [kvm-unit-tests PATCH 6/7] gitlab-ci: Run migration selftest on
 s390x and powerpc
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240226093832.1468383-1-npiggin@gmail.com>
 <20240226093832.1468383-7-npiggin@gmail.com>
 <7783977b-69ea-4831-a8f2-55de26d7bfd4@redhat.com>
In-Reply-To: <7783977b-69ea-4831-a8f2-55de26d7bfd4@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin
 Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Mar 2, 2024 at 12:16 AM AEST, Thomas Huth wrote:
> On 26/02/2024 10.38, Nicholas Piggin wrote:
> > The migration harness is complicated and easy to break so CI will
> > be helpful.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   .gitlab-ci.yml | 18 +++++++++++-------
> >   1 file changed, 11 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 71d986e98..61f196d5d 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -64,26 +64,28 @@ build-arm:
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
> > @@ -107,7 +109,7 @@ build-riscv64:
> >   build-s390x:
> >    extends: .outoftree_template
> >    script:
> > - - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu
> > + - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu nmap-ncat
> >    - mkdir build
> >    - cd build
> >    - ../configure --arch=3Ds390x --cross-prefix=3Ds390x-linux-gnu-
> > @@ -133,6 +135,8 @@ build-s390x:
> >         sclp-1g
> >         sclp-3g
> >         selftest-setup
> > +      selftest-migration
> > +      selftest-migration-skip
> >         sieve
> >         smp
> >         stsi
>
> While I can update the qemu binary for the s390x-kvm job, the build-* job=
s=20
> run in a container with a normal QEMU from the corresponding distros, so =
I=20
> think this has to wait 'til we get distros that contain your QEMU TCG=20
> migration fix.

Okay. powerpc *could* run into the TCG bug too, in practice it has not.
We could try enable it there to get migration into CI, and revert it if
it starts showing random failures?

Thanks,
Nick
