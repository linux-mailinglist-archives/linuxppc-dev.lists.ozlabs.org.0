Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 461B621B042
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 09:34:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B34YT6GZ0zDrNR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 17:34:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.44;
 helo=out30-44.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B34Wl3q2PzDrKb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 17:32:49 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04427;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0U2Gmw93_1594366344; 
Received: from 30.27.116.248(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U2Gmw93_1594366344) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 10 Jul 2020 15:32:26 +0800
Subject: Re: [PATCH v6 0/5] clean up redundant 'kvm_run' parameters
To: pbonzini@redhat.com, tsbogend@alpha.franken.de, paulus@ozlabs.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 heiko.carstens@de.ibm.com, gor@linux.ibm.com,
 sean.j.christopherson@intel.com, vkuznets@redhat.com, wanpengli@tencent.com,
 jmattson@google.com, joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org, hpa@zytor.com, maz@kernel.org,
 james.morse@arm.com, julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com,
 chenhuacai@gmail.com
References: <20200623131418.31473-1-tianjia.zhang@linux.alibaba.com>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <6604e273-d7b1-5007-8721-75c4a4dec68e@linux.alibaba.com>
Date: Fri, 10 Jul 2020 15:32:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200623131418.31473-1-tianjia.zhang@linux.alibaba.com>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Paolo,

Any opinion on this series patches? Can I help with this patchset ?

Thanks and best,
Tianjia

On 2020/6/23 21:14, Tianjia Zhang wrote:
> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
> structure. For historical reasons, many kvm-related function parameters
> retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
> patch does a unified cleanup of these remaining redundant parameters.
> 
> This series of patches has completely cleaned the architecture of
> arm64, mips, ppc, and s390 (no such redundant code on x86). Due to
> the large number of modified codes, a separate patch is made for each
> platform. On the ppc platform, there is also a redundant structure
> pointer of 'kvm_run' in 'vcpu_arch', which has also been cleaned
> separately.
> 
> ---
> v6 changes:
>    Rearrange patch sets, only keep the unmerged patch.
>    rebase on mainline.
> 
> v5 change:
>    ppc: fix for review.
> 
> v4 change:
>    mips: fixes two errors in entry.c.
> 
> v3 change:
>    Keep the existing `vcpu->run` in the function body unchanged.
> 
> v2 change:
>    s390 retains the original variable name and minimizes modification.
> 
> Tianjia Zhang (5):
>    KVM: s390: clean up redundant 'kvm_run' parameters
>    KVM: arm64: clean up redundant 'kvm_run' parameters
>    KVM: PPC: clean up redundant kvm_run parameters in assembly
>    KVM: MIPS: clean up redundant 'kvm_run' parameters
>    KVM: MIPS: clean up redundant kvm_run parameters in assembly
> 
>   arch/arm64/include/asm/kvm_coproc.h   |  12 +--
>   arch/arm64/include/asm/kvm_host.h     |  11 +--
>   arch/arm64/include/asm/kvm_mmu.h      |   2 +-
>   arch/arm64/kvm/arm.c                  |   6 +-
>   arch/arm64/kvm/handle_exit.c          |  36 ++++----
>   arch/arm64/kvm/mmio.c                 |  11 +--
>   arch/arm64/kvm/mmu.c                  |   5 +-
>   arch/arm64/kvm/sys_regs.c             |  13 ++-
>   arch/mips/include/asm/kvm_host.h      |  32 ++------
>   arch/mips/kvm/emulate.c               |  59 +++++--------
>   arch/mips/kvm/entry.c                 |  21 ++---
>   arch/mips/kvm/mips.c                  |  14 ++--
>   arch/mips/kvm/trap_emul.c             | 114 +++++++++++---------------
>   arch/mips/kvm/vz.c                    |  26 +++---
>   arch/powerpc/include/asm/kvm_ppc.h    |   2 +-
>   arch/powerpc/kvm/book3s_interrupts.S  |  22 +++--
>   arch/powerpc/kvm/book3s_pr.c          |   9 +-
>   arch/powerpc/kvm/booke.c              |   9 +-
>   arch/powerpc/kvm/booke_interrupts.S   |   9 +-
>   arch/powerpc/kvm/bookehv_interrupts.S |  10 +--
>   arch/s390/kvm/kvm-s390.c              |  23 ++++--
>   21 files changed, 188 insertions(+), 258 deletions(-)
> 
