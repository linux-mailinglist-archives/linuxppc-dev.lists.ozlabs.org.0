Return-Path: <linuxppc-dev+bounces-8714-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B68AABCE5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 07:01:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1j7f2Vpvz30Vv;
	Tue, 20 May 2025 15:01:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747717278;
	cv=none; b=NK59JEdCS0RN8fAPHbKNCRy5/ZMDTYPtsK5jgIkc7nSslAzop+DfacyCtk5eMEGXEm4U9df+gNQpsYE8mFzVTVxwLvLDbFO+ppFFoogFOtW66yRE+vbTw609fs0pOTIgxd7FCfQUh5vqES4q7aTnXKBIIlaMvBRRI0go9WX7wVE1QHByPS0OqKzHspw78JRqFqWy3NJbJFwlq8Zuix684RTacBhvRgbNf8XwgUR4WgqIHmdIaYO3zbFAnRFPO2eM8NZG2ns2xvc7hhbBUIxqDHyP5QOswUt6ootZ/bpIY8mu5vXxX4JSyHWU3d0pttP562B8pIXs+k65HIdaCFJ5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747717278; c=relaxed/relaxed;
	bh=nC+8S8tcI0/MeTv4eacqIFrVOtrw09F70gM+Alwr3Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMIMNjkkFNzBbUsTwwTAp/qU6l/1V9vMY2xPaIMZPUaB7/rYgzce3Uba/w16xCYpZhD1tiOqALxckibLMTFArfwF/VPtpG4xBJqismHf5d85O6uLumSTHS2YV2zbYPyFlcMlezLBTkaw+N68alcuG8K0CnGD9CUdAk+cFm9twItKv2UlpvyPK6a17Pu+mpJf7+vDla8oHrg/bgBj2ZttxnnGG4UB36L29oDxVAyV99gPkyR/RatXfzyfAHvraIF5wTNHtc8/p4ajDa9hlzkqJjJ9omtTlP0AkhW6IFP1ljolL9UXY7v3Oypg1oTEYK9G4g+AHqWAIlr9hzzIBhW3JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GitOHYnR; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GitOHYnR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1j7d2kJqz30DX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 15:01:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747717278; x=1779253278;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rYUVuOK5P7Bcz50bfsx98bvImcvMk1Jc4VhxeSIN7wI=;
  b=GitOHYnRkMr1fWI3gLGH+tYgQ1J178j4eNfKfbqrgzGx+K6nJ8H03513
   jeUzGCBXzjX773f5JLGViuIVk37H1icoJqtGurYoFBcml7aQcbDYEZadc
   7SZWj+kM1NjX5lGB6Z7w9Q6TdCjpUApnJvFvSfgeJNwMuiWKMOhqYeobn
   HyeX2yYbsz93eocZEOr+Z4AvJoNjLJS7PwszPiaOboJ2JhO3+7C3kXS4G
   gf6X8Z+u19Eyjz036IA+7MkdykgD19s8R0Cmewps5Fb3mGUU3Hak2M62M
   BEPVG87doE1mXmUm6bMc7aBwQ5vnMBJgEoHDBtmQx4qTeMEMh5g4aOO7H
   Q==;
X-CSE-ConnectionGUID: oFNtgOORTo6g/8y+jQVNLw==
X-CSE-MsgGUID: 2EaHzOMRRo6Ewsd5mjUMkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="37251773"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="37251773"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 22:01:15 -0700
X-CSE-ConnectionGUID: dNmfyY0QSeq8TIS4QfO6fw==
X-CSE-MsgGUID: 43QwtQ8IRAydXYI4E+KUeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139306286"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 22:01:12 -0700
Message-ID: <75a3749b-36d9-467c-80a7-7e4a42e2f9b1@linux.intel.com>
Date: Mon, 19 May 2025 22:01:09 -0700
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
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
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
References: <20250519213603.1257897-1-helgaas@kernel.org>
 <20250519213603.1257897-16-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-16-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Jon Pan-Doh <pandoh@google.com>
>
> Add ratelimits section for rationale and defaults.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> Signed-off-by: Jon Pan-Doh <pandoh@google.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>
> ---
>   Documentation/PCI/pcieaer-howto.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
> index f013f3b27c82..896d2a232a90 100644
> --- a/Documentation/PCI/pcieaer-howto.rst
> +++ b/Documentation/PCI/pcieaer-howto.rst
> @@ -85,6 +85,17 @@ In the example, 'Requester ID' means the ID of the device that sent
>   the error message to the Root Port. Please refer to PCIe specs for other
>   fields.
>   
> +AER Ratelimits
> +--------------
> +
> +Since error messages can be generated for each transaction, we may see
> +large volumes of errors reported. To prevent spammy devices from flooding
> +the console/stalling execution, messages are throttled by device and error
> +type (correctable vs. uncorrectable).

Can we list exceptions like DPC and FATAL errors (if added) ?

> +
> +AER uses the default ratelimit of DEFAULT_RATELIMIT_BURST (10 events) over
> +DEFAULT_RATELIMIT_INTERVAL (5 seconds).
> +
>   AER Statistics / Counters
>   -------------------------
>   

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


