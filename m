Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 928C47DF6F1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 16:47:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YoOI6G+0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WJi3K3Yn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLpDP3SM1z3clB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 02:47:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YoOI6G+0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WJi3K3Yn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLpCX59bCz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 02:47:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698940020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qeg4fThHNamWUhF1iS61sde2LLjKmpBYgt6nMB/6tao=;
	b=YoOI6G+0W+LafkPCfj/1zIyGtLMTFl8rpNCEojZGdSvo/5MlNbJo3Oribde2OOsC0vtR1m
	Gle9kN55IuYgd5R8Q41L3AQVis81ig5G8kBJyWadTer9zCYd5YD+nDHm6AflA7+bFVxF8c
	gSRaW18nXYLw8Nd7SI255YcSGVacIUc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698940021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qeg4fThHNamWUhF1iS61sde2LLjKmpBYgt6nMB/6tao=;
	b=WJi3K3YnmCWcniNc/oaKWiPSm7llaTooxn9b6FcKFTqZmvUCA8qglCSdFvwcMAPlMddQOa
	540JEfCpi1oCIsFKnf0QsZ5SOCL8n6HKvTvQNm73j3MQJlPhOsskBN2yR859oT5zat01Ow
	1pttUgwOqvaZC/gbXLL6ukpo1SRJvWs=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-JVVnUeHLOIC8uT9EGNizzw-1; Thu, 02 Nov 2023 11:46:57 -0400
X-MC-Unique: JVVnUeHLOIC8uT9EGNizzw-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-45865744803so311134137.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 08:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698940017; x=1699544817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qeg4fThHNamWUhF1iS61sde2LLjKmpBYgt6nMB/6tao=;
        b=t+E3fqqvEqpcqWm1zgewOWj7nTTdDPlA1N4VsHXuhqhyzoU2AMySeGVDm5uwktf/CZ
         0ZFK6dB110TVl8dgQppkGsRnWshn6YL5evkcUoF91GcVJg2LGRDDV7e8NWG68nKAFRJU
         6komVP2u5fDwvdUPspSm9C/scI682fWDJQe8opJcpF/mY8kH4zRTJaK59L7tsg5TpsPK
         FK80yIDdThNhcIH3AYJ8O2nlbfHF5GRTU5Q0DSjdJkD/VI4S5LpkZ65WXBmca6NxhqUj
         NlpYcSptMjU5l+o3yHfmmdueJZ78PnC3cPWsoiNDP/EgVraJcn10rB0xmqGvjROrr6/v
         6sBQ==
X-Gm-Message-State: AOJu0YzPf5LEX6fHqhQ0pIoMHnpu6GYl9GMN5sVTUSiUO2eRRjE4D/yH
	/USYgxo5q4NgQh1pBoRvmJWnmREF2xEGBbK8gtT+1555VeAZJUft21M2ksf5H/ih6mWcZy4AeSR
	eVvnMyTzoiOqB3LyPuT9aidSUWK1tV0p9AnHVNGfvNw==
X-Received: by 2002:a67:e094:0:b0:45a:adb1:e731 with SMTP id f20-20020a67e094000000b0045aadb1e731mr13713076vsl.18.1698940016960;
        Thu, 02 Nov 2023 08:46:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2sQrKI/skG8LdWfhNkZYp2KhqQ5LS1sXUkK07F1g1zFBTxe6hPbvDf2UcxJZMcPjozGjwKFDjb1Wwm7r+KU4=
X-Received: by 2002:a67:e094:0:b0:45a:adb1:e731 with SMTP id
 f20-20020a67e094000000b0045aadb1e731mr13713027vsl.18.1698940016455; Thu, 02
 Nov 2023 08:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-18-seanjc@google.com> <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
 <ZUEML6oJXDCFJ9fg@google.com> <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
 <ZUJVfCkIYYFp5VwG@google.com> <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com> <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
 <ZULSkilO-tdgDGyT@google.com> <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
 <ZUPCWfO1iO77-KDA@google.com>
In-Reply-To: <ZUPCWfO1iO77-KDA@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 2 Nov 2023 16:46:42 +0100
Message-ID: <CABgObfa=DH7FySBviF63OS9sVog_wt-AqYgtUAGKqnY5Bizivw@mail.gmail.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
To: Sean Christopherson <seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, A
 nup Patel <anup@brainfault.org>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 2, 2023 at 4:38=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
> Actually, looking that this again, there's not actually a hard dependency=
 on THP.
> A THP-enabled kernel _probably_  gives a higher probability of using huge=
pages,
> but mostly because THP selects COMPACTION, and I suppose because using TH=
P for
> other allocations reduces overall fragmentation.

Yes, that's why I didn't even bother enabling it unless THP is
enabled, but it makes even more sense to just try.

> So rather than honor KVM_GUEST_MEMFD_ALLOW_HUGEPAGE iff THP is enabled, I=
 think
> we should do the below (I verified KVM can create hugepages with THP=3Dn)=
.  We'll
> need another capability, but (a) we probably should have that anyways and=
 (b) it
> provides a cleaner path to adding PUD-sized hugepage support in the futur=
e.

I wonder if we need KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE though. This
should be a generic kernel API and in fact the sizes are available in
a not-so-friendly format in /sys/kernel/mm/hugepages.

We should just add /sys/kernel/mm/hugepages/sizes that contains
"2097152 1073741824" on x86 (only the former if 1G pages are not
supported).

Plus: is this the best API if we need something else for 1G pages?

Let's drop *this* patch and proceed incrementally. (Again, this is
what I want to do with this final review: identify places that are
stil sticky, and don't let them block the rest).

Coincidentially we have an open spot next week at plumbers. Let's
extend Fuad's section to cover more guestmem work.

Paolo

> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testi=
ng/selftests/kvm/guest_memfd_test.c
> index c15de9852316..c9f449718fce 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -201,6 +201,10 @@ int main(int argc, char *argv[])
>
>         TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
>
> +       if (kvm_has_cap(KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE) && thp_con=
figured())
> +               TEST_ASSERT_EQ(get_trans_hugepagesz(),
> +                              kvm_check_cap(KVM_CAP_GUEST_MEMFD_HUGEPAGE=
_PMD_SIZE));
> +
>         page_size =3D getpagesize();
>         total_size =3D page_size * 4;
>
> diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_t=
est.c b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
> index be311944e90a..245901587ed2 100644
> --- a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
> @@ -396,7 +396,7 @@ static void test_mem_conversions(enum vm_mem_backing_=
src_type src_type, uint32_t
>
>         vm_enable_cap(vm, KVM_CAP_EXIT_HYPERCALL, (1 << KVM_HC_MAP_GPA_RA=
NGE));
>
> -       if (backing_src_can_be_huge(src_type))
> +       if (kvm_has_cap(KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE))
>                 memfd_flags =3D KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
>         else
>                 memfd_flags =3D 0;
>
> --
> From: Sean Christopherson <seanjc@google.com>
> Date: Wed, 25 Oct 2023 16:26:41 -0700
> Subject: [PATCH] KVM: Add best-effort hugepage support for dedicated gues=
t
>  memory
>
> Extend guest_memfd to allow backing guest memory with hugepages.  For now=
,
> make hugepage utilization best-effort, i.e. fall back to non-huge mapping=
s
> if a hugepage can't be allocated.  Guaranteeing hugepages would require a
> dedicated memory pool and significantly more complexity and churn..
>
> Require userspace to opt-in via a flag even though it's unlikely real use
> cases will ever want to use order-0 pages, e.g. to give userspace a safet=
y
> valve in case hugepage support is buggy, and to allow for easier testing
> of both paths.
>
> Do not take a dependency on CONFIG_TRANSPARENT_HUGEPAGE, as THP enabling
> primarily deals with userspace page tables, which are explicitly not in
> play for guest_memfd.  Selecting THP does make obtaining hugepages more
> likely, but only because THP selects CONFIG_COMPACTION.  Don't select
> CONFIG_COMPACTION either, because again it's not a hard dependency.
>
> For simplicity, require the guest_memfd size to be a multiple of the
> hugepage size, e.g. so that KVM doesn't need to do bounds checking when
> deciding whether or not to allocate a huge folio.
>
> When reporting the max order when KVM gets a pfn from guest_memfd, force
> order-0 pages if the hugepage is not fully contained by the memslot
> binding, e.g. if userspace requested hugepages but punches a hole in the
> memslot bindings in order to emulate x86's VGA hole.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  Documentation/virt/kvm/api.rst | 17 +++++++++
>  include/uapi/linux/kvm.h       |  3 ++
>  virt/kvm/guest_memfd.c         | 69 +++++++++++++++++++++++++++++-----
>  virt/kvm/kvm_main.c            |  4 ++
>  4 files changed, 84 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index e82c69d5e755..ccdd5413920d 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6176,6 +6176,8 @@ and cannot be resized  (guest_memfd files do howeve=
r support PUNCH_HOLE).
>         __u64 reserved[6];
>    };
>
> +  #define KVM_GUEST_MEMFD_ALLOW_HUGEPAGE         (1ULL << 0)
> +
>  Conceptually, the inode backing a guest_memfd file represents physical m=
emory,
>  i.e. is coupled to the virtual machine as a thing, not to a "struct kvm"=
.  The
>  file itself, which is bound to a "struct kvm", is that instance's view o=
f the
> @@ -6192,6 +6194,12 @@ most one mapping per page, i.e. binding multiple m=
emory regions to a single
>  guest_memfd range is not allowed (any number of memory regions can be bo=
und to
>  a single guest_memfd file, but the bound ranges must not overlap).
>
> +If KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is set in flags, KVM will attempt to a=
llocate
> +and map PMD-size hugepages for the guest_memfd file.  This is currently =
best
> +effort.  If KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is set, size must be aligned =
to at
> +least the size reported by KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE (which =
also
> +enumerates support for KVM_GUEST_MEMFD_ALLOW_HUGEPAGE).
> +
>  See KVM_SET_USER_MEMORY_REGION2 for additional details.
>
>  5. The kvm_run structure
> @@ -8639,6 +8647,15 @@ block sizes is exposed in KVM_CAP_ARM_SUPPORTED_BL=
OCK_SIZES as a
>  64-bit bitmap (each bit describing a block size). The default value is
>  0, to disable the eager page splitting.
>
> +
> +8.41 KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE
> +------------------------------------------
> +
> +This is an information-only capability that returns guest_memfd's hugepa=
ge size
> +for PMD hugepages.  Returns '0' if guest_memfd is not supported, or if K=
VM
> +doesn't support creating hugepages for guest_memfd.  Note, guest_memfd d=
oesn't
> +currently support PUD-sized hugepages.
> +
>  9. Known KVM API problems
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 25caee8d1a80..b78d0e3bf22a 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1217,6 +1217,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_MEMORY_FAULT_INFO 231
>  #define KVM_CAP_MEMORY_ATTRIBUTES 232
>  #define KVM_CAP_GUEST_MEMFD 233
> +#define KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE 234
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> @@ -2303,4 +2304,6 @@ struct kvm_create_guest_memfd {
>         __u64 reserved[6];
>  };
>
> +#define KVM_GUEST_MEMFD_ALLOW_HUGEPAGE         (1ULL << 0)
> +
>  #endif /* __LINUX_KVM_H */
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 98a12da80214..31b5e94d461a 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -13,14 +13,44 @@ struct kvm_gmem {
>         struct list_head entry;
>  };
>
> +#define NR_PAGES_PER_PMD (1 << PMD_ORDER)
> +
> +static struct folio *kvm_gmem_get_huge_folio(struct inode *inode, pgoff_=
t index)
> +{
> +       unsigned long huge_index =3D round_down(index, NR_PAGES_PER_PMD);
> +       unsigned long flags =3D (unsigned long)inode->i_private;
> +       struct address_space *mapping  =3D inode->i_mapping;
> +       gfp_t gfp =3D mapping_gfp_mask(mapping);
> +       struct folio *folio;
> +
> +       if (!(flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE))
> +               return NULL;
> +
> +       if (filemap_range_has_page(mapping, huge_index << PAGE_SHIFT,
> +                                  (huge_index + NR_PAGES_PER_PMD - 1) <<=
 PAGE_SHIFT))
> +               return NULL;
> +
> +       folio =3D filemap_alloc_folio(gfp, PMD_ORDER);
> +       if (!folio)
> +               return NULL;
> +
> +       if (filemap_add_folio(mapping, folio, huge_index, gfp)) {
> +               folio_put(folio);
> +               return NULL;
> +       }
> +       return folio;
> +}
> +
>  static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t ind=
ex)
>  {
>         struct folio *folio;
>
> -       /* TODO: Support huge pages. */
> -       folio =3D filemap_grab_folio(inode->i_mapping, index);
> -       if (IS_ERR_OR_NULL(folio))
> -               return NULL;
> +       folio =3D kvm_gmem_get_huge_folio(inode, index);
> +       if (!folio) {
> +               folio =3D filemap_grab_folio(inode->i_mapping, index);
> +               if (IS_ERR_OR_NULL(folio))
> +                       return NULL;
> +       }
>
>         /*
>          * Use the up-to-date flag to track whether or not the memory has=
 been
> @@ -373,6 +403,7 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t =
size, u64 flags)
>         inode->i_mode |=3D S_IFREG;
>         inode->i_size =3D size;
>         mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
> +       mapping_set_large_folios(inode->i_mapping);
>         mapping_set_unmovable(inode->i_mapping);
>         /* Unmovable mappings are supposed to be marked unevictable as we=
ll. */
>         WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
> @@ -394,14 +425,18 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_=
t size, u64 flags)
>
>  int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args=
)
>  {
> +       u64 valid_flags =3D KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
>         loff_t size =3D args->size;
>         u64 flags =3D args->flags;
> -       u64 valid_flags =3D 0;
>
>         if (flags & ~valid_flags)
>                 return -EINVAL;
>
> -       if (size < 0 || !PAGE_ALIGNED(size))
> +       if (size <=3D 0 || !PAGE_ALIGNED(size))
> +               return -EINVAL;
> +
> +       if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
> +           !IS_ALIGNED(size, PMD_SIZE))
>                 return -EINVAL;
>
>         return __kvm_gmem_create(kvm, size, flags);
> @@ -501,7 +536,7 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
>  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                      gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
>  {
> -       pgoff_t index =3D gfn - slot->base_gfn + slot->gmem.pgoff;
> +       pgoff_t index, huge_index;
>         struct kvm_gmem *gmem;
>         struct folio *folio;
>         struct page *page;
> @@ -514,6 +549,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memo=
ry_slot *slot,
>
>         gmem =3D file->private_data;
>
> +       index =3D gfn - slot->base_gfn + slot->gmem.pgoff;
>         if (WARN_ON_ONCE(xa_load(&gmem->bindings, index) !=3D slot)) {
>                 r =3D -EIO;
>                 goto out_fput;
> @@ -533,9 +569,24 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_mem=
ory_slot *slot,
>         page =3D folio_file_page(folio, index);
>
>         *pfn =3D page_to_pfn(page);
> -       if (max_order)
> +       if (!max_order)
> +               goto success;
> +
> +       *max_order =3D compound_order(compound_head(page));
> +       if (!*max_order)
> +               goto success;
> +
> +       /*
> +        * The folio can be mapped with a hugepage if and only if the fol=
io is
> +        * fully contained by the range the memslot is bound to.  Note, t=
he
> +        * caller is responsible for handling gfn alignment, this only de=
als
> +        * with the file binding.
> +        */
> +       huge_index =3D ALIGN(index, 1ull << *max_order);
> +       if (huge_index < ALIGN(slot->gmem.pgoff, 1ull << *max_order) ||
> +           huge_index + (1ull << *max_order) > slot->gmem.pgoff + slot->=
npages)
>                 *max_order =3D 0;
> -
> +success:
>         r =3D 0;
>
>  out_unlock:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 5d1a2f1b4e94..0711f2c75667 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4888,6 +4888,10 @@ static int kvm_vm_ioctl_check_extension_generic(st=
ruct kvm *kvm, long arg)
>  #ifdef CONFIG_KVM_PRIVATE_MEM
>         case KVM_CAP_GUEST_MEMFD:
>                 return !kvm || kvm_arch_has_private_mem(kvm);
> +       case KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE:
> +               if (kvm && !kvm_arch_has_private_mem(kvm))
> +                       return 0;
> +               return PMD_SIZE;
>  #endif
>         default:
>                 break;
>
> base-commit: fcbef1e5e5d2a60dacac0d16c06ac00bedaefc0f
> --
>

