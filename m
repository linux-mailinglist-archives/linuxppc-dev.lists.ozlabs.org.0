Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A04497E1FF8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 12:27:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jzs7JZ8T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP8GK3rtbz3bqW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 22:27:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jzs7JZ8T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP8FT2588z2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 22:26:53 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-67131800219so30511146d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 03:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699270010; x=1699874810; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcdCS6aA0hU/P/1Lxpxkfas8L67FF+zkKmd2vDLbKHk=;
        b=jzs7JZ8T4mb5OTlc3bJdCS+UlDcEr1Y66vSt41elrAtkHTfOYpUET+YRyPB30TL361
         l4hIPEjowDbvoqTBRQt2HH1fnKYfiskTFrJDiX8s84JO/ZefuNQgexcagclpJ0Wl6jky
         8LDfOTRSC1imFqo0v9W7MAroG78OBVXQlCdrvfb3m3WUe0tXYix/QdoiGzsfWsW/cKMx
         DGBaBmy7uojNmeKpxEoQwsM5Myjr+yNtNcIYD8v4dI5M/9O24/bsg3mULhF8ToL8n/pj
         6w+Yh/p+3eAh9/7W4LuplVjhDFnlZxxmsI3YmfzxbD19QBLQP12oeBgU4KczzFLyiX6r
         +rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699270010; x=1699874810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcdCS6aA0hU/P/1Lxpxkfas8L67FF+zkKmd2vDLbKHk=;
        b=WkcGsXXiS+vXKtbKHmgxg3TPGUDVMX3mVKXWzac/G3JbEQ4S9JkrJ2O2MRK0TVrJ9m
         iLh0PPq7WR768gRivNnrtIYIV5YGL502ZOJLZkt+0++Rh2t86PjViBWcgKJd2FcCEBCX
         Fhw08eGeEYy9vmzhSi5+ETTql+V5P4RF+3AfeBFf4/C21w4wEQiuUD8L87SDgSaakzDh
         Z7wkVU1ycW5OxPGKuELp4V/y+fSK9H2U4xMOptlj+nlF9pZJjXrjJFYE0Li5lN4IZBjg
         eFAwg4eG9+Op8KzvKiA0UOOU1n5uM/pM3Hi7zs+zzhAXdmhDLagooTB5pDC0xUewjQoA
         JTLw==
X-Gm-Message-State: AOJu0Yx2eAaOavkeh+YkI5v/rGXQO/ND7dKD2/9JC8RSKe1LRPsl8uvJ
	hUwTEBE1LLD5haMYGNfhZ9koadslT5MxyVsWrneP+Q==
X-Google-Smtp-Source: AGHT+IFasxLYHHudhBN/+4eIX1OsOhIRfSB2CWnjQO7Y6r4dz1/Ca+R2Pv6YHi7+A5fsQfNYO2/OlOsYvWwG9CsrzMM=
X-Received: by 2002:a05:6214:2506:b0:658:26d7:72e0 with SMTP id
 gf6-20020a056214250600b0065826d772e0mr20208405qvb.4.1699270009660; Mon, 06
 Nov 2023 03:26:49 -0800 (PST)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-28-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-28-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:26:13 +0000
Message-ID: <CA+EHjTyjeKymYaJ3kTpVzRFPLKxeDEf9B-DGo7xif_FPN1dFBQ@mail.gmail.com>
Subject: Re: [PATCH v13 27/35] KVM: selftests: Add helpers to convert guest
 memory b/w private and shared
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

On Fri, Oct 27, 2023 at 7:23=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> From: Vishal Annapurve <vannapurve@google.com>
>
> Add helpers to convert memory between private and shared via KVM's
> memory attributes, as well as helpers to free/allocate guest_memfd memory
> via fallocate().  Userspace, i.e. tests, is NOT required to do fallocate(=
)
> when converting memory, as the attributes are the single source of true.

true->truth

> Provide allocate() helpers so that tests can mimic a userspace that frees
> private memory on conversion, e.g. to prioritize memory usage over
> performance.
>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     | 48 +++++++++++++++++++
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 28 +++++++++++
>  2 files changed, 76 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/=
testing/selftests/kvm/include/kvm_util_base.h
> index 9f861182c02a..1441fca6c273 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -333,6 +333,54 @@ static inline void vm_enable_cap(struct kvm_vm *vm, =
uint32_t cap, uint64_t arg0)
>         vm_ioctl(vm, KVM_ENABLE_CAP, &enable_cap);
>  }
>
> +static inline void vm_set_memory_attributes(struct kvm_vm *vm, uint64_t =
gpa,
> +                                           uint64_t size, uint64_t attri=
butes)
> +{
> +       struct kvm_memory_attributes attr =3D {
> +               .attributes =3D attributes,
> +               .address =3D gpa,
> +               .size =3D size,
> +               .flags =3D 0,
> +       };
> +
> +       /*
> +        * KVM_SET_MEMORY_ATTRIBUTES overwrites _all_ attributes.  These =
flows
> +        * need significant enhancements to support multiple attributes.
> +        */
> +       TEST_ASSERT(!attributes || attributes =3D=3D KVM_MEMORY_ATTRIBUTE=
_PRIVATE,
> +                   "Update me to support multiple attributes!");
> +
> +       vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES, &attr);
> +}
> +
> +
> +static inline void vm_mem_set_private(struct kvm_vm *vm, uint64_t gpa,
> +                                     uint64_t size)
> +{
> +       vm_set_memory_attributes(vm, gpa, size, KVM_MEMORY_ATTRIBUTE_PRIV=
ATE);
> +}
> +
> +static inline void vm_mem_set_shared(struct kvm_vm *vm, uint64_t gpa,
> +                                    uint64_t size)
> +{
> +       vm_set_memory_attributes(vm, gpa, size, 0);
> +}
> +
> +void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t gpa, uint64_t si=
ze,
> +                           bool punch_hole);
> +
> +static inline void vm_guest_mem_punch_hole(struct kvm_vm *vm, uint64_t g=
pa,
> +                                          uint64_t size)
> +{
> +       vm_guest_mem_fallocate(vm, gpa, size, true);
> +}
> +
> +static inline void vm_guest_mem_allocate(struct kvm_vm *vm, uint64_t gpa=
,
> +                                        uint64_t size)
> +{
> +       vm_guest_mem_fallocate(vm, gpa, size, false);
> +}
> +
>  void vm_enable_dirty_ring(struct kvm_vm *vm, uint32_t ring_size);
>  const char *vm_guest_mode_string(uint32_t i);
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/s=
elftests/kvm/lib/kvm_util.c
> index 45050f54701a..a140aee8d0f5 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1176,6 +1176,34 @@ void vm_mem_region_delete(struct kvm_vm *vm, uint3=
2_t slot)
>         __vm_mem_region_delete(vm, memslot2region(vm, slot), true);
>  }
>
> +void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t base, uint64_t s=
ize,
> +                           bool punch_hole)
> +{
> +       const int mode =3D FALLOC_FL_KEEP_SIZE | (punch_hole ? FALLOC_FL_=
PUNCH_HOLE : 0);
> +       struct userspace_mem_region *region;
> +       uint64_t end =3D base + size;
> +       uint64_t gpa, len;
> +       off_t fd_offset;
> +       int ret;
> +
> +       for (gpa =3D base; gpa < end; gpa +=3D len) {
> +               uint64_t offset;
> +
> +               region =3D userspace_mem_region_find(vm, gpa, gpa);
> +               TEST_ASSERT(region && region->region.flags & KVM_MEM_PRIV=
ATE,
> +                           "Private memory region not found for GPA 0x%l=
x", gpa);
> +
> +               offset =3D (gpa - region->region.guest_phys_addr);

nit: why the parentheses?

> +               fd_offset =3D region->region.guest_memfd_offset + offset;
> +               len =3D min_t(uint64_t, end - gpa, region->region.memory_=
size - offset);
> +
> +               ret =3D fallocate(region->region.guest_memfd, mode, fd_of=
fset, len);
> +               TEST_ASSERT(!ret, "fallocate() failed to %s at %lx (len =
=3D %lu), fd =3D %d, mode =3D %x, offset =3D %lx\n",
> +                           punch_hole ? "punch hole" : "allocate", gpa, =
len,
> +                           region->region.guest_memfd, mode, fd_offset);
> +       }
> +}
> +

Nits aside:

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>  /* Returns the size of a vCPU's kvm_run structure. */
>  static int vcpu_mmap_sz(void)
>  {
> --
> 2.42.0.820.g83a721a137-goog
>
