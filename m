Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 474937A9191
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 07:52:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CLz6/Zmx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrl1H0JXNz3cN2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 15:52:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CLz6/Zmx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrl0L34ysz2ynB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 15:52:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275522; x=1726811522;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oZ26NaKC2zv5YONE8y6jW8KHDfibqQbE4Lcj557476A=;
  b=CLz6/Zmx1HuzJzz0rbxY5fzIOxEtJbyK5nsT24g7mXkO3h1SFjPCUDk9
   1EQcy267TEM/jjhymrrtD5t8GQDoWD1X09jD6JDBtk8qaxv4ESlRpmQci
   wH3pleyEdzAUmES5//OLfT8gKylRIqyyHwQM3pmDvS12YYN6HmV6tV+Le
   1eAQzUxZEsa4bzs84zPcTYq1TwGDFEecH8QKWnd8+kRJ9DO9wd85M6yb9
   imOhkf1CpHqGuliOAHZFdMZcdUpJeLszcO4xGGykd36lZaDZLhfmUgNpx
   m/ODZzUu6P5lTMNpFGOVNowL+e/XkZtrAezqO6y9CP92Xk9htit7jx2rW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466734483"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="466734483"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="837187245"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="837187245"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.93.17.222]) ([10.93.17.222])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:51:36 -0700
Message-ID: <ef36db9d-bb9c-e042-2617-830cf44602de@linux.intel.com>
Date: Thu, 21 Sep 2023 13:51:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v12 18/33] KVM: x86/mmu: Handle page fault for private
 memory
To: Sean Christopherson <seanjc@google.com>, Yan Zhao <yan.y.zhao@intel.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-19-seanjc@google.com>
 <ZQPuMK6D/7UzDH+D@yzhao56-desk.sh.intel.com> <ZQRpiOd1DNDDJQ3r@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <ZQRpiOd1DNDDJQ3r@google.com>
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



On 9/15/2023 10:26 PM, Sean Christopherson wrote:
> On Fri, Sep 15, 2023, Yan Zhao wrote:
>> On Wed, Sep 13, 2023 at 06:55:16PM -0700, Sean Christopherson wrote:
>> ....
>>> +static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
>>> +					      struct kvm_page_fault *fault)
>>> +{
>>> +	kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
>>> +				      PAGE_SIZE, fault->write, fault->exec,
>>> +				      fault->is_private);
>>> +}
>>> +
>>> +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
>>> +				   struct kvm_page_fault *fault)
>>> +{
>>> +	int max_order, r;
>>> +
>>> +	if (!kvm_slot_can_be_private(fault->slot)) {
>>> +		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
>>> +		return -EFAULT;
>>> +	}
>>> +
>>> +	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
>>> +			     &max_order);
>>> +	if (r) {
>>> +		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
>>> +		return r;
>>> +	}
>>> +
>>> +	fault->max_level = min(kvm_max_level_for_order(max_order),
>>> +			       fault->max_level);
>>> +	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
>>> +
>>> +	return RET_PF_CONTINUE;
>>> +}
>>> +
>>>   static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>>>   {
>>>   	struct kvm_memory_slot *slot = fault->slot;
>>> @@ -4293,6 +4356,14 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>>>   			return RET_PF_EMULATE;
>>>   	}
>>>   
>>> +	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
>> In patch 21,
>> fault->is_private is set as:
>> 	".is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT)",
>> then, the inequality here means memory attribute has been updated after
>> last check.
>> So, why an exit to user space for converting is required instead of a mere retry?
>>
>> Or, is it because how .is_private is assigned in patch 21 is subjected to change
>> in future?
> This.  Retrying on SNP or TDX would hang the guest.  I suppose we could special
> case VMs where .is_private is derived from the memory attributes, but the
> SW_PROTECTED_VM type is primary a development vehicle at this point.  I'd like to
> have it mimic SNP/TDX as much as possible; performance is a secondary concern.
So when .is_private is derived from the memory attributes, and if I 
didn't miss
anything, there is no explicit conversion mechanism introduced yet so 
far, does
it mean for pure sw-protected VM (withouth SNP/TDX), the page fault will be
handled according to the memory attributes setup by host/user vmm, no 
implicit
conversion will be triggered, right?


>
> E.g. userspace needs to be prepared for "spurious" exits due to races on SNP and
> TDX, which this can theoretically exercise.  Though the window is quite small so
> I doubt that'll actually happen in practice; which of course also makes it less
> important to retry instead of exiting.

