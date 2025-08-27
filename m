Return-Path: <linuxppc-dev+bounces-11373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0A0B37E98
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 11:18:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBf8g24Wsz3bV6;
	Wed, 27 Aug 2025 19:18:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756286307;
	cv=none; b=MnYmLGu/+g86YtHl+fWhjZ65w42+jQpyi36HTgJb3X6x3Z7uhgOxmIC+27onoWqeJ6xm8n93SeNrmx/U8vQ5A7G4lNqQ3b9TrHsImYY69Gu6fT5slV4lO5Tvd5J9xWkNpc8BKDLKmj3wyqdY5U/S7i9oVPrr6rIyak93nykxpK9H3KjF5TUc1jdPPVL3DAolwWEN+zj4iwNBS3gRJSUuU1h0iXPVFtd6826xS0xysXooL3ZRGT3Hzo0gXP7dCUEOsJmXO6Ot4rFHT0JJ5WDwWcmmppizAhIsRobmcTTkDbHLyxPldbWLAl8hl7cmiOUAo4bbEB0256840o0cQRRwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756286307; c=relaxed/relaxed;
	bh=zvHr9oNXBBOdyeTSMHIHmIm/vnzqRiFsLKII3nmFRno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1on+Ae+120gBFSEOYgCrf4bRV02J0+CrXJWptQVUtgxthwUO/XV0vSmBKwkbgGP62eFYaq3C1WsTGlFmTuWZjpoWqw5B4CHfhxZDCW5KtJMbuEg1dRRtCbs/vssywqhsUZYv3OvpHhwQF77Tuf7bD02oKnWEtiCammDM350CNT9ahOKqmDWHFA22fOnQfMqz4p53jybRW9z2wpZ+6OrQOLXX6iw0BzqB/9Xd8oDixVXkUiQ947yh9uFbvYMlymgNntr6rRysH4zn/FYyIqfpFNyP5385uiV+TDxhmBNFddnwPIM5ZiutQfI2IqJ5/qqjDwieylS2lo+Z1F9bh7qrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=foss.arm.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=foss.arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBf8f42kWz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 19:18:26 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A40C915A1;
	Wed, 27 Aug 2025 02:17:46 -0700 (PDT)
Received: from bogus (unknown [10.57.57.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 588C63F738;
	Wed, 27 Aug 2025 02:17:41 -0700 (PDT)
Date: Wed, 27 Aug 2025 10:17:18 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Zihuan Zhang <zhangzihuan@kylinos.cn>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/18] arm64: topology: Use __free(put_cpufreq_policy)
 for policy reference
Message-ID: <20250827-vegan-blond-marmot-eabf13@sudeepholla>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-2-zhangzihuan@kylinos.cn>
 <70f4c2ce-1dbd-4596-af78-bca1cdbbb581@arm.com>
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
In-Reply-To: <70f4c2ce-1dbd-4596-af78-bca1cdbbb581@arm.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 27, 2025 at 09:30:13AM +0100, Ben Horgan wrote:
> Hi Zihuan,
> 
> On 8/27/25 03:31, Zihuan Zhang wrote:
> > Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> > annotation for policy references. This reduces the risk of reference
> > counting mistakes and aligns the code with the latest kernel style.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> > ---
> >  arch/arm64/kernel/topology.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > index 5d07ee85bdae..e3cb6d54f35b 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
> >  		 */
> >  		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
> >  		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
> > -			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> > +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
> Based on the guidance, in include/linux/cleanup.h, I would expect the
> assignment to be done on this line.
> 
> "...the recommendation is to always define and assign variables in one
>  * statement and not group variable definitions at the top of the
>  * function when __free() is used."
> 

Agreed. I did something similar recently and there was a code path where
variable wasn't initialised and ended up with freeing unassigned pointer.
So it is more than just a recommendation sometimes.

-- 
Regards,
Sudeep

