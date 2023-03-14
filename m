Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D410B6B9FE3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 20:39:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbkPD5GZrz3chc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 06:39:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I9km03sX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I9km03sX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbkNL3x5Sz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 06:38:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E254461949;
	Tue, 14 Mar 2023 19:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25ECDC433D2;
	Tue, 14 Mar 2023 19:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678822718;
	bh=3+V1pKTfYWFWmjqOFqVdDdC4tTouiVDOGiEv363JWvY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=I9km03sXN9xXbCChj5UeJCnTkUyZt+DNK9+bgZmjTRrZDahM0WLCSKYgNL0UF9tCT
	 6i7UbNjcM38FTZrcUiqN6p0Lol6qjweCnKaaRGFzrZgWXvRXq8GIujII5H1OBzeJaI
	 3ISfjee4pjLQ6nJYG8GD/LIOK6BfWZJ19kN0UucY9WDyJS8u83TO9A6Yi8Cmw5+KiN
	 Yy0emReq7BbaxYq9LZKuAz9GgBw0zTV2BQlpQr6LvYO737joo79SlKGOoxz7w/2EQB
	 zCzOl46G0Ip6V73eKPwH/0qSH3uIRbtAYC3WMMMIxRd/+3Cy57YfOcS9Radv/565Qj
	 AjQvOLWp7e1TA==
Date: Tue, 14 Mar 2023 14:38:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Grant Grundler <grundler@chromium.org>
Subject: Re: [PATCH] PCI/AER: correctable error message as KERN_INFO
Message-ID: <20230314193836.GA1667748@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301060453.4031503-1-grundler@chromium.org>
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 28, 2023 at 10:04:53PM -0800, Grant Grundler wrote:
> Since correctable errors have been corrected (and counted), the dmesg output
> should not be reported as a warning, but rather as "informational".
> 
> Otherwise, using a certain well known vendor's PCIe parts in a USB4 docking
> station, the dmesg buffer can be spammed with correctable errors, 717 bytes
> per instance, potentially many MB per day.
> 
> Given the "WARN" priority, these messages have already confused the typical
> user that stumbles across them, support staff (triaging feedback reports),
> and more than a few linux kernel devs. Changing to INFO will hide these
> messages from most audiences.
> 
> Signed-off-by: Grant Grundler <grundler@chromium.org>
> ---
> This patch will likely conflict with:
>   https://lore.kernel.org/all/20230103165548.570377-1-rajat.khandelwal@linux.intel.com/
> 
> which I'd also like to see upstream. Please let me know to resubmit
> mine if Rajat's patch lands first. Or feel free to fix up this one.

Yes.  I think it makes sense to separate this into two patches:

  1) Log correctable errors as KERN_INFO instead of KERN_WARNING, and

  2) Rate-limit correctable error logging.

>  drivers/pci/pcie/aer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f6c24ded134c..e4cf3ec40d66 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -692,7 +692,7 @@ static void __aer_print_error(struct pci_dev *dev,
>  
>  	if (info->severity == AER_CORRECTABLE) {
>  		strings = aer_correctable_error_string;
> -		level = KERN_WARNING;
> +		level = KERN_INFO;
>  	} else {
>  		strings = aer_uncorrectable_error_string;
>  		level = KERN_ERR;
> @@ -724,7 +724,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
>  	agent = AER_GET_AGENT(info->severity, info->status);
>  
> -	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
> +	level = (info->severity == AER_CORRECTABLE) ? KERN_INFO : KERN_ERR;
>  
>  	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
>  		   aer_error_severity_string[info->severity],

Shouldn't we do the same in the cper_print_aer() path?  That path
currently uses pci_err() and then calls __aer_print_error(), so the
initial message will always be KERN_ERR, and the decoding done by
__aer_print_error() will be KERN_INFO (for correctable) or KERN_ERR.

Seems like a shame to do the same test in three places, but would
require a little more refactoring to avoid that.

Bjorn
