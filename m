Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15236570DA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 00:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhfNg6bFkz3cB3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 08:55:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RO7PsVoX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RO7PsVoX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhfN31dJMz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 08:54:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35485612D5;
	Mon, 11 Jul 2022 22:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA47C34115;
	Mon, 11 Jul 2022 22:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657580079;
	bh=xG4WYnt2pDWcAgSjzTQqgeaw1HV6zEbIP5TmSZQv9V4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=RO7PsVoXA2lACTlYaApR1PY+FprRwxwn3Z1jOocown9d/2WeRqXQXyiuNCJ7YA6SL
	 HgZ7N4arbFKjmQkBdue4doz2FDjQhT3tzZmZ0VNudGvZbAjMVHgIXRXh2rKnlwRH81
	 Q3YWaGMm3ZTX85M91QhtsbxE9/Z+8pk7gEeVW+GQmzYVGTuJikGn+gn2npZirHQBg5
	 qvX5ZJ2DrXcT+HH3S2lTYOOg+m163cM7KOX2XLzmlQjSLluBOiz69xKGVNKAEhKEzn
	 JhHkM+xszcqy0PlwilpnBmdIQ81Ngl6NvOVWsK6NkoJgBIPqo19Zjia47d96dY/M5Q
	 xmqu/i5M81GOA==
Date: Mon, 11 Jul 2022 17:54:37 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Subject: Re: [PATCH] PCI/AER: Iterate over error counters instead of error
 strings
Message-ID: <20220711225437.GA703490@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509181441.31884-1-mkhalfella@purestorage.com>
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
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Meeta Saggi <msaggi@purestorage.com>, Eric Badger <ebadger@purestorage.com>, Oliver O'Halloran <oohall@gmail.com>, stable@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI ENHANCED ERROR HANDLING \(EEH\) FOR POWERPC" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 09, 2022 at 06:14:41PM +0000, Mohamed Khalfella wrote:
> PCI AER stats counters sysfs attributes need to iterate over
> stats counters instead of stats names. Also, added a build
> time check to make sure all counters have entries in strings
> array.
> 
> Fixes: 0678e3109a3c ("PCI/AER: Simplify __aer_print_error()")
> Cc: stable@vger.kernel.org
> Reported-by: Meeta Saggi <msaggi@purestorage.com>
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Meeta Saggi <msaggi@purestorage.com>
> Reviewed-by: Eric Badger <ebadger@purestorage.com>

I added some info about why we need this to the commit log and applied
to pci/err for v5.20.  Thank you!

> ---
>  drivers/pci/pcie/aer.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9fa1f97e5b27..ce99a6d44786 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -533,7 +533,7 @@ static const char *aer_agent_string[] = {
>  	u64 *stats = pdev->aer_stats->stats_array;			\
>  	size_t len = 0;							\
>  									\
> -	for (i = 0; i < ARRAY_SIZE(strings_array); i++) {		\
> +	for (i = 0; i < ARRAY_SIZE(pdev->aer_stats->stats_array); i++) {\
>  		if (strings_array[i])					\
>  			len += sysfs_emit_at(buf, len, "%s %llu\n",	\
>  					     strings_array[i],		\
> @@ -1342,6 +1342,11 @@ static int aer_probe(struct pcie_device *dev)
>  	struct device *device = &dev->device;
>  	struct pci_dev *port = dev->port;
>  
> +	BUILD_BUG_ON(ARRAY_SIZE(aer_correctable_error_string) <
> +		     AER_MAX_TYPEOF_COR_ERRS);
> +	BUILD_BUG_ON(ARRAY_SIZE(aer_uncorrectable_error_string) <
> +		     AER_MAX_TYPEOF_UNCOR_ERRS);
> +
>  	/* Limit to Root Ports or Root Complex Event Collectors */
>  	if ((pci_pcie_type(port) != PCI_EXP_TYPE_RC_EC) &&
>  	    (pci_pcie_type(port) != PCI_EXP_TYPE_ROOT_PORT))
> -- 
> 2.29.0
> 
