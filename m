Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8327DEAA4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 03:21:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bte/I6DS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLSKT0Mf4z3cTg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 13:21:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bte/I6DS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=xiaoyao.li@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLSJX0m84z2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Nov 2023 13:20:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698891612; x=1730427612;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qMSrBq5gKSfvneC99jG0ycqZi9wUzkwKrG5m2lwT0dM=;
  b=bte/I6DSDgFiVG2RZfA7jgi9mG9JaWTM3P/Tuge2EaYLnoLj8wkimcXy
   kWe7ZXX4m8u63Pr6r8j/4Ie8jPNmoHCUTw5OLr81L92XEGNr4sr6rvMfW
   oPHp86/AZDq5TuTd40DSZy5q5WiVBNB5neo92fP+Gww/dqMyZ7lqP1hcW
   F7ara6AJsqaKPl0O0ytxRAFuIneDpDHC+XVYXPKYzpXbir9MsgS1J5++7
   NtpyDplzQF5IpD51+5D6/VKzHxkKDphGaxmKRBg7l6oXe+YJ9Ly0ka3cI
   WZUBg8gozjOwXz+5CreQlUVJt5yAt6Hn2xGEz87BAxp6VyyhO2D/BWOfR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="373665332"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="373665332"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 19:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="851761891"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="851761891"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.9.145]) ([10.93.9.145])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 19:19:53 -0700
Message-ID: <33686031-c1df-4ef5-a6ac-1aab7f5c656e@intel.com>
Date: Thu, 2 Nov 2023 10:19:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>, Kai Huang <kai.huang@intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <ZUKMsOdg3N9wmEzy@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "willy@infradead.org" <willy@infradead.org>, Wei W Wang <wei.w.wang@intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "michael.roth@amd.com" <michael.roth@amd.com>, "ackerleytng@google.com" <ackerleytng@google.com>, "viro@zeniv.linux.o
 rg.uk" <viro@zeniv.linux.org.uk>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "mic@digikod.net" <mic@digikod.net>, "tabba@google.com" <tabba@google.com>, Isaku Yamahata <isaku.yamahata@intel.com>, "brauner@kernel.org" <brauner@kernel.org>, "qperret@google.com" <qperret@google.com>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "dmatlack@google.com" <dmatlack@google.com>, "jarkko@kernel.org" <jarkko@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "amoorthy@google.com" <amoorthy@google.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "liam.merwick@oracle.com" <liam.merwick@oracle.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.o
 zlabs.org>, Yilun Xu <yilun.xu@intel.com>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/2/2023 1:36 AM, Sean Christopherson wrote:
>> KVM_CAP_MEMORY_FAULT_INFO is x86 only, is it better to put this function to
>> <asm/kvm_host.h>?
> I'd prefer to keep it in generic code, as it's highly likely to end up there
> sooner than later.  There's a known use case for ARM (exit to userspace on missing
> userspace mapping[*]), and I'm guessing pKVM (also ARM) will also utilize this API.
> 
> [*]https://lore.kernel.org/all/20230908222905.1321305-8-amoorthy@google.com

I wonder how this CAP is supposed to be checked in userspace, for guest 
memfd case? something like this?

	if (!kvm_check_extension(s, KVM_CAP_MEMORY_FAULT_INFO) &&
	    run->exit_reason == KVM_EXIT_MEMORY_FAULT)
		abort("unexpected KVM_EXIT_MEMORY_FAULT");

In my implementation of QEMU patches, I find it's unnecessary. When 
userspace gets an exit with KVM_EXIT_MEMORY_FAULT, it implies 
"KVM_CAP_MEMORY_FAULT_INFO".

So I don't see how it is necessary in this series. Whether it's 
necessary or not for [*], I don't have the answer but we can leave the 
discussion to that patch series.
