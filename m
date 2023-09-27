Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D66D7AF9F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 07:20:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iuTM4Um/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwQ1M2qmsz3cb9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 15:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iuTM4Um/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwQ0Q4329z2ynB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 15:19:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695791990; x=1727327990;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XWRHK3XHMCPUS7DjwBYEn6sN3WEf4Pd1a63R09LlTdM=;
  b=iuTM4Um/rL8Pmj4tKsfYatwC5iEe8FqZX2E28oGPWD9vwFLODiwg0miy
   fXzMwZHaDxZ7MljJS6rIzH6Uf1Bb9UMyzBr+4IQ0HzP+xce+z06HdCDOo
   drMqDybyjJDR/q3UY/wafoxZfrycbAbHakbtX9qpANP5NLm+xbPXz0dVE
   ooxnRNgwkw5TdzCk3xP8pUCrOJsP+Anwxbr7CGeFYzfCeznyjzqwiyzq9
   ccdv3XkNY8sarcKZODXjv6z0NTp7aOwTuZgwiJwEW6TrpJbsuZWCoRUZi
   o+N56gb/60w1RMomGNDfKjOteDIF/1MgrZk/RqJyaiy0U5wVdOmvL1Fkt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381633586"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="381633586"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 22:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725676254"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="725676254"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.238.8.84]) ([10.238.8.84])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 22:19:32 -0700
Message-ID: <483f9e1e-7d01-5f06-3bfa-3788d2554724@linux.intel.com>
Date: Wed, 27 Sep 2023 13:19:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
To: Sean Christopherson <seanjc@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-12-seanjc@google.com>
 <d66795f8-e524-2912-4b71-92ca4ffe8807@linux.intel.com>
 <ZQteNbPfx6P3r6B8@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <ZQteNbPfx6P3r6B8@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@orac
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/21/2023 5:03 AM, Sean Christopherson wrote:
> On Mon, Sep 18, 2023, Binbin Wu wrote:
>>
>> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
>>> From: Chao Peng <chao.p.peng@linux.intel.com>
>> [...]
>>> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
>>> +/*
>>> + * Returns true if _all_ gfns in the range [@start, @end) have attributes
>>> + * matching @attrs.
>>> + */
>>> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
>>> +				     unsigned long attrs)
>>> +{
>>> +	XA_STATE(xas, &kvm->mem_attr_array, start);
>>> +	unsigned long index;
>>> +	bool has_attrs;
>>> +	void *entry;
>>> +
>>> +	rcu_read_lock();
>>> +
>>> +	if (!attrs) {
>>> +		has_attrs = !xas_find(&xas, end);
>> IIUIC, xas_find() is inclusive for "end", so here should be "end - 1" ?
> Yes, that does appear to be the case.  Inclusive vs. exclusive on gfn ranges has
> is the bane of my existence.

Seems this one is not included in the "KVM: guest_memfd fixes" patch series?
https://lore.kernel.org/kvm/20230921203331.3746712-1-seanjc@google.com/



