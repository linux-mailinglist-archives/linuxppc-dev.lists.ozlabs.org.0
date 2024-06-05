Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26D18FC133
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 03:17:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xb3xzkzO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv8h41JPJz3flg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 11:17:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xb3xzkzO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv8gL03MBz3cVc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 11:16:29 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2c1ab9e17f6so4943555a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 18:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717550187; x=1718154987; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdsDymqr+3tVKqaKI+1uZOgEEaMXUJLvcR4B2Q3VkCU=;
        b=Xb3xzkzOUydaOuHPOUcvAJqXqz9g+jwZHh5wug75Dr9leZ/htfeoQzg+WGjZ5jvV3L
         gWYhfBo4/k8sl3PBztvimGziMmQSICSu0Ecn5+VrMwEffNK7ISDNsCMclObJcxNYM7At
         L1DI565vjPIfra9SDKuoVYwbkDo8ZITGCRhpgvarVb+mR+UGthlQIHCryabgSt703vx3
         wFsO1U9gBWrUT9YTcHTRq0U1g9qHCHukcwnLsUawGfDk1DswMsff1toSM4Ze1IS8RKBn
         WyQ73YwLD7g7AO60QPcQ0/s4gD4j2UnZ2fRkcvDRoa3USy/h3LhmI8K6l3wIAgB5BDqO
         9jBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717550187; x=1718154987;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IdsDymqr+3tVKqaKI+1uZOgEEaMXUJLvcR4B2Q3VkCU=;
        b=XrEZGLXkuUymyCPaXNG3e/ivewMndr0S2f12C8fySMwCSnLAi6O5CTkHWqQ/N3a42j
         HihRUJsn7dYv02+aQWmkIPn1t7JkwhnmPvAur35NIWvjxjR8dCrnSnVDtBxmRQxOavTN
         AGVvUxoYxBo9aSHafuPEjpbK1I8OSAUbN1bzrua3PiUVoaycJB++WOz1vk1a8nPSAh9Q
         2B1WSfMPJDp1W4z0ZJmiv8ME+spE7wmlZIgA16pvz52mNB3V4U5jYFhBBbONlwSZ3scZ
         Vy82o/IjHTw26tbK+QGh1W4Y6reVkL7Yl34+Fzn2AohYg9MFUl52N0h9G2KCplNk27IX
         Ukag==
X-Forwarded-Encrypted: i=1; AJvYcCXHpkJq2VLHrOGEiXWwdbxxDtyLf0yfVIryMJntHdbz8HeScNcjHYIF734tGgwy5xZEJ2O8EbZY5n9HzMXG3L9QMyXWWha9afvPBaUyaQ==
X-Gm-Message-State: AOJu0Yw0QjPzP6VSkW+9lsAooOVa5BrvXsp75Z8uzOhJW6TCIPLxGqph
	VMlCiUshz2L1lQfHyKc9caP9ebPbaLDJq4Rrnuy4yl+nJJW7KHlulZ6+Xg==
X-Google-Smtp-Source: AGHT+IH8Sv75++VA8PbYWnegfSmdGko+hMvmAqwMpTzax7EoEy2nAnH+fYHJUmF3kQlIx4W5xI/PJQ==
X-Received: by 2002:a17:90a:6f84:b0:2bd:d6c7:1bbe with SMTP id 98e67ed59e1d1-2c27db02b33mr1087148a91.6.1717550187285;
        Tue, 04 Jun 2024 18:16:27 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2806d18e1sm164734a91.50.2024.06.04.18.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 18:16:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Jun 2024 11:16:21 +1000
Message-Id: <D1ROQ4JDBIJM.3UXVUGU4LR3RF@gmail.com>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v9 31/31] powerpc: gitlab CI update
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-32-npiggin@gmail.com>
 <54623658-23c8-4a51-8365-a983b230740a@redhat.com>
In-Reply-To: <54623658-23c8-4a51-8365-a983b230740a@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Jun 4, 2024 at 9:01 PM AEST, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > This adds testing for the powernv machine, and adds a gitlab-ci test
> > group instead of specifying all tests in .gitlab-ci.yml, and adds a
> > few new tests (smp, atomics) that are known to work in CI.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   .gitlab-ci.yml        | 30 ++++++++----------------------
> >   powerpc/unittests.cfg | 32 ++++++++++++++++++++++++++------
> >   2 files changed, 34 insertions(+), 28 deletions(-)
> >=20
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 23bb69e24..31a2a4e34 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -97,17 +97,10 @@ build-ppc64be:
> >    - cd build
> >    - ../configure --arch=3Dppc64 --endian=3Dbig --cross-prefix=3Dpowerp=
c64-linux-gnu-
> >    - make -j2
> > - - ACCEL=3Dtcg ./run_tests.sh
> > -      selftest-setup
> > -      selftest-migration
> > -      selftest-migration-skip
> > -      spapr_hcall
> > -      rtas-get-time-of-day
> > -      rtas-get-time-of-day-base
> > -      rtas-set-time-of-day
> > -      emulator
> > -      | tee results.txt
> > - - if grep -q FAIL results.txt ; then exit 1 ; fi
> > + - ACCEL=3Dtcg MAX_SMP=3D8 ./run_tests.sh -g gitlab-ci | tee results.t=
xt
> > + - grep -q PASS results.txt && ! grep -q FAIL results.txt
> > + - ACCEL=3Dtcg MAX_SMP=3D8 MACHINE=3Dpowernv ./run_tests.sh -g gitlab-=
ci | tee results.txt
> > + - grep -q PASS results.txt && ! grep -q FAIL results.txt
> >  =20
> >   build-ppc64le:
> >    extends: .intree_template
> > @@ -115,17 +108,10 @@ build-ppc64le:
> >    - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
> >    - ./configure --arch=3Dppc64 --endian=3Dlittle --cross-prefix=3Dpowe=
rpc64-linux-gnu-
> >    - make -j2
> > - - ACCEL=3Dtcg ./run_tests.sh
> > -      selftest-setup
> > -      selftest-migration
> > -      selftest-migration-skip
> > -      spapr_hcall
> > -      rtas-get-time-of-day
> > -      rtas-get-time-of-day-base
> > -      rtas-set-time-of-day
> > -      emulator
> > -      | tee results.txt
> > - - if grep -q FAIL results.txt ; then exit 1 ; fi
> > + - ACCEL=3Dtcg MAX_SMP=3D8 ./run_tests.sh -g gitlab-ci | tee results.t=
xt
> > + - grep -q PASS results.txt && ! grep -q FAIL results.txt
> > + - ACCEL=3Dtcg MAX_SMP=3D8 MACHINE=3Dpowernv ./run_tests.sh -g gitlab-=
ci | tee results.txt
> > + - grep -q PASS results.txt && ! grep -q FAIL results.txt
> >  =20
> >   # build-riscv32:
> >   # Fedora doesn't package a riscv32 compiler for QEMU. Oh, well.
> > diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
> > index d767f5d68..6fae688a8 100644
> > --- a/powerpc/unittests.cfg
> > +++ b/powerpc/unittests.cfg
> > @@ -16,17 +16,25 @@
> >   file =3D selftest.elf
> >   smp =3D 2
> >   extra_params =3D -m 1g -append 'setup smp=3D2 mem=3D1024'
> > -groups =3D selftest
> > +groups =3D selftest gitlab-ci
> >  =20
> >   [selftest-migration]
> >   file =3D selftest-migration.elf
> >   machine =3D pseries
> >   groups =3D selftest migration
> >  =20
> > +# QEMU 7.0 (Fedora 37) in gitlab CI has known migration bugs in TCG, s=
o
> > +# make a kvm-only version for CI
> > +[selftest-migration-ci]
> > +file =3D selftest-migration.elf
> > +machine =3D pseries
> > +groups =3D nodefault selftest migration gitlab-ci
> > +accel =3D kvm
> > +
> >   [selftest-migration-skip]
> >   file =3D selftest-migration.elf
> >   machine =3D pseries
> > -groups =3D selftest migration
> > +groups =3D selftest migration gitlab-ci
> >   extra_params =3D -append "skip"
> >  =20
> >   [migration-memory]
> > @@ -37,6 +45,7 @@ groups =3D migration
> >   [spapr_hcall]
> >   file =3D spapr_hcall.elf
> >   machine =3D pseries
> > +groups =3D gitlab-ci
> >  =20
> >   [spapr_vpa]
> >   file =3D spapr_vpa.elf
> > @@ -47,38 +56,43 @@ file =3D rtas.elf
> >   machine =3D pseries
> >   timeout =3D 5
> >   extra_params =3D -append "get-time-of-day date=3D$(date +%s)"
> > -groups =3D rtas
> > +groups =3D rtas gitlab-ci
> >  =20
> >   [rtas-get-time-of-day-base]
> >   file =3D rtas.elf
> >   machine =3D pseries
> >   timeout =3D 5
> >   extra_params =3D -rtc base=3D"2006-06-17" -append "get-time-of-day da=
te=3D$(date --date=3D"2006-06-17 UTC" +%s)"
> > -groups =3D rtas
> > +groups =3D rtas gitlab-ci
> >  =20
> >   [rtas-set-time-of-day]
> >   file =3D rtas.elf
> >   machine =3D pseries
> >   extra_params =3D -append "set-time-of-day"
> >   timeout =3D 5
> > -groups =3D rtas
> > +groups =3D rtas gitlab-ci
> >  =20
> >   [emulator]
> >   file =3D emulator.elf
> > +groups =3D gitlab-ci
> >  =20
> > +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
> >   [interrupts]
> >   file =3D interrupts.elf
> >  =20
> > +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
> >   [mmu]
> >   file =3D mmu.elf
> >   smp =3D $MAX_SMP
> >  =20
> > +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
> >   [pmu]
> >   file =3D pmu.elf
> >  =20
> >   [smp]
> >   file =3D smp.elf
> >   smp =3D 2
> > +groups =3D gitlab-ci
> >  =20
> >   [smp-smt]
> >   file =3D smp.elf
> > @@ -92,16 +106,19 @@ accel =3D tcg,thread=3Dsingle
> >  =20
> >   [atomics]
> >   file =3D atomics.elf
> > +groups =3D gitlab-ci
> >  =20
> >   [atomics-migration]
> >   file =3D atomics.elf
> >   machine =3D pseries
> >   extra_params =3D -append "migration -m"
> > -groups =3D migration
> > +groups =3D migration gitlab-ci
> >  =20
> > +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
> >   [timebase]
> >   file =3D timebase.elf
> >  =20
> > +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
> >   [timebase-icount]
> >   file =3D timebase.elf
> >   accel =3D tcg
> > @@ -115,14 +132,17 @@ smp =3D 2,threads=3D2
> >   extra_params =3D -machine cap-htm=3Don -append "h_cede_tm"
> >   groups =3D h_cede_tm
> >  =20
> > +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
> >   [sprs]
> >   file =3D sprs.elf
> >  =20
> > +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
> >   [sprs-migration]
> >   file =3D sprs.elf
> >   machine =3D pseries
> >   extra_params =3D -append '-w'
> >   groups =3D migration
>
> Have any of the failures been fixed in newer versions of QEMU?

Yes, I think all (maybe with the exception of the migration dirty
bitmap bug) are fixed in 40. I did try that but x86 got some new
failures. Doing f40 for ppc specific would be another option but
if you have fixes for the x86 fails we could update it all at
once?

> If so, you could also update the ppc jobs to fedora:40:

Good idea, I'll add an optional patch at the end to just update
ppc, if the other patches aren't polished yet.

Thanks,
Nick

>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -91,6 +91,7 @@ build-arm:
>  =20
>   build-ppc64be:
>    extends: .outoftree_template
> + image: fedora:40
>    script:
>    - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
>    - mkdir build
> @@ -111,6 +112,7 @@ build-ppc64be:
>  =20
>   build-ppc64le:
>    extends: .intree_template
> + image: fedora:40
>    script:
>    - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
>    - ./configure --arch=3Dppc64 --endian=3Dlittle --cross-prefix=3Dpowerp=
c64-linux-gnu-
>
> I also had a patch somewhere that updates all jobs, it just needs some
> polishing to get finished ...  maybe a good point in time to do this now.
>
>   Thomas

