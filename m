Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ACF1B95B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 06:15:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499Wdk5jbdzDqVv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 14:15:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.44;
 helo=out30-44.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499Wbd1f4nzDqV5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 14:13:16 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0TwjKU-I_1587960786; 
Received: from 30.27.118.60(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0TwjKU-I_1587960786) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 27 Apr 2020 12:13:08 +0800
Subject: Re: [PATCH v3 7/7] KVM: MIPS: clean up redundant kvm_run parameters
 in assembly
To: Huacai Chen <chenhuacai@gmail.com>
References: <20200426123905.8336-1-tianjia.zhang@linux.alibaba.com>
 <20200426123905.8336-8-tianjia.zhang@linux.alibaba.com>
 <CAAhV-H7tSPFSU143ZfmgitEY1BY7MrBzwvJHve49i+ABQ9quCg@mail.gmail.com>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <e0826025-6925-fd94-1192-529c9aca1181@linux.alibaba.com>
Date: Mon, 27 Apr 2020 12:13:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7tSPFSU143ZfmgitEY1BY7MrBzwvJHve49i+ABQ9quCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, david@redhat.com,
 heiko.carstens@de.ibm.com, Peter Xu <peterx@redhat.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, hpa@zytor.com,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, Marc Zyngier <maz@kernel.org>, joro@8bytes.org,
 x86@kernel.org, borntraeger@de.ibm.com, mingo@redhat.com,
 julien.thierry.kdev@gmail.com, thuth@redhat.com, gor@linux.ibm.com,
 suzuki.poulose@arm.com, kvm-ppc@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, jmattson@google.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, cohuck@redhat.com,
 christoffer.dall@arm.com, sean.j.christopherson@intel.com,
 LKML <linux-kernel@vger.kernel.org>, james.morse@arm.com,
 Paolo Bonzini <pbonzini@redhat.com>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2020/4/27 11:51, Huacai Chen wrote:
> Hi, Tianjia,
> 
> On Sun, Apr 26, 2020 at 8:40 PM Tianjia Zhang
> <tianjia.zhang@linux.alibaba.com> wrote:
>>
>> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
>> structure. Earlier than historical reasons, many kvm-related function
>> parameters retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time.
>> This patch does a unified cleanup of these remaining redundant parameters.
>>
>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>> ---
>>   arch/mips/include/asm/kvm_host.h |  4 ++--
>>   arch/mips/kvm/entry.c            | 15 +++++----------
>>   arch/mips/kvm/mips.c             |  3 ++-
>>   arch/mips/kvm/trap_emul.c        |  2 +-
>>   arch/mips/kvm/vz.c               |  2 +-
>>   5 files changed, 11 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
>> index 971439297cea..db915c55166d 100644
>> --- a/arch/mips/include/asm/kvm_host.h
>> +++ b/arch/mips/include/asm/kvm_host.h
>> @@ -310,7 +310,7 @@ struct kvm_mmu_memory_cache {
>>   #define KVM_MIPS_GUEST_TLB_SIZE        64
>>   struct kvm_vcpu_arch {
>>          void *guest_ebase;
>> -       int (*vcpu_run)(struct kvm_run *run, struct kvm_vcpu *vcpu);
>> +       int (*vcpu_run)(struct kvm_vcpu *vcpu);
>>
>>          /* Host registers preserved across guest mode execution */
>>          unsigned long host_stack;
>> @@ -821,7 +821,7 @@ int kvm_mips_emulation_init(struct kvm_mips_callbacks **install_callbacks);
>>   /* Debug: dump vcpu state */
>>   int kvm_arch_vcpu_dump_regs(struct kvm_vcpu *vcpu);
>>
>> -extern int kvm_mips_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu);
>> +extern int kvm_mips_handle_exit(struct kvm_vcpu *vcpu);
>>
>>   /* Building of entry/exception code */
>>   int kvm_mips_entry_setup(void);
>> diff --git a/arch/mips/kvm/entry.c b/arch/mips/kvm/entry.c
>> index 16e1c93b484f..e3f29af3b6cd 100644
>> --- a/arch/mips/kvm/entry.c
>> +++ b/arch/mips/kvm/entry.c
>> @@ -204,7 +204,7 @@ static inline void build_set_exc_base(u32 **p, unsigned int reg)
>>    * Assemble the start of the vcpu_run function to run a guest VCPU. The function
>>    * conforms to the following prototype:
>>    *
>> - * int vcpu_run(struct kvm_run *run, struct kvm_vcpu *vcpu);
>> + * int vcpu_run(struct kvm_vcpu *vcpu);
>>    *
>>    * The exit from the guest and return to the caller is handled by the code
>>    * generated by kvm_mips_build_ret_to_host().
>> @@ -217,8 +217,7 @@ void *kvm_mips_build_vcpu_run(void *addr)
>>          unsigned int i;
>>
>>          /*
>> -        * A0: run
>> -        * A1: vcpu
>> +        * A0: vcpu
>>           */
>>
>>          /* k0/k1 not being used in host kernel context */
>> @@ -237,10 +236,10 @@ void *kvm_mips_build_vcpu_run(void *addr)
>>          kvm_mips_build_save_scratch(&p, V1, K1);
>>
>>          /* VCPU scratch register has pointer to vcpu */
>> -       UASM_i_MTC0(&p, A1, scratch_vcpu[0], scratch_vcpu[1]);
>> +       UASM_i_MTC0(&p, A0, scratch_vcpu[0], scratch_vcpu[1]);
>>
>>          /* Offset into vcpu->arch */
>> -       UASM_i_ADDIU(&p, K1, A1, offsetof(struct kvm_vcpu, arch));
>> +       UASM_i_ADDIU(&p, K1, A0, offsetof(struct kvm_vcpu, arch));
>>
>>          /*
>>           * Save the host stack to VCPU, used for exception processing
>> @@ -628,10 +627,7 @@ void *kvm_mips_build_exit(void *addr)
>>          /* Now that context has been saved, we can use other registers */
>>
>>          /* Restore vcpu */
>> -       UASM_i_MFC0(&p, S1, scratch_vcpu[0], scratch_vcpu[1]);
>> -
>> -       /* Restore run (vcpu->run) */
>> -       UASM_i_LW(&p, S0, offsetof(struct kvm_vcpu, run), S1);
>> +       UASM_i_MFC0(&p, S0, scratch_vcpu[0], scratch_vcpu[1]);
>>
>>          /*
>>           * Save Host level EPC, BadVaddr and Cause to VCPU, useful to process
>> @@ -793,7 +789,6 @@ void *kvm_mips_build_exit(void *addr)
>>           * with this in the kernel
>>           */
>>          uasm_i_move(&p, A0, S0);
>> -       uasm_i_move(&p, A1, S1);
>>          UASM_i_LA(&p, T9, (unsigned long)kvm_mips_handle_exit);
>>          uasm_i_jalr(&p, RA, T9);
>>           UASM_i_ADDIU(&p, SP, SP, -CALLFRAME_SIZ);
> I think uasm_i_move(&p, K1, S1) in kvm_mips_build_ret_from_exit() and
> UASM_i_MTC0(&p, S1, scratch_vcpu[0], scratch_vcpu[1]) in
> kvm_mips_build_ret_to_guest() should also be changed.
> 

Your statement is correct, this is my omission, I will fix it in the 
next version of the patch, thanks for your review.

Thanks and best,
Tianjia

>> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
>> index 9710477a9827..32850470c037 100644
>> --- a/arch/mips/kvm/mips.c
>> +++ b/arch/mips/kvm/mips.c
>> @@ -1186,8 +1186,9 @@ static void kvm_mips_set_c0_status(void)
>>   /*
>>    * Return value is in the form (errcode<<2 | RESUME_FLAG_HOST | RESUME_FLAG_NV)
>>    */
>> -int kvm_mips_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
>> +int kvm_mips_handle_exit(struct kvm_vcpu *vcpu)
>>   {
>> +       struct kvm_run *run = vcpu->run;
>>          u32 cause = vcpu->arch.host_cp0_cause;
>>          u32 exccode = (cause >> CAUSEB_EXCCODE) & 0x1f;
>>          u32 __user *opc = (u32 __user *) vcpu->arch.pc;
>> diff --git a/arch/mips/kvm/trap_emul.c b/arch/mips/kvm/trap_emul.c
>> index d822f3aee3dc..04c864cc356a 100644
>> --- a/arch/mips/kvm/trap_emul.c
>> +++ b/arch/mips/kvm/trap_emul.c
>> @@ -1238,7 +1238,7 @@ static int kvm_trap_emul_vcpu_run(struct kvm_vcpu *vcpu)
>>           */
>>          kvm_mips_suspend_mm(cpu);
>>
>> -       r = vcpu->arch.vcpu_run(vcpu->run, vcpu);
>> +       r = vcpu->arch.vcpu_run(vcpu);
>>
>>          /* We may have migrated while handling guest exits */
>>          cpu = smp_processor_id();
>> diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
>> index 94f1d23828e3..c5878fa0636d 100644
>> --- a/arch/mips/kvm/vz.c
>> +++ b/arch/mips/kvm/vz.c
>> @@ -3152,7 +3152,7 @@ static int kvm_vz_vcpu_run(struct kvm_vcpu *vcpu)
>>          kvm_vz_vcpu_load_tlb(vcpu, cpu);
>>          kvm_vz_vcpu_load_wired(vcpu);
>>
>> -       r = vcpu->arch.vcpu_run(vcpu->run, vcpu);
>> +       r = vcpu->arch.vcpu_run(vcpu);
>>
>>          kvm_vz_vcpu_save_wired(vcpu);
>>
>> --
>> 2.17.1
>>
> 
> Regards,
> Huacai
> 
