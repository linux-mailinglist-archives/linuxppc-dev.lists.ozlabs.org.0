Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1527580F7E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 11:03:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsWDH5HGXz3c5p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 19:03:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.131; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsWCt4WL7z3bd5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 19:03:21 +1000 (AEST)
Received: from mail-ed1-f45.google.com ([209.85.208.45]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8oOk-1nS83x3Thm-015pO0 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul
 2022 11:03:15 +0200
Received: by mail-ed1-f45.google.com with SMTP id p5so5933646edi.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 02:03:15 -0700 (PDT)
X-Gm-Message-State: AJIora9VytC8rZkU8iSQqNx+SyWKSkZe28oTHYwnWGxqJkHcy2+kOjFW
	31wByS7vXtY+uWTgpGjOdpMAHqx9uqUeKi4Acvs=
X-Google-Smtp-Source: AGRyM1uM4FGsU1Sfwdcu3eSFPSMGUqP71dbbyYOxhCDhMTwGw3Str5b2UpaCbD8rBQQ/NhAwvtPpctYnLNTq/5Ffs+s=
X-Received: by 2002:a05:6402:28c4:b0:43a:cdde:e047 with SMTP id
 ef4-20020a05640228c400b0043acddee047mr17514935edb.368.1658826195405; Tue, 26
 Jul 2022 02:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220722090929.mwhmxxdd7yioxqpz@pali> <6b227478-73b8-2a97-1c78-89570d928739@csgroup.eu>
 <20220723150702.jecerkhxhy65dgww@pali> <875yjld2oe.fsf@mpe.ellerman.id.au>
 <20220725125256.cg6su4d2ageylvp6@pali> <e2487668-b6d9-9ddb-1bb4-9f4d37fae1a7@csgroup.eu>
 <20220725201009.gwuchzswcqaxntrk@pali> <20220725215416.GV25951@gate.crashing.org>
 <20220726083406.tcjvny6d2di6q7ar@pali>
In-Reply-To: <20220726083406.tcjvny6d2di6q7ar@pali>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 26 Jul 2022 11:02:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2iM+RoySWEC2e0==rwBSVrZoRa8c4ADyFNB24JZM=hkw@mail.gmail.com>
Message-ID: <CAK8P3a2iM+RoySWEC2e0==rwBSVrZoRa8c4ADyFNB24JZM=hkw@mail.gmail.com>
Subject: Re: Regression: Linux v5.15+ does not boot on Freescale P2020
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:COkPKKlQiWR+7ix9LcXgRdvmD06x/4G8BHEqZOG25awsKh5UC8T
 o069RjuCTfg4eQVq+8+n0gDPDq6iXS0lWuwnu/psz/ZzwPrzLxK6jfz6+VxQmWjxyz95Sna
 EUtPcNoHF4roISIAK8h9lv3rjSQmmwRsASVczOJWH2R+KE0eCETish2WZ215DUhbe1f/bVB
 alM8RNMSyBGVdAEk8Tc9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LwtL/GPUXhk=:SKs/qNcD802/Ud5M1yVmju
 vMTMb1819jx2rreUVW4xT9Lr6EsJ78gVhe9FvwNV4upwf7MtLvv1pYmsD9RzSBE/97zXmwc9o
 1DmAas+1oaCzw3F3maBaanyEcSPf5HPeKQ9HQijXPpml6w9aaWkcYIXWySFFpC2YURsGRrg7C
 mNuLP1QkLPRc+m0q3VhM5TN8X4/WDrXP9ndlTg+SWRN1Ni8rcEyv4mIbkEPXS5k+oLWEIaqka
 CVL0HTLllxe+cxbbSh7atxTDxlhebBVfKz8M3/kxpM20rdoRkk5AhApnp0pzVRqCR8BjagvzT
 u+NZw92GeGzXdwfmw6AsYzrUfET2iEoHhLPNUS/RsMYY3qcSyYaW6a+L/3243Sa/QO6PkTH80
 zf1HNxM+xixMQTstPWux/RJbsLPuKZ8y9Uj0NhTLOJofkEIyRq7YzLQ/ADPOBtcMdUm2sRy03
 PII4AMYOgVl/hZo1IbiJmxE2PL67Q1qgF8EVM+IdJGXCWzQKauackSIMMmYfe8xnj4H/ZeOFP
 JA8Y0UNBRFvYNwLy1jpay1WGLAcNYvbLFdWJ486GG40GCq07BxBAChS4M8cRL1o8P90JRKw38
 QoShK8YtLdEQ5TdAivnTMsQw3crQLHvgAXZyA3QNce8ziS0aBV0n5JSFLjnU0+yUhW68+46QR
 52u0nY+N1J4z1/jLSJWfyT4rpE0ZlwIKhJtytDjTQFfKa3UMW7ZkQNPYPjlltbUcJqR5IJNiJ
 aXnB6lpgGAbVDwQSrPj/csolHFhIYNlTyev6Ng==
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 26, 2022 at 10:34 AM Pali Roh=C3=A1r <pali@kernel.org> wrote:
> On Monday 25 July 2022 16:54:16 Segher Boessenkool wrote:
> > On Mon, Jul 25, 2022 at 10:10:09PM +0200, Pali Roh=C3=A1r wrote:
> > > On Monday 25 July 2022 16:20:49 Christophe Leroy wrote:
> > > Now I did again clean test with same Debian 10 cross compiler.
> > >
> > > $ git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git && cd linux
> > > $ git checkout v5.15
> > > $ make mpc85xx_smp_defconfig ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-l=
inux-gnuspe-
> > > $ make vmlinux ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-gnuspe-
> > > $ cp -a vmlinux vmlinux.v5.15
> > > $ git revert 9401f4e46cf6965e23738f70e149172344a01eef
> > > $ make vmlinux ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-gnuspe-
> > > $ cp -a vmlinux vmlinux.revert
> > > $ powerpc-linux-gnuspe-objdump -d vmlinux.revert > vmlinux.revert.dum=
p
> > > $ powerpc-linux-gnuspe-objdump -d vmlinux.v5.15 > vmlinux.v5.15.dump
> > > $ diff -Naurp vmlinux.v5.15.dump vmlinux.revert.dump
> > >
> > > And there are:
> > >
> > > -c000c304:      7d 20 f8 29     lwarx   r9,0,r31,1
> > > +c000c304:      7d 20 f8 28     lwarx   r9,0,r31
> > >
> > > I guess it must be reproducible this issue as I'm using regular
> > > toolchain from distribution.
> >
>
> > The EH field in larx insns is new since ISA 2.05, and some ISA 1.x cpu
> > implementations actually raise an illegal insn exception on EH=3D1.  It
> > appears P2020 is one of those.
> >
>
> P2020 has e500 cores. e500 cores uses ISA 2.03. So this may be reason.
> But in official Freescale/NXP documentation for e500 is documented that
> lwarx supports also eh=3D1. Maybe it is not really supported.
> https://www.nxp.com/files-static/32bit/doc/ref_manual/EREF_RM.pdf (page 5=
62)
> At least there is NOTE:
> Some older processors may treat EH=3D1 as an illegal instruction.

In commit d6ccb1f55ddf ("powerpc/85xx: Make sure lwarx hint isn't set on pp=
c32")
this was clarified to affect (all?) e500v1/v2, this one apparently
fixed it before,
but Christophe's commit effectively reverted that change.

I think only the simple_spinlock.h file actually uses EH=3D1 and this is no=
t
included in non-SMP kernels, so presumably the only affected machines were
the rare dual-core e500v2 ones (p2020, MPC8572, bsc9132), which would
explain why nobody noticed for the past 9 months.

          Arnd
