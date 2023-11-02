Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C077DF465
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 14:56:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PDOjyPRt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLlly6cLXz3cm7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 00:56:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PDOjyPRt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLll32V98z2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 00:55:43 +1100 (AEDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-49618e09f16so404013e0c.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 06:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698933339; x=1699538139; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Yb/48Ns1tpOy5twJOpAhL4i1qPmUF1LLO7pfzUXbus=;
        b=PDOjyPRt0eOgTHW+iXUKm0civsur+/93dynfwkNxJ6p6aa/wtIsKUJ2e2GwgpJPS/F
         9xuaT3YOSQsXDb5vi1XaDPQwLgqyjP4IMVBdHvvsv4n19gw/IoOWw5DYYbewiI3XuxTe
         M+S24zh7JbjyT8l56BkcjL1Hvv/BUJLRkbIdfWZXEYLh7lKmpS+xMtrYbaVUCJZsO0Hc
         S5wm0sK5Cy6dFrRvrR5+CJhkKN+3AvQL9y1XIlHS6ovsvq0b/4O2UWZKgyYl8+zWSFs7
         IqWAhMnMG4q7eKRAGKbMKpqGUI7arBFWWhQT9AUZCX6f3YV4yaKtwbu1W0g7wrHgUXjK
         oLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933339; x=1699538139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yb/48Ns1tpOy5twJOpAhL4i1qPmUF1LLO7pfzUXbus=;
        b=N31rkEEMUsI5GTwgT3EtwGyd6yr0dy7tNAE9tBa/r4KsgvoDMV1/X9M14VOwFh1sks
         Rf21+YIToy1DXw8xf+AjAYiXwZytaSFJuu71dlFWZY1bl4FzkOdi51VRxNzl2nmU0ATx
         aqkoE2rPCtlw/86rNyIeNpjG2nlbxbHZLEEGSQ+Eu7e7GCddENPwy13Jk9SSK6N23Vva
         tcZ18dqTdja7RjBwHSuE8z7Htfo7LZiCrwCzS//ns7ogZ11RC16HR6yjB6/F+ieM+YMi
         rRK6CHVmHTPH7VJgswz3t1jDbWcQJXrax16hno4g0MpTZtJX5y08RmycuYhAcS2wn7Vw
         nDOw==
X-Gm-Message-State: AOJu0Yyd5GwgUVpuuPu84ARbmy7E5+CQh2KRlhu/+Jk2KjDG2L7E4dM/
	calOSygrX8IlQh4L/yuvA8FW/P/+3G8KBUFlpJUT7Q==
X-Google-Smtp-Source: AGHT+IHGemWDnkL7WTN8LWokDsgbdlhg4M3963xhuFMSCwbYM702stLA5BFN7Yk4qTk9o3bsEJ0EqjHFUXiDw4OizcA=
X-Received: by 2002:a1f:984f:0:b0:49d:a52a:4421 with SMTP id
 a76-20020a1f984f000000b0049da52a4421mr16094320vke.4.1698933338782; Thu, 02
 Nov 2023 06:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-11-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-11-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 13:55:03 +0000
Message-ID: <CA+EHjTx4dQwU3CWzoib_x1tgw66HCtBEiGW_7E8yZxttem6+vw@mail.gmail.com>
Subject: Re: [PATCH v13 10/35] KVM: Add a dedicated mmu_notifier flag for
 reclaiming freed memory
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracl
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 27, 2023 at 7:22=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Handle AMD SEV's kvm_arch_guest_memory_reclaimed() hook by having
> __kvm_handle_hva_range() return whether or not an overlapping memslot
> was found, i.e. mmu_lock was acquired.  Using the .on_unlock() hook
> works, but kvm_arch_guest_memory_reclaimed() needs to run after dropping
> mmu_lock, which makes .on_lock() and .on_unlock() asymmetrical.
>
> Use a small struct to return the tuple of the notifier-specific return,
> plus whether or not overlap was found.  Because the iteration helpers are
> __always_inlined, practically speaking, the struct will never actually be
> returned from a function call (not to mention the size of the struct will
> be two bytes in practice).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>  virt/kvm/kvm_main.c | 53 +++++++++++++++++++++++++++++++--------------
>  1 file changed, 37 insertions(+), 16 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 3f5b7c2c5327..2bc04c8ae1f4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -561,6 +561,19 @@ struct kvm_mmu_notifier_range {
>         bool may_block;
>  };
>
> +/*
> + * The inner-most helper returns a tuple containing the return value fro=
m the
> + * arch- and action-specific handler, plus a flag indicating whether or =
not at
> + * least one memslot was found, i.e. if the handler found guest memory.
> + *
> + * Note, most notifiers are averse to booleans, so even though KVM track=
s the
> + * return from arch code as a bool, outer helpers will cast it to an int=
. :-(
> + */
> +typedef struct kvm_mmu_notifier_return {
> +       bool ret;
> +       bool found_memslot;
> +} kvm_mn_ret_t;
> +
>  /*
>   * Use a dedicated stub instead of NULL to indicate that there is no cal=
lback
>   * function/handler.  The compiler technically can't guarantee that a re=
al
> @@ -582,22 +595,25 @@ static const union kvm_mmu_notifier_arg KVM_MMU_NOT=
IFIER_NO_ARG;
>              node;                                                       =
    \
>              node =3D interval_tree_iter_next(node, start, last))      \
>
> -static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
> -                                                 const struct kvm_mmu_no=
tifier_range *range)
> +static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *k=
vm,
> +                                                          const struct k=
vm_mmu_notifier_range *range)
>  {
> -       bool ret =3D false, locked =3D false;
> +       struct kvm_mmu_notifier_return r =3D {
> +               .ret =3D false,
> +               .found_memslot =3D false,
> +       };
>         struct kvm_gfn_range gfn_range;
>         struct kvm_memory_slot *slot;
>         struct kvm_memslots *slots;
>         int i, idx;
>
>         if (WARN_ON_ONCE(range->end <=3D range->start))
> -               return 0;
> +               return r;
>
>         /* A null handler is allowed if and only if on_lock() is provided=
. */
>         if (WARN_ON_ONCE(IS_KVM_NULL_FN(range->on_lock) &&
>                          IS_KVM_NULL_FN(range->handler)))
> -               return 0;
> +               return r;
>
>         idx =3D srcu_read_lock(&kvm->srcu);
>
> @@ -631,8 +647,8 @@ static __always_inline int __kvm_handle_hva_range(str=
uct kvm *kvm,
>                         gfn_range.end =3D hva_to_gfn_memslot(hva_end + PA=
GE_SIZE - 1, slot);
>                         gfn_range.slot =3D slot;
>
> -                       if (!locked) {
> -                               locked =3D true;
> +                       if (!r.found_memslot) {
> +                               r.found_memslot =3D true;
>                                 KVM_MMU_LOCK(kvm);
>                                 if (!IS_KVM_NULL_FN(range->on_lock))
>                                         range->on_lock(kvm);
> @@ -640,14 +656,14 @@ static __always_inline int __kvm_handle_hva_range(s=
truct kvm *kvm,
>                                 if (IS_KVM_NULL_FN(range->handler))
>                                         break;
>                         }
> -                       ret |=3D range->handler(kvm, &gfn_range);
> +                       r.ret |=3D range->handler(kvm, &gfn_range);
>                 }
>         }
>
> -       if (range->flush_on_ret && ret)
> +       if (range->flush_on_ret && r.ret)
>                 kvm_flush_remote_tlbs(kvm);
>
> -       if (locked) {
> +       if (r.found_memslot) {
>                 KVM_MMU_UNLOCK(kvm);
>                 if (!IS_KVM_NULL_FN(range->on_unlock))
>                         range->on_unlock(kvm);
> @@ -655,8 +671,7 @@ static __always_inline int __kvm_handle_hva_range(str=
uct kvm *kvm,
>
>         srcu_read_unlock(&kvm->srcu, idx);
>
> -       /* The notifiers are averse to booleans. :-( */
> -       return (int)ret;
> +       return r;
>  }
>
>  static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
> @@ -677,7 +692,7 @@ static __always_inline int kvm_handle_hva_range(struc=
t mmu_notifier *mn,
>                 .may_block      =3D false,
>         };
>
> -       return __kvm_handle_hva_range(kvm, &range);
> +       return __kvm_handle_hva_range(kvm, &range).ret;
>  }
>
>  static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_noti=
fier *mn,
> @@ -696,7 +711,7 @@ static __always_inline int kvm_handle_hva_range_no_fl=
ush(struct mmu_notifier *mn
>                 .may_block      =3D false,
>         };
>
> -       return __kvm_handle_hva_range(kvm, &range);
> +       return __kvm_handle_hva_range(kvm, &range).ret;
>  }
>
>  static bool kvm_change_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *r=
ange)
> @@ -798,7 +813,7 @@ static int kvm_mmu_notifier_invalidate_range_start(st=
ruct mmu_notifier *mn,
>                 .end            =3D range->end,
>                 .handler        =3D kvm_mmu_unmap_gfn_range,
>                 .on_lock        =3D kvm_mmu_invalidate_begin,
> -               .on_unlock      =3D kvm_arch_guest_memory_reclaimed,
> +               .on_unlock      =3D (void *)kvm_null_fn,
>                 .flush_on_ret   =3D true,
>                 .may_block      =3D mmu_notifier_range_blockable(range),
>         };
> @@ -830,7 +845,13 @@ static int kvm_mmu_notifier_invalidate_range_start(s=
truct mmu_notifier *mn,
>         gfn_to_pfn_cache_invalidate_start(kvm, range->start, range->end,
>                                           hva_range.may_block);
>
> -       __kvm_handle_hva_range(kvm, &hva_range);
> +       /*
> +        * If one or more memslots were found and thus zapped, notify arc=
h code
> +        * that guest memory has been reclaimed.  This needs to be done *=
after*
> +        * dropping mmu_lock, as x86's reclaim path is slooooow.
> +        */
> +       if (__kvm_handle_hva_range(kvm, &hva_range).found_memslot)
> +               kvm_arch_guest_memory_reclaimed(kvm);
>
>         return 0;
>  }
> --
> 2.42.0.820.g83a721a137-goog
>
