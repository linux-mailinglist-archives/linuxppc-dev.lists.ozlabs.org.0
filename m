Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 099487DF47E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 15:03:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Q08cb9XB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLlvb6sp6z3cW3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 01:03:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Q08cb9XB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLlth2pbXz2xYt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 01:02:19 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7781bc3783fso57933985a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 07:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698933735; x=1699538535; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U02Q7Uz9N3AbuVAnly2/lx/zX8zq9jlSHWgyTKq7w1o=;
        b=Q08cb9XBplC+AVmRNr9xkA6JBAtF8xfd4VVN3BElW35Di6M71olJ+fu8eYFCYQT9wx
         c1IRyXc3BnQNf3smdnBiINB9mQaMN/MgSckyqbkSJrUdITT3ONZ7cqLdCPzRZkdjjYh9
         na+r8xhH4qMN7BZL/V0mStOeWFjdSNv9ZbjFw01Qtt45jozbWLaSMp6euM/Ii15C/mGU
         X4NpP5Ba4Iak+2GHFB8ArkdPY0Ae3Apb7L1wgEQ0aJopQes3CUOekg72pJkemhrNn/ZB
         Wn7kb+OwXnzKglqAcwVF0NgM8e2MkCK5wz2G3Qmk47jDJIw2/5zTjhR0Sp67nkxLfWZZ
         PoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933735; x=1699538535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U02Q7Uz9N3AbuVAnly2/lx/zX8zq9jlSHWgyTKq7w1o=;
        b=fJEeZp4dDpPt3u8GPMcqxupQfSM5+sYbanL1OhtuLJb5QBzPPHNWn0No4O7m25KaVh
         wFRqKBl0X1pi2zLxsHLjiOvRf5ztR2GrW9XXLEkuPCEtMNUTaLzTsTKm0FP5/BB4W8db
         /UlDawTo2soxM60M0/Md9YCHH6Vo6HTvuIEiQlSSLrhqJop+e7gVIb41QnHuwJgfGzbF
         BCsddIokw4oo7bgWsF+qZ1S3bToLNlGd0O99JznmlrsQH1pSk3qU74V7VKLw0fwAeuzM
         WxjnBP1DhHeLAq5xfmSbECmxBfWOQ8UZtf64oMeGXnYsOxbDQtLZkNmrGkMC+A1Fj4KF
         3G3Q==
X-Gm-Message-State: AOJu0YyHtufkskMN0Ke5ZdKiolARCIYL/+PyHpwUdAKtoQd2n1epuBzy
	VUjFKIt8o+SRE4rj6/G5YOWFIyy9JFM9qy7ibbfm3Q==
X-Google-Smtp-Source: AGHT+IFvNZeWhAvz2uQajFEXI2VcBpwz2QgnpWebvg+MWTN/rWHt/IyUj1LF075258r9rR5adzICFKMJ4AWj6dfus40=
X-Received: by 2002:ad4:5c47:0:b0:66d:62b7:53f4 with SMTP id
 a7-20020ad45c47000000b0066d62b753f4mr28124932qva.45.1698933735448; Thu, 02
 Nov 2023 07:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-13-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-13-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 14:01:39 +0000
Message-ID: <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com>
Subject: Re: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
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

Hi,

On Fri, Oct 27, 2023 at 7:22=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Add flags to "struct kvm_gfn_range" to let notifier events target only
> shared and only private mappings, and write up the existing mmu_notifier
> events to be shared-only (private memory is never associated with a
> userspace virtual address, i.e. can't be reached via mmu_notifiers).
>
> Add two flags so that KVM can handle the three possibilities (shared,
> private, and shared+private) without needing something like a tri-state
> enum.
>
> Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  include/linux/kvm_host.h | 2 ++
>  virt/kvm/kvm_main.c      | 7 +++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 96aa930536b1..89c1a991a3b8 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -263,6 +263,8 @@ struct kvm_gfn_range {
>         gfn_t start;
>         gfn_t end;
>         union kvm_mmu_notifier_arg arg;
> +       bool only_private;
> +       bool only_shared;

If these flags aren't used in this patch series, should this patch be
moved to the other series?

Also, if shared+private is a possibility, doesn't the prefix "only_"
confuse things a bit? I.e., what is shared+private, is it when both
are 0 or when both are 1? I assume it's the former (both are 0), but
it might be clearer.

Cheers,
/fuad

>         bool may_block;
>  };
>  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index cb9376833c18..302ccb87b4c1 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -635,6 +635,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva=
_range(struct kvm *kvm,
>                          * the second or later invocation of the handler)=
.
>                          */
>                         gfn_range.arg =3D range->arg;
> +
> +                       /*
> +                        * HVA-based notifications aren't relevant to pri=
vate
> +                        * mappings as they don't have a userspace mappin=
g.
> +                        */
> +                       gfn_range.only_private =3D false;
> +                       gfn_range.only_shared =3D true;
>                         gfn_range.may_block =3D range->may_block;
>
>                         /*
> --
> 2.42.0.820.g83a721a137-goog
>
