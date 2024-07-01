Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B632A91DA02
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 10:34:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xP6EcoW7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCK8P3PKlz3dHm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 18:34:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xP6EcoW7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCK7f0fv0z3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 18:33:31 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3c9b94951cfso1719526b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2024 01:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719822805; x=1720427605; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=plmjyndby8wCrQ0dzhsOGEIbNYKVIMLD81+XwlR3F9w=;
        b=xP6EcoW7tiALNho2qqeCQlMUXJG2b5xvv+CZcX6q5ULP5pLTf5sbY/mBNFPXaqCz4m
         Vlsai9fcphiEDeyAJjktquR/MqJkIQPP/k3+DLNTJDjsgnZ1rh2zhnsRaNG6+niTntAJ
         isJDtRtTSMrUneaJ/1q479x+MOu7J4kaEose23eUgMGUi7gDgYvUIBfA7MrKf0+hN0C5
         KNiWfbSAmQGhWa99V+pFm0iQPKY4llwQO13CTq7rvuqa/3AlszjVcqtNKm70Ry5Z66Ln
         JtVSEvUhZrvB9eYc3PV/Spz+SDE9LNTl407XEec8rQkhIL/viIm+whamAwoc1wMiXM9N
         8y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719822805; x=1720427605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plmjyndby8wCrQ0dzhsOGEIbNYKVIMLD81+XwlR3F9w=;
        b=TAV2DW2To0h8eoq+8mX39IZcqTtp7W1OXW66/j9qfec1vVJm6QWHA7qMT8UJX+M1d2
         ubwfineM0na/yZ/zlHmdU1o9iGR/TYwc6ngXlXHDqSpOkpNx5uhQNWMP3NMyRtiHtIYY
         0xlFV6297uJbzfpMC6uM3fDh11oIX1Siqh2jyM+5C0s0ssr2l+dXUpbJhfPvCcxAF07u
         hiSu0EsuFquE+Mlt7pOghrjeozwsMsqvgNMhDMqZesmZjd2k1Nm8ZJYBefpU/PiEX25d
         iDs0UgQYK0j5FbQ/86PDjlskCBsPYfwe/YcKgiVOh+5cQh4QRf5EWBBctHCFB9/48HXp
         uQJw==
X-Forwarded-Encrypted: i=1; AJvYcCW6gN0QhG7wQdIXGtwRCB91qvvluT0dLfPKaxobIOVAPczIKksuwMefwueelDSrbVqxRH728fBY3GsQAXnHkVF9Dw5M+3/sHdmkHbZoDw==
X-Gm-Message-State: AOJu0Yw6SFN3+4W5FW4HjjAvcIL6agRPXiQbedCi5yB6weQS/EYO4KiS
	wQbh5WRq5fUCwXRwPr+7503E6quNOBGhAJJEtYNoC4c0ypV4X8CF/U9s3597rns=
X-Google-Smtp-Source: AGHT+IE1oWZE1bOQ7gPCQ6D2Kkco7qOvhQLh2xnubHsY9YThCuK7aoKubwEBd7IojI4Hbf8ohqHZIQ==
X-Received: by 2002:a05:6808:14ca:b0:3d6:31eb:69b1 with SMTP id 5614622812f47-3d6b54975afmr7594905b6e.58.1719822803407;
        Mon, 01 Jul 2024 01:33:23 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf63esm5885051b3a.123.2024.07.01.01.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 01:33:22 -0700 (PDT)
Date: Mon, 1 Jul 2024 14:03:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH] cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros
Message-ID: <20240701083320.c3r4aussa4qojewq@vireshk-i7>
References: <20240614-md-powerpc-drivers-cpufreq-v1-1-de4034d87fd2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-md-powerpc-drivers-cpufreq-v1-1-de4034d87fd2@quicinc.com>
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

On 14-06-24, 23:08, Jeff Johnson wrote:
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

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
