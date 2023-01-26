Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7496567D51D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:11:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2r0G2nmQz3fH3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:11:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bqiPNBtP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bqiPNBtP;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2qzH4wtCz3cgx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 06:10:18 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id bk16so2763058wrb.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XZVlCpe2YPL2TN3TFT9AqKB26L5YrQ2SxKcA4F5aIVA=;
        b=bqiPNBtPCGC3Dt5ZQRSVrAtgB5YTmuDiUyV/bySZ3En9FH7ZiSa+3d475afcxorzQL
         BcBlMbWZDlAEDRT8ehVmM0H18jLP84kk0FLIv0Th5HBB0ttBFsp/BuxMDv0O7yaMozMF
         u1EioQKIUN1hAO89sTx5webSx+SGSqK0BjKDDCKwf+LEh2Mt9LZT2Ou2rHrOOliSxMQQ
         8BdQXRmTW/3GxO7FNLYC3jipX4GwYJxCAGpsd/nkLjiI4K5ulSdS9vB+ajB9oebDL2Um
         7//AfPRGk5idWtx1cFt6Rx2JCbX9hZ4je6PhcI3I+7Tzg6wmnKIK8YZAHi+zpsRa8JdP
         qOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZVlCpe2YPL2TN3TFT9AqKB26L5YrQ2SxKcA4F5aIVA=;
        b=VCXHXI1wpvO7K3c/+XxEH8k6U3UcQwyJhySv3SH23QOOTP33sGwje/xAkhgxdEYLjJ
         1MmzCuLQc4UYVRgR9WYcDSdR79c7x0VxhsGVwgU24EbMkIQVfP7jqobZq0dws0iAb66A
         wGhjt2MVjW+sHq1/8uZSCVFkkw9TyHjXDRMcPflp95jkU9p4Wl+mHzAxU8bS3VJlLFOo
         zXhhq7hk3KvGgl64qiNwqKjudx+KmxRqrMCw/TmWqf+t+XbNErlM2WSPeOj8zx5sII2u
         SswTRjt1H0Ygz6XnNJHIXWTmQEb6iMnmziNDyGYYDZdaHevxIvbyAUROQBQVRWYQyIcg
         Z06g==
X-Gm-Message-State: AO0yUKX9/vmstfFRRLkjSRcp26BNcZWNWA7YNlkcwiYrXbAjTRrseMJZ
	rm74AJdxlcVL3a0NaA5EQZk7V1wnbKTZ8cJIKsntpw==
X-Google-Smtp-Source: AK7set/mmUq2VJuJRVgzRa/6Xnzlcx41hw/h5rvmYu2jYOJyL5sIkbF+l18j3dzlNgKOqoIJLVRMJ/NxowqhDSYUYuY=
X-Received: by 2002:a5d:5341:0:b0:2bf:b79f:73f0 with SMTP id
 t1-20020a5d5341000000b002bfb79f73f0mr345146wrv.654.1674760213868; Thu, 26 Jan
 2023 11:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20230126011854.198243-1-irogers@google.com> <20230126011854.198243-3-irogers@google.com>
 <e74b8293-5d30-7522-6e5e-a7c7994039c5@oracle.com>
In-Reply-To: <e74b8293-5d30-7522-6e5e-a7c7994039c5@oracle.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 26 Jan 2023 11:10:01 -0800
Message-ID: <CAP-5=fUrHqAtP-yRDYi4G4oo-PX-2YF8tyB=BBk2t0iM_U3__g@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] perf jevents metric: Add ability to rewrite
 metrics in terms of others
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

On Thu, Jan 26, 2023 at 7:59 AM John Garry <john.g.garry@oracle.com> wrote:
>
> On 26/01/2023 01:18, Ian Rogers wrote:
> > Add RewriteMetricsInTermsOfOthers that iterates over pairs of names
> > and expressions trying to replace an expression, within the current
> > expression, with its name.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> hmmm ... did you test this for many python versions?
>
> Maybe this patch causes this error:
>
> Traceback (most recent call last):
>   File "pmu-events/jevents.py", line 7, in <module>
>     import metric
>   File "/home/john/acme/tools/perf/pmu-events/metric.py", line 549, in
> <module>
>     def RewriteMetricsInTermsOfOthers(metrics: list[Tuple[str, Expression]]
> TypeError: 'type' object is not subscriptable
> make[3]: *** [pmu-events/Build:26: pmu-events/pmu-events.c] Error 1
> make[2]: *** [Makefile.perf:676: pmu-events/pmu-events-in.o] Error 2
> make[2]: *** Waiting for unfinished jobs....
>
> I have python 3.6.15
>
> Thanks,
> John

Apologies, I have to test python3.6 with docker and so if I think the
change is small enough.. My error, will spin v5.

Thanks,
Ian

>
