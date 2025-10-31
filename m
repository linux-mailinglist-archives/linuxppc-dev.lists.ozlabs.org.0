Return-Path: <linuxppc-dev+bounces-13640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E01C240A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 10:11:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyZwW0cg0z2yqh;
	Fri, 31 Oct 2025 20:11:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761901882;
	cv=none; b=kSXmZlNWwIxwaMevXrEWl3otU8HoDa9Vh5c/ZDrbnb9ujZxrd/fgwqy2+3nMaGmEkAaPItQ9W7b7l4JHOvPjZFp4PrSe/QSrE+ExNbz+lixnay9bINI8W0rW1OS8P8GGU5j/aFFgogW8X9AY5jlsbPvAo2SsVTOcYoYLx6r+O5RPbxZ+MonttuOdHO0A17E5sNHazeHoMW4YbxBmwsJZc50hvjFf6AQaNUi4S/JajOWVDSAC0hhhSyCae0daLDh/RfGTQs2JM05mM2NBIp1PXzBXkBwGq4s1siSxVcmFQWE9LNW7TmUeQVUad8Kk0+uXSj2mIAo+Uh0hgnI1ZS/LYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761901882; c=relaxed/relaxed;
	bh=nVFcr7cSAivJ3kX3Ong+t5W82ll2lBVB0+D6Fy+f66w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gt37VtRhYz2Mt3vjfoZ1ktg1NiDTPoFQVd8TS0pe6kCqA39kHviWyNutu8ubO628VfQJCFEz9yo9MGQex7FfWYKhBpe1qOe5zmRfE3Fn4Q3bs0DiLjz+jKzqajRgFMYauqk9xREPnsfnVnSPqH9yxMplwKbl3nOf8OCoF/aHDNikORpEq4g0/UA0eBP9vOr++1q/E99RyNhrBXBTASRoNWTyLL+sSd6WbOfIjEl7A4sadw8StMecIrpNG3cfSG6TM3nh9zB+fwgQeLCrKByzZYmRKLUu37JZ3EkRPI4tFQXZjyVTQTCHPRuKj00jslxbeeNKOSgle2ZTF8CiYPvtzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E63JqdjD; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E63JqdjD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyZwS2L42z2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 20:11:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901881; x=1793437881;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nVFcr7cSAivJ3kX3Ong+t5W82ll2lBVB0+D6Fy+f66w=;
  b=E63JqdjDhwEk1yjn9E861qenSzF6QzYWXLQxTYq13/N32kVCjoSYs9G5
   gN5xxJiwIpkMoti4Wxp7SUNuL+87tjSBfC0fwVTe/ejKR73ne57+6eS47
   15D0cOKc5mVYcmYv3Zcit2PoGRS2bov7fiL3KE7JSdhR8zps4BlDK5pQN
   1Bsb4hncJPPDUG+KlchsZTtrdodBftET9uBqofnSEKUV+jtAgyOLV6+Yj
   mpz0EIO5cs8o2cf7ESFwOHvwFTNtM853OmoOQ7s/B3/FrqQZ4JEQEj0d4
   +o7qI/rZv1a4e+B23J8GzoyXpS3aT8P64E8/PmicN/xzCftkXwyxSvjFc
   A==;
X-CSE-ConnectionGUID: Yd1Znwv2QNqr0eMmgUXSpg==
X-CSE-MsgGUID: P9pufll5RV+HSq3BMVgVHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75509617"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="75509617"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:11:16 -0700
X-CSE-ConnectionGUID: mtRCVhiuRGSbh+b9MLYkrw==
X-CSE-MsgGUID: naB5mn6dRoCATJ8bJWh6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186124007"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:11:08 -0700
Message-ID: <709166ed-2102-46f2-807b-3d8139a386f0@linux.intel.com>
Date: Fri, 31 Oct 2025 17:11:05 +0800
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
Subject: Re: [PATCH v4 22/28] KVM: TDX: Add tdx_get_cmd() helper to get and
 validate sub-ioctl command
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
 <20251030200951.3402865-23-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-23-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Add a helper to copy a kvm_tdx_cmd structure from userspace and verify
> that must-be-zero fields are indeed zero.
>
> No functional change intended.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


