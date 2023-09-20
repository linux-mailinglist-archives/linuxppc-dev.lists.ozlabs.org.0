Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 307D57A8FF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 01:45:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cc/D8HFX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrZsf02L0z3cC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 09:45:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cc/D8HFX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=38imlzqykdfuf1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrZrj3rqRz2ysC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 09:44:51 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c4375c1406so2860945ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 16:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695253489; x=1695858289; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMbatuEIGrWsTlMlK7Tk6yapZGH8kwO0Z4+wG56Y3PQ=;
        b=cc/D8HFXhwvZvrzFr5z6F/6428N1iolyg6jHERUr8AAQ+mFR4OKAEddPOfiHqB35uE
         qJ0rc6EXWQtcbzoQzRq9KNfTeSvFtN+wLDSgPfMLuxdJDPUSPgjSoegeXTwaNw34wFXM
         WNQStj9HSziaKr9TEu0sZ+f6mE6owaIn8ycfG8bpqSjXiCL0NaGMPPzE4FlZQYlt9DKO
         a7RZ1P0+cp47r7asGh1iWxv1FIqkq4+k4KfrrgaGE+wHH1PrxpWrHCmoL12jEtqQ3JGS
         QqPGXNhHUPX4fGCp4ng5ePVBQIPXiVgew+345l5blWa+LipXJ8WMX/DNITdr6ytjpn+R
         f/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695253489; x=1695858289;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YMbatuEIGrWsTlMlK7Tk6yapZGH8kwO0Z4+wG56Y3PQ=;
        b=VEcnQGwwsNtFZ+ii7ASOKM4mQa3uU4ZZc4U/bLK8pSBiQBlofoWDIz5TC8EbLZBsNZ
         +r4SyLjqMdgyzwoinARL3KUX9tnQMMRDCAUhBttiSHcn7kpeFN9t/jlKruZUmmHyN8hf
         ERyRyDnLOtkRFhUPKPVaGZUdnB2b9SOqETz4sxoPyKdG3awnKWlPTwB1SoXQdo21tJNP
         jnhBhzgE6rDKnwRQJZSwZP7aen4P/jWToCoTzWiDWU1EITpk7E6dQh9OkSfTTNJPv/DG
         1Tdoc7LKY5ZdtH9FIgbaR+bHUCWVFI6N09k4ltpxqtpXEFdzeNYDxTYeYxGEu2j3AwkF
         vVkA==
X-Gm-Message-State: AOJu0YwJiBfrIo4s6FkYvaMPPq1BUQoZeV1HDRir03F7m3amlnNTjW3y
	mpTuZAF7Lv87HG21ZGWUagdIlOry6vg=
X-Google-Smtp-Source: AGHT+IHQbG7yFE9jJPEUI1XKEjcd5Hn7eouqEyZetIlWhAmmYx1Ip3XqohOdLN8YNlfaQrxQ5DSfhNksAYI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:22d0:b0:1ae:6895:cb96 with SMTP id
 y16-20020a17090322d000b001ae6895cb96mr56298plg.5.1695253488829; Wed, 20 Sep
 2023 16:44:48 -0700 (PDT)
Date: Wed, 20 Sep 2023 16:44:47 -0700
In-Reply-To: <20230918163647.m6bjgwusc7ww5tyu@amd.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-15-seanjc@google.com>
 <20230918163647.m6bjgwusc7ww5tyu@amd.com>
Message-ID: <ZQuD77vlBiSU/PE4@google.com>
Subject: Re: [RFC PATCH v12 14/33] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, 
 Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023, Michael Roth wrote:
> > +static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
> > +{
> > +	struct list_head *gmem_list = &inode->i_mapping->private_list;
> > +	pgoff_t start = offset >> PAGE_SHIFT;
> > +	pgoff_t end = (offset + len) >> PAGE_SHIFT;
> > +	struct kvm_gmem *gmem;
> > +
> > +	/*
> > +	 * Bindings must stable across invalidation to ensure the start+end
> > +	 * are balanced.
> > +	 */
> > +	filemap_invalidate_lock(inode->i_mapping);
> > +
> > +	list_for_each_entry(gmem, gmem_list, entry) {
> > +		kvm_gmem_invalidate_begin(gmem, start, end);
> 
> In v11 we used to call truncate_inode_pages_range() here to drop filemap's
> reference on the folio. AFAICT the folios are only getting free'd upon
> guest shutdown without this. Was this on purpose?

Nope, I just spotted this too.  And then after scratching my head for a few minutes,
wondering if I was having an -ENOCOFFEE moment, I finally read your mail.  *sigh*

Looking at my reflog history, I'm pretty sure I deleted the wrong line when
removing the truncation from kvm_gmem_error_page().

> > +		kvm_gmem_invalidate_end(gmem, start, end);
> > +	}
> > +
> > +	filemap_invalidate_unlock(inode->i_mapping);
> > +
> > +	return 0;
> > +}
> > +
> > +static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
> > +{
> > +	struct address_space *mapping = inode->i_mapping;
> > +	pgoff_t start, index, end;
> > +	int r;
> > +
> > +	/* Dedicated guest is immutable by default. */
> > +	if (offset + len > i_size_read(inode))
> > +		return -EINVAL;
> > +
> > +	filemap_invalidate_lock_shared(mapping);
> 
> We take the filemap lock here, but not for
> kvm_gmem_get_pfn()->kvm_gmem_get_folio(). Is it needed there as well?

No, we specifically do not want to take a rwsem when faulting in guest memory.
Callers of kvm_gmem_get_pfn() *must* guard against concurrent invalidations via
mmu_invalidate_seq and friends.

> > +	/*
> > +	 * For simplicity, require the offset into the file and the size of the
> > +	 * memslot to be aligned to the largest possible page size used to back
> > +	 * the file (same as the size of the file itself).
> > +	 */
> > +	if (!kvm_gmem_is_valid_size(offset, flags) ||
> > +	    !kvm_gmem_is_valid_size(size, flags))
> > +		goto err;
> 
> I needed to relax this check for SNP. KVM_GUEST_MEMFD_ALLOW_HUGEPAGE
> applies to entire gmem inode, so it makes sense for userspace to enable
> hugepages if start/end are hugepage-aligned, but QEMU will do things
> like map overlapping regions for ROMs and other things on top of the
> GPA range that the gmem inode was originally allocated for. For
> instance:
> 
>   692500@1689108688.696338:kvm_set_user_memory AddrSpace#0 Slot#0 flags=0x4 gpa=0x0 size=0x80000000 ua=0x7fbf5be00000 ret=0 restricted_fd=19 restricted_offset=0x0
>   692500@1689108688.699802:kvm_set_user_memory AddrSpace#0 Slot#1 flags=0x4 gpa=0x100000000 size=0x380000000 ua=0x7fbfdbe00000 ret=0 restricted_fd=19 restricted_offset=0x80000000
>   692500@1689108688.795412:kvm_set_user_memory AddrSpace#0 Slot#0 flags=0x0 gpa=0x0 size=0x0 ua=0x7fbf5be00000 ret=0 restricted_fd=19 restricted_offset=0x0
>   692500@1689108688.795550:kvm_set_user_memory AddrSpace#0 Slot#0 flags=0x4 gpa=0x0 size=0xc0000 ua=0x7fbf5be00000 ret=0 restricted_fd=19 restricted_offset=0x0
>   692500@1689108688.796227:kvm_set_user_memory AddrSpace#0 Slot#6 flags=0x4 gpa=0x100000 size=0x7ff00000 ua=0x7fbf5bf00000 ret=0 restricted_fd=19 restricted_offset=0x100000
> 
> Because of that the KVM_SET_USER_MEMORY_REGIONs for non-THP-aligned GPAs
> will fail. Maybe instead it should be allowed, and kvm_gmem_get_folio()
> should handle the alignment checks on a case-by-case and simply force 4k
> for offsets corresponding to unaligned bindings?

Yeah, I wanted to keep the code simple, but disallowing small bindings/memslots
is probably going to be a deal-breaker.  Even though I'm skeptical that QEMU
_needs_ to play these games for SNP guests, not playing nice will make it all
but impossible to use guest_memfd for regular VMs.

And the code isn't really any more complex, so long as we punt on allowing
hugepages on interior sub-ranges.

Compile-tested only, but this?

---
 virt/kvm/guest_mem.c | 54 ++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index a819367434e9..dc12e38211df 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -426,20 +426,6 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags,
 	return err;
 }
 
-static bool kvm_gmem_is_valid_size(loff_t size, u64 flags)
-{
-	if (size < 0 || !PAGE_ALIGNED(size))
-		return false;
-
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
-	    !IS_ALIGNED(size, HPAGE_PMD_SIZE))
-		return false;
-#endif
-
-	return true;
-}
-
 int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 {
 	loff_t size = args->size;
@@ -452,9 +438,15 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
-	if (!kvm_gmem_is_valid_size(size, flags))
+	if (size < 0 || !PAGE_ALIGNED(size))
 		return -EINVAL;
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
+	    !IS_ALIGNED(size, HPAGE_PMD_SIZE))
+		return false;
+#endif
+
 	return __kvm_gmem_create(kvm, size, flags, kvm_gmem_mnt);
 }
 
@@ -462,7 +454,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 		  unsigned int fd, loff_t offset)
 {
 	loff_t size = slot->npages << PAGE_SHIFT;
-	unsigned long start, end, flags;
+	unsigned long start, end;
 	struct kvm_gmem *gmem;
 	struct inode *inode;
 	struct file *file;
@@ -481,16 +473,9 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 		goto err;
 
 	inode = file_inode(file);
-	flags = (unsigned long)inode->i_private;
 
-	/*
-	 * For simplicity, require the offset into the file and the size of the
-	 * memslot to be aligned to the largest possible page size used to back
-	 * the file (same as the size of the file itself).
-	 */
-	if (!kvm_gmem_is_valid_size(offset, flags) ||
-	    !kvm_gmem_is_valid_size(size, flags))
-		goto err;
+	if (offset < 0 || !PAGE_ALIGNED(offset))
+		return -EINVAL;
 
 	if (offset + size > i_size_read(inode))
 		goto err;
@@ -591,8 +576,23 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	page = folio_file_page(folio, index);
 
 	*pfn = page_to_pfn(page);
-	if (max_order)
-		*max_order = compound_order(compound_head(page));
+	if (!max_order)
+		goto success;
+
+	*max_order = compound_order(compound_head(page));
+	if (!*max_order)
+		goto success;
+
+	/*
+	 * For simplicity, allow mapping a hugepage if and only if the entire
+	 * binding is compatible, i.e. don't bother supporting mapping interior
+	 * sub-ranges with hugepages (unless userspace comes up with a *really*
+	 * strong use case for needing hugepages within unaligned bindings).
+	 */
+	if (!IS_ALIGNED(slot->gmem.pgoff, 1ull << *max_order) ||
+	    !IS_ALIGNED(slot->npages, 1ull << *max_order))
+		*max_order = 0;
+success:
 	r = 0;
 
 out_unlock:

base-commit: bc1a54ee393e0574ea422525cf0b2f1e768e38c5
-- 

