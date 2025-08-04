Return-Path: <linuxppc-dev+bounces-10597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57128B1A712
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:12:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwhRB08f9z3bmy;
	Tue,  5 Aug 2025 02:12:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754323957;
	cv=none; b=FnsD6mOKZRdXVGcNdOieFhVyCKwLVLfGM0prSX0lsKGrutNDSHe/3MVVhZUX/BpA9xoe8lnM7s4EgwufwDKFob2Dix94SZw7z0nbhzEq0icDizFnB4C4XflnzaSGpHPBXuMPDmia80vW9dzFDIIgV5ZGhxWPWbXNXvCD6WFAWw6jCjcS2VnMCRsDwgT3x4EWOXIEcXIaoxaOcWPgUrS5rviTdC4mzdU+TSflGn026ONGmardICREYM6vlYL53NzmCrL/22Xd8RV9rObFR/eVs7J9iHU21tnvn/SsuLe4Y2eRMpbkrL6LNeRb6ZUH5RZg/0cMMzhaKH7AAnYnh9xEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754323957; c=relaxed/relaxed;
	bh=YmyBAGLt75Jt5DDWIOG6sqKdTp247Rz0CRwDTJX9IrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZyZf4IKdEuSoOEpJboBuWi+fII6klZ/nxtgCP8hQ9zE/ZpVl3CIpVZiWMWSzqUyQAeVj7a+2WQnrYu8iaf2QlQOqlAssEEyequvWC9S2Fzyee7sbc27SewA8ESj0E7b5ISgYv9L3OE7XzY4r3ap4zEIbUHbiNbOe+UgA50BcgyVOWs/pjskTh3X6MS2O8SSk6lHX6Y4RaEs5FmEuQOyGIsw14h9+2H+EVDN2zTqnRnrLgJr+4XOipVudYVy/yLdPPqS627j0c+Cpyd3AULHbrpPUzhu5v39a5vNvOhtJ8lX0qg5dXT2PglmlcqNbO3l25PD/Msw64mNTi7LauQ9Tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BHKC48P6; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BHKC48P6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 05 Aug 2025 02:12:35 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwhR73X3Bz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:12:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754323956; x=1785859956;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bsVP24mM+9KicLDIG4oku4rVyO+CDQNpxwx4qnP3YI0=;
  b=BHKC48P65vUMEnqdjSoMKyDOhErRFYLdwH8VJGnozWlzglNrL1Ti3beW
   Zz/9ANIaj6jZz0LUbwKFiDZ55bASDMCtqPNoA+VGtWWZ9ksSGyRbxBjpA
   921VFnuedVsw0sl+3zcGXUR/X7sgwl8CM+tw24WbcIVP9LLnoi1lmIA8q
   XzSZDcvoRlZx6y9zw+rnU067jVIyIzOWzx98Pamko/eWyrwqzcjCkochU
   cq/LeRpGHuw2NaFcO28NQq29SXdkl+sWkgEvqx/+GjtMSpkksdkd2mTQf
   JjS2eEMFEkUznh32xhywGZOK3wu9N+DrdTGxGvNBp3tVr9aeMkAGylQYW
   Q==;
X-CSE-ConnectionGUID: YNR3cnEuRvi4WOrPZ77M/Q==
X-CSE-MsgGUID: XwffV90rQouay0MpZZAQwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56737616"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56737616"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 09:11:28 -0700
X-CSE-ConnectionGUID: UyVmegG2TYWmo9DgVNn6iQ==
X-CSE-MsgGUID: evaMjvonQy+yj8egjlKZog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164199112"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 09:11:28 -0700
Received: from [10.124.223.136] (unknown [10.124.223.136])
	by linux.intel.com (Postfix) with ESMTP id 87B1B20B571C;
	Mon,  4 Aug 2025 09:11:27 -0700 (PDT)
Message-ID: <48e24c23-67d4-4d09-a5f5-2a458a47e2e2@linux.intel.com>
Date: Mon, 4 Aug 2025 09:11:27 -0700
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
Subject: Re: [PATCH] PCI/AER: Check for NULL aer_info before ratelimiting in
 pci_print_aer()
To: Breno Leitao <leitao@debian.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jon Pan-Doh <pandoh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
 <9cd9f4cf-72ab-40f1-9ead-3e6807b4d474@linux.intel.com>
 <3kpkazpe4j4pws7rean5kelwmpfp5ij62psvdzvimcr37do47a@y2pvypskynno>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <3kpkazpe4j4pws7rean5kelwmpfp5ij62psvdzvimcr37do47a@y2pvypskynno>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/4/25 8:35 AM, Breno Leitao wrote:
> Hello Sathyanarayanan,
>
> On Mon, Aug 04, 2025 at 06:50:30AM -0700, Sathyanarayanan Kuppuswamy wrote:
>> On 8/4/25 2:17 AM, Breno Leitao wrote:
>>> Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
>>> when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
>>> calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
>>> does not rate limit, given this is fatal.
>> Why not add it to pci_print_aer() ?
>>
>>> This prevents a kernel crash triggered by dereferencing a NULL pointer
>>> in aer_ratelimit(), ensuring safer handling of PCI devices that lack
>>> AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
>>> which already performs this NULL check.
>> Is this happening during the kernel boot ? What is the frequency and steps
>> to reproduce? I am curious about why pci_print_aer() is called for a PCI device
>> without aer_info. Not aer_info means, that particular device is already released
>> or in the process of release (pci_release_dev()). Is this triggered by using a stale
>> pci_dev pointer?
> I've reported some of these investigations in here:
>
> https://lore.kernel.org/all/buduna6darbvwfg3aogl5kimyxkggu3n4romnmq6sozut6axeu@clnx7sfsy457/

It has some details. But you did not mention details like your environment, steps to
reproduce and how often you see it. I just want to understand in what scenario
pci_print_aer() is triggered, when releasing the device. I am wondering whether we
are missing proper locking some where.


-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


