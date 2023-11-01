Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F4C7DE11A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 13:47:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fFhd3+l5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL6Gn3dRvz3cVP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 23:47:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fFhd3+l5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL6Fw1M5lz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 23:46:43 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6707401e1edso27853186d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698842800; x=1699447600; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mygXGcRJ5YlWP61Tr7KN5KWyfhmOoXTRmQYYFZqOKKI=;
        b=fFhd3+l55SDXC1Qo3TqrZtObMkqke3Y0eJhCVhXr9ZKuyi6rsGjdla3kXxxoWXMLAV
         UG9rjKgtRWqoErTQ7Zzy3wQrp0vh7p7aYXZqegGYw5eppz1h7l4rmQeL6577k+Lh2FnT
         rONefgpRVDGhorMAuzUffO2AYoesTnncpgw37hfvZQWyq0T/I3pr24oRpw5i1asxKHKP
         Xx1MhabVb9lIWD6D08x0pU980ug+tZoFNkD+zVLfptrzgcVxOrkixUSqloR+Y88Z6U2O
         nGD8ulRbLRzX67ypEFnqV0kxfpASXK9HGxXRGfvmR23S04B6m+371tE+KdJ+x7LJzqu+
         hsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698842800; x=1699447600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mygXGcRJ5YlWP61Tr7KN5KWyfhmOoXTRmQYYFZqOKKI=;
        b=TBEXTnlJJYiQfxf/mWzygmnyRtzx1iJSxrjI/Uh/tOjwgdiPWhO76Uegibi0w6y5Yw
         U5265qkkhGpX5/jiwUOWGM0DwqEBCbaezTcsjTPec2Jm5UdeBeQdLGFOsntbj0xnBVZW
         7y4aqiO7WHfUujX5dRvPk7pADZl5jBwWyZDnj51F6Cx3u6GQT3zfsq+tUXLT3yaxajTX
         x2shtM9G1uORXFmQS9Ew60dl1LeauOI4HKMcRaREXNUlp6G5hEagWWD10MQ7GVW9Zw14
         VGy3Q0nwzmAGQ8dGdSbdZv+unzpPMcH6nHq1o5Xvp/UoO+RvpYpzCTLrzfnhTZ6v8y9G
         oqEA==
X-Gm-Message-State: AOJu0YzoIeBRMIM7sJMPO56FRSB34Ru9XbsuC8W7a1EC2mVJ2MITqpqP
	jDSKwiedg6gHwInUMV/pY+mSFwyQRGQjTcs/i/uKEA==
X-Google-Smtp-Source: AGHT+IHd9N8dL6zdz3IA97hhnoDYG1Yv2Mx5veJZKoCg3Vt6EBcnFz3FSACXzGNwepp4FUZ865yy59BtQyGtgdViYUM=
X-Received: by 2002:a05:6214:f6c:b0:671:739e:e2fa with SMTP id
 iy12-20020a0562140f6c00b00671739ee2famr13258176qvb.59.1698842799599; Wed, 01
 Nov 2023 05:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-2-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-2-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 1 Nov 2023 12:46:02 +0000
Message-ID: <CA+EHjTy5tmgGmVNGTX4a2Engb+r1AQizsMxwb8xqOi1f9+VQLA@mail.gmail.com>
Subject: Re: [PATCH v13 01/35] KVM: Tweak kvm_hva_range and hva_handler_t to
 allow reusing for gfn ranges
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
> Rework and rename "struct kvm_hva_range" into "kvm_mmu_notifier_range" so
> that the structure can be used to handle notifications that operate on gf=
n
> context, i.e. that aren't tied to a host virtual address.  Rename the
> handler typedef too (arguably it should always have been gfn_handler_t).
>
> Practically speaking, this is a nop for 64-bit kernels as the only
> meaningful change is to store start+end as u64s instead of unsigned longs=
.
>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>  virt/kvm/kvm_main.c | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 486800a7024b..0524933856d4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -541,18 +541,22 @@ static inline struct kvm *mmu_notifier_to_kvm(struc=
t mmu_notifier *mn)
>         return container_of(mn, struct kvm, mmu_notifier);
>  }
>
> -typedef bool (*hva_handler_t)(struct kvm *kvm, struct kvm_gfn_range *ran=
ge);
> +typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *ran=
ge);
>
>  typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
>                              unsigned long end);
>
>  typedef void (*on_unlock_fn_t)(struct kvm *kvm);
>
> -struct kvm_hva_range {
> -       unsigned long start;
> -       unsigned long end;
> +struct kvm_mmu_notifier_range {
> +       /*
> +        * 64-bit addresses, as KVM notifiers can operate on host virtual
> +        * addresses (unsigned long) and guest physical addresses (64-bit=
).
> +        */
> +       u64 start;
> +       u64 end;
>         union kvm_mmu_notifier_arg arg;
> -       hva_handler_t handler;
> +       gfn_handler_t handler;
>         on_lock_fn_t on_lock;
>         on_unlock_fn_t on_unlock;
>         bool flush_on_ret;
> @@ -581,7 +585,7 @@ static const union kvm_mmu_notifier_arg KVM_MMU_NOTIF=
IER_NO_ARG;
>              node =3D interval_tree_iter_next(node, start, last))      \
>
>  static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
> -                                                 const struct kvm_hva_ra=
nge *range)
> +                                                 const struct kvm_mmu_no=
tifier_range *range)
>  {
>         bool ret =3D false, locked =3D false;
>         struct kvm_gfn_range gfn_range;
> @@ -608,9 +612,9 @@ static __always_inline int __kvm_handle_hva_range(str=
uct kvm *kvm,
>                         unsigned long hva_start, hva_end;
>
>                         slot =3D container_of(node, struct kvm_memory_slo=
t, hva_node[slots->node_idx]);
> -                       hva_start =3D max(range->start, slot->userspace_a=
ddr);
> -                       hva_end =3D min(range->end, slot->userspace_addr =
+
> -                                                 (slot->npages << PAGE_S=
HIFT));
> +                       hva_start =3D max_t(unsigned long, range->start, =
slot->userspace_addr);
> +                       hva_end =3D min_t(unsigned long, range->end,
> +                                       slot->userspace_addr + (slot->npa=
ges << PAGE_SHIFT));
>
>                         /*
>                          * To optimize for the likely case where the addr=
ess
> @@ -660,10 +664,10 @@ static __always_inline int kvm_handle_hva_range(str=
uct mmu_notifier *mn,
>                                                 unsigned long start,
>                                                 unsigned long end,
>                                                 union kvm_mmu_notifier_ar=
g arg,
> -                                               hva_handler_t handler)
> +                                               gfn_handler_t handler)
>  {
>         struct kvm *kvm =3D mmu_notifier_to_kvm(mn);
> -       const struct kvm_hva_range range =3D {
> +       const struct kvm_mmu_notifier_range range =3D {
>                 .start          =3D start,
>                 .end            =3D end,
>                 .arg            =3D arg,
> @@ -680,10 +684,10 @@ static __always_inline int kvm_handle_hva_range(str=
uct mmu_notifier *mn,
>  static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_noti=
fier *mn,
>                                                          unsigned long st=
art,
>                                                          unsigned long en=
d,
> -                                                        hva_handler_t ha=
ndler)
> +                                                        gfn_handler_t ha=
ndler)
>  {
>         struct kvm *kvm =3D mmu_notifier_to_kvm(mn);
> -       const struct kvm_hva_range range =3D {
> +       const struct kvm_mmu_notifier_range range =3D {
>                 .start          =3D start,
>                 .end            =3D end,
>                 .handler        =3D handler,
> @@ -771,7 +775,7 @@ static int kvm_mmu_notifier_invalidate_range_start(st=
ruct mmu_notifier *mn,
>                                         const struct mmu_notifier_range *=
range)
>  {
>         struct kvm *kvm =3D mmu_notifier_to_kvm(mn);
> -       const struct kvm_hva_range hva_range =3D {
> +       const struct kvm_mmu_notifier_range hva_range =3D {
>                 .start          =3D range->start,
>                 .end            =3D range->end,
>                 .handler        =3D kvm_unmap_gfn_range,
> @@ -835,7 +839,7 @@ static void kvm_mmu_notifier_invalidate_range_end(str=
uct mmu_notifier *mn,
>                                         const struct mmu_notifier_range *=
range)
>  {
>         struct kvm *kvm =3D mmu_notifier_to_kvm(mn);
> -       const struct kvm_hva_range hva_range =3D {
> +       const struct kvm_mmu_notifier_range hva_range =3D {
>                 .start          =3D range->start,
>                 .end            =3D range->end,
>                 .handler        =3D (void *)kvm_null_fn,
> --
> 2.42.0.820.g83a721a137-goog
>
