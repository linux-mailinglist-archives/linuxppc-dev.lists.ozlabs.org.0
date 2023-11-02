Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ABC7DF69E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 16:39:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JY9Ot+wc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLp2F5QzJz3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 02:39:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JY9Ot+wc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3w8jdzqykdcaoa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLp1F6LD4z3cRH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 02:38:07 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5afa86b8d66so14595787b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 08:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698939483; x=1699544283; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Djt9nhoFwnRVHKi/ktNpcOC5s8Lv9feOIxZ1Y9JKJMU=;
        b=JY9Ot+wclJkSxwRJrxDQe9NMoSyUSdkO1kIw8EhvChj1j5IwOHe3ngxoRuM6gZoUZP
         9iHOJU7Rg9N4sEXEGZ2NkPqHJ1hm2MxaPbSit1aBE6tupFhgvzGiX4KLdkg6O18K6jig
         HP9JkO0ys/JauQLx5/vxIV9UZZ0Rr2FUpnoVz6Cpy/OXDM0n2cgsh7+BfH1ebXDNRciK
         NbXgQD/OkepjXxG7cuNoZ62mVyPh0a2He83f3IxDpDZqmAizSQjeATaVNFPvrQInTYeT
         b1KCAqRz6RWtPyi5EFg/TFQ5x+TDy1phMj0GbvB37P00W7z3Qtcgyjhyxh4qDe3pVNwc
         ioUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698939483; x=1699544283;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Djt9nhoFwnRVHKi/ktNpcOC5s8Lv9feOIxZ1Y9JKJMU=;
        b=rYloFzOY7oGMF4Fu7pxi/EmVcsPuno5QN9s6+TYfxBZdwFJfgLCPpWemXiUMqg1N+o
         fqbXzPOw3La3m4K3gB11w0Ws5gmvdWSRrcdF0SPl2/ViHSWVYbgZKrRfjcxT3/okI6FM
         SObik1QHs64uLefqsVJDZxut/iRTmkU7Dv6RjZfpRgriLjZ2GsRwjTza6Zyt3s/jDjua
         Et0EnHi2QcReFTydCn+4DIsD4P8c45lNqOOjq1jb/2i2xo/GpsiVvybkhnkvRGii3Yty
         nDSUYlSKrUd9ufGfGGk+ztP0PhaG7PlYg4jRgORCKbVNJPTkAy/uG3GV3/XqAC9r5uz3
         wG5w==
X-Gm-Message-State: AOJu0YxowqPSv/lIYKegCjopbpNIp0lJcf4WWdAMSXiEPKFGs+xFOB7M
	xYdKm3EAl1i1kExI6pNabrctAInYIZM=
X-Google-Smtp-Source: AGHT+IEEyjIaBF20Z+W+qpNozhmx7pCgnMaB7hSicNkCqZ1DUoIMtGZcYN59XWhCRCiGJ/+gJuVvphWrNGQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:cfca:0:b0:d9a:556d:5f8a with SMTP id
 f193-20020a25cfca000000b00d9a556d5f8amr360317ybg.12.1698939483567; Thu, 02
 Nov 2023 08:38:03 -0700 (PDT)
Date: Thu, 2 Nov 2023 08:38:01 -0700
In-Reply-To: <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-18-seanjc@google.com> <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
 <ZUEML6oJXDCFJ9fg@google.com> <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
 <ZUJVfCkIYYFp5VwG@google.com> <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com> <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
 <ZULSkilO-tdgDGyT@google.com> <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
Message-ID: <ZUPCWfO1iO77-KDA@google.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, A
 nup Patel <anup@brainfault.org>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 02, 2023, Paolo Bonzini wrote:
> On Wed, Nov 1, 2023 at 11:35=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Wed, Nov 01, 2023, Paolo Bonzini wrote:
> > > On 11/1/23 17:36, Sean Christopherson wrote:
> > > > Can you post a fixup patch?  It's not clear to me exactly what beha=
vior you intend
> > > > to end up with.
> > >
> > > Sure, just this:
> > >
> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > index 7d1a33c2ad42..34fd070e03d9 100644
> > > --- a/virt/kvm/guest_memfd.c
> > > +++ b/virt/kvm/guest_memfd.c
> > > @@ -430,10 +430,7 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_=
create_guest_memfd *args)
> > >  {
> > >       loff_t size =3D args->size;
> > >       u64 flags =3D args->flags;
> > > -     u64 valid_flags =3D 0;
> > > -
> > > -     if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> > > -             valid_flags |=3D KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
> > > +     u64 valid_flags =3D KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
> > >       if (flags & ~valid_flags)
> > >               return -EINVAL;
> > > @@ -441,11 +438,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_=
create_guest_memfd *args)
> > >       if (size < 0 || !PAGE_ALIGNED(size))
> > >               return -EINVAL;
> > > -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > >       if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
> > >           !IS_ALIGNED(size, HPAGE_PMD_SIZE))
> > >               return -EINVAL;
> > > -#endif
> >
> > That won't work, HPAGE_PMD_SIZE is valid only for CONFIG_TRANSPARENT_HU=
GEPAGE=3Dy.
> >
> > #else /* CONFIG_TRANSPARENT_HUGEPAGE */
> > #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
> > #define HPAGE_PMD_MASK ({ BUILD_BUG(); 0; })
> > #define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })
>=20
> Would have caught it when actually testing it, I guess. :) It has to
> be PMD_SIZE, possibly with
>=20
> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> BUILD_BUG_ON(HPAGE_PMD_SIZE !=3D PMD_SIZE);
> #endif

Yeah, that works for me.

Actually, looking that this again, there's not actually a hard dependency o=
n THP.
A THP-enabled kernel _probably_  gives a higher probability of using hugepa=
ges,
but mostly because THP selects COMPACTION, and I suppose because using THP =
for
other allocations reduces overall fragmentation.

So rather than honor KVM_GUEST_MEMFD_ALLOW_HUGEPAGE iff THP is enabled, I t=
hink
we should do the below (I verified KVM can create hugepages with THP=3Dn). =
 We'll
need another capability, but (a) we probably should have that anyways and (=
b) it
provides a cleaner path to adding PUD-sized hugepage support in the future.

And then adjust the tests like so:

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing=
/selftests/kvm/guest_memfd_test.c
index c15de9852316..c9f449718fce 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -201,6 +201,10 @@ int main(int argc, char *argv[])
=20
        TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
=20
+       if (kvm_has_cap(KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE) && thp_confi=
gured())
+               TEST_ASSERT_EQ(get_trans_hugepagesz(),
+                              kvm_check_cap(KVM_CAP_GUEST_MEMFD_HUGEPAGE_P=
MD_SIZE));
+
        page_size =3D getpagesize();
        total_size =3D page_size * 4;
=20
diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_tes=
t.c b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
index be311944e90a..245901587ed2 100644
--- a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
@@ -396,7 +396,7 @@ static void test_mem_conversions(enum vm_mem_backing_sr=
c_type src_type, uint32_t
=20
        vm_enable_cap(vm, KVM_CAP_EXIT_HYPERCALL, (1 << KVM_HC_MAP_GPA_RANG=
E));
=20
-       if (backing_src_can_be_huge(src_type))
+       if (kvm_has_cap(KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE))
                memfd_flags =3D KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
        else
                memfd_flags =3D 0;

--
From: Sean Christopherson <seanjc@google.com>
Date: Wed, 25 Oct 2023 16:26:41 -0700
Subject: [PATCH] KVM: Add best-effort hugepage support for dedicated guest
 memory

Extend guest_memfd to allow backing guest memory with hugepages.  For now,
make hugepage utilization best-effort, i.e. fall back to non-huge mappings
if a hugepage can't be allocated.  Guaranteeing hugepages would require a
dedicated memory pool and significantly more complexity and churn..

Require userspace to opt-in via a flag even though it's unlikely real use
cases will ever want to use order-0 pages, e.g. to give userspace a safety
valve in case hugepage support is buggy, and to allow for easier testing
of both paths.

Do not take a dependency on CONFIG_TRANSPARENT_HUGEPAGE, as THP enabling
primarily deals with userspace page tables, which are explicitly not in
play for guest_memfd.  Selecting THP does make obtaining hugepages more
likely, but only because THP selects CONFIG_COMPACTION.  Don't select
CONFIG_COMPACTION either, because again it's not a hard dependency.

For simplicity, require the guest_memfd size to be a multiple of the
hugepage size, e.g. so that KVM doesn't need to do bounds checking when
deciding whether or not to allocate a huge folio.

When reporting the max order when KVM gets a pfn from guest_memfd, force
order-0 pages if the hugepage is not fully contained by the memslot
binding, e.g. if userspace requested hugepages but punches a hole in the
memslot bindings in order to emulate x86's VGA hole.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 17 +++++++++
 include/uapi/linux/kvm.h       |  3 ++
 virt/kvm/guest_memfd.c         | 69 +++++++++++++++++++++++++++++-----
 virt/kvm/kvm_main.c            |  4 ++
 4 files changed, 84 insertions(+), 9 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rs=
t
index e82c69d5e755..ccdd5413920d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6176,6 +6176,8 @@ and cannot be resized  (guest_memfd files do however =
support PUNCH_HOLE).
 	__u64 reserved[6];
   };
=20
+  #define KVM_GUEST_MEMFD_ALLOW_HUGEPAGE         (1ULL << 0)
+
 Conceptually, the inode backing a guest_memfd file represents physical mem=
ory,
 i.e. is coupled to the virtual machine as a thing, not to a "struct kvm". =
 The
 file itself, which is bound to a "struct kvm", is that instance's view of =
the
@@ -6192,6 +6194,12 @@ most one mapping per page, i.e. binding multiple mem=
ory regions to a single
 guest_memfd range is not allowed (any number of memory regions can be boun=
d to
 a single guest_memfd file, but the bound ranges must not overlap).
=20
+If KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is set in flags, KVM will attempt to all=
ocate
+and map PMD-size hugepages for the guest_memfd file.  This is currently be=
st
+effort.  If KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is set, size must be aligned to=
 at
+least the size reported by KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE (which al=
so
+enumerates support for KVM_GUEST_MEMFD_ALLOW_HUGEPAGE).
+
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
=20
 5. The kvm_run structure
@@ -8639,6 +8647,15 @@ block sizes is exposed in KVM_CAP_ARM_SUPPORTED_BLOC=
K_SIZES as a
 64-bit bitmap (each bit describing a block size). The default value is
 0, to disable the eager page splitting.
=20
+
+8.41 KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE
+------------------------------------------
+
+This is an information-only capability that returns guest_memfd's hugepage=
 size
+for PMD hugepages.  Returns '0' if guest_memfd is not supported, or if KVM
+doesn't support creating hugepages for guest_memfd.  Note, guest_memfd doe=
sn't
+currently support PUD-sized hugepages.
+
 9. Known KVM API problems
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=20
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 25caee8d1a80..b78d0e3bf22a 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1217,6 +1217,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_MEMORY_FAULT_INFO 231
 #define KVM_CAP_MEMORY_ATTRIBUTES 232
 #define KVM_CAP_GUEST_MEMFD 233
+#define KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE 234
=20
 #ifdef KVM_CAP_IRQ_ROUTING
=20
@@ -2303,4 +2304,6 @@ struct kvm_create_guest_memfd {
 	__u64 reserved[6];
 };
=20
+#define KVM_GUEST_MEMFD_ALLOW_HUGEPAGE		(1ULL << 0)
+
 #endif /* __LINUX_KVM_H */
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 98a12da80214..31b5e94d461a 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -13,14 +13,44 @@ struct kvm_gmem {
 	struct list_head entry;
 };
=20
+#define NR_PAGES_PER_PMD (1 << PMD_ORDER)
+
+static struct folio *kvm_gmem_get_huge_folio(struct inode *inode, pgoff_t =
index)
+{
+	unsigned long huge_index =3D round_down(index, NR_PAGES_PER_PMD);
+	unsigned long flags =3D (unsigned long)inode->i_private;
+	struct address_space *mapping  =3D inode->i_mapping;
+	gfp_t gfp =3D mapping_gfp_mask(mapping);
+	struct folio *folio;
+
+	if (!(flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE))
+		return NULL;
+
+	if (filemap_range_has_page(mapping, huge_index << PAGE_SHIFT,
+				   (huge_index + NR_PAGES_PER_PMD - 1) << PAGE_SHIFT))
+		return NULL;
+
+	folio =3D filemap_alloc_folio(gfp, PMD_ORDER);
+	if (!folio)
+		return NULL;
+
+	if (filemap_add_folio(mapping, folio, huge_index, gfp)) {
+		folio_put(folio);
+		return NULL;
+	}
+	return folio;
+}
+
 static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index=
)
 {
 	struct folio *folio;
=20
-	/* TODO: Support huge pages. */
-	folio =3D filemap_grab_folio(inode->i_mapping, index);
-	if (IS_ERR_OR_NULL(folio))
-		return NULL;
+	folio =3D kvm_gmem_get_huge_folio(inode, index);
+	if (!folio) {
+		folio =3D filemap_grab_folio(inode->i_mapping, index);
+		if (IS_ERR_OR_NULL(folio))
+			return NULL;
+	}
=20
 	/*
 	 * Use the up-to-date flag to track whether or not the memory has been
@@ -373,6 +403,7 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t si=
ze, u64 flags)
 	inode->i_mode |=3D S_IFREG;
 	inode->i_size =3D size;
 	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
+	mapping_set_large_folios(inode->i_mapping);
 	mapping_set_unmovable(inode->i_mapping);
 	/* Unmovable mappings are supposed to be marked unevictable as well. */
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
@@ -394,14 +425,18 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t =
size, u64 flags)
=20
 int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 {
+	u64 valid_flags =3D KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
 	loff_t size =3D args->size;
 	u64 flags =3D args->flags;
-	u64 valid_flags =3D 0;
=20
 	if (flags & ~valid_flags)
 		return -EINVAL;
=20
-	if (size < 0 || !PAGE_ALIGNED(size))
+	if (size <=3D 0 || !PAGE_ALIGNED(size))
+		return -EINVAL;
+
+	if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
+	    !IS_ALIGNED(size, PMD_SIZE))
 		return -EINVAL;
=20
 	return __kvm_gmem_create(kvm, size, flags);
@@ -501,7 +536,7 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
 {
-	pgoff_t index =3D gfn - slot->base_gfn + slot->gmem.pgoff;
+	pgoff_t index, huge_index;
 	struct kvm_gmem *gmem;
 	struct folio *folio;
 	struct page *page;
@@ -514,6 +549,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory=
_slot *slot,
=20
 	gmem =3D file->private_data;
=20
+	index =3D gfn - slot->base_gfn + slot->gmem.pgoff;
 	if (WARN_ON_ONCE(xa_load(&gmem->bindings, index) !=3D slot)) {
 		r =3D -EIO;
 		goto out_fput;
@@ -533,9 +569,24 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memor=
y_slot *slot,
 	page =3D folio_file_page(folio, index);
=20
 	*pfn =3D page_to_pfn(page);
-	if (max_order)
+	if (!max_order)
+		goto success;
+
+	*max_order =3D compound_order(compound_head(page));
+	if (!*max_order)
+		goto success;
+
+	/*
+	 * The folio can be mapped with a hugepage if and only if the folio is
+	 * fully contained by the range the memslot is bound to.  Note, the
+	 * caller is responsible for handling gfn alignment, this only deals
+	 * with the file binding.
+	 */
+	huge_index =3D ALIGN(index, 1ull << *max_order);
+	if (huge_index < ALIGN(slot->gmem.pgoff, 1ull << *max_order) ||
+	    huge_index + (1ull << *max_order) > slot->gmem.pgoff + slot->npages)
 		*max_order =3D 0;
-
+success:
 	r =3D 0;
=20
 out_unlock:
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5d1a2f1b4e94..0711f2c75667 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4888,6 +4888,10 @@ static int kvm_vm_ioctl_check_extension_generic(stru=
ct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
+	case KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE:
+		if (kvm && !kvm_arch_has_private_mem(kvm))
+			return 0;
+		return PMD_SIZE;
 #endif
 	default:
 		break;

base-commit: fcbef1e5e5d2a60dacac0d16c06ac00bedaefc0f
--
