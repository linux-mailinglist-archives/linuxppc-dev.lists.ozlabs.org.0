Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9407DF468
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 14:57:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NOTRZb/Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLlmv6pJYz3dFB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 00:57:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NOTRZb/Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLllq25Lsz3ckc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 00:56:23 +1100 (AEDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-66d0760cd20so8297786d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698933379; x=1699538179; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWVbaemD/Qn2/IvLfOB52rG+LgMP2W3NogibJrZTMZ4=;
        b=NOTRZb/ZREph+WrRayT+V1jPRUpqzk4l7ZX925LL7jgCeJTdvdKxn5y2Feu162mGOD
         s3wHUiNJx9QndxsclW5KOF6mDlhMy0UjE22ULvcHfLvgLBNqzgs8aSMn2sA+ZRzTjsuy
         1Ukl3de0CM8S8KgWFBS4NRY21ol4++JtIfKSaxWX9TR0vHAh5Aa0ewMRg3aP52NfFOCN
         xBIGqUf4G9rUpu6hfDu8H1Z/YJpjMYKWVjf+dabUqHYggSFN4xftDC0FOJB5/8ou/XzP
         3jQRH7udhduxmtfhUek5iDXSPG1/Y+E62HmyZ+Lep9clrbYxyxr7ZumWgTMG/Np3daXC
         sMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933379; x=1699538179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWVbaemD/Qn2/IvLfOB52rG+LgMP2W3NogibJrZTMZ4=;
        b=nCCX4KgcEFl3w9PzF0ebiKfIBMwCb+AI1uRzzvWYLLHopVpsF916wmTkIfO7P4Xto4
         9Bp1mfjiLPNRXEd3+GQU0q3norY9hrWKi5OaC5Nn/mRRNK4fTGnr7O/uYQRS/KkiTneL
         i7/WKluGLC0sjc3KGPLQBCyndZ4GA89r/wWyZP3nwEGHu7/30sIsNsH1IuNgluFR9CZE
         KR2yejexWXMktwXoSojGQe44ZZFO1NmedYjbXjBATd2zNdO93vSaTw+A9qwWiOnkyYa7
         sf2xPQzWMsuSa9nqnO82ZEjyDwDAFkZ9fgn+oPS3mHldmvVUpSAf1mCQUjbwUiOxutSl
         pdrA==
X-Gm-Message-State: AOJu0YybaIkYCyBaDYLYUXOgHhWHatGrw6aT2eBXB4jNQUMvHRBYIVHH
	Rd+2WALb906MLfUk7wWdVvRrU68IiM6HMksfqlFfrw==
X-Google-Smtp-Source: AGHT+IFRO7nq4nst6JF9hgQLfpXFHnQOjyBS3ejG9W5aUngaZEoEMY927pDB5PiH0nPNP2AZTqWUqRKAOoKphwpYQM4=
X-Received: by 2002:a05:6214:27ce:b0:66f:b9ef:9636 with SMTP id
 ge14-20020a05621427ce00b0066fb9ef9636mr10883504qvb.32.1698933378923; Thu, 02
 Nov 2023 06:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-12-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-12-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 13:55:42 +0000
Message-ID: <CA+EHjTzz2PftRAFU9pQaE1D=E3hwBDCDQpJ69O6r5akdAs0Exw@mail.gmail.com>
Subject: Re: [PATCH v13 11/35] KVM: Drop .on_unlock() mmu_notifier hook
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
> Drop the .on_unlock() mmu_notifer hook now that it's no longer used for
> notifying arch code that memory has been reclaimed.  Adding .on_unlock()
> and invoking it *after* dropping mmu_lock was a terrible idea, as doing s=
o
> resulted in .on_lock() and .on_unlock() having divergent and asymmetric
> behavior, and set future developers up for failure, i.e. all but asked fo=
r
> bugs where KVM relied on using .on_unlock() to try to run a callback whil=
e
> holding mmu_lock.
>
> Opportunistically add a lockdep assertion in kvm_mmu_invalidate_end() to
> guard against future bugs of this nature.
>
> Reported-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Link: https://lore.kernel.org/all/20230802203119.GB2021422@ls.amr.corp.in=
tel.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  virt/kvm/kvm_main.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 2bc04c8ae1f4..cb9376833c18 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -544,7 +544,6 @@ static inline struct kvm *mmu_notifier_to_kvm(struct =
mmu_notifier *mn)
>  typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *ran=
ge);
>
>  typedef void (*on_lock_fn_t)(struct kvm *kvm);
> -typedef void (*on_unlock_fn_t)(struct kvm *kvm);
>
>  struct kvm_mmu_notifier_range {
>         /*
> @@ -556,7 +555,6 @@ struct kvm_mmu_notifier_range {
>         union kvm_mmu_notifier_arg arg;
>         gfn_handler_t handler;
>         on_lock_fn_t on_lock;
> -       on_unlock_fn_t on_unlock;
>         bool flush_on_ret;
>         bool may_block;
>  };
> @@ -663,11 +661,8 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva=
_range(struct kvm *kvm,
>         if (range->flush_on_ret && r.ret)
>                 kvm_flush_remote_tlbs(kvm);
>
> -       if (r.found_memslot) {
> +       if (r.found_memslot)
>                 KVM_MMU_UNLOCK(kvm);
> -               if (!IS_KVM_NULL_FN(range->on_unlock))
> -                       range->on_unlock(kvm);
> -       }
>
>         srcu_read_unlock(&kvm->srcu, idx);
>
> @@ -687,7 +682,6 @@ static __always_inline int kvm_handle_hva_range(struc=
t mmu_notifier *mn,
>                 .arg            =3D arg,
>                 .handler        =3D handler,
>                 .on_lock        =3D (void *)kvm_null_fn,
> -               .on_unlock      =3D (void *)kvm_null_fn,
>                 .flush_on_ret   =3D true,
>                 .may_block      =3D false,
>         };
> @@ -706,7 +700,6 @@ static __always_inline int kvm_handle_hva_range_no_fl=
ush(struct mmu_notifier *mn
>                 .end            =3D end,
>                 .handler        =3D handler,
>                 .on_lock        =3D (void *)kvm_null_fn,
> -               .on_unlock      =3D (void *)kvm_null_fn,
>                 .flush_on_ret   =3D false,
>                 .may_block      =3D false,
>         };
> @@ -813,7 +806,6 @@ static int kvm_mmu_notifier_invalidate_range_start(st=
ruct mmu_notifier *mn,
>                 .end            =3D range->end,
>                 .handler        =3D kvm_mmu_unmap_gfn_range,
>                 .on_lock        =3D kvm_mmu_invalidate_begin,
> -               .on_unlock      =3D (void *)kvm_null_fn,
>                 .flush_on_ret   =3D true,
>                 .may_block      =3D mmu_notifier_range_blockable(range),
>         };
> @@ -858,6 +850,8 @@ static int kvm_mmu_notifier_invalidate_range_start(st=
ruct mmu_notifier *mn,
>
>  void kvm_mmu_invalidate_end(struct kvm *kvm)
>  {
> +       lockdep_assert_held_write(&kvm->mmu_lock);
> +
>         /*
>          * This sequence increase will notify the kvm page fault that
>          * the page that is going to be mapped in the spte could have
> @@ -889,7 +883,6 @@ static void kvm_mmu_notifier_invalidate_range_end(str=
uct mmu_notifier *mn,
>                 .end            =3D range->end,
>                 .handler        =3D (void *)kvm_null_fn,
>                 .on_lock        =3D kvm_mmu_invalidate_end,
> -               .on_unlock      =3D (void *)kvm_null_fn,
>                 .flush_on_ret   =3D false,
>                 .may_block      =3D mmu_notifier_range_blockable(range),
>         };
> --
> 2.42.0.820.g83a721a137-goog
>
