Return-Path: <linuxppc-dev+bounces-6461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 908E4A43EC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 13:07:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2GZB1m5Yz2ym2;
	Tue, 25 Feb 2025 23:07:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740485250;
	cv=none; b=bE+qwM74QPrdzXliiXDYlrzKNQDJhNP5lLAFShv+b8VARpedaSl+z0Y7/O1eI2KBopYnKyPY9ghuRzWt/G/ff5eleFZQTFoog75yon9LrJGeOkSqhnzky6wPcRmUOuCFF5EQFRONwHmaooswd3BkYinoxlEUKc/yOkIbId0D1qPSZbSzOXVvSn2F2Rg7lRivedphLfR3xpFE2O6/3GFeBqPxyFWG/v9XJucLEz6htFwxIDH/yg7EfEndz0DGUpwEnEML9kwaYZKLHjQoz7rYOYy9EeBf39GCxEy+o9Ahqza3jGhYa/18QWG9d9b8nqNMQakRxrTgKqTBMltEiRC7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740485250; c=relaxed/relaxed;
	bh=VbSdsrlco9kPHPvl08rzt5ZK2jcK4prMcWAVhoadcmw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hoPrKWBRUXFNWDHZF50NyrB80RdT51k2cxMaWV32mefcQBkXBPEsMZDvjP8XFB53LwbRTkSpXVZn+opudsxcSdO0LX3LIZoSZP/XEEn7dlryu5/Q26XKuXIcfhLxXzC9yb0KXYmLBnRGRbHuS6oRnle4F9clV0wlBZDqKYq7g1Mf45cAtKuJTrTfij/KHrSsoP3BSZILJNGLxbrGJqDsN2j3x7TyxTQJViUOYqmOGYNo0nSHthQlMKWiUJBkk/N1BzNc5og3Hv0HolHXberEBOi1ZDseu8Lt6qUUtXYaDHi+gT1GHZpfIaWyqf+saNCwEWeoZzjs3mJ0TBjPXKD0Pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=maobibo@loongson.cn; receiver=lists.ozlabs.org) smtp.mailfrom=loongson.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=maobibo@loongson.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 86 seconds by postgrey-1.37 at boromir; Tue, 25 Feb 2025 23:07:28 AEDT
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2GZ84N8qz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 23:07:28 +1100 (AEDT)
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Bxnmshsr1ntheCAA--.26867S3;
	Tue, 25 Feb 2025 20:05:53 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMBxXsUdsr1nweUnAA--.16387S3;
	Tue, 25 Feb 2025 20:05:51 +0800 (CST)
Subject: Re: [PATCH 7/7] KVM: Drop kvm_arch_sync_events() now that all
 implementations are nops
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 Rick P Edgecombe <rick.p.edgecombe@intel.com>,
 Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
References: <20250224235542.2562848-1-seanjc@google.com>
 <20250224235542.2562848-8-seanjc@google.com>
From: bibo mao <maobibo@loongson.cn>
Message-ID: <49df2315-4c79-e0c0-6163-4f53b80afa55@loongson.cn>
Date: Tue, 25 Feb 2025 20:05:14 +0800
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
MIME-Version: 1.0
In-Reply-To: <20250224235542.2562848-8-seanjc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXsUdsr1nweUnAA--.16387S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxtF47XrykXrWUKw17WFW7trc_yoWxJryxpa
	sxAF4kGw4fKry8Ka47Jr4q934fXws5Gw1ak342grW5JFnxtr1DJFWkCr1DJFn8J3y093WS
	kFW3KF1rWF4qvwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUP529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jCMKZUUUUU=
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

On 2025/2/25 上午7:55, Sean Christopherson wrote:
> Remove kvm_arch_sync_events() now that x86 no longer uses it (no other
> arch has ever used it).
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/include/asm/kvm_host.h     | 2 --
>   arch/loongarch/include/asm/kvm_host.h | 1 -
>   arch/mips/include/asm/kvm_host.h      | 1 -
>   arch/powerpc/include/asm/kvm_host.h   | 1 -
>   arch/riscv/include/asm/kvm_host.h     | 2 --
>   arch/s390/include/asm/kvm_host.h      | 1 -
>   arch/x86/kvm/x86.c                    | 5 -----
>   include/linux/kvm_host.h              | 1 -
>   virt/kvm/kvm_main.c                   | 1 -
>   9 files changed, 15 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 7cfa024de4e3..40897bd2b4a3 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1346,8 +1346,6 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
>   	return cpus_have_final_cap(ARM64_SPECTRE_V3A);
>   }
>   
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
> -
>   void kvm_init_host_debug_data(void);
>   void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu);
>   void kvm_vcpu_put_debug(struct kvm_vcpu *vcpu);
> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
> index 590982cd986e..ab5b7001e2ff 100644
> --- a/arch/loongarch/include/asm/kvm_host.h
> +++ b/arch/loongarch/include/asm/kvm_host.h
> @@ -320,7 +320,6 @@ static inline bool kvm_is_ifetch_fault(struct kvm_vcpu_arch *arch)
>   
>   /* Misc */
>   static inline void kvm_arch_hardware_unsetup(void) {}
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>   static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>   static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>   static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index f7222eb594ea..c14b10821817 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -886,7 +886,6 @@ extern unsigned long kvm_mips_get_ramsize(struct kvm *kvm);
>   extern int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu,
>   			     struct kvm_mips_interrupt *irq);
>   
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>   static inline void kvm_arch_free_memslot(struct kvm *kvm,
>   					 struct kvm_memory_slot *slot) {}
>   static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 6e1108f8fce6..2d139c807577 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -902,7 +902,6 @@ struct kvm_vcpu_arch {
>   #define __KVM_HAVE_ARCH_WQP
>   #define __KVM_HAVE_CREATE_DEVICE
>   
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>   static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>   static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
>   static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index cc33e35cd628..0e9c2fab6378 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -301,8 +301,6 @@ static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
>   	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
>   }
>   
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
> -
>   #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
>   
>   void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
> diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
> index 9a367866cab0..424f899d8163 100644
> --- a/arch/s390/include/asm/kvm_host.h
> +++ b/arch/s390/include/asm/kvm_host.h
> @@ -1056,7 +1056,6 @@ bool kvm_s390_pv_cpu_is_protected(struct kvm_vcpu *vcpu);
>   extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
>   extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
>   
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>   static inline void kvm_arch_free_memslot(struct kvm *kvm,
>   					 struct kvm_memory_slot *slot) {}
>   static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ea445e6579f1..454fd6b8f3db 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12770,11 +12770,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>   	return ret;
>   }
>   
> -void kvm_arch_sync_events(struct kvm *kvm)
> -{
> -
> -}
> -
>   /**
>    * __x86_set_memory_region: Setup KVM internal memory slot
>    *
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index c28a6aa1f2ed..5438a1b446a6 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1747,7 +1747,6 @@ static inline void kvm_unregister_perf_callbacks(void) {}
>   
>   int kvm_arch_init_vm(struct kvm *kvm, unsigned long type);
>   void kvm_arch_destroy_vm(struct kvm *kvm);
> -void kvm_arch_sync_events(struct kvm *kvm);
>   
>   int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu);
>   
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 991e8111e88b..55153494ac70 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1271,7 +1271,6 @@ static void kvm_destroy_vm(struct kvm *kvm)
>   	kvm_destroy_pm_notifier(kvm);
>   	kvm_uevent_notify_change(KVM_EVENT_DESTROY_VM, kvm);
>   	kvm_destroy_vm_debugfs(kvm);
> -	kvm_arch_sync_events(kvm);
>   	mutex_lock(&kvm_lock);
>   	list_del(&kvm->vm_list);
>   	mutex_unlock(&kvm_lock);
> 


