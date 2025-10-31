Return-Path: <linuxppc-dev+bounces-13642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB6C24136
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 10:17:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyb3y2pK7z2xnh;
	Fri, 31 Oct 2025 20:17:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761902270;
	cv=none; b=ZM3YOb04NM6gU/zIdWiH18IjSuvfwhZXIVwdH2v0Ate7yuumVG6xETq3FJSpBvW+7hR/jLBjP4n+HUWegm1DP9BWS3SiA/ZrgAJO9SsQeKD5I0UteUhlj8/XaPfaWpxFVJKbQgvYHCZpNMrSzLn6kiyQiSN61gch7hqRdiXwwNOJ+TUe1xjig9gIDkN9Vm0tVD528ebisj4j7HcP/vblj1E+liGOECfXW9bsT6GdxXKedtZwt+qQ1KwPFaqffnET4HncfctAPQyi5gzoQjNrNE4dwSmwPkmA2ChgAFePIr8X3hjwo7FnetG8LBMps0o6v+tU0aE4Xorfv1k1n94T8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761902270; c=relaxed/relaxed;
	bh=6+fdM28QuB9T1HFnYCRzCUXVpG1QU1xA4LJIWTCndpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EC62BRZ7EKjGCKjcEghcVDjmC2E8UZ7Q5b2gX2GJKE/OlT5aMHvGUkC1rB6vyQp/43+dYAGtf6UEdMVBvTUWKeQFjjmk785c8pNRH0vIAz75H0vjOHelhHCgam/dffjeR7Lki7255QmJG1T5P9VP2E7Cdi2EXyei9WWuv7Oe7rKHeykBKok2LcIt3nNBIgiqmudbPk2zIsPkixwZJohlqaP3iLzXFNXr06nb7B06keIL/+gF/gHcE3FTZW1sAs0Hs9Hqn5L4iYoTUiqJ6X9LuuEo4HNyrjh5nrk1rXbTn9fS89nARx9KmjtUMOvUWM6N861w14Deg0jLsu1DMddk+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HhqdTv+x; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HhqdTv+x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyb3x2TSHz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 20:17:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761902270; x=1793438270;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6+fdM28QuB9T1HFnYCRzCUXVpG1QU1xA4LJIWTCndpE=;
  b=HhqdTv+x/D5FOLuJfF9YoHKBe+A5lPCXqFT+y+cJhQGcIiar8Ks1Dct6
   VbfjIIf7Wvg731etE3qLrIjsZa1XjsPuNlV/BXqYbCto5u92zoXVWrTEN
   ngFfbbzXXCL9HvhUyObSihWNSDIx66OZu8O+ExWbtau6AbeoxtYmBgE9o
   SKnsa0msh4SfLNTnjbEzBArPX4PCXWnu1HmkD1yKp80QGZxzI3qEeDgGF
   pNAfQnHDOkvF8tURxW0R20V1xKWi7dG6jEjA5AKn1yAq/csjNxF00olai
   gE0qsaE/ev5EVECAxwTwKCOCiOiDjuKhVzjUW+NrTQyMwujVzX/Mlfv9F
   A==;
X-CSE-ConnectionGUID: I80qVBcVThmSZrxni9VuPQ==
X-CSE-MsgGUID: U71VxtlCQoWBbFNzTYS7SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75177087"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="75177087"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:17:41 -0700
X-CSE-ConnectionGUID: xN3TnblrQqeOxewqaIMiwg==
X-CSE-MsgGUID: 7VuncW0PQxeTB4CUZL105Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186126269"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:17:33 -0700
Message-ID: <94e3e701-b60d-419b-b3c1-2b41796ab5c3@linux.intel.com>
Date: Fri, 31 Oct 2025 17:17:29 +0800
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
Subject: Re: [PATCH v4 24/28] KVM: TDX: Use guard() to acquire kvm->lock in
 tdx_vm_ioctl()
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
 <20251030200951.3402865-25-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-25-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
> importantly to minimize the diff of a future change, which will use
> guard-like semantics to acquire and release multiple locks.
>
> No functional change intended.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


