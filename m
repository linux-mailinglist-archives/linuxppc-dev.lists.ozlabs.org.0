Return-Path: <linuxppc-dev+bounces-3813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E369E4E00
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 08:10:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3lrt4tskz2yGM;
	Thu,  5 Dec 2024 18:10:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733382606;
	cv=none; b=jLH7bEia0euX4EZJBy18bNIOPiNDA9OGNiPDnH03tp87iKkl1p5Wy/fJ0pbRYXwbbTHE7xeXZmFR+e0+mywxde2pz5T9VI81KUgEDXYglEHDGBn4+D3DnOGFPD3yceblwsBTToNbKWidm72+H6WTiJdtasrBO/CxSeLwLO2P1O4bDpTrx75JYUqwrgW+tMQuCw1G+F7KSMocoAXN7RUpHQy2av9I3m4lLjQYFCwkqzX4CkBVrId/FUXk5Nl3EjWtUg/Eu2p1gFroG1IgaLun6PM4rJc4ZWR5B2CD04/fbgrmktgniXZoIws57AsloH1URmDnM6luQGFNCB9UJc6PNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733382606; c=relaxed/relaxed;
	bh=RPDL9SY/CBHi33tr/kgPHOHPuPtSjT4Zve0V9QYVUns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g82iOqf//SGFT4wf28GRbRab8aMmrpWARVkm6LagpFEm4XH+ZB+Y/eLSlvfdWanFRDDh5GprF9LqRLlaIBsIfKuxusXpdf83jY+fdyWhhXmOG439afJuPPjuaaKm0fjA4FRSpocFEuNAaU16oES6dhZVVNm6GDa1SPzJ81vjHRRSKGQqTNKaE/5yvn2OFfO33Y1c+aI94jrElkpMJWbHJsgJ+gWSbha92qjsdclMaEHibmMq6AAfiBfiKE/NZnw2UOOxdSSBsMEwLVEd+OYE6QjfoVjwdSrs1s+1maA7goJ6cqbYFwTK1e2EkbvqufHi0ZmrkjyzoQ5IaXNF8dE9PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3VpzRvhc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3VpzRvhc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3lrs20Mgz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 18:10:04 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3a77ab3ebfaso86675ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2024 23:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733382602; x=1733987402; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPDL9SY/CBHi33tr/kgPHOHPuPtSjT4Zve0V9QYVUns=;
        b=3VpzRvhcn686g4dlvaurAl7or8cXtKwiRw6Yy6oGNjDuZ7UQDgrmGbFE9zTmiuxKQn
         1pUPEKGtYBXwOEHPtpSh+qZnt3EV7EF1NbcP2XpNx2N1eSJPnz+0mbYEdx7YfuPrTZhW
         jsJDqRfgj2IQqgF+JZd86kxsJrmsRRirx8/w4tP+KWOdqbdCYYEomls9isUZANQGIlDF
         Flm/kyQqEbajHz6wwgTOf+kwN/yXvJehsNOUZqqOvj4Moz/2z1NximI4RiQ4J2VMScZ0
         wrLGgNdcpN/AlzGQ/DJxs/VO/Ewzgikb8k0305DUlzcCttcJavMGM7YZdGFlvfSiqJ1I
         PwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733382602; x=1733987402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPDL9SY/CBHi33tr/kgPHOHPuPtSjT4Zve0V9QYVUns=;
        b=puRI0LYQiRcz0JkLj+IkHPEVf8Bz3NU0ui1TPez+6FX2SVdGdyIgzKr2xxnUKhTk0V
         NMEUBif4+RUPG8QwZF2E62blDZaLKX6CGKtI21Au77+arShg20KojClZw9IkMrEv/l0i
         heLOHMI2q6+EIrfcvuEtX2/wycxSgKfY1k+OeXhLPrE8yrQmtVEETQxIALugBz7oCzaA
         EfLcUetzLch5OaAvCbpHNg5LSSBzHDHA3nD3oOGPeeuNZxKZ/Ja0GGe7HHp/sF5LHtMY
         UL+/fhVnmhKjtx5YCwP71OO8xfCtH6S5eFM9GqSBiOFUq9qpuQE4bbNL3U+uRsEGvToN
         c28g==
X-Forwarded-Encrypted: i=1; AJvYcCVirHn7EJup84B/Gqs2To6wAtDV0fg8+ZffuwpXzni+3kwWzlNnUU5LkQwPENCR+zSroqPO3Y9oOINXj0w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzmd6bWVnGJzMYUqq6qql5XNpY9chCJmT+OLKUGRCdlk/gbCwPl
	udSDVQjDpjRyUSRY09CXo13wcNUqucHN7yNud1BWo8XTP/RHC7eEgjxIX5DeO3CjQKVAdMgAEWK
	CA5t2wh+H91Lsb8EJ6qFV31B8nk9Aw69Gst4X
X-Gm-Gg: ASbGncsOF5AMj30utIMMJ6QuxvgF6dBKjR90rlKJXt18wYNvnCbcC3Rpaq39+qTFnT7
	uF5/qpmb9DaWP4hleX9VAUlvlrpxoD/Oj
X-Google-Smtp-Source: AGHT+IECZqE5fteXnXhm7vixb8m+w0qLbQKrsGI/zvrm/ngsLjVg0yiBWZCYVxgp2gk/sSWgzMEK1Gc+/gr5yc7ZgNU=
X-Received: by 2002:a05:6e02:3710:b0:3a5:e506:162b with SMTP id
 e9e14a558f8ab-3a80933eb2emr1476435ab.11.1733382601610; Wed, 04 Dec 2024
 23:10:01 -0800 (PST)
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
 <CAP-5=fVPw5wJtVR0fxU-7drXg34vNrBsEzurfcLLvC+wFPMAAg@mail.gmail.com>
In-Reply-To: <CAP-5=fVPw5wJtVR0fxU-7drXg34vNrBsEzurfcLLvC+wFPMAAg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Dec 2024 23:09:50 -0800
Message-ID: <CAP-5=fV6s0=X-+8i2+1O_ZKERTL8+S9S-nyZC8rJPNU_nQpbyg@mail.gmail.com>
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

On Wed, Dec 4, 2024 at 10:33=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Wed, Dec 4, 2024 at 9:47=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
> >
> > Hi Ian,
> >
> > On Wed, Dec 04, 2024 at 06:23:05PM -0800, Ian Rogers wrote:
> > > The refactoring of tool PMU events to have a PMU then adding the expr
> > > literals to the tool PMU made it so that the literal system_tsc_freq
> > > was only supported on x86. Update the test expectations to match -
> > > namely the parsing is x86 specific and only yields a non-zero value o=
n
> > > Intel.
> > >
> > > Fixes: 609aa2667f67 ("perf tool_pmu: Switch to standard pmu functions=
 and json descriptions")
> > > Reported-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > > Closes: https://lore.kernel.org/linux-perf-users/20241022140156.98854=
-1-atrajeev@linux.vnet.ibm.com/
> > > Co-developed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > > Signed-off-by: Ian Rogers <irogers@google.com>
> >
> > It failed on my VM.
> >
> >   root@arm64-vm:~/build# ./perf test -v 7
> >   --- start ---
> >   test child forked, pid 2096
> >   Using CPUID 0x00000000000f0510
> >   division by zero
> >   syntax error
> >   Unrecognized literal '#system_tsc_freq'FAILED tests/expr.c:253 #syste=
m_tsc_freq =3D=3D 0
> >   ---- end(-1) ----
> >     7: Simple expression parser                                        =
: FAILED!
>
> I'll need to check this. The test is looking for parsing failures, so
> it's confusing to me expr__parse is returning 0. I was testing on x86
> but disabling the literal in the tool PMU.

Hmm.. perhaps you had a similar issue to me and that b4 silently
failed as git user.email/user.name weren't configured? When I test on
a raspberry pi 5:
```
$ uname -a
Linux raspberrypi 6.6.51+rpt-rpi-2712 #1 SMP PREEMPT Debian
1:6.6.51-1+rpt3 (2024-10-08) aarch64 GNU/Linux
$ git log -1 --oneline
94733a0e50fd (HEAD -> ptn-expr-test) perf test expr: Fix
system_tsc_freq for only x86
$ /tmp/perf/perf test expr -v
Couldn't bump rlimit(MEMLOCK), failures may take place when creating
BPF maps, etc
  7: Simple expression parser                                        : Ok
```

Thanks,
Ian

