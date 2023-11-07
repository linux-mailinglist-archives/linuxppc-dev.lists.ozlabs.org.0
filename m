Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5597A7E41F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 15:40:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=d1RFG6mI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPrVG1wYJz3cWY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 01:40:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=d1RFG6mI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPrTM70PPz307y
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Nov 2023 01:39:35 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-66d0f945893so47139866d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Nov 2023 06:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699367972; x=1699972772; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yWUxtco4+SHtMfDkrQFL/rv2xiDn8sNB7VvrAl+j00=;
        b=d1RFG6mIxpjUOEws9X3casQKDcRHYOcYPcpXKBxzNrcsZ/t3n2QOdH8HlZJS0W7Fik
         sWCSyPEQojkNdlaQ2y3dUV5Euf0nQoggMTpM3o27hRybn8gpA49MgWllt8BX2k1ZhCVT
         /sjDip/KS2Cx6bzG1wag3cyXO3c76MSQ8cfoptMhesHVhwJCZGDS33+WxJFQJEZo3T9u
         fmrC8mQ+jek2nxVCYx+dCuYNH8zXaqIjjQN/v5qQZjUzz9iL7HEca8GJbfytIezzOV0y
         SlRxIiXSwHuxrTZwKXD4KqK7bNpWKlxkqR4KoxRLSW8R5tcKNQs/GuQiih8DyJXehHAn
         Lp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699367972; x=1699972772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yWUxtco4+SHtMfDkrQFL/rv2xiDn8sNB7VvrAl+j00=;
        b=DWzvtMLS+y2gYU0k4Skg5/KgmSbaZeLrt1kQo/VPwG+gwK52ZJIQTvNzDGnm5VGIr4
         8f1T00X/0oer6UOPZn5qvJeYOosDMZIMBl9enfjsU4ZaypUF/D4prqNebHXQsUaTLAVh
         HwOGceddzVW9FYjOct3kLSvhgHJirFvFZwnuneg6Fbn3Z94MRL2p9jExGF3//CmfFIt+
         n84c3fY1hFQv0GJOSjZXNTd9UY0d12vOLM1VE5Ydr+L4kxXy2gBrkXQn3TyfxoBu+2Bf
         gRqAFwixclnzY21pVVBagzkv3WURHoJjqq4r0Gj7E/h5zwJ5Y3yUDK9FkhBxLSxaFh7P
         bAsw==
X-Gm-Message-State: AOJu0YyNsB2xmmk6WR7QAPAeKcCXVXMdhWhTBq/XD2EDjuXo6Bla/AUu
	/NSYM0cg6id23O/Ns+A5K5TH8j9Hm/WWXWfrvRSUEg==
X-Google-Smtp-Source: AGHT+IENouhYwfq0zksB9smEGLB+VMdhNNrCcscvQWBkeUX0Zkluj03/Xo1edckn4e3jUv+DeKenqbsHwG9y+w7RhbQ=
X-Received: by 2002:a05:6214:5297:b0:66f:abb4:49ff with SMTP id
 kj23-20020a056214529700b0066fabb449ffmr3397127qvb.7.1699367972171; Tue, 07
 Nov 2023 06:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-34-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-34-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 7 Nov 2023 14:38:55 +0000
Message-ID: <CA+EHjTw4C-3E+V0WsC68DtKRjqCt+d7M=q3STM48fKHiy4GvSw@mail.gmail.com>
Subject: Re: [PATCH 33/34] KVM: selftests: Test KVM exit behavior for private memory/access
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

On Sun, Nov 5, 2023 at 4:35=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> "Testing private access when memslot gets deleted" tests the behavior
> of KVM when a private memslot gets deleted while the VM is using the
> private memslot. When KVM looks up the deleted (slot =3D NULL) memslot,
> KVM should exit to userspace with KVM_EXIT_MEMORY_FAULT.
>
> In the second test, upon a private access to non-private memslot, KVM
> should also exit to userspace with KVM_EXIT_MEMORY_FAULT.

nit: The commit message is referring to private memslots, which might
need rewording with the latest changes in v14.

> Intentionally don't take a requirement on KVM_CAP_GUEST_MEMFD,
> KVM_CAP_MEMORY_FAULT_INFO, KVM_MEMORY_ATTRIBUTE_PRIVATE, etc., as it's a
> KVM bug to advertise KVM_X86_SW_PROTECTED_VM without its prerequisites.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> [sean: call out the similarities with set_memory_region_test]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-36-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tools/testing/selftests/kvm/Makefile          |   1 +
>  .../kvm/x86_64/private_mem_kvm_exits_test.c   | 120 ++++++++++++++++++
>  2 files changed, 121 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_kvm_ex=
its_test.c
>
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftes=
ts/kvm/Makefile
> index fd3b30a4ca7b..69ce8e06b3a3 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -92,6 +92,7 @@ TEST_GEN_PROGS_x86_64 +=3D x86_64/nested_exceptions_tes=
t
>  TEST_GEN_PROGS_x86_64 +=3D x86_64/platform_info_test
>  TEST_GEN_PROGS_x86_64 +=3D x86_64/pmu_event_filter_test
>  TEST_GEN_PROGS_x86_64 +=3D x86_64/private_mem_conversions_test
> +TEST_GEN_PROGS_x86_64 +=3D x86_64/private_mem_kvm_exits_test
>  TEST_GEN_PROGS_x86_64 +=3D x86_64/set_boot_cpu_id
>  TEST_GEN_PROGS_x86_64 +=3D x86_64/set_sregs_test
>  TEST_GEN_PROGS_x86_64 +=3D x86_64/smaller_maxphyaddr_emulation_test
> diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_tes=
t.c b/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
> new file mode 100644
> index 000000000000..2f02f6128482
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022, Google LLC.

nit: 2023

Nits aside:
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad




> + */
> +#include <linux/kvm.h>
> +#include <pthread.h>
> +#include <stdint.h>
> +
> +#include "kvm_util.h"
> +#include "processor.h"
> +#include "test_util.h"
> +
> +/* Arbitrarily selected to avoid overlaps with anything else */
> +#define EXITS_TEST_GVA 0xc0000000
> +#define EXITS_TEST_GPA EXITS_TEST_GVA
> +#define EXITS_TEST_NPAGES 1
> +#define EXITS_TEST_SIZE (EXITS_TEST_NPAGES * PAGE_SIZE)
> +#define EXITS_TEST_SLOT 10
> +
> +static uint64_t guest_repeatedly_read(void)
> +{
> +       volatile uint64_t value;
> +
> +       while (true)
> +               value =3D *((uint64_t *) EXITS_TEST_GVA);
> +
> +       return value;
> +}
> +
> +static uint32_t run_vcpu_get_exit_reason(struct kvm_vcpu *vcpu)
> +{
> +       int r;
> +
> +       r =3D _vcpu_run(vcpu);
> +       if (r) {
> +               TEST_ASSERT(errno =3D=3D EFAULT, KVM_IOCTL_ERROR(KVM_RUN,=
 r));
> +               TEST_ASSERT_EQ(vcpu->run->exit_reason, KVM_EXIT_MEMORY_FA=
ULT);
> +       }
> +       return vcpu->run->exit_reason;
> +}
> +
> +const struct vm_shape protected_vm_shape =3D {
> +       .mode =3D VM_MODE_DEFAULT,
> +       .type =3D KVM_X86_SW_PROTECTED_VM,
> +};
> +
> +static void test_private_access_memslot_deleted(void)
> +{
> +       struct kvm_vm *vm;
> +       struct kvm_vcpu *vcpu;
> +       pthread_t vm_thread;
> +       void *thread_return;
> +       uint32_t exit_reason;
> +
> +       vm =3D vm_create_shape_with_one_vcpu(protected_vm_shape, &vcpu,
> +                                          guest_repeatedly_read);
> +
> +       vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
> +                                   EXITS_TEST_GPA, EXITS_TEST_SLOT,
> +                                   EXITS_TEST_NPAGES,
> +                                   KVM_MEM_GUEST_MEMFD);
> +
> +       virt_map(vm, EXITS_TEST_GVA, EXITS_TEST_GPA, EXITS_TEST_NPAGES);
> +
> +       /* Request to access page privately */
> +       vm_mem_set_private(vm, EXITS_TEST_GPA, EXITS_TEST_SIZE);
> +
> +       pthread_create(&vm_thread, NULL,
> +                      (void *(*)(void *))run_vcpu_get_exit_reason,
> +                      (void *)vcpu);
> +
> +       vm_mem_region_delete(vm, EXITS_TEST_SLOT);
> +
> +       pthread_join(vm_thread, &thread_return);
> +       exit_reason =3D (uint32_t)(uint64_t)thread_return;
> +
> +       TEST_ASSERT_EQ(exit_reason, KVM_EXIT_MEMORY_FAULT);
> +       TEST_ASSERT_EQ(vcpu->run->memory_fault.flags, KVM_MEMORY_EXIT_FLA=
G_PRIVATE);
> +       TEST_ASSERT_EQ(vcpu->run->memory_fault.gpa, EXITS_TEST_GPA);
> +       TEST_ASSERT_EQ(vcpu->run->memory_fault.size, EXITS_TEST_SIZE);
> +
> +       kvm_vm_free(vm);
> +}
> +
> +static void test_private_access_memslot_not_private(void)
> +{
> +       struct kvm_vm *vm;
> +       struct kvm_vcpu *vcpu;
> +       uint32_t exit_reason;
> +
> +       vm =3D vm_create_shape_with_one_vcpu(protected_vm_shape, &vcpu,
> +                                          guest_repeatedly_read);
> +
> +       /* Add a non-private memslot (flags =3D 0) */
> +       vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
> +                                   EXITS_TEST_GPA, EXITS_TEST_SLOT,
> +                                   EXITS_TEST_NPAGES, 0);
> +
> +       virt_map(vm, EXITS_TEST_GVA, EXITS_TEST_GPA, EXITS_TEST_NPAGES);
> +
> +       /* Request to access page privately */
> +       vm_mem_set_private(vm, EXITS_TEST_GPA, EXITS_TEST_SIZE);
> +
> +       exit_reason =3D run_vcpu_get_exit_reason(vcpu);
> +
> +       TEST_ASSERT_EQ(exit_reason, KVM_EXIT_MEMORY_FAULT);
> +       TEST_ASSERT_EQ(vcpu->run->memory_fault.flags, KVM_MEMORY_EXIT_FLA=
G_PRIVATE);
> +       TEST_ASSERT_EQ(vcpu->run->memory_fault.gpa, EXITS_TEST_GPA);
> +       TEST_ASSERT_EQ(vcpu->run->memory_fault.size, EXITS_TEST_SIZE);
> +
> +       kvm_vm_free(vm);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +       TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PRO=
TECTED_VM));
> +
> +       test_private_access_memslot_deleted();
> +       test_private_access_memslot_not_private();
> +}
> --
> 2.39.1
>
>
