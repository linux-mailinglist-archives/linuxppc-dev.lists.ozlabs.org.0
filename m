Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BD1803F14
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 21:13:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1/8hedUa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkZcg6z06z3cbd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 07:13:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1/8hedUa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkZbs3v5Gz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 07:13:12 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bf09be81bso554e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Dec 2023 12:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701720786; x=1702325586; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9kGZqvqwnAsTmmtCc59WM+PziDt3Qkd7uQA+xA4AAo=;
        b=1/8hedUaNg5UqjXSfc+Nv/ZcmJtnGhyvqiUmwtl72O93zw1LPpiednIxunhirMpDFt
         VFn575clQeVdA3YFDlquR64Wgn9kFnjjLdlipm+SLIv0GTMhYO11kIVMSSZo7qOHNwAn
         n1XObwV6781wsuc7MENkjArcid8omCDUSkBwJt9YCrDvc/MweCtf/Hq4X/Ja4fAP06OL
         TxmKga4A2c7zPMAyvfp802ToKBjvBeqNVlMNx3FNiqNUbzkwfYvPa4mKLpmvF0TXXWam
         kLCW1w49gFdF2hk1dvvCLVY6i2HzXpm5IAYAVHpsT5b5SCxi9mqZPRAF3+OIjWXyJaKy
         gF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701720786; x=1702325586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9kGZqvqwnAsTmmtCc59WM+PziDt3Qkd7uQA+xA4AAo=;
        b=WY486AiddWe51LwkAqoUYml4edwYcuYD7/KX4qc5E0usHEWf8yKhbKoToUrNSj2ZgE
         DzdOrtPregwzLXrwFZpn8kws0EqB1UAlSw/apQK9CQ1mSSWspIfDwK8eAqpCiRlKX2j9
         MT9Y86BpT/Vp++mTHdovHpfpfVRgGTa2iq5xPCR1K5o4T7IU+Vdg+ilCLIMF1+cyzBXR
         nOXkeNmBkctbfazfVFMmI19aCTs4w+HVJRsdAiTp/XYI4XqPJjrxIPOjadu9t+4WpKj3
         GTksrUhEXDjy1AlSNqeo24BAeR5dqdp4eYnybkaAhHPm623JEl1rSRgZv/yuVWI0+FYJ
         kB7Q==
X-Gm-Message-State: AOJu0YySTLppf9c9U3bb4OQQSn5Wbyq00SLaIDqN6UYxPDeMaIfOxAZd
	pvTRSUQHKxEtka3dmQiFjhCOkLrgNVuoPLWVKMEsoA==
X-Google-Smtp-Source: AGHT+IHF8bG8tbqf9FFq+JJHa/Dth4bjMhx7Y0kGbSLDJNQXgYURe7388W7P4mZSqcttbSOuxqa4cWvGazhi7p3o3k8=
X-Received: by 2002:a05:6512:b9f:b0:50b:cdd5:b54a with SMTP id
 b31-20020a0565120b9f00b0050bcdd5b54amr300836lfv.3.1701720785882; Mon, 04 Dec
 2023 12:13:05 -0800 (PST)
MIME-Version: 1.0
References: <20231123160110.94090-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20231123160110.94090-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 4 Dec 2023 12:12:54 -0800
Message-ID: <CAP-5=fWtLHCyZh_6hBkCg16ekOXfwSGAVT9xvgKcUsMcu=Ou9w@mail.gmail.com>
Subject: Re: [PATCH] perf vendor events: Update datasource event name to fix
 duplicate events
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, james.clark@arm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 23, 2023 at 8:01=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Running "perf list" on powerpc fails with segfault
> as below:
>
>    ./perf list
>    Segmentation fault (core dumped)
>
> This happens because of duplicate events in the json list.
> The powerpc Json event list contains some event with same
> event name, but different event code. They are:
> - PM_INST_FROM_L3MISS (Present in datasource and frontend)
> - PM_MRK_DATA_FROM_L2MISS (Present in datasource and marked)
> - PM_MRK_INST_FROM_L3MISS (Present in datasource and marked)
> - PM_MRK_DATA_FROM_L3MISS (Present in datasource and marked)
>
> pmu_events_table__num_events uses the value from
> table_pmu->num_entries which includes duplicate events as
> well. This causes issue during "perf list" and results in
> segmentation fault.
>
> Since both event codes are valid, append _DSRC to the Data
> Source events (datasource.json), so that they would have a
> unique name. Also add PM_DATA_FROM_L2MISS_DSRC and
> PM_DATA_FROM_L3MISS_DSRC events. With the fix, perf list
> works as expected.
>
> Fixes: fc1435807533 ("perf vendor events power10: Update JSON/events")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Given duplicate events creates broken pmu-events.c we should capture
that as an exception in jevents.py. That way a JEVENTS_ARCH=3Dall build
will fail if any vendor/architecture would break in this way. We
should also add JEVENTS_ARCH=3Dall to tools/perf/tests/make. Athira, do
you want to look at doing this?

Thanks,
Ian

> ---
>  .../arch/powerpc/power10/datasource.json       | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json b=
/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> index 6b0356f2d301..0eeaaf1a95b8 100644
> --- a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> @@ -99,6 +99,11 @@
>      "EventName": "PM_INST_FROM_L2MISS",
>      "BriefDescription": "The processor's instruction cache was reloaded =
from a source beyond the local core's L2 due to a demand miss."
>    },
> +  {
> +    "EventCode": "0x0003C0000000C040",
> +    "EventName": "PM_DATA_FROM_L2MISS_DSRC",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from=
 a source beyond the local core's L2 due to a demand miss."
> +  },
>    {
>      "EventCode": "0x000380000010C040",
>      "EventName": "PM_INST_FROM_L2MISS_ALL",
> @@ -161,9 +166,14 @@
>    },
>    {
>      "EventCode": "0x000780000000C040",
> -    "EventName": "PM_INST_FROM_L3MISS",
> +    "EventName": "PM_INST_FROM_L3MISS_DSRC",
>      "BriefDescription": "The processor's instruction cache was reloaded =
from beyond the local core's L3 due to a demand miss."
>    },
> +  {
> +    "EventCode": "0x0007C0000000C040",
> +    "EventName": "PM_DATA_FROM_L3MISS_DSRC",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from=
 beyond the local core's L3 due to a demand miss."
> +  },
>    {
>      "EventCode": "0x000780000010C040",
>      "EventName": "PM_INST_FROM_L3MISS_ALL",
> @@ -981,7 +991,7 @@
>    },
>    {
>      "EventCode": "0x0003C0000000C142",
> -    "EventName": "PM_MRK_DATA_FROM_L2MISS",
> +    "EventName": "PM_MRK_DATA_FROM_L2MISS_DSRC",
>      "BriefDescription": "The processor's L1 data cache was reloaded from=
 a source beyond the local core's L2 due to a demand miss for a marked inst=
ruction."
>    },
>    {
> @@ -1046,12 +1056,12 @@
>    },
>    {
>      "EventCode": "0x000780000000C142",
> -    "EventName": "PM_MRK_INST_FROM_L3MISS",
> +    "EventName": "PM_MRK_INST_FROM_L3MISS_DSRC",
>      "BriefDescription": "The processor's instruction cache was reloaded =
from beyond the local core's L3 due to a demand miss for a marked instructi=
on."
>    },
>    {
>      "EventCode": "0x0007C0000000C142",
> -    "EventName": "PM_MRK_DATA_FROM_L3MISS",
> +    "EventName": "PM_MRK_DATA_FROM_L3MISS_DSRC",
>      "BriefDescription": "The processor's L1 data cache was reloaded from=
 beyond the local core's L3 due to a demand miss for a marked instruction."
>    },
>    {
> --
> 2.39.3
>
