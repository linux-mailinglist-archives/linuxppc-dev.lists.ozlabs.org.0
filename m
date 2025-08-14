Return-Path: <linuxppc-dev+bounces-10966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4795EB2587A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 02:40:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2RH4605Nz30TM;
	Thu, 14 Aug 2025 10:40:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755132032;
	cv=none; b=S6czneF6iw8ag81O1rcLZnbYsXQAGW/HdV4FFvMuOhxOQSlxl7sfpddMQnw28HPhE4hdmw34e/JcfVkZjp6v1FDhsk/UjQ44gavIjVOM0GBN5zvmX/EOYoVM9M0Qq/eYrZ/s8hqhZ9dFFD68XuFfics0KVbvBDSKtbMVC30v5psNMsQkE2BuDrwHeZiqcrQhuhnPk7kTbdO8BGOqtww6dhXVcePHk6EnvPdcR7kSok8cv+cRI/Wz0IRm9n1hQt4BfuddUFo1XTXPp2w/mwH4xId+kCtu7ww7v/KRwbDpbt0S4WSZ8WAsL9vR+oQfHD9C68AATgCNSU/cOz1s/UTWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755132032; c=relaxed/relaxed;
	bh=leEl8NhZNHj91L5565KCjFgPCWoCsKwacsX2V7IJRHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXriON3PxyU356CBwCTBcGjciCtMbFbWF5tTQKEKBHCEYkzT0tQ6Lw7xE7gX+KNlCFPHIyBoEC5/k4VdBmUWj1kXyBmT7CEj6mD6yG1qTD1gSQa31ziYYl9NQ+BG0Y+d/HTx1/h5OLiGCVGsp/VWrelKQDzJ+ojLBF8j5YMvn8A9MuIc69LAWbDTD9tcu3FyblsEEKj8x6+u5l5fnpIWrUuJdlmAXwpiN0sc55Psb15dDVrvFU6ECM24a4CrzS5tDI5AVx5NoOIVDpH4dARaYBCViPddsOcFWvugIGa2MUnO0v3sQ7W0anZ5TjKNllIDM2aelvCl05YT/oiuy8+MrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HunAsH9m; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HunAsH9m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2RH14jD2z30Sy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 10:40:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755132030; x=1786668030;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TN6yIRy/n3GAXu3+Cz6SHsLoEcKFJfcymnW3CHC41C4=;
  b=HunAsH9mDfsIPHqbGaYJbMySypiLy/o4Jzp64rsD1NC7399u1WO+MLfe
   7XocbqD4D51wiI+ORDjDEwTB+G7W9TuRqbtCl2h0up3nzh1RKXTCv+M30
   jTTnWicBmAe2F8rypIOkhmQe6Fivb9P2b9WbKuIOV1XltIvPhDvmcOop7
   uUoPTjo/ZCYl4NlT04L+NkZsEluTxlSGbeMkTKARex9VSjZVpnNQ+VAHo
   WXjnAHe2wCw/dZIvMeU4mnQ0nTB9x6K+JfDzJANg3uzxfBjaQBYxJW9QT
   nJTndUD9zUK9nz/qhoZq4n6RoJDcdc5I6D9leATBcLMoxNXa1TTAl61QG
   g==;
X-CSE-ConnectionGUID: XiALF0ScSEKgb8TWsXvPig==
X-CSE-MsgGUID: N4LBPFR4SbemNS9pfK0G+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68521645"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68521645"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 17:40:25 -0700
X-CSE-ConnectionGUID: 3UkUsY5oR+mykk3Pf1Th3Q==
X-CSE-MsgGUID: ba5Gof1LSTa66Z6VAA22jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="203795622"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 17:40:25 -0700
Received: from [10.124.222.231] (unknown [10.124.222.231])
	by linux.intel.com (Postfix) with ESMTP id 82EC720B571C;
	Wed, 13 Aug 2025 17:40:23 -0700 (PDT)
Message-ID: <59308229-24ed-4b8a-b398-cc47c61dfc47@linux.intel.com>
Date: Wed, 13 Aug 2025 17:40:17 -0700
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
Subject: Re: [PATCH 5/5] PCI/ERR: Remove remnants of .link_reset() callback
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "Sean C. Dardis" <sean.c.dardis@intel.com>,
 Terry Bowman <terry.bowman@amd.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver OHalloran <oohall@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 Edward Cree <ecree.xilinx@gmail.com>, linux-net-drivers@amd.com,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org
References: <cover.1755008151.git.lukas@wunner.de>
 <1d72a891a7f57115e78a73046e776f7e0c8cd68f.1755008151.git.lukas@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <1d72a891a7f57115e78a73046e776f7e0c8cd68f.1755008151.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/12/25 10:11 PM, Lukas Wunner wrote:
> Back in 2017, commit 2fd260f03b6a ("PCI/AER: Remove unused .link_reset()
> callback") removed .link_reset() from struct pci_error_handlers, but left
> a few code comments behind which still mention it.  Remove them.
>
> The code comments in the SolarFlare Ethernet drivers point out that no
> .mmio_enabled() callback is needed because the driver's .error_detected()
> callback always returns PCI_ERS_RESULT_NEED_RESET, which causes
> pcie_do_recovery() to skip .mmio_enabled().  That's not quite correct
> because efx_io_error_detected() does return PCI_ERS_RESULT_RECOVERED under
> certain conditions and then .mmio_enabled() would indeed be called if it
> were implemented.  Remove this misleading portion of the code comment as
> well.
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/net/ethernet/sfc/efx_common.c       | 3 ---
>   drivers/net/ethernet/sfc/falcon/efx.c       | 3 ---
>   drivers/net/ethernet/sfc/siena/efx_common.c | 3 ---
>   drivers/scsi/lpfc/lpfc_init.c               | 2 +-
>   4 files changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/net/ethernet/sfc/efx_common.c b/drivers/net/ethernet/sfc/efx_common.c
> index 5a14d94163b1..e8fdbb62d872 100644
> --- a/drivers/net/ethernet/sfc/efx_common.c
> +++ b/drivers/net/ethernet/sfc/efx_common.c
> @@ -1258,9 +1258,6 @@ static void efx_io_resume(struct pci_dev *pdev)
>   
>   /* For simplicity and reliability, we always require a slot reset and try to
>    * reset the hardware when a pci error affecting the device is detected.
> - * We leave both the link_reset and mmio_enabled callback unimplemented:
> - * with our request for slot reset the mmio_enabled callback will never be
> - * called, and the link_reset callback is not used by AER or EEH mechanisms.
>    */
>   const struct pci_error_handlers efx_err_handlers = {
>   	.error_detected = efx_io_error_detected,
> diff --git a/drivers/net/ethernet/sfc/falcon/efx.c b/drivers/net/ethernet/sfc/falcon/efx.c
> index b07f7e4e2877..0c784656fde9 100644
> --- a/drivers/net/ethernet/sfc/falcon/efx.c
> +++ b/drivers/net/ethernet/sfc/falcon/efx.c
> @@ -3128,9 +3128,6 @@ static void ef4_io_resume(struct pci_dev *pdev)
>   
>   /* For simplicity and reliability, we always require a slot reset and try to
>    * reset the hardware when a pci error affecting the device is detected.
> - * We leave both the link_reset and mmio_enabled callback unimplemented:
> - * with our request for slot reset the mmio_enabled callback will never be
> - * called, and the link_reset callback is not used by AER or EEH mechanisms.
>    */
>   static const struct pci_error_handlers ef4_err_handlers = {
>   	.error_detected = ef4_io_error_detected,
> diff --git a/drivers/net/ethernet/sfc/siena/efx_common.c b/drivers/net/ethernet/sfc/siena/efx_common.c
> index a0966f879664..35036cc902fe 100644
> --- a/drivers/net/ethernet/sfc/siena/efx_common.c
> +++ b/drivers/net/ethernet/sfc/siena/efx_common.c
> @@ -1285,9 +1285,6 @@ static void efx_io_resume(struct pci_dev *pdev)
>   
>   /* For simplicity and reliability, we always require a slot reset and try to
>    * reset the hardware when a pci error affecting the device is detected.
> - * We leave both the link_reset and mmio_enabled callback unimplemented:
> - * with our request for slot reset the mmio_enabled callback will never be
> - * called, and the link_reset callback is not used by AER or EEH mechanisms.
>    */
>   const struct pci_error_handlers efx_siena_err_handlers = {
>   	.error_detected = efx_io_error_detected,
> diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
> index 4081d2a358ee..cf08bb5b37c3 100644
> --- a/drivers/scsi/lpfc/lpfc_init.c
> +++ b/drivers/scsi/lpfc/lpfc_init.c
> @@ -14377,7 +14377,7 @@ lpfc_sli_prep_dev_for_perm_failure(struct lpfc_hba *phba)
>    * as desired.
>    *
>    * Return codes
> - * 	PCI_ERS_RESULT_CAN_RECOVER - can be recovered with reset_link
> + *	PCI_ERS_RESULT_CAN_RECOVER - can be recovered without reset
>    * 	PCI_ERS_RESULT_NEED_RESET - need to reset before recovery
>    * 	PCI_ERS_RESULT_DISCONNECT - device could not be recovered
>    **/

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


