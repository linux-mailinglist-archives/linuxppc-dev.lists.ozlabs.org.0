Return-Path: <linuxppc-dev+bounces-10517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE63B18685
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 19:21:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btt6V3qQ8z2xRs;
	Sat,  2 Aug 2025 03:21:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754068914;
	cv=none; b=cwcn3tWzCS1MOHxO++/JYHa/sgUs0ZEuVo1zFrlhh8AgTbNk/0VMezJXmdfnGZHm6vo1RdVqaJG4N8S3L5qRYocJKwztw6y27CPJXTv5gD77n4w5ePYezUssjoMdWjD/I7TYlv0Q656MuwKkYAhb7kJc6IpAjIPQm5HEuGd8ZY3ZsSHm9enyiskuZAyZ6YYFAzVmCnqxwjPyNbuve5KGJgXIe/AX3UO0jlT2e/oKkkGLNRgRWVqdhD7Reif18HdSsm+tSVE20+THY8K4un2r7ztcUdWNAU6BCQPXsfEkfnXPVblmPAYJVQ93S1pOUEJi6kpNjQPAtnYB5G/g8t1i9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754068914; c=relaxed/relaxed;
	bh=XpygxGpjif4HUGWNj7SNfv+KGkdiNDYl1lt1YBAXjKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPW4j41BNX6PAknTY6hNvdGI11umc0aUe0T1yPMTgdnLOjpMUGONwW03twBcdWBXjicYIPa7saflBYdpih3UQJm8mbHVWPgbiUpVhOxHaJBwMh1SY9sa+4GOVHPw2MctW9nz55U/hiUGfs1GUYnvKKaPlL/T0Af0Ej3CAe3tdVf6QU41nDL9OOfGmSPjGlbN6cejmwNyo9tBB88a6c7WCfSb3oRWsB78vqOWrWwdaDEN4tszWeCv+79JhKfcUdjOV2dNalH2NvNnyYji4p1Rl12n7ZB/EH0DZq/iG6biXXYjb0RSThozJ+YCSxwMfD7oK9/xkascnto38KCydLJBPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aDInA74m; dkim-atps=neutral; spf=none (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aDInA74m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 02 Aug 2025 03:21:53 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btt6T171Tz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 03:21:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754068913; x=1785604913;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DWBXfCvR6lt84c6Psk2frdJburkpSgkJO5zbV9ApcSc=;
  b=aDInA74moJg8rsmqZCCwzm1b4hJuL0NZk1NwMotzbww0mgNaficzIcYE
   dsQiLACuOn3a26FUR/pQVEAZZpMylxZuilv6ao4flSomQX29/9jnRWENI
   BOl/WBLCZlkeFTlbWPVRyvp27ypKSkcYVZ7nT7pKxSAqKfW0CPNg4H5SI
   OSFOIStOyEWIHwscR8UvWboLAn1k6Slvm9R0jfQ5GS+cVtN7InGimBMV+
   f8MGIy9ysnJooLYKHTj2DhtGUkV865ZozXTYckz7rMU8/coh1i9GuBACb
   V6ScYcP7kWzdiklUIsshKyKzDYhGvrQsp4SNzZ9gQ7md1Torvnj2myiRS
   g==;
X-CSE-ConnectionGUID: qMvwSdo0SEak7c1Lv5P4eQ==
X-CSE-MsgGUID: jOUYevDBR2m1GwnMqqle0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56125369"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56125369"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 10:20:46 -0700
X-CSE-ConnectionGUID: XHBnGVulTByiK5/G+LgD8w==
X-CSE-MsgGUID: PUZotDJoRi6tlTVHvOgLSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="164068288"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 10:20:45 -0700
Received: from [10.124.222.201] (unknown [10.124.222.201])
	by linux.intel.com (Postfix) with ESMTP id 829A020B571C;
	Fri,  1 Aug 2025 10:20:43 -0700 (PDT)
Message-ID: <f496fc0f-64d7-46a4-8562-dba74e31a956@linux.intel.com>
Date: Fri, 1 Aug 2025 10:20:43 -0700
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
To: Lukas Wunner <lukas@wunner.de>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
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
 <4969c441-fe2a-470f-9efd-4661efca56ec@linux.intel.com>
 <aIxULlDfQw4yhFDv@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <aIxULlDfQw4yhFDv@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Lukas,

On 7/31/25 10:44 PM, Lukas Wunner wrote:
> On Thu, Jul 31, 2025 at 10:04:38AM -0700, Sathyanarayanan Kuppuswamy wrote:
>> On 7/31/25 6:01 AM, Lukas Wunner wrote:
>>> +++ b/drivers/pci/pcie/err.c
>>> @@ -165,6 +165,12 @@ static int report_resume(struct pci_dev *dev, void *data)
>>>    	return 0;
>>>    }
>>> +static int report_disconnect(struct pci_dev *dev, void *data)
>>> +{
>>> +	pci_uevent_ers(dev, PCI_ERS_RESULT_DISCONNECT);
>>> +	return 0;
>>> +}
>> Since you are notifying the user space, I am wondering whether the drivers
>> should be notified about the recovery failure?
> The drivers are usually *causing* the recovery failure by returning
> PCI_ERS_RESULT_DISCONNECT from their pci_error_handlers callbacks
> (or by lacking pci_error_handlers, in particular ->error_detected()).
>
> So in principle the drivers should be aware of recovery failure.
>
> There are cases where multiple drivers are involved.  E.g. on GPUs,
> there's often a PCIe switch with a graphics device and various sound
> or telemetry devices.  Typically errors are reported by the Upstream
> Port, so the Secondary Bus Reset occurs at the Root or Downstream Port
> above the Upstream Port and affects the switch and all subordinate
> devices.  In cases like this, recovery failure may be caused by a
> single driver (e.g. GPU) and the other drivers (e.g. telemetry) may
> be unaware of it.

Yes, my comment was referring to the scenario mentioned above. If one of the
subordinate devices fails recovery, then recovery effectively fails for all devices
under that downstream port (or root port). Notifying all devices under that port
would allow their drivers to perform the necessary cleanup

>
> The recovery flow documented in Documentation/PCI/pci-error-recovery.rst
> was originally conceived for EEH and indeed EEH does notify all drivers
> of recovery failures by invoking the ->error_detected() callback with
> channel_state pci_channel_io_perm_failure.  See this call ...
>
> 	eeh_pe_report("error_detected(permanent failure)", pe,
> 		      eeh_report_failure, NULL);
>
> ... in arch/powerpc/kernel/eeh_driver.c below the recover_failed label
> in eeh_handle_normal_event().

Agree. The current implementation does not seem to follow the steps
mentioned in the Documentation/PCI/pci-error-recovery.rst.

STEP 6: Permanent Failure
-------------------------
A "permanent failure" has occurred, and the platform cannot recover
the device.  The platform will call error_detected() with a
pci_channel_state_t value of pci_channel_io_perm_failure.

The device driver should, at this point, assume the worst. It should
cancel all pending I/O, refuse all new I/O, returning -EIO to
higher layers. The device driver should then clean up all of its
memory and remove itself from kernel operations, much as it would
during system shutdown.


>
> I don't know why pcie_do_recovery() doesn't do the same on recovery
> failure.  This is one of several annoying deviations between AER and
> EEH.  Ideally the behavior should be the same across all platforms
> so that drivers don't have to cope with platform-specific quirks.
>
> However I think that's orthogonal to the pci_uevent_ers() invocation
> in pcie_do_recovery().

Agree. My thought is, since there is an attempt to fix the user notification
side of things, may be the driver side should also be fixed together .

> Thanks,
>
> Lukas

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


