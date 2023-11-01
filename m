Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46A7DDD29
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 08:26:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R2ehDQm6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKz8V54CJz3cNY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 18:26:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R2ehDQm6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=xiaoyao.li@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKz7Z30Psz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 18:25:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698823546; x=1730359546;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qWRVoltW9FVs6NYX3CWyFfOjxesJ7ml8CJp5xBKO3/4=;
  b=R2ehDQm6FkRLwsMPVgLCZdXfNTJobMStjH9rD6Q139vuEgz6+HkLOKTL
   nLe1XmO8UFKp3CsM0ahEfuxQvCsihbA9146yeUtZj+C2EvNG9QQ1KJY5L
   ysWrY4uqyjX43HD7N9N/RFY6KfGchrgnVcQCrczY9/XIpYlniP+f9tini
   ph+2KbG36r2PKEOAF1/GkPUiM/K3HJVTSJ/OUgVxR7JyuGZMNEq9i5EE9
   ASUXO2ffDP1sSQ1zUoz6zsYAk1ENQfMWLK72IL81v3cEXU8bjFi+pEYM8
   IuLleJ9pszaYMIgFAVp4dgL8NldRn7CKGaruqaIWq5j8nhifeB+7WOiOm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="392307411"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="392307411"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 00:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="8964294"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.9.145]) ([10.93.9.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 00:25:26 -0700
Message-ID: <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
Date: Wed, 1 Nov 2023 15:25:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
 <ZUEML6oJXDCFJ9fg@google.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <ZUEML6oJXDCFJ9fg@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick
 @oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/31/2023 10:16 PM, Sean Christopherson wrote:
> On Tue, Oct 31, 2023, Xiaoyao Li wrote:
>> On 10/28/2023 2:21 AM, Sean Christopherson wrote:
>>> Extended guest_memfd to allow backing guest memory with transparent
>>> hugepages. Require userspace to opt-in via a flag even though there's no
>>> known/anticipated use case for forcing small pages as THP is optional,
>>> i.e. to avoid ending up in a situation where userspace is unaware that
>>> KVM can't provide hugepages.
>>
>> Personally, it seems not so "transparent" if requiring userspace to opt-in.
>>
>> People need to 1) check if the kernel built with TRANSPARENT_HUGEPAGE
>> support, or check is the sysfs of transparent hugepage exists; 2)get the
>> maximum support hugepage size 3) ensure the size satisfies the alignment;
>> before opt-in it.
>>
>> Even simpler, userspace can blindly try to create guest memfd with
>> transparent hugapage flag. If getting error, fallback to create without the
>> transparent hugepage flag.
>>
>> However, it doesn't look transparent to me.
> 
> The "transparent" part is referring to the underlying kernel mechanism, it's not
> saying anything about the API.  The "transparent" part of THP is that the kernel
> doesn't guarantee hugepages, i.e. whether or not hugepages are actually used is
> (mostly) transparent to userspace.
> 
> Paolo also isn't the biggest fan[*], but there are also downsides to always
> allowing hugepages, e.g. silent failure due to lack of THP or unaligned size,
> and there's precedent in the form of MADV_HUGEPAGE.
> 
> [*] https://lore.kernel.org/all/84a908ae-04c7-51c7-c9a8-119e1933a189@redhat.com

But it's different than MADV_HUGEPAGE, in a way. Per my understanding, 
the failure of MADV_HUGEPAGE is not fatal, user space can ignore it and 
continue.

However, the failure of KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is fatal, which 
leads to failure of guest memfd creation.

For current implementation, I think maybe 
KVM_GUEST_MEMFD_DESIRE_HUGEPAGE fits better than 
KVM_GUEST_MEMFD_ALLOW_HUGEPAGE? or maybe *PREFER*?
