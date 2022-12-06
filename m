Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F1F644E24
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 22:43:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRYn032ZNz3cMK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 08:43:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iKbYxVGu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iKbYxVGu;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRYm470w8z30RH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 08:42:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 19586B81B01;
	Tue,  6 Dec 2022 21:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC973C433D7;
	Tue,  6 Dec 2022 21:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670362928;
	bh=wxhUycLDzdhggpxStShb2U5NNeKt45tBmidI7CWLoqU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iKbYxVGuNZ9Q8dCml8SpnNaWJnOFPHb4fBigyPNA1v+AL5jOfscJx8pwHUh2TivJZ
	 AULQl7iQrHAcrZNUAsXXd2Wgg63QenYakcefYiePya7MeuuhvvVnwVHwKu7WN+imM1
	 q5ykM/H6r0z6jN7a5DDfpJ2Ku29V+nYB59wAOekwvo5j5G0yzLZNYH9EvjzcrnoYT3
	 jSkJyPOaeb2ABu/V+CWlE3hBrh8pb8yyaqUo1UZiNuQgOcpVyje2Lfj7A27V+PZrCG
	 XOlXzUpQOEcaX21lCFMUemTMrWUQD0SRkhyy9RGwNUf5v/cZ3/MN/bVinjDfFVfo5r
	 2vHT7nQCB1Kcg==
Date: Tue, 6 Dec 2022 15:42:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Subject: Re: [PATCH v3 8/9] PCI/ERR: Clear fatal error status when
 pci_channel_io_frozen
Message-ID: <20221206214207.GA1368357@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928105946.12469-9-chenzhuo.1@bytedance.com>
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
Cc: allenbh@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Zhuo,

On Wed, Sep 28, 2022 at 06:59:45PM +0800, Zhuo Chen wrote:
> When state is pci_channel_io_frozen in pcie_do_recovery(), the
> severity is fatal and fatal error status should be cleared.
> So add pci_aer_clear_fatal_status().
> 
> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---
>  drivers/pci/pcie/err.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index f80b21244ef1..b46f1d36c090 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -241,7 +241,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  	pci_walk_bridge(bridge, report_resume, &status);
>  
>  	pcie_clear_device_status(dev);
> -	pci_aer_clear_nonfatal_status(dev);
> +	if (state == pci_channel_io_frozen)
> +		pci_aer_clear_fatal_status(dev);
> +	else
> +		pci_aer_clear_nonfatal_status(dev);

I'm confused.  It seems like we certainly need to clear fatal errors
after they occur *somewhere*, and if we don't, surely this would be a
very obvious issue.  But you didn't mention this being a bug fix, so I
assume it's more of a cleanup.

If it *is* a bug fix, please say that and give a hint about what the
bug looks like, e.g., what sort of messages a user might see.

If it's not a bug fix, I don't understand how AER fatal errors get
cleared today.  The PCI_ERR_UNCOR_STATUS bits are sticky, so they're
not cleared by a reset.  In the current tree, these are the only
places I see that clear AER fatal errors:

  pci_init_capabilities
    pci_aer_init         # once at device enumeration
      pci_aer_clear_status
        pci_aer_raw_clear_status
          pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status)

  aer_probe
    aer_enable_rootport  # once at Root Port enumeration
      pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, reg32)

  dpc_process_error      # after DPC triggered
    pci_aer_clear_fatal_status
      pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status)

  edr_handle_event       # after EDR event
    pci_aer_raw_clear_status
      pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status)

  pci_restore_state      # after reset or PM sleep/resume
    pci_aer_clear_status
      pci_aer_raw_clear_status
        pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status)

The only one that could clear errors after an AER error (not DPC or
EDR), would be the pci_restore_state() in the reset path.  If the
current code relies on that, I'd say that's a pretty non-obvious
dependency.

>  	pci_info(bridge, "device recovery successful\n");
>  	return status;
> -- 
> 2.30.1 (Apple Git-130)
> 
