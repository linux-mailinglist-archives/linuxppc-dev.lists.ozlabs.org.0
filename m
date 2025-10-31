Return-Path: <linuxppc-dev+bounces-13628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9714BC23BF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 09:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyYmm2zHsz2yD5;
	Fri, 31 Oct 2025 19:19:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761898776;
	cv=none; b=WWy8a4tOeuW2ygmS07MWsnaP4JIe0EnY9S4pWM1z3n7jYpwC+88+7TTzaCHWnSwPlP4qgwV/xprx9tBczgM5V0rmvJ+rvXu5ifygfPpIUQN/ozOd5OCt5r8gXVMNFIxGOPZBhvUmIsYFIpZEzeUi2SxfI0gVlrd9ptmbxptosGn4jqzsp2s/+WLfLbwcxUH51SfWNFWeiTArhxotQ9d4570FfUGQ+qKyAGCsRNd5h85F441bfT3MrLkzGaFcHoqABNdp243VPagx8e/0uA3NB0ZuvOO6IBG2g9SrGpL5xEyk6inhKFmubU6rgCiZFWEfB8TU26PsfzJhRMsQbMTifQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761898776; c=relaxed/relaxed;
	bh=EzjqWFPbYzjEfpDteBcncRVxcsQvYXXWJGNfJY3z6Qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoRrl85nlvjsnjcFyQVUhKJI2st8XuiIyc5Y/uhKeSh5lUJH8lrhLz2Oc/FC+1+y9QDUM9EN2f2SfYxk/hLcHRJAb79yyuXei90yFTl9auVzudYlNw/hsXdGGUcoDuk/gTxevHdqfIYf9HiiB/Yf3v8WbEwtYASYZAu2pfGlLnX735lBqvscSwFBWL3NqgEEyHbp62f3ywu0znuktXWWJETDSjC4kPaUL2LWy7vKkRDRh5heQbgMHI9w3y5mhNcetaWR9mlYyzQuvOMDQkfwlDOL6YhJR8DE/Ci8Uhotx/30CGsIaukZCAMXSL2P+DqO5Re3jNgjWR2p2Pzl8I6QUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uu01M07n; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uu01M07n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyYmj158Bz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 19:19:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761898773; x=1793434773;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EzjqWFPbYzjEfpDteBcncRVxcsQvYXXWJGNfJY3z6Qw=;
  b=Uu01M07n5zKOlRjF7OzTzFGT5Rk4rSA/1L3VOjsCFftzEMEl+9nqIM2c
   m8V0YCCHUdhcYM+2dpKb/yJiVPS5okYFPQdWeX4lRnE25AJl4lT1Aj9Jz
   KcwLCtk8kCL2Qm5xd9YohjYMouNTX9zQ4S2WKjRfLAuF5hRVDJmz1W75p
   I/OTmTY371A0utoNQnA0c8LyLwqXKWwoOwK4gH/GAbceBAsm3anc2oV//
   Trm914ZmWlN+l3n0HJSeY7cV6iwOB9ejt9W5Qh578N9lXljPWT7fweVaE
   YF6wGX5TO/IUdfxKp6ebzHUyyDLWW1lMb24RL5n4wCWrkSZSRN5dCsOKI
   A==;
X-CSE-ConnectionGUID: aIYz1Mo/QnKMpdNgwHTG/g==
X-CSE-MsgGUID: IolR53zLTuWHOUuLVFpiig==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74730718"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="74730718"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:19:29 -0700
X-CSE-ConnectionGUID: ln37oo4sSVGgtPADrikf7g==
X-CSE-MsgGUID: Cf3BSL1nT0KAv+tRtGKg6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186112068"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:19:22 -0700
Message-ID: <af023723-63d5-46d3-85bb-c2d2dcfe7b15@linux.intel.com>
Date: Fri, 31 Oct 2025 16:19:18 +0800
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
Subject: Re: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full
 RWX when creating S-EPT mapping
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
 <20251030200951.3402865-13-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-13-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Pass in the mirror_spte to kvm_x86_ops.set_external_spte() to provide
> symmetry with .remove_external_spte(), and assert in TDX that the mirror
> SPTE is shadow-present with full RWX permissions (the TDX-Module doesn't
> allow the hypervisor to control protections).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


