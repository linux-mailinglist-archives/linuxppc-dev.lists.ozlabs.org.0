Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0F3757A46
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 13:17:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gPeSsNTg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4xJL590Pz3bT1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 21:17:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gPeSsNTg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4xHR5VFnz2ys9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 21:17:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D0B561517;
	Tue, 18 Jul 2023 11:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF81C433C8;
	Tue, 18 Jul 2023 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689679024;
	bh=yneGdhfPaEZqEjHMF7Bs2b9Z1dwhqcI/jj2kSWtUNoc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gPeSsNTgMruHk9A+fr5WRJTky0iJD1ezQpAlhLcLkRHHOP6SqfbohsWVjxEsCkRlt
	 EkmBGlS4Odb86PO4tChrEZB8y8OKdnm4miohb26X27G1SFTEV3/ZRwvdXiWiOFa6L5
	 ggi5wHmvB6/p5ikIOd5Oal8t28QGlczYmIq2GNUaLRJyZADvCRY2tnBV9GGVpJRWYd
	 urPhJIWTkGeXTUg9Z9J++KNh0/uRKvi4iQhfs+NxwY1SEP8hrsf2vl/maX5+wK7lrN
	 4bTVAy2rvm0uuXdWiDKeIszGE2gobh7l/y76QAo1kGzJWpuKtcb0d5eXK855uN3Oc5
	 LrnYpRYaWGYUA==
Date: Tue, 18 Jul 2023 06:17:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v6 2/3] PCI/AER: Disable AER interrupt on suspend
Message-ID: <20230718111702.GA354713@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512000014.118942-2-kai.heng.feng@canonical.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, mika.westerberg@linux.intel.com, linux-pci@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Rafael]

On Fri, May 12, 2023 at 08:00:13AM +0800, Kai-Heng Feng wrote:
> PCIe services that share an IRQ with PME, such as AER or DPC, may cause a
> spurious wakeup on system suspend. To prevent this, disable the AER interrupt
> notification during the system suspend process.

I see that in this particular BZ dmesg log, PME, AER, and DPC do share
the same IRQ, but I don't think this is true in general.

Root Ports usually use MSI or MSI-X.  PME and hotplug events use the
Interrupt Message Number in the PCIe Capability, but AER uses the one
in the AER Root Error Status register, and DPC uses the one in the DPC
Capability register.  Those potentially correspond to three distinct
MSI/MSI-X vectors.

I think this probably has nothing to do with the IRQ being *shared*,
but just that putting the downstream component into D3cold, where the
link state is L3, may cause the upstream component to log and signal a
link-related error as the link goes completely down.

I don't think D0-D3hot should be relevant here because in all those
states, the link should be active because the downstream config space
remains accessible.  So I'm not sure if it's possible, but I wonder if
there's a more targeted place we could do this, e.g., in the path that
puts downstream devices in D3cold.

> As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power Management",
> TLP and DLLP transmission are disabled for a Link in L2/L3 Ready (D3hot), L2
> (D3cold with aux power) and L3 (D3cold) states. So disabling the AER
> notification during suspend and re-enabling them during the resume process
> should not affect the basic functionality.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v6:
> v5:
>  - Wording.
> 
> v4:
> v3:
>  - No change.
> 
> v2:
>  - Only disable AER IRQ.
>  - No more check on PME IRQ#.
>  - Use helper.
> 
>  drivers/pci/pcie/aer.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 1420e1f27105..9c07fdbeb52d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1356,6 +1356,26 @@ static int aer_probe(struct pcie_device *dev)
>  	return 0;
>  }
>  
> +static int aer_suspend(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +	struct pci_dev *pdev = rpc->rpd;
> +
> +	aer_disable_irq(pdev);
> +
> +	return 0;
> +}
> +
> +static int aer_resume(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +	struct pci_dev *pdev = rpc->rpd;
> +
> +	aer_enable_irq(pdev);
> +
> +	return 0;
> +}
> +
>  /**
>   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
>   * @dev: pointer to Root Port, RCEC, or RCiEP
> @@ -1420,6 +1440,8 @@ static struct pcie_port_service_driver aerdriver = {
>  	.service	= PCIE_PORT_SERVICE_AER,
>  
>  	.probe		= aer_probe,
> +	.suspend	= aer_suspend,
> +	.resume		= aer_resume,
>  	.remove		= aer_remove,
>  };
>  
> -- 
> 2.34.1
> 
