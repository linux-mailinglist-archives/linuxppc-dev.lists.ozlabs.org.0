Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB3E7A3F22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 03:15:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UyE7RVws;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpn0V3bqVz3cDg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 11:15:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UyE7RVws;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpmzY59KGz2yh7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 11:14:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694999674; x=1726535674;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oa/nrZXu3pJ1XHmH6ZVv7iF/X9/VnJhZeXvizU+honc=;
  b=UyE7RVwsuuLlE7oadMwN/VLoPxRNhuVeOAhKLkIEl652wwMDRc/YdxMS
   pg2gviK4kZP8Q/RemmrArP5pjenCGpcbOzR7bUPituF63IF0MdAFFUUso
   J9pNYKcmr1OVzJ4T6zbcdGeJxzrFtJJ0r2Prjp03cfPie2fGX74H0aTYg
   Nz7QikgyPme5vQkR4e0zojdEKqdIOQehbRulXLQfr2PEzv9RUr4l6tCrK
   Jnf8ja/I8Io2lizgLhEmd4lTYyzzDWHFtHFwXkhCDKGl20paxNfmTEpKh
   02e2ckVojOl2rdw1cfAG26qbGi+fqC+VoG1MaVTL9PUC/4IiOJTKWEZbD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="383364150"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="383364150"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 18:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="835840579"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="835840579"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.238.8.84]) ([10.238.8.84])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 18:14:15 -0700
Message-ID: <9925e01b-7fa9-95e4-dc21-1d760ef9cde4@linux.intel.com>
Date: Mon, 18 Sep 2023 09:14:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v12 10/33] KVM: Set the stage for handling only shared
 mappings in mmu_notifier events
To: Sean Christopherson <seanjc@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-11-seanjc@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20230914015531.1419405-11-seanjc@google.com>
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



On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> Add flags to "struct kvm_gfn_range" to let notifier events target only
> shared and only private mappings, and write up the existing mmu_notifier
> events to be shared-only (private memory is never associated with a
> userspace virtual address, i.e. can't be reached via mmu_notifiers).
>
> Add two flags so that KVM can handle the three possibilities (shared,
> private, and shared+private) without needing something like a tri-state
> enum.

How to understand the word "stage" in short log?


>
> Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   include/linux/kvm_host.h | 2 ++
>   virt/kvm/kvm_main.c      | 7 +++++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index d8c6ce6c8211..b5373cee2b08 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -263,6 +263,8 @@ struct kvm_gfn_range {
>   	gfn_t start;
>   	gfn_t end;
>   	union kvm_mmu_notifier_arg arg;
> +	bool only_private;
> +	bool only_shared;
>   	bool may_block;
>   };
>   bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 174de2789657..a41f8658dfe0 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -635,6 +635,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
>   			 * the second or later invocation of the handler).
>   			 */
>   			gfn_range.arg = range->arg;
> +
> +			/*
> +			 * HVA-based notifications aren't relevant to private
> +			 * mappings as they don't have a userspace mapping.
> +			 */
> +			gfn_range.only_private = false;
> +			gfn_range.only_shared = true;
>   			gfn_range.may_block = range->may_block;
>   
>   			/*

