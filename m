Return-Path: <linuxppc-dev+bounces-13634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF938C23F43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 09:57:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyZc74Whvz3bmk;
	Fri, 31 Oct 2025 19:57:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761901031;
	cv=none; b=XrzG6HlNui5cqZt0ga+av6Ip3DXg/Y1LijyL3B7ZP/0P8KXKgIVglNvEsdPj/wSvxisK+kRlHH+KJ9EXzvI7dyoV64E4KKVfViYFmrSF4jwKrpOweRXr/T+LWnMkQkfjLJdU98IxkIJ0yUojZFw+rSTeE0HuhI4EUAGU2sWovrs8k+VvjVuRg1bcG+41sq5KLU0677p4muZhv8KqVVbIWy/KQ1SPUVly3e4ylbWFiF9lY1jMTh31heobvOaIBHXqiCJmVSBxJQ/Wat7Z2aM96/Ait016Rdj29W5vEw9+IpufWI1NvKrqSWGFVC0BP7ivvuAmZCLWSkQOP3aDVIqFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761901031; c=relaxed/relaxed;
	bh=4KtmtUmeRKY0mhGFlHsvUKmdbP8tr/tefUK44+GBirI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGBBSJU4s64h4qOmDvdzn7+xFE90KSU5QE4SBc5PMJ3RZELL4NxatuYmp+skhNgsGZYfDHM0OJL4U/pAsEDymDKIL9Yhm5hhBFbXjqAiJ+2YzSSBVDQrpg4SUdEmM47ZZy0XYt3sOYWE+rFgd1VOnVfrH2yj2XRLNwtVL+CUkLg3yMKpsxr90h1WQ7lSdhI0aUNyKxBePEzZZRztktyFwkcdFI8B3YM8uYudWLqUhOg254/uhrumVuZDBFMHLhGYHQ9UujQX/U2ZSOLOL/5YViUywVjgcbLI5h/Ng/bMS/l/m8Qjj39CIiIzeZ+KiiA3JRw3cfZuKpwDWNio04CJVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hWkFWzUk; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hWkFWzUk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyZc64gfbz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 19:57:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901031; x=1793437031;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4KtmtUmeRKY0mhGFlHsvUKmdbP8tr/tefUK44+GBirI=;
  b=hWkFWzUkv7aleBdhVScUMmBFN43Xim7DbTkA8UhapUC1eK6Xt4g2oPqQ
   8v9wTbWPxb6LC6uWOjcntaYExgvcptL5PFuL/NVZD0OUKmMabgjlsfFVu
   TNhivNevOZCwQs8x5Q2SnNfFyRJyKw3VOABh9Xr81H5ncPA3zI/ddb/mr
   ka9vDLg8LXSsUBTwf9+VO1D4D+lTN8YDhNHKsqkUfii+ZREq/MItaKJlL
   tN+jggvBTcOiPHWK3Wa58cfllFJ7GGWQcy9Z0N34H52w2og0fd5X42xUH
   6TEIxUTGc2dfqcpMcr38yK1Dpo+ReGvS4WRbeCHpGmeZMVaZdJ7lP1kRE
   g==;
X-CSE-ConnectionGUID: yLIDIj00T5OdlgrpbLEoyw==
X-CSE-MsgGUID: 9V/RZ3o7RHCLsjJBJtneUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81685514"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="81685514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:57:09 -0700
X-CSE-ConnectionGUID: sPC6mEPlSqSwx3TQdrZz6Q==
X-CSE-MsgGUID: BsJwtL+UTb27i21msflWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186118722"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:56:55 -0700
Message-ID: <88d479a0-e849-49d6-86e7-8cd00daccee0@linux.intel.com>
Date: Fri, 31 Oct 2025 16:56:52 +0800
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
Subject: Re: [PATCH v4 17/28] KVM: TDX: Fold tdx_sept_zap_private_spte() into
 tdx_sept_remove_private_spte()
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
 <20251030200951.3402865-18-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-18-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Do TDH_MEM_RANGE_BLOCK directly in tdx_sept_remove_private_spte() instead
> of using a one-off helper now that the nr_premapped tracking is gone.
>
> Opportunistically drop the WARN on hugepages, which was dead code (see the
> KVM_BUG_ON() in tdx_sept_remove_private_spte()).
>
> No functional change intended.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


