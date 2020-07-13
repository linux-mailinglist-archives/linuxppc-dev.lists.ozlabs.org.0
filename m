Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF3621CD87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 05:09:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4pX96mlHzDqTg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 13:09:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.43;
 helo=out30-43.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4pVQ5NggzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 13:07:41 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01355;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0U2UhFSb_1594609639; 
Received: from 30.25.206.74(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U2UhFSb_1594609639) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 13 Jul 2020 11:07:21 +0800
Subject: Re: [PATCH v4 5/7] KVM: PPC: clean up redundant kvm_run parameters in
 assembly
To: Paul Mackerras <paulus@ozlabs.org>
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
 <20200427043514.16144-6-tianjia.zhang@linux.alibaba.com>
 <20200526055924.GD282305@thinks.paulus.ozlabs.org>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <c3540a4b-a568-3428-0427-ae2a1f30dbe2@linux.alibaba.com>
Date: Mon, 13 Jul 2020 11:07:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200526055924.GD282305@thinks.paulus.ozlabs.org>
Content-Type: text/plain; charset=gbk; format=flowed
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
 heiko.carstens@de.ibm.com, peterx@redhat.com, linux-mips@vger.kernel.org,
 hpa@zytor.com, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, chenhuacai@gmail.com, maz@kernel.org, joro@8bytes.org,
 x86@kernel.org, borntraeger@de.ibm.com, mingo@redhat.com,
 julien.thierry.kdev@gmail.com, thuth@redhat.com, gor@linux.ibm.com,
 suzuki.poulose@arm.com, kvm-ppc@vger.kernel.org, bp@alien8.de,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 tsbogend@alpha.franken.de, cohuck@redhat.com, christoffer.dall@arm.com,
 sean.j.christopherson@intel.com, linux-kernel@vger.kernel.org,
 james.morse@arm.com, pbonzini@redhat.com, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2020/5/26 13:59, Paul Mackerras wrote:
> On Mon, Apr 27, 2020 at 12:35:12PM +0800, Tianjia Zhang wrote:
>> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
>> structure. For historical reasons, many kvm-related function parameters
>> retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
>> patch does a unified cleanup of these remaining redundant parameters.
> 
> Some of these changes don't look completely correct to me, see below.
> If you're expecting these patches to go through my tree, I can fix up
> the patch and commit it (with you as author), noting the changes I
> made in the commit message.  Do you want me to do that?
> 

I am very glad for you to do so, although I have submitted a new version 
of patch, I still prefer you to fix up and commit it.

Thanks and best,
Tianjia

>> diff --git a/arch/powerpc/kvm/book3s_interrupts.S b/arch/powerpc/kvm/book3s_interrupts.S
>> index f7ad99d972ce..0eff749d8027 100644
>> --- a/arch/powerpc/kvm/book3s_interrupts.S
>> +++ b/arch/powerpc/kvm/book3s_interrupts.S
>> @@ -55,8 +55,7 @@
>>    ****************************************************************************/
>>   
>>   /* Registers:
>> - *  r3: kvm_run pointer
>> - *  r4: vcpu pointer
>> + *  r3: vcpu pointer
>>    */
>>   _GLOBAL(__kvmppc_vcpu_run)
>>   
>> @@ -68,8 +67,8 @@ kvm_start_entry:
>>   	/* Save host state to the stack */
>>   	PPC_STLU r1, -SWITCH_FRAME_SIZE(r1)
>>   
>> -	/* Save r3 (kvm_run) and r4 (vcpu) */
>> -	SAVE_2GPRS(3, r1)
>> +	/* Save r3 (vcpu) */
>> +	SAVE_GPR(3, r1)
>>   
>>   	/* Save non-volatile registers (r14 - r31) */
>>   	SAVE_NVGPRS(r1)
>> @@ -82,11 +81,11 @@ kvm_start_entry:
>>   	PPC_STL	r0, _LINK(r1)
>>   
>>   	/* Load non-volatile guest state from the vcpu */
>> -	VCPU_LOAD_NVGPRS(r4)
>> +	VCPU_LOAD_NVGPRS(r3)
>>   
>>   kvm_start_lightweight:
>>   	/* Copy registers into shadow vcpu so we can access them in real mode */
>> -	mr	r3, r4
>> +	mr	r4, r3
> 
> This mr doesn't seem necessary.
> 
>>   	bl	FUNC(kvmppc_copy_to_svcpu)
>>   	nop
>>   	REST_GPR(4, r1)
> 
> This should be loading r4 from GPR3(r1), not GPR4(r1) - which is what
> REST_GPR(4, r1) will do.
> 
> Then, in the file but not in the patch context, there is this line:
> 
> 	PPC_LL	r3, GPR4(r1)		/* vcpu pointer */
> 
> where once again GPR4 needs to be GPR3.
> 
>> @@ -191,10 +190,10 @@ after_sprg3_load:
>>   	PPC_STL	r31, VCPU_GPR(R31)(r7)
>>   
>>   	/* Pass the exit number as 3rd argument to kvmppc_handle_exit */
> 
> The comment should be modified to say "2nd" instead of "3rd",
> otherwise it is confusing.
> 
> The rest of the patch looks OK.
> 
> Paul.
> 
