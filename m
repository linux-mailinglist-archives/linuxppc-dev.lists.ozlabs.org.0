Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7287F21AA44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 00:07:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2qzv1kGDzDrBx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 08:07:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=hOh4lvO6; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2qxq0G38zDrBj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 08:06:06 +1000 (AEST)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7E91206A1;
 Thu,  9 Jul 2020 22:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594332364;
 bh=1E3KNYJwxzhk32vkxEFceHo/gsiJzSp6Aq70IvYmWQI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=hOh4lvO6KVrS6aI6+Ob+ftOEskN/RvK0Afz3UgwW9FW6/2X96hxs19EqA5He/U1bA
 +xP3oo0uep2m07nZQ4vYHju3ZIIj7vIK3v1ta6WdtVWZhpBWYnFslhv0cuX8rFBdem
 rfOv/uGGLlBSdNUzbFcGYr7H8NrfRXMLQFKOoWok=
Date: Thu, 9 Jul 2020 17:06:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Matt Jolly <Kangie@footclan.ninja>
Subject: Re: [PATCH 2/2] PCI/AER: Log correctable errors as warning, not error
Message-ID: <20200709220602.GA21872@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708001401.405749-2-helgaas@kernel.org>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 07, 2020 at 07:14:01PM -0500, Bjorn Helgaas wrote:
> From: Matt Jolly <Kangie@footclan.ninja>
> 
> PCIe correctable errors are recovered by hardware with no need for software
> intervention (PCIe r5.0, sec 6.2.2.1).
> 
> Reduce the log level of correctable errors from KERN_ERR to KERN_WARNING.
> 
> The bug reports below are for correctable error logging.  This doesn't fix
> the cause of those reports, but it may make the messages less alarming.
> 
> [bhelgaas: commit log, use pci_printk() to avoid code duplication]
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=201517
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=196183
> Link: https://lore.kernel.org/r/20200618155511.16009-1-Kangie@footclan.ninja
> Signed-off-by: Matt Jolly <Kangie@footclan.ninja>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

I applied both of these to pci/error for v5.9.

> ---
>  drivers/pci/pcie/aer.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9176c8a968b9..ca886bf91fd9 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -673,20 +673,23 @@ static void __aer_print_error(struct pci_dev *dev,
>  {
>  	const char **strings;
>  	unsigned long status = info->status & ~info->mask;
> -	const char *errmsg;
> +	const char *level, *errmsg;
>  	int i;
>  
> -	if (info->severity == AER_CORRECTABLE)
> +	if (info->severity == AER_CORRECTABLE) {
>  		strings = aer_correctable_error_string;
> -	else
> +		level = KERN_WARNING;
> +	} else {
>  		strings = aer_uncorrectable_error_string;
> +		level = KERN_ERR;
> +	}
>  
>  	for_each_set_bit(i, &status, 32) {
>  		errmsg = strings[i];
>  		if (!errmsg)
>  			errmsg = "Unknown Error Bit";
>  
> -		pci_err(dev, "   [%2d] %-22s%s\n", i, errmsg,
> +		pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
>  				info->first_error == i ? " (First)" : "");
>  	}
>  	pci_dev_aer_stats_incr(dev, info);
> @@ -696,6 +699,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  {
>  	int layer, agent;
>  	int id = ((dev->bus->number << 8) | dev->devfn);
> +	const char *level;
>  
>  	if (!info->status) {
>  		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
> @@ -706,13 +710,14 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
>  	agent = AER_GET_AGENT(info->severity, info->status);
>  
> -	pci_err(dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
> -		aer_error_severity_string[info->severity],
> -		aer_error_layer[layer], aer_agent_string[agent]);
> +	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
> +
> +	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
> +		   aer_error_severity_string[info->severity],
> +		   aer_error_layer[layer], aer_agent_string[agent]);
>  
> -	pci_err(dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
> -		dev->vendor, dev->device,
> -		info->status, info->mask);
> +	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
> +		   dev->vendor, dev->device, info->status, info->mask);
>  
>  	__aer_print_error(dev, info);
>  
> -- 
> 2.25.1
> 
