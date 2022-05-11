Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0350852410D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 01:28:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzB1K5p2Gz3cGf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 09:28:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cmdoL7mS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cmdoL7mS; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzB0j6SKHz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 09:28:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1BA8AB8263E;
 Wed, 11 May 2022 23:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751F9C340EE;
 Wed, 11 May 2022 23:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652311679;
 bh=siF8PIsP3XHsVSZH5Wv97Tl+fZ+3A6Kd5SrYh1Feyp8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=cmdoL7mS/UXMhq4bFqDfAewpfd7ifK2Y83cZJgqQAb5UvtYPro4j5Lf4DTm09oqMH
 5Tivg2wc2r6fMg7SSjY5/eHYp/DhPkwbtcFBoM9OPWI5jS4wRAgjt0n5CduKdlIsml
 RgCP7NLJCJZlQ4o5Yc9/2tpjejnHsv3jTRn2sG6sFm78MGBncAjhNFoHSha+Lr4qlR
 6FJ4c0OsGA9yowCGZzj9mKDLvuuK52Vx00IdduEhyFi+DgzqNY6FYEQMIZZVszJy2r
 c6h5iC2Zn9OB2DofxQiphWhzyBJSO4J6QFe8OY55YeLeK71aMUSIDEByxgHMOoCdj/
 jNDlLzEdn3/bQ==
Date: Wed, 11 May 2022 18:27:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v3] PCI/AER: Handle Multi UnCorrectable/Correctable
 errors properly
Message-ID: <20220511232757.GA829078@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418150237.1021519-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Oliver OHalloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 18, 2022 at 03:02:37PM +0000, Kuppuswamy Sathyanarayanan wrote:
> Currently the aer_irq() handler returns IRQ_NONE for cases without bits
> PCI_ERR_ROOT_UNCOR_RCV or PCI_ERR_ROOT_COR_RCV are set. But this
> assumption is incorrect.
> 
> Consider a scenario where aer_irq() is triggered for a correctable
> error, and while we process the error and before we clear the error
> status in "Root Error Status" register, if the same kind of error
> is triggered again, since aer_irq() only clears events it saw, the
> multi-bit error is left in tact. This will cause the interrupt to fire
> again, resulting in entering aer_irq() with just the multi-bit error
> logged in the "Root Error Status" register.
> 
> Repeated AER recovery test has revealed this condition does happen
> and this prevents any new interrupt from being triggered. Allow to
> process interrupt even if only multi-correctable (BIT 1) or
> multi-uncorrectable bit (BIT 3) is set.
> 
> Also note that, for cases with only multi-bit error is set, since this
> is not the first occurrence of the error, PCI_ERR_ROOT_ERR_SRC may have
> zero or some junk value. So we cannot cleanly process this error
> information using aer_isr_one_error(). All we are attempting with this
> fix is to make sure error interrupt processing can continue in this
> scenario.
> 
> This error can be reproduced by making following changes to the
> aer_irq() function and by executing the given test commands.
> 
>  static irqreturn_t aer_irq(int irq, void *context)
>          struct aer_err_source e_src = {};
> 
>          pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS,
> 				&e_src.status);
>  +       pci_dbg(pdev->port, "Root Error Status: %04x\n",
>  +		e_src.status);
>          if (!(e_src.status & AER_ERR_STATUS_MASK))
>                  return IRQ_NONE;
> 
>  +       mdelay(5000);
> 
>  # Prep injection data for a correctable error.
>  $ cd /sys/kernel/debug/apei/einj
>  $ echo 0x00000040 > error_type
>  $ echo 0x4 > flags
>  $ echo 0x891000 > param4
> 
>  # Root Error Status is initially clear
>  $ setpci -s <Dev ID> ECAP0001+0x30.w
>  0000
> 
>  # Inject one error
>  $ echo 1 > error_inject
> 
>  # Interrupt received
>  pcieport <Dev ID>: AER: Root Error Status 0001
> 
>  # Inject another error (within 5 seconds)
>  $ echo 1 > error_inject
> 
>  # You will get a new IRQ with only multiple ERR_COR bit set
>  pcieport <Dev ID>: AER: Root Error Status 0002
> 
> Currently, the above issue has been only reproduced in the ICL server
> platform.
> 
> [Eric: proposed reproducing steps]
> Fixes: 4696b828ca37 ("PCI/AER: Hoist aerdrv.c, aer_inject.c up to drivers/pci/pcie/")

4696b828ca37 only *moves* drivers/pci/pcie/aer/aerdrv.c to
drivers/pci/pcie/aer.c, so I don't think it's related.

I think the actual change of interest is e167bfcaa4cd ("PCI: aerdrv:
remove magical ROOT_ERR_STATUS_MASKS") [1].  It looks like we did
exactly what you propose before that commit.

I can update this unless you disagree.

[1] https://git.kernel.org/linus/e167bfcaa4cd

> Reported-by: Eric Badger <ebadger@purestorage.com>
> Reviewed-by: Ashok Raj <ashok.raj@intel.com>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
> 
> Changes since v2:
>  * Added more details to the commit log.
>  * Rebased on v5.18-rc1.
> 
> Changes since v1:
>  * Added Fixes tag.
>  * Included reproducing steps proposed by Eric.
> 
>  drivers/pci/pcie/aer.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9fa1f97e5b27..7952e5efd6cf 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -101,6 +101,11 @@ struct aer_stats {
>  #define ERR_COR_ID(d)			(d & 0xffff)
>  #define ERR_UNCOR_ID(d)			(d >> 16)
>  
> +#define AER_ERR_STATUS_MASK		(PCI_ERR_ROOT_UNCOR_RCV |	\
> +					PCI_ERR_ROOT_COR_RCV |		\
> +					PCI_ERR_ROOT_MULTI_COR_RCV |	\
> +					PCI_ERR_ROOT_MULTI_UNCOR_RCV)
> +
>  static int pcie_aer_disable;
>  static pci_ers_result_t aer_root_reset(struct pci_dev *dev);
>  
> @@ -1196,7 +1201,7 @@ static irqreturn_t aer_irq(int irq, void *context)
>  	struct aer_err_source e_src = {};
>  
>  	pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS, &e_src.status);
> -	if (!(e_src.status & (PCI_ERR_ROOT_UNCOR_RCV|PCI_ERR_ROOT_COR_RCV)))
> +	if (!(e_src.status & AER_ERR_STATUS_MASK))
>  		return IRQ_NONE;
>  
>  	pci_read_config_dword(rp, aer + PCI_ERR_ROOT_ERR_SRC, &e_src.id);
> -- 
> 2.25.1
> 
