Return-Path: <linuxppc-dev+bounces-13325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC230C0C81D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 10:02:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6vf0hrwz2yw7;
	Mon, 27 Oct 2025 20:02:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761555725;
	cv=none; b=FMsVwe5pIV4yfKEGBbkRMhADNBfA/kyWyfXC/97kSVOZZFo5/LYTI2v/0HrfPTTXOUer0am9iCS7RThhYHVruIz54nCd73wz43mqUvvhjwVVTSC3dnsRdN4aWg/oSmBH+m93x/b3C/vEZwHHC1ygpS9v8PIEh5REe+r8vcGhkSQRlKYkpr3OK3PcGW15E82D45tDnpgYbMxP4ZFl0Oahon5XfWpViwVDefCf4l4imMLqGyT7/Lp9eIDunGghQc1m9SSjV2drHY/l1WbXhqDAsnINO9pgESK5YI8V2o93EPLN7tzxaRQyTcCzLttWjUaL+/KY/6kcEewveA94uZhzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761555725; c=relaxed/relaxed;
	bh=NnJtWbWzY5YVX0zOWup8+j8rI8xQfT8dQXRdXL7/Sys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=irUsU7QpyCwceY9Rm4xSh15PJroWVaXmhpVvAUaFSdipmXFswDoospVCljUXTGQEeGDykyiN7kXGbuHilqfYkBaitJtl6LiKRnyRDkUONMDIclI7XfAaxOkptDUGBa42gyr8XtOPhGN0HfKEvE5QWm0KccsRPu9WJ8iLTxkwvsMb5zeENAbzgj/3FuTXHmHRTjTDp2MHFKrmBFyRlPLtv+R450EW+JEQkvys92HY5qlk1EmJbFC/mgR24M5EJbviVqjbwCAiVb4ZiFk8/dmf/p3wUrh+mDk0cEf/NWT/O2jJVdVDXH9Z9dIEgyi2WGnvZFnFQ5oGcMbtdZtK31qxGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8gSXejF; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8gSXejF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6vb22h3z2yjy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 20:02:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761555724; x=1793091724;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=275YkRCyZVfjEDUsCr12iYfs5/SgTlKkXm5iRoBP66c=;
  b=l8gSXejF65asw/pctRhsW5X9siwT7Jn0yVPuYbQgh9LRyT45gD4bf8F1
   OLzHZ6flVB1JHJjqk6YGDgaijaVSkQiQ9G5nuw54XcFF7gWNHYTlrZHGP
   s+3hulsVpAwA3+bG+mMDbbaGA0TYMqC/7R/jrT1kaZwOlZ79/efh8t7Il
   follmcUcy/h9hbakAFu4Jd0BcIXGHqbttCOnDBa8dySZKgZmh/DJNXyqO
   VR+K0NIQugQU6MazhCbi1HS8dRNj+1rvqnZsZjow0UlVdBDv9dgM92W9E
   Pxs15VX9yH9cQMLzMhbVBxDnOqQL0x/w4dhzl5M6iIP06PAWy8r/ZEads
   A==;
X-CSE-ConnectionGUID: QGvN0wFPR2GTWNyxxXTiSw==
X-CSE-MsgGUID: l9SUfybSTGW0goR26otMTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75077413"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="75077413"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:01:59 -0700
X-CSE-ConnectionGUID: iCVeVDcZSguedVPvO1GnIg==
X-CSE-MsgGUID: rPVV21LWTqG3HlsE3kXlFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184892900"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:01:51 -0700
Message-ID: <59ae9957-88a8-4777-9bd2-196e8b4eb8ac@linux.intel.com>
Date: Mon, 27 Oct 2025 17:01:49 +0800
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
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
 <aPuqYz3ly5a3__mf@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <aPuqYz3ly5a3__mf@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/25/2025 12:33 AM, Sean Christopherson wrote:
> On Fri, Oct 24, 2025, Binbin Wu wrote:
>>
>> On 10/17/2025 8:32 AM, Sean Christopherson wrote:
>>> Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spte() as
>>> providing a one-off helper for effectively three lines of code is at best a
>>> wash, and splitting the code makes the comment for smp_rmb()  _extremely_
>>> confusing as the comment talks about reading kvm->arch.pre_fault_allowed
>>> before kvm_tdx->state, but the immediately visible code does the exact
>>> opposite.
>>>
>>> Opportunistically rewrite the comments to more explicitly explain who is
>>> checking what, as well as _why_ the ordering matters.
>>>
>>> No functional change intended.
>>>
>>> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>>
>> One nit below.
>>
>> [...]
>>> +	/*
>>> +	 * If the TD isn't finalized/runnable, then userspace is initializing
>>> +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
>>> +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
>>> +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pages
>>                                                                     ^
>>                                                  Nit: Is pre-mapped better?
> Yeah, updated (and then it gets deleted a few commits later :-) ).
Oh, right, nr_premapped will be dropped later.

Since the whole nr_premapped will be dropped, do we still need a cleanup patch
like patch 12 which will be dropped finally?

