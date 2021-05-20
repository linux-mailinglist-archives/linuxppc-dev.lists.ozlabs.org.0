Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9A338AFB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:10:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm98s4TF7z3btn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:10:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.49.222; helo=6.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 2117 seconds by postgrey-1.36 at boromir;
 Thu, 20 May 2021 23:10:31 AEST
Received: from 6.mo52.mail-out.ovh.net (6.mo52.mail-out.ovh.net
 [188.165.49.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm98R3gQ8z2xts
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:10:30 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.141])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id A9789278C15;
 Thu, 20 May 2021 14:33:52 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Thu, 20 May
 2021 14:33:51 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0034b3e5fb3-78e8-4702-a242-a6f448bdfd52,
 2C87984337330801490BFDABE922B5CE11A7A10A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 176.145.65.252
Subject: Re: [PATCH 09/31] powerpc/pseries/pci: Add a msi_free() handler to
 clear XIVE data
To: <linuxppc-dev@lists.ozlabs.org>
References: <20210430080407.4030767-1-clg@kaod.org>
 <20210430080407.4030767-10-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <04d8db4a-b156-1d60-be86-dbe9ac60c6c3@kaod.org>
Date: Thu, 20 May 2021 14:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210430080407.4030767-10-clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: df1a922f-5310-426b-876c-a3303906ec20
X-Ovh-Tracer-Id: 6282521483775937504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adding Marc.

On 4/30/21 10:03 AM, Cédric Le Goater wrote:
> The MSI domain clears the IRQ with msi_domain_free(), which calls
> irq_domain_free_irqs_top(), which clears the handler data. This is a
> problem for the XIVE controller since we need to unmap MMIO pages and
> free a specific XIVE structure.
> 
> The 'msi_free()' handler is called before irq_domain_free_irqs_top()
> when the handler data is still available. Use that to clear the XIVE
> controller data.
This feels like a clumsy way of doing so. 

irq_domain_free_irqs_parent() would be my preferred way to clear the 
lowlevel handler data but we can't today. Could there be a smarter way ?

Thanks,

C.


> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>
> ---
>  arch/powerpc/include/asm/xive.h      |  1 +
>  arch/powerpc/platforms/pseries/msi.c | 16 +++++++++++++++-
>  arch/powerpc/sysdev/xive/common.c    |  5 ++++-
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
> index aa094a8655b0..20ae50ab083c 100644
> --- a/arch/powerpc/include/asm/xive.h
> +++ b/arch/powerpc/include/asm/xive.h
> @@ -111,6 +111,7 @@ void xive_native_free_vp_block(u32 vp_base);
>  int xive_native_populate_irq_data(u32 hw_irq,
>  				  struct xive_irq_data *data);
>  void xive_cleanup_irq_data(struct xive_irq_data *xd);
> +void xive_irq_free_data(unsigned int virq);
>  void xive_native_free_irq(u32 irq);
>  int xive_native_configure_irq(u32 hw_irq, u32 target, u8 prio, u32 sw_irq);
>  
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index a41c448520d4..da9d63a088bb 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -529,6 +529,19 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
>  	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
>  }
>  
> +/*
> + * ->msi_free() is called before irq_domain_free_irqs_top() when the
> + * handler data is still available. Use that to clear the XIVE
> + * controller data.
> + */
> +static void pseries_msi_ops_msi_free(struct irq_domain *domain,
> +				     struct msi_domain_info *info,
> +				     unsigned int irq)
> +{
> +	if (xive_enabled())
> +		xive_irq_free_data(irq);
> +}
> +
>  /*
>   * RTAS can not disable one MSI at a time. It's all or nothing. Do it
>   * at the end after all IRQs have been freed.
> @@ -546,6 +559,7 @@ static void pseries_msi_domain_free_irqs(struct irq_domain *domain,
>  
>  static struct msi_domain_ops pseries_pci_msi_domain_ops = {
>  	.msi_prepare	= pseries_msi_ops_prepare,
> +	.msi_free	= pseries_msi_ops_msi_free,
>  	.domain_free_irqs = pseries_msi_domain_free_irqs,
>  };
>  
> @@ -660,7 +674,7 @@ static void pseries_irq_domain_free(struct irq_domain *domain, unsigned int virq
>  
>  	pr_debug("%s bridge %pOF %d #%d\n", __func__, phb->dn, virq, nr_irqs);
>  
> -	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> +	/* XIVE domain data is cleared through ->msi_free() */
>  }
>  
>  static const struct irq_domain_ops pseries_irq_domain_ops = {
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index 3485baf9ec8c..191cd80ec534 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -980,6 +980,8 @@ EXPORT_SYMBOL_GPL(is_xive_irq);
>  
>  void xive_cleanup_irq_data(struct xive_irq_data *xd)
>  {
> +	pr_debug("%s for HW %x\n", __func__, xd->hw_irq);
> +
>  	if (xd->eoi_mmio) {
>  		unmap_kernel_range((unsigned long)xd->eoi_mmio,
>  				   1u << xd->esb_shift);
> @@ -1025,7 +1027,7 @@ static int xive_irq_alloc_data(unsigned int virq, irq_hw_number_t hw)
>  	return 0;
>  }
>  
> -static void xive_irq_free_data(unsigned int virq)
> +void xive_irq_free_data(unsigned int virq)
>  {
>  	struct xive_irq_data *xd = irq_get_handler_data(virq);
>  
> @@ -1035,6 +1037,7 @@ static void xive_irq_free_data(unsigned int virq)
>  	xive_cleanup_irq_data(xd);
>  	kfree(xd);
>  }
> +EXPORT_SYMBOL_GPL(xive_irq_free_data);
>  
>  #ifdef CONFIG_SMP
>  
> 

