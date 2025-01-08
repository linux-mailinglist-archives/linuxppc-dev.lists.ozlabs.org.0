Return-Path: <linuxppc-dev+bounces-4861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A14A0631B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 18:15:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSvgV1qWrz30Tw;
	Thu,  9 Jan 2025 04:15:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736356518;
	cv=none; b=gbtBBg5JKWgQRly60b3FNTWiI6EKz9TblDJM6b1I07wgrtsuIGxA0iopKrLAxRCPqe7lSSmjnxy0KGuaHX12aGe8crnl45VtmPidKHZ6+qDGcAQGF/wBvZuWb9EwHJJVKhfrdzFQWShSMb8FJwftqVCIT85swCHhF8eJshNkmiuxth17wdN03+/N4sPTZuhwxWSBedRVQ+6fRjw0iFjTyXBWusn8/AnEZlbKQsnaKx7AXTdbOSQXovGeBhNH6wQmWQeji2setrXMR00p9UFCrGY5qCAdks5szMdvgsYJ7R2smytoG7l/LSUEthiGECmIRW36EzrS7NkvzbRYmpYBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736356518; c=relaxed/relaxed;
	bh=MzeQL7SWoLSVUIhwFJy6hAJPLk/Pb4CjeJOLnjQXvvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LxoE8c495kt0s/WA8Mu+yNU6GCzFyeXVO9n6Wz8rj3lcYrE0sqfnnWA44lWW+MBQPGWol7jUAj5LL+PxNlTm5tp2pBrwhl8qMD2cf9Ts8maTOc9ubJ7TJ2kIg+OF11Z5kevU2Su80wX5R8Gfq2XTWC0sQLNrvdnOKkX6vTStenui+k6e6KrNYfyEXRprFoRKmj1mOoiHKg8tre0D/aHl31zWuHjvVf3NqYwIOWY7hNZXN1RAJQCbIk8NpOjtJeN8gakY/MaFrK9wTg3ilM8f1kX5sP/gcHvuyfy4cQn38YBma12Gdn3Oykk5VJfNA25YELrmzidALjSM3d0R79o1Og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2b/TYO7J; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2b/TYO7J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSvgS3flNz30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 04:15:15 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2163affd184so141355ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2025 09:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736356513; x=1736961313; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzeQL7SWoLSVUIhwFJy6hAJPLk/Pb4CjeJOLnjQXvvU=;
        b=2b/TYO7JRFmGH7DIDjkOneVclexREijbujmvASMpaZNF9E7wCXVS4l+HYM7ujSUvru
         WrB0b1uKQyN1zfozUMkzRpkwh7xBgsRfTVHlXKnzza1D7PRb3FNKn1GsMbTKJvWhHFhq
         HTu8qLVb2T4VNqb2B+3rlaFzpcPkEo+k7dRCunnwG4Uw+E/pmYcD2V1qZor2ZndCJhT+
         hCG8wo+8tqQGOvdiicUsMtsXEp8cxNgcEJBm5U/Y8FRdzYURrzlB7N06DMu7l3Vchtep
         6o1b1OSiefjmIdA5oTko45ztopvypkiCRjzEJBQsn7pjY+cwJ1AKZJkgVB16pLmqYDf4
         loMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736356513; x=1736961313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzeQL7SWoLSVUIhwFJy6hAJPLk/Pb4CjeJOLnjQXvvU=;
        b=pnvT3e0GW3TMCx3c6gZGpAAiUP2EGsORFjMQTiicZ8g04HYF+Bg1p5gBRE998rVd8n
         Z3KLT+9oOrURWMEp1Vp/M6QbP4zqvMHHYmqa0tEUuRQKXqaabIqbDHqWeAkLTDxybQ2g
         q+rXjz/q20ML6YKDtZ6NgQqXbFhMibeGz/HrZoMUReU1P7aYdCW7qaR2mpzT1YyPRoOa
         v4Qon31D4I3kARZd45UL8FmRxGXevpgA/cwlUFbPkdlcM7VtDSU8PWP+jYBxPl6iMUB1
         +tIFscKKIEEtHjZzjxyVV2PN5KVH7IGA78DZa5JP8mhL0sRy5yvSQJb0hM2PcDe+nlwX
         Rgkg==
X-Forwarded-Encrypted: i=1; AJvYcCVDimA/sP+jZQtbjbyRL+JFYtCcfEOp0Vs6IcXUXKmpiKv2dWfbOVzWiyM3u7xdSO76lAkQS4n9TMHRRtk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOc2PbsJVfTHrKHkfPniGdyNmhmpajSt35MAPFrp3IxG0KaJp6
	KMtSdVJrpUx/4WCfR/v0/JCI0BU2mEFlFlZI1zfEQ9lpiftY8FUAaWoKPQidbOrh/8llft/Q5xm
	n5evQR5OwPDLesW3bxTtDfIKcH/ijFsOFCC5L
X-Gm-Gg: ASbGncuAK8L7p0WZxWGdvp/tkW/rrG8r0QElAgd14Nj6G6lMkrpkGOWGZHuP9p1iPnO
	fWzZhOAq6zCDAx1zLIubSifUl9PzjSoz6Rj9qEfsOk+5NZyUxIFQyk/jlIlF7VYxlESNmTw==
X-Google-Smtp-Source: AGHT+IHV2vEIiKkJXNgvzoiZpd1XCj/Pi+js5cCr0y1wseawq73Fx5cJ7suh74eghtNIkWTrTA8T/QAGrw/1Nt4vuQI=
X-Received: by 2002:a17:902:f54a:b0:216:405e:8e2 with SMTP id
 d9443c01a7336-21a85463148mr2168665ad.27.1736356512676; Wed, 08 Jan 2025
 09:15:12 -0800 (PST)
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
References: <2ea4501209d5363bac71a6757fe91c0747558a42.1736329923.git.christophe.leroy@csgroup.eu>
In-Reply-To: <2ea4501209d5363bac71a6757fe91c0747558a42.1736329923.git.christophe.leroy@csgroup.eu>
From: Ian Rogers <irogers@google.com>
Date: Wed, 8 Jan 2025 09:15:00 -0800
X-Gm-Features: AbW1kvbRRMuz4ZomzPJSO4OQ8dFOiTuQmMSN2W1Z3i_Udy0Uz506YYihKwYBq5Q
Message-ID: <CAP-5=fWSRJ=PNTRkHVVpWGSM5R0rLH5Sqgwv_St7+Q3TJaLRWw@mail.gmail.com>
Subject: Re: [PATCH v2] perf: Fix display of kernel symbols
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 8, 2025 at 1:54=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Since commit 659ad3492b91 ("perf maps: Switch from rbtree to lazily
> sorted array for addresses"), perf doesn't display anymore kernel
> symbols on powerpc, allthough it still detects them as kernel addresses.
>
>         # Overhead  Command     Shared Object  Symbol
>         # ........  ..........  ............. ...........................=
...........
>         #
>             80.49%  Coeur main  [unknown]      [k] 0xc005f0f8
>              3.91%  Coeur main  gau            [.] engine_loop.constprop.=
0.isra.0
>              1.72%  Coeur main  [unknown]      [k] 0xc005f11c
>              1.09%  Coeur main  [unknown]      [k] 0xc01f82c8
>              0.44%  Coeur main  libc.so.6      [.] epoll_wait
>              0.38%  Coeur main  [unknown]      [k] 0xc0011718
>              0.36%  Coeur main  [unknown]      [k] 0xc01f45c0
>
> This is because function maps__find_next_entry() now returns current
> entry instead of next entry, leading to kernel map end address
> getting mis-configured with its own start address instead of the
> start address of the following map.
>
> Fix it by really taking the next entry, also make sure that entry
> follows current one by making sure entries are sorted.
>
> Fixes: 659ad3492b91 ("perf maps: Switch from rbtree to lazily sorted arra=
y for addresses")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
> v2: Make sure the entries are sorted, if not sort them.
> ---
>  tools/perf/util/maps.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
> index 432399cbe5dd..09c9cc326c08 100644
> --- a/tools/perf/util/maps.c
> +++ b/tools/perf/util/maps.c
> @@ -1136,8 +1136,13 @@ struct map *maps__find_next_entry(struct maps *map=
s, struct map *map)
>         struct map *result =3D NULL;
>
>         down_read(maps__lock(maps));
> +       while (!maps__maps_by_address_sorted(maps)) {
> +               up_read(maps__lock(maps));
> +               maps__sort_by_address(maps);
> +               down_read(maps__lock(maps));
> +       }
>         i =3D maps__by_address_index(maps, map);
> -       if (i < maps__nr_maps(maps))
> +       if (++i < maps__nr_maps(maps))
>                 result =3D map__get(maps__maps_by_address(maps)[i]);
>
>         up_read(maps__lock(maps));
> --
> 2.47.0
>

