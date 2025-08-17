Return-Path: <linuxppc-dev+bounces-11074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75071B29409
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Aug 2025 18:11:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c4gnY08Mhz30WT;
	Mon, 18 Aug 2025 02:11:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755447072;
	cv=none; b=WkrKSvsbC80gGuFBMeCK1yCbTUHO19WBTQCHyrZB1mq7rJZ4wHmt39Rxs5W21grdkrcE/KL+Z14QhS8uu+yroCQM3M5mRtH2Dv470HIaR6XSi0Nt79035M6Dil3yqTITDiNbMOXismbSXx8L+r9FeoHbmgrXdUXLwq4rNhebXu5duUZ0zTY482l0Wfb15Gksg0mn5U9m2xCKepm+qSJpxuu0hdolRk36JwdEqo5j/8fxTZIAsmaY2yzB/bPtZy3RBebWkJfJulqRShzkeVhphRPscipF68pBGtrnmFPDd+ETpx2l+Iu/1twd6hb9ePV5J9ITu6xomRGdQy2zgI0zQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755447072; c=relaxed/relaxed;
	bh=C6J17JyKrR0eOOhulOl9WCxnr+4eQq9bKX3ZWt5vqlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0UfhuKJPn6Sv17hx84fS9rLxO5kaEyHDBwtI27rlByJi/4TNCnIWtZtYJUsGER48tlHYGLYOexZYjGi3R+ACAj1qry6vTqZ+FRLS/GL+Pgd71gQed53K66RnOCDp5Vj9SdQSpr5dFAVVVdunTRsh5MVz9A/7UztltIxUc2pOq1TWygnY9M92W3nP77zxoqht0jU0chi5Yw+JnhXbdosKq+5MAPuF8l4TiLOi2x/BU+HnGxZD/yYHb6TKTKBb3qre3nHqbb9iloZPuvM02yPECBLlmDMIPXH5oQMqnM7tZcYZ69zirmJAD4Z2nC1MzzseHM4efWhK/Zwv8UrF67U0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kxcGbzCj; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kxcGbzCj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c4gnS39stz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 02:11:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755447069; x=1786983069;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=apMkriidILsPEdSgGrXH1i3rii3g+uQH+fXccMC8Aio=;
  b=kxcGbzCjzQALCJh7V4QLpr+91vbAtUNyWzFSN/PTYlNsHpKYflCYJpZ4
   bCYGP4vsvjHXELuwiyX3atzZ/4HuBsT3juDFeZCb28kjb1k9TI91liSLF
   LRvg7aOpJok+mqQvjyYuVAl4DAWJFMAPGqOY1QVGac8cfSRSCux2sntk+
   m8Ri0TOnw9PODkzfykY1Osg491zC54JzoNdTF0pthEcqbzIFpjSho7OGT
   B71rdChRxt6i+7oFeuVJMsyChIsHKrz9ijJx486pw/s0BsZhyFZoL7LOc
   odFSdS7Zpp9st0zRt7sshoZQ8pZIXlbE/i0U4MVbmvptUg+iyIflbCzkj
   Q==;
X-CSE-ConnectionGUID: gHD2wH9fQvuU0MsZDtRkFA==
X-CSE-MsgGUID: 7UYpRMJWTvqSj5+vE+w03g==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57832458"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57832458"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 09:11:06 -0700
X-CSE-ConnectionGUID: uHSKJj/lR36Z2yr8ZKYuJg==
X-CSE-MsgGUID: MqeFIOlYR3eOQbIiNHsXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171610974"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 09:11:05 -0700
Received: from [10.124.223.240] (unknown [10.124.223.240])
	by linux.intel.com (Postfix) with ESMTP id 2ADB120B571C;
	Sun, 17 Aug 2025 09:11:04 -0700 (PDT)
Message-ID: <cba69372-1ba1-4a9c-8aa1-5126314d6890@linux.intel.com>
Date: Sun, 17 Aug 2025 09:10:49 -0700
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
Subject: Re: [PATCH 1/5] PCI/AER: Allow drivers to opt in to Bus Reset on
 Non-Fatal Errors
To: Lukas Wunner <lukas@wunner.de>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "Sean C. Dardis" <sean.c.dardis@intel.com>,
 Terry Bowman <terry.bowman@amd.com>, Linas Vepstas <linasvepstas@gmail.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver OHalloran <oohall@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
References: <cover.1755008151.git.lukas@wunner.de>
 <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
 <7c545fff40629b612267501c0c74bc40c3df29e2.camel@linux.ibm.com>
 <aJ2uE6v46Zib30Jh@wunner.de>
 <eec85830-e024-4801-bbc8-5cfa60048932@linux.intel.com>
 <aKHWf3L0NCl_CET5@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <aKHWf3L0NCl_CET5@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/17/25 6:17 AM, Lukas Wunner wrote:
> On Thu, Aug 14, 2025 at 12:29:25PM -0700, Sathyanarayanan Kuppuswamy wrote:
>> On 8/14/25 2:36 AM, Lukas Wunner wrote:
>>> On Thu, Aug 14, 2025 at 09:56:09AM +0200, Niklas Schnelle wrote:
>>>> On Wed, 2025-08-13 at 07:11 +0200, Lukas Wunner wrote:
>>>>> @@ -233,6 +228,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>>>>    		pci_walk_bridge(bridge, report_mmio_enabled, &status);
>>>>>    	}
>>>>> +	if (status == PCI_ERS_RESULT_NEED_RESET ||
>>>>> +	    state == pci_channel_io_frozen) {
>>>>> +		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
>>>>> +			pci_warn(bridge, "subordinate device reset failed\n");
>>>>> +			goto failed;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>>    	if (status == PCI_ERS_RESULT_NEED_RESET) {
>>>>>    		/*
>>>>>    		 * TODO: Should call platform-specific
>>>> I wonder if it might make sense to merge the reset into the above
>>>> existing if.
>>> There are drivers such as drivers/bus/mhi/host/pci_generic.c which
>>> return PCI_ERS_RESULT_RECOVERED from ->error_detected().  So they
>>> fall through directly to the ->resume() stage.  They're doing this
>>> even in the pci_channel_io_frozen case (i.e. for Fatal Errors).
>>>
>>> But for DPC we must call reset_subordinates() to bring the link back up.
>>> And for Fatal Errors, Documentation/PCI/pcieaer-howto.rst suggests that
>>> we must likewise call it because the link may be unreliable.
>> For fatal errors, since we already ignore the value returned by
>> ->error_detected() (by calling reset_subordinates() unconditionally), why
>> not update status accordingly in report_frozen_detected() and notify the
>> driver about the reset?
>>
>> That way, the reset logic could be unified under a single if
>> (status == PCI_ERS_RESULT_NEED_RESET) condition.
>>
>> Checking the drivers/bus/mhi/host/pci_generic.c implementation, it looks
>> like calling slot_reset callback looks harmless.
> Unfortunately it's not harmless:
>
> mhi_pci_slot_reset() calls pci_enable_device().  But a corresponding
> call to pci_disable_device() is only performed before in
> mhi_pci_error_detected() if that function returns
> PCI_ERS_RESULT_NEED_RESET.
>
> So there would be an enable_cnt imbalance if I'd change the logic to
> overwrite the driver's vote with PCI_ERS_RESULT_NEED_RESET in the
> pci_channel_io_frozen case and call its ->slot_reset() callback.
>
> The approach taken by this patch is to minimize risk, avoid any changes
> to drivers, make do with minimal changes to pcie_do_recovery() and
> limit the behavioral change.
>
> I think overriding status = PCI_ERS_RESULT_NEED_RESET and calling drivers'
> ->slot_reset() would have to be done in a separate patch on top and would
> require going through all drivers again to see which ones need to be
> amended.
>
> Also, note that report_frozen_detected() is too early to set
> "status = PCI_ERS_RESULT_NEED_RESET".  That needs to happen after the
> ->mmio_enabled() step, so that drivers get a chance to examine the
> device even in the pci_channel_io_frozen case before a reset is
> performed.  (The ->mmio_enabled() step is only performed if "status" is
> PCI_ERS_RESULT_CAN_RECOVER.)
>
> So then the code would look like this:
>
> 	if (state == pci_channel_io_frozen)
> 		status = PCI_ERS_RESULT_NEED_RESET;
>
> 	if (status == PCI_ERS_RESULT_NEED_RESET) {
> 		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
> 			pci_warn(bridge, "subordinate device reset failed\n");
> 			goto failed;
> 		}
>
> 		status = PCI_ERS_RESULT_RECOVERED;
> 		pci_dbg(bridge, "broadcast slot_reset message\n");
> 		pci_walk_bridge(bridge, report_slot_reset, &status);
> 	}
>
> ... which isn't very different from the present patch:
>
>          if (status == PCI_ERS_RESULT_NEED_RESET ||
>              state == pci_channel_io_frozen) {
>                  if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
>                          pci_warn(bridge, "subordinate device reset failed\n");
>                          goto failed;
>                  }
>          }
>
>          if (status == PCI_ERS_RESULT_NEED_RESET) {
>                  status = PCI_ERS_RESULT_RECOVERED;
>                  pci_dbg(bridge, "broadcast slot_reset message\n");
>                  pci_walk_bridge(bridge, report_slot_reset, &status);
>          }
>
> ... except that this patch avoids touching any drivers.


Makes sense. Thanks for the clarification.


>
> Thanks,
>
> Lukas
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


