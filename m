Return-Path: <linuxppc-dev+bounces-13635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8499BC23F6A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 09:59:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyZfV1x1hz2yrX;
	Fri, 31 Oct 2025 19:59:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761901154;
	cv=none; b=mMfXsZdCnOEw5CaXFyvw4Ma4XYl7BvLXZLOoV0z+AvjAICeOPPFJlMqQ0ioZZvq6lovMf8DsVJ7h7MXdTBjcvz7osEId7d16IXUHcfvpVvbv5fMKOBSJE7P46D4WgL1Hv2b8lxsLjPJqTnzTEoh4dE+EtK2m3nckhDzOgcnDTwZB6QIpAJMngrO+3pxIO8coMkdGfdE+Mzf0nolCjwuExSoQ0t/ro1Zbqz6bXZM/q5Q45sxDTmsRHqLaxGIYvLR3vHGlxiv7Y183scuk41kwxmbQumokRttEi+FuLZ5ThUKL/m7cSBc8WOfYVn60bT8xY5neFKaHpsk5wFnOjYOO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761901154; c=relaxed/relaxed;
	bh=90pXO+32SIlTjvB6c+hyOsSoYLkR66cne4JNrBueTOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jK23Q+i9Wekr6QeS0hLqaGggy1fDAlaplzBcwuiHyChGFyhzEFm1Xkxvejvyf7GbdiUxA8IkqP5DILLkNCTnd1k3TZVQHNksUKREETDLdbCIWOG13weMtoBFsGjIrROF8BUMjdqWE7Jwszk5pRYA00ZLRULEnrTF8NRaBh9NppA7V7fu7JgQPcYEAFJFy+4hXXGEHJKXQ1Qz+iC4l9Vkvv65tvJVE84WjanYmjrFXT/PynfC+nihCnAtGpmmFc5XMgiUqcdUF+aE7nY7GLU8hJb6wTEIaQUm7JeLEilAxTQRZ9LKsTwmGfnFBGNDITkw1T3suD199Uva/s90+vLWIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U8ChYXuD; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U8ChYXuD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyZfT0b0Fz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 19:59:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901153; x=1793437153;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=14teRbdSNDZoo6LY1BdIEFiTD+Kt/E9bpeaMX41fhsM=;
  b=U8ChYXuDxpEJJMg4Yvvf/PW9X0vsqYMCsKvohCAtBX0/k0atoAjqG6iE
   Nj0XyC8Ots1UgQ5FknUa6tJj2mC2RxNL6YuWn9FzSgv7da8buwjmpYyPp
   7xc+4FLbXBaoODYJYn8QHC/HHBDHiHHFVGQSIsBcWX5u60rLbj3oQeJTG
   gWtSPvaoKksOKDXWvkJkRFJTkdwcUqq6XjTQ5H3Ct1ydyHntoUxTGA/kM
   r7L6yZdB1YnmGVUDrzgTGZDHfAQjZwlrcv56L8UbY31/JffTf6IlosNMF
   AVm330qvQHSre52cJ9zUO9Psfoo6X4uuVzWQuAWFcnZ4Fsq2jfumOFYBi
   g==;
X-CSE-ConnectionGUID: 1PYMDo6NQgixWzC0LXXqUQ==
X-CSE-MsgGUID: JKcsd7soTQG3EgRnvHT2gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64097328"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="64097328"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:59:10 -0700
X-CSE-ConnectionGUID: Qkn6DZO5Rceyyp8KD2OnrQ==
X-CSE-MsgGUID: hAjIabqjQHemJifWFRIz7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186119255"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:59:02 -0700
Message-ID: <5eaab97d-30c3-46a5-8be2-2ea1ef28e71e@linux.intel.com>
Date: Fri, 31 Oct 2025 16:58:59 +0800
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
Subject: Re: [PATCH v4 18/28] KVM: TDX: Combine KVM_BUG_ON + pr_tdx_error()
 into TDX_BUG_ON()
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
 <20251030200951.3402865-19-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-19-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Add TDX_BUG_ON() macros (with varying numbers of arguments) to deduplicate
> the myriad flows that do KVM_BUG_ON()/WARN_ON_ONCE() followed by a call to
> pr_tdx_error().  In addition to reducing boilerplate copy+paste code, this
> also helps ensure that KVM provides consistent handling of SEAMCALL errors.
>
> Opportunistically convert a handful of bare WARN_ON_ONCE() paths to the
> equivalent of KVM_BUG_ON(), i.e. have them terminate the VM.  If a SEAMCALL
> error is fatal enough to WARN on, it's fatal enough to terminate the TD.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

