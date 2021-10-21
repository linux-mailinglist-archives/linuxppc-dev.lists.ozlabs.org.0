Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3243583B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 03:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZVHV3pz4z303f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 12:28:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HYfFdUOL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HYfFdUOL; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZVGs2mqQz2yHw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 12:28:05 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10C33610D0;
 Thu, 21 Oct 2021 01:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634779682;
 bh=581D5arqTdICaxjPymvl/NeoZRuwRu4qgW9ioIvz0pA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=HYfFdUOLbIbTRC5R74jDV06L85sng277gtjuYVk7lWQC/lhKvcWc2ipBS3m89EiBU
 W94lNQM8jkuVIZee/uDff4yYuH1mbb5dNn5D7ldlusXiMy4BnXI11vJVXZb/y1+l+i
 UabtyFWkDR4QnUPvVZQ+MVxfZm/Zlqu6koy7Af8/wb4EdnHS5lPDOoty8dZkQ3xrsZ
 WHncjxH5nyVClzzGpBGIrUiEFQ626FpucYnLUuJMfvjy0rJ61B17bPkeDMc3+pfXdT
 iGg7Jy1inIkQRUbadjB7uwMIyJ7dOGdyzo1ztoUqd7L0ItcoKNILWhu2a0LbSDB4Kt
 w/klqSqaCmEZQ==
Date: Wed, 20 Oct 2021 20:28:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v4 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
Message-ID: <20211021012800.GA2656128@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ebe87f18339d7567c1d91203e7c5d31f4e65c52.1633453452.git.naveennaidu479@gmail.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com,
 bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 05, 2021 at 10:48:10PM +0530, Naveen Naidu wrote:
> In the dpc_process_error() path, info->id isn't initialized before being
> passed to aer_print_error(). In the corresponding AER path, it is
> initialized in aer_isr_one_error().
> 
> The error message shown during Coverity Scan is:
> 
>   Coverity #1461602
>   CID 1461602 (#1 of 1): Uninitialized scalar variable (UNINIT)
>   8. uninit_use_in_call: Using uninitialized value info.id when calling aer_print_error.
> 
> Initialize the "info->id" before passing it to aer_print_error()
> 
> Fixes: 8aefa9b0d910 ("PCI/DPC: Print AER status in DPC event handling")
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/pcie/dpc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index c556e7beafe3..df3f3a10f8bc 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -262,14 +262,14 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>  
>  void dpc_process_error(struct pci_dev *pdev)
>  {
> -	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
> +	u16 cap = pdev->dpc_cap, status, reason, ext_reason;
>  	struct aer_err_info info;
>  
>  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
> -	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> +	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
>  
>  	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
> -		 status, source);
> +		 status, info.id);
>  
>  	reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;

Per PCIe r5.0, sec 7.9.15.5, the Source ID is defined only when the
Trigger Reason indicates ERR_NONFATAL or ERR_FATAL.  So I think we
need to extract this reason before reading PCI_EXP_DPC_SOURCE_ID,
e.g.,

  reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
  if (reason == 1 || reason == 2)
    pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
  else
    info.id = 0;

>  	ext_reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT) >> 5;
> -- 
> 2.25.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
