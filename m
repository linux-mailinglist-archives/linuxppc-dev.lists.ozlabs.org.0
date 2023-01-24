Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA18678F8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 05:50:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1F0F4cvCz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 15:50:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TwUkV4fD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TwUkV4fD;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1Dz728Zvz3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 15:49:39 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id d2so12688723wrp.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 20:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DK6xaXE5oASyoDQtrld9FdvxBPYhIcRWULm9bEl36oc=;
        b=TwUkV4fDTn80NzdblDeqyIin7jJkGsyJZv9xSAjsM0BiUikLoxf1xGH8bY9R2rjHPk
         a4+Z3X4imr2ZpgYOMcxQWc0tsIhOYrT/y9aPK2Kzln2qjuB7zdGgCJMZQVTAbp00F+5V
         cAUDa1iXdcq13wWfbGtPGluLFs0fxCsTkvDpqJsYQAOD+zLvQZifMxj9JAKYIDbYetGC
         v4mKhvfMnTL3WsdDqv0tvPZyF9ePAUTW567psXo1g2Sk/ZyGTbaxsNA+GQoTzB+fmZgj
         vZPjxPitfgtSYrthW9g4vF67tPEG+JQdG6XsutwsBFSgKY9U+L5ACvzJLIZ9GYkh4Rss
         LU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DK6xaXE5oASyoDQtrld9FdvxBPYhIcRWULm9bEl36oc=;
        b=FdbUbzd3xnQifLa/lZfOkKQ3QRdaFvXqg/TDlWL2hLWUPAm43k2VVdrNfn/TmTVdT8
         g0mfqzlDtRxXFp0Uhcbls7P7zRvtHOf70sa4bmKicv0hdDYMEcTQTSjSUuvP52sbllRl
         TIa9iqiahcCQ2fjmG7kAaONCfBlZWdeEcRQ1fyOC2XJhGT93N2jqFobZ+m5zGbCkv3e+
         1kIZDW0mwxoQEaiNKyHBrjwMyvrASoyCT1+IPNFv0Y0btqHg2Qn+wC6p77xi/IFqAvgM
         80cJMwOReAFg/HJPlwl8qUU6fF9gTWGrbV/3kUY8nPXnR+bZhpvbAGd0xOOGFOEmOGG7
         fA7g==
X-Gm-Message-State: AFqh2kpOS1pLzr37q+rAN1LiVyYXWT/KxqPJaPT4dINKCj6CLnH7YELY
	yHxy6cOZEBQ+u3ag+5R8fjJqSopwzV0eDeHlfkTSAQ==
X-Google-Smtp-Source: AMrXdXunWqevhFj8/tiwX31/k0NTL79Bsn3aXdolVljl3gNlXwKl2/xgYzhiUMRWVNro/K9uQqDGitK/0NB1Ie/+DpM=
X-Received: by 2002:a05:6000:1d9b:b0:2bc:aa47:bf7a with SMTP id
 bk27-20020a0560001d9b00b002bcaa47bf7amr674533wrb.343.1674535775796; Mon, 23
 Jan 2023 20:49:35 -0800 (PST)
MIME-Version: 1.0
References: <20221221223420.2157113-1-irogers@google.com> <20221221223420.2157113-9-irogers@google.com>
 <f5d0e9f0-7076-07f5-483b-57eaee26ff3f@oracle.com>
In-Reply-To: <f5d0e9f0-7076-07f5-483b-57eaee26ff3f@oracle.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Jan 2023 20:49:23 -0800
Message-ID: <CAP-5=fUmvgL77itaxQo15ptUo78s8yW39=rwq80ESsqVm5bG1A@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] perf jevents: Generate metrics and events as
 separate tables
To: John Garry <john.g.garry@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kang Minchul <tegongkang@gmail.com>, Sandipan Das <sandipan.das@amd.com>, Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, linux-arm-kernel@lists.infradead.org, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fischer <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Leo Yan 
 <leo.yan@linaro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 7:18 AM John Garry <john.g.garry@oracle.com> wrote:
>
> On 21/12/2022 22:34, Ian Rogers wrote:
> > Turn a perf json event into an event, metric or both. This reduces the
> > number of events needed to scan to find an event or metric. As events
> > no longer need the relatively seldom used metric fields, 4 bytes is
> > saved per event. This reduces the big C string's size by 335kb (14.8%)
> > on x86.
> >
> > Signed-off-by: Ian Rogers<irogers@google.com>
>
> It would have been good to show an example of how the output changes. I
> could not apply the series (see cover), and knowing what to expect makes
> reviewing the code easier...
>
> Thanks,
> John

Thanks, will add in v3.

Ian
