Return-Path: <linuxppc-dev+bounces-8769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53053ABE4D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 22:36:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b25v86j50z2ybQ;
	Wed, 21 May 2025 06:36:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747773412;
	cv=none; b=d8ZYQagOcX0jY7B6QohWlXNbN3VxOIZpmKzbe0QntA0zlMum3+xXPo2hw5CWvtb/CL8f6cPrneKzbJJWcHEi1j+mOomJvk9YMrRpo67iP1YXLiE/Xq+A8uCKel85kydcSyzLy954uUXZelS0jxp2yXdD6n7srdLUUYcDPbm7+EfqF37JXX8DZreZnAR93nBc3lYmyJy1FdEmmHi1DASnX+5fgn7OiBfMc3RamVLuakKiQDpwaQoK3ReAg1sVcSVO8CeO+rvbGmMaOfynfOApoXUKLXccUMCiMazOBcX+M2v+XtwbSiUpA0g6uTWPkofiIE4TX9E0ZAoa/pyqm4MkLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747773412; c=relaxed/relaxed;
	bh=oLoR7f/+1NYMeFSR+bvh8QW+pKfHNujReaNSazWSkic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+ZoXR/DRsM9aYzBqCBgScJFyEGsaiU0Wt2hiY4OWWrJUbGetsBjHqm4YQyxOR/bUXyXduUwpMcy4BxE7cZJ2XLSI13Sy2h4uRAEnR5qfLUxb14jzuo+rvxd1RqWezPmc7rJwqgFcUTlRn/qG97R2q0AK0fEmiM9nnOyEww7CbWASaJGrRSI8A6aGCDiqt6UMNv0MTJz8f3sI+BGKYf7XetXXG4uOcpCn3OrB46ef4JqmeidIHujfrmIpnzGdyfhIpnQ0umMN++JoTnwhsOanoRcFtmD6HUxtm2W37dQGYS7aGR5LS1PL3X8c4oV6GTPcN0UyDKWpQWFbO48Of5U+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kx6tBEYJ; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kx6tBEYJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b25v60myyz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 06:36:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747773410; x=1779309410;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J/efGUmqy7oN9EoBIMU7rLAuBqz4R6qisInic/jNCRY=;
  b=Kx6tBEYJJMKinftgizXTKN31R4fSKvlnj75UDZP7RTFENSYpPtq0U0B8
   oS5zxkJSNEvn56Cj+PFxXVDmKQJkcoM1PAcetjBxt/YE3nypZDikQUZEq
   u+MlKKJjWNeNnKf/J/BcUJU5CGtNuKm+BC5TtIeoGF/q+P0wRlQg49Q54
   802DycNXctECf5D1fb7OurFG7bPI8TiNVJwKvKZIEeBxxLvJNTq20UQYz
   B4HFKI7UAVmsFAAVw9Ak1dDhSYtyjXiAC0rGG/dBwmusPVOKsDpxhsgP1
   sCWM9TyJfvnVKwIyBT48X2GZMJB5uTAVTlTFaxNXzhgG5vKGg+PDKAkv3
   w==;
X-CSE-ConnectionGUID: LZlTAlrRQ96WARFvA5nvNg==
X-CSE-MsgGUID: QCnisi0XR5SaPJwNq5ojeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="37343341"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="37343341"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 13:36:45 -0700
X-CSE-ConnectionGUID: rDiCkEmuTjCvvuNZyc9FvQ==
X-CSE-MsgGUID: QnrewdnpRn2V8+b6oxjOpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140215561"
Received: from iweiny-desk3.amr.corp.intel.com (HELO [10.124.222.89]) ([10.124.222.89])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 13:36:44 -0700
Message-ID: <63e93c1c-9330-43ae-b381-fffde3864da3@linux.intel.com>
Date: Tue, 20 May 2025 13:36:43 -0700
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
Subject: Re: [PATCH v6 15/16] PCI/AER: Add ratelimits to PCI AER Documentation
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Martin Petersen <martin.petersen@oracle.com>,
 Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>,
 Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
 Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
References: <20250520194841.GA1322094@bhelgaas>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250520194841.GA1322094@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/20/25 12:48 PM, Bjorn Helgaas wrote:
> On Mon, May 19, 2025 at 10:01:09PM -0700, Sathyanarayanan Kuppuswamy wrote:
>> On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
>>> From: Jon Pan-Doh <pandoh@google.com>
>>>
>>> Add ratelimits section for rationale and defaults.
>>> +AER Ratelimits
>>> +--------------
>>> +
>>> +Since error messages can be generated for each transaction, we may see
>>> +large volumes of errors reported. To prevent spammy devices from flooding
>>> +the console/stalling execution, messages are throttled by device and error
>>> +type (correctable vs. uncorrectable).
>> Can we list exceptions like DPC and FATAL errors (if added) ?
> Like this?
>
>    +... messages are throttled by device and error
>    +type (correctable vs. non-fatal uncorrectable).  Fatal errors, including
>    +DPC errors, are not ratelimited.
>
> DPC is currently only triggered for fatal errors.

Yes.  I think it is good enough.


-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


