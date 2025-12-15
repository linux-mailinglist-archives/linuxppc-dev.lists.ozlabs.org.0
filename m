Return-Path: <linuxppc-dev+bounces-14755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12798CBC8EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 06:25:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dV7my5D5yz2xqL;
	Mon, 15 Dec 2025 16:25:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765776322;
	cv=none; b=hPWYILKK1Z1wmB6CGAo4LR5xeeaOk56wpkfhSWroIvs4LK7Idb9j6dOL5qbM1D2gOOFyasAi4lHKqpHDZBafm2vUW5NECMAf5mnififOeV8V8m7W3QthvJkzclo/vSK09BEIZMFsP+j4YYV2tAoCj1pLG6IUcUwpEXP55LGXR8UxAv9l4sfolOOXGYGB6mZg/H1V989IMsEgHE0lg16iwTZarkCp8822uyL7j6koV50DBp34klRpVOrELViTFq3kAr0zqR4sxQQkn+BJPVC8YjJkw002UjZve8NLqx5+aP2Ik7c8doazlytiDjFak7JOhf9hqygrEW/moNU80HrqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765776322; c=relaxed/relaxed;
	bh=UmmxZTmEMkdYAdK/pJCpdNbxZ/BTXU9Mug79unJZ37w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fl+uXCLe2/QFf+y2SNNx34f5yMIEsbEdy53/Zj4S/5tlefIk5UxXqv1Pg7mqadLnX/essByckNDIavZnVErK9IGaxr3yYgQb8Ouzll8UiIaOVWt5PhNOwUMPikRX6vieQFD/kPSkC51+uUD774KGNH3gh2q4BXP7IAPPICqAArRgi6xgPwUk2NjleZXYoB9JcU9HSWCnTwaCUR2f35MRaC9Ex9Iz+jk0PADpfQE2SJ8VagCkERGvuMsjBjfpdCDW1MLaWWhDFE+CpT/U1E5v+bVWJfcLCI2WplmUr660UFoYEa9Tcusz1Zjs7KBkaIVZwjt/KIis9A3qSg4P5bg/tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FKhjkfI/; dkim-atps=neutral; spf=pass (client-ip=209.85.214.177; helo=mail-pl1-f177.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FKhjkfI/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=209.85.214.177; helo=mail-pl1-f177.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dV7mx28Tfz2xRm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 16:25:19 +1100 (AEDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0c20ee83dso11122395ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Dec 2025 21:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765776257; x=1766381057; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmmxZTmEMkdYAdK/pJCpdNbxZ/BTXU9Mug79unJZ37w=;
        b=FKhjkfI/nnzKkb81vWpl9bsENgMZmbyKk7EWDw4jeiC8f+GezfsfNrzvOS9a4JmMlW
         jbn2KKUYiDX0HSps1PfoMrbvk9I9KODJOEOWO9pNSCc62og5o2nJaQUbXLf/RIg7WgpJ
         V3M9Eejan5HPyr8pallp8Y9uhMzWPNoCnoiHnD294pAsyqktDHH6S4hWg1Whyica5aGm
         4X2s/SF5bFXdBiJ29mOv7sc9W4i+XnG/RdJDgkMtr+i6QnLAz6i7wIchXmcPytIeZcTj
         kZe9yI5QTRnQm8KCDNGGFYlqLwo9FrsndnroBG1asEUMfi/p3jcEaq0efAkpMs+waOPg
         Il3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765776257; x=1766381057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmmxZTmEMkdYAdK/pJCpdNbxZ/BTXU9Mug79unJZ37w=;
        b=PZb/2MsvA/djRyz4V8rXU0xDgk5EgLyvfRBLB4/aWlvU66Qm4IDQWX+WDUXBHSiYNm
         OIdU92a1QvO+zeURvDSAJund8c7cjIjTc0eAjiATfl0FwbdFNDg6au4j2Q4rSbL8waLt
         f/Ir73yCw92Ibi75cScZB0PIa+vqvIYFnB8jrRXA6C4Wy0rt1i3orqTfPEuglJPxKp9S
         jWnlJKOq8aUJAyKCuRtEQt1Rqth6OY9A4r53mWgbF4ouw7ShKsfkDqlqhu9InuWIp5CC
         sTKmwd3ann8xeOCGV2CHh7DK7qQB1CfeoDlBq1voBwD6UuIiZb1XWnN/rObVFOTuFq+h
         ae3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGmq2wq/vmFABSHSOA6MGh3AJqr9hcQC2j3GOGRUlRoEbhgoqyRyLfmlZYEFgpMj4tHhR352240vmeuic=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzh2ZbC1p1ORvqt42TGMOvOFCG/2HrH7sKsCpeaGCUgoiaPbUxO
	N54nlITHm/wtS5vOhCF48GHpNfufvmGx5i/yPI1pY0wu/ftC52FMBSFbwjMU2NOAA1M=
X-Gm-Gg: AY/fxX7xgS/4pw1lcbupilhlCYoB9O6ePwaeOYiEWEARr3KS8m/V1+Jfipyfz6cBBLI
	YRR+CCItmYntscX01InhjqCcsiJxE3i6iJzrwkEHlTJeFNRHL3sLmLYg8JW9cGSZGsMnTZoaXBM
	383OmaWVqEoBNjT14AmuvP/PyP2DcN/A5134ah4+bkxlEddnxtgdpTb4u5xsWoHQXPm/2VxoyQl
	020JxKsBU0cz91JmbuOuBwrYZEpij2BPtbMqeMUlJeeRsegViQu59LfuStVTeBKR+UKNlw7ITre
	G+g9ZQX4nSnf19To+x1EE8WzkzhPblv9rfmt05AOxR/Xt81npW9MKSFGA9mI6L1qyfDpA6N10ck
	ApCHQdk/zSrbVcj991pDwX5qRQUlAZpFqwGXeN7j9WaHSSHJ9A6yhTkE3EF1yV2F48md8xa/uXo
	E9r/3qA4d5wNA=
X-Google-Smtp-Source: AGHT+IEd41nLow/C/F1F8kEt0tXjl1QE6vzy70JC5wiTjrDdUwnfg8mZsdGVruncG42i4nuvAMIN5g==
X-Received: by 2002:a17:903:1250:b0:295:6122:5c42 with SMTP id d9443c01a7336-29f23b6f3fbmr83337755ad.24.1765776256905;
        Sun, 14 Dec 2025 21:24:16 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f177ff327sm88774495ad.101.2025.12.14.21.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 21:24:16 -0800 (PST)
Date: Mon, 15 Dec 2025 10:54:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Paul Mackerras <paulus@ozlabs.org>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] cpufreq: pmac64-cpufreq: Fix refcount leak on error paths
Message-ID: <oitkhsra7pax76dnz7r2b6wrpcljck5mwjubrjqclrerpp2kif@alms5oodo5h4>
References: <20251212092910.2454034-1-linmq006@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212092910.2454034-1-linmq006@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12-12-25, 13:29, Miaoqian Lin wrote:
> of_cpu_device_node_get obtain a reference to the device node which
> must be released with of_node_put().
> 
> Add missing of_node_put() on error paths to fix.
> 
> Found via static analysis and code review.
> 
> Fixes: 760287ab90a3 ("cpufreq: pmac64-cpufreq: remove device tree parsing for cpu nodes")
> Fixes: 4350147a816b ("[PATCH] ppc64: SMU based macs cpufreq support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/cpufreq/pmac64-cpufreq.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
> index 80897ec8f00e..0e0205b888ba 100644
> --- a/drivers/cpufreq/pmac64-cpufreq.c
> +++ b/drivers/cpufreq/pmac64-cpufreq.c
> @@ -356,8 +356,10 @@ static int __init g5_neo2_cpufreq_init(struct device_node *cpunode)
>  		use_volts_smu = 1;
>  	else if (of_machine_is_compatible("PowerMac11,2"))
>  		use_volts_vdnap = 1;
> -	else
> -		return -ENODEV;
> +	else {
> +		rc = -ENODEV;
> +		goto bail_noprops;
> +	}
>  
>  	/* Check 970FX for now */
>  	valp = of_get_property(cpunode, "cpu-version", NULL);
> @@ -430,8 +432,11 @@ static int __init g5_neo2_cpufreq_init(struct device_node *cpunode)
>  	 * supporting anything else.
>  	 */
>  	valp = of_get_property(cpunode, "clock-frequency", NULL);
> -	if (!valp)
> -		return -ENODEV;
> +	if (!valp) {
> +		rc = -ENODEV;
> +		goto bail_noprops;
> +	}
> +
>  	max_freq = (*valp)/1000;
>  	g5_cpu_freqs[0].frequency = max_freq;
>  	g5_cpu_freqs[1].frequency = max_freq/2;

I would rather handle this in the function that gets the reference of the node
in the first place: g5_cpufreq_init().

-- 
viresh

