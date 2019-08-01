Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 282337D916
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 12:13:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zmMs2rX7zDqs8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 20:13:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.59.63; helo=4.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 4.mo68.mail-out.ovh.net (4.mo68.mail-out.ovh.net [46.105.59.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zmL54LG6zDql8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 20:11:54 +1000 (AEST)
Received: from player168.ha.ovh.net (unknown [10.109.146.1])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 829CA13E302
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 11:33:11 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player168.ha.ovh.net (Postfix) with ESMTPSA id C3ECF86A98FF;
 Thu,  1 Aug 2019 09:33:08 +0000 (UTC)
Subject: Re: [PATCH] powerpc/powernv: Print helpful message when cores guarded
To: Joel Stanley <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
References: <20190801051630.5804-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d5791c31-e2e2-5f94-aa01-f0a3b18da0ca@kaod.org>
Date: Thu, 1 Aug 2019 11:33:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801051630.5804-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12814711265425001405
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrleejgdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/08/2019 07:16, Joel Stanley wrote:
> Often the firmware will guard out cores after a crash. This often
> undesirable, and is not immediately noticeable.
> 
> This adds an informative message when a CPU device tree nodes are marked
> bad in the device tree.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Tested on qemu 4.1 with this patch applied:
> 
>  https://ozlabs.org/~joel/uta2019/0001-TESTING-mark-every-second-core-as-guarded.patch
> 
> This will show no cores guarded:
> 
>  qemu-system-ppc64 -M powernv8 -nographic -smp 1,cores=1,threads=1 -kernel zImage.epapr
> 
> This will show three:
> 
>  qemu-system-ppc64 -M powernv8 -nographic -smp 7,cores=7,threads=1 -kernel zImage.epapr
> 
>  arch/powerpc/platforms/powernv/setup.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
> index a5e52f9eed3c..7107583d0c6b 100644
> --- a/arch/powerpc/platforms/powernv/setup.c
> +++ b/arch/powerpc/platforms/powernv/setup.c
> @@ -129,6 +129,28 @@ static void pnv_setup_rfi_flush(void)
>  	setup_count_cache_flush();
>  }
>  
> +static void __init pnv_check_guarded_cores(void)
> +{
> +	struct device_node *dn;
> +	int bad_count = 0;
> +
> +	for_each_node_by_type(dn, "cpu") {
> +		if (of_property_match_string(dn, "status", "bad") >= 0)
> +			bad_count++;
> +	};
> +
> +	if (bad_count) {
> +		pr_cont("  __                           \n");
> +		pr_cont(" /  \\        _______________    \n");
> +		pr_cont(" |  |       /               \\  \n");
> +		pr_cont(" @  @       |    WARNING!   |  \n");
> +		pr_cont(" || ||      | It looks like |  \n");
> +		pr_cont(" || ||   <--|  you have %*d |  \n", 3, bad_count);
> +		pr_cont(" |\\_/|      | guarded cores |  \n");
> +		pr_cont(" \\___/      \\_______________/  \n\n");
> +	}
> +}

Is that a new animal ? We could use a Cerberus.

Cheers,
C. 

>  static void __init pnv_setup_arch(void)
>  {
>  	set_arch_panic_timeout(10, ARCH_PANIC_TIMEOUT);
> @@ -149,6 +171,8 @@ static void __init pnv_setup_arch(void)
>  	/* Enable NAP mode */
>  	powersave_nap = 1;
>  
> +	pnv_check_guarded_cores();
> +
>  	/* XXX PMCS */
>  }
>  
> 

