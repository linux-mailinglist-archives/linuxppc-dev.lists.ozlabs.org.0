Return-Path: <linuxppc-dev+bounces-13071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEE6BF2F73
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 20:38:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cr41f2xkSz304h;
	Tue, 21 Oct 2025 05:38:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760985494;
	cv=none; b=fhYHIFv0tgDc/z5w2wkSzqxtNSPbS7aHpL3pvve4iQWDmghfbaxuwnWkldXhsm9eh6fcm2Mdcp7NfHRkA5zRgq7sD5p7N5e6k+wCItdzcvlA/WvxOe9F6TqEzXB0L2OTXo7JCCIm2/ItomVfqK1LnHBzF9Us64XA9IWSmzf45t3/EBp3icRqYjElD3pYNYNsdZgR6tDqL2hMuRbcDQ9zJXlq7q//+QyZ5V1487WRhi7HEqMfWzuepRZeNCofl7IxuJEmbVofN03jyfR+VAdsw6eF8fnvsV/uK2lEEkNqphx3TAtyZ/VJJR/kUYXdxBnhjwx/yJi2O9hPQRNh7pfJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760985494; c=relaxed/relaxed;
	bh=87P+hYlz2EKOlOd1ccfFIYt8BcoMcrK77d5m5ajZSe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKHO5E5zNtTRgCUe/p9J2kVWD3cnfKQZ8w7J4cBNYaY9r6E3IEnFwIJdTMAAxkFYaPf186LeRMNqCvBT61cVIshHG3bLTU0q8r1Qkqh1iBBqlM+DURXeeOnhYVZ9SXC5bvqWU8k/LHLIGIdyZQkLCEpyEtcw5yeL5nsNQK5lqWL3+JaclsQfv4PArBS4Caws94iEp1VZ9dfxo+2ekmNIaXXpCMXLAjcHoDcIhMumgOST5Di1JYIidHC5rdVg0BdYsektg6Qjt3OZi8tHVMB1yUdwTn8koHERjM6ztuJT7MCcoiyV+0pSbH3pXWAxB8E7WlKMq9sF6o7anbLRhwXqgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P1kSM3nl; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P1kSM3nl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cr41b4TNPz2ySV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:38:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760985492; x=1792521492;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u2kLy5AQDMP6Qh4T+AMn2cRnD+nhl4BTD0LozXc+FW8=;
  b=P1kSM3nlO8dMQeCQZ1UVMWX5CCCdK+uj4PuzLV/veF75l4d7M4W2IGC1
   U1cADtFweJAkdCbS/jCpZQiUBm1TPAVImMd2Hpf/uhTatnrUS7uUwSmkh
   Thg1nOFnaXDnYsQjPcgBXGtUXf4Iv8umJFQlSE2+rzQhEoFuQjZrXnpjd
   FjRmVC9+/YIMUxMCx2XybaRVzFX604Z8Lx7GBUueQpaIEhBAWTngcZnxr
   KZ2hX1UogTV8EF67SgUcc+CwsK3RgR4qlfSXhTB4n0Kpufqwjx4mzNhwu
   kTFrFxKiDxGCjnGmiD7owBWUXRJ4x1akVmthEBPivtryitDiPJLc8xFPD
   w==;
X-CSE-ConnectionGUID: QRlJL+GgS6eUsKVkE/WOCQ==
X-CSE-MsgGUID: xvAfHWqvQo+0jo9T5iMopA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66969194"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="66969194"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 11:38:07 -0700
X-CSE-ConnectionGUID: wUJaxdbqSJqeJgCixLySGQ==
X-CSE-MsgGUID: 1STlR9ztQKawfoBgVeLGaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="187415426"
Received: from skuppusw-desk2.jf.intel.com (HELO [10.165.154.101]) ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 11:38:07 -0700
Message-ID: <fe1daf3b-162e-4132-8cdc-c89305391090@linux.intel.com>
Date: Mon, 20 Oct 2025 11:38:06 -0700
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
Subject: Re: [PATCH v6 3/5] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com, lukas@wunner.de
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-4-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20251015024159.56414-4-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 10/14/25 19:41, Shuai Xue wrote:
> The AER driver has historically avoided reading the configuration space of
> an endpoint or RCiEP that reported a fatal error, considering the link to
> that device unreliable. Consequently, when a fatal error occurs, the AER
> and DPC drivers do not report specific error types, resulting in logs like:
>
>    pcieport 0015:00:00.0: EDR: EDR event received
>    pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
>    pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
>    pcieport 0015:00:00.0: AER: broadcast error_detected message
>    pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
>    pcieport 0015:00:00.0: AER: broadcast resume message
>    pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
>    pcieport 0015:00:00.0: AER: device recovery successful
>    pcieport 0015:00:00.0: EDR: DPC port successfully recovered
>    pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80
>
> AER status registers are sticky and Write-1-to-clear. If the link recovered
> after hot reset, we can still safely access AER status and TLP header of the
> error device. In such case, report fatal errors which helps to figure out the
> error root case.
>
> After this patch, the logs like:
>
>    pcieport 0015:00:00.0: EDR: EDR event received
>    pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
>    pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
>    pcieport 0015:00:00.0: AER: broadcast error_detected message
>    vfio-pci 0015:01:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Transaction Layer, (Receiver ID)
>    pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored

It would be more clear if you follow the same order of the log as before section
and highlight the new logs that are getting added.

>    vfio-pci 0015:01:00.0:   device [144d:a80a] error status/mask=00001000/00400000
>    vfio-pci 0015:01:00.0:    [12] TLP                    (First)
>    vfio-pci 0015:01:00.0: AER:   TLP Header: 0x4a004010 0x00000040 0x01000000 0xffffffff
>    pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
>    pcieport 0015:00:00.0: AER: broadcast resume message
>    pcieport 0015:00:00.0: AER: device recovery successful
>    pcieport 0015:00:00.0: EDR: DPC port successfully recovered
>    pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80
>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>   drivers/pci/pci.h      |  4 +++-
>   drivers/pci/pcie/aer.c | 18 +++++++++++-------
>   drivers/pci/pcie/dpc.c |  2 +-
>   drivers/pci/pcie/err.c | 11 +++++++++++
>   4 files changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 6b0c55bed15b..3eccef2d25a3 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -739,8 +739,10 @@ struct aer_err_info {
>   	struct pcie_tlp_log tlp;	/* TLP Header */
>   };
>   
> -int aer_get_device_error_info(struct aer_err_info *info, int i);
> +int aer_get_device_error_info(struct aer_err_info *info, int i,
> +			      bool link_healthy);
>   void aer_print_error(struct aer_err_info *info, int i);
> +int aer_add_error_device(struct aer_err_info *e_info, struct pci_dev *dev);
>   
>   int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
>   		      unsigned int tlp_len, bool flit,
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 0b5ed4722ac3..aaea9902cbb7 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -978,7 +978,7 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
>    * @e_info: pointer to error info
>    * @dev: pointer to pci_dev to be added
>    */
> -static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
> +int aer_add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)

I don't think you need this rename.

>   {
>   	int i = e_info->error_dev_num;
>   
> @@ -1068,7 +1068,7 @@ static int find_device_iter(struct pci_dev *dev, void *data)
>   
>   	if (is_error_source(dev, e_info)) {
>   		/* List this device */
> -		if (add_error_device(e_info, dev)) {
> +		if (aer_add_error_device(e_info, dev)) {
>   			/* We cannot handle more... Stop iteration */
>   			pci_err(dev, "Exceeded max supported (%d) devices with errors logged\n",
>   				AER_MAX_MULTI_ERR_DEVICES);
> @@ -1382,12 +1382,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
>    * aer_get_device_error_info - read error status from dev and store it to info
>    * @info: pointer to structure to store the error record
>    * @i: index into info->dev[]
> + * @link_healthy: link is healthy or not
>    *
>    * Return: 1 on success, 0 on error.
>    *
>    * Note that @info is reused among all error devices. Clear fields properly.
>    */
> -int aer_get_device_error_info(struct aer_err_info *info, int i)
> +int aer_get_device_error_info(struct aer_err_info *info, int i,
> +			      bool link_healthy)
>   {
>   	struct pci_dev *dev;
>   	int type, aer;
> @@ -1415,10 +1417,12 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
>   			&info->mask);
>   		if (!(info->status & ~info->mask))
>   			return 0;
> +		info->level = KERN_WARNING;

I recommend setting this when initializing the info->level at the caller end (to match
other callers)

>   	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
>   		   type == PCI_EXP_TYPE_RC_EC ||
>   		   type == PCI_EXP_TYPE_DOWNSTREAM ||
> -		   info->severity == AER_NONFATAL) {
> +		   info->severity == AER_NONFATAL ||
> +		   (info->severity == AER_FATAL && link_healthy)) {
>   
>   		/* Link is still healthy for IO reads */
>   		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
> @@ -1427,7 +1431,7 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
>   			&info->mask);
>   		if (!(info->status & ~info->mask))
>   			return 0;
> -
> +		info->level = KERN_ERR;
>   		/* Get First Error Pointer */
>   		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &aercc);
>   		info->first_error = PCI_ERR_CAP_FEP(aercc);
> @@ -1451,11 +1455,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>   
>   	/* Report all before handling them, to not lose records by reset etc. */
>   	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
> -		if (aer_get_device_error_info(e_info, i))
> +		if (aer_get_device_error_info(e_info, i, false))
>   			aer_print_error(e_info, i);
>   	}
>   	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
> -		if (aer_get_device_error_info(e_info, i))
> +		if (aer_get_device_error_info(e_info, i, false))
>   			handle_error_source(e_info->dev[i], e_info);
>   	}
>   }
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index f6069f621683..21c4e8371279 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -284,7 +284,7 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>   		pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
>   			 status);
>   		if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
> -		    aer_get_device_error_info(&info, 0)) {
> +		    aer_get_device_error_info(&info, 0, false)) {
>   			aer_print_error(&info, 0);
>   			pci_aer_clear_nonfatal_status(pdev);
>   			pci_aer_clear_fatal_status(pdev);
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index bebe4bc111d7..4e65eac809d1 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -215,6 +215,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	struct pci_dev *bridge;
>   	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
>   	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +	struct aer_err_info info;
>   
>   	/*
>   	 * If the error was detected by a Root Port, Downstream Port, RCEC,
> @@ -253,6 +254,16 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   			pci_warn(bridge, "subordinate device reset failed\n");
>   			goto failed;
>   		}
> +
> +		/* Link recovered, report fatal errors of RCiEP or EP */
> +		if (state == pci_channel_io_frozen &&
> +		    (type == PCI_EXP_TYPE_ENDPOINT || type == PCI_EXP_TYPE_RC_END)) {
> +			aer_add_error_device(&info, dev);
> +			info.severity = AER_FATAL;
info.level = KERN_ERR ?
> +			if (aer_get_device_error_info(&info, 0, true))
> +				aer_print_error(&info, 0);
> +			pci_dev_put(dev);

Like Lukas mentioned, it needs a comment about why you need this.

> +		}
>   	}
>   
>   	if (status == PCI_ERS_RESULT_NEED_RESET) {

