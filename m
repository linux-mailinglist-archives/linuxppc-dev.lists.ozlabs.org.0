Return-Path: <linuxppc-dev+bounces-12683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFB4BBFE15
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 03:00:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgd97507Zz2yqh;
	Tue,  7 Oct 2025 12:00:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759798827;
	cv=none; b=C2eCaex3qO25rcgIwEJB59or/1O0f+aWYx+cxWNhQdYLLOC21a4+3XhyFmrXn2fEDT+tn2aVT9jdjJvwbH7pyj1EwkBfXc9VU6ksh52p0bBpYpFVciTz1Z87RT+eST7eXBWmE/ziJXNxisXBO5gdHL4i4/w7gm5ALbRaKQtCClTPPmiCAE9DCfErZUEMzynAsJzI00y0ELGm07rJorR2Td+0n/p+MY9+E5Mi6q6SOMtxAMz8Rcp7yIwZJLBfK6e/DJj8JEmIpUtZ9zL7TwGb19lDYpwORC9xKiLNNMJhw+Cl6RULPQbDGTBwAP7dLo9ggeaBchf20yD0Z37Iwc84PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759798827; c=relaxed/relaxed;
	bh=k6mQHeLbc51hD/eXve78YPM4+TxG0628utfcdDhF6wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+/NnApCeGM4VDY37qlIj7Moye0koAZbghY6HTRqg+U1ruojQR5XAKDlLbmJiea+UvOWh9WJBXGoCwYzeH/HP6wguoD9b4MfemjpeXpMC9RujCYa9MbmSx5KThe4ArfWVqM1UyOL9RrADlumFcW9vz4KLLhNVJLpJM7EpQEQ68jFUbOYBFglpieUvIXWXSwgIrITQD13b5ljorHhNjGWCmnTrjmfIx3A0zNlyx/ztN6fpI5+lPxr2AepmDtuuCxAiHZ9R0IRT9c1LxGPjYWF1Z9JwSblboHCsTwhgLxso6Ag4uN/z6vqP1q6Na5TzyoWOjNritIxxhqKMoGN+WsNCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MrYLwZ4J; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MrYLwZ4J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgd96324Pz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 12:00:25 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2731ff54949so48585ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Oct 2025 18:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759798823; x=1760403623; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6mQHeLbc51hD/eXve78YPM4+TxG0628utfcdDhF6wI=;
        b=MrYLwZ4J2SGEECpOaOG6ds2UJBo0YSg4bP7Fzc3VeI+s8QyG769sNXV119ig0V/dXt
         AMIP3v+2jvOO3aK4HmpAJTjhx99OMgqYC4Atzt6M8InMBszLeuP2B0l1IRzd6llevchx
         mVPsLuR3OBpUv5ZpCy+Bnqlp/nRNxBwKhxCcuPvLQzjn1O/VSUDXR3nadlNXFIBlFEfs
         cRKSnoDCP6QKeKbTwaQvFliLrezBgsLIXOMSbiXmgwmTrwbXhw//4XfJ6yVaUHudu7JV
         Nzj7OzPNK9Y3JS5iqncYJzZvm9FOgbSt5VohdDvhcuPri199ZQOE2kNpxgnMN+vjx8cH
         Jiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759798823; x=1760403623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6mQHeLbc51hD/eXve78YPM4+TxG0628utfcdDhF6wI=;
        b=lB+7892NKF20DPGX41mQn3thg4b05xSRXmPicFCucqkSEs+g38LqHGQ5Ze0gJj6kTo
         mfPPoDO9hZd/wPZnbpQRJ0CGA3LRnnO7Cg1XeQPEyxFRBWTRABhjB4i8a9sByjQvPaC9
         QkGIcHZdNU2kLRKDa2W/ozIsk4yOBmHh0FN0/5pygwnDFHU+BRfhJngMH6YrWzO43fiE
         OhzcRWtUdCtAUL2/7b9bm8CDR9Pswmy9NZr/MPC5y6/5PY4dZgfddHaXae+Q0twobACu
         n8cLXTzxiOybfwTQ5zB/efksV89eT0LSGEswKbcvdRi41JZ+ejpDnIuiN83Ac5/yuqb1
         w2ig==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2QtsLeZ1NOEO2ho6s86zYDOI+YlXaqfD3ojdRlvNvRhJ39MxOG4ZtreqMRwn2Ri5gBZBxrrDDlUKKBo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhG2UOzoY3Y+xqC7oklGrXwWTcyaj+iMAXrTOAnPzHu3oI4bY7
	pPctKC7Vk+V2B0GnHs4uns0CxMrJBtlGLsyj8NWXyTttcfK3jaPpAFjW6EzAX0ZeahlmwFB+pj0
	Gu4wLe7YC/jcnHbs4+cwx/Pek1WL1D5HUTDpCHfyR
X-Gm-Gg: ASbGnctp3LkjZi7xOKIPUBmsPmXDAX8+/SSInGHtM3jr96ypVRMZpEU9I2WF4gB7fRz
	YlHgsd+OL2m7QaCGI6Et621BV5eo+4/bflTH+l8ttgLOumxJJFaj10Db2H51Cya3e3P/x5JmcOB
	FhCQeN1jA1xlWvDVHHIByt9wsXmPJHoQVsBsQK/ftI7uyMwmiEZABRNr0vIF1YP+/3nNVO7YBuc
	KHfgUR52l4OXyZ/awsGEingvRcyieXaBdkvgT6a1iIyhn6rak/7A6PY6Cr9oTkjL+BrYJU=
X-Google-Smtp-Source: AGHT+IGtKqlcr/X53YFNFTKkWMvGJGQM0ey7+a031TD49SZJiyKQEgCc9CJhuov2G46Tt8YqmZ9/Z/qPCT8m39Nszs0=
X-Received: by 2002:a17:903:298d:b0:267:912b:2b4d with SMTP id
 d9443c01a7336-28ecb74c0e7mr1431545ad.7.1759798822443; Mon, 06 Oct 2025
 18:00:22 -0700 (PDT)
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
 <CAD=FV=VNmjTVxcxgTQqjE7CTkK2NVGbRxFJSwv=yOHU8gj-urQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VNmjTVxcxgTQqjE7CTkK2NVGbRxFJSwv=yOHU8gj-urQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 6 Oct 2025 18:00:09 -0700
X-Gm-Features: AS18NWDGLlvOhtxIZkpVyFf6Sm7S3dsd_RTNVJ4XYO9x6ozGHkZMxjn7T41Jhr4
Message-ID: <CAP-5=fW64xHEW+4dKU_voNv7E67nUOFm27FFBuhtFii52NiQUQ@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Doug Anderson <dianders@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 6, 2025 at 4:32=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Oct 6, 2025 at 2:30=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
> >
> > On Tue, Sep 16, 2025 at 11:14=E2=80=AFPM Jinchao Wang <wangjinchao600@g=
mail.com> wrote:
> > >
> > > On Tue, Sep 16, 2025 at 10:35:46PM -0700, Namhyung Kim wrote:
> > > > Hello,
> > > >
> > > > On Tue, Sep 16, 2025 at 10:13:12PM -0700, Ian Rogers wrote:
> > > > > On Tue, Sep 16, 2025 at 6:47=E2=80=AFPM Jinchao Wang <wangjinchao=
600@gmail.com> wrote:
> > > > > >
> > > > > > On Tue, Sep 16, 2025 at 05:03:48PM -0700, Ian Rogers wrote:
> > > > > > > On Tue, Sep 16, 2025 at 7:51=E2=80=AFAM Jinchao Wang <wangjin=
chao600@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Currently, the hard lockup detector is selected at compile =
time via
> > > > > > > > Kconfig, which requires a kernel rebuild to switch implemen=
tations.
> > > > > > > > This is inflexible, especially on systems where a perf even=
t may not
> > > > > > > > be available or may be needed for other tasks.
> > > > > > > >
> > > > > > > > This commit refactors the hard lockup detector to replace a=
 rigid
> > > > > > > > compile-time choice with a flexible build-time and boot-tim=
e solution.
> > > > > > > > The patch supports building the kernel with either detector
> > > > > > > > independently, or with both. When both are built, a new boo=
t parameter
> > > > > > > > `hardlockup_detector=3D"perf|buddy"` allows the selection a=
t boot time.
> > > > > > > > This is a more robust and user-friendly design.
> > > > > > > >
> > > > > > > > This patch is a follow-up to the discussion on the kernel m=
ailing list
> > > > > > > > regarding the preference and future of the hard lockup dete=
ctors. It
> > > > > > > > implements a flexible solution that addresses the community=
's need to
> > > > > > > > select an appropriate detector at boot time.
> > > > > > > >
> > > > > > > > The core changes are:
> > > > > > > > - The `perf` and `buddy` watchdog implementations are separ=
ated into
> > > > > > > >   distinct functions (e.g., `watchdog_perf_hardlockup_enabl=
e`).
> > > > > > > > - Global function pointers are introduced (`watchdog_hardlo=
ckup_enable_ptr`)
> > > > > > > >   to serve as a single API for the entire feature.
> > > > > > > > - A new `hardlockup_detector=3D` boot parameter is added to=
 allow the
> > > > > > > >   user to select the desired detector at boot time.
> > > > > > > > - The Kconfig options are simplified by removing the comple=
x
> > > > > > > >   `HARDLOCKUP_DETECTOR_PREFER_BUDDY` and allowing both dete=
ctors to be
> > > > > > > >   built without mutual exclusion.
> > > > > > > > - The weak stubs are updated to call the new function point=
ers,
> > > > > > > >   centralizing the watchdog logic.
> > > > > > >
> > > > > > > What is the impact on  /proc/sys/kernel/nmi_watchdog ? Is tha=
t
> > > > > > > enabling and disabling whatever the boot time choice was? I'm=
 not sure
> > > > > > > why this has to be a boot time option given the ability to co=
nfigure
> > > > > > > via /proc/sys/kernel/nmi_watchdog.
> > > > > > The new hardlockup_detector boot parameter and the existing
> > > > > > /proc/sys/kernel/nmi_watchdog file serve different purposes.
> > > > > >
> > > > > > The boot parameter selects the type of hard lockup detector (pe=
rf or buddy).
> > > > > > This choice is made once at boot.
> > > > > >
> > > > > >  /proc/sys/kernel/nmi_watchdog, on the other hand, is only a si=
mple on/off
> > > > > > switch for the currently selected detector. It does not change =
the detector's
> > > > > > type.
> > > > >
> > > > > So the name "nmi_watchdog" for the buddy watchdog is wrong for fa=
irly
> > > > > obvious naming reasons but also because we can't differentiate wh=
en a
> > > > > perf event has been taken or not - this impacts perf that is choo=
sing
> > > > > not to group events in metrics because of it, reducing the metric=
's
> > > > > accuracy. We need an equivalent "buddy_watchdog" file to the
> > > > > "nmi_watchdog" file. If we have such a file then if I did "echo 1=
 >
> > > > > /proc/sys/kernel/nmi_watchdog" I'd expect the buddy watchdog to b=
e
> > > > > disabled and the perf event one to be enabled. Similarly, if I di=
d
> > > > > "echo 1 > /proc/sys/kernel/buddy_watchdog" then I would expect th=
e
> > > > > perf event watchdog to be disabled and the buddy one enabled. If =
I did
> > > > >  "echo 0 > /proc/sys/kernel/nmi_watchdog; echo 0 >
> > > > > /proc/sys/kernel/buddy_watchdog" then I'd expect neither to be
> > > > > enabled. I don't see why choosing the type of watchdog implementa=
tion
> > > > > at boot time is particularly desirable. It seems sensible to defa=
ult
> > > > > normal people to using the buddy watchdog (more perf events, powe=
r...)
> > > > > and  CONFIG_DEBUG_KERNEL type people to using the perf event one.=
 As
> > > > > the "nmi_watchdog" file may be assumed to control the buddy watch=
dog,
> > > > > perhaps a compatibility option (where the "nmi_watchdog" file con=
trols
> > > > > the buddy watchdog) is needed so that user code has time to migra=
te.
> > > >
> > > > Sounds good to me.  For perf tools, it'd be great if we can have a =
run-
> > > > time check which watchdog is selected.
> > > Considering backward compatibility, I prefer to keep
> > > /proc/sys/kernel/nmi_watchdog and introduce a new file called
> > > /proc/sys/kernel/hardlockup_detector_type, which only shows the defau=
lt string
> > > or the boot parameter.
> >
> > Is there code using the buddy watchdog that cares about the
> > /proc/sys/kernel/nmi_watchdog file? My assumption is that everything
> > except Android is using the NMI watchdog, so a new
> > /proc/sys/kernel/buddy_watchdog file doesn't impact them.
>
> Buddy watchdog has been out there for a few years. At Google, I know
> it's used by everything except Android. AKA I believe it is used in
> Google's servers and also in ChromeOS. Both of those (presumably)
> enable the buddy watchdog via calling it "nmi_watchdog". It's possible
> that some Android phones are using the buddy watchdog too but I'm not
> aware of it. I don't believe Pixel is using it, though that could
> change in the future.

I thought what motivated the buddy watchdog was patches implementing
this approach on Android for ARM that lacked an NMI based hard lockup
detector?
Anyway, while the buddy watchdog is in use by Google servers the
nmi_watchdog file has an actively detrimental effect on that.
Specifically the nmi_watchdog file having the value of "1" disables
certain event groups for certain metrics in the perf tool as it is
assumed there are too few performance counters due to the NMI watchdog
stealing one. We want groups of events so that events are scheduled
together and metrics are more accurate, we don't want groups that fail
to schedule because of a lack of counters.

> IMO at this point "nmi watchdog" is simply a synonym for the
> hardlockup detector. That was what it looked like in the code before I
> started messing around and adding the buddy lockup detector and it's
> how it is now. While it's unfortunate that there are two names for the
> same thing, I don't personally think that should change at this point.
> FWIW, even the "buddy" watchdog relies on NMIs to actually get stack
> crawls on stuck cores, so NMI still means something even there.

I think this is misguided. Currently the only use of nmi_watchdog I'm
aware of is by perf where the buddy watchdog's use of it causes issues
(as mentioned above).

> If we want to tell between the perf detector or the buddy detector we
> should add a separate file for it.

We could with perf then having to read from two files rather than one.
Presumably the lack of presence of one file will be sufficient to also
avoid a kernel version check.

> > On Android
> > writing to /proc/sys/kernel/nmi_watchdog would switch from updating
> > the buddy watchdog enable/disable to the NMI watchdog enable/disable,
> > but it is a straightforward patch to make anything doing this update
> > the buddy_watchdog file instead.
>
> Straightforward, but you've got to go find everyone that you break by
> doing this. That's not something I want responsibility for. If you
> want to convince others this is something worthwhile and you've got
> someone signed up to deal with the fallout (if any) then I won't
> object, but it's not something I'd be in support of.

Stuff like this happens, check out this thread:
https://lore.kernel.org/lkml/2025020304-chip-trench-4e56@gregkh/
Imo we shouldn't design in using an actively misleading file name and
incurring extra overhead in perf. Having two files nmi_watchdog and
buddy_watchdog is fine as the latter case currently isn't in
mainstream distro use and people shouldn't care. It also maintains and
correct's perf's behavior when the buddy and not nmi watchdog is in
use.

> > If we have to keep "nmi_watchdog" then we should deprecate it and
> > create an equivalent file with a better name (ie without NMI in it).
> > It'll be moderately annoying in perf to determine whether the NMI
> > watchdog is enabled by having to read two files.
>
> Again, up to you if you want to try to do this, but I'm not really in
> support of it. It doesn't seem terribly hard to make a new file that
> says which hardlockup detector is in use. If that file exists then
> read it. If not then you fallback to what you have today.

I don't mind a file that also says what kind of lockup detector is in
use. I'd like the meaning of nmi_watchdog to keep meaning the kernel
stole a perf counter as this is the behavior long assumed by perf
which I think is the majority or only user of the file. I think the
buddy watchdog being controlled by this file is less than intention
revealing.

Thanks,
Ian

> -Doug

