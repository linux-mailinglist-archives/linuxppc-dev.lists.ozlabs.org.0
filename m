Return-Path: <linuxppc-dev+bounces-13804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F87C36076
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 15:22:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1nZr2bGsz2yjp;
	Thu,  6 Nov 2025 01:22:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762352532;
	cv=none; b=TrVSg7SK9alP/QiSLq+O5oLDvAGT0kS4vxSnHh90HykcdDq6+KHBt12pQfwzv5qpjK4WEGiNrj0ktMBtOyaUJ/cckIsp1dI94hvEcSUT3gEepUnaMG2robcPw7WVEen6SklbJby1d1xauGVPVCUiFCSgjxM6Okl7nRlT3h2ojMXIzD962Js4cmVYvztQk61ZxN94UMP70bP0W1IAfR4QB/nUt2hq7DOyfcqmw0KM1/CKjpY1S26DurwhxpyDETKjF1eYOWTL67wjHJSfAGR6JqIuOaIrpm9T+YG6r0U49yGrK+EjPzjEMMO9UuXo5zVzNjRKNoyGpZkfVqJnikH0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762352532; c=relaxed/relaxed;
	bh=KY8ZUXmr1IIZ8FHz2jH1kLLtrhWMzNynQzPcJEdZBf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W08r0y+whNDAaPFvEUQmJtBmMCqt1RomvKeT5VKWYPVaFjxEMbNnKRXlV0gqads7F7s4qBQlNopzKN4zrvjvllmpkLL6Ao+KH5NBj2TwSYsYHiGiQA3i9Vt9DUKbZUk/C5791kpDaRDc5tvAS9SHHy2IOp0GTvVSwLjq+49FVtdmUfBcdlXT3jFHNQvJ22caf5y41qjLYmqjX1S+awMbUU7wR2uDaVoRE1Qk1fYenRPbLThD+/RdJ/P2306EthKppVa3xzYpW/dcs6lxFQoLoNq0Nk4/LooB9ubvtFAOKXiy7wGljc7gHccBXecoxCoZIgigEI33X8ICnorIA2g1RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bxLNUE/p; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bxLNUE/p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1nZn3JNTz2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 01:22:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762352530; x=1793888530;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=34y/01Bj3s9D+0SFBu3q7UEPn0rn/8v07med4iPNrpo=;
  b=bxLNUE/p8+byvgZ43kCrwZq7iVeAh1y6zeOiRikLf9/zQlAELmyfdecn
   epz2VpvGIRyn2yomAcS5HKbAL3LwEm9SLDK86lYuhOk11JrgAm7Nn+yah
   argQJKY/TB0P2ScHtntClcuhwEhgfOZI7H+8JfdolebXqs4lFZipyrZ7h
   9qhZ40RSFu26C0f5KT9uIPL/W0QJKKnQrAdTYj3KPTG2WVoX8jL5t/vxv
   3i96hzpql8+Bqep7ZZRJlG+CiyLh7e/pcYF979pmpjgXgxrjy/mpZ3SBC
   J6KrEWAYsbCYtVHvz96Dve6hAmRHH+mb9r8WAJR7HvaOVqicQVtsgYJi2
   Q==;
X-CSE-ConnectionGUID: 2MYlr+EkQUS9Rfp5ZIoagw==
X-CSE-MsgGUID: 9xpdE96CQqSmR5UtdRTqOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64616656"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="64616656"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 06:22:06 -0800
X-CSE-ConnectionGUID: 9y6pVknCQA+p9A6wUWjwYA==
X-CSE-MsgGUID: Dqvh8wm4SE6z0FAnqYkARQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="187134618"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.110.242]) ([10.125.110.242])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 06:22:04 -0800
Message-ID: <bbfe1baa-5e60-4d2a-9f43-b65ff0ab66d1@intel.com>
Date: Wed, 5 Nov 2025 07:22:02 -0700
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] treewide: Drop pci_save_state() after
 pci_restore_state()
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>,
 "Sean C. Dardis" <sean.c.dardis@intel.com>, Farhan Ali
 <alifm@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Alek Du <alek.du@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 qat-linux@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <cover.1760274044.git.lukas@wunner.de>
 <c2b28cc4defa1b743cf1dedee23c455be98b397a.1760274044.git.lukas@wunner.de>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <c2b28cc4defa1b743cf1dedee23c455be98b397a.1760274044.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/12/25 6:25 AM, Lukas Wunner wrote:
> In 2009, commit c82f63e411f1 ("PCI: check saved state before restore")
> changed the behavior of pci_restore_state() such that it became necessary
> to call pci_save_state() afterwards, lest recovery from subsequent PCI
> errors fails.
> 
> The commit has just been reverted and so all the pci_save_state() after
> pci_restore_state() calls that have accumulated in the tree are now
> superfluous.  Drop them.
> 
> Two drivers chose a different approach to achieve the same result:
> drivers/scsi/ipr.c and drivers/net/ethernet/intel/e1000e/netdev.c set the
> pci_dev's "state_saved" flag to true before calling pci_restore_state().
> Drop this as well.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

For ioatdma changes:
Acked-by: Dave Jiang <dave.jiang@intel.com>

> ---
> Some of the pci_save_state() calls in drivers' probe hooks may now
> likewise be superfluous if the probe hook doesn't touch Config Space.
> These calls will be identified and dealt with individually.
> 
>  drivers/crypto/intel/qat/qat_common/adf_aer.c    | 2 --
>  drivers/dma/ioat/init.c                          | 1 -
>  drivers/net/ethernet/broadcom/bnx2.c             | 2 --
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c | 1 -
>  drivers/net/ethernet/broadcom/tg3.c              | 1 -
>  drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c  | 1 -
>  drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c  | 2 --
>  drivers/net/ethernet/hisilicon/hibmcge/hbg_err.c | 1 -
>  drivers/net/ethernet/intel/e1000e/netdev.c       | 1 -
>  drivers/net/ethernet/intel/fm10k/fm10k_pci.c     | 6 ------
>  drivers/net/ethernet/intel/i40e/i40e_main.c      | 1 -
>  drivers/net/ethernet/intel/ice/ice_main.c        | 2 --
>  drivers/net/ethernet/intel/igb/igb_main.c        | 2 --
>  drivers/net/ethernet/intel/igc/igc_main.c        | 2 --
>  drivers/net/ethernet/intel/ixgbe/ixgbe_main.c    | 1 -
>  drivers/net/ethernet/mellanox/mlx4/main.c        | 1 -
>  drivers/net/ethernet/mellanox/mlx5/core/main.c   | 1 -
>  drivers/net/ethernet/meta/fbnic/fbnic_pci.c      | 1 -
>  drivers/net/ethernet/microchip/lan743x_main.c    | 1 -
>  drivers/net/ethernet/myricom/myri10ge/myri10ge.c | 4 ----
>  drivers/net/ethernet/neterion/s2io.c             | 1 -
>  drivers/pci/pcie/portdrv.c                       | 1 -
>  drivers/scsi/bfa/bfad.c                          | 1 -
>  drivers/scsi/csiostor/csio_init.c                | 1 -
>  drivers/scsi/ipr.c                               | 1 -
>  drivers/scsi/lpfc/lpfc_init.c                    | 6 ------
>  drivers/scsi/qla2xxx/qla_os.c                    | 5 -----
>  drivers/scsi/qla4xxx/ql4_os.c                    | 5 -----
>  drivers/tty/serial/8250/8250_pci.c               | 1 -
>  drivers/tty/serial/jsm/jsm_driver.c              | 1 -
>  30 files changed, 57 deletions(-)
> 
> diff --git a/drivers/crypto/intel/qat/qat_common/adf_aer.c b/drivers/crypto/intel/qat/qat_common/adf_aer.c
> index 35679b2..9a5a4b3 100644
> --- a/drivers/crypto/intel/qat/qat_common/adf_aer.c
> +++ b/drivers/crypto/intel/qat/qat_common/adf_aer.c
> @@ -105,7 +105,6 @@ void adf_dev_restore(struct adf_accel_dev *accel_dev)
>  			 accel_dev->accel_id);
>  		hw_device->reset_device(accel_dev);
>  		pci_restore_state(pdev);
> -		pci_save_state(pdev);
>  	}
>  }
>  
> @@ -204,7 +203,6 @@ static pci_ers_result_t adf_slot_reset(struct pci_dev *pdev)
>  	if (!pdev->is_busmaster)
>  		pci_set_master(pdev);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  	res = adf_dev_up(accel_dev, false);
>  	if (res && res != -EALREADY)
>  		return PCI_ERS_RESULT_DISCONNECT;
> diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
> index 02f68b3..2273986 100644
> --- a/drivers/dma/ioat/init.c
> +++ b/drivers/dma/ioat/init.c
> @@ -1286,7 +1286,6 @@ static pci_ers_result_t ioat_pcie_error_slot_reset(struct pci_dev *pdev)
>  	} else {
>  		pci_set_master(pdev);
>  		pci_restore_state(pdev);
> -		pci_save_state(pdev);
>  		pci_wake_from_d3(pdev, false);
>  	}
>  
> diff --git a/drivers/net/ethernet/broadcom/bnx2.c b/drivers/net/ethernet/broadcom/bnx2.c
> index cb1011f..805daae 100644
> --- a/drivers/net/ethernet/broadcom/bnx2.c
> +++ b/drivers/net/ethernet/broadcom/bnx2.c
> @@ -6444,7 +6444,6 @@ static u32 bnx2_find_max_ring(u32 ring_size, u32 max_size)
>  	if (!(pcicmd & PCI_COMMAND_MEMORY)) {
>  		/* in case PCI block has reset */
>  		pci_restore_state(bp->pdev);
> -		pci_save_state(bp->pdev);
>  	}
>  	rc = bnx2_init_nic(bp, 1);
>  	if (rc) {
> @@ -8718,7 +8717,6 @@ static pci_ers_result_t bnx2_io_slot_reset(struct pci_dev *pdev)
>  	} else {
>  		pci_set_master(pdev);
>  		pci_restore_state(pdev);
> -		pci_save_state(pdev);
>  
>  		if (netif_running(dev))
>  			err = bnx2_init_nic(bp, 1);
> diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
> index f0f05d7..8e6eec8 100644
> --- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
> +++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
> @@ -14216,7 +14216,6 @@ static pci_ers_result_t bnx2x_io_slot_reset(struct pci_dev *pdev)
>  
>  	pci_set_master(pdev);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	if (netif_running(dev))
>  		bnx2x_set_power_state(bp, PCI_D0);
> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index 7f00ec7..ecc1220 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c
> @@ -18352,7 +18352,6 @@ static pci_ers_result_t tg3_io_slot_reset(struct pci_dev *pdev)
>  
>  	pci_set_master(pdev);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	if (!netdev || !netif_running(netdev)) {
>  		rc = PCI_ERS_RESULT_RECOVERED;
> diff --git a/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c b/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
> index f92a355..3b1321c 100644
> --- a/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
> +++ b/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
> @@ -2933,7 +2933,6 @@ static int t3_reenable_adapter(struct adapter *adapter)
>  	}
>  	pci_set_master(adapter->pdev);
>  	pci_restore_state(adapter->pdev);
> -	pci_save_state(adapter->pdev);
>  
>  	/* Free sge resources */
>  	t3_free_sge_resources(adapter);
> diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
> index 392723e..1ce2091 100644
> --- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
> +++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
> @@ -5456,7 +5456,6 @@ static pci_ers_result_t eeh_slot_reset(struct pci_dev *pdev)
>  
>  	if (!adap) {
>  		pci_restore_state(pdev);
> -		pci_save_state(pdev);
>  		return PCI_ERS_RESULT_RECOVERED;
>  	}
>  
> @@ -5471,7 +5470,6 @@ static pci_ers_result_t eeh_slot_reset(struct pci_dev *pdev)
>  
>  	pci_set_master(pdev);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	if (t4_wait_dev_ready(adap->regs) < 0)
>  		return PCI_ERS_RESULT_DISCONNECT;
> diff --git a/drivers/net/ethernet/hisilicon/hibmcge/hbg_err.c b/drivers/net/ethernet/hisilicon/hibmcge/hbg_err.c
> index 83cf75b..2eb1e3d 100644
> --- a/drivers/net/ethernet/hisilicon/hibmcge/hbg_err.c
> +++ b/drivers/net/ethernet/hisilicon/hibmcge/hbg_err.c
> @@ -158,7 +158,6 @@ static pci_ers_result_t hbg_pci_err_slot_reset(struct pci_dev *pdev)
>  
>  	pci_set_master(pdev);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	hbg_err_reset(priv);
>  	return PCI_ERS_RESULT_RECOVERED;
> diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
> index 201322d..7589660 100644
> --- a/drivers/net/ethernet/intel/e1000e/netdev.c
> +++ b/drivers/net/ethernet/intel/e1000e/netdev.c
> @@ -7195,7 +7195,6 @@ static pci_ers_result_t e1000_io_slot_reset(struct pci_dev *pdev)
>  			"Cannot re-enable PCI device after reset.\n");
>  		result = PCI_ERS_RESULT_DISCONNECT;
>  	} else {
> -		pdev->state_saved = true;
>  		pci_restore_state(pdev);
>  		pci_set_master(pdev);
>  
> diff --git a/drivers/net/ethernet/intel/fm10k/fm10k_pci.c b/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
> index ae5fe34..d75b8a5 100644
> --- a/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
> +++ b/drivers/net/ethernet/intel/fm10k/fm10k_pci.c
> @@ -2423,12 +2423,6 @@ static pci_ers_result_t fm10k_io_slot_reset(struct pci_dev *pdev)
>  	} else {
>  		pci_set_master(pdev);
>  		pci_restore_state(pdev);
> -
> -		/* After second error pci->state_saved is false, this
> -		 * resets it so EEH doesn't break.
> -		 */
> -		pci_save_state(pdev);
> -
>  		pci_wake_from_d3(pdev, false);
>  
>  		result = PCI_ERS_RESULT_RECOVERED;
> diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethernet/intel/i40e/i40e_main.c
> index 50be0a6..d8192aa 100644
> --- a/drivers/net/ethernet/intel/i40e/i40e_main.c
> +++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
> @@ -16455,7 +16455,6 @@ static pci_ers_result_t i40e_pci_error_slot_reset(struct pci_dev *pdev)
>  	} else {
>  		pci_set_master(pdev);
>  		pci_restore_state(pdev);
> -		pci_save_state(pdev);
>  		pci_wake_from_d3(pdev, false);
>  
>  		reg = rd32(&pf->hw, I40E_GLGEN_RTRIG);
> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
> index 86f5859..6c7dcca 100644
> --- a/drivers/net/ethernet/intel/ice/ice_main.c
> +++ b/drivers/net/ethernet/intel/ice/ice_main.c
> @@ -5663,7 +5663,6 @@ static int ice_resume(struct device *dev)
>  
>  	pci_set_power_state(pdev, PCI_D0);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	if (!pci_device_is_present(pdev))
>  		return -ENODEV;
> @@ -5763,7 +5762,6 @@ static pci_ers_result_t ice_pci_err_slot_reset(struct pci_dev *pdev)
>  	} else {
>  		pci_set_master(pdev);
>  		pci_restore_state(pdev);
> -		pci_save_state(pdev);
>  		pci_wake_from_d3(pdev, false);
>  
>  		/* Check for life */
> diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
> index 85f9589..dbea372 100644
> --- a/drivers/net/ethernet/intel/igb/igb_main.c
> +++ b/drivers/net/ethernet/intel/igb/igb_main.c
> @@ -9599,7 +9599,6 @@ static int __igb_resume(struct device *dev, bool rpm)
>  
>  	pci_set_power_state(pdev, PCI_D0);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	if (!pci_device_is_present(pdev))
>  		return -ENODEV;
> @@ -9754,7 +9753,6 @@ static pci_ers_result_t igb_io_slot_reset(struct pci_dev *pdev)
>  	} else {
>  		pci_set_master(pdev);
>  		pci_restore_state(pdev);
> -		pci_save_state(pdev);
>  
>  		pci_enable_wake(pdev, PCI_D3hot, 0);
>  		pci_enable_wake(pdev, PCI_D3cold, 0);
> diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
> index 728d7ca..7aafa60b 100644
> --- a/drivers/net/ethernet/intel/igc/igc_main.c
> +++ b/drivers/net/ethernet/intel/igc/igc_main.c
> @@ -7530,7 +7530,6 @@ static int __igc_resume(struct device *dev, bool rpm)
>  
>  	pci_set_power_state(pdev, PCI_D0);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	if (!pci_device_is_present(pdev))
>  		return -ENODEV;
> @@ -7667,7 +7666,6 @@ static pci_ers_result_t igc_io_slot_reset(struct pci_dev *pdev)
>  	} else {
>  		pci_set_master(pdev);
>  		pci_restore_state(pdev);
> -		pci_save_state(pdev);
>  
>  		pci_enable_wake(pdev, PCI_D3hot, 0);
>  		pci_enable_wake(pdev, PCI_D3cold, 0);
> diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> index 90d4e57..d65d691 100644
> --- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> +++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> @@ -12297,7 +12297,6 @@ static pci_ers_result_t ixgbe_io_slot_reset(struct pci_dev *pdev)
>  		adapter->hw.hw_addr = adapter->io_addr;
>  		pci_set_master(pdev);
>  		pci_restore_state(pdev);
> -		pci_save_state(pdev);
>  
>  		pci_wake_from_d3(pdev, false);
>  
> diff --git a/drivers/net/ethernet/mellanox/mlx4/main.c b/drivers/net/ethernet/mellanox/mlx4/main.c
> index 03d2fc7..d1fbf37 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/main.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/main.c
> @@ -4366,7 +4366,6 @@ static pci_ers_result_t mlx4_pci_slot_reset(struct pci_dev *pdev)
>  
>  	pci_set_master(pdev);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  	return PCI_ERS_RESULT_RECOVERED;
>  }
>  
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
> index df93625..08f7778 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
> @@ -2095,7 +2095,6 @@ static pci_ers_result_t mlx5_pci_slot_reset(struct pci_dev *pdev)
>  
>  	pci_set_master(pdev);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	err = wait_vital(pdev);
>  	if (err) {
> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_pci.c b/drivers/net/ethernet/meta/fbnic/fbnic_pci.c
> index a7a6b4d..0fa90ba 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_pci.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_pci.c
> @@ -574,7 +574,6 @@ static pci_ers_result_t fbnic_err_slot_reset(struct pci_dev *pdev)
>  
>  	pci_set_power_state(pdev, PCI_D0);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	if (pci_enable_device_mem(pdev)) {
>  		dev_err(&pdev->dev,
> diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
> index 9d70b51..e4c542f 100644
> --- a/drivers/net/ethernet/microchip/lan743x_main.c
> +++ b/drivers/net/ethernet/microchip/lan743x_main.c
> @@ -3915,7 +3915,6 @@ static int lan743x_pm_resume(struct device *dev)
>  
>  	pci_set_power_state(pdev, PCI_D0);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	/* Restore HW_CFG that was saved during pm suspend */
>  	if (adapter->is_pci11x1x)
> diff --git a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
> index e611ff7..7be30a8 100644
> --- a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
> +++ b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
> @@ -3416,10 +3416,6 @@ static void myri10ge_watchdog(struct work_struct *work)
>  		 * nic was resumed from power saving mode.
>  		 */
>  		pci_restore_state(mgp->pdev);
> -
> -		/* save state again for accounting reasons */
> -		pci_save_state(mgp->pdev);
> -
>  	} else {
>  		/* if we get back -1's from our slot, perhaps somebody
>  		 * powered off our card.  Don't try to reset it in
> diff --git a/drivers/net/ethernet/neterion/s2io.c b/drivers/net/ethernet/neterion/s2io.c
> index 5026b02..1e55ccb 100644
> --- a/drivers/net/ethernet/neterion/s2io.c
> +++ b/drivers/net/ethernet/neterion/s2io.c
> @@ -3425,7 +3425,6 @@ static void s2io_reset(struct s2io_nic *sp)
>  
>  		/* Restore the PCI state saved during initialization. */
>  		pci_restore_state(sp->pdev);
> -		pci_save_state(sp->pdev);
>  		pci_read_config_word(sp->pdev, 0x2, &val16);
>  		if (check_pci_device_id(val16) != (u16)PCI_ANY_ID)
>  			break;
> diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
> index d1b68c18..38a41cc 100644
> --- a/drivers/pci/pcie/portdrv.c
> +++ b/drivers/pci/pcie/portdrv.c
> @@ -760,7 +760,6 @@ static pci_ers_result_t pcie_portdrv_slot_reset(struct pci_dev *dev)
>  	device_for_each_child(&dev->dev, &off, pcie_port_device_iter);
>  
>  	pci_restore_state(dev);
> -	pci_save_state(dev);
>  	return PCI_ERS_RESULT_RECOVERED;
>  }
>  
> diff --git a/drivers/scsi/bfa/bfad.c b/drivers/scsi/bfa/bfad.c
> index ff9adfc..bdfd065 100644
> --- a/drivers/scsi/bfa/bfad.c
> +++ b/drivers/scsi/bfa/bfad.c
> @@ -1528,7 +1528,6 @@ static int restart_bfa(struct bfad_s *bfad)
>  		goto out_disable_device;
>  	}
>  
> -	pci_save_state(pdev);
>  	pci_set_master(pdev);
>  
>  	rc = dma_set_mask_and_coherent(&bfad->pcidev->dev, DMA_BIT_MASK(64));
> diff --git a/drivers/scsi/csiostor/csio_init.c b/drivers/scsi/csiostor/csio_init.c
> index 79c8daf..db0c217 100644
> --- a/drivers/scsi/csiostor/csio_init.c
> +++ b/drivers/scsi/csiostor/csio_init.c
> @@ -1093,7 +1093,6 @@ static void csio_remove_one(struct pci_dev *pdev)
>  
>  	pci_set_master(pdev);
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	/* Bring HW s/m to ready state.
>  	 * but don't resume IOs.
> diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
> index 4421488..9512368 100644
> --- a/drivers/scsi/ipr.c
> +++ b/drivers/scsi/ipr.c
> @@ -7859,7 +7859,6 @@ static int ipr_reset_restore_cfg_space(struct ipr_cmnd *ipr_cmd)
>  	struct ipr_ioa_cfg *ioa_cfg = ipr_cmd->ioa_cfg;
>  
>  	ENTER;
> -	ioa_cfg->pdev->state_saved = true;
>  	pci_restore_state(ioa_cfg->pdev);
>  
>  	if (ipr_set_pcix_cmd_reg(ioa_cfg)) {
> diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
> index f206267..065eb91 100644
> --- a/drivers/scsi/lpfc/lpfc_init.c
> +++ b/drivers/scsi/lpfc/lpfc_init.c
> @@ -14434,12 +14434,6 @@ static int lpfc_cpu_online(unsigned int cpu, struct hlist_node *node)
>  
>  	pci_restore_state(pdev);
>  
> -	/*
> -	 * As the new kernel behavior of pci_restore_state() API call clears
> -	 * device saved_state flag, need to save the restored state again.
> -	 */
> -	pci_save_state(pdev);
> -
>  	if (pdev->is_busmaster)
>  		pci_set_master(pdev);
>  
> diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
> index 5ffd945..9007533e 100644
> --- a/drivers/scsi/qla2xxx/qla_os.c
> +++ b/drivers/scsi/qla2xxx/qla_os.c
> @@ -7886,11 +7886,6 @@ static void qla_pci_error_cleanup(scsi_qla_host_t *vha)
>  
>  	pci_restore_state(pdev);
>  
> -	/* pci_restore_state() clears the saved_state flag of the device
> -	 * save restored state which resets saved_state flag
> -	 */
> -	pci_save_state(pdev);
> -
>  	if (ha->mem_only)
>  		rc = pci_enable_device_mem(pdev);
>  	else
> diff --git a/drivers/scsi/qla4xxx/ql4_os.c b/drivers/scsi/qla4xxx/ql4_os.c
> index a761c0a..1f52379 100644
> --- a/drivers/scsi/qla4xxx/ql4_os.c
> +++ b/drivers/scsi/qla4xxx/ql4_os.c
> @@ -9796,11 +9796,6 @@ static uint32_t qla4_8xxx_error_recovery(struct scsi_qla_host *ha)
>  	 */
>  	pci_restore_state(pdev);
>  
> -	/* pci_restore_state() clears the saved_state flag of the device
> -	 * save restored state which resets saved_state flag
> -	 */
> -	pci_save_state(pdev);
> -
>  	/* Initialize device or resume if in suspended state */
>  	rc = pci_enable_device(pdev);
>  	if (rc) {
> diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/8250/8250_pci.c
> index 152f914..65bd370 100644
> --- a/drivers/tty/serial/8250/8250_pci.c
> +++ b/drivers/tty/serial/8250/8250_pci.c
> @@ -6178,7 +6178,6 @@ static pci_ers_result_t serial8250_io_slot_reset(struct pci_dev *dev)
>  		return PCI_ERS_RESULT_DISCONNECT;
>  
>  	pci_restore_state(dev);
> -	pci_save_state(dev);
>  
>  	return PCI_ERS_RESULT_RECOVERED;
>  }
> diff --git a/drivers/tty/serial/jsm/jsm_driver.c b/drivers/tty/serial/jsm/jsm_driver.c
> index 417a5b6..8d21373 100644
> --- a/drivers/tty/serial/jsm/jsm_driver.c
> +++ b/drivers/tty/serial/jsm/jsm_driver.c
> @@ -355,7 +355,6 @@ static void jsm_io_resume(struct pci_dev *pdev)
>  	struct jsm_board *brd = pci_get_drvdata(pdev);
>  
>  	pci_restore_state(pdev);
> -	pci_save_state(pdev);
>  
>  	jsm_uart_port_init(brd);
>  }


