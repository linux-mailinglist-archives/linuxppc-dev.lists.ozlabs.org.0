Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCED581E7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 06:02:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt0Vf75PHz3cgT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 14:02:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SNiqVPvb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SNiqVPvb;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt0V037P9z3blS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 14:02:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658894536; x=1690430536;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qPDH2zg55z0dq693EvtAztxxc5KcUkiwaVa+S6O66dg=;
  b=SNiqVPvbLjevTY21/o6K3CYVXwoTtl47pn7UJeRbqsFW56Zz+y1ZWuV3
   915jX2c9yHw5528RqMfQkDsnsTJ+/SIW4c+ZL3KIJbmYhQJkOMQIVtY85
   waRaYrM05PRsNM26xeoy7EJm3GUqDWP/yoUO1G/TpLU4nDeGpXilbvNkj
   pA3yhQ5wzBIRloIyhe03PiELT/rJ51TNhTIhAV63MWr/O9xslIdl1QCxz
   kdLw6jl4CrbHUhTNIAOcgoWqUEMiZ5H//vEi/m2MrYJMZosM3QhRja4Hj
   KNC2+qddG9OhwTv8nFJWioqMFheORaJZuNA++Z9N9qeNE2cmoczMvwWI6
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="374437666"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="374437666"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 21:02:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="927631462"
Received: from arianrah-mobl2.amr.corp.intel.com (HELO [10.251.20.146]) ([10.251.20.146])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 21:02:11 -0700
Message-ID: <b5c746db-f6a0-d89e-6db5-e4a206c9237a@linux.intel.com>
Date: Tue, 26 Jul 2022 21:02:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v3] PCI/ERR: Use pcie_aer_is_native() to judge whether OS
 owns AER
Content-Language: en-US
To: Zhuo Chen <chenzhuo.1@bytedance.com>, ruscur@russell.cc,
 oohall@gmail.com, bhelgaas@google.com
References: <20220727035334.9997-1-chenzhuo.1@bytedance.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220727035334.9997-1-chenzhuo.1@bytedance.com>
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



On 7/26/22 8:53 PM, Zhuo Chen wrote:
> Use pcie_aer_is_native() in place of "host->native_aer ||
> pcie_ports_native" to judge whether OS has native control of AER
> in pcie_do_recovery().
> 
> Replace "dev->aer_cap && (pcie_ports_native || host->native_aer)" in
> get_port_device_capability() with pcie_aer_is_native(), which has no
> functional changes.
> 
> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---

Patch looks better now. It looks like following two changes
can also be replaced with pcie_aer_is_native() check.

drivers/pci/pcie/aer.c:1407:	if ((host->native_aer || pcie_ports_native) && aer) {
drivers/pci/pcie/aer.c:1426:	if ((host->native_aer || pcie_ports_native) && aer) {



> Changelog:
> v3:
> - Simplify why we use pcie_aer_is_native().
> - Revert modification of pci_aer_clear_nonfatal_status() and comments.
> v2:
> - Add details and note in commit log.
> ---
>  drivers/pci/pcie/err.c          | 3 +--
>  drivers/pci/pcie/portdrv_core.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 0c5a143025af..121a53338e44 100644
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
> @@ -243,7 +242,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  	 * it is responsible for clearing this status.  In that case, the
>  	 * signaling device may not even be visible to the OS.
>  	 */
> -	if (host->native_aer || pcie_ports_native) {
> +	if (pcie_aer_is_native(dev)) {
>  		pcie_clear_device_status(dev);
>  		pci_aer_clear_nonfatal_status(dev);
>  	}
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
