Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D3D7E208B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 12:56:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ORzMniwY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP8vB5RDPz3cRs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 22:56:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ORzMniwY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP8tM1CkYz2xLN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 22:55:22 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-66d0ea3e5b8so28921526d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 03:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699271718; x=1699876518; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8NELU8K0U+724gQqgT5wy1Wri3ftccwsyaGDd96txU=;
        b=ORzMniwYaKWMZsQfnSaZGMraw8Ce2UDFG4I0+k5S5sk0nJWE2pdapaIX58Ol49yniu
         Gm3qHMwrz/2v1UeNolr2bhOc+kzEGnApVqhV/Wmd4DMUEG+WgrVCT4gkHW/QE3HVEOmK
         9GPcRiBcOYlrrsN+r/MPpKEw6qAU6L/Hj1591CKb0zx9OPSXxZnseCvVbRN5sq48o3xi
         ZwxUQmFnBXQN9PCgzLiFkwMPBmvUwtKI5dxHOO2fZeVg9Yk9loqdjIIgpj5ZNTNNnQ6f
         B0K5ctykDXXeTHYYCuiQD0FQ6QmWYQcO1BoS8Up+pTr3hLH0eyBlbCL4NYh1eyc0rYi3
         EAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699271718; x=1699876518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8NELU8K0U+724gQqgT5wy1Wri3ftccwsyaGDd96txU=;
        b=XVKaWNExcnF6oQ40mqXONpogDC077qI4Ioa0O+6xDzzHfqAbb7jYbYs9FCjjSEUuwt
         sJRbfAOlVOgst5Actsw5zcU4ExPa2IymGtiSxS+TG7Per2JP0flhUjJXX745mKykJyCE
         zC6bqaCIbyGFNQxdOQ15I6aQ5nNm/31CKbJeuVjj+4MYde57ryJkEGgoI2dwXBJc3KPv
         uxF4oawIOuVXjondnumEWG752WTb8kMMaFZop3rAHa6tZGm/6jC+cL5ANeHwehZ/pjdw
         +qGVu8TjkIV1gOtv7+77VVMlGkXnJTH1dgqEU0lPCLHQ2eEzGNGaoZTB910asinT8CK1
         03CQ==
X-Gm-Message-State: AOJu0YyMmQ7TCCijFoStMjJw+ULIqubQ/5YuvEhxEaDCsiMGtDcUpriM
	dAnOHaJp9rpmeIEl02LRT8ajGt9W3WS8V9JYTfefcA==
X-Google-Smtp-Source: AGHT+IHpVKDogqYQTihitTUe1P1EC0BoRtrFXM2LqQxju0Y16TTjwSfxvbJ6Op1XhFBMPQO2JF14bitC65EzLdgz9hY=
X-Received: by 2002:ad4:574b:0:b0:66d:775:d1af with SMTP id
 q11-20020ad4574b000000b0066d0775d1afmr35284081qvx.59.1699271717922; Mon, 06
 Nov 2023 03:55:17 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-28-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-28-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:54:42 +0000
Message-ID: <CA+EHjTxz-e_JKYTtEjjYJTXmpvizRXe8EUbhY2E7bwFjkkHVFw@mail.gmail.com>
Subject: Re: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
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
> From: Sean Christopherson <seanjc@google.com>
>
> Add a "vm_shape" structure to encapsulate the selftests-defined "mode",
> along with the KVM-defined "type" for use when creating a new VM.  "mode"
> tracks physical and virtual address properties, as well as the preferred
> backing memory type, while "type" corresponds to the VM type.
>
> Taking the VM type will allow adding tests for KVM_CREATE_GUEST_MEMFD,
> a.k.a. guest private memory, without needing an entirely separate set of
> helpers.  Guest private memory is effectively usable only by confidential
> VM types, and it's expected that x86 will double down and require unique
> VM types for TDX and SNP guests.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-30-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

nit: as in a prior selftest commit messages, references in the commit
message to guest _private_ memory. Should these be changed to just
guest memory?

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  tools/testing/selftests/kvm/dirty_log_test.c  |  2 +-
>  .../selftests/kvm/include/kvm_util_base.h     | 54 +++++++++++++++----
>  .../selftests/kvm/kvm_page_table_test.c       |  2 +-
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 43 +++++++--------
>  tools/testing/selftests/kvm/lib/memstress.c   |  3 +-
>  .../kvm/x86_64/ucna_injection_test.c          |  2 +-
>  6 files changed, 72 insertions(+), 34 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing=
/selftests/kvm/dirty_log_test.c
> index 936f3a8d1b83..6cbecf499767 100644
> --- a/tools/testing/selftests/kvm/dirty_log_test.c
> +++ b/tools/testing/selftests/kvm/dirty_log_test.c
> @@ -699,7 +699,7 @@ static struct kvm_vm *create_vm(enum vm_guest_mode mo=
de, struct kvm_vcpu **vcpu,
>
>         pr_info("Testing guest mode: %s\n", vm_guest_mode_string(mode));
>
> -       vm =3D __vm_create(mode, 1, extra_mem_pages);
> +       vm =3D __vm_create(VM_SHAPE(mode), 1, extra_mem_pages);
>
>         log_mode_create_vm_done(vm);
>         *vcpu =3D vm_vcpu_add(vm, 0, guest_code);
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/=
testing/selftests/kvm/include/kvm_util_base.h
> index 1441fca6c273..157508c071f3 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -188,6 +188,23 @@ enum vm_guest_mode {
>         NUM_VM_MODES,
>  };
>
> +struct vm_shape {
> +       enum vm_guest_mode mode;
> +       unsigned int type;
> +};
> +
> +#define VM_TYPE_DEFAULT                        0
> +
> +#define VM_SHAPE(__mode)                       \
> +({                                             \
> +       struct vm_shape shape =3D {               \
> +               .mode =3D (__mode),               \
> +               .type =3D VM_TYPE_DEFAULT         \
> +       };                                      \
> +                                               \
> +       shape;                                  \
> +})
> +
>  #if defined(__aarch64__)
>
>  extern enum vm_guest_mode vm_mode_default;
> @@ -220,6 +237,8 @@ extern enum vm_guest_mode vm_mode_default;
>
>  #endif
>
> +#define VM_SHAPE_DEFAULT       VM_SHAPE(VM_MODE_DEFAULT)
> +
>  #define MIN_PAGE_SIZE          (1U << MIN_PAGE_SHIFT)
>  #define PTES_PER_MIN_PAGE      ptes_per_page(MIN_PAGE_SIZE)
>
> @@ -784,21 +803,21 @@ vm_paddr_t vm_alloc_page_table(struct kvm_vm *vm);
>   * __vm_create() does NOT create vCPUs, @nr_runnable_vcpus is used purel=
y to
>   * calculate the amount of memory needed for per-vCPU data, e.g. stacks.
>   */
> -struct kvm_vm *____vm_create(enum vm_guest_mode mode);
> -struct kvm_vm *__vm_create(enum vm_guest_mode mode, uint32_t nr_runnable=
_vcpus,
> +struct kvm_vm *____vm_create(struct vm_shape shape);
> +struct kvm_vm *__vm_create(struct vm_shape shape, uint32_t nr_runnable_v=
cpus,
>                            uint64_t nr_extra_pages);
>
>  static inline struct kvm_vm *vm_create_barebones(void)
>  {
> -       return ____vm_create(VM_MODE_DEFAULT);
> +       return ____vm_create(VM_SHAPE_DEFAULT);
>  }
>
>  static inline struct kvm_vm *vm_create(uint32_t nr_runnable_vcpus)
>  {
> -       return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
> +       return __vm_create(VM_SHAPE_DEFAULT, nr_runnable_vcpus, 0);
>  }
>
> -struct kvm_vm *__vm_create_with_vcpus(enum vm_guest_mode mode, uint32_t =
nr_vcpus,
> +struct kvm_vm *__vm_create_with_vcpus(struct vm_shape shape, uint32_t nr=
_vcpus,
>                                       uint64_t extra_mem_pages,
>                                       void *guest_code, struct kvm_vcpu *=
vcpus[]);
>
> @@ -806,17 +825,27 @@ static inline struct kvm_vm *vm_create_with_vcpus(u=
int32_t nr_vcpus,
>                                                   void *guest_code,
>                                                   struct kvm_vcpu *vcpus[=
])
>  {
> -       return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
> +       return __vm_create_with_vcpus(VM_SHAPE_DEFAULT, nr_vcpus, 0,
>                                       guest_code, vcpus);
>  }
>
> +
> +struct kvm_vm *__vm_create_shape_with_one_vcpu(struct vm_shape shape,
> +                                              struct kvm_vcpu **vcpu,
> +                                              uint64_t extra_mem_pages,
> +                                              void *guest_code);
> +
>  /*
>   * Create a VM with a single vCPU with reasonable defaults and @extra_me=
m_pages
>   * additional pages of guest memory.  Returns the VM and vCPU (via out p=
aram).
>   */
> -struct kvm_vm *__vm_create_with_one_vcpu(struct kvm_vcpu **vcpu,
> -                                        uint64_t extra_mem_pages,
> -                                        void *guest_code);
> +static inline struct kvm_vm *__vm_create_with_one_vcpu(struct kvm_vcpu *=
*vcpu,
> +                                                      uint64_t extra_mem=
_pages,
> +                                                      void *guest_code)
> +{
> +       return __vm_create_shape_with_one_vcpu(VM_SHAPE_DEFAULT, vcpu,
> +                                              extra_mem_pages, guest_cod=
e);
> +}
>
>  static inline struct kvm_vm *vm_create_with_one_vcpu(struct kvm_vcpu **v=
cpu,
>                                                      void *guest_code)
> @@ -824,6 +853,13 @@ static inline struct kvm_vm *vm_create_with_one_vcpu=
(struct kvm_vcpu **vcpu,
>         return __vm_create_with_one_vcpu(vcpu, 0, guest_code);
>  }
>
> +static inline struct kvm_vm *vm_create_shape_with_one_vcpu(struct vm_sha=
pe shape,
> +                                                          struct kvm_vcp=
u **vcpu,
> +                                                          void *guest_co=
de)
> +{
> +       return __vm_create_shape_with_one_vcpu(shape, vcpu, 0, guest_code=
);
> +}
> +
>  struct kvm_vcpu *vm_recreate_with_one_vcpu(struct kvm_vm *vm);
>
>  void kvm_pin_this_task_to_pcpu(uint32_t pcpu);
> diff --git a/tools/testing/selftests/kvm/kvm_page_table_test.c b/tools/te=
sting/selftests/kvm/kvm_page_table_test.c
> index 69f26d80c821..e37dc9c21888 100644
> --- a/tools/testing/selftests/kvm/kvm_page_table_test.c
> +++ b/tools/testing/selftests/kvm/kvm_page_table_test.c
> @@ -254,7 +254,7 @@ static struct kvm_vm *pre_init_before_test(enum vm_gu=
est_mode mode, void *arg)
>
>         /* Create a VM with enough guest pages */
>         guest_num_pages =3D test_mem_size / guest_page_size;
> -       vm =3D __vm_create_with_vcpus(mode, nr_vcpus, guest_num_pages,
> +       vm =3D __vm_create_with_vcpus(VM_SHAPE(mode), nr_vcpus, guest_num=
_pages,
>                                     guest_code, test_args.vcpus);
>
>         /* Align down GPA of the testing memslot */
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/s=
elftests/kvm/lib/kvm_util.c
> index 95a553400ea9..1c74310f1d44 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -209,7 +209,7 @@ __weak void vm_vaddr_populate_bitmap(struct kvm_vm *v=
m)
>                 (1ULL << (vm->va_bits - 1)) >> vm->page_shift);
>  }
>
> -struct kvm_vm *____vm_create(enum vm_guest_mode mode)
> +struct kvm_vm *____vm_create(struct vm_shape shape)
>  {
>         struct kvm_vm *vm;
>
> @@ -221,13 +221,13 @@ struct kvm_vm *____vm_create(enum vm_guest_mode mod=
e)
>         vm->regions.hva_tree =3D RB_ROOT;
>         hash_init(vm->regions.slot_hash);
>
> -       vm->mode =3D mode;
> -       vm->type =3D 0;
> +       vm->mode =3D shape.mode;
> +       vm->type =3D shape.type;
>
> -       vm->pa_bits =3D vm_guest_mode_params[mode].pa_bits;
> -       vm->va_bits =3D vm_guest_mode_params[mode].va_bits;
> -       vm->page_size =3D vm_guest_mode_params[mode].page_size;
> -       vm->page_shift =3D vm_guest_mode_params[mode].page_shift;
> +       vm->pa_bits =3D vm_guest_mode_params[vm->mode].pa_bits;
> +       vm->va_bits =3D vm_guest_mode_params[vm->mode].va_bits;
> +       vm->page_size =3D vm_guest_mode_params[vm->mode].page_size;
> +       vm->page_shift =3D vm_guest_mode_params[vm->mode].page_shift;
>
>         /* Setup mode specific traits. */
>         switch (vm->mode) {
> @@ -265,7 +265,7 @@ struct kvm_vm *____vm_create(enum vm_guest_mode mode)
>                 /*
>                  * Ignore KVM support for 5-level paging (vm->va_bits =3D=
=3D 57),
>                  * it doesn't take effect unless a CR4.LA57 is set, which=
 it
> -                * isn't for this VM_MODE.
> +                * isn't for this mode (48-bit virtual address space).
>                  */
>                 TEST_ASSERT(vm->va_bits =3D=3D 48 || vm->va_bits =3D=3D 5=
7,
>                             "Linear address width (%d bits) not supported=
",
> @@ -285,10 +285,11 @@ struct kvm_vm *____vm_create(enum vm_guest_mode mod=
e)
>                 vm->pgtable_levels =3D 5;
>                 break;
>         default:
> -               TEST_FAIL("Unknown guest mode, mode: 0x%x", mode);
> +               TEST_FAIL("Unknown guest mode: 0x%x", vm->mode);
>         }
>
>  #ifdef __aarch64__
> +       TEST_ASSERT(!vm->type, "ARM doesn't support test-provided types")=
;
>         if (vm->pa_bits !=3D 40)
>                 vm->type =3D KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
>  #endif
> @@ -347,19 +348,19 @@ static uint64_t vm_nr_pages_required(enum vm_guest_=
mode mode,
>         return vm_adjust_num_guest_pages(mode, nr_pages);
>  }
>
> -struct kvm_vm *__vm_create(enum vm_guest_mode mode, uint32_t nr_runnable=
_vcpus,
> +struct kvm_vm *__vm_create(struct vm_shape shape, uint32_t nr_runnable_v=
cpus,
>                            uint64_t nr_extra_pages)
>  {
> -       uint64_t nr_pages =3D vm_nr_pages_required(mode, nr_runnable_vcpu=
s,
> +       uint64_t nr_pages =3D vm_nr_pages_required(shape.mode, nr_runnabl=
e_vcpus,
>                                                  nr_extra_pages);
>         struct userspace_mem_region *slot0;
>         struct kvm_vm *vm;
>         int i;
>
> -       pr_debug("%s: mode=3D'%s' pages=3D'%ld'\n", __func__,
> -                vm_guest_mode_string(mode), nr_pages);
> +       pr_debug("%s: mode=3D'%s' type=3D'%d', pages=3D'%ld'\n", __func__=
,
> +                vm_guest_mode_string(shape.mode), shape.type, nr_pages);
>
> -       vm =3D ____vm_create(mode);
> +       vm =3D ____vm_create(shape);
>
>         vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pa=
ges, 0);
>         for (i =3D 0; i < NR_MEM_REGIONS; i++)
> @@ -400,7 +401,7 @@ struct kvm_vm *__vm_create(enum vm_guest_mode mode, u=
int32_t nr_runnable_vcpus,
>   * extra_mem_pages is only used to calculate the maximum page table size=
,
>   * no real memory allocation for non-slot0 memory in this function.
>   */
> -struct kvm_vm *__vm_create_with_vcpus(enum vm_guest_mode mode, uint32_t =
nr_vcpus,
> +struct kvm_vm *__vm_create_with_vcpus(struct vm_shape shape, uint32_t nr=
_vcpus,
>                                       uint64_t extra_mem_pages,
>                                       void *guest_code, struct kvm_vcpu *=
vcpus[])
>  {
> @@ -409,7 +410,7 @@ struct kvm_vm *__vm_create_with_vcpus(enum vm_guest_m=
ode mode, uint32_t nr_vcpus
>
>         TEST_ASSERT(!nr_vcpus || vcpus, "Must provide vCPU array");
>
> -       vm =3D __vm_create(mode, nr_vcpus, extra_mem_pages);
> +       vm =3D __vm_create(shape, nr_vcpus, extra_mem_pages);
>
>         for (i =3D 0; i < nr_vcpus; ++i)
>                 vcpus[i] =3D vm_vcpu_add(vm, i, guest_code);
> @@ -417,15 +418,15 @@ struct kvm_vm *__vm_create_with_vcpus(enum vm_guest=
_mode mode, uint32_t nr_vcpus
>         return vm;
>  }
>
> -struct kvm_vm *__vm_create_with_one_vcpu(struct kvm_vcpu **vcpu,
> -                                        uint64_t extra_mem_pages,
> -                                        void *guest_code)
> +struct kvm_vm *__vm_create_shape_with_one_vcpu(struct vm_shape shape,
> +                                              struct kvm_vcpu **vcpu,
> +                                              uint64_t extra_mem_pages,
> +                                              void *guest_code)
>  {
>         struct kvm_vcpu *vcpus[1];
>         struct kvm_vm *vm;
>
> -       vm =3D __vm_create_with_vcpus(VM_MODE_DEFAULT, 1, extra_mem_pages=
,
> -                                   guest_code, vcpus);
> +       vm =3D __vm_create_with_vcpus(shape, 1, extra_mem_pages, guest_co=
de, vcpus);
>
>         *vcpu =3D vcpus[0];
>         return vm;
> diff --git a/tools/testing/selftests/kvm/lib/memstress.c b/tools/testing/=
selftests/kvm/lib/memstress.c
> index df457452d146..d05487e5a371 100644
> --- a/tools/testing/selftests/kvm/lib/memstress.c
> +++ b/tools/testing/selftests/kvm/lib/memstress.c
> @@ -168,7 +168,8 @@ struct kvm_vm *memstress_create_vm(enum vm_guest_mode=
 mode, int nr_vcpus,
>          * The memory is also added to memslot 0, but that's a benign sid=
e
>          * effect as KVM allows aliasing HVAs in meslots.
>          */
> -       vm =3D __vm_create_with_vcpus(mode, nr_vcpus, slot0_pages + guest=
_num_pages,
> +       vm =3D __vm_create_with_vcpus(VM_SHAPE(mode), nr_vcpus,
> +                                   slot0_pages + guest_num_pages,
>                                     memstress_guest_code, vcpus);
>
>         args->vm =3D vm;
> diff --git a/tools/testing/selftests/kvm/x86_64/ucna_injection_test.c b/t=
ools/testing/selftests/kvm/x86_64/ucna_injection_test.c
> index 85f34ca7e49e..0ed32ec903d0 100644
> --- a/tools/testing/selftests/kvm/x86_64/ucna_injection_test.c
> +++ b/tools/testing/selftests/kvm/x86_64/ucna_injection_test.c
> @@ -271,7 +271,7 @@ int main(int argc, char *argv[])
>
>         kvm_check_cap(KVM_CAP_MCE);
>
> -       vm =3D __vm_create(VM_MODE_DEFAULT, 3, 0);
> +       vm =3D __vm_create(VM_SHAPE_DEFAULT, 3, 0);
>
>         kvm_ioctl(vm->kvm_fd, KVM_X86_GET_MCE_CAP_SUPPORTED,
>                   &supported_mcg_caps);
> --
> 2.39.1
>
>
