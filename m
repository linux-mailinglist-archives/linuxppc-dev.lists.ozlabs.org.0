Return-Path: <linuxppc-dev+bounces-13627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC4CC23A0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 08:58:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyYJc2tM3z2yD5;
	Fri, 31 Oct 2025 18:58:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761897520;
	cv=none; b=FfXYNFpVdl1AP+S+5i2nWaeacfkpj5Qu2Hw/vtAmp/0tFcH7HX1uhznqFj4aJRclgCU2AYrVmp7KmREDVZzKNljW1YPYtqLmR5MrCknwvNWZvdF34KXa/hhMu8ioSYxsVGozzNJcUuAqgpRluFBbvEGuV9ONZgxAdhV76tJj4gF4i3tlo9cvyleh1WH0wYPxUUOCUkpjWcX3bePAD97L+XWLk5u0Fr1WuJKexXKKOUGZA/LeI78TJMbEuVZT+W/FHMdc291d2J/FIPBCqTOwOtZcLHRFK9cvKLPAQ0tuvBeYEjzcMAGNWoLgodFDfyawuNkVNyiTIOSLg/FBkNDfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761897520; c=relaxed/relaxed;
	bh=8Yx3s9TF9xhjt0DUArjbpnN0td1BR4+JqSK4YdCuyuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhzlW6YOW/yOjcWfbfsckrrtsm/LTfi3eW4UZbyTvLB0+qc9fTSgPutpyUJOeK3h4nO+p2T2uqYLfaEkebDjfy5kOEDIt9QcnpiRAZ0jFW+74hOGMtK+CDV+XB/n35VkNQq0qi5UVvAUK3KTGkk9bb7sZjX7aB1s+eHU4w+9vSJ/s7ItrDSjJyaxxzWPDqi2n05v593Lx+2z1MzmI0PTujFyIpbnbl6H54vAGoWtIYEUPB4L0kwjK5s4Yl2/s1r3UnQV7dNUxisxsqUoidzIIwKt3ceA38fjdXxlVLhi+coycTtO1QrONIxNpQc2dEzYSTCzrWYH1YMAzIHxOZTsjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AL+sr4UE; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AL+sr4UE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyYJY3Gk4z2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 18:58:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761897518; x=1793433518;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rzM0b8qPEYkMq5nIoO4tMjMsIEGrMoYlxde7BXZgKfY=;
  b=AL+sr4UEWSTn/1G/isz6ndTmIqb4lP3nodYSvaJAP3a8Hsl8aWxSR4ex
   mHwjBh74fl3myzlFfbyBiaYrgZmaQmTpqrDaaXmeWeaRbV5DabB51+l4U
   qPu24lSEV3GiQ9A8H18QXT3j43AGZcEKaJFydyqnL7wTHfOdg+VbSiHuc
   AYmcYUJJkugC/nz9HmdRgC/gKhxWfu3L/+vzvgd8b4mkHf18YNddVL7hV
   IzXv7uEI8mgaNj0Ompe7X+qp+AxA985WEQLkhTDyCGqUa5epyhHUTPhI2
   nFIMjH/Etw4h88J/XHmtx/raTJRa4KW41cfbzgyIQojUD/ue24vKfeICt
   w==;
X-CSE-ConnectionGUID: WRhuXoCVTtq0FkAIVS98Xg==
X-CSE-MsgGUID: RoWZ8PjRSTiVW2P8nDdqzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64148734"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="64148734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:58:32 -0700
X-CSE-ConnectionGUID: aelFfb7/T7+TXvXFUL/t7w==
X-CSE-MsgGUID: o2Ju4geKSZSKLBD3vX8YRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186108753"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:58:25 -0700
Message-ID: <7e43061a-b901-4e8f-8ee9-57d67aaf4f38@linux.intel.com>
Date: Fri, 31 Oct 2025 15:58:22 +0800
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
Subject: Re: [PATCH v4 04/28] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
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
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-5-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-5-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Add and use a new API for mapping a private pfn from guest_memfd into the
> TDP MMU from TDX's post-populate hook instead of partially open-coding the
> functionality into the TDX code.  Sharing code with the pre-fault path
> sounded good on paper, but it's fatally flawed as simulating a fault loses
> the pfn, and calling back into gmem to re-retrieve the pfn creates locking
> problems, e.g. kvm_gmem_populate() already holds the gmem invalidation
> lock.
>
> Providing a dedicated API will also removing several MMU exports that
> ideally would not be exposed outside of the MMU, let alone to vendor code.
> On that topic, opportunistically drop the kvm_mmu_load() export.  Leave
> kvm_tdp_mmu_gpa_is_mapped() alone for now; the entire commit that added
> kvm_tdp_mmu_gpa_is_mapped() will be removed in the near future.
>
> Gate the API on CONFIG_KVM_GUEST_MEMFD=y as private memory _must_ be backed
> by guest_memfd.  Add a lockdep-only assert to that the incoming pfn is
> indeed backed by guest_memfd, and that the gmem instance's invalidate lock
> is held (which, combined with slots_lock being held, obviates the need to
> check for a stale "fault").
>
> Cc: Michael Roth <michael.roth@amd.com>
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Vishal Annapurve <vannapurve@google.com>
> Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


