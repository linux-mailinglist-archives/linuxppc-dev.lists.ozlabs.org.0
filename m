Return-Path: <linuxppc-dev+bounces-17412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOpFOC36oWlkyAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:10:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FA41BD46F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:10:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMzvt4WPGz3bnv;
	Sat, 28 Feb 2026 07:10:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772223018;
	cv=none; b=EkDIZhg9IVWqTo87o6i0qxdR7wLtPeV8rluxkc5EgrEpk0nsa8qz1Thbzov76yX/ecxdevBIIg1SAjEA0oOBEHsplfogSpU4C+nC07xOSyX0qpDZR1BgG7PHM9zl0RkDfzKeIa0O4SOQnnFDdqD39yRzjZC5u9+ko/4oYGwaprdu1LnI4YngioWXcRM0yUCWnkVzWC19egloljcmOJ5DU2s6MqQb2RiipQ0hGMYYmKJ61/AwzaejKpMuCzH0uJ/8lMPAEXbIbjb1VAlxaxC8kOTmw8HdvzLhUXuAgbfKlTgyLcHDOEWbps+trv97hhTwScG3x2ua2HKC9UkHesjgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772223018; c=relaxed/relaxed;
	bh=PNXJ3lchDes2Cf/t7ldca5KjaC3s+A85b9AScdfhZoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WlMR7FUtHy7bFnW7saTvNeP1dkNJ6ZQ5f6/kvc4ijjN6keQfPpQJuOalXfC9SI2YRDjg9OYWgycrpzB8dIy/XP8AaOpyjmkkUCSdMrrHPskjz1wrGOFQQEteHx3fnrSIiLWRf7OUBiLbUtf2bP7e0npULLPDnsNCR1RFFvbp9DFl8XdbNJWKfbQKeRgSXfGO+MCud65r/CoaMtI2U6dQ3CXYY73L0raNkpHle7PuQ4S9/DNMXOJoprOxL5kIrrenqU85CdR6ympwiLQSVJ9OT2vORkVhnJZ9cibhDkBQeh6yUr1/zjqPaEARdMA7VlGKNrvNKLegsmDjeG0/kkMzbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VgnVpkaH; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VgnVpkaH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMzvs5WJPz2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 07:10:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4085E60130;
	Fri, 27 Feb 2026 20:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E261C116C6;
	Fri, 27 Feb 2026 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772223014;
	bh=hLgJdGT31V5wnxVFe1vHLMNm/KVuWNy5vLAGWsJg21c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VgnVpkaHaAkciLTAeL0+EHoy6ULSwuu9fj3VyFkgJooaJcw9CuTij8hQME2UbVNWD
	 Yvc/lVRhwFa8DPT/JmgPCmNWacY7labSQ2afT1BQfoxShbwEJk2Jn8z7NxsGfCsqtz
	 PFpbCDhsNtcpqdguKU2gvD4AUwof1y66dauCjiXbAiMN6CyWf4CltYotNxCjssrHCp
	 /q9YFMkt4jNd7FScndseUUa/D3NnepYZOmjVGGfCd+L3Hgug9STuzNp9OaPEgAhBvJ
	 WiDRQIsjsWJIIKTyzXG8Pn+MIUoCY9cTsDjzXp52+rtBZSOfNAH+NerJi1RRj2Hxlh
	 G0ODowk2+zwXQ==
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
Subject: [PATCH v1 04/16] mm/memory: simplify calculation in unmap_mapping_range_tree()
Date: Fri, 27 Feb 2026 21:08:35 +0100
Message-ID: <20260227200848.114019-5-david@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17412-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:rientjes@google.com,m:shakeel.butt@linux.dev,m:willy@infradead.org,m:aliceryhl@google.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:gregkh@linuxfoundation.org,m:arve@android.com,m:tkjos@android.com,m:brauner@kernel.org,m:cmllamas@google.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:jgg@ziepe.
 ca,m:leon@kernel.org,m:dimitri.sivanich@hpe.com,m:arnd@arndb.de,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:edumazet@google.com,m:ncardwell@google.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:ojeda@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netdev@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
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
X-Rspamd-Queue-Id: 06FA41BD46F
X-Rspamd-Action: no action

Let's simplify the calculation a bit further to make it easier to get,
reusing vma_last_pgoff() which we move from interval_tree.c to mm.h.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/mm.h |  5 +++++
 mm/interval_tree.c |  5 -----
 mm/memory.c        | 12 +++++-------
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a8138ff7d1fa..d3ef586ee1c0 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4000,6 +4000,11 @@ static inline unsigned long vma_pages(const struct vm_area_struct *vma)
 	return (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
 }
 
+static inline unsigned long vma_last_pgoff(struct vm_area_struct *vma)
+{
+	return vma->vm_pgoff + vma_pages(vma) - 1;
+}
+
 static inline unsigned long vma_desc_size(const struct vm_area_desc *desc)
 {
 	return desc->end - desc->start;
diff --git a/mm/interval_tree.c b/mm/interval_tree.c
index 32e390c42c53..32bcfbfcf15f 100644
--- a/mm/interval_tree.c
+++ b/mm/interval_tree.c
@@ -15,11 +15,6 @@ static inline unsigned long vma_start_pgoff(struct vm_area_struct *v)
 	return v->vm_pgoff;
 }
 
-static inline unsigned long vma_last_pgoff(struct vm_area_struct *v)
-{
-	return v->vm_pgoff + vma_pages(v) - 1;
-}
-
 INTERVAL_TREE_DEFINE(struct vm_area_struct, shared.rb,
 		     unsigned long, shared.rb_subtree_last,
 		     vma_start_pgoff, vma_last_pgoff, /* empty */, vma_interval_tree)
diff --git a/mm/memory.c b/mm/memory.c
index 5c47309331f5..e4154f03feac 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4227,17 +4227,15 @@ static inline void unmap_mapping_range_tree(struct rb_root_cached *root,
 					    struct zap_details *details)
 {
 	struct vm_area_struct *vma;
-	pgoff_t vba, vea, zba, zea;
 	unsigned long start, size;
 	struct mmu_gather tlb;
 
 	vma_interval_tree_foreach(vma, root, first_index, last_index) {
-		vba = vma->vm_pgoff;
-		vea = vba + vma_pages(vma) - 1;
-		zba = max(first_index, vba);
-		zea = min(last_index, vea);
-		start = ((zba - vba) << PAGE_SHIFT) + vma->vm_start;
-		size = (zea - zba + 1) << PAGE_SHIFT;
+		const pgoff_t start_idx = max(first_index, vma->vm_pgoff);
+		const pgoff_t end_idx = min(last_index, vma_last_pgoff(vma)) + 1;
+
+		start = vma->vm_start + ((start_idx - vma->vm_pgoff) << PAGE_SHIFT);
+		size = (end_idx - start_idx) << PAGE_SHIFT;
 
 		tlb_gather_mmu(&tlb, vma->vm_mm);
 		zap_page_range_single_batched(&tlb, vma, start, size, details);
-- 
2.43.0


