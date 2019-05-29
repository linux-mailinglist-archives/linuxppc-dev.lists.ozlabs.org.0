Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B68D32DF47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 16:08:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DXcs45DDzDqJc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 00:08:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="hwPE3sV0"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DXVC4RBkzDqJ7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 00:02:59 +1000 (AEST)
Received: from localhost (173-25-83-245.client.mchsi.com [173.25.83.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A8B823402;
 Wed, 29 May 2019 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559138577;
 bh=0tSTYoMlHTVZxSrDog0lJVqBtj8J4qQgEtdzSomSTZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hwPE3sV0wXedjVr2aCpquvp1LlpXrqHZxg6pcjxrIWPJnAL89WxJloIzstRSR3/fP
 qVENpoMlU08Pz8ufgiUfRIDhOJejZEckw5R5QAGerIRKFXdg9N74E2PtvMpan7kL2K
 9Vn44KtWtwtDC4BiiJqeIgClHffjxPlDQz3boADc=
Date: Wed, 29 May 2019 09:02:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shawn Anastasio <shawn@anastas.io>
Subject: Re: [PATCH v3 3/3] powerpc/pseries: Allow user-specified PCI
 resource alignment after init
Message-ID: <20190529140256.GC28250@google.com>
References: <20190528040313.35582-1-shawn@anastas.io>
 <20190528040313.35582-4-shawn@anastas.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528040313.35582-4-shawn@anastas.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sbobroff@linux.ibm.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com, paulus@samba.org,
 xyjxie@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2019 at 11:03:13PM -0500, Shawn Anastasio wrote:
> On pseries, custom PCI resource alignment specified with the commandline
> argument pci=resource_alignment is disabled due to PCI resources being
> managed by the firmware. However, in the case of PCI hotplug the
> resources are managed by the kernel, so custom alignments should be
> honored in these cases. This is done by only honoring custom
> alignments after initial PCI initialization is done, to ensure that
> all devices managed by the firmware are excluded.
> 
> Without this ability, sub-page BARs sometimes get mapped in between
> page boundaries for hotplugged devices and are therefore unusable
> with the VFIO framework. This change allows users to request
> page alignment for devices they wish to access via VFIO using
> the pci=resource_alignment commandline argument.
> 
> In the future, this could be extended to provide page-aligned
> resources by default for hotplugged devices, similar to what is
> done on powernv by commit 382746376993 ("powerpc/powernv: Override
> pcibios_default_alignment() to force PCI devices to be page aligned")
> 
> Signed-off-by: Shawn Anastasio <shawn@anastas.io>
> ---
>  arch/powerpc/include/asm/machdep.h     |  3 +++
>  arch/powerpc/kernel/pci-common.c       |  9 +++++++++
>  arch/powerpc/platforms/pseries/setup.c | 22 ++++++++++++++++++++++
>  3 files changed, 34 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
> index 2fbfaa9176ed..46eb62c0954e 100644
> --- a/arch/powerpc/include/asm/machdep.h
> +++ b/arch/powerpc/include/asm/machdep.h
> @@ -179,6 +179,9 @@ struct machdep_calls {
>  
>  	resource_size_t (*pcibios_default_alignment)(void);
>  
> +	/* Called when determining PCI resource alignment */
> +	int (*pcibios_ignore_alignment_request)(void);
> +
>  #ifdef CONFIG_PCI_IOV
>  	void (*pcibios_fixup_sriov)(struct pci_dev *pdev);
>  	resource_size_t (*pcibios_iov_resource_alignment)(struct pci_dev *, int resno);
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index ff4b7539cbdf..8e0d73b4c188 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -238,6 +238,15 @@ resource_size_t pcibios_default_alignment(void)
>  	return 0;
>  }
>  
> +int pcibios_ignore_alignment_request(void)
> +{
> +	if (ppc_md.pcibios_ignore_alignment_request)
> +		return ppc_md.pcibios_ignore_alignment_request();
> +
> +	/* Fall back to default method of checking PCI_PROBE_ONLY */
> +	return pci_has_flag(PCI_PROBE_ONLY);
> +}
> +
>  #ifdef CONFIG_PCI_IOV
>  resource_size_t pcibios_iov_resource_alignment(struct pci_dev *pdev, int resno)
>  {
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index e4f0dfd4ae33..07f03be02afe 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -82,6 +82,8 @@ EXPORT_SYMBOL(CMO_PageSize);
>  
>  int fwnmi_active;  /* TRUE if an FWNMI handler is present */
>  
> +static int initial_pci_init_done; /* TRUE if initial pcibios init has completed */
> +
>  static void pSeries_show_cpuinfo(struct seq_file *m)
>  {
>  	struct device_node *root;
> @@ -749,6 +751,23 @@ static resource_size_t pseries_pci_iov_resource_alignment(struct pci_dev *pdev,
>  }
>  #endif
>  
> +static void pseries_after_init(void)
> +{
> +	initial_pci_init_done = 1;
> +}
> +
> +static int pseries_ignore_alignment_request(void)
> +{
> +	if (initial_pci_init_done)
> +		/*
> +		 * Allow custom alignments after init for things
> +		 * like PCI hotplugging.
> +		 */
> +		return 0;

Hmm, if there's any way to avoid this sort of early/late flag, that
would be nicer.

> +
> +	return pci_has_flag(PCI_PROBE_ONLY);
> +}
> +
>  static void __init pSeries_setup_arch(void)
>  {
>  	set_arch_panic_timeout(10, ARCH_PANIC_TIMEOUT);
> @@ -797,6 +816,9 @@ static void __init pSeries_setup_arch(void)
>  	}
>  
>  	ppc_md.pcibios_root_bridge_prepare = pseries_root_bridge_prepare;
> +	ppc_md.pcibios_after_init = pseries_after_init;
> +	ppc_md.pcibios_ignore_alignment_request =
> +		pseries_ignore_alignment_request;
>  }
>  
>  static void pseries_panic(char *str)
> -- 
> 2.20.1
> 
