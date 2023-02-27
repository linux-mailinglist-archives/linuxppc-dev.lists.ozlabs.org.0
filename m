Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A226A48AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:56:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSq32JPxz3fY5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:56:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oOzu68rh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3vur8ywykdeuz1yluinvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oOzu68rh;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPN496mz3cMK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:28 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id p9-20020a17090a930900b00237a7f862dfso4504576pjo.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RRQaU516ZwpTlJ/IPA+DGjHt1op6pQWjJsnPIcYfuA=;
        b=oOzu68rhqFvQUE3xPXRgC65GI9mEeLvvYxOtiIzpOqVj22Kyf5G6v2nWjVGklLxMvP
         HmGHsiBCF1KS106jCim6ns3MdM+isHFIB2cW4BN/lGs8dwWcRP4ETfa+ag2t0c8ooDBq
         IbM6nmgazseNTIyYCuuyg4z6GzI60o3WZCSdFyA+NgXZEZsvKFhXlvHjg7yVejPrN9tm
         lKdZz9wSXLCbvII2MlT1JIIh3E3Pzy0qhZRWTGIGZxssznyrIga0ZMQq7hZXO4CZPVOT
         3YmHDK/l7fYrKAyqOPLY4x/QliUuYuXk7UtTVeDvzP6SJegWWyEijbowKlqNMovXBpqB
         mtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RRQaU516ZwpTlJ/IPA+DGjHt1op6pQWjJsnPIcYfuA=;
        b=UTWqaLVPS+GvsiqJMmxItIzrheQUm5+xeifzbQfGxNPhHkZxI6Ui1NIBM2ngdqbBA/
         kkIVAEFxhvdMX63qlOVAV0xIh0GqN5p6DsYLNhrYrFgrw27DkgLwbzG1TZtfeI8Tg/W+
         ZlJEBvnvPMakRCRdGAYKbsUgma5cCkgqY/IkvHJatHIURL0AOvYyWwW0mI8J32WA4pCm
         i13u3HxMw0qGLT9pq2P+oSHvdeEdXeNZt3oj0tHhl98++fDMuDsJOHyFAXFwqu3Kgech
         2rxpwDaEdMfkY0GRhWhTSmQWsyZLdRyv9bv9igXviUwr+wIJ4YzruZiNx6h1HXrteS1M
         Tn4g==
X-Gm-Message-State: AO0yUKX6ra1+rE6hq4/be0UACMA/terVSy2B72XsooFQzdTCdRPXL85L
	kC5tkwRXNY16pzQT4TUxW+TPcI58cmM=
X-Google-Smtp-Source: AK7set/2J8KUumsEZ/0orhhZ+Y6s/zP6QMsk4a+yqlkwHuIWJVWfr/HftGogZhR0NE5sVdiuRfgOT6Lze5Y=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a62:8387:0:b0:593:974c:cba7 with SMTP id
 h129-20020a628387000000b00593974ccba7mr6413186pfe.5.1677519446727; Mon, 27
 Feb 2023 09:37:26 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:20 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-22-surenb@google.com>
Subject: [PATCH v4 21/33] mm/mmap: prevent pagefault handler from racing with
 mmu_notifier registration
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
  hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Page fault handlers might need to fire MMU notifications while a new
notifier is being registered. Modify mm_take_all_locks to write-lock all
VMAs and prevent this race with page fault handlers that would hold VMA
locks. VMAs are locked before i_mmap_rwsem and anon_vma to keep the same
locking order as in page fault handlers.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index ec745586785c..b947d82e8522 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3486,6 +3486,7 @@ static void vm_lock_mapping(struct mm_struct *mm, struct address_space *mapping)
  * of mm/rmap.c:
  *   - all hugetlbfs_i_mmap_rwsem_key locks (aka mapping->i_mmap_rwsem for
  *     hugetlb mapping);
+ *   - all vmas marked locked
  *   - all i_mmap_rwsem locks;
  *   - all anon_vma->rwseml
  *
@@ -3508,6 +3509,13 @@ int mm_take_all_locks(struct mm_struct *mm)
 
 	mutex_lock(&mm_all_locks_mutex);
 
+	mas_for_each(&mas, vma, ULONG_MAX) {
+		if (signal_pending(current))
+			goto out_unlock;
+		vma_start_write(vma);
+	}
+
+	mas_set(&mas, 0);
 	mas_for_each(&mas, vma, ULONG_MAX) {
 		if (signal_pending(current))
 			goto out_unlock;
@@ -3597,6 +3605,7 @@ void mm_drop_all_locks(struct mm_struct *mm)
 		if (vma->vm_file && vma->vm_file->f_mapping)
 			vm_unlock_mapping(vma->vm_file->f_mapping);
 	}
+	vma_end_write_all(mm);
 
 	mutex_unlock(&mm_all_locks_mutex);
 }
-- 
2.39.2.722.g9855ee24e9-goog

