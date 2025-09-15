Return-Path: <linuxppc-dev+bounces-12238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E5BB58072
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 17:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQTPJ626Vz3dsC;
	Tue, 16 Sep 2025 01:25:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757949924;
	cv=none; b=HUXBVKtV0PqvvlZJ7IYawfQNVAWjtVBN0ecjCXNakrqxJabzrVkOmnXzSODHCWAYEWcxXvzrskV5lIU02JylqML2Rj+J1qycYrYsQEeLwDJ61FdtcA3dYmYVl1lL+kqnxjipPXXCf69IlBmxqHGWGm49W60R0PJ1Z8IdKsAzS4SxeXzGDcL+/m6+e5fFktT3FT+zuNWq/TlJsd1FkJW6AOAnkDuPeziLxIIABAcYQMLwf768LfdhSwgWGIP5+dpRgYKaMeBCdM6aofESbx8j+Spxym6QxZvIaZ3X289HwfBQy63Ak1ICCw6DfeY3VpF2UOwxrOTF65h/Rv+E+N8deQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757949924; c=relaxed/relaxed;
	bh=t83eXoLKe4F51mBTrLbt/dTs/mQ+uIHs8qPlnH9PFNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mohWQDAcDIJSn/DWP2K4Zfm0Ur+f7P+71mAWaJ9+/Eg0s3ZMtiw7+XTsW9YgRcm/uIh1TvsNuMjg5/PTWDstk2/VOxK1eh4rNNc+bRG5rXeXabw3ERjAAJRutA/QfKNF46n+6ya2v4xHTXtIJqnFGvRdxLZ8RbKRV97V+YayWXtM4aX9cRMnyqDHCPNu8DWEC9zAQMsXIl7XCz/+of8vCTV8xItkN/rVp9dMZIapU76UTtix1+ElPVdoTUYOooWBqh0rmtAlMOnfVw9TOiyuWl0THrChZ65H8XtJOBgxl4MkBU5vXjG6WyW/kqv1T1gwFkWTX6X0DUDavXu2V4yUEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M7336JT7; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M7336JT7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQTPG1xhWz2yCK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:25:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757949923; x=1789485923;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lqzlRfwaJUOAuO1rrEWyHnOChM0Uch2t4oYltMqbmtc=;
  b=M7336JT7pDfIWoziC9XhyGJOfwDCcWLGyr3iTuwJQZ3FrZAy6TvPhqGX
   yAVF7WdNmhF3m4wseVbwfkczZnERxTb52g+TFmBPQHf37myc/QHBVDSOA
   VY9dyOwNHjTCexOhuNzIdNN2iHWjMr31QwD7hesXNglZXTbLIQl2IZgk9
   FNmlibtmeol9KqhixX4DrDmCapl3si6maBkY63D44UxPJwoinGgIKeaZ2
   q4DcrFASn/XBsbo6LUio2a9idy0p1/PX0Mo9IVaAG8UtdOPdmFXW9vjq2
   r0GDBLttmZnAFNcugKJfzeeIKTfgURwdS/MPcYulwQR9LHWC40HRHID89
   Q==;
X-CSE-ConnectionGUID: GTGakBzvRxeHDSGlL6DzZA==
X-CSE-MsgGUID: AKswqSngSRqbkIulXmGL7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60353402"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="60353402"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:25:19 -0700
X-CSE-ConnectionGUID: cWnfxEnpQLWp0gtBrnX5UA==
X-CSE-MsgGUID: GG7Xy7HEQdiOwhJQpGi/JQ==
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:25:17 -0700
Received: from [10.124.221.155] (unknown [10.124.221.155])
	by linux.intel.com (Postfix) with ESMTP id 273DD20B5713;
	Mon, 15 Sep 2025 08:25:16 -0700 (PDT)
Message-ID: <ece967cb-d7fa-4f8b-b6ba-a4192e534936@linux.intel.com>
Date: Mon, 15 Sep 2025 08:25:15 -0700
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
Subject: Re: [PATCH v2 0/4] Documentation: PCI: Update error recovery docs
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Terry Bowman <terry.bowman@amd.com>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Linas Vepstas <linasvepstas@gmail.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>
References: <cover.1757942121.git.lukas@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <cover.1757942121.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 9/15/25 6:50 AM, Lukas Wunner wrote:
> Fix deviations between the code and the documentation on
> PCIe Advanced Error Reporting.  Add minor clarifications
> and make a few small cleanups.
>
> Changes v1 -> v2:
> * In all patches, change subject prefix to "Documentation: PCI: ".
> * In patch [3/4], mention s390 alongside powerpc (Niklas).

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

> Link to v1:
> https://lore.kernel.org/all/cover.1756451884.git.lukas@wunner.de/
>
> Lukas Wunner (4):
>    Documentation: PCI: Sync AER doc with code
>    Documentation: PCI: Sync error recovery doc with code
>    Documentation: PCI: Amend error recovery doc with DPC/AER specifics
>    Documentation: PCI: Tidy error recovery doc's PCIe nomenclature
>
>   Documentation/PCI/pci-error-recovery.rst | 43 ++++++++++---
>   Documentation/PCI/pcieaer-howto.rst      | 81 +++++++++++-------------
>   2 files changed, 72 insertions(+), 52 deletions(-)
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


