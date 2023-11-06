Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEBF7E1E33
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 11:25:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JBWfd3s5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP6tR5zZdz3cTF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 21:25:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JBWfd3s5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP6sX6m0Gz2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 21:24:31 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-41cd4cc515fso30081351cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 02:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699266263; x=1699871063; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx7pzo9zslWgjVRljunAjs24sdVG2mkanbp0iYdFwaI=;
        b=JBWfd3s5Iye7HiBZT0iZRULXOW27ZJe7LQp9cL7Lo0FbZtc+BFJsLlHpESUBvcj7wG
         ADyzB4bGhwTpxW5wWZ1snoaJxO5KunIB1bFyb9a8jI/bbRKy+iGdAFpoiZqRTccBT1Gv
         Kr/1g3DJJW2Nk+Qd4RZm5gxBxC0Yv2O7c2M/kzoZRU14Q0cNmaTWNgCClcDsKanMXKYF
         JA1sHhaprelW7E/Wp9isy9fJjfR9AYZlQYQ3RRWvmxNsFIg6EOgFHpjwkqyewJYbUwie
         oEXhRJZWljeftMmfjyRpEHIJICnMrUp4+gc8KYSXqWc2R+qYdYwXs86lLtvMo0/sxRpe
         Nhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699266263; x=1699871063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jx7pzo9zslWgjVRljunAjs24sdVG2mkanbp0iYdFwaI=;
        b=mCQoI+GlOomENW6UrAAD3iY4/iX22st5FX/3NbpLilaWI5+uWzny1yuyHw8Js4FeWZ
         a+Z7rOJ73OG7/oTp66pTvYAQfvvU6x5meHWcL2/5dgq452MzQbzt+nxytHcI1qnQQB0p
         3WteALPXfKV90MIYpDQeXFSyQ6XB/M/2YhxOdHUm/4ucXoW9HF92OFVFszL48DDAWYGy
         VGcx3zwR524uuhl4tsOY8IP5XC73JqRgAHuy2yLWMf5f1rrqC+v4cPTkzdDEvNVAU8qI
         RsauUU5qd6CvAWL4XJt0ypAfAaq3RbBp6nkjtKFkmuaiJ9oNc40uueefkikKvZ6kE9j/
         t2cA==
X-Gm-Message-State: AOJu0YwrNvVwnpSX4ZeoK9JLiCfwO338BVzadjrOlcGcYT+c7jIqGwYe
	3WDGrvCFYpB53PY3eFTPcQdB4Ig5bE1crIUeatCuqw==
X-Google-Smtp-Source: AGHT+IGxqUy2TkFSF/6DzAsvotrbwxLeZiINpO4wtvkCRKfv4JWO0abdv88fQIT6HNBLh2pi2NT5y8KzEPnGx9OmZnQ=
X-Received: by 2002:ad4:5aa3:0:b0:66d:bc21:814c with SMTP id
 u3-20020ad45aa3000000b0066dbc21814cmr37429526qvg.65.1699266262770; Mon, 06
 Nov 2023 02:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-10-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-10-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 10:23:46 +0000
Message-ID: <CA+EHjTz5F14ULr0ji0-Xq+gAHMZo7EV8tA4KRTkp0pPzZ1dcng@mail.gmail.com>
Subject: Re: [PATCH 09/34] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
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

On Sun, Nov 5, 2023 at 4:32=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> From: Chao Peng <chao.p.peng@linux.intel.com>
>
> Add a new KVM exit type to allow userspace to handle memory faults that
> KVM cannot resolve, but that userspace *may* be able to handle (without
> terminating the guest).
>
> KVM will initially use KVM_EXIT_MEMORY_FAULT to report implicit
> conversions between private and shared memory.  With guest private memory=
,
> there will be two kind of memory conversions:
>
>   - explicit conversion: happens when the guest explicitly calls into KVM
>     to map a range (as private or shared)
>
>   - implicit conversion: happens when the guest attempts to access a gfn
>     that is configured in the "wrong" state (private vs. shared)
>
> On x86 (first architecture to support guest private memory), explicit
> conversions will be reported via KVM_EXIT_HYPERCALL+KVM_HC_MAP_GPA_RANGE,
> but reporting KVM_EXIT_HYPERCALL for implicit conversions is undesriable
> as there is (obviously) no hypercall, and there is no guarantee that the
> guest actually intends to convert between private and shared, i.e. what
> KVM thinks is an implicit conversion "request" could actually be the
> result of a guest code bug.
>
> KVM_EXIT_MEMORY_FAULT will be used to report memory faults that appear to
> be implicit conversions.
>
> Note!  To allow for future possibilities where KVM reports
> KVM_EXIT_MEMORY_FAULT and fills run->memory_fault on _any_ unresolved
> fault, KVM returns "-EFAULT" (-1 with errno =3D=3D EFAULT from userspace'=
s
> perspective), not '0'!  Due to historical baggage within KVM, exiting to
> userspace with '0' from deep callstacks, e.g. in emulation paths, is
> infeasible as doing so would require a near-complete overhaul of KVM,
> whereas KVM already propagates -errno return codes to userspace even when
> the -errno originated in a low level helper.
>
> Report the gpa+size instead of a single gfn even though the initial usage
> is expected to always report single pages.  It's entirely possible, likel=
y
> even, that KVM will someday support sub-page granularity faults, e.g.
> Intel's sub-page protection feature allows for additional protections at
> 128-byte granularity.
>
> Link: https://lore.kernel.org/all/20230908222905.1321305-5-amoorthy@googl=
e.com
> Link: https://lore.kernel.org/all/ZQ3AmLO2SYv3DszH@google.com
> Cc: Anish Moorthy <amoorthy@google.com>
> Cc: David Matlack <dmatlack@google.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20231027182217.3615211-10-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  Documentation/virt/kvm/api.rst | 41 ++++++++++++++++++++++++++++++++++
>  arch/x86/kvm/x86.c             |  1 +
>  include/linux/kvm_host.h       | 11 +++++++++
>  include/uapi/linux/kvm.h       |  8 +++++++
>  4 files changed, 61 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index bdea1423c5f8..481fb0e2ce90 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6846,6 +6846,26 @@ array field represents return values. The userspac=
e should update the return
>  values of SBI call before resuming the VCPU. For more details on RISC-V =
SBI
>  spec refer, https://github.com/riscv/riscv-sbi-doc.
>
> +::
> +
> +               /* KVM_EXIT_MEMORY_FAULT */
> +               struct {
> +                       __u64 flags;
> +                       __u64 gpa;
> +                       __u64 size;
> +               } memory_fault;
> +
> +KVM_EXIT_MEMORY_FAULT indicates the vCPU has encountered a memory fault =
that
> +could not be resolved by KVM.  The 'gpa' and 'size' (in bytes) describe =
the
> +guest physical address range [gpa, gpa + size) of the fault.  The 'flags=
' field
> +describes properties of the faulting access that are likely pertinent.
> +Currently, no flags are defined.
> +
> +Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in tha=
t it
> +accompanies a return code of '-1', not '0'!  errno will always be set to=
 EFAULT
> +or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace should=
 assume
> +kvm_run.exit_reason is stale/undefined for all other error numbers.
> +
>  ::
>
>      /* KVM_EXIT_NOTIFY */
> @@ -7880,6 +7900,27 @@ This capability is aimed to mitigate the threat th=
at malicious VMs can
>  cause CPU stuck (due to event windows don't open up) and make the CPU
>  unavailable to host or other VMs.
>
> +7.34 KVM_CAP_MEMORY_FAULT_INFO
> +------------------------------
> +
> +:Architectures: x86
> +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> +
> +The presence of this capability indicates that KVM_RUN will fill
> +kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-Exit, e=
.g. if
> +there is a valid memslot but no backing VMA for the corresponding host v=
irtual
> +address.
> +
> +The information in kvm_run.memory_fault is valid if and only if KVM_RUN =
returns
> +an error with errno=3DEFAULT or errno=3DEHWPOISON *and* kvm_run.exit_rea=
son is set
> +to KVM_EXIT_MEMORY_FAULT.
> +
> +Note: Userspaces which attempt to resolve memory faults so that they can=
 retry
> +KVM_RUN are encouraged to guard against repeatedly receiving the same
> +error/annotated fault.
> +
> +See KVM_EXIT_MEMORY_FAULT for more information.
> +
>  8. Other capabilities.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 7b389f27dffc..8f9d8939b63b 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -4625,6 +4625,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, l=
ong ext)
>         case KVM_CAP_ENABLE_CAP:
>         case KVM_CAP_VM_DISABLE_NX_HUGE_PAGES:
>         case KVM_CAP_IRQFD_RESAMPLE:
> +       case KVM_CAP_MEMORY_FAULT_INFO:
>                 r =3D 1;
>                 break;
>         case KVM_CAP_EXIT_HYPERCALL:
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 4e741ff27af3..96aa930536b1 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2327,4 +2327,15 @@ static inline void kvm_account_pgtable_pages(void =
*virt, int nr)
>  /* Max number of entries allowed for each kvm dirty ring */
>  #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
>
> +static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> +                                                gpa_t gpa, gpa_t size)
> +{
> +       vcpu->run->exit_reason =3D KVM_EXIT_MEMORY_FAULT;
> +       vcpu->run->memory_fault.gpa =3D gpa;
> +       vcpu->run->memory_fault.size =3D size;
> +
> +       /* Flags are not (yet) defined or communicated to userspace. */
> +       vcpu->run->memory_fault.flags =3D 0;
> +}
> +
>  #endif
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 308cc70bd6ab..59010a685007 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -275,6 +275,7 @@ struct kvm_xen_exit {
>  #define KVM_EXIT_RISCV_CSR        36
>  #define KVM_EXIT_NOTIFY           37
>  #define KVM_EXIT_LOONGARCH_IOCSR  38
> +#define KVM_EXIT_MEMORY_FAULT     39
>
>  /* For KVM_EXIT_INTERNAL_ERROR */
>  /* Emulate instruction failed. */
> @@ -528,6 +529,12 @@ struct kvm_run {
>  #define KVM_NOTIFY_CONTEXT_INVALID     (1 << 0)
>                         __u32 flags;
>                 } notify;
> +               /* KVM_EXIT_MEMORY_FAULT */
> +               struct {
> +                       __u64 flags;
> +                       __u64 gpa;
> +                       __u64 size;
> +               } memory_fault;
>                 /* Fix the size of the union. */
>                 char padding[256];
>         };
> @@ -1212,6 +1219,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
>  #define KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES 230
>  #define KVM_CAP_USER_MEMORY2 231
> +#define KVM_CAP_MEMORY_FAULT_INFO 232
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> --
> 2.39.1
>
>
