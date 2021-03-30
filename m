Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8BA34ED52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 18:18:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8vl24kjMz3c72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:18:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.32.156; helo=3.mo51.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 3.mo51.mail-out.ovh.net (3.mo51.mail-out.ovh.net
 [188.165.32.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8vkj1tnjz2xgL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 03:18:18 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.221])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 9E1D627A6C7;
 Tue, 30 Mar 2021 18:18:12 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 30 Mar
 2021 18:18:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0031ab479b5-61ac-4c8b-a111-359497f25be2,
 BD393B37FFA6B31F87E0C0B882DE4EAD25EC4818) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.210.153.104
Subject: Re: [PATCH v2 8/8] powerpc/xive: Map one IPI interrupt per node
To: <linuxppc-dev@lists.ozlabs.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-9-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2eccd988-a017-7b61-5dc2-08589b9ff26e@kaod.org>
Date: Tue, 30 Mar 2021 18:18:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303174857.1760393-9-clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e97cc467-89a9-40ca-a968-56051296b2bf
X-Ovh-Tracer-Id: 5711690229700463581
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehuedtheeghfdvhedtueelteegvdefueektdefiefhffffieduuddtudfhgfevtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/3/21 6:48 PM, Cédric Le Goater wrote:
> ipistorm [*] can be used to benchmark the raw interrupt rate of an
> interrupt controller by measuring the number of IPIs a system can
> sustain. When applied to the XIVE interrupt controller of POWER9 and
> POWER10 systems, a significant drop of the interrupt rate can be
> observed when crossing the second node boundary.
> 
> This is due to the fact that a single IPI interrupt is used for all
> CPUs of the system. The structure is shared and the cache line updates
> impact greatly the traffic between nodes and the overall IPI
> performance.
> 
> As a workaround, the impact can be reduced by deactivating the IRQ
> lockup detector ("noirqdebug") which does a lot of accounting in the
> Linux IRQ descriptor structure and is responsible for most of the
> performance penalty.
> 
> As a fix, this proposal allocates an IPI interrupt per node, to be
> shared by all CPUs of that node. It solves the scaling issue, the IRQ
> lockup detector still has an impact but the XIVE interrupt rate scales
> linearly. It also improves the "noirqdebug" case as showed in the
> tables below.
> 
>  * P9 DD2.2 - 2s * 64 threads
> 
>                                                "noirqdebug"
>                         Mint/s                    Mint/s
>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys
>  --------------------------------------------------------------
>  1      0-15     4.984023   4.875405       4.996536   5.048892
>         0-31    10.879164  10.544040      10.757632  11.037859
>         0-47    15.345301  14.688764      14.926520  15.310053
>         0-63    17.064907  17.066812      17.613416  17.874511
>  2      0-79    11.768764  21.650749      22.689120  22.566508
>         0-95    10.616812  26.878789      28.434703  28.320324
>         0-111   10.151693  31.397803      31.771773  32.388122
>         0-127    9.948502  33.139336      34.875716  35.224548
> 
>  * P10 DD1 - 4s (not homogeneous) 352 threads
> 
>                                                "noirqdebug"
>                         Mint/s                    Mint/s
>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys
>  --------------------------------------------------------------
>  1      0-15     2.409402   2.364108       2.383303   2.395091
>         0-31     6.028325   6.046075       6.089999   6.073750
>         0-47     8.655178   8.644531       8.712830   8.724702
>         0-63    11.629652  11.735953      12.088203  12.055979
>         0-79    14.392321  14.729959      14.986701  14.973073
>         0-95    12.604158  13.004034      17.528748  17.568095
>  2      0-111    9.767753  13.719831      19.968606  20.024218
>         0-127    6.744566  16.418854      22.898066  22.995110
>         0-143    6.005699  19.174421      25.425622  25.417541
>         0-159    5.649719  21.938836      27.952662  28.059603
>         0-175    5.441410  24.109484      31.133915  31.127996
>  3      0-191    5.318341  24.405322      33.999221  33.775354
>         0-207    5.191382  26.449769      36.050161  35.867307
>         0-223    5.102790  29.356943      39.544135  39.508169
>         0-239    5.035295  31.933051      42.135075  42.071975
>         0-255    4.969209  34.477367      44.655395  44.757074
>  4      0-271    4.907652  35.887016      47.080545  47.318537
>         0-287    4.839581  38.076137      50.464307  50.636219
>         0-303    4.786031  40.881319      53.478684  53.310759
>         0-319    4.743750  43.448424      56.388102  55.973969
>         0-335    4.709936  45.623532      59.400930  58.926857
>         0-351    4.681413  45.646151      62.035804  61.830057
> 
> [*] https://github.com/antonblanchard/ipistorm
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/sysdev/xive/xive-internal.h |  2 --
>  arch/powerpc/sysdev/xive/common.c        | 39 ++++++++++++++++++------
>  2 files changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysdev/xive/xive-internal.h
> index 9cf57c722faa..b3a456fdd3a5 100644
> --- a/arch/powerpc/sysdev/xive/xive-internal.h
> +++ b/arch/powerpc/sysdev/xive/xive-internal.h
> @@ -5,8 +5,6 @@
>  #ifndef __XIVE_INTERNAL_H
>  #define __XIVE_INTERNAL_H
>  
> -#define XIVE_IPI_HW_IRQ		0 /* interrupt source # for IPIs */
> -
>  /*
>   * A "disabled" interrupt should never fire, to catch problems
>   * we set its logical number to this
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index 8eefd152b947..c27f7bb0494b 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -65,8 +65,16 @@ static struct irq_domain *xive_irq_domain;
>  #ifdef CONFIG_SMP
>  static struct irq_domain *xive_ipi_irq_domain;
>  
> -/* The IPIs all use the same logical irq number */
> -static u32 xive_ipi_irq;
> +/* The IPIs use the same logical irq number when on the same chip */
> +static struct xive_ipi_desc {
> +	unsigned int irq;
> +	char name[8]; /* enough bytes to fit IPI-XXX */
> +} *xive_ipis;
> +
> +static unsigned int xive_ipi_cpu_to_irq(unsigned int cpu)
> +{
> +	return xive_ipis[cpu_to_node(cpu)].irq;

This should be using early_cpu_to_node() for hotplugged CPU, else the CPU IPI 
will be mapped on default node 0. Still works but this is not what we want. 

> +}
>  #endif
>  
>  /* Xive state for each CPU */
> @@ -1106,25 +1114,36 @@ static const struct irq_domain_ops xive_ipi_irq_domain_ops = {
>  
>  static void __init xive_request_ipi(void)
>  {
> -	unsigned int virq;
> +	unsigned int node;
>  
> -	xive_ipi_irq_domain = irq_domain_add_linear(NULL, 1,
> +	xive_ipi_irq_domain = irq_domain_add_linear(NULL, nr_node_ids,
>  						    &xive_ipi_irq_domain_ops, NULL);
>  	if (WARN_ON(xive_ipi_irq_domain == NULL))
>  		return;
>  
> -	/* Initialize it */
> -	virq = irq_create_mapping(xive_ipi_irq_domain, XIVE_IPI_HW_IRQ);
> -	xive_ipi_irq = virq;
> +	xive_ipis = kcalloc(nr_node_ids, sizeof(*xive_ipis), GFP_KERNEL | __GFP_NOFAIL);
> +	for_each_node(node) {
> +		struct xive_ipi_desc *xid = &xive_ipis[node];
> +		irq_hw_number_t node_ipi_hwirq = node;

There, we need to filter cpu-less nodes. There is no need to allocate IPIs
for these.

> +		/*
> +		 * Map one IPI interrupt per node for all cpus of that node.
> +		 * Since the HW interrupt number doesn't have any meaning,
> +		 * simply use the node number.
> +		 */
> +		xid->irq = irq_create_mapping(xive_ipi_irq_domain, node_ipi_hwirq);
> +		snprintf(xid->name, sizeof(xid->name), "IPI-%d", node);

and this mapping needs some modernization. If we use a domain allocator, the 
IPI irq descriptor will be allocated on the node it is serving which is even 
better for cache performance.

I will send a v3 with these changes.

C.

> -	WARN_ON(request_irq(virq, xive_muxed_ipi_action,
> -			    IRQF_PERCPU | IRQF_NO_THREAD, "IPI", NULL));
> +		WARN_ON(request_irq(xid->irq, xive_muxed_ipi_action,
> +				    IRQF_PERCPU | IRQF_NO_THREAD, xid->name, NULL));
> +	}
>  }
>  
>  static int xive_setup_cpu_ipi(unsigned int cpu)
>  {
>  	struct xive_cpu *xc;
>  	int rc;
> +	unsigned int xive_ipi_irq = xive_ipi_cpu_to_irq(cpu);
>  
>  	pr_debug("Setting up IPI for CPU %d\n", cpu);
>  
> @@ -1165,6 +1184,8 @@ static int xive_setup_cpu_ipi(unsigned int cpu)
>  
>  static void xive_cleanup_cpu_ipi(unsigned int cpu, struct xive_cpu *xc)
>  {
> +	unsigned int xive_ipi_irq = xive_ipi_cpu_to_irq(cpu);
> +
>  	/* Disable the IPI and free the IRQ data */
>  
>  	/* Already cleaned up ? */
> 

