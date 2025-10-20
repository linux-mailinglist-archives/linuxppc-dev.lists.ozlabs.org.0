Return-Path: <linuxppc-dev+bounces-13072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0311BF2FA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 20:43:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cr47Q1TqXz304h;
	Tue, 21 Oct 2025 05:43:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760985794;
	cv=none; b=bkX+bgLRy0KwL7XkwXh3774E8eGksHTx6lacP5aznQIitkrC9zVDV9OX6N3aZbDH/Uvu4RiZaRfohcWJ8SbNXoKOVaQipyMQLnx/1jzGZQPFoJLp+xi+HioKbPNsF1yMM3ocPPkbsZCaOwINrNEbYGwaRW1nKWEPFKf5pMu/VLgxdfoKKkXeJJEByu+L6EbbQmyRkwtMrzBk74IM1AeBtUw+hJhGPgjbyKd8U9Pi8NNR8Fby0bUD54ccNYaBCt8RuqQjKMsdjNT6X643yY8zAGOOmRQe8fr2s2l/+iXNNX7PviZIygWQ0WQhK5wJRXfvftTotnoPHPnFjqNhpclSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760985794; c=relaxed/relaxed;
	bh=fWtPDhy/DDIm+v5Ys5cGbSa4zhydw/i2r68JpIiUvvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ut6aIFIVMd+etWPbba974yc7jVFKtu2wzLf+1Oz4GUKq9uAJlUTdrsTNBE+1rFuAk/4i6Gkv0mH02UDQmE3bZUQOtHEoaeU/veCjvvE9cHgvinpl93RqecQXZT14I8xAphVgmlKNWZufOcDRnlnPcmyTd2t+G2d7LJaTcJNAu2NgkkuHd5HQBrMxN/LNas0KRr0FDg8Cyklaagh2TmYqZx1wo61fZanMt3KFIKKlMNotIBP6YL3VNsmS6bZVbgzK0bIepcqRVbyEMAfeSj6gpvGHbDfyIgq0sepmZvPLKfcNd9yXdyGOsxddkit87N/WqI3vRyB99qZOuCkUr5n/qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D3BFKckM; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D3BFKckM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cr47P1P0vz2ySV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:43:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760985793; x=1792521793;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8rrgzNNkAXQJ2s3G7iaOcQ9ClFqvPz61hpFmah8TFKQ=;
  b=D3BFKckMwJD0mWmpo87Sp4hKVpCaitpwcfdLFZW4pijvtOUD4twt2mlD
   8h1AbBIddE+GBFPdOi4QgvrostFlBlYy+uE1U9kV/SBCEu5UrdrSU0dUX
   kLUzKkL/PYfIbXlrJlkCaXjM06k5M5VntqzHPSV/0LV6YZrKMnt9i/GWc
   72nL+8khEmSGZzMPGBEItj2p74POigCkQFZr+nvsax5fl6RotdtecWw8H
   EV5tRAND1Npa8vTzwTSgeB6MPKa9KchmvDS2EWF3gDnZuVXNdFwH5gt2v
   axVSieZ/Uk6mee5sWPKtN+k6ewZJtJ5J6seB+fKO3TEms+B2NqkguI0kd
   A==;
X-CSE-ConnectionGUID: WP5p/xlVQPSMBKUjXbJoWw==
X-CSE-MsgGUID: T8NGYGfoRrC1oO1brHqkFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66969555"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="66969555"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 11:43:11 -0700
X-CSE-ConnectionGUID: 62lNo2+SRdyU50TAsi/wNg==
X-CSE-MsgGUID: 38MMGEGuRXuYXjQADXH3Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="187416438"
Received: from skuppusw-desk2.jf.intel.com (HELO [10.165.154.101]) ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 11:43:12 -0700
Message-ID: <a92c343a-919d-4940-b142-4919d90eb9f3@linux.intel.com>
Date: Mon, 20 Oct 2025 11:43:11 -0700
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
Subject: Re: [PATCH v6 4/5] PCI/ERR: Use pcie_aer_is_native() to check for
 native AER control
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com, lukas@wunner.de
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-5-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20251015024159.56414-5-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 10/14/25 19:41, Shuai Xue wrote:
> Replace the manual checks for native AER control with the
> pcie_aer_is_native() helper, which provides a more robust way
> to determine if we have native control of AER.
>
> No functional changes intended.
>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/err.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 4e65eac809d1..097990094b71 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -214,7 +214,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	int type = pci_pcie_type(dev);
>   	struct pci_dev *bridge;
>   	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
> -	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
>   	struct aer_err_info info;
>   
>   	/*
> @@ -289,7 +288,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	 * it is responsible for clearing this status.  In that case, the
>   	 * signaling device may not even be visible to the OS.
>   	 */
> -	if (host->native_aer || pcie_ports_native) {
> +	if (pcie_aer_is_native(dev)) {
>   		pcie_clear_device_status(dev);
>   		pci_aer_clear_nonfatal_status(dev);
>   	}

