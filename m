Return-Path: <linuxppc-dev+bounces-17418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI4kCpD6oWl4yAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:12:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C73B1BD550
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:11:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMzxm596kz3c1J;
	Sat, 28 Feb 2026 07:11:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772223116;
	cv=none; b=bLUoVhpzSxZ6y2uAYZBUV2I/cwVcz7NH2B22ZX+ib06bzAXmPvPqfCF3fOA9n23JLC+OCbbZ+G5x4bV5SH3anLUhUGUFkdLRgSCZouoyD/6SdJxH5POZnk1NAYuJMEwqS/IG+k7KjVl4sNkbystrWSPxvdkk3V7A6REyQvWt5FyNBTB4+sWq2egW4ebFFJlmk1JY+QkwSLzsVw+ugtmR5bXGwAV0lZeNTeYeu5HdNZhv/4FAsg9AUO8PUxInIWqynAMLhD4aZQcNELCWPWsQwnip2vePb9vkDFwirRMiE1bRgTjAw+eSn3nIOHjHYL3CfWYSQhBDRe2f3MsJ0QQ6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772223116; c=relaxed/relaxed;
	bh=V07slyxq3arKEFSTLk3cL4jebUrSDREMfZ8omvVNUpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrSI3Shj1jH3RxeaTZRT/F2TDr5hIiUz70xBuqsfWI0ZoCoH4PItpNpA8AvWySvki5Q2QVpFdMkiI0AhiV/+tThTIJ4RP3j5ugzol4III9Y/xYmnSWhF6dZBTkGQqQRWNDv7PVaVstwOhkJkGz7BxEuUmZX0CqII7H7FslTZhdkf8TsMWpYLFlJW6cbaLK9/3jAkdMk2d6r8v73VjyU3ZG01/+w4C6uOgCB2BgVUiioyK6OHTkRYh1Ty+WZGZ6Xdx2l8sfjwYP0GvGM8RdwPsC6NYAE4BWGlF74g1AD5OCn7BfLo5/A5LNTm6SWE+5qHFBIAUOXt5Ie/JpKf2vmsPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mqTK4ziI; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mqTK4ziI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMzxl6bD6z2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 07:11:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52B7241843;
	Fri, 27 Feb 2026 20:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F1FC116C6;
	Fri, 27 Feb 2026 20:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772223114;
	bh=I5k8d/7BhjTgSAWiS/rU+NWa+WlmbxH2nIHZouG4qQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mqTK4ziIkeceLpOMlpc9Z3pxLBxf+uElw1bxcxQsf50OwHmsXyG8JxCnQBvafY8L8
	 CBoR0oUKd8BfbexVek1eSk440DDZw8CZg1d3pBVVBhMAofC8lV7GSd4wOs8ZGvwQc6
	 gG2H8vqWX8ELemznuQXqyAwHtagW9ERzcgDt+oTFrkOj6Hnrd+KZQbWXQcmnthmek8
	 +vBEQhzvxIXjGxGImAh3NyciAlusUwXZudtLW9IZnKynhZJO4tb/IuLubzDUsLdgNg
	 2YWaQinZZpstMXww2VbVV42oOagkVcy4IAHbH1UPy7e8FZkiElL1SY+N80lOyHpM+g
	 OaaWmRapbAJgA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "linux-mm @ kvack . org" <linux-mm@kvack.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-sgx@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-rdma@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v1 10/16] mm/memory: use __zap_vma_range() in zap_vma_for_reaping()
Date: Fri, 27 Feb 2026 21:08:41 +0100
Message-ID: <20260227200848.114019-11-david@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227200848.114019-1-david@kernel.org>
References: <20260227200848.114019-1-david@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17418-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:rientjes@google.com,m:shakeel.butt@linux.dev,m:willy@infradead.org,m:aliceryhl@google.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:gregkh@linuxfoundation.org,m:arve@android.com,m:tkjos@android.com,m:brauner@kernel.org,m:cmllamas@google.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:jgg@ziepe.
 ca,m:leon@kernel.org,m:dimitri.sivanich@hpe.com,m:arnd@arndb.de,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:edumazet@google.com,m:ncardwell@google.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:ojeda@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netdev@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[74];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4C73B1BD550
X-Rspamd-Action: no action

Let's call __zap_vma_range() instead of unmap_page_range() to prepare
for further cleanups.

To keep the existing behavior, whereby we do not call uprobe_munmap()
which could block, add a new "reaping" member to zap_details and use it.

Likely we should handle the possible blocking in uprobe_munmap()
differently, but for now keep it unchanged.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/mm.h |  1 +
 mm/memory.c        | 13 +++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 21b67c203e62..4710f7c7495a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2800,6 +2800,7 @@ struct zap_details {
 	struct folio *single_folio;	/* Locked folio to be unmapped */
 	bool skip_cows;			/* Do not zap COWed private pages */
 	bool reclaim_pt;		/* Need reclaim page tables? */
+	bool reaping;			/* Reaping, do not block. */
 	zap_flags_t zap_flags;		/* Extra flags for zapping */
 };
 
diff --git a/mm/memory.c b/mm/memory.c
index 7d7c24c6917c..394b2e931974 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2079,14 +2079,18 @@ static void __zap_vma_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		unsigned long start, unsigned long end,
 		struct zap_details *details)
 {
+	const bool reaping = details && details->reaping;
+
 	VM_WARN_ON_ONCE(start >= end || !range_in_vma(vma, start, end));
 
-	if (vma->vm_file)
+	/* uprobe_munmap() might sleep, so skip it when reaping. */
+	if (vma->vm_file && !reaping)
 		uprobe_munmap(vma, start, end);
 
 	if (unlikely(is_vm_hugetlb_page(vma))) {
 		zap_flags_t zap_flags = details ? details->zap_flags : 0;
 
+		VM_WARN_ON_ONCE(reaping);
 		/*
 		 * vm_file will be NULL when we fail early while instantiating
 		 * a new mapping. In this case, no pages were mapped yet and
@@ -2111,11 +2115,12 @@ static void __zap_vma_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
  */
 int zap_vma_for_reaping(struct vm_area_struct *vma)
 {
+	struct zap_details details = {
+		.reaping = true,
+	};
 	struct mmu_notifier_range range;
 	struct mmu_gather tlb;
 
-	VM_WARN_ON_ONCE(is_vm_hugetlb_page(vma));
-
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
 				vma->vm_start, vma->vm_end);
 	tlb_gather_mmu(&tlb, vma->vm_mm);
@@ -2123,7 +2128,7 @@ int zap_vma_for_reaping(struct vm_area_struct *vma)
 		tlb_finish_mmu(&tlb);
 		return -EBUSY;
 	}
-	unmap_page_range(&tlb, vma, range.start, range.end, NULL);
+	__zap_vma_range(&tlb, vma, range.start, range.end, &details);
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
 	return 0;
-- 
2.43.0


