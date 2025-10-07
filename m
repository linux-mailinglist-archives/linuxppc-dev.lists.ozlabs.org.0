Return-Path: <linuxppc-dev+bounces-12698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A7BC2CB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 23:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ch8v445rSz2xnk;
	Wed,  8 Oct 2025 08:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::a35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759873808;
	cv=none; b=ZmnGLutDM8Ek6vWn64F32YmMF4bOrndawunXRkb0TLeHYJCZFgnRnXl66em26rAD7wWjwD5Pf9hHFdJ8ROXLaJui4+xi1Hk0QZOKv56oqJmbIz/cUw6lskJ9nn53r4ncOpYTFS8QBDUrh/Dow/CJhwgsgIImomUpa+6nL+hxEW4cRO4PuwQXndT5P2VxRB4IdQmX1YYRMnId7J4C/Pob/gGZpZJgzbgBZOIMqHT5dWNLQF8/M5cdbnjF0kZBantCE///kil/dA3e9/EoBhETt36qn1w0mjbt3bEmQIn7KC8KWknmK8EEtJYpce7XC/urk733BW36RMDVb85R9042nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759873808; c=relaxed/relaxed;
	bh=fq6BkujLYLi29aUNYGOcmotTjsZeMJXrFlPqy91DqOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsjPZZLCbA19dIpKPZnL+1D5g3/c268F+zcaecwRu6GRSbZF1GQDjmf8z2+3dES3nwPmHS7R9DShctUK01N01bGYLDghMkPcHswJucnzCfKVIG8XyWiRhg84NHs7+mFxhxmCIfBK1GV/2ECAVEt0SfSM4l5He5dwHNw1d8OlZwZuMVNi3mNL5TIKF6FmspFzYpDU+vARtEW6mUZs4vDD/7yLH+7VDMdf5XlqmOEAUA3rKqVUflqTiPHYr5HSOFZJKgclJjatK6tFuVPA5cvLKpMmqr/U5V+jIyK1L/A/Ord50GLXrp6jpGKBTA8Em/77rkEbn3zU2ZEEmIYmJ4ylIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FkenTkvo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a35; helo=mail-vk1-xa35.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FkenTkvo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::a35; helo=mail-vk1-xa35.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ch8v23xTMz2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 08:50:05 +1100 (AEDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-54aa789f9b5so5145596e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Oct 2025 14:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759873802; x=1760478602; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fq6BkujLYLi29aUNYGOcmotTjsZeMJXrFlPqy91DqOM=;
        b=FkenTkvotIL0WbpIlYRmXRB7TvDD/vV7k4xU2uBe7TdhRAVWzhXvWNQHiL4w0JsWYn
         g0JP68S97utY1oQrO/nea5y/pI+JjN/YHGz5ZDLhreLGcY5DireEW9LKgmSpsB6NHQ9W
         Ahnom1kdKfkIBit69kmTjg9hJJuJUly3BqK4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759873802; x=1760478602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fq6BkujLYLi29aUNYGOcmotTjsZeMJXrFlPqy91DqOM=;
        b=A3QnRemat1pit2PelxNzCubBvfUTkVsWkPcxO5MpnQWCKNxrvq7Zf0ZGcguWLKZUGw
         IAxLkxOjzQ2ILn4jcifiZs9DFwvq9F3H0WIPmsC797Q4EC3RzVFUpv3E7jrL8PdgAURw
         PQBJTqmPz2AOLXWgAeXGkGfZNDX3VOu1tTpaX4RT9B9poTJqwsIk9FUf39BwdSGIHLzb
         M4PHopamR/wRII4VM+ovbgIHj21wm7kLnaHsQ/J74Vfi6p0Hnhtqjc0yjxAMR0WwO2c0
         qPEqZUPmeCfVHVK2Dv7Nw1QctrSomTLEAM+ET6KjhHPaG5wy7siKJD3thNbzfNGmlsyt
         aTIw==
X-Forwarded-Encrypted: i=1; AJvYcCVFPGyo19Be6hX17eowZR7h+67fQKRWKrEAF1i65Rrwi0irhR7w3BjFju5zlmFBSs2XG9UZZRaiEzjZlkE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxRfSwxHMECmrtQEkqoMeilO6+oTPYgI7tScx6lMIll5uEqHyt
	yvV57AmHNgyyGbb2GCighJGLjwDnuIhBsjpzNY8K5wHX4o157g5JNPhl+Zum4TUlOsFqUbrIXXH
	Pdy0=
X-Gm-Gg: ASbGnctyshYd/86kHuTDGhrOGSVyR27az6ApdzTfPb9fprCpNHKYCKOsgg7pU8MGQsJ
	diZ1CPjnDbmJJf2sLQrY85vBie3nqe9yOrD8kwy/gK8D/+l9RZeejXRyYVLIFSH0bVYJfaDj3CQ
	uDkPEJLIC27tpV6uluy71OZJxGZWhz7EtX0jMhIZxSXImQhwihk0/yHjYFWmdQ2L3/RIePQ8VtI
	LlsDrNAxwPv18kJX/Z645tcY14/gpLbR7YZxSuf5TE3hVSCaHYhXmVduUftOEgExM5dPH1DFQQ+
	y7RMBGdSW85Uh7UR3hLe7kaIhuh5bEfxYNWuk+bMcIgGmHbAExdiDTNf8NTYO58icH2USNqkMEu
	6jw57ObFJ17QV+OY2ujL2CMdi5YoI3dXbP9ukqHRRYoBfyW9cQ245MvV/R2r948Su+X4a8IQWSe
	AWUV43JXv11+FUpHV5fr50
X-Google-Smtp-Source: AGHT+IHLoU//6tOZy3lpjMFd6Wfb8LdB4uAZ1RmkP7xBJqsjR3cjJxjf8mx3gnN1Xkj7T5KWrhW0xw==
X-Received: by 2002:a05:6122:6597:b0:54a:9fc0:40ab with SMTP id 71dfb90a1353d-554b8a82a0bmr593622e0c.2.1759873802020;
        Tue, 07 Oct 2025 14:50:02 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-552bd6e4dc5sm3040522e0c.21.2025.10.07.14.49.59
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 14:50:00 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89018e9f902so4146368241.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Oct 2025 14:49:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHvL8RyZQo61yZJMbsUhpi4pcPUhCLPsylLSDWfmYuxnIjfeuzz1q8q3UxF7hKtc4FQt7C2WIFP3pkZq0=@lists.ozlabs.org
X-Received: by 2002:a17:903:1a6b:b0:25c:abb3:9bae with SMTP id
 d9443c01a7336-29027385222mr12638845ad.48.1759873408458; Tue, 07 Oct 2025
 14:43:28 -0700 (PDT)
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
 <CAP-5=fW64xHEW+4dKU_voNv7E67nUOFm27FFBuhtFii52NiQUQ@mail.gmail.com>
 <CAD=FV=U3ic707dLuUc+NfxtWF6-ZyRdE0OY2VA6TgvgWKCHUzg@mail.gmail.com> <CAP-5=fVkw6TLjVuR3UCNs+X1cwVmYk7UFABio4oDOwfshqoP_g@mail.gmail.com>
In-Reply-To: <CAP-5=fVkw6TLjVuR3UCNs+X1cwVmYk7UFABio4oDOwfshqoP_g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Oct 2025 14:43:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWkZx8xQD=jBkOO6h2f5tw_KCoqhHciw5hkEOYU=GM8A@mail.gmail.com>
X-Gm-Features: AS18NWBYFe63_-xIFHhSVLEaht3LtLaaYEfLA9Sab9Q5YCvr1mkfoaxOS0mBbFo
Message-ID: <CAD=FV=UWkZx8xQD=jBkOO6h2f5tw_KCoqhHciw5hkEOYU=GM8A@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Ian Rogers <irogers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jinchao Wang <wangjinchao600@gmail.com>, 
	Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>, akpm@linux-foundation.org, 
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

On Tue, Oct 7, 2025 at 1:43=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Tue, Oct 7, 2025 at 1:00=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> > On Mon, Oct 6, 2025 at 6:00=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> ..
> > > I don't mind a file that also says what kind of lockup detector is in
> > > use. I'd like the meaning of nmi_watchdog to keep meaning the kernel
> > > stole a perf counter as this is the behavior long assumed by perf
> > > which I think is the majority or only user of the file. I think the
> > > buddy watchdog being controlled by this file is less than intention
> > > revealing.
> >
> > I'm more than happy to be outvoted, but IMO nothing about the name
> > "nmi_watchdog" says to me that a perf counter was stolen. It just says
> > that there's a watchdog that NMIs are part of its work.
> >
> > ...and, indeed, "nmi_watchdog" doesn't use perf on PPC, right? As far
> > as I can tell, from reading `arch/powerpc/kernel/watchdog.c` checks
> > `watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED`. ...and before I did
> > commit df95d3085caa ("watchdog/hardlockup: rename some "NMI watchdog"
> > constants/function") it was checking `watchdog_enabled &
> > NMI_WATCHDOG_ENABLED`. That was at least since 2019, I think...
> >
> > ...and you can see "PPC_WATCHDOG" depends on
> > "HARDLOCKUP_DETECTOR_ARCH", not "HARDLOCKUP_DETECTOR_PERF" so it's not
> > perf-backed.
> >
> > I think this is just the critical question: does/should "nmi_watchdog"
> > mean perf-backed detector or is "nmi_watchdog" just a synonym for
> > "hard lockup detector". In your mind it's the former and in my mind
> > it's the latter. The correct way forward depends on which way we want
> > to jump, right? In either case some external code is going to need to
> > change...
>
> So we could say it is one-idea against another, I'm hoping to be
> objective and come from the viewpoint of the perf code as part of its
> function is to be a demonstration of APIs and the buddy watchdog has
> altered this. The perf tool has referred to the nmi_watchdog's
> behavior in man pages and code since 2016:
> http://lkml.kernel.org/r/1459810686-15913-1-git-send-email-andi@firstfloo=
r.org
> ```
> +Globally pinned events can limit the number of counters available for
> +other groups. On x86 systems, the NMI watchdog pins a counter by default=
.
> +The nmi watchdog can be disabled as root with
> +
> +       echo 0 > /proc/sys/kernel/nmi_watchdog
> ```
> http://lkml.kernel.org/r/1464119559-17203-1-git-send-email-andi@firstfloo=
r.org
> ```
> +void arch_topdown_group_warn(void)
> +{
> +       fprintf(stderr,
> +               "nmi_watchdog enabled with topdown. May give wrong result=
s.\n"
> +               "Disable with echo 0 > /proc/sys/kernel/nmi_watchdog\n");
> +}
> ```
>
> Probably the most common error message dates back to 2017:
> http://lkml.kernel.org/r/20170211183218.ijnvb5f7ciyuunx4@pd.tnic
> ```
>       Some events weren't counted. Try disabling the NMI watchdog:
>            echo 0 > /proc/sys/kernel/nmi_watchdog
>            perf stat ...
>            echo 1 > /proc/sys/kernel/nmi_watchdog
> ```
> and that is saying "NMI watchdog" not "buddy watchdog". Users are
> familiar with the idea that the /proc/sys/kernel/nmi_watchdog is
> unremarkably controlling the NMI watchdog.
>
> I've not found another use of /proc/sys/kernel/nmi_watchdog outside of
> the perf tool.

Although it's possible I missed it, from my quick look in ChromeOS, I
don't see any use of `/proc/sys/kernel/nmi_watchdog` either. NOTE that
you also need to look for `sysctl` references to
`kernel.nmi_watchdog`, right? That's essentially a way to access the
exact same file...

The other thing you need to think about is the kernel command-line
parameter. Right now we have the kernel command line parameter
`nmi_watchdog=3D<0,1>` that can be used to turn the hardlockup detector
on or off. On PowerPC I believe it turns on/off the ARCH hardlockup
detector. On systems with the buddy hardlockup detector it turns
on/off the buddy hardlockup detector. How are you proposing to handle
that? Are you going to make the kernel command line parameter still
affect everyone, or require people using the kernel command line
parameter for buddy/powerpc to change?

All of these ways to turn off/on the hardlockup detector can, in
theory, also be things that end users are messing with. People may
have settings in their `/etc/sysctl.d` to tweak things. They may have
messed with the kernel command line in their bootloader to tweak this
setting. I'm not saying it's impossible to change, but anyone who
changes this has to be prepared for people to yell.


> > The kernel docs are certainly pretty ambiguous here. "kernel.rst"
> > certainly mentions perf, but it also says that "nmi_watchdog" is only
> > for x86 which is certainly not true. "lockup-watchdogs.rst" doesn't
> > say anything about perf and just seems to indicate that "nmi_watchdog"
> > is another name for the hardlockup detector.  "kernel-parameters.txt"
> > makes some mention of tweaking which perf event would be used, but
> > otherwise makes it sound like the nmi_watchdog is just another name
> > for the hardlockup detector.
> >
> > My vote would be two files:
> >
> > * "nmi_watchdog" - simply a synonym for "hardlockup detector". 1
> > enabled, 0 if not (like today)
> >
> > * "hardlock_detector" - could be "buddy", "perf", or "arch"
> >
> > ...if the "hardlockup_detector" file doesn't exist and "nmi_watchdog"
> > is enabled, you could probably guess that a perf event was in use. If
> > the "hardlockup_detector" file exists then a perf event is only in use
> > if the value of that file is "perf". It doesn't feel terribly hard to
> > do this and it doesn't break anyone who was assuming they could turn
> > on the hardlockup detector with "/proc/nmi_watchdog".
>
> It is not hard but:
> 1) it means whenever perf wants to determine the NMI watchdog is
> present it needs to read two files rather than the existing 1, which
> has some runtime cost;
> 2) the name nmi_watchdog for controlling the behavior of the buddy
> watchdog isn't intention revealing as the buddy mechanisms whole point
> is to avoid the NMI;

The buddy mechanism is to avoid the use of a perf counter, not an NMI
(non maskable interrupt). "NMI" !=3D "perf counter". Many types of
interrupts can be non-maskable (or pseudo-non-maskable). The buddy
lockup detector still uses an NMI (indirectly). Specifically, a
non-maskable IPI (NMI-backed IPI) is used to interrupt the other CPU.

You keep saying that perf wants to determine if the "NMI watchdog" is
present. That's not what it wants to know. It wants to know if the
hard lockup detector (which likely uses NMIs in some way) happens to
use up a perf event. If an NMI-backed hardlockup detector (presumably
like the one on PowerPC) wasn't using a perf counter then perf
wouldn't care.


> 3) old perf tools with the buddy watchdog have the wrong behavior
> (they've regressed).
>
> It is also not hard to have the watchdog files named
> <mechanism>_watchdog, such as buddy_watchdog, nmi_watchdog,
> arch_watchdog and have the contents be 0 or 1 as appropriate. Such a
> scheme would have less overhead for perf, make the name more intention
> revealing and not alter old perf tools. I'm really not sure what
> problem we're trying to fix by not adopting this approach. I was
> surprised the buddy watchdog merged but using the nmi_watchdog file.

The buddy watchdog was pretty much following the conventions that were
already in the code: that the hardlockup detector (whether backed by
perf or not) was essentially called the "nmi watchdog". There were a
number of people that were involved in reviews and I don't believe
suggesting creating a whole different mechanism for enabling /
disabling the buddy watchdog was never suggested.
-Doug

