Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6964C67C0F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 00:38:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2KzP1Zfdz3cdB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 10:38:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qAP7Xe1j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=34rzrywykdmc574r0ot11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qAP7Xe1j;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2KwN654Lz3c65
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 10:36:04 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id d21-20020a25add5000000b007ff8112e8b8so82234ybe.17
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 15:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ijhDThbayE4MrjmcyJpQB4++KqDnXZSVkoWdTA6boxg=;
        b=qAP7Xe1jWQ2v1pDyzimk/ucUXt6pJgnQPRMzULtUiXJ7miq94fdzWh3UQtS4ELXLXG
         xnRyMqJvJr9Qyw4fk8i3KNqyrHI6q9BE51NGUhcMbBkXiFN4EkWsXQg+sNncoZfFgpAd
         pmakogcOD7fawIoyB40GTMQKoodOtmE61jQOjn9IiPN2QveUdh02XHqNgo44qZ1Swkka
         UsHWmYnCHoE7T0et5kXrXIFTIL10ukIq3X3ayvz36CK5hAZd9JEO8xbOLC65b5H6U0Ms
         J3NS+Lumkoi4FpH2j3VjTovOoJdkWi+DW6xdc6JIqkzB0eqSo4KKNBbmC2JFmfQN4m9j
         cFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ijhDThbayE4MrjmcyJpQB4++KqDnXZSVkoWdTA6boxg=;
        b=2YyAGdMBFRuM/tpV7VX00WJX1KEz/XDyH+d4G/YwAAXLs7z2tAZ8MMMFD5zLbR6GGF
         2Kv+9jyuM0NS7hK1bgnt3e7QKlAgL8EGedoQeMG+T+/MK5IQRfYGpD9xyAyWCxT+1cJ9
         LQmviIeGeDUs5jtrZ1kCEtP9yylEj0ysoZX6ycCXX3g0LV9abNXUh0jIePvLK4S4sOyy
         6ty92Aj7vbIhyVMz1HPa/rP6Rnqx/r5qFA3lCFJje/mZ4KoviIdkwvgD4O5GmDAIV02a
         Yj4ZErkufk2bgVlORvDRaGB7JNTkxc5AmYTUg3/Axds7SNwsqAK0GFLZ9Qe2FBG1Eq3+
         NS3Q==
X-Gm-Message-State: AFqh2kqpbrCfGAvyQ/U2XmiCScqbWiZYFYP4hYDn6/jMEUjW7Z8yyOED
	ZfqUOW2sXSB2ih5Pd80J4Tg08appzVA=
X-Google-Smtp-Source: AMrXdXuKSNG6CNUWpJ2GxlW/S4CYhyc7M4Q5HmRRIO5iXM40geoKvk7b/ruVHPa4Ev+GXlDquQW3EuW1OFs=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f7b0:20e8:ce66:f98])
 (user=surenb job=sendgmr) by 2002:a0d:ff42:0:b0:4e0:8133:2a5a with SMTP id
 p63-20020a0dff42000000b004e081332a5amr3780554ywf.187.1674689762692; Wed, 25
 Jan 2023 15:36:02 -0800 (PST)
Date: Wed, 25 Jan 2023 15:35:49 -0800
In-Reply-To: <20230125233554.153109-1-surenb@google.com>
Mime-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230125233554.153109-3-surenb@google.com>
Subject: [PATCH v3 2/7] mm: introduce vma->vm_flags wrapper functions
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@t
 echsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vm_flags are among VMA attributes which affect decisions like VMA merging
and splitting. Therefore all vm_flags modifications are performed after
taking exclusive mmap_lock to prevent vm_flags updates racing with such
operations. Introduce modifier functions for vm_flags to be used whenever
flags are updated. This way we can better check and control correct
locking behavior during these updates.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h       | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/mm_types.h | 10 +++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c2f62bdce134..bf16ddd544a5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -627,6 +627,43 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
 }
 
+/* Use when VMA is not part of the VMA tree and needs no locking */
+static inline void init_vm_flags(struct vm_area_struct *vma,
+				 vm_flags_t flags)
+{
+	ACCESS_PRIVATE(vma, __vm_flags) = flags;
+}
+
+/* Use when VMA is part of the VMA tree and modifications need coordination */
+static inline void reset_vm_flags(struct vm_area_struct *vma,
+				  vm_flags_t flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	init_vm_flags(vma, flags);
+}
+
+static inline void set_vm_flags(struct vm_area_struct *vma,
+				vm_flags_t flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	ACCESS_PRIVATE(vma, __vm_flags) |= flags;
+}
+
+static inline void clear_vm_flags(struct vm_area_struct *vma,
+				  vm_flags_t flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	ACCESS_PRIVATE(vma, __vm_flags) &= ~flags;
+}
+
+static inline void mod_vm_flags(struct vm_area_struct *vma,
+				vm_flags_t set, vm_flags_t clear)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	ACCESS_PRIVATE(vma, __vm_flags) |= set;
+	ACCESS_PRIVATE(vma, __vm_flags) &= ~clear;
+}
+
 static inline void vma_set_anonymous(struct vm_area_struct *vma)
 {
 	vma->vm_ops = NULL;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 2d6d790d9bed..bccbd5896850 100644
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
+	 * To modify use {init|reset|set|clear|mod}_vm_flags() functions.
+	 */
+	union {
+		const vm_flags_t vm_flags;
+		vm_flags_t __private __vm_flags;
+	};
 
 	/*
 	 * For areas with an address space and backing store,
-- 
2.39.1

