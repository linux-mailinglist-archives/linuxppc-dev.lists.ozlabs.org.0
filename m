Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BE07DE123
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 13:52:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1u+MPRrV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL6Nn6zx6z3dBb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 23:52:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1u+MPRrV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL6Mz3XJjz3bv3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 23:51:58 +1100 (AEDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-4a8737c4305so2751673e0c.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698843115; x=1699447915; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3o84LhG/JDs4XT09LqOqAL557WR+kTbV5Toac0tgZE=;
        b=1u+MPRrVQxrsEluMWXPCPrukAvC0nBfV1OqMow088+HHpeOockSErGTQmgeNLpZbrJ
         XABCUG+bWKJnNka/hL/M2kHZ5DgH9VhVg2IAkP7gWDCIr0u2qIOKLFm8AasP09g3n0hr
         +oVCTN2cIWvpy5xFrPYybXarURIwahvsYQB6z76s3fiS/ocBfExMt86HX3G4wLhiGBkl
         V7UvBWu6pXWT+e5wV/sojveZkajthhq7kGhFL4KesrZVdASWGmSV9UNOtX5CS2pgHazZ
         nVrE82VVvXXd9SHJ4s2lcn1mPDI9ZZdGy7Z3i6eTcuggy1M8DetFnsMV6RDnLOFBqzfv
         p1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698843115; x=1699447915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3o84LhG/JDs4XT09LqOqAL557WR+kTbV5Toac0tgZE=;
        b=bwLHlrwsbt93DxuHn3dXKOOtZHJyRD1xfY4EiS2dQL2WvhAsfpv5nPDBmD1w59m2An
         T3eveZPAqkYrMUTFKeTwSvWsSaqAjqVXv2wADN8IiOgZO3MDtaCe/bHvvGVsj+QVpFoT
         EQJ1FVS+T4oHT0ql3+G1G4Tij7PR72qbtV/NiPzo4QfwIJqLGDnNiBRORhR3lNHM1vLY
         rglP1z3dxeckEO9ALZzhYX0cP/OknM7vMzoJ8mMNa6LDQu6z6263YM5ud8OIUeiXpYyj
         Sf2GWC65G049c/0dHn7pFNCya1V8Bevg5tiCAUmk657reb1ZRsyVMkHZS9eLkyzeTMhy
         v51Q==
X-Gm-Message-State: AOJu0YxOFC79lxqX8ggZUWr77Sp643olcZ/slIlX30OFA+8d8SKu3QTQ
	dGmzZDxGIxpYkKJu93woFtumup5D34DQ4U53XL6iAw==
X-Google-Smtp-Source: AGHT+IF0GS509bXC109Q/KsllvKKbuNv6izlI+nfo857C1iROxiLKrI4wNuuGIZxmkDtH9Saf2Z2BbskHZJDaldFC6s=
X-Received: by 2002:a1f:9b13:0:b0:4a1:7278:3bf5 with SMTP id
 d19-20020a1f9b13000000b004a172783bf5mr13903007vke.4.1698843115068; Wed, 01
 Nov 2023 05:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-6-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-6-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 1 Nov 2023 12:51:19 +0000
Message-ID: <CA+EHjTxq9zBY02bqsThV5+afLY1mGXyfs+X1yiKL0kM8SSz_Ug@mail.gmail.com>
Subject: Re: [PATCH v13 05/35] KVM: PPC: Drop dead code related to KVM_ARCH_WANT_MMU_NOTIFIER
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
> Assert that both KVM_ARCH_WANT_MMU_NOTIFIER and CONFIG_MMU_NOTIFIER are
> defined when KVM is enabled, and return '1' unconditionally for the
> CONFIG_KVM_BOOK3S_HV_POSSIBLE=3Dn path.  All flavors of PPC support for K=
VM
> select MMU_NOTIFIER, and KVM_ARCH_WANT_MMU_NOTIFIER is unconditionally
> defined by arch/powerpc/include/asm/kvm_host.h.
>
> Effectively dropping use of KVM_ARCH_WANT_MMU_NOTIFIER will simplify a
> future cleanup to turn KVM_ARCH_WANT_MMU_NOTIFIER into a Kconfig, i.e.
> will allow combining all of the
>
>   #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
>
> checks into a single
>
>   #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
>
> without having to worry about PPC's "bare" usage of
> KVM_ARCH_WANT_MMU_NOTIFIER.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/powerpc/kvm/powerpc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 7197c8256668..b0a512ede764 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -632,12 +632,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, l=
ong ext)
>                 break;
>  #endif
>         case KVM_CAP_SYNC_MMU:
> +#if !defined(CONFIG_MMU_NOTIFIER) || !defined(KVM_ARCH_WANT_MMU_NOTIFIER=
)
> +               BUILD_BUG();
> +#endif
>  #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>                 r =3D hv_enabled;
> -#elif defined(KVM_ARCH_WANT_MMU_NOTIFIER)
> -               r =3D 1;
>  #else
> -               r =3D 0;
> +               r =3D 1;
>  #endif
>                 break;
>  #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> --
> 2.42.0.820.g83a721a137-goog
>
