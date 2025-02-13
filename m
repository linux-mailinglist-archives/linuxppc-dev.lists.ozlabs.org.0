Return-Path: <linuxppc-dev+bounces-6159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2BA350FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 23:10:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yv8Ws4QT6z3091;
	Fri, 14 Feb 2025 09:10:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739484649;
	cv=none; b=W/4CrrCfF625pUmD4/74vI5ziR9LMUwS373Fq6+E/EqiVGZKkrNLemQ4N+tG18At8KZJpb9+1WwMz3++jM0YyByftUbszAI0ih/N0qSj7fHbNXQ7DFTqsCG21NQ0LNALs7um00pRJ36nTy+5PSio8O1HHsmS0QpxJN/pD8AhT6JCEmcGsciMRuNSruRm6ImiwWrGrQbssCYQACIdR0Mg2fAJ/kmBcXRmMfyFUuGjsPcAMOpvKsQFXqw5JsGouhNpwnghs7J8zFEg8L090xblr525fK5+qy1x9LsPZdh/NJEErtPjdJHmHAbTgTzGMScKjrI3SaAvgQ+ePTa2xlhLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739484649; c=relaxed/relaxed;
	bh=akKBp3QQD2PbBnc5eXICI8982DJzPuWkmAbZm7WFe34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NwSfyqFF4DAVPoQTsQtXL2JUU/NDKY9yodwqRPaS81snNZplP7FOApZ0YDhZgYDfxSvEi08XtRG4B5tUHy3FcP8Li688QgjVOkaG9BEX2375qiO4c2p0BKVKsQaCucRRTYbTQsesIH8LfuqEW5WWBJMJiVwhJ5BWww9HEl4nXlWdr1hA3/6IHL72yx2uM9692/isXvdelV8ns2zifK8vriMJn5bwW5u9EdmFBOP2WjDWkVUheIuJvyzalrsvi1Ew+c37GBEu+FYHXwxczg9AA4UwaHHzWCdw9/kUjeFaInWSovCSs0/BJUsVv0kyGEnA3lZ8i9vdyxN2kA9f2fs32w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B2evO8Fl; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B2evO8Fl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yv8Wr58TNz3054
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 09:10:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72764A42584;
	Thu, 13 Feb 2025 22:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D83FC4CED1;
	Thu, 13 Feb 2025 22:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739484645;
	bh=SOvHEA/CRJXJgXuokc//mSA8/PswxFWkOifChOXjk50=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=B2evO8FlqWDQGTpnPn9pO+9+08ZJu0HcEjcVGn2ea0HwBI5gyNvfjfBmeUT2GTvWr
	 F0yw4oJ0bJn7lGpEKH9Fw6aEWLR5WSRSfMckrsaDo8xQo4Zm05bjm8COWcOLegjPqI
	 YRG2Lz1gVtwI0bar1pMWhnvQVQF+eJP1sHF7g4vJgX3uYWbCMoBOhTSEGXOzRHDL8/
	 P7gBOPGY8OxDqDARSujkwoIkmQDMEDDWuRgtm+cQcKNZF/uDy5Lo11D4+JzSRh7t6y
	 Yt3pMzRxEOYeijcOw/kZ/WdeZ47+YHmBqq3dxZrOfc30lSzOSdBqD/Onh8H4nMkwGL
	 05Mz2pAdpLmUw==
Date: Thu, 13 Feb 2025 16:10:43 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] PCI: Descope pci_printk() to aer_printk()
Message-ID: <20250213221043.GA136196@bhelgaas>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216161012.1774-5-ilpo.jarvinen@linux.intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 16, 2024 at 06:10:12PM +0200, Ilpo Järvinen wrote:
> include/linux/pci.h provides low-level pci_printk() interface that is
> only used by AER because it needs to print the same message with
> different levels depending on the error severity. No other PCI code
> uses that functionality and calls pci_<level>() logging functions
> directly with the appropriate level.
> 
> Descope pci_printk() into AER as aer_printk().
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

I applied this patch by itself on pci/aer for v6.15.

We also have some work-in-progress on rate limiting errors, which
might conflict, but this is simple and shouldn't be hard to reconcile.

> ---
>  drivers/pci/pcie/aer.c | 10 +++++++---
>  include/linux/pci.h    |  3 ---
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 80c5ba8d8296..bfc6b94dad4d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -17,6 +17,7 @@
>  
>  #include <linux/bitops.h>
>  #include <linux/cper.h>
> +#include <linux/dev_printk.h>
>  #include <linux/pci.h>
>  #include <linux/pci-acpi.h>
>  #include <linux/sched.h>
> @@ -35,6 +36,9 @@
>  #include "../pci.h"
>  #include "portdrv.h"
>  
> +#define aer_printk(level, pdev, fmt, arg...) \
> +	dev_printk(level, &(pdev)->dev, fmt, ##arg)
> +
>  #define AER_ERROR_SOURCES_MAX		128
>  
>  #define AER_MAX_TYPEOF_COR_ERRS		16	/* as per PCI_ERR_COR_STATUS */
> @@ -692,7 +696,7 @@ static void __aer_print_error(struct pci_dev *dev,
>  		if (!errmsg)
>  			errmsg = "Unknown Error Bit";
>  
> -		pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
> +		aer_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
>  				info->first_error == i ? " (First)" : "");
>  	}
>  	pci_dev_aer_stats_incr(dev, info);
> @@ -715,11 +719,11 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  
>  	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
>  
> -	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
> +	aer_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
>  		   aer_error_severity_string[info->severity],
>  		   aer_error_layer[layer], aer_agent_string[agent]);
>  
> -	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
> +	aer_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
>  		   dev->vendor, dev->device, info->status, info->mask);
>  
>  	__aer_print_error(dev, info);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index db9b47ce3eef..02d23e795915 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2685,9 +2685,6 @@ void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
>  
>  #include <linux/dma-mapping.h>
>  
> -#define pci_printk(level, pdev, fmt, arg...) \
> -	dev_printk(level, &(pdev)->dev, fmt, ##arg)
> -
>  #define pci_emerg(pdev, fmt, arg...)	dev_emerg(&(pdev)->dev, fmt, ##arg)
>  #define pci_alert(pdev, fmt, arg...)	dev_alert(&(pdev)->dev, fmt, ##arg)
>  #define pci_crit(pdev, fmt, arg...)	dev_crit(&(pdev)->dev, fmt, ##arg)
> -- 
> 2.39.5
> 

