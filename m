Return-Path: <linuxppc-dev+bounces-3105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D2E9C51ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 10:26:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xngz519LQz2xjQ;
	Tue, 12 Nov 2024 20:26:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731403601;
	cv=none; b=h93Ym6xYlDItwAxR+E74e26u/kBKN6JmuXOfFarqET7/2PBHzO4tWl4nIHJ21+zCVBAU0auPIlmCT4BPFjqh4kugkO6pxHwy7SSHQ6BUC7CqSItEI1mkgC3rZKEIV7EcoS1/x7ftDxLWJ7AeZmP1BgZcmJHxl/vhhSKzCaC/gklP5jxaORZ6uFQSG5T6t2ZfiPU93VWdv2JMrT8Qd0sXzYrKD88D/boI4dWzIFGbW1yoDiIPha3VMDt3wGEz9Yq2zN63tR+DZ9z0AkVjTXehAV9xr3bcA49sZhu/yhf3n6qTiVdwgfS6xPceNSLqOcsVKw56C4G13kzdymcJqI7prg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731403601; c=relaxed/relaxed;
	bh=neEfcsmYwWR1TZN8OSygR364mITFwbMFoBamEQa+xj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEcSMQJMnCLiDJHwhy+NwI7cBqOWxowT0Ikd5RZKWVYFuAIAthehByuWaj7XpWpMDa+JiPI1StKUUCmIxP0eN8CyjqTn/13gn8R1l/RmtKms7j+7av+DJDXk1Pp5WBe52dBcI6AaqXbo1OanHqZjawH69UXo+tjiqj31MOchyAl7v5h/QQzu5rtCdltAvT2CXezhSJBiM8zvMrJXwA54+TNpQbfHXIpsOlyed7BxkxFLoxtxoUK0WpFq/k4disfIuR8M2Qc0UPIVqLjHDcmPkaqZlwi51V2MJhc6IBiIXhA3g0Jc5KFIU7d9kZ8yRDiMj2/Nd6xeW5oFTmQofuZ8og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mx2HaaMH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mx2HaaMH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xngz31kfSz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 20:26:37 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e31af47681so4368036a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 01:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731403595; x=1732008395; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=neEfcsmYwWR1TZN8OSygR364mITFwbMFoBamEQa+xj4=;
        b=mx2HaaMH2Ov8Zx2fL5OHLNSgoa6ea4PvR2/R8h3SdXjZHVU5F3jy2mWBxR6Tb5w/zL
         PDW+RV6wuKeU8sIRFtlZRvWx/ZKe90mtTLHMR3KD35xh1dbWrSnxXjy7fIYPeJm4Mpxl
         j4TpZdaH9ctiap4b6BQ+0Wgw6/E2HXkukCSMmNwgoak8+2al8BcbnF3p3uD/AMtUYF53
         AaoZBwaalYjkBabMdbs2NhH47lyMfmPmEP4Mh1yqloAGKCRjOo0aYUk2rM9/caBTW2Zy
         D/vGbkKamaOtPgYG7aDSMD9+IzIb7R0AnHiFw/Cbc8dYvhjk9AiZ836zMX058B7NgLKm
         i4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731403595; x=1732008395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neEfcsmYwWR1TZN8OSygR364mITFwbMFoBamEQa+xj4=;
        b=TI1PA1X43/iQ36m5Cat5xRlWBkk+FPqczj3j7Hpf/Bk1Xi8rSDpPpfG7pJtFlpMF01
         SXsuSeHoIdIg4X43Yyq4V41DZnPDgRzrBLbC0aAy5/PZuNGYQt2iABJALjCUCg/eRYcj
         LyNogl9dVgGkoYX2v02kiqs0pFw8LjaNfT6z8pwlSrEJ9evwRGFuf/9kYQuUXoYzFR3B
         Csl6c+Eit0X9x1WbNvQKra1fM0OnpPbgMcXPUS7xASQGgIjFTpDxiOJ7DkI3Azlx9XFO
         TSNalBJUxwU5VBsiwMCgqDeviCqUp2UHD4VxrJ1X7Idq758yYq849Gi+jGc27JuZLczq
         cPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQcBVzg4GL74e+QwTu8leQWkW0WgaQCHCtN62KOzr0SFMGGcU9pMN+86jb4pxqi7XcNeQVs910OPadigg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMMoCccZ8axCybYXalNHEeJr0bzIALSLwwaWlWAw7wimbScqRg
	x/MQfX/1xmsHHbeaeCCtxoDghHv13G102DqWM2WCdwhIJAzq1EC2nc3R9iS1Kxs=
X-Google-Smtp-Source: AGHT+IHcXyqu2j2PaAR73HECUuaJ0QnRAysFXoaVxI2tNJrJDuAJHUTPD6v5KyKDtf7mAXJ/PNPOUg==
X-Received: by 2002:a17:90b:3883:b0:2e2:9522:278f with SMTP id 98e67ed59e1d1-2e9b1748229mr19548653a91.32.1731403595212;
        Tue, 12 Nov 2024 01:26:35 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5feb50bsm10027153a91.53.2024.11.12.01.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 01:26:33 -0800 (PST)
Date: Tue, 12 Nov 2024 14:56:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, rafael@kernel.org
Subject: Re: [PATCH] cpufreq: maple: Remove maple driver
Message-ID: <20241112092630.imled7fmhqgkjbru@vireshk-i7>
References: <20241112085148.415574-1-mpe@ellerman.id.au>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112085148.415574-1-mpe@ellerman.id.au>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12-11-24, 19:51, Michael Ellerman wrote:
> This driver is no longer buildable since the PPC_MAPLE platform was
> removed, see commit 62f8f307c80e ("powerpc/64: Remove maple platform").
> 
> Remove the driver.
> 
> Note that the comment in the driver says it supports "SMU & 970FX
> based G5 Macs", but that's not true, that comment was copied from
> pmac64-cpufreq.c, which still exists and continues to support those
> machines.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  drivers/cpufreq/Kconfig.powerpc |   7 -
>  drivers/cpufreq/Makefile        |   1 -
>  drivers/cpufreq/maple-cpufreq.c | 242 --------------------------------
>  3 files changed, 250 deletions(-)
>  delete mode 100644 drivers/cpufreq/maple-cpufreq.c
> 
> The removal commit is in the powerpc/next branch:
>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=next
> 
> I can take this via the powerpc tree if that's easiest, let me know.

Please take it via the powerpc tree:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

