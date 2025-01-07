Return-Path: <linuxppc-dev+bounces-4788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1473DA046F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 17:46:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSH4Z2hshz30YT;
	Wed,  8 Jan 2025 03:46:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736268382;
	cv=none; b=koaPGzh1CIzQWskkJuSsWPrWbKScbUUbeW5uY8Y/Wc5G9Dgkk5UGcdPbqhXn7UwXeBJ7GrrCDVNuWWvEOmRU77JZucHVK/PebNMX6DZ9xNeGJWZiixgDdBSs2JXtbMhhD8UE23LbwDIjml3rIPcqeZf8RwtkH3OappNbwFfezR1lKIhTHjmi6xUEWRJBdXkNCfa3ShQAaEUQ6DrdhG8sLAJ1xNIycCI/SY2wnJ3y7g1ZHeghr/v8h4fW6vyXrCMqn7JcQHTv4jl84cH6oHzT9kxzOJIEx1V9thh1zlszsm9oSGomcTgfFbxbCHtIuyozWX07h4XhA7OUkwHGEVeiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736268382; c=relaxed/relaxed;
	bh=RoUuinTnp1TfqZ89odKqiLTAxaKLAJJ7QZ1djcwttHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqLbma68Qq3eU13ZaJ1M0Gz8jU9LqCSdWCAzhPQiMTn7cRg0tvp9cIo5Srqybe6fa/BTQR8+ylDV3OLoTjyw7Fr2G95TKpz/VGjN/rH7tWzIK1IkO57VPt2EVrJIY0nk2fy7REbWzs6xZr8QoUdxOxzdFH9hYBLaKYbfuawBlsGoN5qadEd3pT9yVyaRJv8qXmTV8bZcPUCTKD7ZkfOZA8k4ezBP93dMV4bFS/ULqUcmJoNb8DlHa8a/D+8ykwbDjVKYysLW4+z/StKVPfVRm2o1VE+dszlzkdx6RT/pTo7BDdYuTB0mkJyYE8BbAofIGXyzbfanyn4DyM62syvcxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PbPxiOuh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PbPxiOuh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSH4T6t26z30Wj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 03:46:17 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3a7dfcd40fcso147285ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 08:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736268374; x=1736873174; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoUuinTnp1TfqZ89odKqiLTAxaKLAJJ7QZ1djcwttHM=;
        b=PbPxiOuh/AALLuuXp9iAS1bz81fGXguPFSjjRxYtJKUx6ZJn3Hq9PubGBztHmVs+2i
         q5fKkS095R88gxCz4pFNrQEmzKWPmjzn9s4GkFdE4GZUwuqiS0fFnSYFQ2wFCbJWZOKe
         un0Z/VIvVKopHBu2/CSxONOlbOMrSzsCypEo08o5eCN3FjGr74D6uiLUZmBFLsZX5XTD
         HCrh3UmJeBhC6yllcV96HqRKXqeC9nXlzQkjJBscC6vAGlrFLt+gwpvUVIeraZcZSqFD
         CpUACTjlB1ZiptJD891Ngn6WBFVH19hTflINEcxifMzMPYlekIEcndkKmQQmREB/BwQ3
         LZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268374; x=1736873174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoUuinTnp1TfqZ89odKqiLTAxaKLAJJ7QZ1djcwttHM=;
        b=DivLBgKOzXdr5AbXBqc4vePXUAW5yI9ckF9EV3/RIpeyY43/LoZAh/MOebBFkhVQOd
         tI7Ak47Y2MMQJjSSp3JzRkelU3P0kMubXfUu5R/XQISpa1XUsZciLADHtZKm/YIsfvvg
         N9w2RU164M508zokINoQen/hyliA6nN2D4iaDAxZBqgGzPGvdvYhlL7CP1J/Qp5OTTNF
         sWSXrBZCGOoJfIyAyt0NngBbZvswuUQvHcggdHkAotZ3b3x/6Rcj8ZU1edAg9TuWzapl
         WxkgWLn6+4ig8aAUkUKRtxAwA1DEzN6a4jf31/lp4IbXv8RAd7su5raaYN7RgMgMR3cn
         v4hA==
X-Forwarded-Encrypted: i=1; AJvYcCWdeH8GgF0vjUlbDxzaN05Mq+1suqrPIbjVhZByeT3i9BHAN5LA/w4mvhft8Xs9Lpb+ZhgYdfQYmaoGY/k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy63ZSLY4eBnMFPg8BnC8oFk6XGUH8IGO0TAQRe6scGMghoyXp8
	at5Ii5I1w3wO+TWK4G4w1TPkPRm2cByM87ewGKLHTzKHhPVPja90oKtkPncqiI5iRpEbpJcId9o
	E7rupBaetifAGQ3gedQWJXeKpzWjLtadJfmSY
X-Gm-Gg: ASbGncuY+hSgyS2KGjOmfdCd1eGFgrag9Hznf8WfIGVppuudYrqxemU71TkFPtx17xo
	sxqKDbUXYA5SiQGZHdAXMBfONs4Gz3otFnVOVCsq2EqOgS3sYN4DjNAiOR2s4AiDoWrxNIA==
X-Google-Smtp-Source: AGHT+IGYqdVgN1EdwmgZAtasWmScjV/71wD/8mw0DQ3R4SGAwfv0GvcTdE9fmx/zsZP2KBHTC6eNPVcC2/eTAyJEsKE=
X-Received: by 2002:a05:6e02:1fe8:b0:3a7:dea7:87a6 with SMTP id
 e9e14a558f8ab-3ce333ae611mr3363625ab.29.1736268373922; Tue, 07 Jan 2025
 08:46:13 -0800 (PST)
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
MIME-Version: 1.0
References: <8c8553387ebf904a9e5a93eaf643cb01164d9fb3.1736188471.git.christophe.leroy@csgroup.eu>
 <CAP-5=fWVHaVpJbDf=afn5MhZ972uEq=sGEmsULoD=LRff2Vouw@mail.gmail.com> <fa5dfd6d-3b8d-4086-9604-e5abddd324c9@csgroup.eu>
In-Reply-To: <fa5dfd6d-3b8d-4086-9604-e5abddd324c9@csgroup.eu>
From: Ian Rogers <irogers@google.com>
Date: Tue, 7 Jan 2025 08:46:02 -0800
X-Gm-Features: AbW1kvYoxlBjLdxTV6GwL0H9rcNGGfYrfdbGog2kgceMTlrqNVfpEr6b_qO8KVM
Message-ID: <CAP-5=fU_NCohskhq=rh1wLPxWmSuZcTw-hzwOhBSPBn4cfg4MA@mail.gmail.com>
Subject: Re: [PATCH] libperf: Add back guard on MAX_NR_CPUS
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	Leo Yan <leo.yan@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 7, 2025 at 12:50=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Le 06/01/2025 =C3=A0 21:05, Ian Rogers a =C3=A9crit :
> > On Mon, Jan 6, 2025 at 11:38=E2=80=AFAM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >> Building perf with EXTRA_CFLAGS=3D"-DMAX_NR_CPUS=3D1" fails:
> >>
> >>            CC      /home/chleroy/linux-powerpc/tools/perf/libperf/cpum=
ap.o
> >>          cpumap.c:16: error: "MAX_NR_CPUS" redefined [-Werror]
> >>             16 | #define MAX_NR_CPUS 4096
> >>                |
> >>          <command-line>: note: this is the location of the previous de=
finition
> >>
> >> Commit e8399d34d568 ("libperf cpumap: Hide/reduce scope of MAX_NR_CPUS=
")
> >> moved definition of MAX_NR_CPUS from lib/perf/include/internal/cpumap.=
h
> >> to lib/perf/cpumap.c but the guard surrounding that definition got los=
t
> >> in the move.
> >>
> >> See commit 21b8732eb447 ("perf tools: Allow overriding MAX_NR_CPUS at
> >> compile time") to see why it is needed.
> >>
> >> Note that MAX_NR_CPUS was initialy defined in perf/perf.h and a
> >> redundant definition was added by commit 9c3516d1b850 ("libperf:
> >> Add perf_cpu_map__new()/perf_cpu_map__read() functions").
> >>
> >> A cleaner fix would be to remove that duplicate but for the time
> >> being fix the problem by bringing back the guard for when MAX_NR_CPUS
> >> is already defined.
> >>
> >> Fixes: e8399d34d568 ("libperf cpumap: Hide/reduce scope of MAX_NR_CPUS=
")
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> >
> > Hello,
> >
> > I believe this change might be unnecessary. The only use of
> > MAX_NR_CPUS is in a warning message within perf_cpu_map__new, which
> > takes a string and produces a perf_cpu_map. Other similar functions
> > like cpu_map__new_sysconf don't check MAX_NR_CPUS. Therefore,
> > specifying a -DMAX_NR_CPUS value on the build command line has little
> > effect=E2=80=94it only impacts a warning message for certain kinds of
> > perf_cpu_map creation. It's also unclear what the intended outcome is
> > on the build command line.
> >
> > Given that specifying the value doesn't seem to have a clear purpose,
> > allowing the build to break might be the best option. This would alert
> > the person building perf that they are doing something that doesn't
> > make sense.
> >
>
> Ok so I looked at it once more and indeed it looks like it has changed
> since 2017. See commit 21b8732eb447 ("perf tools: Allow overriding
> MAX_NR_CPUS at compile time") to understand why it was required at that
> time.
>
> Now I don't have much size difference anymore between a build with
> MAX_NR_CPUS=3D1 and the default MAX_NR_CPUS=3D4096:
>
> $ size perf perf-1cpu
>     text           data     bss     dec     hex filename
> 3415908  104164   17148 3537220  35f944 perf
> 3415904  104164   16124 3536192  35f540 perf-1cpu
>
> Apparently that was changed by commit 6a1e2c5c2673 ("perf stat: Remove a
> set of shadow stats static variables")
>
> So I agree with you, it is apparently not worth reducing MAX_NR_CPUS
> anymore, I'll give it a try.

Thanks for figuring this out and the explanation. Fwiw, the shadow
stats should be gone. Perf obviously reads counters, as there may be
counters on multiple CPUs then it aggregates these counts together.
The shadow stats were another aggregation mechanism used for metrics
and being a simple person I managed to land just having the single
aggregation approach although there's some cleanup in this area hiding
as tech debt in perf script. The support was removed around 12 minor
versions ago, iirc.

As a heads up given the interest in binary size, most of perf's binary
size comes from the json events. Off the top of my head I'd say it is
like 70% on x86. We avoid string relocations on those by storing
constant offsets and at some point I'd like to get compression going -
although I'd like to compress across files, something 7-zip's format
at least attempts but there was recent 7-zip security news which may
mean a dependency is a bad thing. Anyway, most of the json events
likely aren't needed by the platform you are building for and I added
some build support for only including the ones you are. As you may not
know your CPU's model name I added a mechanism to use CPUIDs:
https://lore.kernel.org/r/20240904044351.712080-1-irogers@google.com
But perhaps we can use x86-64 version levels to make this a more
automated approach, if we see say a "-march=3Dx86-64-v4" in the CFLAGS -
the idea being that say nehalem doesn't support x86-64-v4 so we can
safely drop the nehalem json data. That said x86-64 version levels
have been described as, "some crazy glibc artifact and is stupid and
needs to die":
https://lore.kernel.org/lkml/CAHk-=3Dwh_b8b1qZF8_obMKpF+xfYnPZ6t38F1+5pK-eX=
NyCdJ7g@mail.gmail.com/
For metrics I have a similar problem, knowing which models support
which events, but to handle that I use the json and see if it has an
event, if not the metric isn't created. This causes issues when new
models rename events. Anyway, those patches haven't landed, here are
the Intel versions:
https://lore.kernel.org/lkml/20240926175035.408668-1-irogers@google.com/

Thanks,
Ian

