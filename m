Return-Path: <linuxppc-dev+bounces-8845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0190EABFC64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 19:39:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2dvn3W0Gz30Kg;
	Thu, 22 May 2025 03:39:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747849157;
	cv=none; b=X48fP6YKKbmqT9rlR9SC1wElmlnR9tUBvEqEBonkhk1fflzQ1jBdbQcVsOU5SYcyCfyohuaM8doEC+yrxIHOYsNGhSAl8IutdlUX330fLvvxc0Q9k2FdBHZRhZDYN5Ra2whSLUEb5fxJNKIMBRDQrWJEZdjVxVI4vjJvMyPht0Qu7gmQ/6vd2fqw7DcfUEmKBD3Fn/f8yy60h533HUnaYO3k4bh1k4IyAQ5jw6HG/iN+U436tIYwcOLhYoSlj/gW0cvOwrCyrCbs1kUNuZVjxagLcdhABX1J/Ym9V2OEvhyfBYT1uKEc/l959LMK8EcKbVFhk78O9id1B2yxQhkoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747849157; c=relaxed/relaxed;
	bh=pqVVTcgANAyNaY0Ppr50pnoF48ZHi7cLyBFt3UHbis0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvgSdljDAUXnx7xJYN74sjrUNkJdditqQufPANLmvy/4eB2X1I+ZPeW0FxzjX0RlbfDev46u6FyaHEuHFBbHl+LaCqOg6e5k+H8fP1gAqLfhBJBo6mDExqNKpYcDzV+JzDXFciJSroozO4VSp9V+Gfd96+89Yr0fJjshRbij+LKA1jTYt7XQh1t2Tlcw8+So8JIhSYWB2wGYlDais6uHHTfivym5XCInH5A4debpyX2DLMBpRxY4nUC3TBhb3i2pyRlx+qHkt0X9FwDz3LpbvusARNigMo/gccyfx4VwiuGJ8WWU2vUvSPFDtthBGFxAPS2sgpBm0H6gU1+S59dN+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NagpOl+B; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NagpOl+B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2dvl6fvVz2ygK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 03:39:15 +1000 (AEST)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so938055ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747849153; x=1748453953; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqVVTcgANAyNaY0Ppr50pnoF48ZHi7cLyBFt3UHbis0=;
        b=NagpOl+BAYYwzOUQytTMFDURSqOf+/YgS6syN8ZRZsKBsv8FtWHsj7cOc+PqKlHC5B
         e8t3DXJaLzM1JvyQXMspNwMSfpueXsV0gL70fTuaz1IZjDICg73kZKOXw6JuBt2+3jY4
         zDqy6t1uEy2flAwwl8V3yIlxLfw4SjloCIYyhrghpVh78sCPK6+4bREUvFqM0qtMNgY7
         0QG1TkTEC2uwlBS7XP4yBHm6UJTWbEN75zfqiqSo9c6mSQ/6XwRmYDZ/zrn3PcjkJG6O
         TRRprvg+lNVtbywXNSSMPiXAx/5FFhAeylQwTIkDt0ubxs3LjemGUsIfyzVrogNQe05A
         v6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747849153; x=1748453953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqVVTcgANAyNaY0Ppr50pnoF48ZHi7cLyBFt3UHbis0=;
        b=Ub4ueYGCnQ0q/EKPf24SDGhhzvuzNtlp0MxT0vVY0yJekzvbQ0HTf11T2YB5nqDQ+L
         GqBORH5D7sTU0BrzxLkQQR1zwtEWEkvbLxAVJP15pib5gamA8mpiIttXNtLEetOSMauA
         oUmyEk+ENuCLuqHLP2M3GLtAUmF1cOxTOwWhIHPWjbxdqExk3Gv7o3xWCPGTsj6+nkg+
         zzdkCRFrK5AgeJocGiheA9kC8gtz5iymibTCBKcqnDmMrm9Elq9atN2dXbyM1Y9hMqpY
         wDPz+o3K93PyaATKeMUGYAb36TYRQtz5E0EgQs8fCNrE9n6J1Hx8C2ml/6605NJfY37X
         e0fw==
X-Forwarded-Encrypted: i=1; AJvYcCUhBAM8hIU09o7OmWeLqmnYEiAOLhECnOyPwTyMJbkliBK/wZGD0wTZaIjGB2n8kcG+PgEY6Vq7y9Wl8xM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywllsro7iseUAXv9ePkUNFsfDf9D6DRU80c2qzzhXpBfPCiixG5
	Ot7fjgBDVqAsxtSWGQoNGln25ydYwJyrFz38imDEBHc0aYQER8iRp7o8oHaHNABg+5LNOjWC5h3
	jPMmqbfM4ODwi8wWZfARtz94bFicjkSrj76HJnVeQ
X-Gm-Gg: ASbGncu6W4BSLVT4LQ4nilbBoCCKhYS8HA0m6BfKzoDP1eCBzTsNa2xo0UEZX6oF/8B
	Id3lrUKX7T8sWbwbo79qCfELI7yOI6nGDo1Vax3nVkI5EmTD7wzT5zWI0oDkY79MaomkH53L4DV
	YglDysqO+kJaXKH87PEXNyHYAboDnh/TbhqsY6WTIbmhcJ+ZcpzY/JGGclM1LHFwp6fk3SH7/q
X-Google-Smtp-Source: AGHT+IHawetcghXX9NFpqB2El7GERB4e19tFpZ08tDfTdOyQOXDNGq8QQWdT7JUuayl+jvBSMxLoH+D0Frsv5xlPjp4=
X-Received: by 2002:a92:c610:0:b0:3dc:6151:5903 with SMTP id
 e9e14a558f8ab-3dc6151598bmr11635425ab.10.1747849152558; Wed, 21 May 2025
 10:39:12 -0700 (PDT)
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
 <aCO156Qh5mbeR4Sk@x1> <528d4af0-8e8f-4ab8-a1d0-d0bb937e4f53@linux.ibm.com>
 <CAP-5=fXT0edO0pjO0Ks8vGHgO=iwfuu+Bs5pfccZQhwfSo9mgw@mail.gmail.com> <8dba0ba8-84dd-4a86-96fd-d72de11d40e0@linux.ibm.com>
In-Reply-To: <8dba0ba8-84dd-4a86-96fd-d72de11d40e0@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 21 May 2025 10:39:01 -0700
X-Gm-Features: AX0GCFtUnl_iQ8wT7uBIF4YnzRMvP0awHE3KnyEMzB99tkkYipM1OWGGzbbgGgU
Message-ID: <CAP-5=fXN4q_55Y9P2JkjreFasGh0NmRQ8_t2=GujyPeUJYeHjA@mail.gmail.com>
Subject: Re: [PATCH] tools/lib/perf: Fix -Werror=alloc-size-larger-than in cpumap.c
To: Likhitha Korrapati <likhitha@linux.ibm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	"open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 21, 2025 at 10:28=E2=80=AFAM Likhitha Korrapati
<likhitha@linux.ibm.com> wrote:
>
> Hi Ian,
>
> On 5/21/25 21:15, Ian Rogers wrote:
> > On Wed, May 21, 2025 at 6:03=E2=80=AFAM Likhitha Korrapati
> > <likhitha@linux.ibm.com> wrote:
> >>
> >> Hi Arnaldo,
> >>
> >> On 5/14/25 02:43, Arnaldo Carvalho de Melo wrote:
> >>> On Fri, May 02, 2025 at 01:14:32PM +0530, Mukesh Kumar Chaurasiya wro=
te:
> >>>> On Fri, Apr 25, 2025 at 02:46:43PM -0300, Arnaldo Carvalho de Melo w=
rote:
> >>>>> Maybe that max() call in perf_cpu_map__intersect() somehow makes th=
e
> >>>>> compiler happy.
> >>>
> >>>>> And in perf_cpu_map__alloc() all calls seems to validate it.
> >>>
> >>>>> Like:
> >>>
> >>>>> +++ b/tools/lib/perf/cpumap.c
> >>>>> @@ -411,7 +411,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **o=
rig, struct perf_cpu_map *other)
> >>>>>           }
> >>>>>
> >>>>>           tmp_len =3D __perf_cpu_map__nr(*orig) + __perf_cpu_map__n=
r(other);
> >>>>> -       tmp_cpus =3D malloc(tmp_len * sizeof(struct perf_cpu));
> >>>>> +       tmp_cpus =3D calloc(tmp_len, sizeof(struct perf_cpu));
> >>>>>           if (!tmp_cpus)
> >>>>>                   return -ENOMEM;
> >>>
> >>>>> =E2=AC=A2 [acme@toolbx perf-tools-next]$
> >>>
> >>>>> And better, do the max size that the compiler is trying to help us
> >>>>> catch?
> >>>
> >>>> Isn't it better to use perf_cpu_map__nr. That should fix this proble=
m.
> >>>
> >>> Maybe, have you tried it?
> >>
> >> I have tried this method and it works.
> >>
> >> --- a/tools/lib/perf/cpumap.c
> >> +++ b/tools/lib/perf/cpumap.c
> >> @@ -410,7 +410,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig=
,
> >> struct perf_cpu_map *other)
> >>                   return 0;
> >>           }
> >>
> >> -       tmp_len =3D max(__perf_cpu_map__nr(*orig), __perf_cpu_map__nr(=
other));
> >> +       tmp_len =3D perf_cpu_map__nr(*orig) +  perf_cpu_map__nr(other)=
;
> >>           tmp_cpus =3D malloc(tmp_len * sizeof(struct perf_cpu));
> >>           if (!tmp_cpus)
> >>                   return -ENOMEM;
> >>
> >> I will send a V2 with this change if this looks good.
> >
> > How is this different from the existing code:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git/tree/tools/lib/perf/cpumap.c?h=3Dperf-tools-next#n423
> > ```
> >          tmp_len =3D __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(oth=
er);
> >          tmp_cpus =3D malloc(tmp_len * sizeof(struct perf_cpu));
> >          if (!tmp_cpus)
> >                  return -ENOMEM;
> > ```
> >
> > Thanks,
> > Ian
>
> I gave the wrong diff. Here is the corrected diff.
>
> --- a/tools/lib/perf/cpumap.c
> +++ b/tools/lib/perf/cpumap.c
> @@ -410,7 +410,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig,
> struct perf_cpu_map *other)
>                  return 0;
>          }
>
> -       tmp_len =3D __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other)=
;
> +       tmp_len =3D perf_cpu_map__nr(*orig) + perf_cpu_map__nr(other);
>          tmp_cpus =3D malloc(tmp_len * sizeof(struct perf_cpu));
>          if (!tmp_cpus)
>                  return -ENOMEM;
>
>
> I am using perf_cpu_map__nr instead of __perf_cpu_map__nr.

Ok, why is that a fix? The function declarations are near identical
and perf_cpu_map__nr is implemented in terms of __perf_cpu_map__nr:
```
static int __perf_cpu_map__nr(const struct perf_cpu_map *cpus)
{
        return RC_CHK_ACCESS(cpus)->nr;
}
int perf_cpu_map__nr(const struct perf_cpu_map *cpus)
{
        return cpus ? __perf_cpu_map__nr(cpus) : 1;
}
```
My guess is that being static allows all of the code to be analyzed in
the compilation unit and thereby create the warning/error, your change
is just defeating the analysis. The analysis could easily kick in
again for Link Time Optimization. I'd prefer making these `__nr`
functions return `unsigned int` or size_t over changes like this.

Thanks,
Ian

> Thanks,
> Likhitha.
>
> >
> >> Thanks
> >> Likhitha.
> >>
> >>>
> >>>> One question I have, in perf_cpu_map__nr, the function is returning
> >>>> 1 in case *cpus is NULL. Is it ok to do that? wouldn't it cause prob=
lems?
> >>>
> >>> Indeed this better be documented, as by just looking at:
> >>>
> >>> int perf_cpu_map__nr(const struct perf_cpu_map *cpus)
> >>> {
> >>>           return cpus ? __perf_cpu_map__nr(cpus) : 1;
> >>> }
> >>>
> >>> It really doesn't make much sense to say that a NULL map has one entr=
y.
> >>>
> >>> But the next functions are:
> >>>
> >>> bool perf_cpu_map__has_any_cpu_or_is_empty(const struct perf_cpu_map =
*map)
> >>> {
> >>>           return map ? __perf_cpu_map__cpu(map, 0).cpu =3D=3D -1 : tr=
ue;
> >>> }
> >>>
> >>> bool perf_cpu_map__is_any_cpu_or_is_empty(const struct perf_cpu_map *=
map)
> >>> {
> >>>           if (!map)
> >>>                   return true;
> >>>
> >>>           return __perf_cpu_map__nr(map) =3D=3D 1 && __perf_cpu_map__=
cpu(map, 0).cpu =3D=3D -1;
> >>> }
> >>>
> >>> bool perf_cpu_map__is_empty(const struct perf_cpu_map *map)
> >>> {
> >>>           return map =3D=3D NULL;
> >>> }
> >>>
> >>> So it seems that a NULL cpu map means "any/all CPU) and a map with ju=
st
> >>> one entry would have as its content "-1" that would mean "any/all CPU=
".
> >>>
> >>> Ian did work on trying to simplify/clarify this, so maybe he can chim=
e
> >>> in :-)
> >>>
> >>> - Arnaldo
> >>
> >
>

