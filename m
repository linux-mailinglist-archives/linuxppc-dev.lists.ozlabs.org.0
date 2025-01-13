Return-Path: <linuxppc-dev+bounces-5135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE2DA0B209
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 10:01:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWmTM5TXXz3cV5;
	Mon, 13 Jan 2025 20:01:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736758887;
	cv=none; b=mrHWg0PzJwNg4nw0wmhsC68OtVmlh4nUrNlier7O2eIaSmXP8Q3uoBBaRiphv48ULrE/k8tDHH5Ub6qblQMV3Fm0bWOWIN5MaCfmdA+1AS+wRpEIjTfZZdgBgrVc7t27HlfyQFNCFSACp2feqxEX5k4I2McjGKOZYIw54AJPgZta+Tqk2QLruqDUURQ0BkYaJjhzDoSjtr8N9H2yCLCyS8KlwfdnC7tCSxU92Z3kfSHW9fhZgYbTLiMZO0Ava2vV4XUuiNiGTXTwWxIFbdHnhbRXVm9s6b0OAUD8WVnYz5/oUZpnxPVQtoOjt4OtTxMcanKsa9i3ySyEPBqOM/YJWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736758887; c=relaxed/relaxed;
	bh=cszX7CaqF/yGZOef+lx+ZccZirVa0cMcifv32LPpuhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJE/tspKUe4qP+O34ZeRZXkM5v52awMyqXIMXRG5lhpW54sXbqTgnTxXITMc4XQgmT7isafQOQdJgp/FoHn+kPSdUeV4PJ/WKFg39V5FbcN9tqp9IxPsb4qjjS2zXWy50zw2zhcX5ppf6yai+yI4YwMeVP0yQTrwGoV2oQHupU6Pjx5osS9KfQi/rNhbjpFLFWTpolH5izYdp3nY1HtTEdXIw2O9jnp2TFdB6OgkFhuNQg/hb7X9zTeGb5DQyoIdA7tBQDDZ4YnYTwvPPRRjDlVGNrN+dH08xXGIFKAfErdV6CTi7WbieSkcSLsRgXV1xFIdsxd2OAGeuZEGn1cpeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n4Q9Rp5L; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n4Q9Rp5L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWmTJ0Zlsz3cSK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 20:01:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736758884; x=1768294884;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GjpsjNBlCIvWjfSOKHK63am7WrBnSESbIOn/HxwUlNw=;
  b=n4Q9Rp5Lot8JGcPMZf0CUVUYbjx9QfOgE5b8J89GP1yLnxx2/l+3yBSU
   FwCp1n0rD3UdA2REZKd420WJC/PONS9iLwRxpbO5lAgt9kKjeH7wYUg1d
   ez+wu09oklmOA0deoEUsTyz+HtHNlh4ZkM3LhT2FRndPaBA883FfSPcyI
   HXLWQnBDS2MYtFXZYhgaqGJYujOZjhkDbyFtDsTJO0fxObLSK8CQNBuUg
   /rESp+yLTiwLGaUteowes9QCViCqOwvpqAAir1STsvYmBRCtEx8yb3YtO
   1wMzTA+6RUhdBWoHTKY75TVq9mV7Py9Ut5F6wJrcmxqmO4+jgd3Ch9D4y
   A==;
X-CSE-ConnectionGUID: vsbnByFiT5SnqBzdugC4Jw==
X-CSE-MsgGUID: hXsl3S17Qsa3Sx7y4re5AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="40684256"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40684256"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 01:01:17 -0800
X-CSE-ConnectionGUID: MAr8JHcoQGOpnWk/c3wvbw==
X-CSE-MsgGUID: dQcu4Sj3RBa4cQc9Tnhosg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104923153"
Received: from unknown (HELO [10.238.1.62]) ([10.238.1.62])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 01:01:15 -0800
Message-ID: <f333d871-f579-4579-86a6-58030b9f024b@linux.intel.com>
Date: Mon, 13 Jan 2025 17:01:12 +0800
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] KVM: Add a common kvm_run flag to communicate an exit
 needs completion
To: Chao Gao <chao.gao@intel.com>, Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman
 <mpe@ellerman.id.au>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250111012450.1262638-1-seanjc@google.com>
 <20250111012450.1262638-4-seanjc@google.com> <Z4R12HOD1o8ETYzm@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <Z4R12HOD1o8ETYzm@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org




On 1/13/2025 10:09 AM, Chao Gao wrote:
> On Fri, Jan 10, 2025 at 05:24:48PM -0800, Sean Christopherson wrote:
>> Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
>> that KVM_RUN needs to be re-executed prior to save/restore in order to
>> complete the instruction/operation that triggered the userspace exit.
>>
>> KVM's current approach of adding notes in the Documentation is beyond
>> brittle, e.g. there is at least one known case where a KVM developer added
>> a new userspace exit type, and then that same developer forgot to handle
>> completion when adding userspace support.
> This answers one question I had:
> https://lore.kernel.org/kvm/Z1bmUCEdoZ87wIMn@intel.com/
In current QEMU code, it always returns back to KVM via KVM_RUN after it
successfully handled a KVM exit reason, no matter what the exit reason is.
The complete_userspace_io() callback will be called if it has been setup.
So if a new kvm exit reason is added in QEMU, it seems QEMU doesn't need
special handing to make the complete_userspace_io() callback be called.

However, QEMU is not the only userspace VMM that supports KVM, it makes
sense to make the solution generic and clear for different userspace VMMs.

Regarding the support of MapGPA for TDX when live migration is considered,
since a big range will be split into 2MB chunks, in order the status is
right after TD live migration, it needs to set the return code to retry
with the next_gpa in the complete_userspace_io() callback if vcpu->wants_to_run
is false or vcpu->run->immediate_exit__unsafe is set, otherwise, TDX guest
will see return code as successful and think the whole range has been converted
successfully.

@@ -1093,7 +1093,8 @@ static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
          * immediately after STI or MOV/POP SS.
          */
         if (pi_has_pending_interrupt(vcpu) ||
-           kvm_test_request(KVM_REQ_NMI, vcpu) || vcpu->arch.nmi_pending) {
+           kvm_test_request(KVM_REQ_NMI, vcpu) || vcpu->arch.nmi_pending ||
+           !vcpu->wants_to_run) {
                 tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
                 tdx->vp_enter_args.r11 = tdx->map_gpa_next;
                 return 1;

Of course, it can be addressed later when TD live migration is supported.


>
> So, it is the VMM's (i.e., QEMU's) responsibility to re-execute KVM_RUN in this
> case.
>
> Btw, can this flag be used to address the issue [*] with steal time accounting?
> We can set the new flag for each vCPU in the PM notifier and we need to change
> the re-execution to handle steal time accounting (not just IO completion).
>
> [*]: https://lore.kernel.org/kvm/Z36XJl1OAahVkxhl@google.com/
>
> one nit below,
>
>> --- a/arch/x86/include/uapi/asm/kvm.h
>> +++ b/arch/x86/include/uapi/asm/kvm.h
>> @@ -104,9 +104,10 @@ struct kvm_ioapic_state {
>> #define KVM_IRQCHIP_IOAPIC       2
>> #define KVM_NR_IRQCHIPS          3
>>
>> -#define KVM_RUN_X86_SMM		 (1 << 0)
>> -#define KVM_RUN_X86_BUS_LOCK     (1 << 1)
>> -#define KVM_RUN_X86_GUEST_MODE   (1 << 2)
>> +#define KVM_RUN_X86_SMM			(1 << 0)
>> +#define KVM_RUN_X86_BUS_LOCK		(1 << 1)
>> +#define KVM_RUN_X86_GUEST_MODE		(1 << 2)
>> +#define KVM_RUN_X86_NEEDS_COMPLETION	(1 << 2)
> This X86_NEEDS_COMPLETION should be dropped. It is never used.
>


