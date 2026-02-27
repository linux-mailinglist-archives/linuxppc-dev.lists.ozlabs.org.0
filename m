Return-Path: <linuxppc-dev+bounces-17414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKnoIk76oWlkyAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:10:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6331BD4B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:10:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMzwW018Sz3bn8;
	Sat, 28 Feb 2026 07:10:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772223050;
	cv=none; b=XxeF3G5vVzD0CFJ63Q4SwHXAXS/i5WIFlGIuhKcpoJ3OjIArvK7fKpQwABbzWCl3Ag36ZJKVWSVaRZ6M6Z8dP/ez+Dhh0WFsHv9jZZN6LmfHrGBXzx3EYcdv/3Iy3lz4xwddKjF97sM1E3av6MImq86IBOqDkenOd4yfZkR6GjwktJ5DzCEj42pvbwyFqSW1qpL7I710AF8tKOj8H73keJ7dBz9v32cyJMScBQ/Ate/du9jZRewG+FtAI8Ahw9n4wsMNBeHDFkXrPVSYx1lq71IusrtetuEt/YUmzvBa/ZtNzjb2ZO1zQ1LILoV35KSu0kd8Oi6h/Uah44XuI88AKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772223050; c=relaxed/relaxed;
	bh=VzLysLIDiziqT+z+8O0U2+zIe52qtwqEAHv4JAZVhAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bX9EsmFuT5MgAl7toFKIvd6jS675Do7dCdLZzwoxIIHZyltsF7ubawpUZT+fSUohPzGrMO10AE1ueh2Od7TDIlHUvEufD4AvQH1zcvEV6GHBhKHqQ3CmWqom8A6hZRBLMyUGpt7l9V3WLFgA6rLmJM1aOW+WwVac6pBr0jOUBV05XGDRC0e+wCeWDcbcA6t13RdjblUv9ri1ZPzxKca7kwlRy/EOqaE83oozZnQR6DLdqsKWvm4/UyAdrfhXCZ7CWl8Fmlcgwqie5XMuywLwCdw3VziI6BxLNWYi3lE3XbZJico0ALoBrPKp/wQLcuCMZNiwERi14rAyiWy562d7ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nfvnOh6G; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nfvnOh6G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMzwV1DJCz30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 07:10:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 265ED60130;
	Fri, 27 Feb 2026 20:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8338C4AF0B;
	Fri, 27 Feb 2026 20:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772223047;
	bh=QGXGGpOpfFdi5KYtLppZ0pqbJn7DahplTB4anRf43p0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nfvnOh6GFZtYgZiN0uOTy634vV7a2URwKLO9gYY3hSmWrxWYugIhQMwjmKAP0Ou7H
	 E7yQ2swT+jt/BCllVI65b1rCvucLmydteEcAWJgvmR6s7NVl1dOcUQKed/pO6sinW9
	 lwoqUdfj2/aHynj1hfJQjMN4BDqIw/yLezbCWepQA0SY428UknnSWvQAdl5uw8Pw0I
	 ZMvoXeKbY2uAT7ljvl10AXyMqsQZJg6xW3aCfxZ3Rd8l7duGBMlC0mAecn8AsWYubD
	 FGcjbDKLIzBns5l13QGee7VBjeTjFl4JHAPE0WATVKG/4R/uphdDwPX6uX4D9dFGKx
	 IeNq3bC5UkO4w==
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
Subject: [PATCH v1 06/16] mm/oom_kill: factor out zapping of VMA into zap_vma_for_reaping()
Date: Fri, 27 Feb 2026 21:08:37 +0100
Message-ID: <20260227200848.114019-7-david@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-17414-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 8F6331BD4B5
X-Rspamd-Action: no action

Let's factor it out so we can turn unmap_page_range() into a static
function instead, and so oom reaping has a clean interface to call.

Note that hugetlb is not supported, because it would require a bunch of
hugetlb-specific further actions (see zap_page_range_single_batched()).

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/internal.h |  5 +----
 mm/memory.c   | 36 ++++++++++++++++++++++++++++++++----
 mm/oom_kill.c | 15 +--------------
 3 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 39ab37bb0e1d..df9190f7db0e 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -536,13 +536,10 @@ static inline void sync_with_folio_pmd_zap(struct mm_struct *mm, pmd_t *pmdp)
 }
 
 struct zap_details;
-void unmap_page_range(struct mmu_gather *tlb,
-			     struct vm_area_struct *vma,
-			     unsigned long addr, unsigned long end,
-			     struct zap_details *details);
 void zap_page_range_single_batched(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, unsigned long addr,
 		unsigned long size, struct zap_details *details);
+int zap_vma_for_reaping(struct vm_area_struct *vma);
 int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
 			   gfp_t gfp);
 
diff --git a/mm/memory.c b/mm/memory.c
index e4154f03feac..621f38ae1425 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2054,10 +2054,9 @@ static inline unsigned long zap_p4d_range(struct mmu_gather *tlb,
 	return addr;
 }
 
-void unmap_page_range(struct mmu_gather *tlb,
-			     struct vm_area_struct *vma,
-			     unsigned long addr, unsigned long end,
-			     struct zap_details *details)
+static void unmap_page_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		unsigned long addr, unsigned long end,
+		struct zap_details *details)
 {
 	pgd_t *pgd;
 	unsigned long next;
@@ -2115,6 +2114,35 @@ static void unmap_single_vma(struct mmu_gather *tlb,
 	}
 }
 
+/**
+ * zap_vma_for_reaping - zap all page table entries in the vma without blocking
+ * @vma: The vma to zap.
+ *
+ * Zap all page table entries in the vma without blocking for use by the oom
+ * killer. Hugetlb vmas are not supported.
+ *
+ * Returns: 0 on success, -EBUSY if we would have to block.
+ */
+int zap_vma_for_reaping(struct vm_area_struct *vma)
+{
+	struct mmu_notifier_range range;
+	struct mmu_gather tlb;
+
+	VM_WARN_ON_ONCE(is_vm_hugetlb_page(vma));
+
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
+				vma->vm_start, vma->vm_end);
+	tlb_gather_mmu(&tlb, vma->vm_mm);
+	if (mmu_notifier_invalidate_range_start_nonblock(&range)) {
+		tlb_finish_mmu(&tlb);
+		return -EBUSY;
+	}
+	unmap_page_range(&tlb, vma, range.start, range.end, NULL);
+	mmu_notifier_invalidate_range_end(&range);
+	tlb_finish_mmu(&tlb);
+	return 0;
+}
+
 /**
  * unmap_vmas - unmap a range of memory covered by a list of vma's
  * @tlb: address of the caller's struct mmu_gather
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 0ba56fcd10d5..54b7a8fe5136 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -548,21 +548,8 @@ static bool __oom_reap_task_mm(struct mm_struct *mm)
 		 * count elevated without a good reason.
 		 */
 		if (vma_is_anonymous(vma) || !(vma->vm_flags & VM_SHARED)) {
-			struct mmu_notifier_range range;
-			struct mmu_gather tlb;
-
-			mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0,
-						mm, vma->vm_start,
-						vma->vm_end);
-			tlb_gather_mmu(&tlb, mm);
-			if (mmu_notifier_invalidate_range_start_nonblock(&range)) {
-				tlb_finish_mmu(&tlb);
+			if (zap_vma_for_reaping(vma))
 				ret = false;
-				continue;
-			}
-			unmap_page_range(&tlb, vma, range.start, range.end, NULL);
-			mmu_notifier_invalidate_range_end(&range);
-			tlb_finish_mmu(&tlb);
 		}
 	}
 
-- 
2.43.0


