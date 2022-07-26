Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 465DA581684
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 17:34:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsgvM1l4Jz3cFL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 01:34:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKbW8vdH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKbW8vdH;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lsgtg2hwlz3bbQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 01:34:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658849643; x=1690385643;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5I+V662NLC2jjOM/6eWnzGMznOWDTJj0WWANyuaqAc4=;
  b=oKbW8vdHVyGBqnOKwdc0AEB2JVeS+55k7aJQfu8SJzb+G/pm5wTk+TJi
   zWHDXY4ZEbr2s3trOVpgGMNlf8m/mV8X2OZ6971M4/bx/iwKn1MGkQ+Ie
   YuwN0HLdwDs0e5YPvPy3Ds4+qPWn9uzDQbfKXjO9lW/hQqYZtmtypkRNJ
   DTTi9gCK3fkXIPJxQy3UPcFhG9W0LojveZMLMvhQ3pn3ysYpZFDF07zoX
   vPJKZ0UwHuWAksKbROZWvvWftxnAsDcnPmbr2K9OPTPClJvCvJlUJY2jk
   68CLEU2jL2YaQg7zPkxkzM1mwryXffzXlaaIOtaMu2dk9cJSynGBC0vA+
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="374284434"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="374284434"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 08:33:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="927378192"
Received: from arianrah-mobl2.amr.corp.intel.com (HELO [10.251.20.146]) ([10.251.20.146])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 08:33:54 -0700
Message-ID: <b41d1840-b726-2caa-5bc8-69c3aeb230cf@linux.intel.com>
Date: Tue, 26 Jul 2022 08:33:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2] PCI/ERR: Use pcie_aer_is_native() to judge whether OS
 owns AER
Content-Language: en-US
To: Zhuo Chen <chenzhuo.1@bytedance.com>, ruscur@russell.cc,
 oohall@gmail.com, bhelgaas@google.com
References: <20220726020527.99816-1-chenzhuo.1@bytedance.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220726020527.99816-1-chenzhuo.1@bytedance.com>
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



On 7/25/22 7:05 PM, Zhuo Chen wrote:
> The AER status of the device that reported the error rather than
> the first downstream port is cleared after commit 7d7cbeaba5b7
> ("PCI/ERR: Clear status of the reporting device"). So "a bridge
> may not exist" which commit aa344bc8b727 ("PCI/ERR: Clear AER
> status only when we control AER") referring to is no longer
> existent, and we just use pcie_aer_is_native() in stead of
> "host->native_aer || pcie_ports_native".

IMO, above history is not required to justify using pcie_aer_is_native()
in place of "host->native_aer || pcie_ports_native".

> 
> pci_aer_clear_nonfatal_status() already has pcie_aer_is_native(),
> so we move pci_aer_clear_nonfatal_status() out of
> pcie_aer_is_native().

Moving it outside (pcie_aer_is_native()) does not optimize the
code. So I think it is better to leave it inside.

> 
> Replace statements that judge whether OS owns AER in
> get_port_device_capability() with pcie_aer_is_native(), which has
> no functional changes.
> 
> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---
> v2:
> - Add details and note in commit log
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

The above comment is still applicable. So I think you don't need to remove it.

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
