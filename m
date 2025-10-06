Return-Path: <linuxppc-dev+bounces-12682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC77EBBFC7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 01:25:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgb394VWMz2xnh;
	Tue,  7 Oct 2025 10:25:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759793109;
	cv=none; b=T0JMmHYEtuM5Jtl0MgOYFdRDZz/Po/9BIXV8kJxD/PCjhi6IphSpDdFLPYIk60aY2R3dqJ4xsEyZYT51/qldOZVNhj+ihVMaB0E7ExQCoUzHwSWodGCWP4birec0camqpGZw36fFOLsddEYgP4gtBpWWUABWJwAOdHFz6Zb0cDs1+RuQjgdlHz1BfYDWmMVRO6qq7ernWdiPIY1Ex0MInEfjfirk4EfEi8Lf6zaSj6Msows1dGP2lNHZ0PXbbCtMVhcx2fo1atnrxYq6YOZ7PqTXwdVEGtUMptxZvvTPWRoVgEtatXjxDMAF+hxvQqVBBVnA+7RC47b9eIdylMt4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759793109; c=relaxed/relaxed;
	bh=Gnju/FemhqeCtzM3OCxOQRA++/MMOptuug53TgoDLoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZU0G/NP09nGByMMUOMuXJFRyJhoszu6AA7ZR1GGNMYcoFngQd7UCCIM5AwV2MNsBWCEtwyxYha2UxIZDCFQaxoqA9W47nIV4BHdMyYerVAJeuLA0xjxkRTuW3bKx5aaRtxUsY0Ynaat3xkPhODbb2jzUMubZcFZpZOOrvz1U6m38vIv7c7KowUbeB7HQ4XwYQGDxe2a9c0IfGJz2vX3N+yaFTucYjuPuwo7ygibBXusW1pBZbS8b4w1D4U2COH1wD7nkb0DITHvZVezwOif6kBzhiNdSOwPlZhFhPe3F3DpGu73bGJDqR8S4vJ7sj49qFm2UMMpLDW4muhmhDY0fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bvv8EcUc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bvv8EcUc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgb372RGBz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 10:25:06 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b631b435d59so255486a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Oct 2025 16:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759793099; x=1760397899; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gnju/FemhqeCtzM3OCxOQRA++/MMOptuug53TgoDLoo=;
        b=Bvv8EcUc4OxAPpkepkl9/Sr0bqt6uQx3YMVTZsBRpYe6jAP77MqMtIRYc3+c3/L3x+
         6XasRbSdxaBn7qIoQTyCQnU7OiBYwznchN7k49EsHtfy3DH677P1JiqHkcAM8dAmeSrD
         EhFg0igGCdy0nTQbnNQXYmBcaD898UhGWdOpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759793099; x=1760397899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gnju/FemhqeCtzM3OCxOQRA++/MMOptuug53TgoDLoo=;
        b=bPX6dJTZpGr1u203KhDmyye/H/hFLxZ2uYN2kjjbm8y1O2rSkmWp6U0S+JPIH9bjcC
         9Sxhy2WGun34CxXR2FyJkz1bEjlCdUesERRcZLeWwL6rzaGGEn0F0VM3I8F9EqMwT5Y4
         PzSwwj3l8y77JERsl9edWNd8VG0hrRQNz6HN+yFLelIBQOOKGSzCQNZt7BdL869Nxwma
         e2vJ2f5hRw/1l9+tfKAq2UYmWamYzHOTq0q1wV04DxOeN6gN9WjAYceUqIEiOm/HQj2G
         F3M1b8IVtXE1PaRFYJuypUShgWWGRBeW1EXShbjWOTqVTa6GVXI5z/knl0LlQ9rjio8G
         VXVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdncoJ7Eq6M05G2aH0M0IZ6KnwUi2bWdTGjQMRi+fADUaZxuk+OaZBp7OezN3VRwT1ZZRbjiP0xGsJkdA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHVd5a3XT+r7nbhjZcmV/L8Jn58YLNZ60JFBcZn7/Eqxnc5Tru
	bI7b0TbVseaK9ZFfaLqhjTnpIDpx8Bpv0TKOW+wTKiB7eY70R/+PYQOVuSxthjWl90wfXBvoU1C
	Vhh4=
X-Gm-Gg: ASbGnct0ZijJ+azG9qAv4cbMzBavygKhAUNRTORmx1wTRviPlYKYwN7p6o9l/Lgpkzr
	FzaPpBfNrkuyckZzHTxJ+v1DtK/ewq+JR6l1Fnp9C4QQ7qGW+o1Uc9gq5iqTrYf9R2wwCgCbZyM
	dOKjGA0KgIXdPYBT6oomm0aiGOlYhHeGbnQ046jVOAPIeJ5ZGojcONi/2rPTAcv+P0duNRm/U8i
	flfBLamrl9HTYeIgeZ1ZFNc8ewvJwqn5bQM0XSGOJ59RTy30muPiAgE6Jf8pQDf9SU0h/NI5mm3
	dGY/UNISKtu5XiV81MMqZXR4mf4+KDES7BQhPiml9csaPhVRjql+vtE6szJQc231bMnLHul3HWU
	pJzBn3eA3w/D9285xUwLFAzz/GB86F3yMacRq/8Hxa/agCgXxM162tODMfvW5rABZrkpUxIGfoj
	ISovp2S1uTN+G0xA==
X-Google-Smtp-Source: AGHT+IGTdQPw3RJvO9hu1PuEksrpNQXp9fyYiSIO8HtX4A/mE22jjGM/vivAI+UReJo0r8MzTF/NcA==
X-Received: by 2002:a17:903:1a8c:b0:28e:681c:a7ed with SMTP id d9443c01a7336-28e9a6293bamr191867585ad.36.1759793099218;
        Mon, 06 Oct 2025 16:24:59 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1260cfsm144536495ad.48.2025.10.06.16.24.57
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 16:24:57 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b6271ea39f4so3288389a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Oct 2025 16:24:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9cq1wOt6nJmg26QGE1P4VRcSfgUpk5lJ9ErMCW+HCzpQnpCEMHW/0WOiq/yEVJOX80L8jucDYsk6in0s=@lists.ozlabs.org
X-Received: by 2002:a17:903:1a86:b0:28e:7567:3c45 with SMTP id
 d9443c01a7336-28e9a54ef63mr131748815ad.9.1759793096320; Mon, 06 Oct 2025
 16:24:56 -0700 (PDT)
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
 <aMpIsqcgpOH1AObN@z2> <aMpRqlDXXOR5qYFd@mdev> <CAP-5=fV05++2Qvcxs=+tqhTdpGK8L9e5HzVu=y+xHxy9AqLMmg@mail.gmail.com>
In-Reply-To: <CAP-5=fV05++2Qvcxs=+tqhTdpGK8L9e5HzVu=y+xHxy9AqLMmg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Oct 2025 16:24:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNmjTVxcxgTQqjE7CTkK2NVGbRxFJSwv=yOHU8gj-urQ@mail.gmail.com>
X-Gm-Features: AS18NWBbZ6LGmNfNjtMxbnkF3b7BSgxpW00PIA8Lwf4SUgxrT3SU1KuL0dbjEqc
Message-ID: <CAD=FV=VNmjTVxcxgTQqjE7CTkK2NVGbRxFJSwv=yOHU8gj-urQ@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Ian Rogers <irogers@google.com>
Cc: Jinchao Wang <wangjinchao600@gmail.com>, Namhyung Kim <namhyung@kernel.org>, 
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Mon, Oct 6, 2025 at 2:30=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Tue, Sep 16, 2025 at 11:14=E2=80=AFPM Jinchao Wang <wangjinchao600@gma=
il.com> wrote:
> >
> > On Tue, Sep 16, 2025 at 10:35:46PM -0700, Namhyung Kim wrote:
> > > Hello,
> > >
> > > On Tue, Sep 16, 2025 at 10:13:12PM -0700, Ian Rogers wrote:
> > > > On Tue, Sep 16, 2025 at 6:47=E2=80=AFPM Jinchao Wang <wangjinchao60=
0@gmail.com> wrote:
> > > > >
> > > > > On Tue, Sep 16, 2025 at 05:03:48PM -0700, Ian Rogers wrote:
> > > > > > On Tue, Sep 16, 2025 at 7:51=E2=80=AFAM Jinchao Wang <wangjinch=
ao600@gmail.com> wrote:
> > > > > > >
> > > > > > > Currently, the hard lockup detector is selected at compile ti=
me via
> > > > > > > Kconfig, which requires a kernel rebuild to switch implementa=
tions.
> > > > > > > This is inflexible, especially on systems where a perf event =
may not
> > > > > > > be available or may be needed for other tasks.
> > > > > > >
> > > > > > > This commit refactors the hard lockup detector to replace a r=
igid
> > > > > > > compile-time choice with a flexible build-time and boot-time =
solution.
> > > > > > > The patch supports building the kernel with either detector
> > > > > > > independently, or with both. When both are built, a new boot =
parameter
> > > > > > > `hardlockup_detector=3D"perf|buddy"` allows the selection at =
boot time.
> > > > > > > This is a more robust and user-friendly design.
> > > > > > >
> > > > > > > This patch is a follow-up to the discussion on the kernel mai=
ling list
> > > > > > > regarding the preference and future of the hard lockup detect=
ors. It
> > > > > > > implements a flexible solution that addresses the community's=
 need to
> > > > > > > select an appropriate detector at boot time.
> > > > > > >
> > > > > > > The core changes are:
> > > > > > > - The `perf` and `buddy` watchdog implementations are separat=
ed into
> > > > > > >   distinct functions (e.g., `watchdog_perf_hardlockup_enable`=
).
> > > > > > > - Global function pointers are introduced (`watchdog_hardlock=
up_enable_ptr`)
> > > > > > >   to serve as a single API for the entire feature.
> > > > > > > - A new `hardlockup_detector=3D` boot parameter is added to a=
llow the
> > > > > > >   user to select the desired detector at boot time.
> > > > > > > - The Kconfig options are simplified by removing the complex
> > > > > > >   `HARDLOCKUP_DETECTOR_PREFER_BUDDY` and allowing both detect=
ors to be
> > > > > > >   built without mutual exclusion.
> > > > > > > - The weak stubs are updated to call the new function pointer=
s,
> > > > > > >   centralizing the watchdog logic.
> > > > > >
> > > > > > What is the impact on  /proc/sys/kernel/nmi_watchdog ? Is that
> > > > > > enabling and disabling whatever the boot time choice was? I'm n=
ot sure
> > > > > > why this has to be a boot time option given the ability to conf=
igure
> > > > > > via /proc/sys/kernel/nmi_watchdog.
> > > > > The new hardlockup_detector boot parameter and the existing
> > > > > /proc/sys/kernel/nmi_watchdog file serve different purposes.
> > > > >
> > > > > The boot parameter selects the type of hard lockup detector (perf=
 or buddy).
> > > > > This choice is made once at boot.
> > > > >
> > > > >  /proc/sys/kernel/nmi_watchdog, on the other hand, is only a simp=
le on/off
> > > > > switch for the currently selected detector. It does not change th=
e detector's
> > > > > type.
> > > >
> > > > So the name "nmi_watchdog" for the buddy watchdog is wrong for fair=
ly
> > > > obvious naming reasons but also because we can't differentiate when=
 a
> > > > perf event has been taken or not - this impacts perf that is choosi=
ng
> > > > not to group events in metrics because of it, reducing the metric's
> > > > accuracy. We need an equivalent "buddy_watchdog" file to the
> > > > "nmi_watchdog" file. If we have such a file then if I did "echo 1 >
> > > > /proc/sys/kernel/nmi_watchdog" I'd expect the buddy watchdog to be
> > > > disabled and the perf event one to be enabled. Similarly, if I did
> > > > "echo 1 > /proc/sys/kernel/buddy_watchdog" then I would expect the
> > > > perf event watchdog to be disabled and the buddy one enabled. If I =
did
> > > >  "echo 0 > /proc/sys/kernel/nmi_watchdog; echo 0 >
> > > > /proc/sys/kernel/buddy_watchdog" then I'd expect neither to be
> > > > enabled. I don't see why choosing the type of watchdog implementati=
on
> > > > at boot time is particularly desirable. It seems sensible to defaul=
t
> > > > normal people to using the buddy watchdog (more perf events, power.=
..)
> > > > and  CONFIG_DEBUG_KERNEL type people to using the perf event one. A=
s
> > > > the "nmi_watchdog" file may be assumed to control the buddy watchdo=
g,
> > > > perhaps a compatibility option (where the "nmi_watchdog" file contr=
ols
> > > > the buddy watchdog) is needed so that user code has time to migrate=
.
> > >
> > > Sounds good to me.  For perf tools, it'd be great if we can have a ru=
n-
> > > time check which watchdog is selected.
> > Considering backward compatibility, I prefer to keep
> > /proc/sys/kernel/nmi_watchdog and introduce a new file called
> > /proc/sys/kernel/hardlockup_detector_type, which only shows the default=
 string
> > or the boot parameter.
>
> Is there code using the buddy watchdog that cares about the
> /proc/sys/kernel/nmi_watchdog file? My assumption is that everything
> except Android is using the NMI watchdog, so a new
> /proc/sys/kernel/buddy_watchdog file doesn't impact them.

Buddy watchdog has been out there for a few years. At Google, I know
it's used by everything except Android. AKA I believe it is used in
Google's servers and also in ChromeOS. Both of those (presumably)
enable the buddy watchdog via calling it "nmi_watchdog". It's possible
that some Android phones are using the buddy watchdog too but I'm not
aware of it. I don't believe Pixel is using it, though that could
change in the future.

IMO at this point "nmi watchdog" is simply a synonym for the
hardlockup detector. That was what it looked like in the code before I
started messing around and adding the buddy lockup detector and it's
how it is now. While it's unfortunate that there are two names for the
same thing, I don't personally think that should change at this point.
FWIW, even the "buddy" watchdog relies on NMIs to actually get stack
crawls on stuck cores, so NMI still means something even there.

If we want to tell between the perf detector or the buddy detector we
should add a separate file for it.

> On Android
> writing to /proc/sys/kernel/nmi_watchdog would switch from updating
> the buddy watchdog enable/disable to the NMI watchdog enable/disable,
> but it is a straightforward patch to make anything doing this update
> the buddy_watchdog file instead.

Straightforward, but you've got to go find everyone that you break by
doing this. That's not something I want responsibility for. If you
want to convince others this is something worthwhile and you've got
someone signed up to deal with the fallout (if any) then I won't
object, but it's not something I'd be in support of.


> If we have to keep "nmi_watchdog" then we should deprecate it and
> create an equivalent file with a better name (ie without NMI in it).
> It'll be moderately annoying in perf to determine whether the NMI
> watchdog is enabled by having to read two files.

Again, up to you if you want to try to do this, but I'm not really in
support of it. It doesn't seem terribly hard to make a new file that
says which hardlockup detector is in use. If that file exists then
read it. If not then you fallback to what you have today.

-Doug

