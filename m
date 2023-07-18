Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD357589D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 02:00:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=vxUR1tuj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5GCp5lfcz3cb0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 10:00:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=vxUR1tuj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=36cs3zaykddspbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Fyy2jzmz30hW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:48:58 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b8a44ee130so32271855ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724137; x=1692316137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/pt3Q2tpoxQxXn1tLyyE1UR18jbz9QzeXCmKj/ev2NM=;
        b=vxUR1tuj/vcGsaOe3o3Dg3+dBjjNSQ1vNUqJnA915YLta3qnEHtgJJmhnuBEvMSvuO
         PeQ54yO76QkRq4Poh7gfw5EibjHULF6szcbTO++R7xTLcTVHQgaEtb3O2GkE8TOOgrPj
         j+skKU6AKAL/CHeOI2fWZhtH2+GBhR8GFXcSgy+S791M68OMvBR8fw1sghKrAfPeG39D
         aPhvXxFMYa/vphJO2xprgh5gp8hbsuB9tPxNTIVm7fk+E06HBzO4G4hjTZ+UFpjlD7u9
         AiVs2GVbO1nSDvgFw3EWZlgv0q++Q9CJ07oUOhmTcF8UoY6sdZ1aY/fD8Yp9QaPi1uiy
         5yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724137; x=1692316137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pt3Q2tpoxQxXn1tLyyE1UR18jbz9QzeXCmKj/ev2NM=;
        b=K04+xBrHRsFc6oG8ew3iTRrfal3ny+lWgtFbOOCOV5jQBeJnWa5JPyo8VZFagsimvG
         cXpygQa8ca7RmkllCnGXn1UVXNsvhGM/st2Em6rABJ3TAAlatYPoj5f6w7/TAxefPA2M
         NcNAOdlQIgnWe/785CGUV738TyvgNe669JBs0UofbYtGb72PAbOgmRr/o5h5OLoaGhTX
         Ey6Xgqbc5zkeiIgeOIniOPxcFVlrgChwLXspr0umfe58+uYKis+7WdGhp80z8Rm90s56
         QXDOyKJLZ9NDmLX440ojRf2r7nO5dYqMjPqrSRxtN/dytczv8+1jQWq/l8PZ8pIjgp2s
         +QaQ==
X-Gm-Message-State: ABy/qLasrQCWYPgfASkfwwEy2GhjSNVENBrf04CcyQAl2H5Ejwt1mPaA
	3R0Qvppz6Ns5hJv/eUJEFFCez8DSPzs=
X-Google-Smtp-Source: APBJJlFIKaKNLayUXkm9YIdNhY8NWw+bGGk4UkSeGDFPqrXqT1vlGljtzz/Lr2RncRF8zUbyrReIDSYCDDk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ce88:b0:1ab:18eb:17c8 with SMTP id
 f8-20020a170902ce8800b001ab18eb17c8mr7987plg.2.1689724136690; Tue, 18 Jul
 2023 16:48:56 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:56 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-14-seanjc@google.com>
Subject: [RFC PATCH v11 13/29] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/uapi/linux/kvm.h |  2 ++
 virt/kvm/guest_mem.c     | 52 ++++++++++++++++++++++++++++++++++++----
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 9b344fc98598..17b12ee8b70e 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -2290,6 +2290,8 @@ struct kvm_memory_attributes {
 
 #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
 
+#define KVM_GUEST_MEMFD_ALLOW_HUGEPAGE		(1ULL << 0)
+
 struct kvm_create_guest_memfd {
 	__u64 size;
 	__u64 flags;
diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index 1b705fd63fa8..384671a55b41 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -17,15 +17,48 @@ struct kvm_gmem {
 	struct list_head entry;
 };
 
-static struct folio *kvm_gmem_get_folio(struct file *file, pgoff_t index)
+static struct folio *kvm_gmem_get_huge_folio(struct inode *inode, pgoff_t index)
 {
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	unsigned long huge_index = round_down(index, HPAGE_PMD_NR);
+	unsigned long flags = (unsigned long)inode->i_private;
+	struct address_space *mapping  = inode->i_mapping;
+	gfp_t gfp = mapping_gfp_mask(mapping);
 	struct folio *folio;
 
-	/* TODO: Support huge pages. */
-	folio = filemap_grab_folio(file->f_mapping, index);
+	if (!(flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE))
+		return NULL;
+
+	if (filemap_range_has_page(mapping, huge_index << PAGE_SHIFT,
+				   (huge_index + HPAGE_PMD_NR - 1) << PAGE_SHIFT))
+		return NULL;
+
+	folio = filemap_alloc_folio(gfp, HPAGE_PMD_ORDER);
 	if (!folio)
 		return NULL;
 
+	if (filemap_add_folio(mapping, folio, huge_index, gfp)) {
+		folio_put(folio);
+		return NULL;
+	}
+
+	return folio;
+#else
+	return NULL;
+#endif
+}
+
+static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
+{
+	struct folio *folio;
+
+	folio = kvm_gmem_get_huge_folio(inode, index);
+	if (!folio) {
+		folio = filemap_grab_folio(inode->i_mapping, index);
+		if (!folio)
+			return NULL;
+	}
+
 	/*
 	 * Use the up-to-date flag to track whether or not the memory has been
 	 * zeroed before being handed off to the guest.  There is no backing
@@ -332,7 +365,8 @@ static const struct inode_operations kvm_gmem_iops = {
 	.setattr	= kvm_gmem_setattr,
 };
 
-static int __kvm_gmem_create(struct kvm *kvm, loff_t size, struct vfsmount *mnt)
+static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags,
+			     struct vfsmount *mnt)
 {
 	const char *anon_name = "[kvm-gmem]";
 	const struct qstr qname = QSTR_INIT(anon_name, strlen(anon_name));
@@ -355,6 +389,7 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, struct vfsmount *mnt)
 	inode->i_mode |= S_IFREG;
 	inode->i_size = size;
 	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
+	mapping_set_large_folios(inode->i_mapping);
 	mapping_set_unevictable(inode->i_mapping);
 	mapping_set_unmovable(inode->i_mapping);
 
@@ -404,6 +439,12 @@ static bool kvm_gmem_is_valid_size(loff_t size, u64 flags)
 	if (size < 0 || !PAGE_ALIGNED(size))
 		return false;
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
+	    !IS_ALIGNED(size, HPAGE_PMD_SIZE))
+		return false;
+#endif
+
 	return true;
 }
 
@@ -413,6 +454,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 	u64 flags = args->flags;
 	u64 valid_flags = 0;
 
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		valid_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
+
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
-- 
2.41.0.255.g8b1d071c50-goog

