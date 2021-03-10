Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D30E4333D80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 14:16:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwXfd652tz3d7P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 00:16:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=pn+LM12N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=pn+LM12N; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwXfD1QC4z2yhy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 00:16:32 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id 18so12031960pfo.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 05:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cgQUglqxc+GpfWMq7JXRAC8k+191d2Fc9wCJ5LvoShI=;
 b=pn+LM12NRe+x8d81MNP41l+x4+6QN4/QzNvoWzth/rhxK/vv3n4pe3pNHQ8/0gMeqw
 oNLwq2tWDO5lNA8KCx4mo4BfMKPmtSVN8r2AuKq5+osyQYgKUSOgKAxL85N0d3F2D06C
 jXQL0De4yqVyqw506Ee8XeEhsGf0tlxk2eHIkGgTeEwkorGe4FO7qYzRIWOGVC1gS71X
 0qqX+a3KMc3skC6huvPay9gdK83k9baUVcdSlsTK7GHitGkauMEtxs2H5gXSN9T4Kuvf
 degma3B12KbV6y/vQuhzMoqdEEfr79+3AXICHsSHmLiseF/kGnMX42SFIahM6i70GtrF
 Tj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cgQUglqxc+GpfWMq7JXRAC8k+191d2Fc9wCJ5LvoShI=;
 b=QnmhbgEffDrQVyAblIEZH2oHLNWSZAzfxAxVqB1j7umbiOUQO+NAiCwAiKCGSeJAz7
 U8HrFheI20g3Qo3GghUg7ZMJcJKnw4mbEFnDPgxvej1u4yS5haT6EsTlXjz8YyL6fRAQ
 QepOzKiD/mBc66POn0INM/G9tCEuAlDDg4kftyB1zZbdt4y4Jml6N+Gcm2L+w3/iFe8G
 gs49TM7m1GS6v3Iz1vL9vbZLnjjZkNnd9dLOfvRKbDY/3nxHidFoccytO/fGRHdUah7B
 VcTQHzb7txdvF1vON+K1Mi/+etBOsKGgThMywR/UrHS7+tuCKQ/gCE7Hf4hUfeaN/F+C
 6SgA==
X-Gm-Message-State: AOAM5321o/rOlwUTAhx+AwQHcKuNA/+rzbPzCDpcP2nPnR7hTJJyu6F9
 wfsOXpQn2J7fUQU8NYLg2dEhJJDtiWg9SQ==
X-Google-Smtp-Source: ABdhPJzuvYo3MKxO9XaUejZpbSDSt2TAK+WMvZAB+yUkLMpx6eOgOiQB8u9s5shDgcJAB7MiHL4Zfg==
X-Received: by 2002:a62:7ecc:0:b029:1ee:f61b:a63f with SMTP id
 z195-20020a627ecc0000b02901eef61ba63fmr2779896pfc.57.1615382189641; 
 Wed, 10 Mar 2021 05:16:29 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id l22sm17299314pfd.145.2021.03.10.05.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 05:16:29 -0800 (PST)
Subject: Re: [PATCH V2 2/2] powerpc/perf: Add platform specific
 check_attr_config
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
References: <20210226065025.1254973-1-maddy@linux.ibm.com>
 <20210226065025.1254973-2-maddy@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <dde47591-db00-4c4f-ed24-a8ab5a7a4c6a@ozlabs.ru>
Date: Thu, 11 Mar 2021 00:16:25 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210226065025.1254973-2-maddy@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 26/02/2021 17:50, Madhavan Srinivasan wrote:
> Add platform specific attr.config value checks. Patch
> includes checks for both power9 and power10.
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Changelog v1:
> - No changes.
> 
>   arch/powerpc/perf/isa207-common.c | 41 +++++++++++++++++++++++++++++++
>   arch/powerpc/perf/isa207-common.h |  2 ++
>   arch/powerpc/perf/power10-pmu.c   | 13 ++++++++++
>   arch/powerpc/perf/power9-pmu.c    | 13 ++++++++++
>   4 files changed, 69 insertions(+)
> 
> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
> index e4f577da33d8..b255799f5b51 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -694,3 +694,44 @@ int isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned int flags,
>   
>   	return num_alt;
>   }
> +
> +int isa3_X_check_attr_config(struct perf_event *ev)


"isa300" is used everywhere else to refer to ISA 3.00.


> +{
> +	u64 val, sample_mode;
> +	u64 event = ev->attr.config;
> +
> +	val = (event >> EVENT_SAMPLE_SHIFT) & EVENT_SAMPLE_MASK;

I am not familiar with the code - "Raw event encoding for Power9" from 
arch/powerpc/perf/power9-pmu.c - where is this from? Is this how linux 
defines encoding or it is P9 UM or something?

> +	sample_mode = val & 0x3;
> +
> +	/*
> +	 * MMCRA[61:62] is Randome Sampling Mode (SM).
> +	 * value of 0b11 is reserved.
> +	 */
> +	if (sample_mode == 0x3)
> +		return -1;
> +
> +	/*
> +	 * Check for all reserved value
> +	 */
> +	switch (val) {
> +	case 0x5:
> +	case 0x9:
> +	case 0xD:
> +	case 0x19:
> +	case 0x1D:
> +	case 0x1A:
> +	case 0x1E:


What spec did these numbers come from?

> +		return -1;
> +	}
> +
> +	/*
> +	 * MMCRA[48:51]/[52:55]) Threshold Start/Stop
> +	 * Events Selection.
> +	 * 0b11110000/0b00001111 is reserved.

The mapping between the event and MMCRA is very unclear :) But there are 
more reserved values in MMCRA in PowerISA_public.v3.0B.pdf:

===
0000 Reserved

Problem state access (SPR 770)
1000 - 1111 - ReservedPrivileged access (SPR 770 or 786)
1000 - 1111 - Implementation-dependent
===

Do not you need to filter these too?

> +	 */
> +	val = (event >> EVENT_THR_CTL_SHIFT) & EVENT_THR_CTL_MASK;
> +	if (((val & 0xF0) == 0xF0) || ((val & 0xF) == 0xF))
> +		return -1;

Since the filters may differ for problem and privileged, may be make 
these check_attr_config() hooks return EINVAL or EPERM and pass it on in 
the caller? Not sure there is much value in it though.


> +
> +	return 0;
> +}
> diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
> index 1af0e8c97ac7..ae8eaf05efd1 100644
> --- a/arch/powerpc/perf/isa207-common.h
> +++ b/arch/powerpc/perf/isa207-common.h
> @@ -280,4 +280,6 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
>   							struct pt_regs *regs);
>   void isa207_get_mem_weight(u64 *weight);
>   
> +int isa3_X_check_attr_config(struct perf_event *ev);
> +
>   #endif
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
> index a901c1348cad..bc64354cab6a 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -106,6 +106,18 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
>   	return num_alt;
>   }
>   
> +static int power10_check_attr_config(struct perf_event *ev)
> +{
> +	u64 val;
> +	u64 event = ev->attr.config;
> +
> +	val = (event >> EVENT_SAMPLE_SHIFT) & EVENT_SAMPLE_MASK;
> +	if (val == 0x10 || isa3_X_check_attr_config(ev))
> +		return -1;
> +
> +	return 0;
> +}
> +
>   GENERIC_EVENT_ATTR(cpu-cycles,			PM_RUN_CYC);
>   GENERIC_EVENT_ATTR(instructions,		PM_RUN_INST_CMPL);
>   GENERIC_EVENT_ATTR(branch-instructions,		PM_BR_CMPL);
> @@ -559,6 +571,7 @@ static struct power_pmu power10_pmu = {
>   	.attr_groups		= power10_pmu_attr_groups,
>   	.bhrb_nr		= 32,
>   	.capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
> +	.check_attr_config	= power10_check_attr_config,
>   };
>   
>   int init_power10_pmu(void)
> diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
> index 2a57e93a79dc..b3b9b226d053 100644
> --- a/arch/powerpc/perf/power9-pmu.c
> +++ b/arch/powerpc/perf/power9-pmu.c
> @@ -151,6 +151,18 @@ static int power9_get_alternatives(u64 event, unsigned int flags, u64 alt[])
>   	return num_alt;
>   }
>   
> +static int power9_check_attr_config(struct perf_event *ev)
> +{
> +	u64 val;
> +	u64 event = ev->attr.config;
> +
> +	val = (event >> EVENT_SAMPLE_SHIFT) & EVENT_SAMPLE_MASK;
> +	if (val == 0xC || isa3_X_check_attr_config(ev))
> +		return -1;
> +
> +	return 0;
> +}
> +
>   GENERIC_EVENT_ATTR(cpu-cycles,			PM_CYC);
>   GENERIC_EVENT_ATTR(stalled-cycles-frontend,	PM_ICT_NOSLOT_CYC);
>   GENERIC_EVENT_ATTR(stalled-cycles-backend,	PM_CMPLU_STALL);
> @@ -437,6 +449,7 @@ static struct power_pmu power9_pmu = {
>   	.attr_groups		= power9_pmu_attr_groups,
>   	.bhrb_nr		= 32,
>   	.capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
> +	.check_attr_config	= power9_check_attr_config,
>   };
>   
>   int init_power9_pmu(void)
> 

-- 
Alexey
