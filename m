Return-Path: <linuxppc-dev+bounces-13639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80861C2405E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 10:08:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyZs73DS0z2yqh;
	Fri, 31 Oct 2025 20:08:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761901707;
	cv=none; b=eSxujjfKBAZ21M8HmILlSMGUv4GeJQqI5l9EE9SJyZLv9ZafSxtYzUyEWPmYnXlaRxV3Uty9MjfUhk5RqeY7UBxkkl/h3BDyreK8emOSP9B3SW7OOnC8u69gpL0hrSDlZo1ClrQmFSiGGZLb3BmhYKtssFAhZWEzs9+0GVKAnkuUrDX4AwfjAryaSUv+cMcnqvG+Sj5v3h+nEX/45uMbDIrEggWsV6fO5ApgYSQ+4QF/XT6V25ypoijsDeRlLWmNxYBmdrr+q9yxYPzaQ+4QOUCmryuTLYDm27X7p6etTo6zLq8IH1KJixzVINqixMarYSQI/ckPuelfJTSK/aQ2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761901707; c=relaxed/relaxed;
	bh=y5oqO91F+X+WX7+C5vKkOfA3RMlNxfHv2fFSqkI6O+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JXfHuUBJ9m1k17fbipSDSeJUL42O/4ia0v/V1V/QhmyYKuKuLz56lpephwES0YwE2MaK60eciqVNnMBkD8cFCMMyGLQQgM4DOA9kSN0NXuYlDRt3pMQr+WtoHvdIN+FPjb5uBX8RV1iFdybEpxB8n7ZUNvwsaT68EKNI8wLyu7tRDplObhQEiUORvG5cvqsYpDJvWfgFlwnRzVW28cDollJdoDG1QU0fAmnb9GQ1cUNWA5SStjnTx2thtMM20LGFVR7qzfcx6wBa09PvYOE4QQcQBx35QekrEbITEguoQeOV3PpPfklz+iIjPTrY1mZ4vu6joEqHsjMYQdWxCQgvtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HeppsTAf; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HeppsTAf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyZs62hp6z2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 20:08:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901707; x=1793437707;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8N9WDGemUWQsRelXH+GyTq3qC+LNB5rRhJXjTRawBT4=;
  b=HeppsTAfvLJf2Qq1MwZiC9DYTwSadBvYbTcgH1P6J7ZYO2MK7ehIZfVJ
   uV7zGdL8EPaXLRmnehLWC21ttaCDUPBWgxBt7x1QAj1v6isOu/XLKDpLu
   jpnX50hR0CWNS2B8dGAQESrPMS+pQQQ5VzQYkS9qg7Bjf05xrHWqhRwH6
   fN98Z/ONe5LJbmQ737z2rkIt9Ji7l7ixd5WOySExx0MiW7EY8uKgv6Jzl
   FSVZECGTMKr80S28Cmuhw8FeUvMcQMzpaMUv2smm0JfKP1EvSaghaIBm9
   3qJ+mpOXx8rIjLoXbDTjEQ06wxXvTjoX7BZh+vTM3/CCzUQo3hOMBvtul
   Q==;
X-CSE-ConnectionGUID: z+bWae7zRFGYht2XSe5zjA==
X-CSE-MsgGUID: 8T7wYObUSbOHYGD/dbZWtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="86682585"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="86682585"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:08:24 -0700
X-CSE-ConnectionGUID: GjHDbGLnSWakhDM9/CBrlg==
X-CSE-MsgGUID: Gbbob1bvT8C2WhgnaRVktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186123013"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:08:16 -0700
Message-ID: <a4dac87e-ff40-4ce1-a969-c8f535b66d74@linux.intel.com>
Date: Fri, 31 Oct 2025 17:08:13 +0800
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
Subject: Re: [PATCH v4 21/28] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
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
 <20251030200951.3402865-22-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-22-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Add a macro to handle kicking vCPUs out of the guest and retrying
> SEAMCALLs on -EBUSY instead of providing small helpers to be used by each
> SEAMCALL.  Wrapping the SEAMCALLs in a macro makes it a little harder to
> tease out which SEAMCALL is being made, but significantly reduces the
> amount of copy+paste code and makes it all but impossible to leave an
> elevated wait_for_sept_zap.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>



