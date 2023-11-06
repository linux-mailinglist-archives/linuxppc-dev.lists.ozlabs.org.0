Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC137E1E97
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 11:40:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QeCMYlBS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP7DF0Nkzz3cBr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 21:40:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QeCMYlBS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP7CL3nS6z3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 21:39:57 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d852b28ec3bso4588913276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 02:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699267193; x=1699871993; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IP7Ako7Zwt1UjgwHJt9bCrv1N1+7f/8KEsqclU/31Lo=;
        b=QeCMYlBS2RFfL+rt2jW0gns1E1f3XldwI378RBXfgWVMQNyJkK0vCr+Fw7fA8o7dtS
         SIa0C1KH2g3k5W9MWJYYvEZ5TuSNL41BplC3T3etg0oxDl2+uxkmzuKNYnyPgwsCbx8n
         MxvDaUx6mIHGEZEDjlcpFCleoyI9qp3Y2s9Qi1llQfoiKL+DDRuxXTe/vUzjiShs21PZ
         h7gqSQRJX7qpNncYTRkqNt9AYRP3bSc/ye7H24cBJuEGBlWT96WrCGOSFnx0rmoG4HdR
         al9j3o0WS3Drz0GyG6ClmJ0SZPq7+gL3Dw/A7QW5WjEDQet9GRpK8F++nQ8jaxccTeS4
         pwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699267193; x=1699871993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IP7Ako7Zwt1UjgwHJt9bCrv1N1+7f/8KEsqclU/31Lo=;
        b=i8cherqXyB/Oy1fwjptrQECtsi94zgPSptbjfZA/3FoEb8keb+eBIkFLH0ZKJPsFyp
         GPrYpTOYn9W0FgPNU6k6iOJny+WFBdAMcBT1oEGwrMwIkXlj9CANSZI5hQf2Wcr9g1ES
         dQRpqC1rXGakpCEHzaXjVedCZWuZtx49Ye3Z2UtEpR/z+V3NFdz/F61UwyVEhffuNUM+
         p8OHatkpbk3pSJYMv6R3YsDAwob8Yvews3j/qo4YX38ICnrqdo9uX/T9e9TCcs4TylDV
         0dmwcsJIKv7c6BzgUEFcInuV9vGLRh7wjYb9uMinSaHqrRY8JkfoSoLoPii2FecWoQeW
         xx0g==
X-Gm-Message-State: AOJu0YysPUMLeIoWbRjvcidfOWBMEhWX/Q0bRila1OQwR6/ur5rhsmpV
	i9XgCm9L+Q2UUlfGSglyANPKxKPGnoAprQOnswWpbA==
X-Google-Smtp-Source: AGHT+IF3rzQ5LOrId/XYQctH9B6CwyxTW0O3KUw3PMrr+bssM8YhYBIXogRP/nz1I462+uCjwm0FcVpnK+jerK57G6Q=
X-Received: by 2002:a25:e753:0:b0:d89:aa7e:aed9 with SMTP id
 e80-20020a25e753000000b00d89aa7eaed9mr25948223ybh.23.1699267193428; Mon, 06
 Nov 2023 02:39:53 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-13-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-13-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 10:39:17 +0000
Message-ID: <CA+EHjTxCv7oHQbT-M76Q+rXdN26hCYUtD8FAORw8PSLP+P-JVQ@mail.gmail.com>
Subject: Re: [PATCH 12/34] KVM: Introduce per-page memory attributes
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Sean Christopherson <seanjc@goog
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

...

> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 96aa930536b1..68a144cb7dbc 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -256,6 +256,7 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
>  #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
>  union kvm_mmu_notifier_arg {
>         pte_t pte;
> +       unsigned long attributes;
>  };
>
>  struct kvm_gfn_range {
> @@ -806,6 +807,10 @@ struct kvm {
>
>  #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
>         struct notifier_block pm_notifier;
> +#endif
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +       /* Protected by slots_locks (for writes) and RCU (for reads) */

slots_locks -> slots_lock

Otherwise,
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> +       struct xarray mem_attr_array;
>  #endif
>         char stats_id[KVM_STATS_NAME_SIZE];
>  };
> @@ -2338,4 +2343,18 @@ static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
>         vcpu->run->memory_fault.flags = 0;
>  }
>
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> +{
> +       return xa_to_value(xa_load(&kvm->mem_attr_array, gfn));
> +}
> +
> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +                                    unsigned long attrs);
> +bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
> +                                       struct kvm_gfn_range *range);
> +bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> +                                        struct kvm_gfn_range *range);
> +#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> +
>  #endif
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 59010a685007..e8d167e54980 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1220,6 +1220,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES 230
>  #define KVM_CAP_USER_MEMORY2 231
>  #define KVM_CAP_MEMORY_FAULT_INFO 232
> +#define KVM_CAP_MEMORY_ATTRIBUTES 233
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> @@ -2288,4 +2289,16 @@ struct kvm_s390_zpci_op {
>  /* flags for kvm_s390_zpci_op->u.reg_aen.flags */
>  #define KVM_S390_ZPCIOP_REGAEN_HOST    (1 << 0)
>
> +/* Available with KVM_CAP_MEMORY_ATTRIBUTES */
> +#define KVM_SET_MEMORY_ATTRIBUTES              _IOW(KVMIO,  0xd2, struct kvm_memory_attributes)
> +
> +struct kvm_memory_attributes {
> +       __u64 address;
> +       __u64 size;
> +       __u64 attributes;
> +       __u64 flags;
> +};
> +
> +#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> +
>  #endif /* __LINUX_KVM_H */
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index ecae2914c97e..5bd7fcaf9089 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -96,3 +96,7 @@ config KVM_GENERIC_HARDWARE_ENABLING
>  config KVM_GENERIC_MMU_NOTIFIER
>         select MMU_NOTIFIER
>         bool
> +
> +config KVM_GENERIC_MEMORY_ATTRIBUTES
> +       select KVM_GENERIC_MMU_NOTIFIER
> +       bool
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 7f3291dec7a6..f1a575d39b3b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1211,6 +1211,9 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
>         spin_lock_init(&kvm->mn_invalidate_lock);
>         rcuwait_init(&kvm->mn_memslots_update_rcuwait);
>         xa_init(&kvm->vcpu_array);
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +       xa_init(&kvm->mem_attr_array);
> +#endif
>
>         INIT_LIST_HEAD(&kvm->gpc_list);
>         spin_lock_init(&kvm->gpc_lock);
> @@ -1391,6 +1394,9 @@ static void kvm_destroy_vm(struct kvm *kvm)
>         }
>         cleanup_srcu_struct(&kvm->irq_srcu);
>         cleanup_srcu_struct(&kvm->srcu);
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +       xa_destroy(&kvm->mem_attr_array);
> +#endif
>         kvm_arch_free_vm(kvm);
>         preempt_notifier_dec();
>         hardware_disable_all();
> @@ -2397,6 +2403,200 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  }
>  #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
>
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +/*
> + * Returns true if _all_ gfns in the range [@start, @end) have attributes
> + * matching @attrs.
> + */
> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +                                    unsigned long attrs)
> +{
> +       XA_STATE(xas, &kvm->mem_attr_array, start);
> +       unsigned long index;
> +       bool has_attrs;
> +       void *entry;
> +
> +       rcu_read_lock();
> +
> +       if (!attrs) {
> +               has_attrs = !xas_find(&xas, end - 1);
> +               goto out;
> +       }
> +
> +       has_attrs = true;
> +       for (index = start; index < end; index++) {
> +               do {
> +                       entry = xas_next(&xas);
> +               } while (xas_retry(&xas, entry));
> +
> +               if (xas.xa_index != index || xa_to_value(entry) != attrs) {
> +                       has_attrs = false;
> +                       break;
> +               }
> +       }
> +
> +out:
> +       rcu_read_unlock();
> +       return has_attrs;
> +}
> +
> +static u64 kvm_supported_mem_attributes(struct kvm *kvm)
> +{
> +       if (!kvm)
> +               return KVM_MEMORY_ATTRIBUTE_PRIVATE;
> +
> +       return 0;
> +}
> +
> +static __always_inline void kvm_handle_gfn_range(struct kvm *kvm,
> +                                                struct kvm_mmu_notifier_range *range)
> +{
> +       struct kvm_gfn_range gfn_range;
> +       struct kvm_memory_slot *slot;
> +       struct kvm_memslots *slots;
> +       struct kvm_memslot_iter iter;
> +       bool found_memslot = false;
> +       bool ret = false;
> +       int i;
> +
> +       gfn_range.arg = range->arg;
> +       gfn_range.may_block = range->may_block;
> +
> +       for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> +               slots = __kvm_memslots(kvm, i);
> +
> +               kvm_for_each_memslot_in_gfn_range(&iter, slots, range->start, range->end) {
> +                       slot = iter.slot;
> +                       gfn_range.slot = slot;
> +
> +                       gfn_range.start = max(range->start, slot->base_gfn);
> +                       gfn_range.end = min(range->end, slot->base_gfn + slot->npages);
> +                       if (gfn_range.start >= gfn_range.end)
> +                               continue;
> +
> +                       if (!found_memslot) {
> +                               found_memslot = true;
> +                               KVM_MMU_LOCK(kvm);
> +                               if (!IS_KVM_NULL_FN(range->on_lock))
> +                                       range->on_lock(kvm);
> +                       }
> +
> +                       ret |= range->handler(kvm, &gfn_range);
> +               }
> +       }
> +
> +       if (range->flush_on_ret && ret)
> +               kvm_flush_remote_tlbs(kvm);
> +
> +       if (found_memslot)
> +               KVM_MMU_UNLOCK(kvm);
> +}
> +
> +static bool kvm_pre_set_memory_attributes(struct kvm *kvm,
> +                                         struct kvm_gfn_range *range)
> +{
> +       /*
> +        * Unconditionally add the range to the invalidation set, regardless of
> +        * whether or not the arch callback actually needs to zap SPTEs.  E.g.
> +        * if KVM supports RWX attributes in the future and the attributes are
> +        * going from R=>RW, zapping isn't strictly necessary.  Unconditionally
> +        * adding the range allows KVM to require that MMU invalidations add at
> +        * least one range between begin() and end(), e.g. allows KVM to detect
> +        * bugs where the add() is missed.  Relaxing the rule *might* be safe,
> +        * but it's not obvious that allowing new mappings while the attributes
> +        * are in flux is desirable or worth the complexity.
> +        */
> +       kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
> +
> +       return kvm_arch_pre_set_memory_attributes(kvm, range);
> +}
> +
> +/* Set @attributes for the gfn range [@start, @end). */
> +static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +                                    unsigned long attributes)
> +{
> +       struct kvm_mmu_notifier_range pre_set_range = {
> +               .start = start,
> +               .end = end,
> +               .handler = kvm_pre_set_memory_attributes,
> +               .on_lock = kvm_mmu_invalidate_begin,
> +               .flush_on_ret = true,
> +               .may_block = true,
> +       };
> +       struct kvm_mmu_notifier_range post_set_range = {
> +               .start = start,
> +               .end = end,
> +               .arg.attributes = attributes,
> +               .handler = kvm_arch_post_set_memory_attributes,
> +               .on_lock = kvm_mmu_invalidate_end,
> +               .may_block = true,
> +       };
> +       unsigned long i;
> +       void *entry;
> +       int r = 0;
> +
> +       entry = attributes ? xa_mk_value(attributes) : NULL;
> +
> +       mutex_lock(&kvm->slots_lock);
> +
> +       /* Nothing to do if the entire range as the desired attributes. */
> +       if (kvm_range_has_memory_attributes(kvm, start, end, attributes))
> +               goto out_unlock;
> +
> +       /*
> +        * Reserve memory ahead of time to avoid having to deal with failures
> +        * partway through setting the new attributes.
> +        */
> +       for (i = start; i < end; i++) {
> +               r = xa_reserve(&kvm->mem_attr_array, i, GFP_KERNEL_ACCOUNT);
> +               if (r)
> +                       goto out_unlock;
> +       }
> +
> +       kvm_handle_gfn_range(kvm, &pre_set_range);
> +
> +       for (i = start; i < end; i++) {
> +               r = xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> +                                   GFP_KERNEL_ACCOUNT));
> +               KVM_BUG_ON(r, kvm);
> +       }
> +
> +       kvm_handle_gfn_range(kvm, &post_set_range);
> +
> +out_unlock:
> +       mutex_unlock(&kvm->slots_lock);
> +
> +       return r;
> +}
> +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> +                                          struct kvm_memory_attributes *attrs)
> +{
> +       gfn_t start, end;
> +
> +       /* flags is currently not used. */
> +       if (attrs->flags)
> +               return -EINVAL;
> +       if (attrs->attributes & ~kvm_supported_mem_attributes(kvm))
> +               return -EINVAL;
> +       if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> +               return -EINVAL;
> +       if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> +               return -EINVAL;
> +
> +       start = attrs->address >> PAGE_SHIFT;
> +       end = (attrs->address + attrs->size) >> PAGE_SHIFT;
> +
> +       /*
> +        * xarray tracks data using "unsigned long", and as a result so does
> +        * KVM.  For simplicity, supports generic attributes only on 64-bit
> +        * architectures.
> +        */
> +       BUILD_BUG_ON(sizeof(attrs->attributes) != sizeof(unsigned long));
> +
> +       return kvm_vm_set_mem_attributes(kvm, start, end, attrs->attributes);
> +}
> +#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> +
>  struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn)
>  {
>         return __gfn_to_memslot(kvm_memslots(kvm), gfn);
> @@ -4641,6 +4841,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>         case KVM_CAP_BINARY_STATS_FD:
>         case KVM_CAP_SYSTEM_EVENT_DATA:
>                 return 1;
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +       case KVM_CAP_MEMORY_ATTRIBUTES:
> +               return kvm_supported_mem_attributes(kvm);
> +#endif
>         default:
>                 break;
>         }
> @@ -5034,6 +5238,18 @@ static long kvm_vm_ioctl(struct file *filp,
>                 break;
>         }
>  #endif /* CONFIG_HAVE_KVM_IRQ_ROUTING */
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +       case KVM_SET_MEMORY_ATTRIBUTES: {
> +               struct kvm_memory_attributes attrs;
> +
> +               r = -EFAULT;
> +               if (copy_from_user(&attrs, argp, sizeof(attrs)))
> +                       goto out;
> +
> +               r = kvm_vm_ioctl_set_mem_attributes(kvm, &attrs);
> +               break;
> +       }
> +#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
>         case KVM_CREATE_DEVICE: {
>                 struct kvm_create_device cd;
>
> --
> 2.39.1
>
>
