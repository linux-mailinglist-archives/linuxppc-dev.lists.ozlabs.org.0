Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD33D8221F2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 20:23:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hw5ro70A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4N7J3DXsz3cVG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 06:23:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hw5ro70A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4N6T3CZQz3bpG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jan 2024 06:22:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704223377; x=1735759377;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fVCcKmpfYEHeBzGLIPKiA/LCVGfjiQfemd8HKgtcMv4=;
  b=hw5ro70AmYGsUM88kFEEKJUfqaNk7mdlh3Ni8dpO/MJUi1k1e6Llxm61
   P0ob+WfL4Fi94mBbO8ZpYCm7ghcm271EhcEquYzOaVYSrdqWdJic4NLbg
   sm625cJ7gnu3FbyxecdGE1hqsuMN1VLqAsf2YEWzxkuRU9ocnCkZaOU31
   1HRyKG0Nq8sz0QsiqVE8kF3zEr51A8iJIEmQn2R/NvVhG+C1xC9JtiJoi
   vfgGh+jRQlyIw9RDeE+T1NlQR/xY4/s9AeJB4KeJeaLXlbDYyMF3ONHna
   OVcRPyAYr5MIrHdqvPaJLkNFuJiqN3HEwFpnRLUHQD9mjvFoo/9HU+hxC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="428078500"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="428078500"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 11:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="1111132006"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="1111132006"
Received: from keithj1-mobl2.amr.corp.intel.com (HELO [10.209.44.31]) ([10.209.44.31])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 11:22:52 -0800
Message-ID: <6cc6adf0-e82d-4429-9e76-5fef7dda2d95@linux.intel.com>
Date: Tue, 2 Jan 2024 11:22:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] PCI/AER: Decode Requester ID when no error info found
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
References: <20231206224231.732765-1-helgaas@kernel.org>
 <20231206224231.732765-3-helgaas@kernel.org>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20231206224231.732765-3-helgaas@kernel.org>
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
Cc: Robert Richter <rrichter@amd.com>, Terry Bowman <terry.bowman@amd.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/6/2023 2:42 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> When a device with AER detects an error, it logs error information in its
> own AER Error Status registers.  It may send an Error Message to the Root
> Port (RCEC in the case of an RCiEP), which logs the fact that an Error
> Message was received (Root Error Status) and the Requester ID of the
> message source (Error Source Identification).
> 
> aer_print_port_info() prints the Requester ID from the Root Port Error
> Source in the usual Linux "bb:dd.f" format, but when find_source_device()
> finds no error details in the hierarchy below the Root Port, it printed the
> raw Requester ID without decoding it.
> 
> Decode the Requester ID in the usual Linux format so it matches other
> messages.
> 
> Sample message changes:
> 
>   - pcieport 0000:00:1c.5: AER: Correctable error received: 0000:00:1c.5
>   - pcieport 0000:00:1c.5: AER: can't find device of ID00e5
>   + pcieport 0000:00:1c.5: AER: Correctable error message received from 0000:00:1c.5
>   + pcieport 0000:00:1c.5: AER: found no error details for 0000:00:1c.5
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Except for the suggestion given below, it looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

> ---
>  drivers/pci/pcie/aer.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 20db80018b5d..2ff6bac9979f 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -740,7 +740,7 @@ static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info)
>  	u8 bus = info->id >> 8;
>  	u8 devfn = info->id & 0xff;
>  
> -	pci_info(dev, "%s%s error received: %04x:%02x:%02x.%d\n",
> +	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d\n",
>  		 info->multi_error_valid ? "Multiple " : "",
>  		 aer_error_severity_string[info->severity],
>  		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
> @@ -929,7 +929,12 @@ static bool find_source_device(struct pci_dev *parent,
>  		pci_walk_bus(parent->subordinate, find_device_iter, e_info);
>  
>  	if (!e_info->error_dev_num) {
> -		pci_info(parent, "can't find device of ID%04x\n", e_info->id);
> +		u8 bus = e_info->id >> 8;
> +		u8 devfn = e_info->id & 0xff;

You can use PCI_BUS_NUM(e_info->id) for getting bus number. Since you are
extracting this info in more than one place, maybe you can also define a
macro PCI_DEVFN(id) (following PCI_BUS_NUM()).

> +
> +		pci_info(parent, "found no error details for %04x:%02x:%02x.%d\n",
> +			 pci_domain_nr(parent->bus), bus, PCI_SLOT(devfn),
> +			 PCI_FUNC(devfn));
>  		return false;
>  	}
>  	return true;

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
