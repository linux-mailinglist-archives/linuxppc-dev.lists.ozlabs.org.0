Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A21875CAEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 17:08:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fu8DkLeC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6tGl5P1Cz3cWR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 01:08:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fu8DkLeC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=xiaoyao.li@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Sat, 22 Jul 2023 01:07:25 AEST
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6tFn2f3Gz3bwF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 01:07:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689952045; x=1721488045;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m75I2ERfRQTCcOTwNioBlzNNFor8J6AUk5uhhkX1LBE=;
  b=fu8DkLeCxQBTxVSTbIBBf5bCSZ5YK73RjKzCa5EPWrF0aR9K/TWJwvZV
   tEEn9FhpzGig8SBGlA88Ac7TJFgX1gBqWyHevbp03oF1FuMVkeh6ew5/i
   XoQjtRBAQnuc8FGiAYebxuBqH3UmwNGqmckvlp74hIjwJB5V6i6XEOA94
   HE381JfwMgYKzr8u7/J3dzQ/Z1iOHrjcD12OtajqzZwsVoo5K99i5CWAF
   WgnAqkB5kxW+24CJiJ0icphlS2gwvXVAi4BO71bKGRztHNrXSYMrCEIPD
   fDe2/2Y0G7KOfigMz/w+e7FZsfu1iIVLprWJ/4zg4qT3TQMxLwbCk/D5N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430835120"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="430835120"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="790229682"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="790229682"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.6.77]) ([10.93.6.77])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:05:57 -0700
Message-ID: <fdc155f5-041b-a1b1-15aa-8f970180a13a@intel.com>
Date: Fri, 21 Jul 2023 23:05:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/19/2023 7:44 AM, Sean Christopherson wrote:
> @@ -6255,12 +6298,17 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
>   	if (r)
>   		goto err_async_pf;
>   
> +	r = kvm_gmem_init();
> +	if (r)
> +		goto err_gmem;
> +
>   	kvm_chardev_ops.owner = module;
>   
>   	kvm_preempt_ops.sched_in = kvm_sched_in;
>   	kvm_preempt_ops.sched_out = kvm_sched_out;
>   
>   	kvm_init_debug();
> +	kvm_gmem_init();

why kvm_gmem_init() needs to be called again? by mistake?
