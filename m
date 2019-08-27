Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3D9A28F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 23:31:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KG4y2QRGzDsMs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 07:31:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HwNC6YPGzDq77
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 03:09:43 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 10:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,438,1559545200"; d="scan'208";a="380107312"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 27 Aug 2019 10:09:41 -0700
Received: from [10.54.74.33] (skuppusw-desk.jf.intel.com [10.54.74.33])
 by linux.intel.com (Postfix) with ESMTP id 0F06E580409;
 Tue, 27 Aug 2019 10:09:41 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] PCI/AER: Use for_each_set_bit()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
References: <20190827151823.75312-1-andriy.shevchenko@linux.intel.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel
Message-ID: <bddfd223-fa9b-dd7c-6997-b9bc568ef2b0@linux.intel.com>
Date: Tue, 27 Aug 2019 10:06:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827151823.75312-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Fri, 30 Aug 2019 07:29:31 +1000
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
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/27/19 8:18 AM, Andy Shevchenko wrote:
> This simplifies and standardizes slot manipulation code
> by using for_each_set_bit() library function.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>   drivers/pci/pcie/aer.c | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index b45bc47d04fe..f883f81d759a 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -15,6 +15,7 @@
>   #define pr_fmt(fmt) "AER: " fmt
>   #define dev_fmt pr_fmt
>   
> +#include <linux/bitops.h>
>   #include <linux/cper.h>
>   #include <linux/pci.h>
>   #include <linux/pci-acpi.h>
> @@ -657,7 +658,8 @@ const struct attribute_group aer_stats_attr_group = {
>   static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>   				   struct aer_err_info *info)
>   {
> -	int status, i, max = -1;
> +	unsigned long status = info->status & ~info->mask;
> +	int i, max = -1;
>   	u64 *counter = NULL;
>   	struct aer_stats *aer_stats = pdev->aer_stats;
>   
> @@ -682,10 +684,8 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>   		break;
>   	}
>   
> -	status = (info->status & ~info->mask);
> -	for (i = 0; i < max; i++)
> -		if (status & (1 << i))
> -			counter[i]++;
> +	for_each_set_bit(i, &status, max)
> +		counter[i]++;
>   }
>   
>   static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
> @@ -717,14 +717,11 @@ static void __print_tlp_header(struct pci_dev *dev,
>   static void __aer_print_error(struct pci_dev *dev,
>   			      struct aer_err_info *info)
>   {
> -	int i, status;
> +	unsigned long status = info->status & ~info->mask;
>   	const char *errmsg = NULL;
> -	status = (info->status & ~info->mask);
> -
> -	for (i = 0; i < 32; i++) {
> -		if (!(status & (1 << i)))
> -			continue;
> +	int i;
>   
> +	for_each_set_bit(i, &status, 32) {
>   		if (info->severity == AER_CORRECTABLE)
>   			errmsg = i < ARRAY_SIZE(aer_correctable_error_string) ?
>   				aer_correctable_error_string[i] : NULL;

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer

