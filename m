Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 223E721B105
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 10:08:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B35K62bYmzDrMc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 18:08:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BtVEkmGy; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BtVEkmGy; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B35H76fhlzDrFY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 18:06:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594368417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4jS1QoQjjeHX3nPPzYjEddY3DRl7Jsr2mcq4h0i1jc=;
 b=BtVEkmGyeiLf1NmxwEisL0pgA/fXYsAzjvm7IvGNMzI5Dmrb+P5tPUmzesic+F0EH/lBj4
 +BOobClErGeXU57p3mnY6H6x0DL+Wkg6k8M60/IBm/VZmhTgvach14O+DbWG1tw2CpJhIT
 gzXgHz0KKDuvkdNYqQmeD8my8zhcqzU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594368417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4jS1QoQjjeHX3nPPzYjEddY3DRl7Jsr2mcq4h0i1jc=;
 b=BtVEkmGyeiLf1NmxwEisL0pgA/fXYsAzjvm7IvGNMzI5Dmrb+P5tPUmzesic+F0EH/lBj4
 +BOobClErGeXU57p3mnY6H6x0DL+Wkg6k8M60/IBm/VZmhTgvach14O+DbWG1tw2CpJhIT
 gzXgHz0KKDuvkdNYqQmeD8my8zhcqzU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-Ae7JF-8GOqCBccxexDbzIQ-1; Fri, 10 Jul 2020 04:06:55 -0400
X-MC-Unique: Ae7JF-8GOqCBccxexDbzIQ-1
Received: by mail-wr1-f71.google.com with SMTP id j3so5124534wrq.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 01:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U4jS1QoQjjeHX3nPPzYjEddY3DRl7Jsr2mcq4h0i1jc=;
 b=t1EFAJEgMj2U//DZz+j8prh1O6cn1Z+9lh+ECEkaI/smz6qUoiQKBsUQWDA56V95TI
 lfXpcbeutyCl0KBtX8eM7uAuFc4ZtSSWCzgvDJ5Kj09bytSUK2yHxrNoer2Ftzna4iee
 JyJD7looHFW83J45lsM1Ky4nU6UiMgiH5p01OOWfYc/+zyuKK76gy/GT1sNCS9qR51K8
 bSrRJ/skpVDwAhbgz7cxrx4Zlunz6Us52SFw0+xSc0Crlsk97M91E8KXUySNGFzgiJjk
 mJZ5vmMJurtTJSsP9jQ+N98pg7wDVyYq8BRYTSsX6TetxTnO/xr1PKQwt5Ant1vDi3+i
 lqkA==
X-Gm-Message-State: AOAM531PaqHdis5TkJZmotNGBjDqsROIcHbjzx63KLijDArAfvGOIMsG
 cb1f8tFostb9InP+I5IQFZ4hVf15ndSGf0XpDOCDLQjhwQVoGgDOBqI9JarWKPz673zxPkcrU8m
 eljC7A6brUSWweIV2lOFZd/4FWg==
X-Received: by 2002:a1c:1fd1:: with SMTP id f200mr3838407wmf.162.1594368414523; 
 Fri, 10 Jul 2020 01:06:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJjT5tWv9/nRHPZPlasSYyXK0UFRsIXqd7zkWACOymjphFAEJPu8OB7fs8YgXWFmbnz1f6Yg==
X-Received: by 2002:a1c:1fd1:: with SMTP id f200mr3838385wmf.162.1594368414271; 
 Fri, 10 Jul 2020 01:06:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id v3sm9130496wrq.57.2020.07.10.01.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 01:06:53 -0700 (PDT)
Subject: Re: [PATCH v6 0/5] clean up redundant 'kvm_run' parameters
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, heiko.carstens@de.ibm.com,
 gor@linux.ibm.com, sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com,
 chenhuacai@gmail.com
References: <20200623131418.31473-1-tianjia.zhang@linux.alibaba.com>
 <6604e273-d7b1-5007-8721-75c4a4dec68e@linux.alibaba.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <433ae9a7-ee86-28ea-e600-8769f9759513@redhat.com>
Date: Fri, 10 Jul 2020 10:06:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6604e273-d7b1-5007-8721-75c4a4dec68e@linux.alibaba.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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

On 10/07/20 09:32, Tianjia Zhang wrote:
> Hi Paolo,
> 
> Any opinion on this series patches? Can I help with this patchset ?

I was hoping to have some Tested-by, for now I'm queuing patches 1 and
2.  Thanks,

Paolo

> Thanks and best,
> Tianjia
> 
> On 2020/6/23 21:14, Tianjia Zhang wrote:
>> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
>> structure. For historical reasons, many kvm-related function parameters
>> retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
>> patch does a unified cleanup of these remaining redundant parameters.
>>
>> This series of patches has completely cleaned the architecture of
>> arm64, mips, ppc, and s390 (no such redundant code on x86). Due to
>> the large number of modified codes, a separate patch is made for each
>> platform. On the ppc platform, there is also a redundant structure
>> pointer of 'kvm_run' in 'vcpu_arch', which has also been cleaned
>> separately.
>>
>> ---
>> v6 changes:
>>    Rearrange patch sets, only keep the unmerged patch.
>>    rebase on mainline.
>>
>> v5 change:
>>    ppc: fix for review.
>>
>> v4 change:
>>    mips: fixes two errors in entry.c.
>>
>> v3 change:
>>    Keep the existing `vcpu->run` in the function body unchanged.
>>
>> v2 change:
>>    s390 retains the original variable name and minimizes modification.
>>
>> Tianjia Zhang (5):
>>    KVM: s390: clean up redundant 'kvm_run' parameters
>>    KVM: arm64: clean up redundant 'kvm_run' parameters
>>    KVM: PPC: clean up redundant kvm_run parameters in assembly
>>    KVM: MIPS: clean up redundant 'kvm_run' parameters
>>    KVM: MIPS: clean up redundant kvm_run parameters in assembly
>>
>>   arch/arm64/include/asm/kvm_coproc.h   |  12 +--
>>   arch/arm64/include/asm/kvm_host.h     |  11 +--
>>   arch/arm64/include/asm/kvm_mmu.h      |   2 +-
>>   arch/arm64/kvm/arm.c                  |   6 +-
>>   arch/arm64/kvm/handle_exit.c          |  36 ++++----
>>   arch/arm64/kvm/mmio.c                 |  11 +--
>>   arch/arm64/kvm/mmu.c                  |   5 +-
>>   arch/arm64/kvm/sys_regs.c             |  13 ++-
>>   arch/mips/include/asm/kvm_host.h      |  32 ++------
>>   arch/mips/kvm/emulate.c               |  59 +++++--------
>>   arch/mips/kvm/entry.c                 |  21 ++---
>>   arch/mips/kvm/mips.c                  |  14 ++--
>>   arch/mips/kvm/trap_emul.c             | 114 +++++++++++---------------
>>   arch/mips/kvm/vz.c                    |  26 +++---
>>   arch/powerpc/include/asm/kvm_ppc.h    |   2 +-
>>   arch/powerpc/kvm/book3s_interrupts.S  |  22 +++--
>>   arch/powerpc/kvm/book3s_pr.c          |   9 +-
>>   arch/powerpc/kvm/booke.c              |   9 +-
>>   arch/powerpc/kvm/booke_interrupts.S   |   9 +-
>>   arch/powerpc/kvm/bookehv_interrupts.S |  10 +--
>>   arch/s390/kvm/kvm-s390.c              |  23 ++++--
>>   21 files changed, 188 insertions(+), 258 deletions(-)
>>
> 

