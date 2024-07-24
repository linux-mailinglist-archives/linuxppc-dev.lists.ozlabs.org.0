Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC8093AC00
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 06:40:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q2glrO8z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTLt36vRRz3cmV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 14:40:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q2glrO8z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTLsL2KR3z3c9G
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 14:39:49 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-703631c4930so3242741a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 21:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721795984; x=1722400784; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ydzy8AybJJkkCvZrEtKcB+LO2UJxL/0lB3QK0FrhXAo=;
        b=Q2glrO8z1e5muFaGuEP9UNsmDGZNPXlhwJ20PK8DR/57wVfIUa3OHaVdso7RbG7sPR
         SQ3/0DN2JRAyQ5N3W4Eg6OeSEhxGa2DtSLM3gtXFONHtBgwm3Ns1qYYWQ0W5JEs/pV7p
         vOZucujJ8YiYTRiU9/8PRC+GZuFR6SQt+Xf7Ih2slxojU/crjmnVUa4kBQGOSmBR23pA
         MO1afTjgoEOLr0RPrEm2eNCSG9vllHQ41rcEWkbL3yHRxH82Xhi4ba/0/Cw1WZcLKoDO
         HjtGX+OM+rhyRyQsKk/QYCRKLi5KGySJrIaA1sXebaGzDMekvxsWjzJdImBnL19VWtUU
         J9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721795984; x=1722400784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ydzy8AybJJkkCvZrEtKcB+LO2UJxL/0lB3QK0FrhXAo=;
        b=G7urv7wPp9cMs4ge0eHXbNONz3vzXkPcl4XfAn3wLsGt9Wwq16DmpW0Hhq9dIaVJR5
         kM+V5ZQtAanTKiIEHVNJSvU/ZtB9PD+ArvW9sZvBW5dB0FG+mfT3RJfuSyvHV9weL0MZ
         TAsPl0gXeF27esDJZudZj/22aUJMSame+N9Q2xOLv0Ga9IceqmRa0NxfLFEQT3Mc9CAD
         nqYJZBBnTMhojL7e+8a9um6rpgQhcgp0V881kk5JOXa4W7sXCd7+f+HksLHjRWr2QJta
         WGipU9uH5OTRVEVnVy/9mEsZsOUWu8UFBT6WPYUQx2pefVKtO0Ld+i6zYEPAmWBYxrk1
         tADw==
X-Forwarded-Encrypted: i=1; AJvYcCU+MZtbR5/7o9d+rvgI/UF32zjROujZmbgQhMP95Qsm96b9Qet/+xRU0poM3jIlviyTWvTmS54e+kXhk+nUpKPJRSOQFgupJDhfjoSGrw==
X-Gm-Message-State: AOJu0YwGN8Hxmj7NVGkHbAj/rxxmDBIWg1RGuUWWmwBQq/29H81Mx4KS
	mNm25D7QeJq5osw45UC3SOZh9A9bJe+JcIkREYVXJG5Urim3xfq8MvtM5rV9wpc=
X-Google-Smtp-Source: AGHT+IFawSrYkpJ5B3GaqjAq4r8y+m8JJXA6riU411Tpew/uqsG/DaM7j/6beI731Cy6xC6aPZPTvg==
X-Received: by 2002:a05:6870:1682:b0:260:ea0c:acc with SMTP id 586e51a60fabf-2648ccc2102mr942284fac.49.1721795984585;
        Tue, 23 Jul 2024 21:39:44 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff5527e9sm7734870b3a.138.2024.07.23.21.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 21:39:43 -0700 (PDT)
Date: Wed, 24 Jul 2024 10:09:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v2] cpufreq: powerpc: add missing MODULE_DESCRIPTION()
 macros
Message-ID: <20240724043941.5wpa5di7ta4fjyl5@vireshk-i7>
References: <20240722-md-powerpc-drivers-cpufreq-v2-1-bb84d715eb3d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722-md-powerpc-drivers-cpufreq-v2-1-bb84d715eb3d@quicinc.com>
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
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22-07-24, 10:14, Jeff Johnson wrote:
> With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/ppc-cbe-cpufreq.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/powernv-cpufreq.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
> 
> This includes three additional files which, although they did not
> produce a warning with the powerpc allmodconfig configuration, may
> cause this warning with specific options enabled in the kernel
> configuration.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> Changes in v2:
> - Per Michael Ellerman updated maple-cpufreq.c and powernv-cpufreq.c
>   descriptions
> - Did not carry forward Viresh Kumar's Acked-by due to this change
> - Link to v1: https://lore.kernel.org/r/20240614-md-powerpc-drivers-cpufreq-v1-1-de4034d87fd2@quicinc.com

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
