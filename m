Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ECB93A41A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 18:03:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=aghnbxHm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WT24N2N2Sz3dFy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 02:03:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=aghnbxHm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WT23h2XHfz3cVq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 02:02:39 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fd643d7580so145675ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721750555; x=1722355355; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MaDuSwLVClsstDweDtfH5dIJYrmnq1xTWK+6H4ZsGw=;
        b=aghnbxHmlPeVHVsZA2MBwHcrxodpCZk5Vkip6wsIGq3xXngqkPkUBY+wDR+wRs+xjr
         zuwKk6GVwu7SPkP+3rkVAza3fKr1p+wLwL2grQcRLFeji8mK2nr6B9LcsdRZndPkzrva
         qMUKy04zHC+YgUrzXlFcbzd3MDswNk/eK0BzPMMUu0o5BIcwr3FqJVxWybCf4d3wHZgS
         bE7duyWl8tFB5fjKbtQIyPxA1oCCL8Yf0GeZQSTBHz9ftX0l02YSD9jpoVr9QeH6Rc43
         ysQOgZmm0U7kOCKQ8jzjUDRfptvWeXltlPSR7wMcyuVvVQRdmLd0AD9QHQnhAtF1qc1h
         qLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721750555; x=1722355355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MaDuSwLVClsstDweDtfH5dIJYrmnq1xTWK+6H4ZsGw=;
        b=HhgTvcqTaiNhAtC6QSUYXiDZ8hlbOeKHlx9twcr0ngVsKFdesoUHTnMSqQdPm66g/P
         0QEVy0wwgJT9jXH/iiDnTtr08jGrC16dHUKm7JayNr23iVnBwBdMpgamuxOrNoUbHhTe
         pJ0yKj5TEbvt2B9vmUp4q6aZxj3TYwxOknJuk3GqdYGUtybnhp6gEz4b34GpzeBhNBUF
         4BV+2DcQx75qiiAeXZRRt9Y7FZXBUx4cUq4lWdv+CHFuxt6xK/jdoOv8wtKMzY1rbYXr
         gGNELD2kHdyuqM8Ajk/K7rwg9ouNNuXmzBfLlSY6+yCsH6QFu5qsWjpzzcZ9/i/iSeh8
         H+sg==
X-Forwarded-Encrypted: i=1; AJvYcCXm2YxciQUnlRYpfDZpijfbEgV6gtOCNsduDcX6D8xj52fI4ZjQHyccF0fPcxscmGsy1FPki7BUL16bnEQsHmSmumbxUhFY5ZWjhHvd7Q==
X-Gm-Message-State: AOJu0YxPNSNEC05DrnGLI2sGf2icAW1Oca1O7ZeUjrMaJnacKwDfTiQ6
	Cww2MTpYWfQnWY3qtP7KwAnueZJiJJAFdmbcyOZ/tE/0zZ+2HSRqBninpdZlfGUg6/u3P0aSoqf
	14PK5KVyfoxko+95Mp+QEb10xd1AEkfLdg9rB
X-Google-Smtp-Source: AGHT+IGf7KJM/k06ZSJN/y8P+9fHve4GXpgNKiEQVF7y6nM8XKFbSIx0KCAKVzg9lXA7fDrRhxM6IYM6AJM7xc8QAUo=
X-Received: by 2002:a17:902:da8c:b0:1fc:72f5:43c0 with SMTP id
 d9443c01a7336-1fd7a2087b6mr8320585ad.24.1721750554676; Tue, 23 Jul 2024
 09:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240723052154.96202-1-kjain@linux.ibm.com>
In-Reply-To: <20240723052154.96202-1-kjain@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 23 Jul 2024 09:02:23 -0700
Message-ID: <CAP-5=fWsQbA-h=_Y_q7z1E7GjCkHE3w-9h-OXu4jLBM3Fag6ag@mail.gmail.com>
Subject: Re: [PATCH] perf vendor events power10: Update JSON/events
To: Kajol Jain <kjain@linux.ibm.com>
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
Cc: maddy@linux.ibm.com, linux-kernel@vger.kernel.org, acme@kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2024 at 10:27=E2=80=AFPM Kajol Jain <kjain@linux.ibm.com> w=
rote:
>
> Update JSON/events for power10 platform with additional events.
> Also move PM_VECTOR_LD_CMPL event from others.json to
> frontend.json file.
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Reviewed-by: Ian Rogers <irogers@google.com>

> ---
>  .../arch/powerpc/power10/frontend.json        |   5 +
>  .../arch/powerpc/power10/others.json          | 100 +++++++++++++++++-
>  2 files changed, 100 insertions(+), 5 deletions(-)
>
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/t=
ools/perf/pmu-events/arch/powerpc/power10/frontend.json
> index 5977f5e64212..53660c279286 100644
> --- a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
> @@ -74,6 +74,11 @@
>      "EventName": "PM_ISSUE_KILL",
>      "BriefDescription": "Cycles in which an instruction or group of inst=
ructions were cancelled after being issued. This event increments once per =
occurrence, regardless of how many instructions are included in the issue g=
roup."
>    },
> +  {
> +    "EventCode": "0x44054",
> +    "EventName": "PM_VECTOR_LD_CMPL",
> +    "BriefDescription": "Vector load instruction completed."
> +  },
>    {
>      "EventCode": "0x44056",
>      "EventName": "PM_VECTOR_ST_CMPL",
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/too=
ls/perf/pmu-events/arch/powerpc/power10/others.json
> index fcf8a8ebe7bd..53ca610152fa 100644
> --- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json

The "topic" of an event is taken from the filename, here the topic
will be "others".

> @@ -94,11 +94,6 @@
>      "EventName": "PM_L1_ICACHE_RELOADED_ALL",
>      "BriefDescription": "Counts all instruction cache reloads includes d=
emand, prefetch, prefetch turned into demand and demand turned into prefetc=
h."
>    },
> -  {
> -    "EventCode": "0x44054",
> -    "EventName": "PM_VECTOR_LD_CMPL",
> -    "BriefDescription": "Vector load instruction completed."
> -  },
>    {
>      "EventCode": "0x4D05E",
>      "EventName": "PM_BR_CMPL",
> @@ -108,5 +103,100 @@
>      "EventCode": "0x400F0",
>      "EventName": "PM_LD_DEMAND_MISS_L1_FIN",
>      "BriefDescription": "Load missed L1, counted at finish time."
> +  },
> +  {
> +    "EventCode": "0x00000038BC",
> +    "EventName": "PM_ISYNC_CMPL",
> +    "BriefDescription": "Isync completion count per thread."
> +  },
> +  {
> +    "EventCode": "0x000000C088",
> +    "EventName": "PM_LD0_32B_FIN",
> +    "BriefDescription": "256-bit load finished in the LD0 load execution=
 unit."
> +  },
> +  {
> +    "EventCode": "0x000000C888",
> +    "EventName": "PM_LD1_32B_FIN",
> +    "BriefDescription": "256-bit load finished in the LD1 load execution=
 unit."
> +  },
> +  {
> +    "EventCode": "0x000000C090",
> +    "EventName": "PM_LD0_UNALIGNED_FIN",
> +    "BriefDescription": "Load instructions in LD0 port that are either u=
naligned, or treated as unaligned and require an additional recycle through=
 the pipeline using the load gather buffer. This typically adds about 10 cy=
cles to the latency of the instruction. This includes loads that cross the =
128 byte boundary, octword loads that are not aligned, and a special forwar=
d progress case of a load that does not hit in the L1 and crosses the 32 by=
te boundary and is launched NTC. Counted at finish time."
> +  },
> +  {
> +    "EventCode": "0x000000C890",
> +    "EventName": "PM_LD1_UNALIGNED_FIN",
> +    "BriefDescription": "Load instructions in LD1 port that are either u=
naligned, or treated as unaligned and require an additional recycle through=
 the pipeline using the load gather buffer. This typically adds about 10 cy=
cles to the latency of the instruction. This includes loads that cross the =
128 byte boundary, octword loads that are not aligned, and a special forwar=
d progress case of a load that does not hit in the L1 and crosses the 32 by=
te boundary and is launched NTC. Counted at finish time."
> +  },
> +  {
> +    "EventCode": "0x000000C0A4",
> +    "EventName": "PM_ST0_UNALIGNED_FIN",
> +    "BriefDescription": "Store instructions in ST0 port that are either =
unaligned, or treated as unaligned and require an additional recycle throug=
h the pipeline. This typically adds about 10 cycles to the latency of the i=
nstruction. This only includes stores that cross the 128 byte boundary. Cou=
nted at finish time."
> +  },
> +  {
> +    "EventCode": "0x000000C8A4",
> +    "EventName": "PM_ST1_UNALIGNED_FIN",
> +    "BriefDescription": "Store instructions in ST1 port that are either =
unaligned, or treated as unaligned and require an additional recycle throug=
h the pipeline. This typically adds about 10 cycles to the latency of the i=
nstruction. This only includes stores that cross the 128 byte boundary. Cou=
nted at finish time."
> +  },
> +  {
> +    "EventCode": "0x000000C8B8",
> +    "EventName": "PM_STCX_SUCCESS_CMPL",
> +    "BriefDescription": "STCX instructions that completed successfully. =
Specifically, counts only when a pass status is returned from the nest."
> +  },
> +  {
> +    "EventCode": "0x000000D0B4",
> +    "EventName": "PM_DC_PREF_STRIDED_CONF",
> +    "BriefDescription": "A demand load referenced a line in an active st=
rided prefetch stream. The stream could have been allocated through the har=
dware prefetch mechanism or through software."
> +  },
> +  {
> +    "EventCode": "0x000000F880",
> +    "EventName": "PM_SNOOP_TLBIE_CYC",
> +    "BriefDescription": "Cycles in which TLBIE snoops are executed in th=
e LSU."
> +  },

Perhaps the topics here should be memory or translation?

> +  {
> +    "EventCode": "0x000000F084",
> +    "EventName": "PM_SNOOP_TLBIE_CACHE_WALK_CYC",
> +    "BriefDescription": "TLBIE snoop cycles in which the data cache is b=
eing walked."
> +  },
> +  {
> +    "EventCode": "0x000000F884",
> +    "EventName": "PM_SNOOP_TLBIE_WAIT_ST_CYC",
> +    "BriefDescription": "TLBIE snoop cycles in which older stores are st=
ill draining."
> +  },
> +  {
> +    "EventCode": "0x000000F088",
> +    "EventName": "PM_SNOOP_TLBIE_WAIT_LD_CYC",
> +    "BriefDescription": "TLBIE snoop cycles in which older loads are sti=
ll draining."
> +  },
> +  {
> +    "EventCode": "0x000000F08C",
> +    "EventName": "PM_SNOOP_TLBIE_WAIT_MMU_CYC",
> +    "BriefDescription": "TLBIE snoop cycles in which the Load-Store unit=
 is waiting for the MMU to finish invalidation."
> +  },
> +  {
> +    "EventCode": "0x0000004884",
> +    "EventName": "PM_NO_FETCH_IBUF_FULL_CYC",
> +    "BriefDescription": "Cycles in which no instructions are fetched bec=
ause there is no room in the instruction buffers."
> +  },
> +  {
> +    "EventCode": "0x00000048B4",
> +    "EventName": "PM_BR_TKN_UNCOND_FIN",
> +    "BriefDescription": "An unconditional branch finished. All unconditi=
onal branches are taken."

I see PM_BR_TAKEN_CMPL in
tools/perf/pmu-events/arch/powerpc/power10/frontend.json, so maybe it
makes sense to put this event in that topic?

Thanks,
Ian

> +  },
> +  {
> +    "EventCode": "0x0B0000016080",
> +    "EventName": "PM_L2_TLBIE_SLBIE_START",
> +    "BriefDescription": "NCU Master received a TLBIE/SLBIEG/SLBIAG opera=
tion from the core. Event count should be multiplied by 2 since the data is=
 coming from a 2:1 clock domain and the data is time sliced across all 4 th=
reads."
> +  },
> +  {
> +    "EventCode": "0x0B0000016880",
> +    "EventName": "PM_L2_TLBIE_SLBIE_DELAY",
> +    "BriefDescription": "Cycles when a TLBIE/SLBIEG/SLBIAG command was h=
eld in a hottemp condition by the NCU Master. Multiply this count by 1000 t=
o obtain the total number of cycles. This can be divided by PM_L2_TLBIE_SLB=
IE_SENT to obtain the average time a TLBIE/SLBIEG/SLBIAG command was held. =
Event count should be multiplied by 2 since the data is coming from a 2:1 c=
lock domain and the data is time sliced across all 4 threads."
> +  },
> +  {
> +    "EventCode": "0x0B0000026880",
> +    "EventName": "PM_L2_SNP_TLBIE_SLBIE_DELAY",
> +    "BriefDescription": "Cycles when a TLBIE/SLBIEG/SLBIAG that targets =
this thread's LPAR was in flight while in a hottemp condition. Multiply thi=
s count by 1000 to obtain the total number of cycles. This can be divided b=
y PM_L2_SNP_TLBIE_SLBIE_START to obtain the overall efficiency. Note: =E2=
=80=99inflight=E2=80=99 means SnpTLB has been sent to core(ie doesn=E2=80=
=99t include when SnpTLB is in NCU waiting to be launched serially behind d=
ifferent SnpTLB). The NCU Snooper gets in a =E2=80=99hottemp=E2=80=99 delay=
 window when it detects it is above its TLBIE/SLBIE threshold for process S=
npTLBIE/SLBIE with this core. Event count should be multiplied by 2 since t=
he data is coming from a 2:1 clock domain and the data is time sliced acros=
s all 4 threads."
>    }
>  ]
> --
> 2.43.0
>
