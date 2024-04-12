Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FAF8A2619
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 08:03:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z3GorIVd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG5bc5G2wz3vbl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 16:03:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z3GorIVd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG5Zs1r1dz3dWg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 16:02:59 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e4f341330fso5767805ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 23:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712901776; x=1713506576; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOC8VAGw4i+hxCTWqMI13CQ+qXiRk+B8ACq5S9OFfwo=;
        b=Z3GorIVdhx16taUUqS1cgDObc8WutEwy27fLutFhmPAPX/WumrsQYdknzn7OHSiQk3
         6DceckN0mxVs9+9C0eTgDIxnQjiNZlxS6ckhD60u5cXZCZpxveItzRjdkDyGb0CjiUoZ
         VmZ8YjY8IwKgDIB1e9ADNKEil7dh/ufTD5SdDhKG6jaL88j74n3aZjK4QuNCwGpkU193
         ue+zkoDM5iqki08FJ4VH7y+bW7U2ZdFl8u99QYOrTeMD2d2IJpwVV37pDEMjIOhHPszM
         LFPBOD9iKhKpY06x/6dqJ0pIAnILQlfvDczcTADty6bny2N6xRyIIpHvemWHmPCLoDS2
         QgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712901776; x=1713506576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOC8VAGw4i+hxCTWqMI13CQ+qXiRk+B8ACq5S9OFfwo=;
        b=kdKJMpYSzTBFM90YhiRWOxe26gP/M87ZmrG+1rE52vC7ftvqASalANA18sr/1pCECR
         cnvHkzc3oziR3+px3z3yrchYTnWE8s5pZ7PYh9x6PKO9GMK9eCYd/4+acgVGwXg5XmGH
         QDAtnvs+GRLsi/RlteU7ys1yaVbPlAfn5wG9ksG+eAQqxepX4B6DNUfNiwCaGnvGGI6/
         IddswSwlGtMr7fyrxjev/hccsptaN6xagJk9lE/iSpHr0p84FioakfOeDv9LmTyO2CtR
         wjUHrqGbHPYjSN7dts3WWTQl9ShjKd7CNUgRkLkf0ehioaY2AUPWMzLBgk4KaaNwMlG0
         N12A==
X-Forwarded-Encrypted: i=1; AJvYcCXIYSx3tIEWjkQ3tPijJkycogzDZ86GvVteKgTumdH9qAUFy7z8MEgKiOZA1FNNuvLt92s1/LH7bDFfXicTAi0DrfzZl4D2xUr7P8IBXw==
X-Gm-Message-State: AOJu0YygsPRoNdR9V51x7wmSNMrlQR4xEDHnGkabl8tDYR06reS4Bup1
	7I7asF+ioIJ2FECpX/dMxHh4D0YwfQckE1hOpH8/6rnGYFCZsWfWCNz0Fbsdmh8=
X-Google-Smtp-Source: AGHT+IGvWhNQNRl+dOMxKzEQeMoIVBqZynwnZsjtpEm0vi0PMHQYwTtE0HIB6t53qpjTxft80Fvx7A==
X-Received: by 2002:a17:902:b48e:b0:1e3:f2d0:1a4d with SMTP id y14-20020a170902b48e00b001e3f2d01a4dmr1563677plr.45.1712901775863;
        Thu, 11 Apr 2024 23:02:55 -0700 (PDT)
Received: from localhost ([122.172.85.136])
        by smtp.gmail.com with ESMTPSA id u22-20020a1709026e1600b001e2ba8605dfsm603815plk.150.2024.04.11.23.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:02:55 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:32:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lizhe <sensor1010@163.com>
Subject: Re: [PATCH] cpufreq: Covert to exit callback returning void
Message-ID: <20240412060253.5zzc72mkmmz3xr72@vireshk-i7>
References: <20240410132247.3587-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410132247.3587-1-sensor1010@163.com>
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
Cc: rafael@kernel.org, linux-tegra@vger.kernel.org, ray.huang@amd.com, srinivas.pandruvada@linux.intel.com, alyssa@rosenzweig.io, khilman@kernel.org, linux-pm@vger.kernel.org, jonathanh@nvidia.com, aneesh.kumar@kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, naveen.n.rao@linux.ibm.com, lenb@kernel.org, sven@svenpeter.dev, linux-arm-msm@vger.kernel.org, npiggin@gmail.com, linux-mediatek@lists.infradead.org, mmayer@broadcom.com, matthias.bgg@gmail.com, linux-omap@vger.kernel.org, cristian.marussi@arm.com, angelogioacchino.delregno@collabora.com, andersson@kernel.org, marcan@marcan.st, linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, thierry.reding@gmail.com, asahi@lists.linux.dev, sudeep.holla@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10-04-24, 06:22, Lizhe wrote:
> For the exit() callback function returning an int type value.
> this leads many driver authors mistakenly believing that error
> handling can be performed by returning an error code. However.
> the returned value is ignore, and to improve this situation.
> it is proposed to modify the return type of the exit() callback
> function to void
> 
> Signed-off-by: Lizhe <sensor1010@163.com>
> ---
>  drivers/cpufreq/acpi-cpufreq.c         | 4 +---
>  drivers/cpufreq/amd-pstate.c           | 7 ++-----
>  drivers/cpufreq/apple-soc-cpufreq.c    | 4 +---
>  drivers/cpufreq/bmips-cpufreq.c        | 4 +---
>  drivers/cpufreq/cppc_cpufreq.c         | 3 +--
>  drivers/cpufreq/cpufreq-dt.c           | 3 +--
>  drivers/cpufreq/e_powersaver.c         | 3 +--
>  drivers/cpufreq/intel_pstate.c         | 4 +---
>  drivers/cpufreq/mediatek-cpufreq-hw.c  | 4 +---
>  drivers/cpufreq/mediatek-cpufreq.c     | 4 +---
>  drivers/cpufreq/omap-cpufreq.c         | 3 +--
>  drivers/cpufreq/pasemi-cpufreq.c       | 6 ++----
>  drivers/cpufreq/powernow-k6.c          | 3 +--
>  drivers/cpufreq/powernow-k7.c          | 3 +--
>  drivers/cpufreq/powernow-k8.c          | 4 +---
>  drivers/cpufreq/powernv-cpufreq.c      | 4 +---
>  drivers/cpufreq/ppc_cbe_cpufreq.c      | 3 +--
>  drivers/cpufreq/qcom-cpufreq-hw.c      | 4 +---
>  drivers/cpufreq/qoriq-cpufreq.c        | 4 +---
>  drivers/cpufreq/scmi-cpufreq.c         | 4 +---
>  drivers/cpufreq/scpi-cpufreq.c         | 4 +---
>  drivers/cpufreq/sh-cpufreq.c           | 4 +---
>  drivers/cpufreq/sparc-us2e-cpufreq.c   | 3 +--
>  drivers/cpufreq/sparc-us3-cpufreq.c    | 3 +--
>  drivers/cpufreq/speedstep-centrino.c   | 4 +---
>  drivers/cpufreq/tegra194-cpufreq.c     | 4 +---
>  drivers/cpufreq/vexpress-spc-cpufreq.c | 3 +--
>  27 files changed, 29 insertions(+), 74 deletions(-)

I have discarded all emails with following subject line:

"cpufreq: Convert to exit callback returning void".

While you have sent decent patches for removing the empty exit callbacks, the
way you have handled these changes is not correct.

Don't send any patches for now and please wait and understand what's being asked
from you.

This change you are trying to make is okay and sensible, but you can not send
random patches to the list just like that. You are wasting everyone's time here
including yourself.

Now what we expect here is a single commit (with version history), which changes
all the users of the exit() function (each and every cpufreq driver) and
cpufreq.h and cpufreq.c. That change should compile fine and break none of the
platforms compilation.

Please don't send more of these patches unless this is done.

-- 
viresh
