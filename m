Return-Path: <linuxppc-dev+bounces-9113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2122ACCE70
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 22:51:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBjYY55FNz2y92;
	Wed,  4 Jun 2025 06:51:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748983889;
	cv=none; b=ba60pK2f9aSfNtuKcAy/nxHhQiGO+Sf2zGQRkWxi7QKUzQcD/bTo+SJM0fMjQpUkGjqz1dHJW++dVGMwWnUe5CCiWPdjTO5dU5HLmqwOIYw1FEabUl9PaCJ0xIO+pumjpuUtnvIq0VuYyDJwLw9qlw/X6MEfPhnrxas2guaLUmuyctUCUEUnXALEeHxidYiGRi+A4+SxhgsDdTprzN4YyyCu8AIUCJ5vY3kpAk4Ky/prxKl77NsDCTLFFQufS+Ti5adEUmbkI15iJJe5RyZqPacfApjgOLngYt4oaI1dcYRhPhkYrOkbAnfMT3vg0UXOW3+DzjBuCat9jTKwIcX+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748983889; c=relaxed/relaxed;
	bh=8nFZV6rNgYMUEK3QBMor3kOM2m9ioehPTKYIFg+61qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lm45FRCfRsHHEYe26YJu6Gwcjh1V6J2N8vAU3LWILCQGpMTDLKQEGGWPEi+TaAV6qFAfjxcvfgZ6woAsvgFCY6DoxasOLRcEU4vn67z/wKk1bxnggcKowdMFFhIfbB03bs7CkfuErHvLSd9Qlcq0v62U+LL4uE4AZmeMSWWewyNT/mOJgdIPGc8Nmo5fR9b2UD6jooRoT+/cVz1kJgcwEQ+nTb514FT6o0aOsWM67HpxWnqkfwHvYTjBIrWXqvZv1LLTtDDGDZ6oTmuw6bTalyWdfHXrgYagVRzGsDYK/g2RZOtwQIsUAZMXnuTgYnhToLqWOaz/e+FdazsegnurBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kkLtjWIF; dkim-atps=neutral; spf=none (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kkLtjWIF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBjYV5rqcz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 06:51:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748983887; x=1780519887;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o4zOLvZFW8pO4zLwuxYUFfk4IAFaKCqbEJ5gNrQFVOg=;
  b=kkLtjWIFJmk2pvtQAb/lEITlShW8kI/6yZuWRB+sK+EinDhhbc8kZSVw
   bj9SuMkqEoJzVSgK4LQ+zGcOo4RUxzOkLjQy4nT/vrkSPuAEv5pEPQE9z
   +1uIkW/yCk4tnoijKd8YBGxHlAg5yr4gM0mVyYQOhalfD82wsb7suBP3E
   b6Wr0ymCCbFGJByIbHuT4wBuZdA8tWT+9GWU7y33rWhddKbyRTRwnQ9PU
   OPuw+4dJatOPmebb9gPLz85loJwlccRvPAeH3YKbsBFcvfKt9Qv8Q1s2K
   F4q7CzRUqL58GLW27caHipM+6prMIgU/dG1dMYxjUGTtricd3tYyRpEkT
   A==;
X-CSE-ConnectionGUID: /9arqpDLS6eyHvw/QvK31w==
X-CSE-MsgGUID: rwcAhxhHS6Wl8dLtPFYEDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="53668522"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="53668522"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 13:51:21 -0700
X-CSE-ConnectionGUID: AGrOcP48Te6x84iR91XP2w==
X-CSE-MsgGUID: wCO6PN/LQnmJUW2Bw83T/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="175839494"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 13:51:21 -0700
Received: from [10.124.221.22] (unknown [10.124.221.22])
	by linux.intel.com (Postfix) with ESMTP id B7E6620B58A2;
	Tue,  3 Jun 2025 13:51:19 -0700 (PDT)
Message-ID: <220323bb-ebe1-41f8-aca2-53bb9885ea0a@linux.intel.com>
Date: Tue, 3 Jun 2025 13:51:19 -0700
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
Subject: Re: [PATCH 2/4 v3] PCI/AER: Modify pci_print_aer() to take log level
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-edac@vger.kernel.org
Cc: Yazen Ghannam <yazen.ghannam@amd.com>
References: <20250603155536.577493-1-fabio.m.de.francesco@linux.intel.com>
 <20250603155536.577493-3-fabio.m.de.francesco@linux.intel.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250603155536.577493-3-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 6/3/25 8:54 AM, Fabio M. De Francesco wrote:
> Modify pci_print_aer() to take a printk() log level in preparation of a
> patch that logs PCIe Components and Link errors from ELOG.

I think you need to rebase this patch on top of latest PCI changes. A patch to
consolidate the AER error logging is pushed for v6.16 merge.

> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>   drivers/cxl/core/pci.c |  2 +-
>   drivers/pci/pcie/aer.c | 16 ++++++++--------
>   include/linux/aer.h    |  4 ++--
>   3 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
> index 3b80e9a76ba86..ad8d7939c2e1c 100644
> --- a/drivers/cxl/core/pci.c
> +++ b/drivers/cxl/core/pci.c
> @@ -885,7 +885,7 @@ static void cxl_handle_rdport_errors(struct cxl_dev_state *cxlds)
>   	if (!cxl_rch_get_aer_severity(&aer_regs, &severity))
>   		return;
>   
> -	pci_print_aer(pdev, severity, &aer_regs);
> +	pci_print_aer(KERN_ERR, pdev, severity, &aer_regs);
>   
>   	if (severity == AER_CORRECTABLE)
>   		cxl_handle_rdport_cor_ras(cxlds, dport);
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index a1cf8c7ef628a..d0ebf7c15afa9 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -760,7 +760,7 @@ int cper_severity_to_aer(int cper_severity)
>   EXPORT_SYMBOL_GPL(cper_severity_to_aer);
>   #endif
>   
> -void pci_print_aer(struct pci_dev *dev, int aer_severity,
> +void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
>   		   struct aer_capability_regs *aer)
>   {
>   	int layer, agent, tlp_header_valid = 0;
> @@ -785,14 +785,15 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>   	info.mask = mask;
>   	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
>   
> -	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
> +	pci_printk(level, dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
> +		   status, mask);
>   	__aer_print_error(dev, &info);
> -	pci_err(dev, "aer_layer=%s, aer_agent=%s\n",
> -		aer_error_layer[layer], aer_agent_string[agent]);
> +	pci_printk(level, dev, "aer_layer=%s, aer_agent=%s\n",
> +		   aer_error_layer[layer], aer_agent_string[agent]);
>   
>   	if (aer_severity != AER_CORRECTABLE)
> -		pci_err(dev, "aer_uncor_severity: 0x%08x\n",
> -			aer->uncor_severity);
> +		pci_printk(level, dev, "aer_uncor_severity: 0x%08x\n",
> +			   aer->uncor_severity);
>   
>   	if (tlp_header_valid)
>   		pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> @@ -1146,8 +1147,7 @@ static void aer_recover_work_func(struct work_struct *work)
>   			       PCI_SLOT(entry.devfn), PCI_FUNC(entry.devfn));
>   			continue;
>   		}
> -		pci_print_aer(pdev, entry.severity, entry.regs);
> -
> +		pci_print_aer(KERN_ERR, pdev, entry.severity, entry.regs);
>   		/*
>   		 * Memory for aer_capability_regs(entry.regs) is being
>   		 * allocated from the ghes_estatus_pool to protect it from
> diff --git a/include/linux/aer.h b/include/linux/aer.h
> index 02940be66324e..45d0fb2e2e759 100644
> --- a/include/linux/aer.h
> +++ b/include/linux/aer.h
> @@ -64,8 +64,8 @@ static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>   static inline int pcie_aer_is_native(struct pci_dev *dev) { return 0; }
>   #endif
>   
> -void pci_print_aer(struct pci_dev *dev, int aer_severity,
> -		    struct aer_capability_regs *aer);
> +void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
> +		   struct aer_capability_regs *aer);
>   int cper_severity_to_aer(int cper_severity);
>   void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
>   		       int severity, struct aer_capability_regs *aer_regs);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


