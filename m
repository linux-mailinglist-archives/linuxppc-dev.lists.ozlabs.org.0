Return-Path: <linuxppc-dev+bounces-10490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B86DB17566
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 19:04:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btFnN6rdrz2yF1;
	Fri,  1 Aug 2025 03:04:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753981496;
	cv=none; b=lpCmuoaoCWQ8cQ7UGj/RzQfTrfgZvZVY6E36qc3nEuQWbuMQMr9scc8UMwz1nRAzqCU0aJCmEe6PsZI6N6ko8rBO4uSbHAqSYH944Hb15XvK0hqPWNU4rq6dimWm37xR3miDVOHA4zWzvLx0GzPjBWlczgBDeCNXuyg0KzrV1GXXUixGnjdf2SEtu+ww7nkxJnnJMk/t21Na0uu7MM6phejZrGJz/IvQwWmTaeAa7Xpwrbz50qwsB4tQYjTJE3y0FAc5WJN7+f568hdzIW4hRyWOD0szuLxb8crwSteQU0tvREFaDUm18VsGrFCPt4iqWwulDcgYaaPMfQIfdwS4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753981496; c=relaxed/relaxed;
	bh=2zdlUtjnjG9A4HXkRlKDj04/ONsyu0PNYOLM7kugNlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jC6NSWUwgPVblPveRuQbFvyPLjY8vMhqE7E5BJdrqyXnBfs58rIwpmaQxFn6ba7PY4J0UGJutyBiptsjfhKTYMATau79R9j1ZIYXJG0/+JgumQZScUrxddsvz+veTcRrsYL2PK2hNjJsvBkLK4ORmgxa0T9ABwvorz59A9UNDVt/OF/brKpjmi9YVTRmXFGyFLfVMde7IwmwBTnjv2N2G2DWhXElZl+rd7ax90C8O5qYNLV2K73wHfBq2wW3bsqqPsg7q85CjM4XEICPCrNSCnnu4nZnFUkuxZc1W0Y91R950udSDhjAYZmULvuWTQEaBthXfsEcmxr57hxxnJ3VWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MxdQMzzo; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MxdQMzzo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btFnK46xRz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 03:04:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753981493; x=1785517493;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m0YH97sXQRmjbG9xHs4D9l3xM41GzX9EBnf6R6A8CU0=;
  b=MxdQMzzouDPTBPJ7llc6kJBP5yymW0k0r+YgAVjqaAfSZVfCmsFOw2+B
   jMjHyR10hzmKP8sgUnNn2eFHT3u5KqYZp3+zvtybfyudsuchq2ZyZhR2y
   +9YEjIMwou3NY8ucdhAQWTUF4TRr0qFfWt1L4gfRu2+4y442V6f9sQPXN
   VQ7A4p3jmSbp6Hy0YrRo+ktnPx5Klk0Wbt7uYXzhkblaOxv6gH0TBd7B3
   rmY+uD0dumrtWWhIx2fobVlv0Ansk1aLh5bjKT47tfUrph+4J3BOtFtWm
   Cctb2q2KMlgaSws1W+P+FaueYiIRRmFETrY8bg1Q7pesU5U3iFwou7kw6
   g==;
X-CSE-ConnectionGUID: nLsWQ1J1SLm8SR6swUAnBA==
X-CSE-MsgGUID: F555bS76Sgeu5yA1/m+8zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73773600"
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; 
   d="scan'208";a="73773600"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 10:04:39 -0700
X-CSE-ConnectionGUID: /HdguQcrRuSrI4tW/hco+w==
X-CSE-MsgGUID: 8Jq8hCUQSzSgrKeF61LPPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; 
   d="scan'208";a="163327978"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 10:04:40 -0700
Received: from [10.124.222.117] (unknown [10.124.222.117])
	by linux.intel.com (Postfix) with ESMTP id 861D620B571C;
	Thu, 31 Jul 2025 10:04:38 -0700 (PDT)
Message-ID: <4969c441-fe2a-470f-9efd-4661efca56ec@linux.intel.com>
Date: Thu, 31 Jul 2025 10:04:38 -0700
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
Subject: Re: [PATCH v3 1/2] PCI/AER: Fix missing uevent on recovery when a
 reset is requested
To: Lukas Wunner <lukas@wunner.de>, Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Linas Vepstas <linasvepstas@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Oliver O'Halloran
 <oohall@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>
References: <20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com>
 <20250730-add_err_uevents-v3-1-540b158c070f@linux.ibm.com>
 <aIp6LiKJor9KLVpv@wunner.de> <aIp_Z9IdwSjMtDho@wunner.de>
 <aItpKIhYr0T8jf7A@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <aItpKIhYr0T8jf7A@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 7/31/25 6:01 AM, Lukas Wunner wrote:
> On Wed, Jul 30, 2025 at 10:24:07PM +0200, Lukas Wunner wrote:
>> On Wed, Jul 30, 2025 at 10:01:50PM +0200, Lukas Wunner wrote:
>>> On Wed, Jul 30, 2025 at 01:20:57PM +0200, Niklas Schnelle wrote:
>>>> Since commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery
>>>> status for udev") AER uses the result of error_detected() as parameter
>>>> to pci_uevent_ers(). As pci_uevent_ers() however does not handle
>>>> PCI_ERS_RESULT_NEED_RESET this results in a missing uevent for the
>>>> beginning of recovery if drivers request a reset. Fix this by treating
>>>> PCI_ERS_RESULT_NEED_RESET as beginning recovery.
>>> [...]
>>>> +++ b/drivers/pci/pci-driver.c
>>>> @@ -1592,6 +1592,7 @@ void pci_uevent_ers(struct pci_dev *pdev, enum pci_ers_result err_type)
>>>>   	switch (err_type) {
>>>>   	case PCI_ERS_RESULT_NONE:
>>>>   	case PCI_ERS_RESULT_CAN_RECOVER:
>>>> +	case PCI_ERS_RESULT_NEED_RESET:
>>>>   		envp[idx++] = "ERROR_EVENT=BEGIN_RECOVERY";
>>>>   		envp[idx++] = "DEVICE_ONLINE=0";
>>>>   		break;
>>> I note that PCI_ERS_RESULT_NO_AER_DRIVER is also missing in that
>>> switch/case statement.  I guess for the patch to be complete,
>>> it needs to be added to the PCI_ERS_RESULT_DISCONNECT case.
>>> Do you agree?
>> I realize now there's a bigger problem here:  In pcie_do_recovery(),
>> when control reaches the "failed:" label, a uevent is only signaled
>> for the *bridge*.  Shouldn't a uevent instead be signaled for every
>> device *below* the bridge?  (And possibly the bridge itself if it was
>> the device reporting the error.)
> The small patch below should resolve this issue.
> Please let me know what you think.
>
>> In that case you don't need to add PCI_ERS_RESULT_NO_AER_DRIVER to
>> the switch/case statement because we wouldn't want to have multiple
>> uevents reporting disconnect, so the one emitted below the "failed:"
>> label would be sufficient.
> I'll send a separate Reviewed-by for your original patch as the small
> patch below should resolve my concern about PCI_ERS_RESULT_NO_AER_DRIVER.
>
>> This all looks so broken that I'm starting to wonder if there's any
>> user space application at all that takes advantage of these uevents?
> I'd still be interested to know which user space application you're
> using to track these uevents?
>
> Thanks,
>
> Lukas
>
> -- >8 --
>
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index e795e5ae..3a95aa2 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -165,6 +165,12 @@ static int report_resume(struct pci_dev *dev, void *data)
>   	return 0;
>   }
>   
> +static int report_disconnect(struct pci_dev *dev, void *data)
> +{
> +	pci_uevent_ers(dev, PCI_ERS_RESULT_DISCONNECT);
> +	return 0;
> +}

Since you are notifying the user space, I am wondering whether the drivers
should be notified about the recovery failure?

> +
>   /**
>    * pci_walk_bridge - walk bridges potentially AER affected
>    * @bridge:	bridge which may be a Port, an RCEC, or an RCiEP
> @@ -272,7 +278,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   failed:
>   	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
>   
> -	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
> +	pci_walk_bridge(bridge, report_disconnect, NULL);
>   
>   	pci_info(bridge, "device recovery failed\n");
>   
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


