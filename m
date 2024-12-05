Return-Path: <linuxppc-dev+bounces-3812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A59E4DA3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 07:34:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3l3M3drNz2yGC;
	Thu,  5 Dec 2024 17:34:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733380447;
	cv=none; b=G9PbkslXVEm/fc2khITgSw5foAxeIB3HYrlMgP2L2COLMmHegnsxopX2vi4nK0Kwbz8FhPzj6ABidKQwOMwmQgt23SkWnh49DdWh80Q5FMW9sciz9GrtvWJwAqPxjSczDbEV3GgUjNNWr7Xvmo2/PGya64jhNf+mZndJlFZD/PIDNeyyxg9N01vaukOr7f4jiw3csi7BztU6LJa7PE1rW6Cjb0DLW7wdrYHM8kjnZ5EQWdztxeK7UISgRlTLE5WBnr4ysMMBa8ox0WmjlLt8zJs6Tii4n7icetlswYjqTCFzaHHX5quxhExIABEoPpXM7t0PeaBPZyvuiakpIApl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733380447; c=relaxed/relaxed;
	bh=lZ+PTS/O30h8AWJWzVBtOJLnncwS4BzOGPDsCRKaXKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6fNFBLKotttEqtjkGvrVkI8lEj4aTfg/y9XUrtrX3ojdAz5tyhKjddk9muyC716uxnPMzQK7XIbihFJrLZGUonCHQpTiUbDx32A6/ue4onO9xfoQWdUAYdorsxggARoaTKbj+1KwWSywFMs4prRW7ILuhFleDYv8RDPTOkbphMi4JREbcDt6U6BGnXNXR+lNmr989QgiKz0GXT7bUtbcOXJ+n3j8huEWaXMO0jD3uhgRcO79JpNMdfnEtM31bVGWOFfFyUuN08VRHNe6s0SEFt779i6f9NBMCbDwn1meH60ioaI0XjRXzKz1L2LIR9JGiRWnLWrEXsixYm7jGrlGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=GTTw5Gsq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=GTTw5Gsq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3l3J6538z2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 17:34:03 +1100 (AEDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3a7bc2d7608so62205ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2024 22:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733380441; x=1733985241; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ+PTS/O30h8AWJWzVBtOJLnncwS4BzOGPDsCRKaXKE=;
        b=GTTw5GsqBj5ZGtyv3DCzRoKaBHArsMCeuLNBBzCczqybtsFj3ExNmw6y1P1Dt3cJBl
         q7l09rmIoNECPmI5Ilhc9+/O0JGZvK3fmTl5upyK9/bGjxkecRAhmS1OhTkEDaZdev92
         dzUhPY6igH9ZWnnBr7WXo18sJp+lybria2uXKMhdeImqRPX7+U+sh33dFCHqLb2Rtyzf
         mpG1wFYW3Z+FQqJwCEZmYwGdxGFphlqeWp5ldaX65NAEugNPzi5QXwYhbsS+acxxwO0b
         HWXC/gqpTGi+wEwfd1TXcko4WeZNfXJLWtfoJKUdXVnM2ByrmVDzCdqQaT1/bmx8ME/b
         dMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733380441; x=1733985241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ+PTS/O30h8AWJWzVBtOJLnncwS4BzOGPDsCRKaXKE=;
        b=rSQ3krakSsbgbvy3b8K5WpaewjW8NPd4xIO8vhW3QApLiike5cmhoFbbKMU/v2I5sU
         aXqi7GKH0gtiu/4je1RTklvtOsqkIlEbNxWvGov8CybAJOmGZ+E4ROPXR7ZEvFC7PTO2
         sCYdKdXh/XlE5ElhbqNnEtOfiKzvyo9qPC3DcPr6wRCCzqC/3KJPpJ/MK8bsbDlBIH3u
         iqKBuLhJbYdyLcRizfosZlBoDPiK4LFqLF9DIBI2sg9SX8IO3rggVhLIGOm7W6xJRIVe
         icP4xRjD0k/m9zlcvWiOeLcF05G+OV5dWzvl1Pr3nntkcKgaFFx5ZHEM/wXvo0wo+CGu
         CWOA==
X-Forwarded-Encrypted: i=1; AJvYcCVnTOU1hOBKQC8hfDoPs1RQtZraPv74d4hOf2sSnAawfpzZ/7QReT4/BW2zFnZ4Jj7AHG7WRm4B2YGu+VQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyXc4EcTO6mDmzgRgsGxLH0N+jdhM4WYRHtyogR6VwnptlBibgO
	xAqJmAXQOWl6th1iYPzausmwxL/S+ivYYSTbCvhH036fqHPP3x8Wx0rj1XssNo8QA0svb4Wc9kx
	xINRSOdoodUE1FKZCNkFFvcc2uWeOq04uPE8Q
X-Gm-Gg: ASbGncttH59kdnHJK0F6YDiREahafYFhvCgPrLYLpTgO2COtpERVzSDqFcgjUUVqeGa
	v7f+8jpzOkxZGeIYtnHKalmJANMT9L/NL
X-Google-Smtp-Source: AGHT+IEgHHfxuE1aJp6TLehuMD4UwVg+/zaAmQLSfttijsmXQLGtoBotHEy8B0DJzdNyFucHeZ8dje/BN3+W1K5iZGg=
X-Received: by 2002:a05:6e02:3486:b0:3a0:a459:8eca with SMTP id
 e9e14a558f8ab-3a8083bfa97mr2293065ab.10.1733380440495; Wed, 04 Dec 2024
 22:34:00 -0800 (PST)
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
References: <20241205022305.158202-1-irogers@google.com> <Z1E-WHWSPAezVF4f@google.com>
In-Reply-To: <Z1E-WHWSPAezVF4f@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Dec 2024 22:33:49 -0800
Message-ID: <CAP-5=fVPw5wJtVR0fxU-7drXg34vNrBsEzurfcLLvC+wFPMAAg@mail.gmail.com>
Subject: Re: [PATCH v1] perf test expr: Fix system_tsc_freq for only x86
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	akanksha@linux.ibm.com, maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, 
	kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 4, 2024 at 9:47=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> Hi Ian,
>
> On Wed, Dec 04, 2024 at 06:23:05PM -0800, Ian Rogers wrote:
> > The refactoring of tool PMU events to have a PMU then adding the expr
> > literals to the tool PMU made it so that the literal system_tsc_freq
> > was only supported on x86. Update the test expectations to match -
> > namely the parsing is x86 specific and only yields a non-zero value on
> > Intel.
> >
> > Fixes: 609aa2667f67 ("perf tool_pmu: Switch to standard pmu functions a=
nd json descriptions")
> > Reported-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > Closes: https://lore.kernel.org/linux-perf-users/20241022140156.98854-1=
-atrajeev@linux.vnet.ibm.com/
> > Co-developed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> It failed on my VM.
>
>   root@arm64-vm:~/build# ./perf test -v 7
>   --- start ---
>   test child forked, pid 2096
>   Using CPUID 0x00000000000f0510
>   division by zero
>   syntax error
>   Unrecognized literal '#system_tsc_freq'FAILED tests/expr.c:253 #system_=
tsc_freq =3D=3D 0
>   ---- end(-1) ----
>     7: Simple expression parser                                        : =
FAILED!

I'll need to check this. The test is looking for parsing failures, so
it's confusing to me expr__parse is returning 0. I was testing on x86
but disabling the literal in the tool PMU.

> > ---
> >  tools/perf/tests/expr.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
> > index 41ff1affdfcd..726cf8d4da28 100644
> > --- a/tools/perf/tests/expr.c
> > +++ b/tools/perf/tests/expr.c
> > @@ -75,14 +75,12 @@ static int test__expr(struct test_suite *t __maybe_=
unused, int subtest __maybe_u
> >       double val, num_cpus_online, num_cpus, num_cores, num_dies, num_p=
ackages;
> >       int ret;
> >       struct expr_parse_ctx *ctx;
> > -     bool is_intel =3D false;
> >       char strcmp_cpuid_buf[256];
> >       struct perf_cpu cpu =3D {-1};
> >       char *cpuid =3D get_cpuid_allow_env_override(cpu);
> >       char *escaped_cpuid1, *escaped_cpuid2;
> >
> >       TEST_ASSERT_VAL("get_cpuid", cpuid);
> > -     is_intel =3D strstr(cpuid, "Intel") !=3D NULL;
> >
> >       TEST_ASSERT_EQUAL("ids_union", test_ids_union(), 0);
> >
> > @@ -245,12 +243,19 @@ static int test__expr(struct test_suite *t __mayb=
e_unused, int subtest __maybe_u
> >       if (num_dies) // Some platforms do not have CPU die support, for =
example s390
> >               TEST_ASSERT_VAL("#num_dies >=3D #num_packages", num_dies =
>=3D num_packages);
> >
> > -     TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#syst=
em_tsc_freq") =3D=3D 0);
> > -     if (is_intel)
> > -             TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
> > -     else
> > -             TEST_ASSERT_VAL("#system_tsc_freq =3D=3D 0", fpclassify(v=
al) =3D=3D FP_ZERO);
> >
> > +     if (expr__parse(&val, ctx, "#system_tsc_freq") =3D=3D 0) {
> > +             bool is_intel =3D strstr(cpuid, "Intel") !=3D NULL;
> > +
> > +             if (is_intel)
> > +                     TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
>
> Also Sasha reported that some (Intel?) guest machine doesn't have TSC
> frequency.

I think, unfortunately, this is working as intended. Intel metrics use
#system_tsc_freq in metrics for most models:
```
$ grep -ril system_tsc_freq tools/perf/pmu-events/arch/x86/
tools/perf/pmu-events/arch/x86/emeraldrapids/emr-metrics.json
tools/perf/pmu-events/arch/x86/broadwellx/bdx-metrics.json
tools/perf/pmu-events/arch/x86/haswellx/hsx-metrics.json
tools/perf/pmu-events/arch/x86/grandridge/grr-metrics.json
tools/perf/pmu-events/arch/x86/icelakex/icx-metrics.json
tools/perf/pmu-events/arch/x86/sierraforest/srf-metrics.json
tools/perf/pmu-events/arch/x86/skylakex/skx-metrics.json
tools/perf/pmu-events/arch/x86/cascadelakex/clx-metrics.json
tools/perf/pmu-events/arch/x86/sapphirerapids/spr-metrics.json
```
The code to generate the TSC frequency uses the CPUID leaf
information, but this can be disabled by the host operating system for
guest operating systems. The fallback logic using `/proc/cpuinfo` is
intended for older models and it appears the more recent formatting
won't be parse-able by perf. The host has also likely disabled the
information if the CPUID leaf is hidden. So the test is correctly
failing because metrics using #system_tsc_freq would be broken inside
the guest OS. Kan was involved in the conversation when the literal
was added and this was the best we could do.

Thanks,
Ian

> > +             else
> > +                     TEST_ASSERT_VAL("#system_tsc_freq =3D=3D 0", fpcl=
assify(val) =3D=3D FP_ZERO);
> > +     } else {
> > +#if defined(__i386__) || defined(__x86_64__)
> > +             TEST_ASSERT_VAL("#system_tsc_freq unsupported", 0);
> > +#endif
> > +     }
> >       /*
> >        * Source count returns the number of events aggregating in a lea=
der
> >        * event including the leader. Check parsing yields an id.
> > --
> > 2.47.0.338.g60cca15819-goog
> >

