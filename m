Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00B52370E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 17:21:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyzCT42Yrz3cHY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 01:21:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mMLyfzrr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mMLyfzrr; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyzBm2gnSz3brn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 01:21:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652282464; x=1683818464;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PQuR+HgvaEKC/2b83oaJxBCQ61N54Tef7qI8lAy9YJM=;
 b=mMLyfzrrAsFLi9qMjCFA6ELBbXrvGJB7nO2Ik//y5M9X/upmazQzsG6Y
 WQxZPGqxOdy9Rh/CT9NuF7h7MYD4s03SeZkQLztwZ4/vlRIPzqv/HzmQ0
 IgK5KoaK2esEW93Qpw9pO805wirj9eznQfYRqjAyEx0v9xQ0rapsek8Rd
 SRboMNtFCL/GDAA/hsTRkIp6/jTlktMRw9PS7ofU0FtXm9QQv4wUcmU0B
 GhZJU+BLXNN5DiHLJanTsyRkSmP8XPJJFU3/GHjyGxuj5oWvw7VC6kiJf
 C/5VgsIdj+0cwOscl0l0tLPfxLycH/BI6KkKiynYbyU9clkyf4yG3Onay Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269397146"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269397146"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 08:19:56 -0700
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="697620911"
Received: from jmpurse-mobl.amr.corp.intel.com (HELO [10.255.230.30])
 ([10.255.230.30])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 08:19:54 -0700
Message-ID: <41f62ad1-fee7-3509-f670-b62db8c37843@linux.intel.com>
Date: Wed, 11 May 2022 08:19:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH v3] PCI/AER: Handle Multi UnCorrectable/Correctable errors
 properly
Content-Language: en-US
To: Bjorn Helgaas <bhelgaas@google.com>, Russell Currey <ruscur@russell.cc>,
 Oliver OHalloran <oohall@gmail.com>
References: <20220418150237.1021519-1-sathyanarayanan.kuppuswamy@linux.intel.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220418150237.1021519-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bjorn,

On 4/18/22 8:02 AM, Kuppuswamy Sathyanarayanan wrote:
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
>   static irqreturn_t aer_irq(int irq, void *context)
>           struct aer_err_source e_src = {};
> 
>           pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS,
> 				&e_src.status);
>   +       pci_dbg(pdev->port, "Root Error Status: %04x\n",
>   +		e_src.status);
>           if (!(e_src.status & AER_ERR_STATUS_MASK))
>                   return IRQ_NONE;
> 
>   +       mdelay(5000);
> 
>   # Prep injection data for a correctable error.
>   $ cd /sys/kernel/debug/apei/einj
>   $ echo 0x00000040 > error_type
>   $ echo 0x4 > flags
>   $ echo 0x891000 > param4
> 
>   # Root Error Status is initially clear
>   $ setpci -s <Dev ID> ECAP0001+0x30.w
>   0000
> 
>   # Inject one error
>   $ echo 1 > error_inject
> 
>   # Interrupt received
>   pcieport <Dev ID>: AER: Root Error Status 0001
> 
>   # Inject another error (within 5 seconds)
>   $ echo 1 > error_inject
> 
>   # You will get a new IRQ with only multiple ERR_COR bit set
>   pcieport <Dev ID>: AER: Root Error Status 0002
> 
> Currently, the above issue has been only reproduced in the ICL server
> platform.
> 
> [Eric: proposed reproducing steps]
> Fixes: 4696b828ca37 ("PCI/AER: Hoist aerdrv.c, aer_inject.c up to drivers/pci/pcie/")
> Reported-by: Eric Badger <ebadger@purestorage.com>
> Reviewed-by: Ashok Raj <ashok.raj@intel.com>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
> 

Any comments on this patch? I'm wondering whether you are expecting any
changes to be done to it. Please let me know.

> Changes since v2:
>   * Added more details to the commit log.
>   * Rebased on v5.18-rc1.
> 
> Changes since v1:
>   * Added Fixes tag.
>   * Included reproducing steps proposed by Eric.
> 
>   drivers/pci/pcie/aer.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9fa1f97e5b27..7952e5efd6cf 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -101,6 +101,11 @@ struct aer_stats {
>   #define ERR_COR_ID(d)			(d & 0xffff)
>   #define ERR_UNCOR_ID(d)			(d >> 16)
>   
> +#define AER_ERR_STATUS_MASK		(PCI_ERR_ROOT_UNCOR_RCV |	\
> +					PCI_ERR_ROOT_COR_RCV |		\
> +					PCI_ERR_ROOT_MULTI_COR_RCV |	\
> +					PCI_ERR_ROOT_MULTI_UNCOR_RCV)
> +
>   static int pcie_aer_disable;
>   static pci_ers_result_t aer_root_reset(struct pci_dev *dev);
>   
> @@ -1196,7 +1201,7 @@ static irqreturn_t aer_irq(int irq, void *context)
>   	struct aer_err_source e_src = {};
>   
>   	pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS, &e_src.status);
> -	if (!(e_src.status & (PCI_ERR_ROOT_UNCOR_RCV|PCI_ERR_ROOT_COR_RCV)))
> +	if (!(e_src.status & AER_ERR_STATUS_MASK))
>   		return IRQ_NONE;
>   
>   	pci_read_config_dword(rp, aer + PCI_ERR_ROOT_ERR_SRC, &e_src.id);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
