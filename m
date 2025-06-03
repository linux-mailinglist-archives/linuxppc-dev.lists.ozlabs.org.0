Return-Path: <linuxppc-dev+bounces-9130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DADACCFA4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 00:11:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBlL83rN6z2xH9;
	Wed,  4 Jun 2025 08:11:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748988704;
	cv=none; b=UO68lBe+Y8BnCNOEtHCL6q+6Nqu/uFwgHmxR+68ZJaZ8XL9o5dQNyA15eu99yLG7SJoBENzlnzy5YQxJ9EAd8jhW8fhGtMSxLhwfBcYun4dLN/pXW5pQm+IgT6Q/mL6Ku2vnF8WKvhH3EhDPWQvuG2fDhn8tEfLG0mn9z5LJzwkxpyQii+gCE6P8z6e3jxOWQBG9jowf/+A8DsCFH+liy06Kq0qhPeO9TOPs+lDH7amd1vjV4aHJm4NOwcpFPYIXJkHXQEc2s1AxqlTlgqUccN/5/f9iTlWEIL21tX/1GnaNdD3GPt6vJtyQxfjlPEbrhcGz9Psa0ODGLW7vCDZ4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748988704; c=relaxed/relaxed;
	bh=RX9MjT1vuH2W65UENKnajltlWKR2YgjHHSSa5ZNyA/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zke2bkx6o2/VWNMW5zd1vQ2ABeMUqo5pYY7YoDIXw1SjPoYi+ehgWAf1tcCKA5udTmpfsFnuGEcU/EWV0yDIaQuNMIjDVQ2qCX+Ly1wf6sPw0A0w4xyguRcOYFy/mh6O+UdDNdeTCntEOCWd3h81vtzBuTu/R3c+4MvcGitKF2UJfmYCt9ZUN2Xvck3NYpM5spRZCuXFSsI806m6mTNAjpmvZN9PdPs3N6dsv4CmL50Nc7YfFnZjEu3ADuorBMcYilXXZsqRqJPqxcihd4jWRiWl1aIlzvu/vwS9JzIwlzti77HHAZjetQbfP6NXgaxfCIHjsnOIedLsUyQLTg6cbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Isb/b4tq; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Isb/b4tq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBlL55HPCz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 08:11:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748988702; x=1780524702;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/qJb0d3KxnUJqkywwyO+tlUKTUjKh39xC0iCWnoBKPQ=;
  b=Isb/b4tqqnIja5Xfmuh3jGSUqIz3JRRLCWDazewZdnHqRRCMRi/JLnDg
   ruNFbuQPFro4bpiRcKc3nbqi+Jdgqf4vWqYh8go3LmwECeCx7lD1K7Ebz
   aJqoU0mUNLgOZ8kmtzZqHuGIxb4xbXIpyoH3Ua79MWrmadvh17/6zNRY4
   4Z+UBYx2NM+RYaztUn1pXoTWr45hWpt0abhzGmFC41UwwdMF01DrcYP+E
   GDSI4TshDE8jTme7feM4KJMN3FiD2K/vLsdDiXJBhKRodJ4Ehf6rKvr8J
   yYQwtN0/nmjddDkZpfKtOjFosijjG15Tf9/08QSLeFlUpK3QSQ7T6cupU
   Q==;
X-CSE-ConnectionGUID: d8lPKmOhQFa2R0ZT8+p3sg==
X-CSE-MsgGUID: NzGSZGU1T+KHSQc0MMG/nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68485708"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="68485708"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 15:11:38 -0700
X-CSE-ConnectionGUID: 5DHWgVfNT86uu3dgCq7/5A==
X-CSE-MsgGUID: Kr40BjkLTIewR1u3X46eZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="175856255"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 15:11:37 -0700
Received: from [10.124.221.22] (unknown [10.124.221.22])
	by linux.intel.com (Postfix) with ESMTP id 4761420B5736;
	Tue,  3 Jun 2025 15:11:36 -0700 (PDT)
Message-ID: <4a0f5b75-d6d4-4914-bb17-16d717803aa5@linux.intel.com>
Date: Tue, 3 Jun 2025 15:11:35 -0700
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
Subject: Re: [PATCH 4/4 v3] ACPI: extlog: Trace CPER CXL Protocol Error
 Section
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
 <20250603155536.577493-5-fabio.m.de.francesco@linux.intel.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250603155536.577493-5-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 6/3/25 8:54 AM, Fabio M. De Francesco wrote:
> When Firmware First is enabled, BIOS handles errors first and then it makes
> them available to the kernel via the Common Platform Error Record (CPER)
> sections (UEFI 2.10 Appendix N). Linux parses the CPER sections via one of
> two similar paths, either ELOG or GHES. The errors managed by ELOG are
> signaled to the BIOS by the I/O Machine Check Architecture (I/O MCA).
>
> Currently, ELOG and GHES show some inconsistencies in how they report to
> userspace via trace events.
>
> Therefore, make the two mentioned paths act similarly by tracing the CPER
> CXL Protocol Error Section (UEFI v2.10, Appendix N.2.13).
>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/acpi/acpi_extlog.c | 64 ++++++++++++++++++++++++++++++++++++++
>   drivers/cxl/core/ras.c     |  6 ++++
>   include/cxl/event.h        |  2 ++
>   3 files changed, 72 insertions(+)
>
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index b2928ff297eda..de4f617f32d49 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -12,6 +12,7 @@
>   #include <linux/ratelimit.h>
>   #include <linux/edac.h>
>   #include <linux/ras.h>
> +#include <cxl/event.h>
>   #include <acpi/ghes.h>
>   #include <asm/cpu.h>
>   #include <asm/mce.h>
> @@ -160,6 +161,62 @@ static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
>   	pci_dev_put(pdev);
>   }
>   
> +static void
> +extlog_cxl_cper_handle_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> +				int severity)
> +{
> +#ifdef CONFIG_ACPI_APEI_PCIEAER
> +	struct cxl_cper_prot_err_work_data wd;
> +	u8 *dvsec_start, *cap_start;
> +
> +	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
> +		pr_err_ratelimited("CXL CPER invalid agent type\n");
> +		return;
> +	}
> +
> +	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
> +		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
> +		return;
> +	}
> +
> +	if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
> +		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
> +				   prot_err->err_len);
> +		return;
> +	}
> +
> +	if ((prot_err->agent_type == RCD || prot_err->agent_type == DEVICE ||
> +	     prot_err->agent_type == LD || prot_err->agent_type == FMLD) &&
> +	    !(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
> +		pr_warn(FW_WARN "CXL CPER no device serial number\n");
> +
> +	switch (prot_err->agent_type) {
> +	case RCD:
> +	case DEVICE:
> +	case LD:
> +	case FMLD:
> +	case RP:
> +	case DSP:
> +	case USP:
> +		memcpy(&wd.prot_err, prot_err, sizeof(wd.prot_err));
> +
> +		dvsec_start = (u8 *)(prot_err + 1);
> +		cap_start = dvsec_start + prot_err->dvsec_len;
> +
> +		memcpy(&wd.ras_cap, cap_start, sizeof(wd.ras_cap));
> +		wd.severity = cper_severity_to_aer(severity);
> +		break;
> +	default:
> +		pr_err_ratelimited("CXL CPER reserved agent type: %d\n",
> +				   prot_err->agent_type);
> +		return;
> +	}
> +
> +	cxl_cper_ras_handle_prot_err(&wd);
> +
> +#endif
> +}
> +
>   static int extlog_print(struct notifier_block *nb, unsigned long val,
>   			void *data)
>   {
> @@ -211,6 +268,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>   			if (gdata->error_data_length >= sizeof(*mem))
>   				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
>   						       (u8)gdata->error_severity);
> +		} else if (guid_equal(sec_type, &CPER_SEC_CXL_PROT_ERR)) {
> +			struct cxl_cper_sec_prot_err *prot_err =
> +				acpi_hest_get_payload(gdata);
> +
> +			extlog_cxl_cper_handle_prot_err(prot_err,
> +							gdata->error_severity);
>   		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
>   			struct cper_sec_pcie *pcie_err = acpi_hest_get_payload(gdata);
>   
> @@ -378,3 +441,4 @@ module_exit(extlog_exit);
>   MODULE_AUTHOR("Chen, Gong <gong.chen@intel.com>");
>   MODULE_DESCRIPTION("Extended MCA Error Log Driver");
>   MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("CXL");
> diff --git a/drivers/cxl/core/ras.c b/drivers/cxl/core/ras.c
> index 485a831695c70..56db290c88d35 100644
> --- a/drivers/cxl/core/ras.c
> +++ b/drivers/cxl/core/ras.c
> @@ -98,6 +98,12 @@ static void cxl_cper_handle_prot_err(struct cxl_cper_prot_err_work_data *data)
>   		cxl_cper_trace_uncorr_prot_err(pdev, data->ras_cap);
>   }
>   
> +void cxl_cper_ras_handle_prot_err(struct cxl_cper_prot_err_work_data *wd)
> +{
> +	cxl_cper_handle_prot_err(wd);
> +}
> +EXPORT_SYMBOL_NS_GPL(cxl_cper_ras_handle_prot_err, "CXL");
> +
>   static void cxl_cper_prot_err_work_fn(struct work_struct *work)
>   {
>   	struct cxl_cper_prot_err_work_data wd;
> diff --git a/include/cxl/event.h b/include/cxl/event.h
> index f9ae1796da85f..aef906e260330 100644
> --- a/include/cxl/event.h
> +++ b/include/cxl/event.h
> @@ -285,4 +285,6 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
>   }
>   #endif
>   
> +void cxl_cper_ras_handle_prot_err(struct cxl_cper_prot_err_work_data *wd);
> +
>   #endif /* _LINUX_CXL_EVENT_H */

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


