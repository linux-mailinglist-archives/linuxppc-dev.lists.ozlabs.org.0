Return-Path: <linuxppc-dev+bounces-621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CEF961A0F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 00:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtj9V4d9kz2xrk;
	Wed, 28 Aug 2024 08:37:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724772626;
	cv=none; b=Ckf7bRSbLxEsO8xP0sb5OZQsPYC8uDx7O3qutSKA6+fh6Pg3yTs8b70PVy67i8wklwaLseU0nRNgxqWag9UpDPzLcuSNRmddwy6jNBMtut8qSY0/m6rjmzQ4jfMYI+VbF61aEUEAGEsCrUAaUiNmxggvAaSc9S1IUFapK8NxffSPRvTrBKX/cBPPLHAQqww2lJ+lpcguM8aGHrANyOIxBCP/g397U/t6Cd7N04+DYt+76fRLsXthb9aRmomLrvSgyFl5xzQJsXgaqsDTZMJmU1kYFWq9VANdOpxirAfAaswDE5NR410DhTDW2hUmwX/kvCo7DrFU7bBNyiimmPpTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724772626; c=relaxed/relaxed;
	bh=52lDzClgWIfDwjLe7orO5wLRybHMcHJGueg5E+ukdi8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	b=Cj7Mf07fTziNDfdR+Iiknk4AHpwiYSCWWlpnKpbPPX2yyG8iRlkN9F66SGB+JIAkCp8edJ8EIbp7m1TL20Sg8gj7RXpgS7p4aBo9C3of96dd4G/WSbbYq2jB/O285XgZ6meFyaaAv7tBRVeFlqYrcq0GBHkyMI+ehTLAAkVGm0Ay9KjKf1bn5XYTmuRYKkt/VHefnctFnElEMvfGLm2G/LgEBeLI1SUzad27R/C1cNycWMDhCFdMuGVpcJbtt6rF/khG+os1N58V9/BC4PsfcT6d6Tg3figPtqQeSKHehGrvdc+gtB3XK+/8bKYelkN849XhcwUDZDg3hTq2ryOFbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kbZ8h17Y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kbZ8h17Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtWhK4M2Vz2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 01:30:24 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20260346ca1so239285ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 08:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724772622; x=1725377422; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52lDzClgWIfDwjLe7orO5wLRybHMcHJGueg5E+ukdi8=;
        b=kbZ8h17YzFGZ2nXjd823tUT/xgY3WSXLBV2Fd5q36M8egMj7QUyG+K8ijrmN0I2B/D
         lfRzvUoa77tJZRx23hCB1ZrAoDX85VlZRUqCuvhNmVZOUNKHyhzEbJ88oPBg0tNkjQvo
         1Fc+2O3lyk4E9cIxsUOscB1NsDs/YJabE0QccnWIHMTdp7+t+EI8ebkObIEKeZQvz/l5
         /iMUXtqAf6LPKLkK8Dy4ou4nvNMW+h513MCWHuUsP9QGVNzqykWCLyaCpTUjR/GVoOqr
         nI8LS9PiuNNintPa3EWqFiNr/UBJ039VkRJP5cod1hG6bV+7LOeJFE9eWQqrv5bURW7C
         VNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772622; x=1725377422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52lDzClgWIfDwjLe7orO5wLRybHMcHJGueg5E+ukdi8=;
        b=OYkc65fB/7FQ27SZcn/SiB+welTKyQns7hj2J6EowCFREbs1HJQpNFYqh2d1GTECfS
         0PfMqnPWZmAHkLQFJTU4OCGs0kuKE5KcOhBZFzFgtyUttrmJyOXRspp+JpN9WtyQs8kr
         vLlIrDYGDLn/7R3G2abXKx+BCWFBUnhz0jGx+J0XzC6TQtmlGBIEUlrsxKfjOOEDByBs
         c/KDrScOsM4GUTG5E7j/rmvOXniCO65Ueyp+zSN0OQAUmb3DMO+NYgQdrxW90lSaALbT
         zO4SHI+uryAOuzdRsl5BYOubKOwLXYNPwGecDVIKJbUl+DSCnKYmebbymZacVVcO5IRC
         WAxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6zyr/TjgxF//bWpekdLY4+o1TODvZYGIv8yswYNCknM80TxK78FLjYGzgyKP1pDaax1HL0Zeb5LnxjDg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxUr6cggOnhISB3jkBfchXhYfD57w/gHshtMN3dY0qCdP5OkDuY
	RRkI9DcYLXyVWFwgVJH+hzLaN4y8MLCGTRQeEg0X6nZ1cgvQGwXci/7d2MLmUwzLGTJqiylrIOK
	wAghYgMJPr/pkfxj2FCLDSjHnN++buc+dxk2z
X-Google-Smtp-Source: AGHT+IGaDewL8Pg/Wjw0RU5NHRtlyKO6nhTpAU3Lg4rCcydL7fHaObnOyrHHsW4jK9kJ8V5hhAMz5j4P9PyZyYtN7Hc=
X-Received: by 2002:a17:903:247:b0:201:e2db:7be3 with SMTP id
 d9443c01a7336-204e50afb13mr2895225ad.21.1724772621940; Tue, 27 Aug 2024
 08:30:21 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240827053206.538814-1-kjain@linux.ibm.com>
In-Reply-To: <20240827053206.538814-1-kjain@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 Aug 2024 08:30:09 -0700
Message-ID: <CAP-5=fWBjt3pypEwEsbKsuNTqX+ZA7v9WbNJCUgc09xxF=pt1A@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf vendor events power10: Update JSON/events
To: Kajol Jain <kjain@linux.ibm.com>
Cc: acme@kernel.org, namhyung@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, hbathini@linux.ibm.com, 
	disgoel@linux.vnet.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 10:33=E2=80=AFPM Kajol Jain <kjain@linux.ibm.com> w=
rote:
>
> Update JSON/events for power10 platform with additional events.
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

For the series:
Reviewed-by: Ian Rogers <irogers@google.com>

Just to note, the moving of events in patches 2 and 3 is necessary as
the filename sets the "topic" in perf list. I'm not sure the whole
"topic" thing makes total sense and we may want to revisit it at some
date. For example, AMD generally put the topic into the event name,
the PMU gives a strong hint of "topic", etc.

Thanks,
Ian

> ---
>  .../arch/powerpc/power10/datasource.json      | 25 +++++++++++++++++++
>  .../arch/powerpc/power10/frontend.json        | 10 ++++++++
>  .../pmu-events/arch/powerpc/power10/pmc.json  |  5 ++++
>  3 files changed, 40 insertions(+)
>
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json b=
/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> index 0eeaaf1a95b8..283284745d9c 100644
> --- a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> @@ -14,6 +14,31 @@
>      "EventName": "PM_DATA_FROM_MEMORY",
>      "BriefDescription": "The processor's data cache was reloaded from lo=
cal, remote, or distant memory due to a demand miss."
>    },
> +  {
> +    "EventCode": "0x0000004080",
> +    "EventName": "PM_INST_FROM_L1",
> +    "BriefDescription": "An instruction fetch hit in the L1. Each fetch =
group contains 8 instructions. The same line can hit 4 times if 32 sequenti=
al instructions are fetched."
> +  },
> +  {
> +    "EventCode": "0x000000026080",
> +    "EventName": "PM_L2_LD_MISS",
> +    "BriefDescription": "All successful D-Side Load dispatches for this =
thread that missed in the L2. Since the event happens in a 2:1 clock domain=
 and is time-sliced across all 4 threads, the event count should be multipl=
ied by 2."
> +  },
> +  {
> +    "EventCode": "0x000000026880",
> +    "EventName": "PM_L2_ST_MISS",
> +    "BriefDescription": "All successful D-Side Store dispatches for this=
 thread that missed in the L2. Since the event happens in a 2:1 clock domai=
n and is time-sliced across all 4 threads, the event count should be multip=
lied by 2."
> +  },
> +  {
> +    "EventCode": "0x010000046880",
> +    "EventName": "PM_L2_ST_HIT",
> +    "BriefDescription": "All successful D-side store dispatches for this=
 thread that were L2 hits. Since the event happens in a 2:1 clock domain an=
d is time-sliced across all 4 threads, the event count should be multiplied=
 by 2."
> +  },
> +  {
> +    "EventCode": "0x000000036880",
> +    "EventName": "PM_L2_INST_MISS",
> +    "BriefDescription": "All successful instruction (demand and prefetch=
) dispatches for this thread that missed in the L2. Since the event happens=
 in a 2:1 clock domain and is time-sliced across all 4 threads, the event c=
ount should be multiplied by 2."
> +  },
>    {
>      "EventCode": "0x000300000000C040",
>      "EventName": "PM_INST_FROM_L2",
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/t=
ools/perf/pmu-events/arch/powerpc/power10/frontend.json
> index 53660c279286..456971f60814 100644
> --- a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
> @@ -93,5 +93,15 @@
>      "EventCode": "0x400FC",
>      "EventName": "PM_ITLB_MISS",
>      "BriefDescription": "Instruction TLB reload (after a miss), all page=
 sizes. Includes only demand misses."
> +  },
> +  {
> +    "EventCode": "0x00000040B8",
> +    "EventName": "PM_PRED_BR_TKN_COND_DIR",
> +    "BriefDescription": "A conditional branch finished with correctly pr=
edicted direction. Resolved taken."
> +  },
> +  {
> +    "EventCode": "0x00000048B8",
> +    "EventName": "PM_PRED_BR_NTKN_COND_DIR",
> +    "BriefDescription": "A conditional branch finished with correctly pr=
edicted direction. Resolved not taken."
>    }
>  ]
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json b/tools/=
perf/pmu-events/arch/powerpc/power10/pmc.json
> index 0e0253d0e757..04732698d9b2 100644
> --- a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
> @@ -104,6 +104,11 @@
>      "EventName": "PM_RUN_CYC",
>      "BriefDescription": "Processor cycles gated by the run latch."
>    },
> +  {
> +    "EventCode": "0x200F8",
> +    "EventName": "PM_EXT_INT",
> +    "BriefDescription": "Cycles an external interrupt was active."
> +  },
>    {
>      "EventCode": "0x30010",
>      "EventName": "PM_PMC2_OVERFLOW",
> --
> 2.43.5
>

