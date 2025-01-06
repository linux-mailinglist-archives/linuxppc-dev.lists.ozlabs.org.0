Return-Path: <linuxppc-dev+bounces-4728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA580A03154
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 21:24:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRlyW51WKz30WR;
	Tue,  7 Jan 2025 07:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736195059;
	cv=none; b=bBwfZqenkFvbwtqJskLR+2DEmuL9IWFbjds9s0AVQIenvLKds8e+wV0iw+2qi6rcr45or4YTCwtbo5zjcvznXpRSwfOtdtm8Y57+IwnZd60FdWkjffMUo3VamRjBJdceZ2NJYChsIx2rnYjqMbS6HIwmuipyfm/FT/LmtWSsJiwPlCfY1dVLj9C9qjwI3W1SQQrpy/d+CGQ9/XD9VeZqjRlsUp3H/wGebhVXMvaZUs2mhxPUhHiXbG9LSNKfWLzrJAMONGTPr95GLxQoMF5cl06BL5jL7FaKurmnhNL6lZXWVxit8p1haqz78vXwVOh+LNElrJy8OQap5JzNmS+LPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736195059; c=relaxed/relaxed;
	bh=5pK73faD2iUHU43HzvTFZI0Cc/e5Ytr8pBdbyU/Jw7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H63Harol2EyGf9SQ3DxqY+ecuLx9RXGUYQxaFT0JWvWDArErz4omjdv/nJlpMPDA9sq+P5waNIfaEth5tOhuIc7V0Lr0A/59cB/noO1IPzwXrvlZnNRXKf8OQoXnnosYxM8wX+6kSsp5J6MtQcx93mIZ4/wxejTsauAWDq+rlxHWr22ZQzVomZDNOvtSH2udARJ3KssnI/0CFIq0TxdS6ZC7z5YT4wV89KwJBTV74E8jeo8c0o/9h5fDWev1ssFv4FPn27yfEIjkvgfJJSNQ81OtrKVjsIaR4tU2slioOqUH5WakDKLcWmm1mlO7YIvBIcLvmxbZNETKke/iiygPNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SaeJR5H3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SaeJR5H3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRlyS45Srz30WQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 07:24:16 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3a815a5fb60so21485ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 12:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736195054; x=1736799854; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pK73faD2iUHU43HzvTFZI0Cc/e5Ytr8pBdbyU/Jw7w=;
        b=SaeJR5H3ujN/E0z3NmydlFN83yPo3fYopNTpURd08kHL6Ar4SP9y4EzpYJl1ZTRcLV
         4DoNOWQfmuzhu/Y39uTs64MZtJGisgrte3cBDI6reXBgLLMkhHtEzXk2Pj1xkfBqQCqV
         NytgT10o6MEBCVo5G7UQ5BBaEF+wIMyL++j+CUcB4UiISkY2HJdS2aDU8ugGPFPAJMsZ
         tci16IAkZBnpuoBDCZweRaSeEXM5+L01xBvxdbPU69iqdBY9e0TYNSTm6bGDm7pWtwzA
         i8PGNId4UdzpoAUWh6GgRB3W2sYZVAT9efGntklCPM81yhjcsH6UX7QggKVt0ci3kZx6
         S16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736195054; x=1736799854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pK73faD2iUHU43HzvTFZI0Cc/e5Ytr8pBdbyU/Jw7w=;
        b=SWjD/1tDHBw5gsAVGkeef2wE4x0EYyZkNNg1V46j8yMoOvarO+Zoc/qNhPZtDrp6KE
         wRLoJMzsBhciR3cVsQb4Kqni78iRqxf7MCA6QH1q9oQLPZnSpy1XFttgJToyxwNafC7c
         nUmOzV4rhhf4mizufU1hRk8J8Bi0CwiqCVSPUbxxZr2hhSc+lJhyXA63a5jhvt3mpUiy
         vk/Lh0W/R3xLpglSQCU4GAHPsu4dqdApfF18hEE/oY2PH3ZdNBR7WSNxg052wMRrcrSZ
         mDkOulDqgJc9aACnLfwRjjUROTXcK4O4kUls7ORHQuSQNBZDrD0ZsIcTWW+bet7TG/RX
         64Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWv4Tc7cITojP9mD7Ot+ZIetJXFuYXpQmddWliyjFRYSRuZi3Mc/xXjeAwemuIn0iZcu9iBsG90LfbNAfE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMfp/8BVToJ3uX6TCznDD2RLPL29QLGbp8MY6ZMxSxgzqgKDK7
	k/ExL1Wir1jRBqdg0+N8jHApZdOtpnMowEEtTD52JALfDSFCkvfK/ThJD6RnBJi6Er5xkiF8UFt
	7J/eNWoetObxkMNCn9lWaHx674yUrkO/uPM4L
X-Gm-Gg: ASbGncvteUTxJQt0Gz7FfjOpu1/jZ9Goa7wXIMOEmg5ZYbByx0U3FDeqYUPI2hkiJgp
	ky1MMKKPLkGwSq2d4d1JcF8GYN+e0QrYmBY6mhHiTeBsWFovkxuOCI253itd2jMNomAt7
X-Google-Smtp-Source: AGHT+IG/x5R/zua5r2i6YsQhWKKZ2ogrxjvF/cbOiTTSPADkG+pErtfI7/WJKmkrTs/Ppy0SdSu5BFv+/dRQEuollP4=
X-Received: by 2002:a92:d205:0:b0:3a7:6126:ca3 with SMTP id
 e9e14a558f8ab-3ce32459024mr444465ab.24.1736195053560; Mon, 06 Jan 2025
 12:24:13 -0800 (PST)
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
 <3fda227e6ff229b5063d4181ecf75567ca016c18.1736188475.git.christophe.leroy@csgroup.eu>
In-Reply-To: <3fda227e6ff229b5063d4181ecf75567ca016c18.1736188475.git.christophe.leroy@csgroup.eu>
From: Ian Rogers <irogers@google.com>
Date: Mon, 6 Jan 2025 12:24:02 -0800
Message-ID: <CAP-5=fX2mr_N8fqScrb9Sr4b+Y726J9StGn7T3_Qfx36-Q=T5A@mail.gmail.com>
Subject: Re: [PATCH] perf: Fix display of kernel symbols
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 6, 2025 at 11:38=E2=80=AFAM Christophe Leroy
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
> Fix it by really taking the next entry.
>
> Fixes: 659ad3492b91 ("perf maps: Switch from rbtree to lazily sorted arra=
y for addresses")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> ---
>  tools/perf/util/maps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
> index 432399cbe5dd..d39bf27a5fdd 100644
> --- a/tools/perf/util/maps.c
> +++ b/tools/perf/util/maps.c
> @@ -1137,7 +1137,7 @@ struct map *maps__find_next_entry(struct maps *maps=
, struct map *map)
>
>         down_read(maps__lock(maps));
>         i =3D maps__by_address_index(maps, map);
> -       if (i < maps__nr_maps(maps))
> +       if (++i < maps__nr_maps(maps))
>                 result =3D map__get(maps__maps_by_address(maps)[i]);

Thanks for diagnosing this and sorry for the bug! Using the next entry
in this way won't work if the entries aren't sorted. I think the code
needs to be a little more complex, something like:
```
while (1) {
    down_read(maps__lock(maps));
    if (!maps__maps_by_address_sorted(maps)) {
        up_read(maps__lock(maps));
        maps__sort_by_address(maps);
        continue;
    }
    i =3D maps__by_address_index(maps, map) + 1;
    if (i < maps__nr_maps(maps))
        result =3D map__get(maps__maps_by_address(maps)[i]);
    up_read(maps__lock(maps));
    break;
}
```
We could also implement the code similar to maps__by_address_index but
with some kind of best next value in the unsorted case. Given the
function has a single caller then this is probably overkill, but we've
seen performance issues in this code before.

Thanks,
Ian

