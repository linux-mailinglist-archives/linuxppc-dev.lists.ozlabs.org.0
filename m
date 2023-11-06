Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89E27E1F43
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 12:05:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xyJODhLZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP7mJ5X9qz3cRn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 22:05:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xyJODhLZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP7kJ1chMz3cNk
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 22:03:20 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-66d190a8f87so28322506d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 03:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699268596; x=1699873396; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KU+b2mECXXvQ5slHB7/YEPM4eq1YPpk0J5Rl/yZ7AP8=;
        b=xyJODhLZIU1dcemiz9C+Sc+U7FoDTTJX7BRlZYfOtDG6iQGHc/q/yeCpM3KnkH/GoZ
         gt09FDcNCBbyuomRL45XYUSHFGuqhMHwln2OwO+y+adn/kiexpY6QKZ9wpPJ+hYzjBzl
         EuaaApRK68ALi5Qho+7U2LGILdH6wAyQT+j1xd31T7ktaivywGpZ1VK6V7NpD3Jqb8iM
         IMJJcWBREoYt+T0RqCIN4hI59fPB592gl8AuANEXhmYtBxseNVaDtOknpHJRNmNWS3/b
         9e1/p3ovQO4CaGAo1PMyagdVU6G+F7tIDmR3RPsYLBTwQetJDx/Vlt2/xWe/7xP8d5lS
         VIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268596; x=1699873396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU+b2mECXXvQ5slHB7/YEPM4eq1YPpk0J5Rl/yZ7AP8=;
        b=qDcLnrpuqCGRXt3fsgS+YQNgBebHro3DSWOA5yYOP7h+gCI+1IlsJhqCfM652BkO5q
         t9EQKIMSTtW/HYTGqFbMgOmD9ZI9VtHDStRG50L5d64hy0YjjDiiZTZMghUMSUbhL+wW
         ZQ+ZOmQ1a2dZDPN1wPRBq27nx/q9etaKFPW5f6nWLZ4Co5dwwzykZmiX4NwRRZ1IreLI
         xs6ik0ScfHipVwE1pn1F+0nPHK6N+JrYp0SmbUidUCyroEYdqdMixjHYM3t3n4H6s55e
         g8nNamNIaXFzu8qbdej/Y78ZgQBkl8hmjLhEw+W03AWaWjtJIEJMkQI1gPCqjdJhS5qN
         XEZA==
X-Gm-Message-State: AOJu0Yx2Jf7hIgJqFSold1XHN9fC5yStasfDJCdbsjBKwEUTmA9Z8+M8
	K7hlEcmfL+7+BiiFQjThlpG9jwQHo2id9M+wHwsDtA==
X-Google-Smtp-Source: AGHT+IH064K0ZtIRC0Ddcf2wpRdR9qcn5N+rpiGlH1rS/nMIj84KwquVAyvAa55WjBkBZ58J/DOu2Zh9h49soweI3jk=
X-Received: by 2002:a05:6214:2582:b0:671:3493:61e8 with SMTP id
 fq2-20020a056214258200b00671349361e8mr28685929qvb.26.1699268596310; Mon, 06
 Nov 2023 03:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-23-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-23-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:02:40 +0000
Message-ID: <CA+EHjTwB-jssz7+8ZiLgXdQREp8U3r3tYN2NOH28g54=QNdQmg@mail.gmail.com>
Subject: Re: [PATCH 22/34] KVM: selftests: Drop unused kvm_userspace_memory_region_find()
 helper
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Sean Christopherson <seanjc@goog
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 5, 2023 at 4:33=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Drop kvm_userspace_memory_region_find(), it's unused and a terrible API
> (probably why it's unused).  If anything outside of kvm_util.c needs to
> get at the memslot, userspace_mem_region_find() can be exposed to give
> others full access to all memory region/slot information.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-25-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  .../selftests/kvm/include/kvm_util_base.h     |  4 ---
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 29 -------------------
>  2 files changed, 33 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/=
testing/selftests/kvm/include/kvm_util_base.h
> index a18db6a7b3cf..967eaaeacd75 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -776,10 +776,6 @@ vm_adjust_num_guest_pages(enum vm_guest_mode mode, u=
nsigned int num_guest_pages)
>         return n;
>  }
>
> -struct kvm_userspace_memory_region *
> -kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
> -                                uint64_t end);
> -
>  #define sync_global_to_guest(vm, g) ({                         \
>         typeof(g) *_p =3D addr_gva2hva(vm, (vm_vaddr_t)&(g));     \
>         memcpy(_p, &(g), sizeof(g));                            \
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/s=
elftests/kvm/lib/kvm_util.c
> index 7a8af1821f5d..f09295d56c23 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -590,35 +590,6 @@ userspace_mem_region_find(struct kvm_vm *vm, uint64_=
t start, uint64_t end)
>         return NULL;
>  }
>
> -/*
> - * KVM Userspace Memory Region Find
> - *
> - * Input Args:
> - *   vm - Virtual Machine
> - *   start - Starting VM physical address
> - *   end - Ending VM physical address, inclusive.
> - *
> - * Output Args: None
> - *
> - * Return:
> - *   Pointer to overlapping region, NULL if no such region.
> - *
> - * Public interface to userspace_mem_region_find. Allows tests to look u=
p
> - * the memslot datastructure for a given range of guest physical memory.
> - */
> -struct kvm_userspace_memory_region *
> -kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
> -                                uint64_t end)
> -{
> -       struct userspace_mem_region *region;
> -
> -       region =3D userspace_mem_region_find(vm, start, end);
> -       if (!region)
> -               return NULL;
> -
> -       return &region->region;
> -}
> -
>  __weak void vcpu_arch_free(struct kvm_vcpu *vcpu)
>  {
>
> --
> 2.39.1
>
>
