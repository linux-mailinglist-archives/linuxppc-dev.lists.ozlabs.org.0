Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A46494DC785
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 14:25:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK7F74pK2z30Qv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 00:25:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=suzuki.poulose@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KK7Df6kzhz2xsr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 00:25:20 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C303B1515;
 Thu, 17 Mar 2022 06:24:48 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD8113F766;
 Thu, 17 Mar 2022 06:24:42 -0700 (PDT)
Message-ID: <0d9d605e-4f92-3947-f99d-91faf9dbc2d7@arm.com>
Date: Thu, 17 Mar 2022 13:24:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/6] Partially revert "KVM: Pass kvm_init()'s opaque
 param to additional arch funcs"
Content-Language: en-US
To: Chao Gao <chao.gao@intel.com>, seanjc@google.com, maz@kernel.org,
 kvm@vger.kernel.org, pbonzini@redhat.com, kevin.tian@intel.com,
 tglx@linutronix.de
References: <20220216031528.92558-1-chao.gao@intel.com>
 <20220216031528.92558-3-chao.gao@intel.com>
From: Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20220216031528.92558-3-chao.gao@intel.com>
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
Cc: x86@kernel.org, Wanpeng Li <wanpengli@tencent.com>,
 David Hildenbrand <david@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 Anup Patel <anup@brainfault.org>, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, Dave Hansen <dave.hansen@linux.intel.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Atish Patra <atishp@atishpatra.org>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Sven Schnelle <svens@linux.ibm.com>, kvm-riscv@lists.infradead.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/02/2022 03:15, Chao Gao wrote:
> This partially reverts commit b99040853738 ("KVM: Pass kvm_init()'s opaque
> param to additional arch funcs") remove opaque from
> kvm_arch_check_processor_compat because no one uses this opaque now.
> Address conflicts for ARM (due to file movement) and manually handle RISC-V
> which comes after the commit.
> 
> And changes about kvm_arch_hardware_setup() in original commit are still
> needed so they are not reverted.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/kvm/arm.c       |  2 +-
>   arch/mips/kvm/mips.c       |  2 +-
>   arch/powerpc/kvm/powerpc.c |  2 +-
>   arch/riscv/kvm/main.c      |  2 +-
>   arch/s390/kvm/kvm-s390.c   |  2 +-
>   arch/x86/kvm/x86.c         |  2 +-
>   include/linux/kvm_host.h   |  2 +-
>   virt/kvm/kvm_main.c        | 16 +++-------------
>   8 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index ecc5958e27fe..0165cf3aac3a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -73,7 +73,7 @@ int kvm_arch_hardware_setup(void *opaque)
>   	return 0;
>   }
>   
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>   {
>   	return 0;
>   }

For arm64 :

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
