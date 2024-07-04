Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E74B19271AD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 10:28:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=I9wSr5qn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WF8tl5BXPz3fS2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 18:28:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=I9wSr5qn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=2a00:1098:ed:100::25; helo=madrid.collaboradmins.com; envelope-from=angelogioacchino.delregno@collabora.com; receiver=lists.ozlabs.org)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WF8t433fnz3cWW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 18:28:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720081682;
	bh=wVc3mDrD8ZHGcxEpI3RL80GBUfv7tqc7amf82VOOdic=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I9wSr5qndJJgZNK1GxM3ELWQWxcNRB0+T2ztlEssHpreWLW1x0yx/AW8C8CjFao7q
	 6tunopOnUy9YaYgE6BhE8LLp/MMeFR9xq5+hu8qRwq2dq2N8b0o1AgcmIv6XOPXExI
	 SOB6RiEioW7sWw7YaHcV26LEQmTVgkOOV4rxnUhjZgaURn/sxkqmInVgzBi8Nf9xg1
	 zzQ9MyIkkaBIfpaMD9nANIAFKME2+NH9lhW1iXLwdr6zGpV3HpHBtRCVS2ghQJvc20
	 P/hQHND/IWN5dEj8pOdBPWdb3hp7Ua4Cb94yo8VbN2Y5tV+kQX5JNm5YDoFQ3+qQZy
	 DQ1/PpgNHDFeA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E651C37821A0;
	Thu,  4 Jul 2024 08:27:59 +0000 (UTC)
Message-ID: <2a1e25ad-c9d2-44f1-b52e-74f12b437381@collabora.com>
Date: Thu, 4 Jul 2024 10:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: Make cpufreq_driver->exit() return void
To: Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Huang Rui <ray.huang@amd.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Len Brown <lenb@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <cover.1720075640.git.viresh.kumar@linaro.org>
 <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org, Lizhe <sensor1010@163.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Il 04/07/24 08:53, Viresh Kumar ha scritto:
> From: Lizhe <sensor1010@163.com>
> 
> The cpufreq core doesn't check the return type of the exit() callback
> and there is not much the core can do on failures at that point. Just
> drop the returned value and make it return void.
> 
> Signed-off-by: Lizhe <sensor1010@163.com>
> [ Viresh: Reworked the patches to fix all missing changes together. ]
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

