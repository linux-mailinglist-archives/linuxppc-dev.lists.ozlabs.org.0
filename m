Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E69927300
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 11:27:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFBBT2MhBz3fTn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 19:27:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFBB42ZL7z3cZs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 19:27:05 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2C4C367;
	Thu,  4 Jul 2024 02:26:57 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E27D83F766;
	Thu,  4 Jul 2024 02:26:27 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:26:25 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 4/4] cpufreq: Make cpufreq_driver->exit() return void
Message-ID: <ZoZqwb8LdQQohQHM@bogus>
References: <cover.1720075640.git.viresh.kumar@linaro.org>
 <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-tegra@vger.kernel.org, Perry Yuan <perry.yuan@amd.com>, Huang Rui <ray.huang@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Vincent Guittot <vincent.guittot@linaro.org>, Kevin Hilman <khilman@kernel.org>, linux-pm@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Len Brown <lenb@kernel.org>, Sven Peter <sven@svenpeter.dev>, Lizhe <sensor1010@163.com>, Nicholas Piggin <npiggin@gmail.com>, linux-mediatek@lists.infradead.org, Markus Mayer <mmayer@broadcom.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org, Cristian Marussi <cristian.marussi@arm.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, asahi@lists.linux.dev, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Sudeep Holla <sudeep.holla@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 04, 2024 at 12:23:55PM +0530, Viresh Kumar wrote:
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

>  drivers/cpufreq/scmi-cpufreq.c         |  4 +---
>  drivers/cpufreq/scpi-cpufreq.c         |  4 +---
>  drivers/cpufreq/vexpress-spc-cpufreq.c |  5 ++---

(For the above 3 files)
Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep
