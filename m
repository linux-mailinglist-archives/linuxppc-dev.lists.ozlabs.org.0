Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7181F6C6C97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 16:51:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj8w92m03z3fFM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 02:51:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=M0KLrypF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=M0KLrypF;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj8vC55Z7z3chw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 02:50:46 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3ee6c339cceso59975e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679586639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfdI9P0w7BsEhZbIeZstC1SbyLByst3A6MZbU2P/PdA=;
        b=M0KLrypF9Eqf0Vzzw6TFab+9iQ+Ncl3B1z5cS2TruXPxfCRAnMc0Bsyt6FHXYX487C
         /ZAHiVD9ttbXsMKvR8J8QO8Rlp/b8weR3Sfwy+CkAzHvD5ESJhDusVkFb2Aa9+8jnhrt
         oY70G84O0h76FWyD3sMKsl7+coFfitqmLBdzEXnBXrNmcRoJOuByY6N/nb/29jm/j7et
         wtvFCsH01qVhPpDKApQfrzth8TWB/JdQnrLtlMWHUSLbEexnIoyZXD5ZTNlUT8eeQWbW
         6o6eimueCK1hZDEPHib4b11pg2Uw8U4LgLGoafXcwqHgBrJ16SWu5L+VTVQCfqcSczsD
         FL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679586639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfdI9P0w7BsEhZbIeZstC1SbyLByst3A6MZbU2P/PdA=;
        b=mEKyfS620kEV68N7c6DYEqCXlXg8/p9kf1tWcgCmIr8ZrFmTUyOPGrty5JcGFGWX16
         pW30CBEzEev6HcntnbnBOq1T60cRp9bkWcPGZDupJtKDoGqX3Ucy6YYCX8l3iRx/jid4
         E906hyhJkf8b9R9k61t6qTXs2RVbB3yUbeQgJa8IBsmJuq31UlkbOjPpy3t2fWbZ7JwE
         MjvoMwvDgtY8ugXdSYvIp2REQcAzbP0BqECkdbEpB52ZUV2qLPukYl5hCKlCic+KRWZt
         AbRPyxUQauc+FFeFfVByrE4qfzmXT1u/ycces//mQBpFcZRLkNYE5TmRRbzOMxDpmxep
         e9HQ==
X-Gm-Message-State: AO0yUKWpGZWiW+CWuF9XcAgOjXmvT3Tb0U1LKItpoh6XQe1TNsHJdxWB
	5s9B/pfY52mYwH1BAT54IxJGcVbI2XMskQfoGYYyCw==
X-Google-Smtp-Source: AK7set8lqur84/fe+VYl9U45ksdbEDweEiqlIGbpsmubdP0iQFhECOJZ/No6eWEGme2wt6RUP8SzwqkDovdZBGmGUJQ=
X-Received: by 2002:a05:600c:4fc2:b0:3ee:113f:4fd9 with SMTP id
 o2-20020a05600c4fc200b003ee113f4fd9mr209617wmq.1.1679586639380; Thu, 23 Mar
 2023 08:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <ZBxP77deq7ikTxwG@kernel.org>
In-Reply-To: <ZBxP77deq7ikTxwG@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 23 Mar 2023 08:50:27 -0700
Message-ID: <CAP-5=fX-0giZxATOVXO5PmCD6yfhoGMb4_vMcWAQLnSq=+DMhQ@mail.gmail.com>
Subject: Re: perf tools power9 JSON files build breakage on ubuntu 18.04 cross build
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Heiko Carstens <hca@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 23, 2023 at 6:11=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Exception processing pmu-events/arch/powerpc/power9/other.json
> Traceback (most recent call last):
>   File "pmu-events/jevents.py", line 997, in <module>
>     main()
>   File "pmu-events/jevents.py", line 979, in main
>     ftw(arch_path, [], preprocess_one_file)
>   File "pmu-events/jevents.py", line 935, in ftw
>     ftw(item.path, parents + [item.name], action)
>   File "pmu-events/jevents.py", line 933, in ftw
>     action(parents, item)
>   File "pmu-events/jevents.py", line 514, in preprocess_one_file
>     for event in read_json_events(item.path, topic):
>   File "pmu-events/jevents.py", line 388, in read_json_events
>     events =3D json.load(open(path), object_hook=3DJsonEvent)
>   File "/usr/lib/python3.6/json/__init__.py", line 296, in load
>     return loads(fp.read(),
>   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>     return codecs.ascii_decode(input, self.errors)[0]
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 5509=
0: ordinal not in range(128)
>   CC      /tmp/build/perf/tests/expr.o
> pmu-events/Build:35: recipe for target '/tmp/build/perf/pmu-events/pmu-ev=
ents.c' failed
> make[3]: *** [/tmp/build/perf/pmu-events/pmu-events.c] Error 1
> make[3]: *** Deleting file '/tmp/build/perf/pmu-events/pmu-events.c'
> Makefile.perf:679: recipe for target '/tmp/build/perf/pmu-events/pmu-even=
ts-in.o' failed
> make[2]: *** [/tmp/build/perf/pmu-events/pmu-events-in.o] Error 2
> make[2]: *** Waiting for unfinished jobs....
>
>
> Now jevents is an opt-out feature so I'm noticing these problems.
>
> A similar fix for s390 was accepted today:

The JEVENTS_ARCH=3Dall make option builds the s390 files even on x86.
I'm confused as to why that's been working before these fixes.

Thanks,
Ian

> https://lore.kernel.org/r/20230323122532.2305847-1-tmricht@linux.ibm.com
> https://lore.kernel.org/r/ZBwkl77/I31AQk12@osiris
> --
>
> - Arnaldo
