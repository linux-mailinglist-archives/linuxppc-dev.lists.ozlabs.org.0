Return-Path: <linuxppc-dev+bounces-8840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8FBABF9CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 17:45:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2bNt0KWsz3c0H;
	Thu, 22 May 2025 01:45:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747842349;
	cv=none; b=WL8zFDyywIDxCiS/GXCMHEq2MZRX1fDC9+e0dJDiWCnbq9TxY09EwJ8VSgeBTCpa84ZS5QZcFEVex8IGcAmX+z+ASQXdhacyKl6y+WpBlFhNxgM24FaUxDrtPzYDR8p5sylNgrR7UXryKAOvc5LNUfz6kVh+cYl2iOTQ5ZnNoRB9Afossy64bn94sUu3WT/5VIRpNZX2fHnpscqwo2s7lHJEWk1kx28kT5rfaI1a60/264g9JimyuLeO3FkSLvHBysXycDlZnXDAWr00DrerErUVDrgHymiQZ0tYUy02f6rZ2P9g7io6zWZ2wZqAaH3jnEgbQPOZWqJK2ZBe8n3d4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747842349; c=relaxed/relaxed;
	bh=z8uzxrSyLMPXgPC5EdFwjFvRKftp4g9crlr7xPugRkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eToWjycufW0WvFYZPKuOcFnqTtvPqdfbx2S/HA9SFqhpLwB+rvph4QABsfOk+2PUgyy/ahuZL2RZCsc7XJD4koq5p1T724+Uh5p3YGwpkAcpB/LhTwW2mAslyS6A8lyhlcq6uxtJwxxFI7ZNj70ATperKmB9Lkx8IBEYlVqTTBkaIpyZ20i1yAmyku0NlAM2UmtIT5UdQgkEwuXVyA3CqhLRJoh3xFcqXS289OsT7eUaAaGcuexWUge29rHvF5HoW/LnEBgwhXrvMR3dTf+bjgB8wtNNIhF/MdHO1K3QK0FBdcsndmf58QnGe0YLhJi4ZUJ9zkBiOuRCMq1n7sxffg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vgZ3hW1B; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vgZ3hW1B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2bNr4CB4z3byl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 01:45:48 +1000 (AEST)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d96836c1c2so987045ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747842346; x=1748447146; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8uzxrSyLMPXgPC5EdFwjFvRKftp4g9crlr7xPugRkA=;
        b=vgZ3hW1BeUOXiNO6Siph9hnJj8ELrCDZyf54trRZ+Q8xlyNuFzcFr6b0I97xMxcoJs
         yxf7+PY7Gsm4X6HblDarAiLjsff3LdmpeBPSw5MIkrbVwan0q3suY07cgess9qZ+LNto
         TVhnFh+P1eQV0PRpqdOHNevoxLG77wNU4t4U7X3ghrbwbxlfAVPM5Jd0ed0Ec1jsSTJp
         kBu0BbRAFPK3zJJgzpqY9Tsw/d0L6exFak5vc2aJ8YufXvsizFLMqoGzHEBgv8Kz1JIi
         wydIv3z2RVRpMVASmD4OgEJ62miN26xlrFw1+YvTXN82d0Rzo4iD9og2c1rE6G3g9Fm7
         mfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842346; x=1748447146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8uzxrSyLMPXgPC5EdFwjFvRKftp4g9crlr7xPugRkA=;
        b=r4GWgBraBjc7kBpi7evtMmk0/JXvJRVNBBkXLMX6fdIPVOvWbyIP4e9OPYlb1xn599
         P4deT8UmzKxx/ieG7LGz9XIU5fAnAxZvPcabvbLrjVqCeo7acfv+ztEkEWDbg4VmLi1M
         wWynSMcFsWDwWNd0HFHlrHwpxj+CP4p+NA57HF0qPGVG7/4Fy+KrhREp8vChsdI6jBci
         /Sz2yPpMCQp6Qb4Jq2IHWs6upksIAHMuyudwro8QXHWcgkIyLVN6SZ85EdiK3/ZmMU6x
         tEYJJkOuvZX+bhL69ktLG6Ysv5hVIAdUM+iFcsej4vNn39BPCLP/HwJMfD05i2LdtUVj
         LSzg==
X-Forwarded-Encrypted: i=1; AJvYcCUwrt8JZf8AZEqiAbjcm0NN6igiWv5LJ1E721N1RYuGDTOjjHsoPb9RRFZHqSMKpSfmx4GpYhE//IrGBko=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywp8wGZ022EitPwEJAXiyX37CAyHM0bq72w937brjJTp7LWpsoE
	7WuWYibSn3ZlvEcJdJ6IyneGMRCIYaDfk/XQ5K2hNR+1q74ugPDRWzkFP4QUTnoJkc9kuaACA2D
	2pjnpZjgnA/1sqHUpjW00C3jLnEVb6V+v9vN7pPOw
X-Gm-Gg: ASbGnct6UlwKpx6pOBv19xj28biv5SYzJez/CStrf6jDlMZ6PifmDSN0nQEeOXjuA/6
	CWIJp33rfTbda1mlW39t578eTt4cABNQugU24t9+2c3ijuikIVjOx4IdTSYeGQTyaFJVCc1YvVq
	v6iJzA0fZ+ePiXlmfZFVT4cesszk77Q1a5r+enilFMzP7+J/R7hnkQtegvpKtisGV14WIlBxsm
X-Google-Smtp-Source: AGHT+IEQbr4EE2e3RyaoVM71bg+PWANkmopwgCjTCxeDF9dNu+YPkvBQIC6TX+vXRXLQ010sFAlDmGllPecJL+6XkCo=
X-Received: by 2002:a05:6e02:1a42:b0:3d9:6cb3:d6d2 with SMTP id
 e9e14a558f8ab-3dc5d591e3cmr15852845ab.4.1747842345674; Wed, 21 May 2025
 08:45:45 -0700 (PDT)
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
In-Reply-To: <528d4af0-8e8f-4ab8-a1d0-d0bb937e4f53@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 21 May 2025 08:45:34 -0700
X-Gm-Features: AX0GCFvZnY5uly84PfYT69clmTRe8UCoTQ_6UjSd2lfiXv1AzDxWlII_-VQPTqU
Message-ID: <CAP-5=fXT0edO0pjO0Ks8vGHgO=iwfuu+Bs5pfccZQhwfSo9mgw@mail.gmail.com>
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

On Wed, May 21, 2025 at 6:03=E2=80=AFAM Likhitha Korrapati
<likhitha@linux.ibm.com> wrote:
>
> Hi Arnaldo,
>
> On 5/14/25 02:43, Arnaldo Carvalho de Melo wrote:
> > On Fri, May 02, 2025 at 01:14:32PM +0530, Mukesh Kumar Chaurasiya wrote=
:
> >> On Fri, Apr 25, 2025 at 02:46:43PM -0300, Arnaldo Carvalho de Melo wro=
te:
> >>> Maybe that max() call in perf_cpu_map__intersect() somehow makes the
> >>> compiler happy.
> >
> >>> And in perf_cpu_map__alloc() all calls seems to validate it.
> >
> >>> Like:
> >
> >>> +++ b/tools/lib/perf/cpumap.c
> >>> @@ -411,7 +411,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **ori=
g, struct perf_cpu_map *other)
> >>>          }
> >>>
> >>>          tmp_len =3D __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(o=
ther);
> >>> -       tmp_cpus =3D malloc(tmp_len * sizeof(struct perf_cpu));
> >>> +       tmp_cpus =3D calloc(tmp_len, sizeof(struct perf_cpu));
> >>>          if (!tmp_cpus)
> >>>                  return -ENOMEM;
> >
> >>> =E2=AC=A2 [acme@toolbx perf-tools-next]$
> >
> >>> And better, do the max size that the compiler is trying to help us
> >>> catch?
> >
> >> Isn't it better to use perf_cpu_map__nr. That should fix this problem.
> >
> > Maybe, have you tried it?
>
> I have tried this method and it works.
>
> --- a/tools/lib/perf/cpumap.c
> +++ b/tools/lib/perf/cpumap.c
> @@ -410,7 +410,7 @@ int perf_cpu_map__merge(struct perf_cpu_map **orig,
> struct perf_cpu_map *other)
>                  return 0;
>          }
>
> -       tmp_len =3D max(__perf_cpu_map__nr(*orig), __perf_cpu_map__nr(oth=
er));
> +       tmp_len =3D perf_cpu_map__nr(*orig) +  perf_cpu_map__nr(other);
>          tmp_cpus =3D malloc(tmp_len * sizeof(struct perf_cpu));
>          if (!tmp_cpus)
>                  return -ENOMEM;
>
> I will send a V2 with this change if this looks good.

How is this different from the existing code:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/lib/perf/cpumap.c?h=3Dperf-tools-next#n423
```
        tmp_len =3D __perf_cpu_map__nr(*orig) + __perf_cpu_map__nr(other);
        tmp_cpus =3D malloc(tmp_len * sizeof(struct perf_cpu));
        if (!tmp_cpus)
                return -ENOMEM;
```

Thanks,
Ian

> Thanks
> Likhitha.
>
> >
> >> One question I have, in perf_cpu_map__nr, the function is returning
> >> 1 in case *cpus is NULL. Is it ok to do that? wouldn't it cause proble=
ms?
> >
> > Indeed this better be documented, as by just looking at:
> >
> > int perf_cpu_map__nr(const struct perf_cpu_map *cpus)
> > {
> >          return cpus ? __perf_cpu_map__nr(cpus) : 1;
> > }
> >
> > It really doesn't make much sense to say that a NULL map has one entry.
> >
> > But the next functions are:
> >
> > bool perf_cpu_map__has_any_cpu_or_is_empty(const struct perf_cpu_map *m=
ap)
> > {
> >          return map ? __perf_cpu_map__cpu(map, 0).cpu =3D=3D -1 : true;
> > }
> >
> > bool perf_cpu_map__is_any_cpu_or_is_empty(const struct perf_cpu_map *ma=
p)
> > {
> >          if (!map)
> >                  return true;
> >
> >          return __perf_cpu_map__nr(map) =3D=3D 1 && __perf_cpu_map__cpu=
(map, 0).cpu =3D=3D -1;
> > }
> >
> > bool perf_cpu_map__is_empty(const struct perf_cpu_map *map)
> > {
> >          return map =3D=3D NULL;
> > }
> >
> > So it seems that a NULL cpu map means "any/all CPU) and a map with just
> > one entry would have as its content "-1" that would mean "any/all CPU".
> >
> > Ian did work on trying to simplify/clarify this, so maybe he can chime
> > in :-)
> >
> > - Arnaldo
>

