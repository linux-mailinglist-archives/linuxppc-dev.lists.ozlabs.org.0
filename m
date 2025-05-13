Return-Path: <linuxppc-dev+bounces-8546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFBBAB5F27
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 00:13:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxrMc5Q8Bz2xgX;
	Wed, 14 May 2025 08:13:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747174396;
	cv=none; b=IA3Bc6BfxLMimlyOMIjty/UYptULkoL8eQwVlsw0GITaGOmFXJpE8YAvyxhNlWUaBK0Q95+vSumOHUcRePWwdo+MFmFr+bTqpqLDwi3JZ/H0Ik9qqVGuQYz76p4xKaKp//Pw5PS3Ba4du1zxtaDlTSmEDe5FeKnFCyiEFqwcTZpxHKswzQPszBhEuDmPqodSlWJgXDGoPs0ikjrB09GSmq1mhxEJ6HHGXR+fntThoEQk1h/XiBXGlpW6h1f4mQRunyVSD3lkSxZ2L1gf79uNT5xM4WFEqRbxB+2gwgWleCkHM2yoq0TdJYGiWfi+q3hdeVMKSMtAFVvPYXAz/3f1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747174396; c=relaxed/relaxed;
	bh=UvfAJHIRWnQ+p9ir6YwP0vx6pRTMTNkEvEBeEPzn4xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=akJFMLbZy4dz6vOM9vnA15Oe7iGAzMj/Vmm1WmZeEMG6N7ckn7tyGc08PLqgrn6MJ7FaSUzwGULcJyj6uBlvdXaSdYDWmY8G4T0HuyFXuSCmDfdmjFVWgdUy92lE3917klCrSKDA9z7YsWxVI+y7QnnO0GfAA3VgaAAFCClULffrNhTbdVSXXR9BT5b0p9axFV34514PyBEZeHNSI1Dwiz4xzHyc+C9gfhT0ouYCqSWsnJYFxZdahkV3FmGPXFTmVywV+k8Zgedo/3Wsiiqu0i643j/IGZ9St815tyBaqoy+BFlRB40slUMuo/qGhmTXRaG7u5BZ/YP9p9ngSL1oFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=azM09cB2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=azM09cB2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxrMZ47L6z2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 08:13:13 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22fa47f295dso21315ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 15:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747174391; x=1747779191; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvfAJHIRWnQ+p9ir6YwP0vx6pRTMTNkEvEBeEPzn4xw=;
        b=azM09cB2t5T5xAx3GhHuSgCvW9Mnig16iLPqUydvqF+bqSOpC5QHg/zpDyxtoXqpaN
         cknQhy8l0VqNbpfQ38mph59POILWMfVUdixPol/+vL9B4/AlHb/rYssdgFu32Qt/GbqW
         giQLl1YSTtWWg4e1bKCCobtypfrFyh68Q3oXIryPbQS5Buq3BeRGAIxwXLngoWQxHH91
         fmzdnEriAL1J2rNrGlR1Huut0nZpYNg2TX+2I2HVOn4l4uPmOHsptqLZxDazNHgi3lIn
         XSUvVITe2T9JDK+G7s0R9RaHHriqeST6Uf+9az7KUTU7o0hNA69B74m8idqcKK7sYvOU
         wgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747174391; x=1747779191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvfAJHIRWnQ+p9ir6YwP0vx6pRTMTNkEvEBeEPzn4xw=;
        b=Qb3skkSnM1QQZYdeTgSSsADWDTfsecndhRJfTzNWiGf5f/opnBL7I62nk9qsuc3x3D
         cfYH3r1yJBw2F6zKbi4Jcm9c2sMlceZOAtukE943Jzr234lgVqx4NlcNnyubJvzoxEOQ
         u/QXwuvaSRl4cWHRLFIU/i/Z4jj5KjwUWevyj4m6QHVWW3ISoobb/t68Ns6EukqxFz6y
         6oSdXZ4fEnp7+eSgtvPySI8iMNxeOU2aPU0ri2teNIHswxiJTH6m9N9aBZ3yDlv3gkEr
         yEFTt/zGIgzfRfgjnH0Up2aW9GPRswJ9LNR85vF3tSeDEA/3kxUqpB7umUj27SzyXUZd
         Thhw==
X-Forwarded-Encrypted: i=1; AJvYcCXa/csJHRXGBAqP6MQ0m1jLKK7U4v+HJPy5PD45BK+PDL48tr2HeeLxuDlKHFFoUPqmTmR0hPunEtI5aL8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywt8XpyzW1LXjOyNElePed0yXnXTzuOION2eFb0taPG1r5XhtmT
	ruDUlzsL5RORPgLhANs0/enVgDn4vY9EajheOJ8i8Sm/zcqxwWH2+jr1/NAQUk//eE5K4AITDQv
	+Ii+6zlexz78HcvA2iG5W/+mMEFnEOxh1nF76XIFR
X-Gm-Gg: ASbGncuSt0unLbw56+x7dlbJimxTeGUVx7bfDDecMHIZS551YyVzhXm5BAXp6lNmyJ5
	fL4zF/cxRZoAbSeiOsyKwdZ+QP3n0LqcV1yGJoUh7sLoLKDHhtW13sGLeWh56JnhnShWsigbQY0
	UHlLEUZE0aPfyfpAC7lAJzM/oDMkfMKeM2r3j81KJj8SjTMm/ZwBNqu2msuRfv
X-Google-Smtp-Source: AGHT+IGK13UC7ns0GMUYJcxFVWFi0VHg+7Om/jbLCrHNV0DH6pq+FfUGmtxXNX7onPvv9ImPoAH2vSu7Mu8WiaNMxZ0=
X-Received: by 2002:a17:903:18d:b0:21b:b3c4:7e0a with SMTP id
 d9443c01a7336-2319ab28443mr387825ad.13.1747174391151; Tue, 13 May 2025
 15:13:11 -0700 (PDT)
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
References: <20250406163412.897313-1-likhitha@linux.ibm.com>
 <E58C5DCA-5F52-4B61-A816-DE932BA40FDA@linux.ibm.com> <baad9d65-07b1-4a19-aea6-5ba5d60da98e@linux.ibm.com>
 <1b1450a8-f091-4091-981d-76b27f61be24@linux.ibm.com> <D1C1E5D6-085A-41D1-85AB-52809C956BFB@linux.ibm.com>
 <aAvKg8K2fyrZ6zy4@x1> <wqewmdha3bx7pmxqwbna26qnl55fcejqsjs4b2zhuciddpb3b5@7ztolpf6erwo>
 <aCO156Qh5mbeR4Sk@x1>
In-Reply-To: <aCO156Qh5mbeR4Sk@x1>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 May 2025 15:12:58 -0700
X-Gm-Features: AX0GCFt2ZXiEO9TuXFPm0bKw1-QAm8lVQ3r6wPOHiSdsHNW8kwJjOrdLgaqNTTY
Message-ID: <CAP-5=fXtppSZZc=DxDRkdXgVmqFycaSsji-MVOvFK6go9GY=3A@mail.gmail.com>
Subject: Re: [PATCH] tools/lib/perf: Fix -Werror=alloc-size-larger-than in cpumap.c
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	"open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>, 
	Likhitha Korrapati <likhitha@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 13, 2025 at 2:13=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Fri, May 02, 2025 at 01:14:32PM +0530, Mukesh Kumar Chaurasiya wrote:
> > On Fri, Apr 25, 2025 at 02:46:43PM -0300, Arnaldo Carvalho de Melo wrot=
e:
> > > Maybe that max() call in perf_cpu_map__intersect() somehow makes the
> > > compiler happy.
>
> > > And in perf_cpu_map__alloc() all calls seems to validate it.
>
> > > Like:
>
> > > +++ b/tools/lib/perf/cpumap.c
> > > @@ -411,7 +411,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **ori=
g, struct perf_cpu_map *other)
> > >         }
> > >
> > >         tmp_len =3D __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(ot=
her);
> > > -       tmp_cpus =3D malloc(tmp_len * sizeof(struct perf_cpu));
> > > +       tmp_cpus =3D calloc(tmp_len, sizeof(struct perf_cpu));
> > >         if (!tmp_cpus)
> > >                 return -ENOMEM;
>
> > > =E2=AC=A2 [acme@toolbx perf-tools-next]$
>
> > > And better, do the max size that the compiler is trying to help us
> > > catch?
>
> > Isn't it better to use perf_cpu_map__nr. That should fix this problem.
>
> Maybe, have you tried it?
>
> > One question I have, in perf_cpu_map__nr, the function is returning
> > 1 in case *cpus is NULL. Is it ok to do that? wouldn't it cause problem=
s?
>
> Indeed this better be documented, as by just looking at:
>
> int perf_cpu_map__nr(const struct perf_cpu_map *cpus)
> {
>         return cpus ? __perf_cpu_map__nr(cpus) : 1;
> }
>
> It really doesn't make much sense to say that a NULL map has one entry.
>
> But the next functions are:
>
> bool perf_cpu_map__has_any_cpu_or_is_empty(const struct perf_cpu_map *map=
)
> {
>         return map ? __perf_cpu_map__cpu(map, 0).cpu =3D=3D -1 : true;
> }
>
> bool perf_cpu_map__is_any_cpu_or_is_empty(const struct perf_cpu_map *map)
> {
>         if (!map)
>                 return true;
>
>         return __perf_cpu_map__nr(map) =3D=3D 1 && __perf_cpu_map__cpu(ma=
p, 0).cpu =3D=3D -1;
> }
>
> bool perf_cpu_map__is_empty(const struct perf_cpu_map *map)
> {
>         return map =3D=3D NULL;
> }
>
> So it seems that a NULL cpu map means "any/all CPU) and a map with just
> one entry would have as its content "-1" that would mean "any/all CPU".
>
> Ian did work on trying to simplify/clarify this, so maybe he can chime
> in :-)

So I've tried to improve the naming but not vary the implementation
greatly - initially I was in the code fixing reference count checking
issues. There is an important distinction between "all" meaning a
range of CPUs like 0-15 on a 16 core/hyperthread system, and "any"
meaning the special "-1" value. It is possible to have a perf_cpu_map
to both be "all" and "any", iterating an empty perf_cpu_map has
strangely also meant the "any" and so the code isn't specific but
relies on these odd properties.

Anyway, I'm not sure on the implication of this with
malloc/calloc/unsigned... It would seem reasonable to me for
__perf_cpu_map__nr to return an unsigned number and to propagate that
to fix the new GCC issue.

Thanks,
Ian


> - Arnaldo

