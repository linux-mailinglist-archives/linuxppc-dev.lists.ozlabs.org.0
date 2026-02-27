Return-Path: <linuxppc-dev+bounces-17420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACsRN7D6oWlkyAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:12:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C71BD593
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:12:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMzyP59Tsz3cB0;
	Sat, 28 Feb 2026 07:12:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772223149;
	cv=none; b=Hah2SR0qmduM3DPZ4WUO/IS6IBDc6JBJFMH2XtBUXzLjY3xxF04jmKpImXqHi2DnnKPg+MsVGD76AIy62W4mINDr4ghQdcjgeu7auZkP0sbaBbypeMd5HA7fDrXsBTPmcgNGPyhmi0rkanHhpaLOVI9UcZBVqUShOTLXXAYwyZFcj1aHSv9i+Ml9RojbFe00OBB/888r68rwv6c4y8+qDr8pWIjYLWzxmLW6FIANBLh2lJ4xGWlt5WQ8n4k7OhuKmk8lcqcPgmAvkq80LDZak+b5/+jb8sEmDk8uJcrt3zFugdbecdfdaFdQSxhlyprcGyjBH5XGWI4AmGCSCwmWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772223149; c=relaxed/relaxed;
	bh=P/m3MqIEX6AkMye3eSum2W1oL4VvXYBIQlIkGRZjJ28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXZEMju60eIf0Mzp4S8zLRqcpf/PRPNiQWp3kPmZQH7W49RQpKSmbZQf0eFpi19wt7iDxRJ5C/HokeyrRMXZd+a5io8GIUSlaGwE93tX9K/nk4ktL/U29UwBLDCK6vlnMOoTG6oPAX+L0ixKykZXbtEqB7xne/7kH+KtX+q07sTdOc8mFONLrkvzrZ6mjzMFUpzqTFofNKV/lZHPTS+4+3EKFaUAZMgPYfknGQLpTIXjoGeDE0xcWy13dgWt4o27SisxvvtkD3D+pVJyJcqj16YAOtORnepOAJWgqHx/IwuwyPs0jwGKzlMaEQeBOP494FoEMProywbuBUk9fXmcsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XV3R41u2; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XV3R41u2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMzyN6Ngxz3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 07:12:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAAFE41843;
	Fri, 27 Feb 2026 20:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047EBC116C6;
	Fri, 27 Feb 2026 20:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772223146;
	bh=aB5tiNSbiWIs8J38wzKTGn9gBoLw1Ed2QFc8m6G1lhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XV3R41u27yOs3AucAXItd/ZxAZjAbvL9zkvtgql+u+4ijDgzXZEbk77WEppDG6XbQ
	 RaRDFQEIdi93XVV3MnYwhO+PQuYzL6HPudiNqhTkElOIxON9zpQ28ddXnRauD5K7xI
	 pPAPZLRWc+u8ZveolZp8sk3xfxpltOLQDdxGrANzjZcI65k2mZV2C7NoEkTTWxEEvR
	 CAFqu7YxseHBUNNfvGMccb+W5iBgk9khfRU0vAq0qlcZ/q5lDlnaLNcSa+FLgrhULj
	 YjzvWS5u0pea0U3pcj1C2Qe1JsARvSTKUCz1+bSDPl3+jOtxbrGUap4h/9n2umCd7p
	 tlC/aFeo6fWmw==
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
Subject: [PATCH v1 12/16] mm: rename zap_vma_pages() to zap_vma()
Date: Fri, 27 Feb 2026 21:08:43 +0100
Message-ID: <20260227200848.114019-13-david@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-17420-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 1C5C71BD593
X-Rspamd-Action: no action

Let's rename it to an even simpler name. While at it, add some
simplistic kernel doc.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/powerpc/platforms/book3s/vas-api.c | 2 +-
 arch/powerpc/platforms/pseries/vas.c    | 2 +-
 include/linux/mm.h                      | 6 +++++-
 lib/vdso/datastore.c                    | 2 +-
 mm/page-writeback.c                     | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index ea4ffa63f043..e96d79db69fe 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -414,7 +414,7 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
 	/*
 	 * When the LPAR lost credits due to core removal or during
 	 * migration, invalidate the existing mapping for the current
-	 * paste addresses and set windows in-active (zap_vma_pages in
+	 * paste addresses and set windows in-active (zap_vma() in
 	 * reconfig_close_windows()).
 	 * New mapping will be done later after migration or new credits
 	 * available. So continue to receive faults if the user space
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index ceb0a8788c0a..fa05f04364fe 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -807,7 +807,7 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds,
 		 * is done before the original mmap() and after the ioctl.
 		 */
 		if (vma)
-			zap_vma_pages(vma);
+			zap_vma(vma);
 
 		mutex_unlock(&task_ref->mmap_mutex);
 		mmap_write_unlock(task_ref->mm);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 4710f7c7495a..4bd1500b9630 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2837,7 +2837,11 @@ void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
 		  unsigned long size);
 void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
 			   unsigned long size);
-static inline void zap_vma_pages(struct vm_area_struct *vma)
+/**
+ * zap_vma - zap all page table entries in a vma
+ * @vma: The vma to zap.
+ */
+static inline void zap_vma(struct vm_area_struct *vma)
 {
 	zap_page_range_single(vma, vma->vm_start, vma->vm_end - vma->vm_start);
 }
diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index a565c30c71a0..222c143aebf7 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -121,7 +121,7 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
 	mmap_read_lock(mm);
 	for_each_vma(vmi, vma) {
 		if (vma_is_special_mapping(vma, &vdso_vvar_mapping))
-			zap_vma_pages(vma);
+			zap_vma(vma);
 	}
 	mmap_read_unlock(mm);
 
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 601a5e048d12..29f7567e5a71 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2645,7 +2645,7 @@ void folio_account_cleaned(struct folio *folio, struct bdi_writeback *wb)
  * while this function is in progress, although it may have been truncated
  * before this function is called.  Most callers have the folio locked.
  * A few have the folio blocked from truncation through other means (e.g.
- * zap_vma_pages() has it mapped and is holding the page table lock).
+ * zap_vma() has it mapped and is holding the page table lock).
  * When called from mark_buffer_dirty(), the filesystem should hold a
  * reference to the buffer_head that is being marked dirty, which causes
  * try_to_free_buffers() to fail.
-- 
2.43.0


