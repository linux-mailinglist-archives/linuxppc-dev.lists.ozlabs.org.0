Return-Path: <linuxppc-dev+bounces-8765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A933CABE2F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 20:42:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b23Ly1Sr0z3bc6;
	Wed, 21 May 2025 04:42:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747766538;
	cv=none; b=Bv8SSoDz6sLSJQu2KC1tjImWEG5kE/Kt+MXxNLvXp6/BQosX3VaZ65Q04rwgPojue8Q6A5Z+OlYKmq9TilJHBgMSa5z7gjwYS3hVm+HmCS2leqTY19+KiZnv3RYlHGJWDSJiyKixzSVZPXr6Gz+jVrFMqo9jkWoP3H5PatFi+R8RsdD6Cetq0SfvSGjj5B3FXAYYbxAfLB/auL4Qie/7asH2NOVny40Z3rC/l3CBXnnBWsMUyoDFG1CNFgZzKb10u17SInKQ+HXiDOjFnzYxQPTd3OlS3wJv0CZ2E03x6/uZV2FB2wZhN1m9zrk28el/IwV4k2NqdhKc3rLPptQSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747766538; c=relaxed/relaxed;
	bh=0kat9u8I1oK1UBbWu1Ov9q+Zr2wDqvIfou0+O5KYbOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8Te5Zw1SPHH5zd9A1kHuXMiDOqXyG07/TnCsmhNVkQG8FIFahciJOgZ4NvrK+CLLYE48hVZA3TMK+kNU/rfFQWweXtMPVwKq0TvKBrlLwMG3d6ehnrRno27su2cFrJX57+1JCNgXySA6shAGK5fmT3ngcUstPXeuJLIfQNR2GkpeadmwJmQ9gIBPAIJdYDOE/+fQrks0StsIsnpGtwar4iNXGAfdRMkAqB7itRqkIbO6KL9whuG+wH/6kA3pRbFpYK1IfahmTq9rOOAGEJL2WsbrYwtn/vT0+vx2xzlN2angO+IwzzgEd44XQhca3pETzqx4tayg4JRsqCrAMJbFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TGsyDOa6; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TGsyDOa6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b23Lv6F2Rz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 04:42:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747766536; x=1779302536;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=j22GacXfS2puntGe7vITacA5IsbpeagcjvvcW8TiD7c=;
  b=TGsyDOa64xj4ACAgqre9V1H7a3AYmdrlDCSbciXVDrJzUXx7AdT8Crtj
   v97Yf0k3O18AUDWfQqez2Cufh1fdgvcr1bzQT6Eqyam5UjY8p7ngbJqXt
   J2oh77K2pPvb9c4PSCPBQZnFMRMIFaqYKnwd3nCiutrfwkZD+fgmdixTX
   ltcsk2saZgR+4RDTQI7xIZxDrtmVI5fKqxa27CNSahWISuhJHc4T+WcY4
   yZKkcKdCFmRj5lODy1Zg1CbKtLs0OkdpFmjKYfJKGZBvT2Ib4KpkGQ159
   BFcswctQ7Z1J6NrnNubjDI/U+mGKJ7PtyAtWmQLAUtZgU+7RA7y6l590n
   w==;
X-CSE-ConnectionGUID: IlRZda/6S0Kp3ihSzmwGyg==
X-CSE-MsgGUID: Qs6If8PaTAawSFj5GYASuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48971306"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48971306"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 11:42:12 -0700
X-CSE-ConnectionGUID: i6W+Ui8ES9yf7P8IDuCFIA==
X-CSE-MsgGUID: A6tollxAQ1yMbnP5Wg4XsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139680669"
Received: from iweiny-desk3.amr.corp.intel.com (HELO [10.124.222.89]) ([10.124.222.89])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 11:42:12 -0700
Message-ID: <c771e3de-b945-49cd-b078-762164d6ac5d@linux.intel.com>
Date: Tue, 20 May 2025 11:42:10 -0700
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
Subject: Re: [PATCH v6 14/16] PCI/AER: Introduce ratelimit for error logs
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
References: <20250520183153.GA1316070@bhelgaas>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250520183153.GA1316070@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/20/25 11:31 AM, Bjorn Helgaas wrote:
> On Mon, May 19, 2025 at 09:59:29PM -0700, Sathyanarayanan Kuppuswamy wrote:
>> On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
>>> From: Jon Pan-Doh <pandoh@google.com>
>>>
>>> Spammy devices can flood kernel logs with AER errors and slow/stall
>>> execution. Add per-device ratelimits for AER correctable and uncorrectable
>>> errors that use the kernel defaults (10 per 5s).
>>>
>>> There are two AER logging entry points:
>>>
>>>     - aer_print_error() is used by DPC and native AER
>>>
>>>     - pci_print_aer() is used by GHES and CXL
>>>
>>> The native AER aer_print_error() case includes a loop that may log details
>>> from multiple devices.  This is ratelimited by the union of ratelimits for
>>> these devices, set by add_error_device(), which collects the devices.  If
>>> no such device is found, the Error Source message is ratelimited by the
>>> Root Port or RCEC that received the ERR_* message.
>>>
>>> The DPC aer_print_error() case is currently not ratelimited.
>> Can we also not rate limit fatal errors in AER driver?
> In other words, only rate limit AER_CORRECTABLE and AER_NONFATAL for
> AER?  Seems plausible to me.
Yes, we might lose important information by rate-limiting FATAL errors. I
believe FATAL errors should be infrequent, so it's reasonable to allow them
through without rate limiting. Once you make this change, please also
update the related SysFS documentation and update code accordingly.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


