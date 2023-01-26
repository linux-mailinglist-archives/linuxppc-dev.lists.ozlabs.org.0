Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB93667D57A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:40:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2rfG54nmz3fHD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:40:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FW4bnh2D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3mdbsywykdlyoqnajxckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FW4bnh2D;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2rbH6Wtzz3fDT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 06:38:03 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-4fee82718afso31312117b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t7f+nWaJs+UY1hAFqCQPugwXAUkaJjblKaIiT0PAHag=;
        b=FW4bnh2DtF5SN3S+ptflTidC3AwPB8hrKnXJfdusod4jzvXR1Q3bgv6S2FnIbbr/1k
         kJaCqO4VxuyGKMdYHqVT8hWkVv8xNy02JRI3nNYqz01mL8SL7V6Po3J4OaEcUTdV8T6d
         U8bwK2pvUhNc4ZsP459X8uhyyARwEseFOldN8jMmy9goPH8eegJ1oz/nmy4A87viAEed
         K1sFh2Ag5W16Q+oAksyomuvnpJ/IlE09ePBZTWNlxXbxGwhIaOL4Mw2hapKtgyiO9CrJ
         c0Zt54OumFKZIa1lT5MaZ/SF4EVN57QK9Y/mYR+xXLnWjhZNPHDb8wMQuopuM5SuNw1J
         FF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7f+nWaJs+UY1hAFqCQPugwXAUkaJjblKaIiT0PAHag=;
        b=7HMuTlPos/22I7oPPAQULy3Xijztrvkp/ncNi63sdpvLAleex3hCQY8ajkY895cddY
         fyha39VAWEBtVHMJ5T7DivJk1HaH9k+lqlW2/56k7Lw3ZjsPDkYYbSIWhl1bs8jTCiIE
         LKVZP9qECYkBSWdY2NycMmIQNHRAcbZc/MNwXwxvexqd4IIwtGN2hWpd83Pnns8Lmez7
         5k2R4Tm7krtGtJ/Mck6C5wxPKMoTytx64G/oRzrhFkTGXSfN83DpG/ddY4panQC450Os
         /Z4DV/r1txlG5+9hvSrW5VR9XWwxENOSrfOHcolr1WpYbhiSOCpPyV8A9udnjDTl4FyH
         AW3A==
X-Gm-Message-State: AFqh2kqtXi3cUSZzsOGXaqPB94u59umxzLjVnriIygDWQXKFEpcI06l1
	EpONZx4DEzgOC3jxkfjgavIMTvAHhY4=
X-Google-Smtp-Source: AMrXdXuUQZvJuxuPHIjcp5S1LAlHZTJ1MRrC82bz6slpJcdsTdAd3IG1wthp4gNFz/h3B6xbzxEKZLVeMx4=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:d774:88af:bab3:648d])
 (user=surenb job=sendgmr) by 2002:a25:1fd4:0:b0:7d4:712e:2852 with SMTP id
 f203-20020a251fd4000000b007d4712e2852mr3883476ybf.628.1674761881114; Thu, 26
 Jan 2023 11:38:01 -0800 (PST)
Date: Thu, 26 Jan 2023 11:37:47 -0800
In-Reply-To: <20230126193752.297968-1-surenb@google.com>
Mime-Version: 1.0
References: <20230126193752.297968-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126193752.297968-3-surenb@google.com>
Subject: [PATCH v4 2/7] mm: introduce vma->vm_flags wrapper functions
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vm_flags are among VMA attributes which affect decisions like VMA merging
and splitting. Therefore all vm_flags modifications are performed after
taking exclusive mmap_lock to prevent vm_flags updates racing with such
operations. Introduce modifier functions for vm_flags to be used whenever
flags are updated. This way we can better check and control correct
locking behavior during these updates.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Acked-by: Michal Hocko <mhocko@suse.com>
Acked-by: Mel Gorman <mgorman@techsingularity.net>
---
 include/linux/mm.h       | 40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mm_types.h | 10 +++++++++-
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8d636e895ee9..abb31103d060 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -627,6 +627,46 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
 }
 
+/* Use when VMA is not part of the VMA tree and needs no locking */
+static inline void vm_flags_init(struct vm_area_struct *vma,
+				 vm_flags_t flags)
+{
+	ACCESS_PRIVATE(vma, __vm_flags) = flags;
+}
+
+/* Use when VMA is part of the VMA tree and modifications need coordination */
+static inline void vm_flags_reset(struct vm_area_struct *vma,
+				  vm_flags_t flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	vm_flags_init(vma, flags);
+}
+
+static inline void vm_flags_set(struct vm_area_struct *vma,
+				vm_flags_t flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	ACCESS_PRIVATE(vma, __vm_flags) |= flags;
+}
+
+static inline void vm_flags_clear(struct vm_area_struct *vma,
+				  vm_flags_t flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	ACCESS_PRIVATE(vma, __vm_flags) &= ~flags;
+}
+
+/*
+ * Use only when the order of set/clear operations is unimportant, otherwise
+ * use vm_flags_{set|clear} explicitly.
+ */
+static inline void vm_flags_mod(struct vm_area_struct *vma,
+				vm_flags_t set, vm_flags_t clear)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	vm_flags_init(vma, (vma->vm_flags | set) & ~clear);
+}
+
 static inline void vma_set_anonymous(struct vm_area_struct *vma)
 {
 	vma->vm_ops = NULL;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 2d6d790d9bed..da983aedb741 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -491,7 +491,15 @@ struct vm_area_struct {
 	 * See vmf_insert_mixed_prot() for discussion.
 	 */
 	pgprot_t vm_page_prot;
-	unsigned long vm_flags;		/* Flags, see mm.h. */
+
+	/*
+	 * Flags, see mm.h.
+	 * To modify use vm_flags_{init|reset|set|clear|mod} functions.
+	 */
+	union {
+		const vm_flags_t vm_flags;
+		vm_flags_t __private __vm_flags;
+	};
 
 	/*
 	 * For areas with an address space and backing store,
-- 
2.39.1

