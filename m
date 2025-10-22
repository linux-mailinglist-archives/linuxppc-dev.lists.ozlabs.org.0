Return-Path: <linuxppc-dev+bounces-13139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EBABFA21D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 07:57:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crz2c6mfrz30Pl;
	Wed, 22 Oct 2025 16:57:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761112632;
	cv=none; b=UU3LzEKsxhS+6a0IUlcSIsy6cqV1hA9OV9uoOcVnsBjWfRpJxe5m7W0NhsQz7H5uhW7Bu6ZwzinDEs/r3O4hEqpRVh/82vO+YIrESfVPQsnWtBkgqtU229L4Th937GJxwTJwKjrAvsHPuco9P0T8igqlYzaJE79t5PQlvFmo5Kx5gMVjYRYhoJ/8og6cUAf2FHLNlQzgZE6GO4P507dUq0PKWIFO0dFqsoJunNzjrGchrLlfLMNMrU8JNzqR4VpHHf/tJL5729zLJGggq3kQOZYcq6ZwdpOVqJxVObZVuoedfklEzG1OBiDS6h1gBnqrVNKDNlSvT5FeFNRdqnC3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761112632; c=relaxed/relaxed;
	bh=Oq4fzkS01zCv2I4qOypTEqukIE12MkuzMGCj+rV1CCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVtn/aJiOXo4GDepBDBtWj1wZ9nhC4qRPlGA42LpC6mhAHcLJQ7yoKfHHlv0z8t6zGCZT4MdKDEgoJ17MIPcqpVlleS0pEtp3cwH/pGBfdBAbWH1N50bbS+7HdGl92KJtSkBx9lJsPZNpwFoMd43Z82RGA2708XbXuAjRxMq7MWVO9d11X1q3UsGP0fa576oyQcx5XjWxKiuCnTvbC9ouRLBMLx5mtE123qwI70ygUW/cnf7we+W6CmLAtNvmxYk7H8+FZKLcgmu+1b2Bg+rmDEH0exfu17xp4nL8H1YX7+SVYLWDg5K4p1gXVD4S2e0WFP9bbMds4tVQrXkwjn9+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A08TPlpA; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A08TPlpA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crz2b6jnBz2yrb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 16:57:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761112632; x=1792648632;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oq4fzkS01zCv2I4qOypTEqukIE12MkuzMGCj+rV1CCw=;
  b=A08TPlpAyIYFkFAFDsOdMjvX4/KmDEUPu+L69wWeWUbXYJZw+QTts6rL
   dES1U6eBJ9U/Unl/WWhrNT8fww0AeZX489FxrEtSEQG5yXnI/10KU1BDR
   LQJosN63IbnfkdPD5BLctzBFaJ2NMkyJjeucN+wI3hEAZM7d0DOazwwAA
   31k3l1R4UJOcVY+Dz2FSEJLh4qEwok5Jy85B3cEzBFS146olB6ZYQ5UmA
   JvZHU539BE97xuM+b+Fv8omC0Hllylv1LlHv7TTbYasbnSkT9EBq81J9m
   WveLTV4+UjUhIjvGQ7zlqSmRgWXK4XCmHxomGv0B46qlmKrfk79W/NUVo
   Q==;
X-CSE-ConnectionGUID: d7vnXTuHS/2/BGroommLcw==
X-CSE-MsgGUID: 17ORGPXpQEa+SGjFnGMQQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62281250"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="62281250"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:57:10 -0700
X-CSE-ConnectionGUID: jQ221r4UTleoxdP+jV1Nkg==
X-CSE-MsgGUID: d9hLZVuOTp+rHjN7swLSrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184184728"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:57:02 -0700
Message-ID: <bfe00290-6ab3-4c09-b0bf-46bb7af09d60@linux.intel.com>
Date: Wed, 22 Oct 2025 13:57:00 +0800
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
Subject: Re: [PATCH v3 06/25] KVM: x86/mmu: Rename kvm_tdp_map_page() to
 kvm_tdp_page_prefault()
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
 <20251017003244.186495-7-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251017003244.186495-7-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> Rename kvm_tdp_map_page() to kvm_tdp_page_prefault() now that it's used
> only by kvm_arch_vcpu_pre_fault_memory().
>
> No functional change intended.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

