Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 799387E3F50
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 13:55:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1jUCN1tq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPp9N2n7Mz3cNQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 23:55:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1jUCN1tq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPp8X3XvNz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 23:54:51 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-67131800219so38590416d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Nov 2023 04:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699361687; x=1699966487; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuFbqjfsVCp34XchBGKV0CWjcihho4T2q4FA5kjS7eU=;
        b=1jUCN1tqmLwlkXM0IeWT0amOyDit022icDotDLW7cW1sJNnSGbawweYUGOeMgjNp02
         BiHnMjn7dAhN2qocKEKL8rFt7bMsQJ+CJxO7VMKJ8LopASlDLAHasIqdsfNaeaCT4uJ1
         ZMc/WPjQjLr9OGcj7IEjGZq4U83gREHenOluXvKp41hksEbeXDAKGMZJv6pmP87uLYkr
         ZVMjK4WfhALNcN9cEvV8l+pcrD4RJm0dv6QZcrnRk/NNHUwKcdRzvnBpkb9IcEvTcDsN
         JX0m9cN/ztIl/Acbs18CtM9CqRb6yYok3H+4wEN//0va58J3PXAs1HBkdWhbgrRTJG6u
         ke9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699361687; x=1699966487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuFbqjfsVCp34XchBGKV0CWjcihho4T2q4FA5kjS7eU=;
        b=Vh7i8KoYcUesajawOEVGEak25TqU//LrHI5bHN+pdIkQiY7HkGK51oE68ozyAqGczZ
         vZwo3Fz18G90XO4IllGO11Ztz6qPqexc0gq0RJ6J83tW9Lazcyz3eTL4DHoBhnP6TWIS
         EO2E/jDNyutFSBxwuIbitAs20ZPp87Jp9Dxt41FR5MjVdPjeXDnHDOtK3Z1obi5ScG3n
         y3aNlZHL4CDYiPWdXkWGILGKi669IGPeHpIrbAYKxBQTUoettmDdNEOzGgftckbzeMZl
         eInwioUXAADCBrPrMmhmyeuE7xufrjabNdFBsa28UskU/fyQJvSNXXlZ1g+Qo9Qy8GnM
         4Juw==
X-Gm-Message-State: AOJu0Yziswe7ZhGml/+z896L3WJtGgTKOhUn3/zSyubWzzi7aalcJt3A
	dLoa1gJ6lJVdvNS9mS5BV/YYg0adzUyLiwrjvuNjmg==
X-Google-Smtp-Source: AGHT+IHS9JUkEkC/BybEMf4UmdGXo/DmXLNK4bOT/jrKIAqRMkLyM4gXD6uMK1OzLS09666PL8dXekXtndn5vIwFZqQ=
X-Received: by 2002:a05:6214:260c:b0:66f:bb36:9a51 with SMTP id
 gu12-20020a056214260c00b0066fbb369a51mr33614248qvb.36.1699361687221; Tue, 07
 Nov 2023 04:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-31-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-31-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 7 Nov 2023 12:54:10 +0000
Message-ID: <CA+EHjTyZoLLv1nRfCEY4nHrbHadphn37jw3OPS17x1dAm_YUxA@mail.gmail.com>
Subject: Re: [PATCH 30/34] KVM: selftests: Add KVM_SET_USER_MEMORY_REGION2 helper
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

On Sun, Nov 5, 2023 at 4:34=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> From: Chao Peng <chao.p.peng@linux.intel.com>
>
> Add helpers to invoke KVM_SET_USER_MEMORY_REGION2 directly so that tests
> can validate of features that are unique to "version 2" of "set user
> memory region", e.g. do negative testing on gmem_fd and gmem_offset.
>
> Provide a raw version as well as an assert-success version to reduce
> the amount of boilerplate code need for basic usage.
>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-33-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  .../selftests/kvm/include/kvm_util_base.h     |  7 +++++
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 29 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/=
testing/selftests/kvm/include/kvm_util_base.h
> index 157508c071f3..8ec122f5fcc8 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -522,6 +522,13 @@ void vm_set_user_memory_region(struct kvm_vm *vm, ui=
nt32_t slot, uint32_t flags,
>                                uint64_t gpa, uint64_t size, void *hva);
>  int __vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32=
_t flags,
>                                 uint64_t gpa, uint64_t size, void *hva);
> +void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32=
_t flags,
> +                               uint64_t gpa, uint64_t size, void *hva,
> +                               uint32_t guest_memfd, uint64_t guest_memf=
d_offset);
> +int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint3=
2_t flags,
> +                                uint64_t gpa, uint64_t size, void *hva,
> +                                uint32_t guest_memfd, uint64_t guest_mem=
fd_offset);
> +
>  void vm_userspace_mem_region_add(struct kvm_vm *vm,
>         enum vm_mem_backing_src_type src_type,
>         uint64_t guest_paddr, uint32_t slot, uint64_t npages,
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/s=
elftests/kvm/lib/kvm_util.c
> index 1c74310f1d44..d05d95cc3693 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -873,6 +873,35 @@ void vm_set_user_memory_region(struct kvm_vm *vm, ui=
nt32_t slot, uint32_t flags,
>                     errno, strerror(errno));
>  }
>
> +int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint3=
2_t flags,
> +                                uint64_t gpa, uint64_t size, void *hva,
> +                                uint32_t guest_memfd, uint64_t guest_mem=
fd_offset)
> +{
> +       struct kvm_userspace_memory_region2 region =3D {
> +               .slot =3D slot,
> +               .flags =3D flags,
> +               .guest_phys_addr =3D gpa,
> +               .memory_size =3D size,
> +               .userspace_addr =3D (uintptr_t)hva,
> +               .guest_memfd =3D guest_memfd,
> +               .guest_memfd_offset =3D guest_memfd_offset,
> +       };
> +
> +       return ioctl(vm->fd, KVM_SET_USER_MEMORY_REGION2, &region);
> +}
> +
> +void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32=
_t flags,
> +                               uint64_t gpa, uint64_t size, void *hva,
> +                               uint32_t guest_memfd, uint64_t guest_memf=
d_offset)
> +{
> +       int ret =3D __vm_set_user_memory_region2(vm, slot, flags, gpa, si=
ze, hva,
> +                                              guest_memfd, guest_memfd_o=
ffset);
> +
> +       TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed, errno =3D =
%d (%s)",
> +                   errno, strerror(errno));
> +}
> +
> +
>  /* FIXME: This thing needs to be ripped apart and rewritten. */
>  void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type=
,
>                 uint64_t guest_paddr, uint32_t slot, uint64_t npages,
> --
> 2.39.1
>
>
