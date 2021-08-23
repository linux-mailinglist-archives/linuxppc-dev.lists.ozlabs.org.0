Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 926A13F4C27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 16:14:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtZ4h2ySPz2yJk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 00:14:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HdCP5dSG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=de.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=borntraeger@de.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HdCP5dSG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtZ3t10cPz2xb7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 00:14:00 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NE4Ob8052048; Mon, 23 Aug 2021 10:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JP+rIuvE43NRXIUI5Kb+ogg0I/5LxIIHeZ4VT3NOJSI=;
 b=HdCP5dSGypid2RyIbAPUCk3pVDYhTdLu+iuqc1SPqEUlq9/SvNF/R0tU6SvZ55CNVBES
 rE2CCE83XX5njzTOZ2UqRVeBiZjfwprMW6Brh46ayzEXBZJY0FkCgFoxpjX3fNFXKNaO
 L5kMaEvRafRrAgjXuQ59jfxc1PZsSxUusjIqRQxMjrJ6Aq/4z26WcoeUW+BU9qVUQvUV
 ATj63FSo1ncLrS47cjKQeUGyfXXDvbf3tCux3hmnc3b4Flq2wDIY6vKG1rVGFwMNdQKH
 OoOHLDT1nwkL8Rm2aWiD+/Ag1htYp3WmD/H3VYKw9BwAcB+J5fVPbfgIlUyBXxghgKPl JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3am1eva1g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:12:50 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NE4VX8052901;
 Mon, 23 Aug 2021 10:12:49 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3am1eva1f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:12:49 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NE3PHm014202;
 Mon, 23 Aug 2021 14:12:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3ajs48ucq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:12:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NEChTt39780754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 14:12:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DE26A4BDF;
 Mon, 23 Aug 2021 14:12:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE119A4BDD;
 Mon, 23 Aug 2021 14:12:40 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.170.214])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 14:12:40 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] KVM: Refactor kvm_arch_vcpu_fault() to return a
 struct page pointer
To: David Hildenbrand <david@redhat.com>,
 Hou Wenlong <houwenlong93@linux.alibaba.com>, kvm@vger.kernel.org
References: <YRQcZqCWwVH8bCGc@google.com>
 <1c510b24fc1d7cbae8aa4b69c0799ebd32e65b82.1628739116.git.houwenlong93@linux.alibaba.com>
 <98adbd3c-ec6f-5689-1686-2a8a7909951a@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <c228bf78-28fb-8666-e394-5ebfa1de0862@de.ibm.com>
Date: Mon, 23 Aug 2021 16:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <98adbd3c-ec6f-5689-1686-2a8a7909951a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5V65b4zTLVrYqqCGUcddJc1BLzc-OYWe
X-Proofpoint-ORIG-GUID: mhbanuFWoNfFP43Rw2Ff2PaJeTjB43vn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_03:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108230098
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
Cc: x86@kernel.org, Wanpeng Li <wanpengli@tencent.com>,
 linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sean Christopherson <seanjc@google.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12.08.21 11:04, David Hildenbrand wrote:
> On 12.08.21 06:02, Hou Wenlong wrote:
>> From: Sean Christopherson <seanjc@google.com>
>>
>> Refactor kvm_arch_vcpu_fault() to return 'struct page *' instead of
>> 'vm_fault_t' to simplify architecture specific implementations that do
>> more than return SIGBUS.  Currently this only applies to s390, but a
>> future patch will move x86's pio_data handling into x86 where it belongs.
>>
>> No functional changed intended.
>>
>> Cc: Hou Wenlong <houwenlong93@linux.alibaba.com>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Hou Wenlong <houwenlong93@linux.alibaba.com>
>> ---
>>   arch/arm64/kvm/arm.c       |  4 ++--
>>   arch/mips/kvm/mips.c       |  4 ++--
>>   arch/powerpc/kvm/powerpc.c |  4 ++--
>>   arch/s390/kvm/kvm-s390.c   | 12 ++++--------
>>   arch/x86/kvm/x86.c         |  4 ++--
>>   include/linux/kvm_host.h   |  2 +-
>>   virt/kvm/kvm_main.c        |  5 ++++-
>>   7 files changed, 17 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index e9a2b8f27792..83f4ffe3e4f2 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -161,9 +161,9 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>>       return ret;
>>   }
>> -vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>> +struct page *kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>>   {
>> -    return VM_FAULT_SIGBUS;
>> +    return NULL;
>>   }
>> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
>> index af9dd029a4e1..ae79874e6fd2 100644
>> --- a/arch/mips/kvm/mips.c
>> +++ b/arch/mips/kvm/mips.c
>> @@ -1053,9 +1053,9 @@ int kvm_arch_vcpu_ioctl_set_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu)
>>       return -ENOIOCTLCMD;
>>   }
>> -vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>> +struct page *kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>>   {
>> -    return VM_FAULT_SIGBUS;
>> +    return NULL;
>>   }
>>   int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index be33b5321a76..b9c21f9ab784 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -2090,9 +2090,9 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>>       return r;
>>   }
>> -vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>> +struct page *kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>>   {
>> -    return VM_FAULT_SIGBUS;
>> +    return NULL;
>>   }
>>   static int kvm_vm_ioctl_get_pvinfo(struct kvm_ppc_pvinfo *pvinfo)
>> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
>> index 02574d7b3612..e1b69833e228 100644
>> --- a/arch/s390/kvm/kvm-s390.c
>> +++ b/arch/s390/kvm/kvm-s390.c
>> @@ -4979,17 +4979,13 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>>       return r;
>>   }
>> -vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>> +struct page *kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>>   {
>>   #ifdef CONFIG_KVM_S390_UCONTROL
>> -    if ((vmf->pgoff == KVM_S390_SIE_PAGE_OFFSET)
>> -         && (kvm_is_ucontrol(vcpu->kvm))) {
>> -        vmf->page = virt_to_page(vcpu->arch.sie_block);
>> -        get_page(vmf->page);
>> -        return 0;
>> -    }
>> +    if (vmf->pgoff == KVM_S390_SIE_PAGE_OFFSET && kvm_is_ucontrol(vcpu->kvm))
>> +        return virt_to_page(vcpu->arch.sie_block);
>>   #endif
>> -    return VM_FAULT_SIGBUS;
>> +    return NULL;
>>   }
>>   /* Section: memory related */
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index 3cedc7cc132a..1e3bbe5cd33a 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -5347,9 +5347,9 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>>       return r;
>>   }
>> -vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>> +struct page *kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>>   {
>> -    return VM_FAULT_SIGBUS;
>> +    return NULL;
>>   }
>>   static int kvm_vm_ioctl_set_tss_addr(struct kvm *kvm, unsigned long addr)
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 492d183dd7d0..a949de534722 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -995,7 +995,7 @@ long kvm_arch_dev_ioctl(struct file *filp,
>>               unsigned int ioctl, unsigned long arg);
>>   long kvm_arch_vcpu_ioctl(struct file *filp,
>>                unsigned int ioctl, unsigned long arg);
>> -vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf);
>> +struct page *kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf);
>>   int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext);
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index 30d322519253..f7d21418971b 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -3448,7 +3448,10 @@ static vm_fault_t kvm_vcpu_fault(struct vm_fault *vmf)
>>               &vcpu->dirty_ring,
>>               vmf->pgoff - KVM_DIRTY_LOG_PAGE_OFFSET);
>>       else
>> -        return kvm_arch_vcpu_fault(vcpu, vmf);
>> +        page = kvm_arch_vcpu_fault(vcpu, vmf);
>> +    if (!page)
>> +        return VM_FAULT_SIGBUS;
>> +
>>       get_page(page);
>>       vmf->page = page;
>>       return 0;
>>
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
> But at the same time I wonder if we should just get rid of CONFIG_KVM_S390_UCONTROL and consequently kvm_arch_vcpu_fault().
> 
> 
> In practice CONFIG_KVM_S390_UCONTROL, is never enabled in any reasonable kernel build and consequently it's never tested; further, exposing the sie_block to user space allows user space to generate random SIE validity intercepts.
> 
> CONFIG_KVM_S390_UCONTROL feels like something that should just be maintained out of tree by someone who really needs to hack deep into hw virtualization for testing purposes etc.

I recently talked to the ucontrol users and they will look into selftests.
