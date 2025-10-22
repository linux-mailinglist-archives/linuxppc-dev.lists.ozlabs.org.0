Return-Path: <linuxppc-dev+bounces-13138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF925BFA211
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 07:56:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crz233d64z2yrb;
	Wed, 22 Oct 2025 16:56:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761112603;
	cv=none; b=bAPRD7rUnSa1SbWxj3EEGUEKtULQOxyyW8GuPbpj2bG2fje+IeKDp2Mb6Qqc5V4Hws1w8JtBqKyOYngEZObah1UeQxarqAZlGNEGwRNkw+0T/9TZJbEGGPS9HdIiZOIaTZEO2qj6Z+oAf+JNA56fPrYEYH73Zfhn+cm0GMRr3HGpWaKwQH0utOTgtB47BzjCW4NSQcZmYET5dF5HawfBIi9Pp4QUGXOMe3n6r3Mdbuno1e6SmroUDYeDUUugql3abwicp+f07FWbBn8nQfzMWddlBZZ0hL6B+GSRklTMK8zoXYEIrCChDbcBvM7vn3we1E6pQT/WI5faJsfZYoZFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761112603; c=relaxed/relaxed;
	bh=e0BNSEe8+JWm79ZsctEdZVSTDEu6ZAcAN5FVm7Wus1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CD4Xx/1l019mwtQ/f2eyvVN27S2vJ94cvtgx1/hg62PiRhUujr0y8z6UNVP/TflDJo47mE9nv9aec3TM5n9BFZ/SB7pAchcIZIFDmP0TES6OHg6nvGMxKJyti1apuk+a4aq5QsO4LqeXRkqUAKMyWNCSS3nq83jd3BgfEMGi702E1NeQCFqt+ytk2JvEV8T0dE9nug9am18fCTvA4WcoHkLjTg0Z0F8vfbj/FFe9XHWjvpBSG2qHfJSrAlfetz8HYUWcNhMv0npN563Zld0ICUtDO/w2ocC9HmNEAqEZemLFb5pRJeYEK2pVqIbot/+CUedltfTYsDLpye0s3q5eFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TwbaLQB0; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TwbaLQB0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crz204wpbz2yjr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 16:56:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761112601; x=1792648601;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=e0BNSEe8+JWm79ZsctEdZVSTDEu6ZAcAN5FVm7Wus1E=;
  b=TwbaLQB0A1Tyk/ULTDfxRagZCqIt+SPTo0wWZ5S8Wa2D9Lrx9Ze2ah5H
   4hk1LWGq6Nu4/nzjwKHTSXVrqtLjQuecsMT/18RCNO09r2Rt9DiSBRQbu
   8AYB0FVQ8HgFAewPaNDE8WiSf1YcxXy8p83JtLAwDZaIPAM09khuPiQSO
   WhKlWu/e1e5NUjtIVdx78RotFq5BRYLBxRuon/1nAMHz+tWBnKgbyKc/a
   tDgnW+tdhYuLPrKowO/rDQTeq1fVlcumHBCHeU5b3VmzCUh0dOcthOhLk
   Kly1b72BcPjYf7OJOz6nRXrPKRNb8nTIuvXiY3oNzNtHCuc2Rg8MKhUDl
   Q==;
X-CSE-ConnectionGUID: W2vJfEaWTaG1SHF6nczViQ==
X-CSE-MsgGUID: 2aIOWpLgSD+mXgjgXdKwHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80874570"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="80874570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:56:35 -0700
X-CSE-ConnectionGUID: oEyBARVoRTqxmx9FX15Ezg==
X-CSE-MsgGUID: iu37FNdWT/WUX/u/fUlTIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184184586"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:56:28 -0700
Message-ID: <7aa86887-b499-4618-b174-96cb0cd17d24@linux.intel.com>
Date: Wed, 22 Oct 2025 13:56:26 +0800
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
Subject: Re: [PATCH v3 05/25] Revert "KVM: x86/tdp_mmu: Add a helper function
 to walk down the TDP MMU"
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
 <20251017003244.186495-6-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251017003244.186495-6-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> Remove the helper and exports that were added to allow TDX code to reuse
> kvm_tdp_map_page() for its gmem post-populate flow now that a dedicated
> TDP MMU API is provided to install a mapping given a gfn+pfn pair.
>
> This reverts commit 2608f105760115e94a03efd9f12f8fbfd1f9af4b.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

