Return-Path: <linuxppc-dev+bounces-8905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02731AC18AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 01:57:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3QFf5xvWz3c9D;
	Fri, 23 May 2025 09:57:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747958246;
	cv=none; b=gJXJ+eSmBrT1idDskiTgYg08p77G8FgqkObChrXvAP9NanZ6BMYYxclfOgxEb1bi+JowMlqAa5Hs3d15WEcAo6O2F6Wdv2+HVRjEQbbhCBLTBhN7mkBENobLLxKPZZNhsv80G5LprFDweZP9fnPtM7uKJrONPp7TQ3oBpP6jUjsJvE23Hr4ZxNhNS7gsBzN4qrguhK5qhAs65bMNIDG7CRmuGS8Ranx+ReJbBfTsIYfcN7NxwJQKcDKwx2VsIc8lR5H1l13cXiu96CKfeewzoxxS26iXTQ5QneTliV6piTDfe1PFx4+X2JCfiyol0EIM1AhTguiC5dKmKRL+gZCUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747958246; c=relaxed/relaxed;
	bh=PIXLq34os39AdTGX/lFGpZS7qUSsw+FOuK3HrnGtxuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aq4xaZWoZQtnFthW+iUu1KLubcy//r/4NNEyRRkVOuU5C2xvsiwqzNe3G+12hOf/yLLmFzEEAGzf7eELJSKds8Of53EbUWtttMu+KdlCdouPnyj9sfywSWivLfdzCmAGAcBIqGqzIc7E820gowfnMuLQTWxuYn57uBQyG0VfZakXoKXJUucfjLTF/Y+6rcX9h45Zy0HJ/iEzvoQPnhZchJjmcPMsc/OZPpyx6ofDIDPlziTbirj/+P0/r/c1i5lwaJLzajL/GhPJ5ZVhZpDt+XbM+F0QHziOcf9qzLVPR7Z9nVcXWgIOzYuxuxe0YE9Z3s852Go4D0eTEBgGaL60vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aHlB4n4w; dkim-atps=neutral; spf=none (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aHlB4n4w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3QFd6FbFz3c8s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 09:57:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747958246; x=1779494246;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QYOWZ2FwAxXVY5zAUVw+08m0cpSZDQFAL7+izIDHNig=;
  b=aHlB4n4w9nrSK/mquf/yyTpNJzhn/3UT3aNJP8RrHt/HxyPEtMsHoO6t
   ubJZoQpTH0Yi/CGtToesUZ1MnCKBPAinileFLbXdfGme7ylSSobP9tkzt
   l8zcbhE3sBseRtlVuQfzsQou3EoZ1pVH/o4lF65X45EPPbi1vFIefhZpJ
   5EqR/qGXCPg1KRZQeSwLuoX/ad7IpJ2itQJoWSQqhfVk0S4RWCLNJ2WVi
   UavipGOn4bbZSdzZC9DMO/oc12zUgrjHzUgeitTJshFcvePX4diizErAN
   GecD244jiUKUUKxnciplwDq9LgpsTdnIOdPorm/UYgrx8sC+Fm9ztCtWC
   g==;
X-CSE-ConnectionGUID: J2JK4A56TkmHyiBnaRogwA==
X-CSE-MsgGUID: +Nkl9gp/RmG6u8DXBiWc7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60643728"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="60643728"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:57:24 -0700
X-CSE-ConnectionGUID: 7lIzCNAVR6qR2FCNCi9FFA==
X-CSE-MsgGUID: jsNCrqeCRwuHtFu3GzGzEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="140657810"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.223.120]) ([10.124.223.120])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:57:23 -0700
Message-ID: <2c79c6b5-db40-4e54-b058-a95c56f735fb@linux.intel.com>
Date: Thu, 22 May 2025 16:57:22 -0700
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
Subject: Re: [PATCH v8 17/20] PCI/AER: Simplify add_error_device()
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Weinan Liu <wnliu@google.com>, Martin Petersen <martin.petersen@oracle.com>,
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
References: <20250522232339.1525671-1-helgaas@kernel.org>
 <20250522232339.1525671-18-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250522232339.1525671-18-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/22/25 4:21 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Return -ENOSPC error early so the usual path through add_error_device() is
> the straightline code.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 237741e66d28..24f0f5c55256 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -816,12 +816,15 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
>    */
>   static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
>   {
> -	if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
> -		e_info->dev[e_info->error_dev_num] = pci_dev_get(dev);
> -		e_info->error_dev_num++;
> -		return 0;
> -	}
> -	return -ENOSPC;
> +	int i = e_info->error_dev_num;
> +
> +	if (i >= AER_MAX_MULTI_ERR_DEVICES)
> +		return -ENOSPC;
> +
> +	e_info->dev[i] = pci_dev_get(dev);
> +	e_info->error_dev_num++;
> +
> +	return 0;
>   }
>   
>   /**

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


