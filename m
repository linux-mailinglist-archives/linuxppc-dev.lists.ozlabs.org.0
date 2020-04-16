Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF201ABC71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 11:16:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492trb4Vr6zDrSC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 19:16:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132;
 helo=out30-132.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492th76mvlzDrQH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 19:09:11 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=36; SR=0;
 TI=SMTPD_---0TvhGIdK_1587028131; 
Received: from 30.27.118.45(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0TvhGIdK_1587028131) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 16 Apr 2020 17:08:53 +0800
Subject: Re: [PATCH v2] KVM: Optimize kvm_arch_vcpu_ioctl_run function
To: Cornelia Huck <cohuck@redhat.com>
References: <20200416051057.26526-1-tianjia.zhang@linux.alibaba.com>
 <878sivx67g.fsf@vitty.brq.redhat.com>
 <1000159f971a6fa3b5bd9e5871ce4d82@kernel.org>
 <8b92fb5b-5138-0695-fb90-6c36b8dfad00@linux.alibaba.com>
 <20200416105019.51191d79.cohuck@redhat.com>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <668a12b9-eda5-2d42-95f9-8d5e2990a465@linux.alibaba.com>
Date: Thu, 16 Apr 2020 17:08:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416105019.51191d79.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: christoffer.dall@arm.com, wanpengli@tencent.com, kvm@vger.kernel.org,
 david@redhat.com, heiko.carstens@de.ibm.com, peterx@redhat.com,
 linux-kernel@vger.kernel.org, hpa@zytor.com, kvmarm@lists.cs.columbia.edu,
 linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 Marc Zyngier <maz@kernel.org>, joro@8bytes.org, x86@kernel.org,
 borntraeger@de.ibm.com, mingo@redhat.com, julien.thierry.kdev@gmail.com,
 thuth@redhat.com, gor@linux.ibm.com, suzuki.poulose@arm.com,
 kvm-ppc@vger.kernel.org, bp@alien8.de, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
 sean.j.christopherson@intel.com, james.morse@arm.com, pbonzini@redhat.com,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2020/4/16 16:50, Cornelia Huck wrote:
> On Thu, 16 Apr 2020 16:45:33 +0800
> Tianjia Zhang <tianjia.zhang@linux.alibaba.com> wrote:
> 
>> On 2020/4/16 16:28, Marc Zyngier wrote:
>>> On 2020-04-16 08:03, Vitaly Kuznetsov wrote:
>>>> Tianjia Zhang <tianjia.zhang@linux.alibaba.com> writes:
>>>>   
>>>>> In earlier versions of kvm, 'kvm_run' is an independent structure
>>>>> and is not included in the vcpu structure. At present, 'kvm_run'
>>>>> is already included in the vcpu structure, so the parameter
>>>>> 'kvm_run' is redundant.
>>>>>
>>>>> This patch simplify the function definition, removes the extra
>>>>> 'kvm_run' parameter, and extract it from the 'kvm_vcpu' structure
>>>>> if necessary.
>>>>>
>>>>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>>>>> ---
>>>>>
>>>>> v2 change:
>>>>>    remove 'kvm_run' parameter and extract it from 'kvm_vcpu'
>>>>>
>>>>>   arch/mips/kvm/mips.c       |  3 ++-
>>>>>   arch/powerpc/kvm/powerpc.c |  3 ++-
>>>>>   arch/s390/kvm/kvm-s390.c   |  3 ++-
>>>>>   arch/x86/kvm/x86.c         | 11 ++++++-----
>>>>>   include/linux/kvm_host.h   |  2 +-
>>>>>   virt/kvm/arm/arm.c         |  6 +++---
>>>>>   virt/kvm/kvm_main.c        |  2 +-
>>>>>   7 files changed, 17 insertions(+), 13 deletions(-)
> 
>>> Overall, there is a large set of cleanups to be done when both the vcpu
>>> and the run
>>> structures are passed as parameters at the same time. Just grepping the
>>> tree for
>>> kvm_run is pretty instructive.
>>>
>>>           M.
>>
>> Sorry, it's my mistake, I only compiled the x86 platform, I will submit
>> patch again.
> 
> I think it's completely fine (and even preferable) to do cleanups like
> that on top.
> 
> [FWIW, I compiled s390 here.]
> 

Very good, I will do a comprehensive cleanup of this type of code.

Thanks,
Tianjia
