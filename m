Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A896F792B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 00:32:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC7pz6SJzz3g6d
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 08:32:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PZOW2bNn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PZOW2bNn;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC7ZT35Mwz3fXH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 08:21:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC55663A77;
	Thu,  4 May 2023 22:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B66C433D2;
	Thu,  4 May 2023 22:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683238879;
	bh=7Kc7algCg+cDCqRGalh3mPTfejXb43b0Kt7DmPlsmNs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PZOW2bNn4l29ABtndoECuRWDwRVU15U6MlOGyRGHkLJFNRUBA0DjqzWqIrCjXcvXe
	 sP1vLOQyBwkGH6JLWecMhq2/73LoIv5xyN/WGJTfjbwV+IkGCtZ9Kjt/2HfIoabsX3
	 RktSxjG3VNcQKlkOdqMCDy0KkUESuh32ZVhFdw9WQBfgA+mBEF/83jlKYKv3yHVUed
	 Djg0sAc1HN1Dbn3cQEAZy3QsuktR+dBohlPAgC45944tdJQ1Ufat4XzKJeJ8A0b/b0
	 7OPGPIvasflG4X1V0McP+wlK+Ufy3jOOjbQ8jDp9onLzMszNbi5SJBDSftFsqglaiw
	 els535Ug6WLsQ==
Date: Thu, 4 May 2023 17:21:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v8 2/7] PCI: Export PCI link retrain timeout
Message-ID: <20230504222116.GA886747@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2304060110230.13659@angie.orcam.me.uk>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Oliver O'Halloran <oohall@gmail.com>, Stefan Roese <sr@denx.de>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jim Wilson <wilson@tuliptree.org>, Nicholas Piggin <npiggin@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Abdurachmanov <david.abdurachmanov@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Lukas Wunner <lukas@wunner.de>, netdev@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 06, 2023 at 01:21:09AM +0100, Maciej W. Rozycki wrote:
> Rename LINK_RETRAIN_TIMEOUT to PCIE_LINK_RETRAIN_TIMEOUT and make it
> available via "pci.h" for PCI drivers to use.

> +#define PCIE_LINK_RETRAIN_TIMEOUT HZ

This is basically just a rename and move, but since we're touching it
anyway, can we make it "PCIE_LINK_RETRAIN_TIMEOUT_MS 1000" here and
use msecs_to_jiffies() below?

I know jiffies and HZ are probably idiomatic elsewhere in the kernel,
and this particular timeout is arbitrary and not based on anything in
the spec, but many of the delays in PCI *are* straight from a spec, so
I'd like to make the units more explicit.

>  extern const unsigned char pcie_link_speed[];
>  extern bool pci_early_dump;
>  
> Index: linux-macro/drivers/pci/pcie/aspm.c
> ===================================================================
> --- linux-macro.orig/drivers/pci/pcie/aspm.c
> +++ linux-macro/drivers/pci/pcie/aspm.c
> @@ -90,8 +90,6 @@ static const char *policy_str[] = {
>  	[POLICY_POWER_SUPERSAVE] = "powersupersave"
>  };
>  
> -#define LINK_RETRAIN_TIMEOUT HZ
> -
>  /*
>   * The L1 PM substate capability is only implemented in function 0 in a
>   * multi function device.
> @@ -213,7 +211,7 @@ static bool pcie_retrain_link(struct pci
>  	}
>  
>  	/* Wait for link training end. Break out after waiting for timeout */
> -	end_jiffies = jiffies + LINK_RETRAIN_TIMEOUT;
> +	end_jiffies = jiffies + PCIE_LINK_RETRAIN_TIMEOUT;
>  	do {
>  		pcie_capability_read_word(parent, PCI_EXP_LNKSTA, &reg16);
>  		if (!(reg16 & PCI_EXP_LNKSTA_LT))
