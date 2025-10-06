Return-Path: <linuxppc-dev+bounces-12681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F05DBBBF930
	for <lists+linuxppc-dev@lfdr.de>; Mon, 06 Oct 2025 23:30:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgXVZ2j7dz2xnM;
	Tue,  7 Oct 2025 08:30:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759786214;
	cv=none; b=Qs0B/AAdHKTS7sPG1d+BDX+Uv8uPMiItfSjYBDwNoejYacupF4cuhyu2XdVCqyLf5SIkY5779mEiZF8ZM6L3mFTzPZBcxOFsOcgEgnhJXrUWJw3qE97YS7h5k7//LpRsoPBQhMG5cO63EHym/zSjzwD1MyBBUrGrAgphfMiXolyTPTrUa7M1ILGyKfQA/DwvYZB0DQwSmKDwxQ09fROt39pK5WJxq1W9ipPrwq1z9E0x5NC40WeJ1TIUqDOlhRdUyk30sof3Ezzx+SV2LkMeM3XlECOfodCjduNKSrBCD1wuz0/8boILXzd9367CzJDUqRWebB7wHhyOTVwyKFKBmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759786214; c=relaxed/relaxed;
	bh=Jw1MyvGILMOokBtUrAMjae6GJN1JO+CrPDkYUwFO7Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNTd24KC2adn555/rmVA7v8dPrHmxIaBw5TwsojsActfDvjTHWWdi8EENXnMT+/+83bDAxcjlf/FVGtm4br6FowTgd28Hm/WhCajt+UoBbw+7RxcKK1dHTTLiMEF4QWBV7T8KYZ0tKO/NOO0Gsyp2AMTHfTUUv1ZmZLNg0gDX519XE4WzNt8EGqlaUX3Lzr+8ZB3DAgIf1HxTLmLFeHsyulAEC3vEODHtnjbXDJ9MO+qxuORDkZz7Q1zLLYCx9WUXf5Nkn0t183gHi6R53gNuN59geJ3qNfZTajpvpASLoi8IOeOOyjWETOHF15TK9dgILGc5GRxYKDZiyoe5tU/YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rYadOxlm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rYadOxlm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgXVY2wQ8z2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 08:30:12 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-27d67abd215so81745ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Oct 2025 14:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759786211; x=1760391011; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw1MyvGILMOokBtUrAMjae6GJN1JO+CrPDkYUwFO7Vw=;
        b=rYadOxlms8vVnBqP5a61QJJ0f2fVQw36t8aHviEyVl0s0+cUo7t6l2B2V4irchv1w2
         Pd1VPrQT3bBOzk5BTvxcp+OsPyiqVlSiVgCglfYa/u1i2q+NSrS4e2IWnhz1tGtJLsRx
         zI1T2N3BnViLFxdQDyYgwADZYXC7JE67WbG57ggiWUtIN9xe06rTnfIWYXM//m81+dVT
         GTjPEX2wECnFIg2wFbRFe14IiRp63ijv0kGVBZX3R4Ftn+ScfHZcB3qXmZXAe6FN56JP
         0t7c7dx7iLa2999kwOyZ06LmG0/8AEIwq1Ag8pwRIrWeWnssLTerSmSPvz6VsrJYe8B2
         9uTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759786211; x=1760391011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jw1MyvGILMOokBtUrAMjae6GJN1JO+CrPDkYUwFO7Vw=;
        b=uS9dlnq+vBkGCrKBmr/sUpDKAZU1hDI1VAFd7rwNhUG0L5u69oOivA3GsJ2M1/aMKj
         qQ+P61OzLQzDgq+HMoqYwZQdXYYAZRRTd2bL9Z0YBIxsJ/8PXgzIz0qVKlDrudCbOCFu
         DCxHXdxU9kAkCHhHgtVomEE+DNXpUdC5FFUgT/q4x7RYBHg1osX00cjKzpkn/uwM7f1h
         tt4A3bxoXc07oI5QrwtdpLTVOKITYdanq8Fq/XNfyBXgHGCZQVCkfC61ya2hohCSAArC
         wRHO9+foyhZl4PXu0bqZ0Bk09TpKPC9/RKxyJtOjCqk1eb46LzNeYRGxQ1mHGei/q/T8
         1Q6w==
X-Forwarded-Encrypted: i=1; AJvYcCUQ50ZLbrz8yAemWOHyRtPQ2fRnSbQUbvD7nig7tQyO5Z/ZiHUGuo5JYceambd0EFAABka6kz8qEuhg/yk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxx/jbR3Zs5XfdX9OCX2Wrcf1b8aXM0p0U6ViCGBkrLOoGrwoe3
	Dz7Z/ke8f0WKxe0UaRG7oeoODBAz4A0ixiNvtkCrKssNw4v9eLZ7pRzl8vlWyKefvaTYxZ+5OmM
	suAlp2WcHQdstkyKy9GrWzZw8yqopfixn1hLTDmr2
X-Gm-Gg: ASbGncvRW4B4wm5X/tgFmD1Ti1T1MUxJ1aW0y4ZUk0mjayrYCGIivapXkOxW7Pe+tZR
	m6EIUE5o3Tryiwl7T8B/KD1agtm8TlQDOQPxSAEm7UG2dUTxFVBLJqyWCM/fVv+2yeJig4/ZSt3
	k9e/Nv2JNt50/K/3aQsl+0tXtiGrCmXHEI5kJY/MAJ2hz5GWxpFnS4vIOxRFfxPCFX0Lp23LWS5
	zVr3tsrrvW2aAOUYPGOZn0wPepVOgGxcjPZFKVVFYT79V47OVKi+wHuoJkzdz0BN2AmBkQeopik
	WoY=
X-Google-Smtp-Source: AGHT+IFkI1d774NUM89ERAmmoBpl8K2DOaRCy8aLicUU5wa9/d/itWTaNCjDnD5mazd4twphVqteWH4/6mJbbTT8ad8=
X-Received: by 2002:a17:903:13c6:b0:248:dce7:40e1 with SMTP id
 d9443c01a7336-28ecb74e7c6mr413065ad.9.1759786210402; Mon, 06 Oct 2025
 14:30:10 -0700 (PDT)
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
 <CAP-5=fWWOQ-6SWiNVBvb5mCofe0kZUURG_bm0PDsVFWqwDwrXg@mail.gmail.com>
 <aMoTOXIKBYVTj7PV@mdev> <CAP-5=fX7NJmBjd1v5y4xCa0Ce5rNZ8Dqg0LXd12gPrdEQCERVA@mail.gmail.com>
 <aMpIsqcgpOH1AObN@z2> <aMpRqlDXXOR5qYFd@mdev>
In-Reply-To: <aMpRqlDXXOR5qYFd@mdev>
From: Ian Rogers <irogers@google.com>
Date: Mon, 6 Oct 2025 14:29:59 -0700
X-Gm-Features: AS18NWAsc-mMgvqvwymBO2fCmWj4Pi21wg3nny62z2YmWnca4ioS04TPfarW-YI
Message-ID: <CAP-5=fV05++2Qvcxs=+tqhTdpGK8L9e5HzVu=y+xHxy9AqLMmg@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Doug Anderson <dianders@chromium.org>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
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
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 16, 2025 at 11:14=E2=80=AFPM Jinchao Wang <wangjinchao600@gmail=
.com> wrote:
>
> On Tue, Sep 16, 2025 at 10:35:46PM -0700, Namhyung Kim wrote:
> > Hello,
> >
> > On Tue, Sep 16, 2025 at 10:13:12PM -0700, Ian Rogers wrote:
> > > On Tue, Sep 16, 2025 at 6:47=E2=80=AFPM Jinchao Wang <wangjinchao600@=
gmail.com> wrote:
> > > >
> > > > On Tue, Sep 16, 2025 at 05:03:48PM -0700, Ian Rogers wrote:
> > > > > On Tue, Sep 16, 2025 at 7:51=E2=80=AFAM Jinchao Wang <wangjinchao=
600@gmail.com> wrote:
> > > > > >
> > > > > > Currently, the hard lockup detector is selected at compile time=
 via
> > > > > > Kconfig, which requires a kernel rebuild to switch implementati=
ons.
> > > > > > This is inflexible, especially on systems where a perf event ma=
y not
> > > > > > be available or may be needed for other tasks.
> > > > > >
> > > > > > This commit refactors the hard lockup detector to replace a rig=
id
> > > > > > compile-time choice with a flexible build-time and boot-time so=
lution.
> > > > > > The patch supports building the kernel with either detector
> > > > > > independently, or with both. When both are built, a new boot pa=
rameter
> > > > > > `hardlockup_detector=3D"perf|buddy"` allows the selection at bo=
ot time.
> > > > > > This is a more robust and user-friendly design.
> > > > > >
> > > > > > This patch is a follow-up to the discussion on the kernel maili=
ng list
> > > > > > regarding the preference and future of the hard lockup detector=
s. It
> > > > > > implements a flexible solution that addresses the community's n=
eed to
> > > > > > select an appropriate detector at boot time.
> > > > > >
> > > > > > The core changes are:
> > > > > > - The `perf` and `buddy` watchdog implementations are separated=
 into
> > > > > >   distinct functions (e.g., `watchdog_perf_hardlockup_enable`).
> > > > > > - Global function pointers are introduced (`watchdog_hardlockup=
_enable_ptr`)
> > > > > >   to serve as a single API for the entire feature.
> > > > > > - A new `hardlockup_detector=3D` boot parameter is added to all=
ow the
> > > > > >   user to select the desired detector at boot time.
> > > > > > - The Kconfig options are simplified by removing the complex
> > > > > >   `HARDLOCKUP_DETECTOR_PREFER_BUDDY` and allowing both detector=
s to be
> > > > > >   built without mutual exclusion.
> > > > > > - The weak stubs are updated to call the new function pointers,
> > > > > >   centralizing the watchdog logic.
> > > > >
> > > > > What is the impact on  /proc/sys/kernel/nmi_watchdog ? Is that
> > > > > enabling and disabling whatever the boot time choice was? I'm not=
 sure
> > > > > why this has to be a boot time option given the ability to config=
ure
> > > > > via /proc/sys/kernel/nmi_watchdog.
> > > > The new hardlockup_detector boot parameter and the existing
> > > > /proc/sys/kernel/nmi_watchdog file serve different purposes.
> > > >
> > > > The boot parameter selects the type of hard lockup detector (perf o=
r buddy).
> > > > This choice is made once at boot.
> > > >
> > > >  /proc/sys/kernel/nmi_watchdog, on the other hand, is only a simple=
 on/off
> > > > switch for the currently selected detector. It does not change the =
detector's
> > > > type.
> > >
> > > So the name "nmi_watchdog" for the buddy watchdog is wrong for fairly
> > > obvious naming reasons but also because we can't differentiate when a
> > > perf event has been taken or not - this impacts perf that is choosing
> > > not to group events in metrics because of it, reducing the metric's
> > > accuracy. We need an equivalent "buddy_watchdog" file to the
> > > "nmi_watchdog" file. If we have such a file then if I did "echo 1 >
> > > /proc/sys/kernel/nmi_watchdog" I'd expect the buddy watchdog to be
> > > disabled and the perf event one to be enabled. Similarly, if I did
> > > "echo 1 > /proc/sys/kernel/buddy_watchdog" then I would expect the
> > > perf event watchdog to be disabled and the buddy one enabled. If I di=
d
> > >  "echo 0 > /proc/sys/kernel/nmi_watchdog; echo 0 >
> > > /proc/sys/kernel/buddy_watchdog" then I'd expect neither to be
> > > enabled. I don't see why choosing the type of watchdog implementation
> > > at boot time is particularly desirable. It seems sensible to default
> > > normal people to using the buddy watchdog (more perf events, power...=
)
> > > and  CONFIG_DEBUG_KERNEL type people to using the perf event one. As
> > > the "nmi_watchdog" file may be assumed to control the buddy watchdog,
> > > perhaps a compatibility option (where the "nmi_watchdog" file control=
s
> > > the buddy watchdog) is needed so that user code has time to migrate.
> >
> > Sounds good to me.  For perf tools, it'd be great if we can have a run-
> > time check which watchdog is selected.
> Considering backward compatibility, I prefer to keep
> /proc/sys/kernel/nmi_watchdog and introduce a new file called
> /proc/sys/kernel/hardlockup_detector_type, which only shows the default s=
tring
> or the boot parameter.

Is there code using the buddy watchdog that cares about the
/proc/sys/kernel/nmi_watchdog file? My assumption is that everything
except Android is using the NMI watchdog, so a new
/proc/sys/kernel/buddy_watchdog file doesn't impact them. On Android
writing to /proc/sys/kernel/nmi_watchdog would switch from updating
the buddy watchdog enable/disable to the NMI watchdog enable/disable,
but it is a straightforward patch to make anything doing this update
the buddy_watchdog file instead.

If we have to keep "nmi_watchdog" then we should deprecate it and
create an equivalent file with a better name (ie without NMI in it).
It'll be moderately annoying in perf to determine whether the NMI
watchdog is enabled by having to read two files.

Thanks,
Ian

> The global str pointer hardlockup_detector_type was already introduced in=
 the
> patch, so exposing it in a file is straightforward.
> >
> > Thanks,
> > Namhyung
> >
>
> --
> Jinchao

