Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D301B0360
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 09:52:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495Jnc0qZBzDqg3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 17:52:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130;
 helo=out30-130.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495HyL6Zq1zDqsC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:14:49 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04428;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0Tw1zGGs_1587366866; 
Received: from 30.27.118.66(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0Tw1zGGs_1587366866) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 20 Apr 2020 15:14:28 +0800
Subject: Re: [PATCH] KVM: X86: Fix compile error in svm/sev.c
To: Xiaoyao Li <xiaoyao.li@intel.com>, pbonzini@redhat.com,
 tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, heiko.carstens@de.ibm.com,
 gor@linux.ibm.com, sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com
References: <20200419073047.14413-1-tianjia.zhang@linux.alibaba.com>
 <82ce1798-1dab-d271-d084-e9a89bb44e71@intel.com>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <8af45e72-2c68-7641-6968-70fad9c516b7@linux.alibaba.com>
Date: Mon, 20 Apr 2020 15:14:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <82ce1798-1dab-d271-d084-e9a89bb44e71@intel.com>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2020/4/19 16:24, Xiaoyao Li wrote:
> On 4/19/2020 3:30 PM, Tianjia Zhang wrote:
>> The compiler reported the following compilation errors:
>>
>> arch/x86/kvm/svm/sev.c: In function ‘sev_pin_memory’:
>> arch/x86/kvm/svm/sev.c:361:3: error: implicit declaration of function
>> ‘release_pages’ [-Werror=implicit-function-declaration]
>>     release_pages(pages, npinned);
>>     ^~~~~~~~~~~~~
>>
>> The reason is that the 'pagemap.h' header file is not included.
>>
> 
> FYI.
> 
> Boris has sent the Patch:
> https://lkml.kernel.org/r/20200411160927.27954-1-bp@alien8.de
> 
> and it's already in kvm master/queue branch
> 
> 

This is the same fix, please ignore this patch.

Thanks and best,
Tianjia
