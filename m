Return-Path: <linuxppc-dev+bounces-11407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF8B393BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 08:25:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCBG9290Tz3bby;
	Thu, 28 Aug 2025 16:25:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756362305;
	cv=none; b=lXhOqpT7dcODsQec/UD5OQSX7ny9thtF06+bmLUfYInfnWnm2tknCo1qIQFE2acdbRyEhLm7VrpZ+tMXCu8BgmsQoJfSfnxcXtS0xiPkRPJNlXlKPOZ/0+7ts7jHFbGU4LuBvZTjk6xPwBtofHElanLIdBQm0XR/vS6bkENqSh6UBVdSpBKYsb4X//H/gGw5cUzaDE8IGeMrePRFN9aZLedZb8Nmxcl+EADooqnhLJqs3IqgDo0IS1rfITWpDMvknPd0OPZ3ETpuRlHRcEneLeMx9dwihOJ6DqrukeceKMK7KyO/0NyTq4VitssRY2QXz7lamYucU2kkHPUYonbn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756362305; c=relaxed/relaxed;
	bh=XZtfQE52w2XyZAFqcJlMFm2EHwJOdlbU9zNYWV69/nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QRG8TCaYDVc/gggKGZyNFDVvIlSsh74Adkb0B+cZNydMFEqkuGm7QXoJFfEJu0w1TSwSHPD/h/E1aGHWHhcEfZ0itBHVfSmqMQ/m9N3/OT95rRb43qm7y0TtE4MjDsfmefe98kDnVuDW2i74PiSyOgsXeIx/bbw+JMYfSO3m+kOOEodA48AW00QTlseKY0vNPElIqTq3620H7Xq5WsFseob4jAk7FHf5byNACYDS9MwRJ2fdmiO+WBI73/mdRC2u8+erMYLQQ0wLt4tOvNhEKxF+YyA6xnMQkspTLUN2qSHa/u6eavVQZwnVcbYGk3fpfnJKRCUMipDm2z7PrD4iGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZR71Ym+L; dkim-atps=neutral; spf=none (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZR71Ym+L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCBG66PLXz30WS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 16:25:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756362303; x=1787898303;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=deoEk5vCJZCxUFiKzZOaYR266hd0dsxCcyXwke4xQLQ=;
  b=ZR71Ym+LALWMg9uacY9HaD21BPy57qkdpuAoEDgTtxVoXilFazgMPMxU
   qmiRlafsHPnRVNf0H2b6/fGwaU+hpj6av+DMiBwyaCBhc5OVTZk4GVC3t
   EgEpocIlbTcu6Mxpc3HgmS5anCmxf8eGvMJu+y1n+jXT8551s6bWRZ55f
   S90dy/YBWebrusrHHMt8/YBVz/rego8fQLmgCouqd5ySin4v/XEbYZVIz
   bdiQvhFjCB9DFgF5B++1hMbWVCnTNdJt1pIH4/1Pd3BfLnXPEvrED2P8W
   IcbsbqtGoB6R3FCHT3bm9eY/XETFoG2n/GNAJQaicAuZJmcCbdCzIcOYJ
   A==;
X-CSE-ConnectionGUID: gregaDA3Q+ij/AzEKuIELA==
X-CSE-MsgGUID: 61PvqNFwSvK38WNBNqIKaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="70061471"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="70061471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 23:24:57 -0700
X-CSE-ConnectionGUID: ydw6WkglS+q8Ly7dXL+kKg==
X-CSE-MsgGUID: RJvJNFHXTI6Ts8TpK5ryNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="193684744"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 23:24:57 -0700
Received: from [10.124.220.49] (unknown [10.124.220.49])
	by linux.intel.com (Postfix) with ESMTP id 95E2220B571C;
	Wed, 27 Aug 2025 23:24:56 -0700 (PDT)
Message-ID: <19e7d95c-d7b7-4188-9a55-a8fa10ee1b21@linux.intel.com>
Date: Wed, 27 Aug 2025 23:24:14 -0700
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
Subject: Re: [PATCH] PCI/AER: Support errors introduced by PCIe r6.0
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org
References: <21f1875b18d4078c99353378f37dcd6b994f6d4e.1756301211.git.lukas@wunner.de>
 <64a661bd-cb64-4850-90d8-f34de9457173@linux.intel.com>
 <aK_uqHGw3B4vtx66@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <aK_uqHGw3B4vtx66@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/27/25 10:52 PM, Lukas Wunner wrote:
> On Wed, Aug 27, 2025 at 12:56:41PM -0700, Sathyanarayanan Kuppuswamy wrote:
>> On 8/27/25 6:41 AM, Lukas Wunner wrote:
>>> PCIe r6.0 defined five additional errors in the Uncorrectable Error
>>> Status, Mask and Severity Registers (PCIe r7.0 sec 7.8.4.2ff).
>> is 2ff a typo ?
> "ff" means "and following" (pages, etc), according to:
> https://en.wiktionary.org/wiki/ff
>
> Section 7.8.4.2 is the Status Register.  The Mask and Severity Registers
> are specified in the following sections 7.8.4.3 and 7.8.4.4.

Got it, thanks for clarifying. I wasn’t familiar with the "ff" notation.



>
> Thanks,
>
> Lukas

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


