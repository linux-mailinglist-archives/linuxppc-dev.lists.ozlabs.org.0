Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3174F5803DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 20:14:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls7Tw0xfDz3bwr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 04:14:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RTZJvahs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RTZJvahs;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls7TG4VG5z3blc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 04:13:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658772818; x=1690308818;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=W1W3K6HtndLxG/12lj9ntiMcXN03GrPr2INAm/PqZW0=;
  b=RTZJvahsnSeq4YS0Pc5IRJufvZyvK+Y5FUAKu89T3l/kaVfFxsnauBMw
   TFct3gjWEHTChyHDdH5N3XX9qQAYhuWpfPSHyok2VfOpuTdTesy2WFqK7
   2s9mt+P6R1qjxbFHYu8mYpw1Dx4qmE0o8XfJPjb2M3QhipmkKsR128CsM
   0zyo0C9De2AbxV9fkYqYRh4cy462MUGSQ8PPZ+EWs8iuSKdkKL1ZAlnXO
   VbBYVbIbLm0VpA8rGy8EprsqulOq/yD2T+jsXoAcEyxJOWKlpAbLNqXWu
   754GY67M2r6HXLAwcqL1YQXxIwI2OiTKGX3C4YG9Fdp6cw8jz+el3RFeG
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="288950050"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="288950050"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 11:13:35 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="575153907"
Received: from mgarner-mobl.amr.corp.intel.com (HELO [10.209.39.177]) ([10.209.39.177])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 11:13:35 -0700
Message-ID: <dcb634c3-7671-9073-555f-e861088cfcd0@linux.intel.com>
Date: Mon, 25 Jul 2022 11:13:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] PCI/ERR: Use pcie_aer_is_native() to judge whether OS
 owns AER
Content-Language: en-US
To: Zhuo Chen <chenzhuo.1@bytedance.com>, ruscur@russell.cc,
 oohall@gmail.com, bhelgaas@google.com
References: <20220725160131.83687-1-chenzhuo.1@bytedance.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220725160131.83687-1-chenzhuo.1@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-pci@vger.kernel.org, stuart.w.hayes@gmail.com, linux-kernel@vger.kernel.org, lukas@wunner.de, jan.kiszka@siemens.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/25/22 9:01 AM, Zhuo Chen wrote:
> After commit 7d7cbeaba5b7 ("PCI/ERR: Clear status of the reporting
> device"), the AER status of the device that reported the error
> rather than the first downstream port is cleared. So the problem
> in commit aa344bc8b727 ("PCI/ERR: Clear AER status only when we
> control AER") is no longer existent, and we change to use
> pcie_aer_is_native() here.
Can you add the details of the problem you are referring to? Also
include details about how this problem relates to your commit.

IIUC, your commit replaces "host->native_aer || pcie_ports_native"
with pcie_aer_is_native(dev, correct? If so, add a note in commit
log that it has no functional changes.

> 
> pci_aer_clear_nonfatal_status() already has pcie_aer_is_native(),
> so we move pci_aer_clear_nonfatal_status() out of
> pcie_aer_is_native().
> 
> Replace statements that judge whether OS owns AER in
> get_port_device_capability() with pcie_aer_is_native().
> 
> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---
>  drivers/pci/pcie/err.c          | 12 ++----------
>  drivers/pci/pcie/portdrv_core.c |  3 +--
>  2 files changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 0c5a143025af..28339c741555 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -184,7 +184,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  	int type = pci_pcie_type(dev);
>  	struct pci_dev *bridge;
>  	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
> -	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
>  
>  	/*
>  	 * If the error was detected by a Root Port, Downstream Port, RCEC,
> @@ -237,16 +236,9 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  	pci_dbg(bridge, "broadcast resume message\n");
>  	pci_walk_bridge(bridge, report_resume, &status);
>  
> -	/*
> -	 * If we have native control of AER, clear error status in the device
> -	 * that detected the error.  If the platform retained control of AER,
> -	 * it is responsible for clearing this status.  In that case, the
> -	 * signaling device may not even be visible to the OS.
> -	 */
> -	if (host->native_aer || pcie_ports_native) {
> +	if (pcie_aer_is_native(dev))
>  		pcie_clear_device_status(dev);
> -		pci_aer_clear_nonfatal_status(dev);
> -	}
> +	pci_aer_clear_nonfatal_status(dev);
>  	pci_info(bridge, "device recovery successful\n");
>  	return status;
>  
> diff --git a/drivers/pci/pcie/portdrv_core.c b/drivers/pci/pcie/portdrv_core.c
> index 604feeb84ee4..98c18f4a01b2 100644
> --- a/drivers/pci/pcie/portdrv_core.c
> +++ b/drivers/pci/pcie/portdrv_core.c
> @@ -221,8 +221,7 @@ static int get_port_device_capability(struct pci_dev *dev)
>  	}
>  
>  #ifdef CONFIG_PCIEAER
> -	if (dev->aer_cap && pci_aer_available() &&
> -	    (pcie_ports_native || host->native_aer)) {
> +	if (pcie_aer_is_native(dev) && pci_aer_available()) {
>  		services |= PCIE_PORT_SERVICE_AER;
>  
>  		/*

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
