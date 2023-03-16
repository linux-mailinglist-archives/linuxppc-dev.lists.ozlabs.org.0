Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C8F6BC520
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 05:09:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcYfk1ys5z3cgq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 15:09:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VISYNtWH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcYds0GP5z3cXf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 15:08:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VISYNtWH;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PcYdr5yxtz4x8y;
	Thu, 16 Mar 2023 15:08:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678939696;
	bh=g2OWqF0mAjEpJrGYYr2T5h+uBC+Pw/kX/9ClZSCqSjY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VISYNtWHpEUkudxNCuT7gbLLBmFJKnpuc1SA/GF8v3b+KmHFoJoBbXazx9392CLtM
	 W+QlbAfbTQBv1nyG1Q59q0TomG2pIYPg+N0Q+lP5u4EMKGtFSjBfWhMqSM3KcT3Hp2
	 pjjYFDST9KLJTTMc5ROewS5eqxfT7NQFEayEbAdFLttfD1P/iRb8cJ5pyhs4reaEdO
	 Kuc6veCELVQJbJz1/IjqKyWWJAu2Qx4fylyS3QUsP+24YeCNga2k3iu9SDcOZPubol
	 U+UkbmeGnBFMzj5m6BFKrEOLc3lEUBiZYD4kCDxPQcEDZ7DPw+7sLcJDWsQhn08aXj
	 MEMQDDBlDR6BA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] cpufreq: pmac32: Use of_property_read_bool() for
 boolean properties
In-Reply-To: <20230310144703.1541819-1-robh@kernel.org>
References: <20230310144703.1541819-1-robh@kernel.org>
Date: Thu, 16 Mar 2023 15:08:16 +1100
Message-ID: <87o7otmj7z.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/cpufreq/pmac32-cpufreq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
> index 4b8ee2014da6..7ec6d1bb4592 100644
> --- a/drivers/cpufreq/pmac32-cpufreq.c
> +++ b/drivers/cpufreq/pmac32-cpufreq.c
> @@ -546,7 +546,7 @@ static int pmac_cpufreq_init_7447A(struct device_node *cpunode)
>  {
>  	struct device_node *volt_gpio_np;
>  
> -	if (of_get_property(cpunode, "dynamic-power-step", NULL) == NULL)
> +	if (!of_property_read_bool(cpunode, "dynamic-power-step"))
>  		return 1;
>  
>  	volt_gpio_np = of_find_node_by_name(NULL, "cpu-vcore-select");
> @@ -576,7 +576,7 @@ static int pmac_cpufreq_init_750FX(struct device_node *cpunode)
>  	u32 pvr;
>  	const u32 *value;
>  
> -	if (of_get_property(cpunode, "dynamic-power-step", NULL) == NULL)
> +	if (!of_property_read_bool(cpunode, "dynamic-power-step"))
>  		return 1;
>  
>  	hi_freq = cur_freq;
> @@ -632,7 +632,7 @@ static int __init pmac_cpufreq_setup(void)
>  
>  	/*  Check for 7447A based MacRISC3 */
>  	if (of_machine_is_compatible("MacRISC3") &&
> -	    of_get_property(cpunode, "dynamic-power-step", NULL) &&
> +	    of_property_read_bool(cpunode, "dynamic-power-step") &&
>  	    PVR_VER(mfspr(SPRN_PVR)) == 0x8003) {
>  		pmac_cpufreq_init_7447A(cpunode);
>  
> -- 
> 2.39.2
