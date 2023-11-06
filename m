Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5CC7E1FB1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 12:11:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ANgv8uHV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP7vQ5Zjmz3cV6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 22:11:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ANgv8uHV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP7tX0cWPz2xPZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 22:10:26 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-778ac9c898dso221596885a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 03:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699269023; x=1699873823; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnJqfkSSRV3TBP0JexdvtsqLHYDxALR7H+cYP6TRCJE=;
        b=ANgv8uHV9pxm0bsm+mK+p1Su/7hVbgrg+JuyemLg/n373b6NEYg1RJaGCZElroteJM
         U3nQ/IhRFlbnkCt6h6Vuu1NmvumI/krZag9mXfCsHVhNprllLSMj9bzSyD0P+yBwBkgU
         8lZ8sawvez48awhbuXZfXR30sKOA/PyBZMMMHmOcgvyw3FmzAsDn6C4JIKSPOEwyjPcS
         BNF/6uMKOPhUKEaIFtrSBRG8xqV05rVpeHLkF63dxl36k5Hv38qrQQqzEOe0PKYIISPv
         RkxbTkRlM9vDAPJn4zegs/MENwGSSLeVndEGMEOR125JIB5TXH+AzUtJw6ZL/iQQ8vMn
         9KtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699269023; x=1699873823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnJqfkSSRV3TBP0JexdvtsqLHYDxALR7H+cYP6TRCJE=;
        b=tUXPjwXYhYhwI3N6NMO+Tve0EBWc0RJFPGds28mw8v8pMvO01wwbNAcjKlMh+7ESCd
         g4Zoea6OkR9hHbFhmY7XK92cLIe+g1bdiM1taOSYR3M4Xff/zLQ00R3O6zpttERVMCQK
         +oFm4OTVJppRmCvdFG+ogP11Zfvv8fQ1pJBz/cr3cudEzTejMpUz0q0PrnEIit3txPci
         41P1cBu6Nzxyp0/2QkxZemUIJcFzyDZFbG/jIVR1v0Fd3YIvvtjQe/uBrBxVQUXAL6IX
         YJoKWKO87nOzE6tRwflroAlmgafD8kHGXQVodwQnwGOPVENx94T4sMBYxZQmfKnLojbz
         3ZHA==
X-Gm-Message-State: AOJu0YyPQCnXwe02LDaN5oxZXxXYAlICNO8gUjsupUniHE0+tng366p2
	+AiKYbz4EkVD/D64ErG6EVgoQHOrqmDlwgu4cHG6iQ==
X-Google-Smtp-Source: AGHT+IHU/+pefiFnPy+6hnE6koYxy9w/9xmRXHTMFvjZ+YNn5s7SNPQyF9p0CVa6tIfW5b4YJfx0jin9klIyZI5tK50=
X-Received: by 2002:a05:6214:d62:b0:66d:2eab:85ec with SMTP id
 2-20020a0562140d6200b0066d2eab85ecmr28750220qvs.61.1699269022903; Mon, 06 Nov
 2023 03:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-25-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-25-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:09:46 +0000
Message-ID: <CA+EHjTwOFAEMchVjob=3chD-TJ=Wau3iPnLdtFXBtiRUG4Dtug@mail.gmail.com>
Subject: Re: [PATCH 24/34] KVM: selftests: Add support for creating private memslots
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

Hi,

Regarding the subject (and the commit message), should we still be
calling them "private" slots, or guestmem_slots?

On Sun, Nov 5, 2023 at 4:34=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Add support for creating "private" memslots via KVM_CREATE_GUEST_MEMFD an=
d
> KVM_SET_USER_MEMORY_REGION2.  Make vm_userspace_mem_region_add() a wrappe=
r
> to its effective replacement, vm_mem_add(), so that private memslots are
> fully opt-in, i.e. don't require update all tests that add memory regions=
.

nit: update->updating

>
> Pivot on the KVM_MEM_PRIVATE flag instead of the validity of the "gmem"

KVM_MEM_PRIVATE  -> KVM_MEM_GUEST_MEMFD

> file descriptor so that simple tests can let vm_mem_add() do the heavy
> lifting of creating the guest memfd, but also allow the caller to pass in
> an explicit fd+offset so that fancier tests can do things like back
> multiple memslots with a single file.  If the caller passes in a fd, dup(=
)
> the fd so that (a) __vm_mem_region_delete() can close the fd associated
> with the memory region without needing yet another flag, and (b) so that
> the caller can safely close its copy of the fd without having to first
> destroy memslots.
>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-27-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     | 23 ++++++
>  .../testing/selftests/kvm/include/test_util.h |  5 ++
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 76 +++++++++++--------
>  3 files changed, 73 insertions(+), 31 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/=
testing/selftests/kvm/include/kvm_util_base.h
> index 9f144841c2ee..9f861182c02a 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -431,6 +431,26 @@ static inline uint64_t vm_get_stat(struct kvm_vm *vm=
, const char *stat_name)
>
>  void vm_create_irqchip(struct kvm_vm *vm);
>
> +static inline int __vm_create_guest_memfd(struct kvm_vm *vm, uint64_t si=
ze,
> +                                       uint64_t flags)
> +{
> +       struct kvm_create_guest_memfd guest_memfd =3D {
> +               .size =3D size,
> +               .flags =3D flags,
> +       };
> +
> +       return __vm_ioctl(vm, KVM_CREATE_GUEST_MEMFD, &guest_memfd);
> +}
> +
> +static inline int vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size=
,
> +                                       uint64_t flags)
> +{
> +       int fd =3D __vm_create_guest_memfd(vm, size, flags);
> +
> +       TEST_ASSERT(fd >=3D 0, KVM_IOCTL_ERROR(KVM_CREATE_GUEST_MEMFD, fd=
));
> +       return fd;
> +}
> +
>  void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_=
t flags,
>                                uint64_t gpa, uint64_t size, void *hva);
>  int __vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32=
_t flags,
> @@ -439,6 +459,9 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>         enum vm_mem_backing_src_type src_type,
>         uint64_t guest_paddr, uint32_t slot, uint64_t npages,
>         uint32_t flags);
> +void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type=
,
> +               uint64_t guest_paddr, uint32_t slot, uint64_t npages,
> +               uint32_t flags, int guest_memfd_fd, uint64_t guest_memfd_=
offset);
>
>  void vm_mem_region_set_flags(struct kvm_vm *vm, uint32_t slot, uint32_t =
flags);
>  void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_g=
pa);
> diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/test=
ing/selftests/kvm/include/test_util.h
> index 7e614adc6cf4..7257f2243ab9 100644
> --- a/tools/testing/selftests/kvm/include/test_util.h
> +++ b/tools/testing/selftests/kvm/include/test_util.h
> @@ -142,6 +142,11 @@ static inline bool backing_src_is_shared(enum vm_mem=
_backing_src_type t)
>         return vm_mem_backing_src_alias(t)->flag & MAP_SHARED;
>  }
>
> +static inline bool backing_src_can_be_huge(enum vm_mem_backing_src_type =
t)
> +{
> +       return t !=3D VM_MEM_SRC_ANONYMOUS && t !=3D VM_MEM_SRC_SHMEM;
> +}
> +
>  /* Aligns x up to the next multiple of size. Size must be a power of 2. =
*/
>  static inline uint64_t align_up(uint64_t x, uint64_t size)
>  {
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/s=
elftests/kvm/lib/kvm_util.c
> index 3676b37bea38..b63500fca627 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -669,6 +669,8 @@ static void __vm_mem_region_delete(struct kvm_vm *vm,
>                 TEST_ASSERT(!ret, __KVM_SYSCALL_ERROR("munmap()", ret));
>                 close(region->fd);
>         }
> +       if (region->region.guest_memfd >=3D 0)
> +               close(region->region.guest_memfd);
>
>         free(region);
>  }
> @@ -870,36 +872,15 @@ void vm_set_user_memory_region(struct kvm_vm *vm, u=
int32_t slot, uint32_t flags,
>                     errno, strerror(errno));
>  }
>
> -/*
> - * VM Userspace Memory Region Add
> - *
> - * Input Args:
> - *   vm - Virtual Machine
> - *   src_type - Storage source for this region.
> - *              NULL to use anonymous memory.

"VM_MEM_SRC_ANONYMOUS to use anonymous memory"

> - *   guest_paddr - Starting guest physical address
> - *   slot - KVM region slot
> - *   npages - Number of physical pages
> - *   flags - KVM memory region flags (e.g. KVM_MEM_LOG_DIRTY_PAGES)
> - *
> - * Output Args: None
> - *
> - * Return: None
> - *
> - * Allocates a memory area of the number of pages specified by npages
> - * and maps it to the VM specified by vm, at a starting physical address
> - * given by guest_paddr.  The region is created with a KVM region slot
> - * given by slot, which must be unique and < KVM_MEM_SLOTS_NUM.  The
> - * region is created with the flags given by flags.
> - */
> -void vm_userspace_mem_region_add(struct kvm_vm *vm,
> -       enum vm_mem_backing_src_type src_type,
> -       uint64_t guest_paddr, uint32_t slot, uint64_t npages,
> -       uint32_t flags)
> +/* FIXME: This thing needs to be ripped apart and rewritten. */

It sure does :)

With these nits:

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> +void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type=
,
> +               uint64_t guest_paddr, uint32_t slot, uint64_t npages,
> +               uint32_t flags, int guest_memfd, uint64_t guest_memfd_off=
set)
>  {
>         int ret;
>         struct userspace_mem_region *region;
>         size_t backing_src_pagesz =3D get_backing_src_pagesz(src_type);
> +       size_t mem_size =3D npages * vm->page_size;
>         size_t alignment;
>
>         TEST_ASSERT(vm_adjust_num_guest_pages(vm->mode, npages) =3D=3D np=
ages,
> @@ -952,7 +933,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>         /* Allocate and initialize new mem region structure. */
>         region =3D calloc(1, sizeof(*region));
>         TEST_ASSERT(region !=3D NULL, "Insufficient Memory");
> -       region->mmap_size =3D npages * vm->page_size;
> +       region->mmap_size =3D mem_size;
>
>  #ifdef __s390x__
>         /* On s390x, the host address must be aligned to 1M (due to PGSTE=
s) */
> @@ -999,14 +980,38 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>         /* As needed perform madvise */
>         if ((src_type =3D=3D VM_MEM_SRC_ANONYMOUS ||
>              src_type =3D=3D VM_MEM_SRC_ANONYMOUS_THP) && thp_configured(=
)) {
> -               ret =3D madvise(region->host_mem, npages * vm->page_size,
> +               ret =3D madvise(region->host_mem, mem_size,
>                               src_type =3D=3D VM_MEM_SRC_ANONYMOUS ? MADV=
_NOHUGEPAGE : MADV_HUGEPAGE);
>                 TEST_ASSERT(ret =3D=3D 0, "madvise failed, addr: %p lengt=
h: 0x%lx src_type: %s",
> -                           region->host_mem, npages * vm->page_size,
> +                           region->host_mem, mem_size,
>                             vm_mem_backing_src_alias(src_type)->name);
>         }
>
>         region->backing_src_type =3D src_type;
> +
> +       if (flags & KVM_MEM_GUEST_MEMFD) {
> +               if (guest_memfd < 0) {
> +                       uint32_t guest_memfd_flags =3D 0;
> +                       TEST_ASSERT(!guest_memfd_offset,
> +                                   "Offset must be zero when creating ne=
w guest_memfd");
> +                       guest_memfd =3D vm_create_guest_memfd(vm, mem_siz=
e, guest_memfd_flags);
> +               } else {
> +                       /*
> +                        * Install a unique fd for each memslot so that t=
he fd
> +                        * can be closed when the region is deleted witho=
ut
> +                        * needing to track if the fd is owned by the fra=
mework
> +                        * or by the caller.
> +                        */
> +                       guest_memfd =3D dup(guest_memfd);
> +                       TEST_ASSERT(guest_memfd >=3D 0, __KVM_SYSCALL_ERR=
OR("dup()", guest_memfd));
> +               }
> +
> +               region->region.guest_memfd =3D guest_memfd;
> +               region->region.guest_memfd_offset =3D guest_memfd_offset;
> +       } else {
> +               region->region.guest_memfd =3D -1;
> +       }
> +
>         region->unused_phy_pages =3D sparsebit_alloc();
>         sparsebit_set_num(region->unused_phy_pages,
>                 guest_paddr >> vm->page_shift, npages);
> @@ -1019,9 +1024,10 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm=
,
>         TEST_ASSERT(ret =3D=3D 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL fail=
ed,\n"
>                 "  rc: %i errno: %i\n"
>                 "  slot: %u flags: 0x%x\n"
> -               "  guest_phys_addr: 0x%lx size: 0x%lx",
> +               "  guest_phys_addr: 0x%lx size: 0x%lx guest_memfd: %d\n",
>                 ret, errno, slot, flags,
> -               guest_paddr, (uint64_t) region->region.memory_size);
> +               guest_paddr, (uint64_t) region->region.memory_size,
> +               region->region.guest_memfd);
>
>         /* Add to quick lookup data structures */
>         vm_userspace_mem_region_gpa_insert(&vm->regions.gpa_tree, region)=
;
> @@ -1042,6 +1048,14 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm=
,
>         }
>  }
>
> +void vm_userspace_mem_region_add(struct kvm_vm *vm,
> +                                enum vm_mem_backing_src_type src_type,
> +                                uint64_t guest_paddr, uint32_t slot,
> +                                uint64_t npages, uint32_t flags)
> +{
> +       vm_mem_add(vm, src_type, guest_paddr, slot, npages, flags, -1, 0)=
;
> +}
> +
>  /*
>   * Memslot to region
>   *
> --
> 2.39.1
>
>
