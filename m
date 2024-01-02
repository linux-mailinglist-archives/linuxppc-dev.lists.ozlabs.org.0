Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C718221F4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 20:24:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JMZzrWip;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4N8B5g5Nz3cVx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 06:24:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JMZzrWip;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4N6m3THxz3cRc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jan 2024 06:23:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704223392; x=1735759392;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Pi4zx7xRM7AxSQNbCyQOKolzB32nwlVky/j9CjcIrT4=;
  b=JMZzrWipDE955enW6Qh1zyuTy27Xw5VS7z9TZdVaHN/RIoNfP5EvLrC3
   Jcw//yWCCDLbnO4cPPYLtgIhhG4JHSdK5Mhmq/WFWCgge8pL1iHNxM34r
   aBfo5Sd+Zz6RVwi+JO+XYfJobBmDEDfd2CCWTozliQdl65snVXrwy7GFr
   Y8UdVgls53hmLg3HDuerk0XaVAHIQmuqnkiW8JFkwpTtaH0xWlra7L5AL
   GBR4KJhQOBmdjnNeH30TCObbQj2/su/K7T/EecFHy6yG6j/jo1MwWIP+0
   VEiol45nPb2MAo9vuq0nSH7PIgSHlOnBCQFHy70AC++CL0Lz+lze6e68E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="428078536"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="428078536"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 11:23:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="1111132084"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="1111132084"
Received: from keithj1-mobl2.amr.corp.intel.com (HELO [10.209.44.31]) ([10.209.44.31])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 11:23:10 -0800
Message-ID: <cd9e4397-1110-40a5-891a-56e6288bbf91@linux.intel.com>
Date: Tue, 2 Jan 2024 11:23:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] PCI/AER: Use 'Correctable' and 'Uncorrectable' spec
 terms for errors
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
References: <20231206224231.732765-1-helgaas@kernel.org>
 <20231206224231.732765-2-helgaas@kernel.org>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20231206224231.732765-2-helgaas@kernel.org>
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
> The PCIe spec classifies errors as either "Correctable" or "Uncorrectable".
> Previously we printed these as "Corrected" or "Uncorrected".  To avoid
> confusion, use the same terms as the spec.
> 
> One confusing situation is when one agent detects an error, but another
> agent is responsible for recovery, e.g., by re-attempting the operation.
> The first agent may log a "correctable" error but it has not yet been
> corrected.  The recovery agent must report an uncorrectable error if it is
> unable to recover.  If we print the first agent's error as "Corrected", it
> gives the false impression that it has already been resolved.
> 
> Sample message change:
> 
>   - pcieport 0000:00:1c.5: AER: Corrected error received: 0000:00:1c.5
>   + pcieport 0000:00:1c.5: AER: Correctable error received: 0000:00:1c.5
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>  drivers/pci/pcie/aer.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 42a3bd35a3e1..20db80018b5d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -436,9 +436,9 @@ void pci_aer_exit(struct pci_dev *dev)
>   * AER error strings
>   */
>  static const char *aer_error_severity_string[] = {
> -	"Uncorrected (Non-Fatal)",
> -	"Uncorrected (Fatal)",
> -	"Corrected"
> +	"Uncorrectable (Non-Fatal)",
> +	"Uncorrectable (Fatal)",
> +	"Correctable"
>  };
>  
>  static const char *aer_error_layer[] = {

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
