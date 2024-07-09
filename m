Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C830F92AD14
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 02:24:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJ1w221Blz3dBX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 10:24:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=209.85.214.178; helo=mail-pl1-f178.google.com; envelope-from=khilman@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJ1vf4CYlz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 10:24:28 +1000 (AEST)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1faad2f1967so37929395ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2024 17:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720484666; x=1721089466;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlo3UWV9lkDtVHiC3tnceLIBeIIjDfMxY69ysONeH1A=;
        b=ien9SsEY2DSVcz9rgsX5d36t6D1LsdYSrdS4+XMjdizTLdPKRGcd3qmjcIenQfEQKO
         /8YDxuPWvpGmaQr2EEZuG1Aoh3PlfeuN+pqZxandQ2+qgt5gJ2rIqeczv552PkA87TU0
         oMoKW7aMISdRQhzJjfUYPzKO/0SrjZkP7RR5enQk63Jbm5nlNxymo2nHUatAw4grA2LU
         ZA32x+tFOdhzhSIoGiP9HCczzL6gO85ZpaIVzGM9kSSmspomDBA4SWCoWRjYi1VH/G5P
         pNofbyw7MQu+K9tFmXVDuQtJeKqd1MokyCwnfxi+dnN1Xr3jdXcTqXyUnJNoj0ZWZuhC
         eXQw==
X-Forwarded-Encrypted: i=1; AJvYcCXZp6GQR1gw/RsjC4MDNkYgVZSdh9jJJJoGGr9nKQ5wSV8BYVeqPzt4WOlZ3F/b6Z84A8XCIgMfEKfTrkwIbRKd7NG7nckbvPcMnaKGmA==
X-Gm-Message-State: AOJu0Yx3g3yOcxXp/7KI7hE+D6HDdmAwQeAGLGZgXLwwALtXTU1MpZ1Q
	uuDQtobyjpbiqaPiXnMk0eEDfpz2IgesE4P0bJkHBEFpv8efZkhFjwAxlYMslyo=
X-Google-Smtp-Source: AGHT+IFdw3EaveRM2ZTHoRq8dYxA8E7q05nixOcYOGorj2dRL4w7J12n220WAjIf2IctJiJkVfxTEw==
X-Received: by 2002:a17:902:db0e:b0:1f4:a04e:8713 with SMTP id d9443c01a7336-1fbb804725emr12528595ad.28.1720484666359;
        Mon, 08 Jul 2024 17:24:26 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab7d2dsm4321415ad.180.2024.07.08.17.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 17:24:25 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Huang Rui
 <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 4/4] cpufreq: Make cpufreq_driver->exit() return void
In-Reply-To: <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
References: <cover.1720075640.git.viresh.kumar@linaro.org>
 <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
Date: Mon, 08 Jul 2024 17:24:25 -0700
Message-ID: <7hplrn76py.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org, Lizhe <sensor1010@163.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Viresh Kumar <viresh.kumar@linaro.org> writes:

> From: Lizhe <sensor1010@163.com>
>
> The cpufreq core doesn't check the return type of the exit() callback
> and there is not much the core can do on failures at that point. Just
> drop the returned value and make it return void.
>
> Signed-off-by: Lizhe <sensor1010@163.com>
> [ Viresh: Reworked the patches to fix all missing changes together. ]
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

[...]

>  drivers/cpufreq/omap-cpufreq.c         |  3 +--

For OMAP:

Acked-by: Kevin Hilman <khilman@baylibre.com>
