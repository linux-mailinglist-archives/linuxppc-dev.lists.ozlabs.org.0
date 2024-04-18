Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0531B8AA414
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 22:36:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lqMh5SX8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VL8gl58Phz3dLK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 06:36:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lqMh5SX8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VL8fy6yXDz3cV6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 06:35:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37A24CE188C;
	Thu, 18 Apr 2024 20:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22406C113CC;
	Thu, 18 Apr 2024 20:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713472533;
	bh=/k8CBxtFFxCCrPyB0ZQkRVXX+qR7tZDSRdyejPSOIGs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lqMh5SX89qQB4n0qiw+izwaIkIAQ9m5dPQcveLPH9gV04HsYTxKOqyV8WjIy8YPDm
	 BjMiHFMgSW1lLjFpuhr5b/MKyBGNWBuqzUxQDvHB8FONBTMR1Mx9rd/qZtH2C/QJHh
	 T1WQQnf/Fl3i57nr5m7v09tpEhCH5clUGCA+23zY/B/8P4w5LxBpU6NQPtUA59FhB3
	 4p8O4tUN8AyPthpZOn5UtZ1MbfKcLlxLGSAnRTQ1B7E3NCabGXoeS32keleyGYfETw
	 brXTPMqtDcxieiwey+Qu8NTZlP8WR+aLwPLPYKRTrsiSdgRgDS1+v7eTDwHkRrB5/M
	 HQZsTmxFMiBgQ==
Date: Thu, 18 Apr 2024 15:35:31 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v8 2/3] PCI/AER: Disable AER service on suspend
Message-ID: <20240418203531.GA251408@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416043225.1462548-2-kai.heng.feng@canonical.com>
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
Cc: kch@nvidia.com, regressions@lists.linux.dev, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, kbusch@kernel.org, oohall@gmail.com, hare@suse.de, bagasdotme@gmail.com, bhelgaas@google.com, gloriouseggroll@gmail.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de, sagi@grimberg.me
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 16, 2024 at 12:32:24PM +0800, Kai-Heng Feng wrote:
> When the power rail gets cut off, the hardware can create some electric
> noise on the link that triggers AER. If IRQ is shared between AER with
> PME, such AER noise will cause a spurious wakeup on system suspend.
> 
> When the power rail gets back, the firmware of the device resets itself
> and can create unexpected behavior like sending PTM messages. For this
> case, the driver will always be too late to toggle off features should
> be disabled.
> 
> As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power
> Management", TLP and DLLP transmission are disabled for a Link in L2/L3
> Ready (D3hot), L2 (D3cold with aux power) and L3 (D3cold) states. So if
> the power will be turned off during suspend process, disable AER service
> and re-enable it during the resume process. This should not affect the
> basic functionality.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=209149
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218090
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Thanks for reviving this series.  I tried follow the history about
this, but there are at least two series that were very similar and I
can't put it all together.

> ---
> v8:
>  - Add more bug reports.
> 
> v7:
>  - Wording
>  - Disable AER completely (again) if power will be turned off
> 
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
>  drivers/pci/pcie/aer.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index ac6293c24976..bea7818c2d1b 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -28,6 +28,7 @@
>  #include <linux/delay.h>
>  #include <linux/kfifo.h>
>  #include <linux/slab.h>
> +#include <linux/suspend.h>
>  #include <acpi/apei.h>
>  #include <acpi/ghes.h>
>  #include <ras/ras_event.h>
> @@ -1497,6 +1498,28 @@ static int aer_probe(struct pcie_device *dev)
>  	return 0;
>  }
>  
> +static int aer_suspend(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +	struct pci_dev *pdev = rpc->rpd;
> +
> +	if (pci_ancestor_pr3_present(pdev) || pm_suspend_via_firmware())
> +		aer_disable_rootport(rpc);

Why do we check pci_ancestor_pr3_present(pdev) and
pm_suspend_via_firmware()?  I'm getting pretty convinced that we need
to disable AER interrupts on suspend in general.  I think it will be
better if we do that consistently on all platforms, not special cases
based on details of how we suspend.

Also, why do we use aer_disable_rootport() instead of just
aer_disable_irq()?  I think it's the interrupt that causes issues on
suspend.  I see that there *were* some versions that used
aer_disable_irq(), but I can't find the reason it changed.

> +
> +	return 0;
> +}
> +
> +static int aer_resume(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +	struct pci_dev *pdev = rpc->rpd;
> +
> +	if (pci_ancestor_pr3_present(pdev) || pm_resume_via_firmware())
> +		aer_enable_rootport(rpc);
> +
> +	return 0;
> +}
> +
>  /**
>   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
>   * @dev: pointer to Root Port, RCEC, or RCiEP
> @@ -1561,6 +1584,8 @@ static struct pcie_port_service_driver aerdriver = {
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
