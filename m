Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E344743585E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 03:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZVYt2MPHz305j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 12:41:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gwao20C+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Gwao20C+; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZVYF0xwcz2yJV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 12:40:32 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A5E2610A3;
 Thu, 21 Oct 2021 01:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634780430;
 bh=EUralENv330ewn9XRHZ1BpnRh5NsqZGkLbfXk4z3Pp4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Gwao20C+ItQvfrCBBPmm3C7nTwca5rnymIgfSohDSW6Pc4PPCRFrYTr436hrKPK1z
 aMhokgwHFzO+bAKE/Ts92ViYsQRHRUMq8twvA1r0ojQyXEf0FtjLlLsHUVFsL4k9PA
 WT/vW7LD6FQEI8OGTSWU/FqPEQFUd0hKkAx2u1zLU7/4Y07jgIFzZScMfWgwZp+a/F
 sjLQ5xwSZIrzPzbryfd0scaNOoGG1hCwjDxSZCPbCM+pFhsRILPQEcdi3Brop4gelq
 d4Msy2g3KmodJnhCtUHDoJlkw3SlMfICN4vjz+sXoXtHkOCi0P8whDMQv5M+qDJ/NT
 4C8ff3ITwinOw==
Date: Wed, 20 Oct 2021 20:40:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v4 4/8] PCI/DPC: Use pci_aer_clear_status() in
 dpc_process_error()
Message-ID: <20211021014029.GA2657684@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0d301cb1245a8e2fd9565426b87c22a97aa6de7.1633453452.git.naveennaidu479@gmail.com>
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

On Tue, Oct 05, 2021 at 10:48:11PM +0530, Naveen Naidu wrote:
> dpc_process_error() clears both AER fatal and non fatal status
> registers. Instead of clearing each status registers via a different
> function call use pci_aer_clear_status().
> 
> This helps clean up the code a bit.
> 
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/pcie/dpc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index df3f3a10f8bc..faf4a1e77fab 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -288,8 +288,7 @@ void dpc_process_error(struct pci_dev *pdev)
>  		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
>  		 aer_get_device_error_info(pdev, &info)) {
>  		aer_print_error(pdev, &info);
> -		pci_aer_clear_nonfatal_status(pdev);
> -		pci_aer_clear_fatal_status(pdev);
> +		pci_aer_clear_status(pdev);

The commit log suggests that this is a simple cleanup that doesn't
change any behavior, but that's not quite true:

  - The new code would clear PCI_ERR_ROOT_STATUS, but the old code
    does not.

  - The old code masks the status bits with the severity bits before
    clearing, but the new code does not.

The commit log needs to show why these changes are what we want.

>  	}
>  }
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
