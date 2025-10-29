Return-Path: <linuxppc-dev+bounces-13535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DA9C1C8E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 18:47:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxZSN2yW6z2xWc;
	Thu, 30 Oct 2025 04:47:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761760020;
	cv=none; b=OtR5CkKTzo/MSU6qx0zUFcnbGBlMEmo1pzK7hXqwk/jehHvvpGsj4P8PdF6T0f9DztC23SBv6RVPO2PvXhShQZo+qhHGpi82gCNnO9dJoTG/n/djEi29aXdAV/VJ1GdRI2dBKKSndQI/HDsTuDBdW1MFXdy8t2pTmCyCV1oj+E2sVmCUtG9bVN6rXTV49+ytdoMiMfg8ya1e0ksoe//xM+eEJs4jzl0exO0l2LNySzbJlDJYz+aOg3ATg2kNpo8XNkaRZFu+/mx6x57S9PCU29bbSOxFDHSQIJukakS7lgv4fLI2Wu1lK4AlXYrfPdoT1+z/i2+c6ms0FS+BkOl2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761760020; c=relaxed/relaxed;
	bh=5QxpBOteuJW9MIrekz+DfVEWkmSKN9zJbjytZZCL2ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hm98p5x0HGhL84FqBtFH08kJfqrsMqTI5mjXhXkHbYkB0IYiJsEI/mqHBFjjzy+FFM9RXd0tE8+ilLrc9p1apxpPNoIgUWdHotQjerndkdKFkd3M9oy0TBQnqr0YX1iCgtEZLn2RgQL/H9kypgw7pTbiGOQeHILtqJMUVNTARL8wIqz+wV4ixrmFQMFGj1Sgat8A+CZAHmHP+0Num4U0xcO2mwBP3HMkbm56DXR+0dXHCVmowtfKiLD+YxZq8ELbE3jaStTnDG2r7HzH2N+lDCSQILqAn2dYiHXHVZBCJ3t/Jbx+3bagqm2o1xd4zINySXHeplJggFkNkLWWTcG8+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K22XA1Hj; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K22XA1Hj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxZSM11D5z2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 04:46:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3D9E605A2;
	Wed, 29 Oct 2025 17:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202B1C4CEF7;
	Wed, 29 Oct 2025 17:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761760016;
	bh=KsXdySkGiHmSzsuy7Pi+sVL7aoIePP+MEpnzF2GEcmA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=K22XA1Hjw8uOX95mhKKhhconnRdms2qQD/Nbq0dqkODo/qoasd98i4iGIns2To5K7
	 9LCQCwxZ++SdZB2vSAuCJYW4paAjVRKTA4iWkPcqn9ss6ygExiQXqHziIwzmyr+rkW
	 +lIxJgcLxAivPEpWGXWHSqI8/7xdlQzr7QsViTjJuJzP8+wsaPDKG5m+0ZtIalIr/k
	 OungqAalRYCEVyKSHVo57GafE546/x+UVS5pGNUIRUiKo7vIQBPHzK6tyDCTfyy+Hp
	 yAXyomKjaPtaqAImWTBqtWHwQxnW7/jlC878FpiIrVJhNq87HlEksKBMqgKgcyoNJG
	 qk2DTbEtU/sOQ==
Date: Wed, 29 Oct 2025 12:46:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
Message-ID: <20251029174654.GA1571737@bhelgaas>
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
In-Reply-To: <20251029163336.2785270-3-thierry.reding@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 29, 2025 at 05:33:31PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Pass the driver-specific data via the syscore struct and use it in the
> syscore ops.

Would be nice to include the "instead of global variable" part here so
the commit log includes the benefit and can stand alone even without
the subject.

Awesome to get rid of another global variable!  More comments below.

> +++ b/arch/mips/pci/pci-alchemy.c
> @@ -33,6 +33,7 @@
>  
>  struct alchemy_pci_context {
>  	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
> +	struct syscore syscore;
>  	void __iomem *regs;			/* ctrl base */
>  	/* tools for wired entry for config space access */
>  	unsigned long last_elo0;
> @@ -46,12 +47,6 @@ struct alchemy_pci_context {
>  	int (*board_pci_idsel)(unsigned int devsel, int assert);
>  };
>  
> -/* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
> - * should suffice for now.
> - */
> -static struct alchemy_pci_context *__alchemy_pci_ctx;
> -
> -
>  /* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphys_addr
>   * in arch/mips/alchemy/common/setup.c
>   */
> @@ -306,9 +301,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
>  /* save PCI controller register contents. */
>  static int alchemy_pci_suspend(void *data)
>  {
> -	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
> -	if (!ctx)
> -		return 0;
> +	struct alchemy_pci_context *ctx = data;
>  
>  	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
>  	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
> @@ -328,9 +321,7 @@ static int alchemy_pci_suspend(void *data)
>  
>  static void alchemy_pci_resume(void *data)
>  {
> -	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
> -	if (!ctx)
> -		return;
> +	struct alchemy_pci_context *ctx = data;
>  
>  	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
>  	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
> @@ -359,10 +350,6 @@ static const struct syscore_ops alchemy_pci_syscore_ops = {
>  	.resume = alchemy_pci_resume,
>  };
>  
> -static struct syscore alchemy_pci_syscore = {
> -	.ops = &alchemy_pci_syscore_ops,
> -};
> -
>  static int alchemy_pci_probe(struct platform_device *pdev)
>  {
>  	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
> @@ -480,9 +467,10 @@ static int alchemy_pci_probe(struct platform_device *pdev)
>  	__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
>  	wmb();
>  
> -	__alchemy_pci_ctx = ctx;
>  	platform_set_drvdata(pdev, ctx);
> -	register_syscore(&alchemy_pci_syscore);
> +	ctx->syscore.ops = &alchemy_pci_syscore_ops;
> +	ctx->syscore.data = ctx;
> +	register_syscore(&ctx->syscore);

As far as I can tell, the only use of syscore in this driver is for
suspend/resume.

This is a regular platform_device driver, so instead of syscore, I
think it should use generic power management like other PCI host
controller drivers do, something like this:

  static int alchemy_pci_suspend_noirq(struct device *dev)
  ...

  static int alchemy_pci_resume_noirq(struct device *dev)
  ...

  static DEFINE_NOIRQ_DEV_PM_OPS(alchemy_pci_pm_ops,
                                 alchemy_pci_suspend_noirq,
                                 alchemy_pci_resume_noirq);

  static struct platform_driver alchemy_pcictl_driver = {
          .probe          = alchemy_pci_probe,
          .driver = {
                  .name   = "alchemy-pci",
                  .pm     = pm_sleep_ptr(&alchemy_pci_pm_ops),
          },
  };

Here's a sample in another driver:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/cadence/pci-j721e.c?id=v6.17#n663

>  	register_pci_controller(&ctx->alchemy_pci_ctrl);
>  
>  	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
> -- 
> 2.51.0
> 

