Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C18666AA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 06:07:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nsswq2BTZz3fBQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 16:07:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GPdMh6Ef;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GPdMh6Ef;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nssvv52hQz3c2W
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 16:06:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673499979; x=1705035979;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VDEi9SBFPHh0vp/V8tBDLP636oGPQipAnV/XqRFHXcQ=;
  b=GPdMh6EfigZxplLGRzRMahdLc0Q+FkSHZjbMmxOsZuNOFv8pEosRg3gh
   g0rHX4quQCXIA3HtqsxZ1Fl7++lJUii4u843447N8l/aNceQThHio69ZR
   aqYlpgB6CTi0I/AaQwgEHRznZz5X9KLFoA8hznZuXdVJJONr5gbaWEBWh
   b4zkdDZa+Be6Vq+ajLlo5uPmJ0/A1RtzuvYqTSowvwe3tDOfP2MPc9um4
   HeIcykuQ8sra2S1G2SGOW0DjK+B713OQhqV2QtLf5tK+W3GCLol+9h/zP
   VsQ5QXsE0WAKuWbv62MwMFj+2ejuDydVrJwmMptisK4yPFg5QkFLa4VxA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="409850153"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="409850153"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 21:06:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="651000806"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="651000806"
Received: from mabir-mobl.amr.corp.intel.com (HELO [10.209.115.16]) ([10.209.115.16])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 21:06:15 -0800
Message-ID: <0406e96b-56fc-d9bd-6ef8-88157ce64e1f@linux.intel.com>
Date: Wed, 11 Jan 2023 21:06:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH V1] PCI/AER: Configure ECRC only AER is native
Content-Language: en-US
To: Vidya Sagar <vidyas@nvidia.com>, Bjorn Helgaas <helgaas@kernel.org>
References: <20230111231033.GA1714672@bhelgaas>
 <880c4d3c-86d2-082c-bb58-8212adc67ff3@linux.intel.com>
 <4ddef2c9-44b6-4a08-dbeb-428cd0864c55@nvidia.com>
 <de13b6bd-813f-d0bb-3a92-ea1ad3db5d54@linux.intel.com>
 <4a764544-189f-65e0-7d77-84995299721d@nvidia.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <4a764544-189f-65e0-7d77-84995299721d@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, vsethi@nvidia.com, oohall@gmail.com, bhelgaas@google.com, treding@nvidia.com, linuxppc-dev@lists.ozlabs.org, sagar.tv@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/11/23 8:59 PM, Vidya Sagar wrote:
> 
> 
> On 1/12/2023 9:18 AM, Sathyanarayanan Kuppuswamy wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 1/11/23 7:33 PM, Vidya Sagar wrote:
>>> I think we still need bios option. For example, consider a system where BIOS needs to keep ECRC enabled for integrity reasons but if kernel doesn't want it for perf reasons, then, kernel can always use 'ecrc=off' option.
>>
>> I agree that "on" and "off" option makes sense. Since the kernel defaults ecrc setting to "bios", why again allow it as a command line option?
> 
> Agree. "on" and "off" are fine but "default" is redundant. Do you want me to push a change to remove that as part of this patch itself? I think
> it is more like a cleanup and should go separately.

IMO, the "bios" option cleanup and command line update from Bjorn can be in one patch, and your change could be a separate patch. But it is
up to you and Bjorn.

> 
>>
>> -- 
>> Sathyanarayanan Kuppuswamy
>> Linux Kernel Developer

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
