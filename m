Return-Path: <linuxppc-dev+bounces-4726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5612A0311C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 21:06:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRlYX5cVqz30WB;
	Tue,  7 Jan 2025 07:06:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736193968;
	cv=none; b=cmRGSoTbf/OuVvHau+DlernyukzoAxLusNDQAXd+8vQM10Wjj7zUBrtagkgtPEGqtZBZ8KbqeI2zwuWiHIujX2AVHPJPzQ01QXx9zIwFGUw3xQ063XizpSUeQhe0JqRXpEY9I+LhGuSvXiUKM/SiGoWnaes45urebjIge362EG6aSxqczOXIUbo1n5c12RKaBj5JU6NT9/9eIqcW4C1vKy4SppcddBcOBAtFiUPwyap4W764ikNN2NN05j5PZByNszBrY3V7JKa0kWJaa2llfLY82rJguMvUjzgQQATvHPGbFmyMTapnYdfnt4o3pLYbOKXb3KvjSJ4LUGnRnjCWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736193968; c=relaxed/relaxed;
	bh=89rhBgQRnXcKMVrwWMHxN9A0BmutKC2XU/2aaVYlH08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hADSisLAqgFIdc3GcOyZNRF5saYyNMT5Xmz3g7sRJvo6MvizmZ67DryTJ9QBy8WCZKcOQpYvDiZXsful8jCzwDriWRkMwHBRZ8WEypjrqToApOhG2ujwhhyddrSaDmekh9hODz8ZI5N7pJSZnNPxUjX6VeCTz5TMF6Mf3i9TEutaJcBW+qQzgUVCUbZ8Q1RNyvbfFoAqr75Uvzy6lCmIqyGSv/hNNb2Z14tkjrTtAhL6oKDpXEfXHHCbXASLi0+2hzSki8Z35TKkMNOqUFq9DcYFpzKYs20t4OzZgcmUGYTHdZzAQflmNUaVMhur62HsgBTVvYJGb3msCudiJpmr6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=A+53lAL8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=A+53lAL8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRlYW0NyZz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 07:06:06 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a9d0c28589so17005ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 12:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736193963; x=1736798763; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89rhBgQRnXcKMVrwWMHxN9A0BmutKC2XU/2aaVYlH08=;
        b=A+53lAL8fN+LzFm6G07aRvA05sD6R6tQVAI8WOBq5TltfF/V1rkwMgs0VkysuMyYc0
         YfQcUkmRm/c4HuXI9Wsh9HOLaXYBmQa7dLTMG4SWXnD6VoH2j8cAzIIik16KDGgK5mSF
         E4UikwkGrv/Ufu3W327w12Pb6RO2IGRVzQqSSnKdZcOU6yYc7NJB5OX5BkNgvnMbOlns
         fRh2TSu/aR7nlPAaNUSrZWY41Hm2mFRdoBq4MCIN4ZLB+mgxhBaDdHqJnj9Bi4SyNbXg
         6jEJhYqO5xfZjCefQxV8BijuLMgVu2LJGljroBJd3zQxDptwGXxzdZU9w0l10LTrfRmV
         PNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193963; x=1736798763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89rhBgQRnXcKMVrwWMHxN9A0BmutKC2XU/2aaVYlH08=;
        b=CKhBOq/UjpQQupIfXTb6il6g8nR3VEQxgnqXSnlSkYuU9Zjdh5Sc2b6tF9dsbUg9o6
         b8s7TSml0r7G0p6cOGD9dBMScyjSdS3xic/0osajlm0cMIxUi0/xbo1F4e3kW0dN6m40
         mqLslozIGklV/QzYTmCPcFJGqmUg1ELa5CYl3zUt/YQNLFNyh+C3e7yHdUkb20fIsZCq
         4gOJW29vfag+aWfDVCgEShBCwi2TtM8sKgVlnHabvpeCVD0NghH8zS+/u/BCVz54fal2
         IRcWWmcdCJef0KrwbxxkMEsQvzezIaFvgx+a4kOy3zViimdFWrV2x57JqP72hplQGCcP
         s+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCW70e+bsCkzXi98973xTSLvb+dtit+9SzEcuBj7zSLN77CeCAI8+4/njWnbrhuk8+pusfE949mmcY/vmfc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw5SOioDm3sHH600kOm6SoXGZvGThIA8U6IC0khlFpbeIN8C0NN
	B7dgCEyiLqkbDFVsPqg2qhIIZmHw3uFgtYHSnWo9xgdDkqv9OX1b0YX8fI1g8v6OH121ufpvsoi
	WZKih7oJ6bxDSiiSW5HgCe6OGhNfo1SpLoLNJ
X-Gm-Gg: ASbGncvGB3bs7zvN1y7vspeNA3kjABeU1+r+SFcA1/OxFz6eWsVUIt+8QAYcXwbr31+
	goe2Ogsm/skwMHB051zHQytv5CiedLDZbGELNeINJIG6YAYAoDfYs6TMGIu+3eglZolYw
X-Google-Smtp-Source: AGHT+IGLsDBrotQ8nYPvuMsyL75xnUrfiLQrTOomCApfYA934d/pM85xLj/qkn+OogjKmro8tOx+xHZtdXaJ9M7nvYE=
X-Received: by 2002:a92:cac9:0:b0:3a7:91c2:c28d with SMTP id
 e9e14a558f8ab-3ce32470286mr383485ab.28.1736193962916; Mon, 06 Jan 2025
 12:06:02 -0800 (PST)
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
In-Reply-To: <8c8553387ebf904a9e5a93eaf643cb01164d9fb3.1736188471.git.christophe.leroy@csgroup.eu>
From: Ian Rogers <irogers@google.com>
Date: Mon, 6 Jan 2025 12:05:51 -0800
Message-ID: <CAP-5=fWVHaVpJbDf=afn5MhZ972uEq=sGEmsULoD=LRff2Vouw@mail.gmail.com>
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

On Mon, Jan 6, 2025 at 11:38=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Building perf with EXTRA_CFLAGS=3D"-DMAX_NR_CPUS=3D1" fails:
>
>           CC      /home/chleroy/linux-powerpc/tools/perf/libperf/cpumap.o
>         cpumap.c:16: error: "MAX_NR_CPUS" redefined [-Werror]
>            16 | #define MAX_NR_CPUS 4096
>               |
>         <command-line>: note: this is the location of the previous defini=
tion
>
> Commit e8399d34d568 ("libperf cpumap: Hide/reduce scope of MAX_NR_CPUS")
> moved definition of MAX_NR_CPUS from lib/perf/include/internal/cpumap.h
> to lib/perf/cpumap.c but the guard surrounding that definition got lost
> in the move.
>
> See commit 21b8732eb447 ("perf tools: Allow overriding MAX_NR_CPUS at
> compile time") to see why it is needed.
>
> Note that MAX_NR_CPUS was initialy defined in perf/perf.h and a
> redundant definition was added by commit 9c3516d1b850 ("libperf:
> Add perf_cpu_map__new()/perf_cpu_map__read() functions").
>
> A cleaner fix would be to remove that duplicate but for the time
> being fix the problem by bringing back the guard for when MAX_NR_CPUS
> is already defined.
>
> Fixes: e8399d34d568 ("libperf cpumap: Hide/reduce scope of MAX_NR_CPUS")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Hello,

I believe this change might be unnecessary. The only use of
MAX_NR_CPUS is in a warning message within perf_cpu_map__new, which
takes a string and produces a perf_cpu_map. Other similar functions
like cpu_map__new_sysconf don't check MAX_NR_CPUS. Therefore,
specifying a -DMAX_NR_CPUS value on the build command line has little
effect=E2=80=94it only impacts a warning message for certain kinds of
perf_cpu_map creation. It's also unclear what the intended outcome is
on the build command line.

Given that specifying the value doesn't seem to have a clear purpose,
allowing the build to break might be the best option. This would alert
the person building perf that they are doing something that doesn't
make sense.

Thanks,
Ian

