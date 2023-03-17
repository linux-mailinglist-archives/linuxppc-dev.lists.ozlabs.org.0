Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 507376BF109
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 19:51:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdYBF1jKZz3f4T
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 05:51:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W317XfyR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W317XfyR;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdY9H2Mr5z3cf4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 05:50:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679079027; x=1710615027;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R3e7PiMz2+SnjvVMla+MAuiDQChIJrKCsnrgvzzqEqU=;
  b=W317XfyRF1dl1G8EAV2uUAqIW8zu3RYz2o6b62bjr1BtQcokthUXg5NX
   JTE1fzD5/JLWvSDacPV+92Ra3YTP4Mt1MoLWAu0rrCk7ZxhduY0/oDw+z
   vKgYBaR4EU1kIFPmSEx8sOn8s0RLH9oaTtm7baIcq0pWwuXGkQ0fWXCHs
   5wVLskQSoCZOPdT2jCa/gfi7jp2oTAOSoKOJP2vc4OMYNFYF4vcmoOPpW
   sVITl5tY1ek1NPiRMpQ26szOKSYFTLBvfdI/I1pB+vInhrjTCgaGNO0w9
   ihjsBDYoYcjBK+aH7QaylEU9alcVNhftPGBh7s1lxs2E+HpGC0yldwcdb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340694426"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="340694426"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 11:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="1009757420"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="1009757420"
Received: from ltd-ie-desk05.amr.corp.intel.com (HELO [10.209.31.165]) ([10.209.31.165])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 11:50:22 -0700
Message-ID: <bd48a3f0-138d-9c48-27d6-a5133f054c96@linux.intel.com>
Date: Fri, 17 Mar 2023 11:50:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCHv2 pci-next 1/2] PCI/AER: correctable error message as
 KERN_INFO
Content-Language: en-US
To: Grant Grundler <grundler@chromium.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
References: <20230317175109.3859943-1-grundler@chromium.org>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20230317175109.3859943-1-grundler@chromium.org>
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
Cc: linux-pci@vger.kernel.org, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rajat Jain <rajatja@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/17/23 10:51 AM, Grant Grundler wrote:
> Since correctable errors have been corrected (and counted), the dmesg output
> should not be reported as a warning, but rather as "informational".
> 
> Otherwise, using a certain well known vendor's PCIe parts in a USB4 docking
> station, the dmesg buffer can be spammed with correctable errors, 717 bytes
> per instance, potentially many MB per day.

Why don't you investigate why you are getting so many correctable errors?
Isn't solving the problem preferable to hiding the logs?

> 
> Given the "WARN" priority, these messages have already confused the typical
> user that stumbles across them, support staff (triaging feedback reports),
> and more than a few linux kernel devs. Changing to INFO will hide these
> messages from most audiences.
> 
> Signed-off-by: Grant Grundler <grundler@chromium.org>
> ---
>  drivers/pci/pcie/aer.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f6c24ded134c..cb6b96233967 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -687,23 +687,29 @@ static void __aer_print_error(struct pci_dev *dev,
>  {
>  	const char **strings;
>  	unsigned long status = info->status & ~info->mask;
> -	const char *level, *errmsg;
>  	int i;
>  
>  	if (info->severity == AER_CORRECTABLE) {
>  		strings = aer_correctable_error_string;
> -		level = KERN_WARNING;
> +		pci_info(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
> +			info->status, info->mask);
>  	} else {
>  		strings = aer_uncorrectable_error_string;
> -		level = KERN_ERR;
> +		pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
> +			info->status, info->mask);
>  	}
>  
>  	for_each_set_bit(i, &status, 32) {
> -		errmsg = strings[i];
> +		const char *errmsg = strings[i];
> +
>  		if (!errmsg)
>  			errmsg = "Unknown Error Bit";
>  
> -		pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
> +		if (info->severity == AER_CORRECTABLE)
> +			pci_info(dev, "   [%2d] %-22s%s\n", i, errmsg,
> +				info->first_error == i ? " (First)" : "");
> +		else
> +			pci_err(dev, "   [%2d] %-22s%s\n", i, errmsg,
>  				info->first_error == i ? " (First)" : "");
>  	}
>  	pci_dev_aer_stats_incr(dev, info);
> @@ -724,7 +730,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
>  	agent = AER_GET_AGENT(info->severity, info->status);
>  
> -	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
> +	level = (info->severity == AER_CORRECTABLE) ? KERN_INFO : KERN_ERR;
>  
>  	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
>  		   aer_error_severity_string[info->severity],
> @@ -797,14 +803,17 @@ void cper_print_aer(struct pci_dev *dev, int aer_severity,
>  	info.mask = mask;
>  	info.first_error = PCI_ERR_CAP_FEP(aer->cap_control);
>  
> -	pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
>  	__aer_print_error(dev, &info);
> -	pci_err(dev, "aer_layer=%s, aer_agent=%s\n",
> -		aer_error_layer[layer], aer_agent_string[agent]);
>  
> -	if (aer_severity != AER_CORRECTABLE)
> +	if (aer_severity == AER_CORRECTABLE) {
> +		pci_info(dev, "aer_layer=%s, aer_agent=%s\n",
> +			aer_error_layer[layer], aer_agent_string[agent]);
> +	} else {
> +		pci_err(dev, "aer_layer=%s, aer_agent=%s\n",
> +			aer_error_layer[layer], aer_agent_string[agent]);
>  		pci_err(dev, "aer_uncor_severity: 0x%08x\n",
>  			aer->uncor_severity);
> +	}
>  
>  	if (tlp_header_valid)
>  		__print_tlp_header(dev, &aer->header_log);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
