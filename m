Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74BA907E30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 23:30:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BlHSYjvV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0bDd4Gh1z3cSS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 07:30:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BlHSYjvV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Fri, 14 Jun 2024 07:30:04 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0bCw3Vj0z3cVW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 07:30:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718314205; x=1749850205;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YS29bszp9afz/G0r85TArT7huFYqmbOIu0J0gzVV/eY=;
  b=BlHSYjvVZEc4zR9dQTNa+mSGAPpFZItexx9ClEqsXaBW7bJLgz5GxYI0
   74Vc47JOK7/a6I89WVOxsBVV5Pesls1XxQ8WwFuQczj0tRMR6vbr8yNDr
   +yRwzCIGDcHSpurWUXhRN055o3qFKDKxCY6J8uQ/It1RmC3kHTfmdTtmh
   koEfJEEbRj/CPWm4oJzhqgezHlLelH12HnlwzuEMkmnyXfG/cS7V2ntEz
   C1g2fWw0v9FzeaNEl5eCum4PcHcenHYY0+/+q6BLbzSSEtqsvBB1YWHNq
   jsXYi+3uDGnMnC8qpyGllF5xVZjy7zV37oVr2cooCbLc/2yJX11xDNhf/
   g==;
X-CSE-ConnectionGUID: v+SsdTCfT6Clkru5qwuB1w==
X-CSE-MsgGUID: bLp0WZEGRFSKZmQJCLIEPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25810077"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="25810077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 14:28:57 -0700
X-CSE-ConnectionGUID: uAEz45bZQayb3m06ogpjDg==
X-CSE-MsgGUID: 8wYPM8OIR3aM0UJEbKdGaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40173275"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO [10.124.223.37]) ([10.124.223.37])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 14:28:56 -0700
Message-ID: <0a93b8bd-c50b-4ffd-8d6c-ba3b20b601b5@linux.intel.com>
Date: Thu, 13 Jun 2024 14:28:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] PCI/AER: Print UNCOR_STATUS bits that might be
 ANFE
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, linux-pci@vger.kernel.org
References: <20240509084833.2147767-1-zhenzhong.duan@intel.com>
 <20240509084833.2147767-3-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240509084833.2147767-3-zhenzhong.duan@intel.com>
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
Cc: linmiaohe@huawei.com, alison.schofield@intel.com, rafael@kernel.org, sathyanarayanan.kuppuswamy@intel.com, erwin.tsaur@intel.com, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com, ira.weiny@intel.com, dave@stgolabs.net, dave.jiang@intel.com, vishal.l.verma@intel.com, Smita.KoralahalliChannabasappa@amd.com, linux-acpi@vger.kernel.org, helgaas@kernel.org, lenb@kernel.org, chao.p.peng@intel.com, rrichter@amd.com, yudong.wang@intel.com, bp@alien8.de, qingshun.wang@linux.intel.com, jonathan.cameron@huawei.com, bhelgaas@google.com, dan.j.williams@intel.com, linux-edac@vger.kernel.org, tony.luck@intel.com, feiting.wanyan@intel.com, adam.c.preble@intel.com, mahesh@linux.ibm.com, lukas@wunner.de, james.morse@arm.com, linuxppc-dev@lists.ozlabs.org, shiju.jose@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/9/24 1:48 AM, Zhenzhong Duan wrote:
> When an Advisory Non-Fatal error(ANFE) triggers, both correctable error(CE)
> status and ANFE related uncorrectable error(UE) status will be printed:
>
>   AER: Correctable error message received from 0000:b7:02.0
>   PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
>     device [8086:0db0] error status/mask=00002000/00000000
>      [13] NonFatalErr
>     Uncorrectable errors that may cause Advisory Non-Fatal:
>      [18] TLP
>
> Tested-by: Yudong Wang <yudong.wang@intel.com>
> Co-developed-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---

LGTM

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>  drivers/pci/pcie/aer.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f2839b51321a..ed435f09ac27 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -681,6 +681,7 @@ static void __aer_print_error(struct pci_dev *dev,
>  {
>  	const char **strings;
>  	unsigned long status = info->status & ~info->mask;
> +	unsigned long anfe_status = info->anfe_status;
>  	const char *level, *errmsg;
>  	int i;
>  
> @@ -701,6 +702,20 @@ static void __aer_print_error(struct pci_dev *dev,
>  				info->first_error == i ? " (First)" : "");
>  	}
>  	pci_dev_aer_stats_incr(dev, info);
> +
> +	if (!anfe_status)
> +		return;
> +
> +	strings = aer_uncorrectable_error_string;
> +	pci_printk(level, dev, "Uncorrectable errors that may cause Advisory Non-Fatal:\n");
> +
> +	for_each_set_bit(i, &anfe_status, 32) {
> +		errmsg = strings[i];
> +		if (!errmsg)
> +			errmsg = "Unknown Error Bit";
> +
> +		pci_printk(level, dev, "   [%2d] %s\n", i, errmsg);
> +	}
>  }
>  
>  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

