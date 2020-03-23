Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA9318F1BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 10:26:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m8C03v6kzDr9j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:26:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.52.162; helo=2.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 596 seconds by postgrey-1.36 at bilbo;
 Mon, 23 Mar 2020 20:24:27 AEDT
Received: from 2.mo68.mail-out.ovh.net (2.mo68.mail-out.ovh.net
 [46.105.52.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m88q0LZHzDqDP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:24:26 +1100 (AEDT)
Received: from player696.ha.ovh.net (unknown [10.110.208.83])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 56C3414EEC8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 10:06:31 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player696.ha.ovh.net (Postfix) with ESMTPSA id F0ABD10BC12AC;
 Mon, 23 Mar 2020 09:06:08 +0000 (UTC)
Subject: Re: [PATCH v8 04/14] powerpc/vas: Alloc and setup IRQ and trigger
 port address
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598473.9256.15248.camel@hbabu-laptop>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <396db62b-5342-a1b3-eade-a219afd98fc7@kaod.org>
Date: Mon, 23 Mar 2020 10:06:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584598473.9256.15248.camel@hbabu-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8941334113687866361
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeliedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au,
 Frederic Barrat <frederic.barrat@fr.ibm.com>, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/19/20 7:14 AM, Haren Myneni wrote:
> 
> Alloc IRQ and get trigger port address for each VAS instance. Kernel
> register this IRQ per VAS instance and sets this port for each send
> window. NX interrupts the kernel when it sees page fault.

I don't understand why this is not done by the OPAL driver for each VAS 
of the system. Is the VAS unit very different from OpenCAPI regarding
the fault ? 


C.

> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/vas.c | 34 ++++++++++++++++++++++++++++------
>  arch/powerpc/platforms/powernv/vas.h |  2 ++
>  2 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
> index ed9cc6d..168ab68 100644
> --- a/arch/powerpc/platforms/powernv/vas.c
> +++ b/arch/powerpc/platforms/powernv/vas.c
> @@ -15,6 +15,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of.h>
>  #include <asm/prom.h>
> +#include <asm/xive.h>
>  
>  #include "vas.h"
>  
> @@ -25,10 +26,12 @@
>  
>  static int init_vas_instance(struct platform_device *pdev)
>  {
> -	int rc, cpu, vasid;
> -	struct resource *res;
> -	struct vas_instance *vinst;
>  	struct device_node *dn = pdev->dev.of_node;
> +	struct vas_instance *vinst;
> +	uint32_t chipid, irq;
> +	struct resource *res;
> +	int rc, cpu, vasid;
> +	uint64_t port;
>  
>  	rc = of_property_read_u32(dn, "ibm,vas-id", &vasid);
>  	if (rc) {
> @@ -36,6 +39,12 @@ static int init_vas_instance(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	rc = of_property_read_u32(dn, "ibm,chip-id", &chipid);
> +	if (rc) {
> +		pr_err("No ibm,chip-id property for %s?\n", pdev->name);
> +		return -ENODEV;
> +	}
> +
>  	if (pdev->num_resources != 4) {
>  		pr_err("Unexpected DT configuration for [%s, %d]\n",
>  				pdev->name, vasid);
> @@ -69,9 +78,22 @@ static int init_vas_instance(struct platform_device *pdev)
>  
>  	vinst->paste_win_id_shift = 63 - res->end;
>  
> -	pr_devel("Initialized instance [%s, %d], paste_base 0x%llx, "
> -			"paste_win_id_shift 0x%llx\n", pdev->name, vasid,
> -			vinst->paste_base_addr, vinst->paste_win_id_shift);
> +	rc = xive_native_alloc_get_irq_info(chipid, &irq, &port);
> +	if (rc)
> +		return rc;
> +
> +	vinst->virq = irq_create_mapping(NULL, irq);
> +	if (!vinst->virq) {
> +		pr_err("Inst%d: Unable to map global irq %d\n",
> +				vinst->vas_id, irq);
> +		return -EINVAL;
> +	}
> +
> +	vinst->irq_port = port;
> +	pr_devel("Initialized instance [%s, %d] paste_base 0x%llx paste_win_id_shift 0x%llx IRQ %d Port 0x%llx\n",
> +			pdev->name, vasid, vinst->paste_base_addr,
> +			vinst->paste_win_id_shift, vinst->virq,
> +			vinst->irq_port);
>  
>  	for_each_possible_cpu(cpu) {
>  		if (cpu_to_chip_id(cpu) == of_get_ibm_chip_id(dn))
> diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
> index 5574aec..598608b 100644
> --- a/arch/powerpc/platforms/powernv/vas.h
> +++ b/arch/powerpc/platforms/powernv/vas.h
> @@ -313,6 +313,8 @@ struct vas_instance {
>  	u64 paste_base_addr;
>  	u64 paste_win_id_shift;
>  
> +	u64 irq_port;
> +	int virq;
>  	struct mutex mutex;
>  	struct vas_window *rxwin[VAS_COP_TYPE_MAX];
>  	struct vas_window *windows[VAS_WINDOWS_PER_CHIP];
> 

