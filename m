Return-Path: <linuxppc-dev+bounces-12678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA8CBBF290
	for <lists+linuxppc-dev@lfdr.de>; Mon, 06 Oct 2025 22:14:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgVpw6Dmcz2ygH;
	Tue,  7 Oct 2025 07:14:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759781656;
	cv=none; b=ap3EKnTi7yKreGj2Xw1dmM9rTNf+1wk2+LcCwBOgdDUVD6IhyonmIcnMK60idmUzLYXGf7wBJh3Hnfprzn3fTYRbTjUQy79XIPPgXwXxrbjTSYEKhGPMZrTr5G/uvj6UN9C/p+MNHuq2t4cTE3U+CQR4Q/7Ef5HKndkjEaffme8fOoL5uM7foRutDLpgiI5XHmpEVAQApnunsY0SmEnYvIlpEVdCUdLL1qI7a9fIJqunzw2y1MM1jX9hTlUDg8b0z9ZYYb0D/Yb6qavNDbwY1T3LyRSH//7H5W90LgLV7Q22h42V2rQ4oG74WHRtyJh5efOqiv+hhvtLW2LDXJ4WfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759781656; c=relaxed/relaxed;
	bh=NQJdZyQhMwY/lhMG4TcQTIvMno90NamMQAcddd5OC2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h4K91HS7YnNkKf1J/z3WQhPd8YXU5cRvfh2brFKgiedKqVUgXwlivtNNXV+WPCwJBQXTvthyMBdqomiUFo6sAPO1TPg7p8fQrim9xde+Kwy4wg06xegz8uJe5YajQ+wTG/bCoy1/azjJS2LMKf3l8+CKXgejT1EOOWV9gXe+2wLAnU9XIMwi8nnDdPMpn4vRaPZ5jiMYx9IGoViFup9OkiF6nxGDIMKgwxFJhv5pKuc8i/D4VjLZDvgPbss1IU4WpZvl6+BY976qr+pNGy9cw77fSMcea67g4XjIFC4ugatp0lbkIPT6E2dD4ZM9IisJt7Lolkw32SFgZugpBRf+/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c1gIXscJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c1gIXscJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgVpv266Lz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 07:14:13 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-77f1f29a551so6804139b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Oct 2025 13:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759781647; x=1760386447; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQJdZyQhMwY/lhMG4TcQTIvMno90NamMQAcddd5OC2Q=;
        b=c1gIXscJZOo4vHnnT9ZLc+/YyHQ4taY8oIfiFvkfjIDPGAMpN5NYUhYTgLMrYmWF9S
         Uba406eumouGRHxvNSkxpuIElF1LM7y/ZHw6jflcscI2CHwaKJNLQ/j0+Cnkbvxzo4Nj
         Y656WPAEBDgwRqdMEbftlDG+UZ4Olje9hq6zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781647; x=1760386447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQJdZyQhMwY/lhMG4TcQTIvMno90NamMQAcddd5OC2Q=;
        b=LNUbmzjnlELnjLWfrPLvNtXsvcRD8gyvN1aFNieKDMPhYpckceB5us/sScg379I85c
         6uFCHsAWu03AyoWL1R3qTGS4TIKfozQYhAHdtdLgFlb07JbgubKAkMoJfizKDJ/lHlR8
         uTPi9CN3IjaD0q2UFkxv75JvvWQagL8BKQ3eMftZrYb/oBI9ZuosnJQxj3jbfnM5ln7n
         tiGWc4SZ3jpME/aKBnh0kEYzJi2qn7DeN3Ho55JKj+1kCVKNQyQg/OQCVrjf9JWQqIDR
         +ELFVHMRR/wKO+cfCcWXcwGoGhGjqUkhfUxLTLjmH3JedqxV4pyCzWtwJvwkZfnJComO
         T1BA==
X-Forwarded-Encrypted: i=1; AJvYcCWLNmRfcCsZ1SH1tXmkW6Yfs4TpFi9qsdXJe2z+qz5W72ZCWsP3ih7Jndksp2lmO9nkZ11j6ZYx2qYX6rw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzoxaRSxvo1So4mdTypf18PRXD1/o3SEIyrUyOKI6a7qjowNcd9
	Pgkq0CfYaC9glqd6S620K9UIyo9yfnE/xHYfzCulC6KTAelWyADPuVo+I/cudD3GFNtiw6F9PAm
	2mNE=
X-Gm-Gg: ASbGnct/dH9Wx6IDpNvylKyVOBP/jv9cTNqfa8glMJL/1BGCKed9Om/sedBnKiQ+R0j
	nG+bQv+qGEaEwi//dghiClEIKmcR/zVMgewV47E/G+TP2h+wClldx3BNuaDav/wsxn3MHGxrFW9
	bk69Zz7IGySrGAljUVNRs0L2J0e5kQzeUk8EScGFZ9/s7UK214e1GL2ocM0ZB42/Ns+U+5Tnqom
	mHXsRiszSSm0RamgbgCnig/9lWYTPE9yOAPZ+MtaS2XC9cPGZY3pUZEevG/wXhrke6+eKtHsmfL
	nginBI2wgej/zFv8LF+u0Kt0GcjxoLKrNk14r+4CqiIOKWh1jh8QvBdrlxHPRYMul13fMg3FjW0
	O9Hraw6ao7p+mIct27vghwJozvsgTB9hwOXLsFycmju+hOHNvYAk4JBgog7awIdcJt84g5b1Rv5
	cDaz9n0MNSqnJabQ==
X-Google-Smtp-Source: AGHT+IG0jbkayt/F6+n09CRXjji+d21I7ODa7d2QXChY5dlGhZmIdjEVWaeDVqyMqnBzpPcXNK0pCA==
X-Received: by 2002:a05:6a20:6a1b:b0:2e6:b58a:ddec with SMTP id adf61e73a8af0-32b62093e76mr19841617637.36.1759781647249;
        Mon, 06 Oct 2025 13:14:07 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206e809sm13493298b3a.71.2025.10.06.13.14.03
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 13:14:05 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-27c369f8986so53489805ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Oct 2025 13:14:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZhtUslVGB6rWl+4HX7AVYYoCPly2IFRxXIsj2w6CjMOF5H36qu6Yldg/J25A5nXg/gZwNCqG5PSZhS2o=@lists.ozlabs.org
X-Received: by 2002:a17:902:da8b:b0:268:f83a:835a with SMTP id
 d9443c01a7336-28e9a6d01c7mr166290125ad.60.1759781642366; Mon, 06 Oct 2025
 13:14:02 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250916145122.416128-1-wangjinchao600@gmail.com>
 <f932d6da-cd9c-4307-8877-eeb947a5c1a6@csgroup.eu> <aMpbOSN4DH09IPgD@mdev>
In-Reply-To: <aMpbOSN4DH09IPgD@mdev>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Oct 2025 13:13:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WttSbhpct2bhwF+EHgisSZ2G+6G6chNebosmAUtmv9Hw@mail.gmail.com>
X-Gm-Features: AS18NWAjS9eb65vMivsZK8Ihu7dGX2eBE91P457m_KL2WK6DeqCInpBXFl0HmzQ
Message-ID: <CAD=FV=WttSbhpct2bhwF+EHgisSZ2G+6G6chNebosmAUtmv9Hw@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	kees@kernel.org, masahiroy@kernel.org, aliceryhl@google.com, ojeda@kernel.org, 
	thomas.weissschuh@linutronix.de, xur@google.com, ruanjinjie@huawei.com, 
	gshan@redhat.com, maz@kernel.org, suzuki.poulose@arm.com, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, gautam@linux.ibm.com, 
	arnd@arndb.de, zhao.xichao@vivo.com, rppt@kernel.org, lihuafei1@huawei.com, 
	coxu@redhat.com, jpoimboe@kernel.org, yaozhenguo1@gmail.com, 
	luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org, 
	yury.norov@gmail.com, thorsten.blum@linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Tue, Sep 16, 2025 at 11:55=E2=80=AFPM Jinchao Wang <wangjinchao600@gmail=
.com> wrote:
>
> On Wed, Sep 17, 2025 at 08:08:57AM +0200, Christophe Leroy wrote:
> >
> >
> > Le 16/09/2025 =C3=A0 16:50, Jinchao Wang a =C3=A9crit :
> > > Currently, the hard lockup detector is selected at compile time via
> > > Kconfig, which requires a kernel rebuild to switch implementations.
> > > This is inflexible, especially on systems where a perf event may not
> > > be available or may be needed for other tasks.
> > >
> > > This commit refactors the hard lockup detector to replace a rigid
> > > compile-time choice with a flexible build-time and boot-time solution=
.
> > > The patch supports building the kernel with either detector
> > > independently, or with both. When both are built, a new boot paramete=
r
> > > `hardlockup_detector=3D"perf|buddy"` allows the selection at boot tim=
e.
> > > This is a more robust and user-friendly design.
> > >
> > > This patch is a follow-up to the discussion on the kernel mailing lis=
t
> > > regarding the preference and future of the hard lockup detectors. It
> > > implements a flexible solution that addresses the community's need to
> > > select an appropriate detector at boot time.
> > >
> > > The core changes are:
> > > - The `perf` and `buddy` watchdog implementations are separated into
> > >    distinct functions (e.g., `watchdog_perf_hardlockup_enable`).
> > > - Global function pointers are introduced (`watchdog_hardlockup_enabl=
e_ptr`)
> > >    to serve as a single API for the entire feature.
> > > - A new `hardlockup_detector=3D` boot parameter is added to allow the
> > >    user to select the desired detector at boot time.
> > > - The Kconfig options are simplified by removing the complex
> > >    `HARDLOCKUP_DETECTOR_PREFER_BUDDY` and allowing both detectors to =
be
> > >    built without mutual exclusion.
> > > - The weak stubs are updated to call the new function pointers,
> > >    centralizing the watchdog logic.
> > >
> > > Link: https://lore.kernel.org/all/20250915035355.10846-1-cuiyunhui@by=
tedance.com/
> > > Link: https://lore.kernel.org/all/CAD=3DFV=3DWWUiCi6bZCs_gseFpDDWNkuJ=
MoL6XCftEo6W7q6jRCkg@mail.gmail.com/
> > >
> > > Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> > > ---
> > >   .../admin-guide/kernel-parameters.txt         |  7 +++
> > >   include/linux/nmi.h                           |  6 +++
> > >   kernel/watchdog.c                             | 46 ++++++++++++++++=
++-
> > >   kernel/watchdog_buddy.c                       |  7 +--
> > >   kernel/watchdog_perf.c                        | 10 ++--
> > >   lib/Kconfig.debug                             | 37 +++++++--------
> > >   6 files changed, 85 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Docume=
ntation/admin-guide/kernel-parameters.txt
> > > index 5a7a83c411e9..0af214ee566c 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -1828,6 +1828,13 @@
> > >                     backtraces on all cpus.
> > >                     Format: 0 | 1
> > > +   hardlockup_detector=3D
> > > +                   [perf, buddy] Selects the hard lockup detector to=
 use at
> > > +                   boot time.
> > > +                   Format: <string>
> > > +                   - "perf": Use the perf-based detector.
> > > +                   - "buddy": Use the buddy-based detector.
> > > +
> > >     hash_pointers=3D
> > >                     [KNL,EARLY]
> > >                     By default, when pointers are printed to the cons=
ole
> > > diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> > > index cf3c6ab408aa..9298980ce572 100644
> > > --- a/include/linux/nmi.h
> > > +++ b/include/linux/nmi.h
> > > @@ -100,6 +100,9 @@ void watchdog_hardlockup_check(unsigned int cpu, =
struct pt_regs *regs);
> > >   #endif
> > >   #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
> > > +void watchdog_perf_hardlockup_enable(unsigned int cpu);
> > > +void watchdog_perf_hardlockup_disable(unsigned int cpu);
> > > +extern int watchdog_perf_hardlockup_probe(void);
> >
> > No 'extern' on function prototypes, this is pointless.
> Got it.
> >
> > >   extern void hardlockup_detector_perf_stop(void);
> > >   extern void hardlockup_detector_perf_restart(void);
> > >   extern void hardlockup_config_perf_event(const char *str);
> > > @@ -120,6 +123,9 @@ void watchdog_hardlockup_disable(unsigned int cpu=
);
> > >   void lockup_detector_reconfigure(void);
> > >   #ifdef CONFIG_HARDLOCKUP_DETECTOR_BUDDY
> > > +void watchdog_buddy_hardlockup_enable(unsigned int cpu);
> > > +void watchdog_buddy_hardlockup_disable(unsigned int cpu);
> > > +int watchdog_buddy_hardlockup_probe(void);
> > >   void watchdog_buddy_check_hardlockup(int hrtimer_interrupts);
> > >   #else
> > >   static inline void watchdog_buddy_check_hardlockup(int hrtimer_inte=
rrupts) {}
> > > diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> > > index 80b56c002c7f..85451d24a77d 100644
> > > --- a/kernel/watchdog.c
> > > +++ b/kernel/watchdog.c
> > > @@ -55,6 +55,37 @@ unsigned long *watchdog_cpumask_bits =3D cpumask_b=
its(&watchdog_cpumask);
> > >   #ifdef CONFIG_HARDLOCKUP_DETECTOR
> > > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> > > +/* The global function pointers */
> > > +void (*watchdog_hardlockup_enable_ptr)(unsigned int cpu) =3D watchdo=
g_perf_hardlockup_enable;
> > > +void (*watchdog_hardlockup_disable_ptr)(unsigned int cpu) =3D watchd=
og_perf_hardlockup_disable;
> > > +int (*watchdog_hardlockup_probe_ptr)(void) =3D watchdog_perf_hardloc=
kup_probe;
> >
> > As this is set only once at startup, can we use static_call instead of
> > function pointers ?
> >
> > Also, can it me made __ro_after_init ?
> Not really, this is just an RFC patch, and there is no consensus yet.
> If it is included in the final consensus, I will handle it in the next ve=
rsion.
> >
> > > +#elif defined(CONFIG_HARDLOCKUP_DETECTOR_BUDDY)
> > > +void (*watchdog_hardlockup_enable_ptr)(unsigned int cpu) =3D watchdo=
g_buddy_hardlockup_enable;
> > > +void (*watchdog_hardlockup_disable_ptr)(unsigned int cpu) =3D watchd=
og_buddy_hardlockup_disable;
> > > +int (*watchdog_hardlockup_probe_ptr)(void) =3D watchdog_buddy_hardlo=
ckup_probe;
> > > +#endif
> > > +
> > > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_MULTIPLE
> > > +static char *hardlockup_detector_type =3D "perf"; /* Default to perf=
 */

I'd still at least hope that "buddy" could be the default. While
"perf" can still be useful to catch some things that "buddy" can't,
"buddy" can also catch some things that perf can't so picking the
lower-overhead one as the default is perhaps better?


> I think we should first resolve the consensus issue:
> - Should we keep both perf and buddy watchdogs? (probably yes already)

Sounds like people want to keep perf, so "yes".


> - Should the watchdog type be changeable at boot time?

Seems like a good start.


> - Should the watchdog type be changeable at runtime?

If it was easy/possible then sure, but I don't think it's a giant deal
to have something like this only changeable at boot time, like your
patch does. The fact that your patch is pretty simple is definitely a
big win.


IMO it would be worth sending it out as a real patch.

-Doug

