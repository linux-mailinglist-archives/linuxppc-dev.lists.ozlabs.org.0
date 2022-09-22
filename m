Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C306B5E6ED8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 23:51:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYTVz0YYBz3c34
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 07:51:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XYgCEWLP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XYgCEWLP;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYTVM5hFFz3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 07:50:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B101A62BA1;
	Thu, 22 Sep 2022 21:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA640C433D7;
	Thu, 22 Sep 2022 21:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663883432;
	bh=MgTN7LkGK6RTKAK8xVN3320exVPlVXdsT6FCYwP83tA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=XYgCEWLPerROkbSvzzraCysPpwUrHSr4ezRMEPzD/ldnsRprA24KspE1uqZz2Lud3
	 +R/nXgSNU53Ci9h+ObaShk9tsEctWfNDGis5b1UWi93JIQlrKTPW6V0Izp4Dlf3kES
	 BfJdiFGPoX5QiO/uIZh9h5L6fr3x5OC48pG6l94oppUo3FzD9qJO4pyfZQZ3kw75Tx
	 0+9bJybb6Hkuf7t/doyH+9AjA+eGxEvcJUqlKgO/jAjSec2SFBQhU+8Sn9eoSb7Ekx
	 X0yg8nxr8vmau0UWfJECH2zzeVv/V0E1M5Hrv8aW10ZF74JV/wXq5hl/DvDqgp7FSG
	 UAybAAMfGEg6w==
Date: Thu, 22 Sep 2022 16:50:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Subject: Re: [PATCH 3/3] PCI/AER: Use pci_aer_raw_clear_status() to clear
 root port's AER error status
Message-ID: <20220922215030.GA1341314@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901181634.99591-4-chenzhuo.1@bytedance.com>
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
Cc: allenbh@gmail.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, jdmason@kudzu.us, james.smart@broadcom.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 02, 2022 at 02:16:34AM +0800, Zhuo Chen wrote:
> Statements clearing AER error status in aer_enable_rootport() has the
> same function as pci_aer_raw_clear_status(). So we replace them, which
> has no functional changes.
> 
> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---
>  drivers/pci/pcie/aer.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index d2996afa80f6..eb0193f279f2 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1287,12 +1287,7 @@ static void aer_enable_rootport(struct aer_rpc *rpc)
>  				   SYSTEM_ERROR_INTR_ON_MESG_MASK);
>  
>  	/* Clear error status */
> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, reg32);
> -	pci_read_config_dword(pdev, aer + PCI_ERR_COR_STATUS, &reg32);
> -	pci_write_config_dword(pdev, aer + PCI_ERR_COR_STATUS, reg32);
> -	pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
> -	pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, reg32);
> +	pci_aer_raw_clear_status(pdev);

It's true that this is functionally equivalent.

But 20e15e673b05 ("PCI/AER: Add pci_aer_raw_clear_status() to
unconditionally clear Error Status") says pci_aer_raw_clear_status()
is only for use in the EDR path (this should have been included in the
function comment), so I think we should preserve that property and use
pci_aer_clear_status() here.

pci_aer_raw_clear_status() is the same as pci_aer_clear_status()
except it doesn't check pcie_aer_is_native().  And I'm pretty sure we
can't get to aer_enable_rootport() *unless* pcie_aer_is_native(),
because get_port_device_capability() checks the same thing, so they
should be equivalent here.

Bjorn
