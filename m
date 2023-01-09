Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A823A6632A0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:19:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRdv44vtz3fBZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:19:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aWg1ukrh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3gx-8ywykdc4ceboxlqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aWg1ukrh;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5l2KVNz3fB0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:51 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id z17-20020a256651000000b007907852ca4dso10292924ybm.16
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0pkQpuFsTWto6vflu1WV/u0ieoG+9lWN639GtltEg4c=;
        b=aWg1ukrhEhZM2G7oua95ritICYN4v22wUCcY0gEG4tVylqBmv829owF41k3CxkyAaw
         SuqbgaxpvQ3jo7YPBWRSVqYiX7AqAmWKt0XHBKUG5SuIsHysEKVzXAcfr0KHgTcUUWfl
         b8z+Kg1PDae7rSd6mmxN8sCBWlq1F+xCCZRkBLC5iLo/l2X3T6+e58rjDwLcesFby2PU
         TDwKsOLIZU7rmZo8L2TvumA953Nmin0x2oWW50UYSkBp0m/8PkZaL+q137UQ5Jg9l0HG
         VtNsJ9z3uJiIVmCVloCQiu4j8+XoGxPmrLqPQDbiOLf/gZJpQPJ4VggKimmoURCteWUt
         n6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pkQpuFsTWto6vflu1WV/u0ieoG+9lWN639GtltEg4c=;
        b=RvDvWAba+HbX6EmYsYk4WzSQC+t/xl0+ooFQj9CMAmHxfqZDLHFIEWSjGtWRTN19bC
         LUFKEUgnCZ1ZKVFzQPEDIeUVYWlEOmL6ekzdYDEdDj83rUWdIHZl32PrZlp26/9NBugV
         rvrZ607pXu1vpSyG+gKCFe/Zm8qvWBp9FlZAzxmLWRkODoSoRpMpimV68DRgcPphd2iP
         URHNEvhDO8skrndHGcNpzyHpzLz0LgeA8TUXVDkTsSC+8tTWx7rev67sOzwwLt74q4t0
         GjlksgZ2glb7gaM6TiMngEFfYdzDQ0MJVmBVhViyWlQiVtf7V7lhi9Q2ReOqAmivcULN
         D9Xw==
X-Gm-Message-State: AFqh2kobhUDWLrqqcbnZ4Ezd9oQowErhZXj66jtImBO4znlbbAZgHoq1
	52Orm8h5xlPWYdNY3hz8ekZC0ZwsxB0=
X-Google-Smtp-Source: AMrXdXvMFgW5AuRJO7w2AGyv4a3g+CMQq4rAqpoqS9oQdpJUn0mmZFftW7BbnOBV6/f8EJVvUFaCfl4rQG0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a81:e93:0:b0:3d6:233b:7292 with SMTP id
 141-20020a810e93000000b003d6233b7292mr1998513ywo.476.1673297689205; Mon, 09
 Jan 2023 12:54:49 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:22 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-28-surenb@google.com>
Subject: [PATCH 27/41] mm/mmap: prevent pagefault handler from racing with
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Page fault handlers might need to fire MMU notifications while a new
notifier is being registered. Modify mm_take_all_locks to write-lock all
VMAs and prevent this race with fault handlers that would hold VMA locks.
VMAs are locked before i_mmap_rwsem and anon_vma to keep the same
locking order as in page fault handlers.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 30c7d1c5206e..a256deca0bc0 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3566,6 +3566,7 @@ static void vm_lock_mapping(struct mm_struct *mm, struct address_space *mapping)
  * of mm/rmap.c:
  *   - all hugetlbfs_i_mmap_rwsem_key locks (aka mapping->i_mmap_rwsem for
  *     hugetlb mapping);
+ *   - all vmas marked locked
  *   - all i_mmap_rwsem locks;
  *   - all anon_vma->rwseml
  *
@@ -3591,6 +3592,7 @@ int mm_take_all_locks(struct mm_struct *mm)
 	mas_for_each(&mas, vma, ULONG_MAX) {
 		if (signal_pending(current))
 			goto out_unlock;
+		vma_write_lock(vma);
 		if (vma->vm_file && vma->vm_file->f_mapping &&
 				is_vm_hugetlb_page(vma))
 			vm_lock_mapping(mm, vma->vm_file->f_mapping);
@@ -3677,6 +3679,7 @@ void mm_drop_all_locks(struct mm_struct *mm)
 		if (vma->vm_file && vma->vm_file->f_mapping)
 			vm_unlock_mapping(vma->vm_file->f_mapping);
 	}
+	vma_write_unlock_mm(mm);
 
 	mutex_unlock(&mm_all_locks_mutex);
 }
-- 
2.39.0

