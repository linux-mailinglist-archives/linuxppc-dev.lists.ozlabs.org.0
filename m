Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E2566328B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:15:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRYh3ZwMz3fFg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:15:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pKSCW4f0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3d3-8ywykdcqsurenbgoogle.comlinuxppc-devlists.ozlabs.org@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pKSCW4f0;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5Y4d6rz3cgv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:41 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id j18-20020a170902da9200b00189b3b16addso7050501plx.23
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=olOpibg5eXy7KG3cFGJtGZQRi2wnSYuvllMlsZALFjE=;
        b=pKSCW4f0d77MorxMhTYeMa3Bkvztzi2l/11p+8AD9JlAcd7O/4nLaK3tMdO/JZYFZO
         oqL+3k7pxb64mumhhSbnD+8oqAK9T+YZbtnVKYdyWwz1xTl0lxuCTGJlmjyD4W6tkdoJ
         ScE8xkE+709mZSvnfMafhqWZz0JUfC8PX8Gqgq4hVWAiFqsbly88nJnbf2OtvsEjRJ+V
         Bh1jSeLHcoArd7dhSosnJ19E8FECzKPk1IhOzNYJUOL7f9tKHCqrIEP0OXg1wGsfV/sX
         JopWIX7MNjYmVxKWpBhB8gnFt1KMXJN0MSlcK65fQjg6FKg5IorU4J4ePrdeGZ792swl
         N3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olOpibg5eXy7KG3cFGJtGZQRi2wnSYuvllMlsZALFjE=;
        b=dabiGTTRzNXahOOxwgAFjP7bw9RvRmEfDRqjwwoGj4D+vgM6rrcQzv9E32MZatN20n
         bVv65bt4NCcjY8E2UHZUfUM2TCIqm8btZ6sMCCj6mWFsNz06TwzzefHRXEgItTMxMReF
         7i4/4cc2EBmAXqV+apV/MA+Ak5Pa8+aSlwXyTmG78JDXLh5LpnjK3ZkF11qcS9oZAmRC
         9K3EsXEjna3MTfHKJMpGf3CP+Lfm9v9P32qnn9RWsXN3MNClxXq76KXI8OKSabK5DyBd
         aSiiQ/9+rcoASsw1CL0+nU5coX6IN6cJQCQw00TVKUP4FOSaxRkpwWDUHrD+piahE6UA
         cY7w==
X-Gm-Message-State: AFqh2kr09xZOrDjEQ9wa5UF42uRc1xeSnnEyZGDpL0IiSTNdSVxcKVDF
	gh/Uyo5o36DbTb73tQuF7gG4ziS8gWs=
X-Google-Smtp-Source: AMrXdXsFsv+WY6uB2QAxQKVey5zkUH2AXIcpYb3YNAv+Gej95uP4vEcIzk/UCgPyK193sduP1xpoK0p/ZF8=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a62:1501:0:b0:589:8362:c7ce with SMTP id
 1-20020a621501000000b005898362c7cemr251559pfv.21.1673297679447; Mon, 09 Jan
 2023 12:54:39 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:18 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-24-surenb@google.com>
Subject: [PATCH 23/41] mm: write-lock VMAs before removing them from VMA tree
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Write-locking VMAs before isolating them ensures that page fault
handlers don't operate on isolated VMAs.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c  | 2 ++
 mm/nommu.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index da1908730828..be289e0b693b 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -448,6 +448,7 @@ void vma_mas_store(struct vm_area_struct *vma, struct ma_state *mas)
  */
 void vma_mas_remove(struct vm_area_struct *vma, struct ma_state *mas)
 {
+	vma_write_lock(vma);
 	trace_vma_mas_szero(mas->tree, vma->vm_start, vma->vm_end - 1);
 	mas->index = vma->vm_start;
 	mas->last = vma->vm_end - 1;
@@ -2300,6 +2301,7 @@ int split_vma(struct mm_struct *mm, struct vm_area_struct *vma,
 static inline int munmap_sidetree(struct vm_area_struct *vma,
 				   struct ma_state *mas_detach)
 {
+	vma_write_lock(vma);
 	mas_set_range(mas_detach, vma->vm_start, vma->vm_end - 1);
 	if (mas_store_gfp(mas_detach, vma, GFP_KERNEL))
 		return -ENOMEM;
diff --git a/mm/nommu.c b/mm/nommu.c
index b3154357ced5..7ae91337ef14 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -552,6 +552,7 @@ void vma_mas_store(struct vm_area_struct *vma, struct ma_state *mas)
 
 void vma_mas_remove(struct vm_area_struct *vma, struct ma_state *mas)
 {
+	vma_write_lock(vma);
 	mas->index = vma->vm_start;
 	mas->last = vma->vm_end - 1;
 	mas_store_prealloc(mas, NULL);
@@ -1551,6 +1552,10 @@ void exit_mmap(struct mm_struct *mm)
 	mmap_write_lock(mm);
 	for_each_vma(vmi, vma) {
 		cleanup_vma_from_mm(vma);
+		/*
+		 * No need to lock VMA because this is the only mm user and no
+		 * page fault handled can race with it.
+		 */
 		delete_vma(mm, vma);
 		cond_resched();
 	}
-- 
2.39.0

