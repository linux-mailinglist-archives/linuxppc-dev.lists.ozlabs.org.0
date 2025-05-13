Return-Path: <linuxppc-dev+bounces-8547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D95FAAB5F85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 00:36:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxrtR0RKHz2y2B;
	Wed, 14 May 2025 08:36:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747175790;
	cv=none; b=dQf8ApD79LAjGb1EuyaySz7DoiMs8qzLp83xNhSaG8KervtaBYu46/DRRhe+9j8ITI6XN/Rei/GaBJoFkgRwTwtjeYYmXWer89rIllabUlpObBKwjHuyu0yR5ZNpZXfjaX3C7eDEylHCo6DMySzoMmxVU/Nd3hTv8JwQrCT6hWKX9KMcOqONkpNDrRXQMiRi41upgBPSm+LBcoHwc8Lr46kaAJHqly1aZqKG/mL1emwKPdsL7Q7T3xgatK0BMNRA2G2cL2QGC0yzxV9tCUX/gwY/0DPAIZVNAPD7AFdk0YEwcaWTAq3slPjyyq+OAv0bT/k/dtJwvI8uY+aDO2COtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747175790; c=relaxed/relaxed;
	bh=TIo9PdcOwR30863D/j7oWqsw+0Z2QYx4WZEdgsHvWKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJ3rRNuJujx7Z4fi/EM7avbJJcacwKmwCEAZYrP5WJHrl118Oj8Dx+iL6O1UShYBSCP0WzKc6roLdmcgb8+vQEQ4/op748RFRxT8/+hXoJUhqVlaF9cLh6b6gkMn1OlMG7BSZ/UVUl9HnCxNlHcBtob+4rsM5z3M0AM436ytqOfztN4I3xs3mz4wQXrav78apVhGdVPtEUPIPBRFo9gmQQSaxhXfehMVPfkmm5MqSFhGT5ZFhwAjKHsWBADYVIt+u1zBdWtQbmFK82JDXXIQucqY6SOwzZAe6W6MRZmUPFptbCLME19RxF1St1FUQLCM+lZVVrblNfsXHsisj0a1Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jzZi0NFP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jzZi0NFP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxrtP6zx7z2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 08:36:29 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22e39fbad5fso31455ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747175787; x=1747780587; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIo9PdcOwR30863D/j7oWqsw+0Z2QYx4WZEdgsHvWKI=;
        b=jzZi0NFPZpjq60Z952wVjooCkXMHHEQK83p2avbfCBDXfr5T1dALor2NtHzkqydS8V
         yqFicE12lA1KzW5py+ZpRz1tsCklH6GvqVek7OMl1KAaeYC6rbw9QR9zr0piNwHQzQq0
         QTkL4grgg1Qmf6c++wsI/NrFiyUoV/D+Xx39FZlevTyctqOcg2nvWAw9Rvf7X5cJp9vP
         AjjdWFFdUnAc3esC+iCE3lt3Me5+rxa9aI3UpO5QmvEV7heYXPsApFdyECKp8hua5N10
         y0B1tZ7nVd1x+hPYqcJ43oRfB9mUD1oXlMGHYybgv0mVhl6j/jbLV2aZ/dtNok3HQQge
         etfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747175787; x=1747780587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIo9PdcOwR30863D/j7oWqsw+0Z2QYx4WZEdgsHvWKI=;
        b=kZz62MAYcIlQYP5X4pHWEtXmaYHImjvD0tYWLHE3oNXP1uyDc8dj4XUpM+gLJdrPVY
         LgeIlJArFmq7CbpwEiIPxhZN9yMn3aL9jmD5qKKV2iS2pGS0CiQ3X1KADqRfTwFqnd9G
         mx3CW61bUMn9uABSvjDZ9gI6qvqzMqHaFw+djk/Ar0IQQP+x4U1TEtMcMynUHQIamUlr
         T/pZrMJ97/6FNwFQFAEKfLcci8wo6OdeLDgdL2cnBnm0pemE9Yeip900mG4GbtZOT/A6
         OgxPwYZnJMf4FrzpGIALWzgoFyV8zS4fUYSJG4XE9oUaYsotgT4/O7S9lsvcpMcaw5tK
         tRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA8/qXJsY5pWFw6W0cSHJt9go/ssdlh2Dc/ZXohF+sBjciE8bZhMbMRvovZZGrySN5q5ZTz/bzFlkvr1I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgLLDCujeUtSdsEdgcCAHgE2xA5MxOY4IgyaIV85f7A3FmMKJE
	7VCl3bgqSMZTF4vZr92uTtOhzh4DX0/bhrn1p8sIo9/dDCaTNKlvesoObZndG+SdcbPwER/mtDr
	rzETQGZTCU6KDKg835Z2vrPKkC3sJJAJkgiG8Byhi
X-Gm-Gg: ASbGncufTfYRlusS8MG1CdX+NewbKjfvmCrZIU7vF0SZQPLMGknYsDoQZA8RFR5cY8h
	bqcdYPA0pyqyoRbpATsH0YtkDY1YmtwDdUw3dPHL7dpO5yh8uzgZTCuDPTp3ZDoFT0WP9QWz9mQ
	SkPurH83Q9Wt+C8WXOqJq0KaikdDb7/mgL7w1R0HucVxDwQRPRON2IsVXaKjcO7J2ILbZMRe3g
X-Google-Smtp-Source: AGHT+IGHfOzERkGFQ2IraOYVxiXhrNyz9QOA260/X59T6iym5+2x4qPyvdlodRp7VpBhkN6uzzWDH9NdW080lQ/d0i8=
X-Received: by 2002:a17:902:ced1:b0:22e:570f:e25 with SMTP id
 d9443c01a7336-2319ab21226mr415175ad.13.1747175786548; Tue, 13 May 2025
 15:36:26 -0700 (PDT)
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
 <aCO156Qh5mbeR4Sk@x1> <CAP-5=fXtppSZZc=DxDRkdXgVmqFycaSsji-MVOvFK6go9GY=3A@mail.gmail.com>
In-Reply-To: <CAP-5=fXtppSZZc=DxDRkdXgVmqFycaSsji-MVOvFK6go9GY=3A@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 May 2025 15:36:14 -0700
X-Gm-Features: AX0GCFt4dhOpUp7215ImS5pQARceS2IuUVa4FcPpMMxjoJNamGBEdhFYnj6tTy0
Message-ID: <CAP-5=fXx3sGH=MHUY-qcQ=Y2X2XB5b20+yz9WoOqgbdrwZkqVA@mail.gmail.com>
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

On Tue, May 13, 2025 at 3:12=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Tue, May 13, 2025 at 2:13=E2=80=AFPM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
> >
> > On Fri, May 02, 2025 at 01:14:32PM +0530, Mukesh Kumar Chaurasiya wrote=
:
> > > On Fri, Apr 25, 2025 at 02:46:43PM -0300, Arnaldo Carvalho de Melo wr=
ote:
> > > > Maybe that max() call in perf_cpu_map__intersect() somehow makes th=
e
> > > > compiler happy.
> >
> > > > And in perf_cpu_map__alloc() all calls seems to validate it.
> >
> > > > Like:
> >
> > > > +++ b/tools/lib/perf/cpumap.c
> > > > @@ -411,7 +411,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **o=
rig, struct perf_cpu_map *other)
> > > >         }
> > > >
> > > >         tmp_len =3D __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(=
other);
> > > > -       tmp_cpus =3D malloc(tmp_len * sizeof(struct perf_cpu));
> > > > +       tmp_cpus =3D calloc(tmp_len, sizeof(struct perf_cpu));
> > > >         if (!tmp_cpus)
> > > >                 return -ENOMEM;
> >
> > > > =E2=AC=A2 [acme@toolbx perf-tools-next]$
> >
> > > > And better, do the max size that the compiler is trying to help us
> > > > catch?
> >
> > > Isn't it better to use perf_cpu_map__nr. That should fix this problem=
.
> >
> > Maybe, have you tried it?
> >
> > > One question I have, in perf_cpu_map__nr, the function is returning
> > > 1 in case *cpus is NULL. Is it ok to do that? wouldn't it cause probl=
ems?
> >
> > Indeed this better be documented, as by just looking at:
> >
> > int perf_cpu_map__nr(const struct perf_cpu_map *cpus)
> > {
> >         return cpus ? __perf_cpu_map__nr(cpus) : 1;
> > }
> >
> > It really doesn't make much sense to say that a NULL map has one entry.
> >
> > But the next functions are:
> >
> > bool perf_cpu_map__has_any_cpu_or_is_empty(const struct perf_cpu_map *m=
ap)
> > {
> >         return map ? __perf_cpu_map__cpu(map, 0).cpu =3D=3D -1 : true;
> > }
> >
> > bool perf_cpu_map__is_any_cpu_or_is_empty(const struct perf_cpu_map *ma=
p)
> > {
> >         if (!map)
> >                 return true;
> >
> >         return __perf_cpu_map__nr(map) =3D=3D 1 && __perf_cpu_map__cpu(=
map, 0).cpu =3D=3D -1;
> > }
> >
> > bool perf_cpu_map__is_empty(const struct perf_cpu_map *map)
> > {
> >         return map =3D=3D NULL;
> > }
> >
> > So it seems that a NULL cpu map means "any/all CPU) and a map with just
> > one entry would have as its content "-1" that would mean "any/all CPU".
> >
> > Ian did work on trying to simplify/clarify this, so maybe he can chime
> > in :-)
>
> So I've tried to improve the naming but not vary the implementation
> greatly - initially I was in the code fixing reference count checking
> issues. There is an important distinction between "all" meaning a
> range of CPUs like 0-15 on a 16 core/hyperthread system, and "any"
> meaning the special "-1" value. It is possible to have a perf_cpu_map
> to both be "all" and "any", iterating an empty perf_cpu_map has
> strangely also meant the "any" and so the code isn't specific but
> relies on these odd properties.

I just remembered, there was also a discussion with Adrian IIRC. I
wanted "all" to mean all possible CPUs on a system, and "online" to be
either the same or a subset of that, in case CPUs were offline. There
was a different view that the distinction between "all" and "online"
wasn't useful. So there is some confusion in the code in this regard
and some errors may exist when CPU cores are offline. There's
definitely work to make the API better.

Thanks,
Ian

> Anyway, I'm not sure on the implication of this with
> malloc/calloc/unsigned... It would seem reasonable to me for
> __perf_cpu_map__nr to return an unsigned number and to propagate that
> to fix the new GCC issue.
>
> Thanks,
> Ian
>
>
> > - Arnaldo

