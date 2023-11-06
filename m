Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD7A7E1F51
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 12:05:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lIOoiLGW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP7nD3ml7z3cDk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 22:05:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lIOoiLGW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP7kx0sDdz3cmw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 22:03:52 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-66d134a019cso30970496d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 03:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699268628; x=1699873428; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ8TONDIpPhmTy6Gjm0dgeV6egeVVxfnh06xkrQleLY=;
        b=lIOoiLGW66Zn7koy4/kIsyiDdgJzZBTDMby3wnROjMxaSj9RAHW48NaKJYBy6ATbuS
         leya+HKxzLKeHySAsfwBjpPYuI3QAX2XaVpvVBuBnl7eYPRb4+5WugcgA/GVWI+LeLa3
         jZgCK9x/v//zwVssHMFZBGLtPC1P+f+QS/Abld6qoUyGwHQifMiOzM2y7aKA91NCEOmy
         6IYgfWDFf7QzjAxQcwQlwYSSvG2bYq+Ebj0h2TqrPn1XIUiXQ6eUDE6eG826O++XbT9X
         wNIA/TY6qCyMlaTTiw6337mkp0/yLpm3x1WbhTROALSdP6MoYuGEP2ImCaz13gnXiZU7
         64xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268628; x=1699873428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQ8TONDIpPhmTy6Gjm0dgeV6egeVVxfnh06xkrQleLY=;
        b=uBVgAP+Kz7DThy0DtdYwBWjn1grZlpiJymiMeKdPUiPXs6eBf3iHAA3kzeHyTnQwoO
         diX/NSNs9wl5zK5gjOhyYwClFQc8OalHWzht4dosnXAt0s1oT1Lai6E8DzGw39Dz/09W
         eLdxCwCABJ5te7MbwIvidN7Sq0AfBO52J+qHONgLEmQBaZ5rzRsDj2mxIkYxzFtzXNgC
         2RlvWcJW/IXYqGe8BM0Vup/wMkNUTon0D28Nvpw93QntQt/NdKkeKQd68idivLYVdThf
         fexAlDjyN9QlbSwSZdRR4Vord2Sz1tW2B3Hb4ehvQlHmaE31AvcUYZaHPlHsIVhlANCd
         oJFw==
X-Gm-Message-State: AOJu0Yw+MjUD37F7j0DH2N8BApxIIAu/rknT/W9l95XECa7eEjiRv33u
	ostOrYHRAjnE0s6fDim0rnRTiBbaGpgy5uWxMgul9g==
X-Google-Smtp-Source: AGHT+IHHh4fCnCxDMnJOn7/R0pkHJKwXr6C+d2r8s0u73YKLv4MHtUig5I9yHuaqDmXCQ/Y0QVlMeO42z9uduKCvqDI=
X-Received: by 2002:a0c:f1ca:0:b0:66d:28a5:d153 with SMTP id
 u10-20020a0cf1ca000000b0066d28a5d153mr26974988qvl.47.1699268628158; Mon, 06
 Nov 2023 03:03:48 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-24-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-24-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:03:12 +0000
Message-ID: <CA+EHjTw1RGEKD6Zv_QEtzTLLA4STTQrS4WYCY-HUdScAKXfBGg@mail.gmail.com>
Subject: Re: [PATCH 23/34] KVM: selftests: Convert lib's mem regions to KVM_SET_USER_MEMORY_REGION2
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
> Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so tha=
t
> support for guest private memory can be added without needing an entirely
> separate set of helpers.
>
> Note, this obviously makes selftests backwards-incompatible with older KV=
M
> versions from this point forward.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-26-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  .../selftests/kvm/include/kvm_util_base.h     |  2 +-
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 19 ++++++++++---------
>  2 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/=
testing/selftests/kvm/include/kvm_util_base.h
> index 967eaaeacd75..9f144841c2ee 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -44,7 +44,7 @@ typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest)=
 physical address */
>  typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address =
*/
>
>  struct userspace_mem_region {
> -       struct kvm_userspace_memory_region region;
> +       struct kvm_userspace_memory_region2 region;
>         struct sparsebit *unused_phy_pages;
>         int fd;
>         off_t offset;
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/s=
elftests/kvm/lib/kvm_util.c
> index f09295d56c23..3676b37bea38 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -453,8 +453,9 @@ void kvm_vm_restart(struct kvm_vm *vmp)
>                 vm_create_irqchip(vmp);
>
>         hash_for_each(vmp->regions.slot_hash, ctr, region, slot_node) {
> -               int ret =3D ioctl(vmp->fd, KVM_SET_USER_MEMORY_REGION, &r=
egion->region);
> -               TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION IOC=
TL failed,\n"
> +               int ret =3D ioctl(vmp->fd, KVM_SET_USER_MEMORY_REGION2, &=
region->region);
> +
> +               TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION2 IO=
CTL failed,\n"
>                             "  rc: %i errno: %i\n"
>                             "  slot: %u flags: 0x%x\n"
>                             "  guest_phys_addr: 0x%llx size: 0x%llx",
> @@ -657,7 +658,7 @@ static void __vm_mem_region_delete(struct kvm_vm *vm,
>         }
>
>         region->region.memory_size =3D 0;
> -       vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->region);
> +       vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
>
>         sparsebit_free(&region->unused_phy_pages);
>         ret =3D munmap(region->mmap_start, region->mmap_size);
> @@ -1014,8 +1015,8 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>         region->region.guest_phys_addr =3D guest_paddr;
>         region->region.memory_size =3D npages * vm->page_size;
>         region->region.userspace_addr =3D (uintptr_t) region->host_mem;
> -       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->regio=
n);
> -       TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION IOCTL faile=
d,\n"
> +       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->regi=
on);
> +       TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL fail=
ed,\n"
>                 "  rc: %i errno: %i\n"
>                 "  slot: %u flags: 0x%x\n"
>                 "  guest_phys_addr: 0x%lx size: 0x%lx",
> @@ -1097,9 +1098,9 @@ void vm_mem_region_set_flags(struct kvm_vm *vm, uin=
t32_t slot, uint32_t flags)
>
>         region->region.flags =3D flags;
>
> -       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->regio=
n);
> +       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->regi=
on);
>
> -       TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION IOCTL faile=
d,\n"
> +       TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL fail=
ed,\n"
>                 "  rc: %i errno: %i slot: %u flags: 0x%x",
>                 ret, errno, slot, flags);
>  }
> @@ -1127,9 +1128,9 @@ void vm_mem_region_move(struct kvm_vm *vm, uint32_t=
 slot, uint64_t new_gpa)
>
>         region->region.guest_phys_addr =3D new_gpa;
>
> -       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->regio=
n);
> +       ret =3D __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->regi=
on);
>
> -       TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION failed\n"
> +       TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed\n"
>                     "ret: %i errno: %i slot: %u new_gpa: 0x%lx",
>                     ret, errno, slot, new_gpa);
>  }
> --
> 2.39.1
>
>
