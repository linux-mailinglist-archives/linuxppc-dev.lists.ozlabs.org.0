Return-Path: <linuxppc-dev+bounces-14671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC93CAA2C3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 06 Dec 2025 09:21:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNh5T1KmPz2xQr;
	Sat, 06 Dec 2025 19:20:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765009245;
	cv=none; b=DnKfm/fOqszdPPK7yntbv2CpZCWd800hnl9zIdg2+0ZUDbLJUISfFN7Jp8gicXsYPGWwgXW+RIRxnjDVC4/3w7YxzapkSl0x0/xgHVmUid1dmkFYuZgBWi4XPQ2qKabsCDOMKWcebmFViV73neTDifKWLSZlEWmsIqJ9RIebvqRidC4oKG0Z1wdKIfHk0ap4kQvt0/F3mFVhuIs+2D/jy8/+rjEzPc9H8Q26POXqIpFSmqFpy0ewJSMU4xYe8DIrXlcHyLYeZ1T+iM99efqGX7zql7TvxIn6v0Zmdt9mOUuTUiw3ylxg0I7CEZzwj0TugHSFAZxOhC4hHxQ+EbV/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765009245; c=relaxed/relaxed;
	bh=X3ixz3ttUoatJ+/bD0lP8aDWqTJ5LEJSZ/Yk3KZZxmA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QkXO8Aack6+bP5MZJf1L1oSHxXnoKDUNYbeisgevaSFwqM+27b3C5Rnzx4kXGYC2UHgqT+g1VJxkfovkKypWEXYC8Mq1EzRm4BvLbTvQSpdmWWTcqCmBTMOYSH4hG4XLCdzjuRgi/I0MAW/yGlA13neyG/bIZKladVRmxtptFdzzWVNGqiNm0jiKCvGfK64LrRPUqU3eAvEBMhC2YhQ7QKTAu5KJ1FJjtJRFnY6vvF0MbHwepDo6xhjydjaZlGfKZJ3T8Z2iIPpvQK4aGcXGDRXR7OkK+FmUIhglKz4ziULTiGe1p4CfQWkqYl46k8/oGAgvtkbIvAOKupMOa9KrRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=maobibo@loongson.cn; receiver=lists.ozlabs.org) smtp.mailfrom=loongson.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=maobibo@loongson.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 79 seconds by postgrey-1.37 at boromir; Sat, 06 Dec 2025 19:20:38 AEDT
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNh5M02cHz2x9W
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 19:20:38 +1100 (AEDT)
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxndLt5jNpj7orAA--.28110S3;
	Sat, 06 Dec 2025 16:18:53 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxC8Hk5jNp9lpGAQ--.16586S3;
	Sat, 06 Dec 2025 16:18:47 +0800 (CST)
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>
References: <20251205232655.445294-1-seanjc@google.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <5a92dc4c-4d1c-544c-aee6-43432979c11a@loongson.cn>
Date: Sat, 6 Dec 2025 16:16:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
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
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxC8Hk5jNp9lpGAQ--.16586S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9fXoWfJryfXF4kGF1xWrWrJry3WrX_yoW8Ww47Wo
	WxtFsrJw48WFWUWry5Jr15t3WDCa4FgrWUWa15Jay5Z3W7Zw4Ygryaga15AF1FvF15KFyU
	Cas7X3Z0yF9aga17l-sFpf9Il3svdjkaLaAFLSUrUUUU5b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUO17kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUn0D73UUUU
	U==
X-Spam-Status: No, score=-0.7 required=3.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

On 2025/12/6 上午7:26, Sean Christopherson wrote:
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size array
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
> 
> Opportunistically clean up the indentation for the stats macros, and
> replace spaces with tabs.
> 
> No functional change intended.
> 
> Reported-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Closes: https://lore.kernel.org/all/aPfNKRpLfhmhYqfP@kspp
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> 
> Posting this as a standalone patch/email to make review and merging easier
> (assuming no one hates on the __KERNEL__ shenanigans).
>   
>   arch/arm64/kvm/guest.c    |  4 +-
>   arch/loongarch/kvm/vcpu.c |  2 +-
>   arch/loongarch/kvm/vm.c   |  2 +-
>   arch/mips/kvm/mips.c      |  4 +-
>   arch/powerpc/kvm/book3s.c |  4 +-
>   arch/powerpc/kvm/booke.c  |  4 +-
>   arch/riscv/kvm/vcpu.c     |  2 +-
>   arch/riscv/kvm/vm.c       |  2 +-
>   arch/s390/kvm/kvm-s390.c  |  4 +-
>   arch/x86/kvm/x86.c        |  4 +-
>   include/linux/kvm_host.h  | 83 +++++++++++++++++----------------------
>   include/uapi/linux/kvm.h  |  8 ++++
>   virt/kvm/binary_stats.c   |  2 +-
>   virt/kvm/kvm_main.c       | 20 +++++-----
>   14 files changed, 70 insertions(+), 75 deletions(-)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 1c87699fd886..332c453b87cf 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -29,7 +29,7 @@
>   
>   #include "trace.h"
>   
> -const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vm_stats_desc[] = {
>   	KVM_GENERIC_VM_STATS()
>   };
>   
> @@ -42,7 +42,7 @@ const struct kvm_stats_header kvm_vm_stats_header = {
>   		       sizeof(kvm_vm_stats_desc),
>   };
>   
> -const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
>   	KVM_GENERIC_VCPU_STATS(),
>   	STATS_DESC_COUNTER(VCPU, hvc_exit_stat),
>   	STATS_DESC_COUNTER(VCPU, wfe_exit_stat),
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 6d833599ef2e..2bcbd27f1152 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -13,7 +13,7 @@
>   #define CREATE_TRACE_POINTS
>   #include "trace.h"
>   
> -const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
>   	KVM_GENERIC_VCPU_STATS(),
>   	STATS_DESC_COUNTER(VCPU, int_exits),
>   	STATS_DESC_COUNTER(VCPU, idle_exits),
> diff --git a/arch/loongarch/kvm/vm.c b/arch/loongarch/kvm/vm.c
> index 194ccbcdc3b3..7deff56e0e1a 100644
> --- a/arch/loongarch/kvm/vm.c
> +++ b/arch/loongarch/kvm/vm.c
> @@ -10,7 +10,7 @@
>   #include <asm/kvm_eiointc.h>
>   #include <asm/kvm_pch_pic.h>
>   
> -const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vm_stats_desc[] = {
>   	KVM_GENERIC_VM_STATS(),
>   	STATS_DESC_ICOUNTER(VM, pages),
>   	STATS_DESC_ICOUNTER(VM, hugepages),
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index b0fb92fda4d4..23e69baad453 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -38,7 +38,7 @@
>   #define VECTORSPACING 0x100	/* for EI/VI mode */
>   #endif
>   
> -const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vm_stats_desc[] = {
>   	KVM_GENERIC_VM_STATS()
>   };
>   
> @@ -51,7 +51,7 @@ const struct kvm_stats_header kvm_vm_stats_header = {
>   		       sizeof(kvm_vm_stats_desc),
>   };
>   
> -const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
>   	KVM_GENERIC_VCPU_STATS(),
>   	STATS_DESC_COUNTER(VCPU, wait_exits),
>   	STATS_DESC_COUNTER(VCPU, cache_exits),
> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> index d79c5d1098c0..2efbe05caed7 100644
> --- a/arch/powerpc/kvm/book3s.c
> +++ b/arch/powerpc/kvm/book3s.c
> @@ -38,7 +38,7 @@
>   
>   /* #define EXIT_DEBUG */
>   
> -const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vm_stats_desc[] = {
>   	KVM_GENERIC_VM_STATS(),
>   	STATS_DESC_ICOUNTER(VM, num_2M_pages),
>   	STATS_DESC_ICOUNTER(VM, num_1G_pages)
> @@ -53,7 +53,7 @@ const struct kvm_stats_header kvm_vm_stats_header = {
>   		       sizeof(kvm_vm_stats_desc),
>   };
>   
> -const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
>   	KVM_GENERIC_VCPU_STATS(),
>   	STATS_DESC_COUNTER(VCPU, sum_exits),
>   	STATS_DESC_COUNTER(VCPU, mmio_exits),
> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
> index 3401b96be475..f3ddb24ece74 100644
> --- a/arch/powerpc/kvm/booke.c
> +++ b/arch/powerpc/kvm/booke.c
> @@ -36,7 +36,7 @@
>   
>   unsigned long kvmppc_booke_handlers;
>   
> -const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vm_stats_desc[] = {
>   	KVM_GENERIC_VM_STATS(),
>   	STATS_DESC_ICOUNTER(VM, num_2M_pages),
>   	STATS_DESC_ICOUNTER(VM, num_1G_pages)
> @@ -51,7 +51,7 @@ const struct kvm_stats_header kvm_vm_stats_header = {
>   		       sizeof(kvm_vm_stats_desc),
>   };
>   
> -const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
>   	KVM_GENERIC_VCPU_STATS(),
>   	STATS_DESC_COUNTER(VCPU, sum_exits),
>   	STATS_DESC_COUNTER(VCPU, mmio_exits),
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index a55a95da54d0..fdd99ac1e714 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -24,7 +24,7 @@
>   #define CREATE_TRACE_POINTS
>   #include "trace.h"
>   
> -const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
>   	KVM_GENERIC_VCPU_STATS(),
>   	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
>   	STATS_DESC_COUNTER(VCPU, wfi_exit_stat),
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 66d91ae6e9b2..715a06ae8c13 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -13,7 +13,7 @@
>   #include <linux/kvm_host.h>
>   #include <asm/kvm_mmu.h>
>   
> -const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vm_stats_desc[] = {
>   	KVM_GENERIC_VM_STATS()
>   };
>   static_assert(ARRAY_SIZE(kvm_vm_stats_desc) ==
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 70dd9ce8cf2b..1cc90b8cf768 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -65,7 +65,7 @@
>   #define VCPU_IRQS_MAX_BUF (sizeof(struct kvm_s390_irq) * \
>   			   (KVM_MAX_VCPUS + LOCAL_IRQS))
>   
> -const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vm_stats_desc[] = {
>   	KVM_GENERIC_VM_STATS(),
>   	STATS_DESC_COUNTER(VM, inject_io),
>   	STATS_DESC_COUNTER(VM, inject_float_mchk),
> @@ -91,7 +91,7 @@ const struct kvm_stats_header kvm_vm_stats_header = {
>   		       sizeof(kvm_vm_stats_desc),
>   };
>   
> -const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
>   	KVM_GENERIC_VCPU_STATS(),
>   	STATS_DESC_COUNTER(VCPU, exit_userspace),
>   	STATS_DESC_COUNTER(VCPU, exit_null),
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 0c6d899d53dd..62ee4816e573 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -237,7 +237,7 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_ipiv);
>   bool __read_mostly enable_device_posted_irqs = true;
>   EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_device_posted_irqs);
>   
> -const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vm_stats_desc[] = {
>   	KVM_GENERIC_VM_STATS(),
>   	STATS_DESC_COUNTER(VM, mmu_shadow_zapped),
>   	STATS_DESC_COUNTER(VM, mmu_pte_write),
> @@ -263,7 +263,7 @@ const struct kvm_stats_header kvm_vm_stats_header = {
>   		       sizeof(kvm_vm_stats_desc),
>   };
>   
> -const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> +const struct kvm_stats_desc kvm_vcpu_stats_desc[] = {
>   	KVM_GENERIC_VCPU_STATS(),
>   	STATS_DESC_COUNTER(VCPU, pf_taken),
>   	STATS_DESC_COUNTER(VCPU, pf_fixed),
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index d93f75b05ae2..7428d9949382 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1927,56 +1927,43 @@ enum kvm_stat_kind {
>   
>   struct kvm_stat_data {
>   	struct kvm *kvm;
> -	const struct _kvm_stats_desc *desc;
> +	const struct kvm_stats_desc *desc;
>   	enum kvm_stat_kind kind;
>   };
>   
> -struct _kvm_stats_desc {
> -	struct kvm_stats_desc desc;
> -	char name[KVM_STATS_NAME_SIZE];
> -};
> -
> -#define STATS_DESC_COMMON(type, unit, base, exp, sz, bsz)		       \
> -	.flags = type | unit | base |					       \
> -		 BUILD_BUG_ON_ZERO(type & ~KVM_STATS_TYPE_MASK) |	       \
> -		 BUILD_BUG_ON_ZERO(unit & ~KVM_STATS_UNIT_MASK) |	       \
> -		 BUILD_BUG_ON_ZERO(base & ~KVM_STATS_BASE_MASK),	       \
> -	.exponent = exp,						       \
> -	.size = sz,							       \
> +#define STATS_DESC_COMMON(type, unit, base, exp, sz, bsz)		\
> +	.flags = type | unit | base |					\
> +		 BUILD_BUG_ON_ZERO(type & ~KVM_STATS_TYPE_MASK) |       \
> +		 BUILD_BUG_ON_ZERO(unit & ~KVM_STATS_UNIT_MASK) |	\
> +		 BUILD_BUG_ON_ZERO(base & ~KVM_STATS_BASE_MASK),	\
> +	.exponent = exp,						\
> +	.size = sz,							\
>   	.bucket_size = bsz
>   
> -#define VM_GENERIC_STATS_DESC(stat, type, unit, base, exp, sz, bsz)	       \
> -	{								       \
> -		{							       \
> -			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
> -			.offset = offsetof(struct kvm_vm_stat, generic.stat)   \
> -		},							       \
> -		.name = #stat,						       \
> -	}
> -#define VCPU_GENERIC_STATS_DESC(stat, type, unit, base, exp, sz, bsz)	       \
> -	{								       \
> -		{							       \
> -			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
> -			.offset = offsetof(struct kvm_vcpu_stat, generic.stat) \
> -		},							       \
> -		.name = #stat,						       \
> -	}
> -#define VM_STATS_DESC(stat, type, unit, base, exp, sz, bsz)		       \
> -	{								       \
> -		{							       \
> -			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
> -			.offset = offsetof(struct kvm_vm_stat, stat)	       \
> -		},							       \
> -		.name = #stat,						       \
> -	}
> -#define VCPU_STATS_DESC(stat, type, unit, base, exp, sz, bsz)		       \
> -	{								       \
> -		{							       \
> -			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
> -			.offset = offsetof(struct kvm_vcpu_stat, stat)	       \
> -		},							       \
> -		.name = #stat,						       \
> -	}
> +#define VM_GENERIC_STATS_DESC(stat, type, unit, base, exp, sz, bsz)	\
> +{									\
> +	STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),		\
> +	.offset = offsetof(struct kvm_vm_stat, generic.stat),		\
> +	.name = #stat,							\
> +}
> +#define VCPU_GENERIC_STATS_DESC(stat, type, unit, base, exp, sz, bsz)	\
> +{									\
> +	STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),		\
> +	.offset = offsetof(struct kvm_vcpu_stat, generic.stat),		\
> +	.name = #stat,							\
> +}
> +#define VM_STATS_DESC(stat, type, unit, base, exp, sz, bsz)		\
> +{									\
> +	STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),		\
> +	.offset = offsetof(struct kvm_vm_stat, stat),			\
> +	.name = #stat,							\
> +}
> +#define VCPU_STATS_DESC(stat, type, unit, base, exp, sz, bsz)		\
> +{									\
> +	STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),		\
> +	.offset = offsetof(struct kvm_vcpu_stat, stat),			\
> +	.name = #stat,							\
> +}
>   /* SCOPE: VM, VM_GENERIC, VCPU, VCPU_GENERIC */
>   #define STATS_DESC(SCOPE, stat, type, unit, base, exp, sz, bsz)		       \
>   	SCOPE##_STATS_DESC(stat, type, unit, base, exp, sz, bsz)
> @@ -2053,7 +2040,7 @@ struct _kvm_stats_desc {
>   	STATS_DESC_IBOOLEAN(VCPU_GENERIC, blocking)
>   
>   ssize_t kvm_stats_read(char *id, const struct kvm_stats_header *header,
> -		       const struct _kvm_stats_desc *desc,
> +		       const struct kvm_stats_desc *desc,
>   		       void *stats, size_t size_stats,
>   		       char __user *user_buffer, size_t size, loff_t *offset);
>   
> @@ -2098,9 +2085,9 @@ static inline void kvm_stats_log_hist_update(u64 *data, size_t size, u64 value)
>   
>   
>   extern const struct kvm_stats_header kvm_vm_stats_header;
> -extern const struct _kvm_stats_desc kvm_vm_stats_desc[];
> +extern const struct kvm_stats_desc kvm_vm_stats_desc[];
>   extern const struct kvm_stats_header kvm_vcpu_stats_header;
> -extern const struct _kvm_stats_desc kvm_vcpu_stats_desc[];
> +extern const struct kvm_stats_desc kvm_vcpu_stats_desc[];
>   
>   #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
>   static inline int mmu_invalidate_retry(struct kvm *kvm, unsigned long mmu_seq)
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index dddb781b0507..76bd54848b11 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -14,6 +14,10 @@
>   #include <linux/ioctl.h>
>   #include <asm/kvm.h>
>   
> +#ifdef __KERNEL__
> +#include <linux/kvm_types.h>
> +#endif
> +
>   #define KVM_API_VERSION 12
>   
>   /*
> @@ -1579,7 +1583,11 @@ struct kvm_stats_desc {
>   	__u16 size;
>   	__u32 offset;
>   	__u32 bucket_size;
> +#ifdef __KERNEL__
> +	char name[KVM_STATS_NAME_SIZE];
> +#else
>   	char name[];
> +#endif
>   };
>   
>   #define KVM_GET_STATS_FD  _IO(KVMIO,  0xce)
> diff --git a/virt/kvm/binary_stats.c b/virt/kvm/binary_stats.c
> index eefca6c69f51..76ce697c773b 100644
> --- a/virt/kvm/binary_stats.c
> +++ b/virt/kvm/binary_stats.c
> @@ -50,7 +50,7 @@
>    * Return: the number of bytes that has been successfully read
>    */
>   ssize_t kvm_stats_read(char *id, const struct kvm_stats_header *header,
> -		       const struct _kvm_stats_desc *desc,
> +		       const struct kvm_stats_desc *desc,
>   		       void *stats, size_t size_stats,
>   		       char __user *user_buffer, size_t size, loff_t *offset)
>   {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 74e1afd67b44..6ebf1936c8d4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -982,9 +982,9 @@ static void kvm_free_memslots(struct kvm *kvm, struct kvm_memslots *slots)
>   		kvm_free_memslot(kvm, memslot);
>   }
>   
> -static umode_t kvm_stats_debugfs_mode(const struct _kvm_stats_desc *pdesc)
> +static umode_t kvm_stats_debugfs_mode(const struct kvm_stats_desc *desc)
>   {
> -	switch (pdesc->desc.flags & KVM_STATS_TYPE_MASK) {
> +	switch (desc->flags & KVM_STATS_TYPE_MASK) {
>   	case KVM_STATS_TYPE_INSTANT:
>   		return 0444;
>   	case KVM_STATS_TYPE_CUMULATIVE:
> @@ -1019,7 +1019,7 @@ static int kvm_create_vm_debugfs(struct kvm *kvm, const char *fdname)
>   	struct dentry *dent;
>   	char dir_name[ITOA_MAX_LEN * 2];
>   	struct kvm_stat_data *stat_data;
> -	const struct _kvm_stats_desc *pdesc;
> +	const struct kvm_stats_desc *pdesc;
>   	int i, ret = -ENOMEM;
>   	int kvm_debugfs_num_entries = kvm_vm_stats_header.num_desc +
>   				      kvm_vcpu_stats_header.num_desc;
> @@ -6160,11 +6160,11 @@ static int kvm_stat_data_get(void *data, u64 *val)
>   	switch (stat_data->kind) {
>   	case KVM_STAT_VM:
>   		r = kvm_get_stat_per_vm(stat_data->kvm,
> -					stat_data->desc->desc.offset, val);
> +					stat_data->desc->offset, val);
>   		break;
>   	case KVM_STAT_VCPU:
>   		r = kvm_get_stat_per_vcpu(stat_data->kvm,
> -					  stat_data->desc->desc.offset, val);
> +					  stat_data->desc->offset, val);
>   		break;
>   	}
>   
> @@ -6182,11 +6182,11 @@ static int kvm_stat_data_clear(void *data, u64 val)
>   	switch (stat_data->kind) {
>   	case KVM_STAT_VM:
>   		r = kvm_clear_stat_per_vm(stat_data->kvm,
> -					  stat_data->desc->desc.offset);
> +					  stat_data->desc->offset);
>   		break;
>   	case KVM_STAT_VCPU:
>   		r = kvm_clear_stat_per_vcpu(stat_data->kvm,
> -					    stat_data->desc->desc.offset);
> +					    stat_data->desc->offset);
>   		break;
>   	}
>   
> @@ -6334,7 +6334,7 @@ static void kvm_uevent_notify_change(unsigned int type, struct kvm *kvm)
>   static void kvm_init_debug(void)
>   {
>   	const struct file_operations *fops;
> -	const struct _kvm_stats_desc *pdesc;
> +	const struct kvm_stats_desc *pdesc;
>   	int i;
>   
>   	kvm_debugfs_dir = debugfs_create_dir("kvm", NULL);
> @@ -6347,7 +6347,7 @@ static void kvm_init_debug(void)
>   			fops = &vm_stat_readonly_fops;
>   		debugfs_create_file(pdesc->name, kvm_stats_debugfs_mode(pdesc),
>   				kvm_debugfs_dir,
> -				(void *)(long)pdesc->desc.offset, fops);
> +				(void *)(long)pdesc->offset, fops);
>   	}
>   
>   	for (i = 0; i < kvm_vcpu_stats_header.num_desc; ++i) {
> @@ -6358,7 +6358,7 @@ static void kvm_init_debug(void)
>   			fops = &vcpu_stat_readonly_fops;
>   		debugfs_create_file(pdesc->name, kvm_stats_debugfs_mode(pdesc),
>   				kvm_debugfs_dir,
> -				(void *)(long)pdesc->desc.offset, fops);
> +				(void *)(long)pdesc->offset, fops);
>   	}
>   }
>   
> 
> base-commit: e0c26d47def7382d7dbd9cad58bc653aed75737a
> 


