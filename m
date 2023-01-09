Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 117EE663285
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:14:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRXg6jBZz3fbJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:14:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AsrsBvZP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3dh-8ywykdceprobk8dlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AsrsBvZP;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5V4rqpz3cgm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:38 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id n203-20020a2572d4000000b0078f09db9888so10254410ybc.18
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1FpUUiRmr7dBuhWWRB46HjSP7TgY2quKdzRuNf/hqHM=;
        b=AsrsBvZP9aQHF3L5Nl/u1fB+D2bm7e0YjzSCvgbBaPzVvDqUAEV/bKN3f/FWWFnJld
         y54pIfCVv+Sf28j1GT6GnDmjTV3QxG0dtIi870ieojG97R1YrLaN1+Hnnh1RqNC6IKhV
         FDsy8k4m0XBTPaqC3JVLB2amGI721PZ/e3uTJFIVXTdjA/KJiKwGIaizGxyvcp5J8QaW
         5xEAO0mZOLLdDxM+ya/sdbkzi1vVwSyWReOOtmKkNqv4WGZ0uHxmN44Y8NrueULgHAw2
         BBJ3cZtaXuduG2TgX3HtPnChX2RwWmECLeYtrImIURhb/vK80eEmATn6FHpKHV2WHJD9
         N1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FpUUiRmr7dBuhWWRB46HjSP7TgY2quKdzRuNf/hqHM=;
        b=2B6DdeHp66iwMPHxNZKXD1+6DHg0jMPUURo1cNfEKWKLrvBLvlCBTh3rlX1mA5cMjq
         Hki7MiEZdN9xdWOYsvCPrYFxwUf6SInWoFuuVdVqkJ+Yvmxra+YLCQk3JbVbKQkwYRLQ
         I+AWVgP0eAGiXajL0SNigOLPGJWLeYqgIxGuktb6DVcrwFS33Gr0uQDq2uzb/rCjpdzr
         krfEF8jWCDLB3g8oUBitUP6rZmjLMVBwLMofYsGwjwnqDmKruLAP9dpIZOVGYO9zMBmJ
         AcxHJZpobKJLevCyUXOq/lKXkXbNzsqWwc4UYlFAqWTkiEsNtJ+2OHh9sicewoFp1x/a
         Oscw==
X-Gm-Message-State: AFqh2krt/PQL9tsyvxjPlyKV88V7m1NmoUk77cRYXsV8ydQHY+GkOWmd
	0rOceQFWKfr2Os2QliPPdh9b2A8N734=
X-Google-Smtp-Source: AMrXdXtAgZu+pAoAaYuQQAsM5E55paYeoDQZrstt2b6LAIgKd1Hk/SubADrA5GRLvEWllXjlmSi56GzDLGU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:4646:0:b0:799:3955:201f with SMTP id
 t67-20020a254646000000b007993955201fmr3367922yba.94.1673297676537; Mon, 09
 Jan 2023 12:54:36 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:17 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-23-surenb@google.com>
Subject: [PATCH 22/41] mm/mremap: write-lock VMA while remapping it to a new
 address range
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

Write-lock VMA as locked before copying it and when copy_vma produces
a new VMA.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
---
 mm/mmap.c   | 1 +
 mm/mremap.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index ff02cb51e7e7..da1908730828 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3261,6 +3261,7 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 			get_file(new_vma->vm_file);
 		if (new_vma->vm_ops && new_vma->vm_ops->open)
 			new_vma->vm_ops->open(new_vma);
+		vma_write_lock(new_vma);
 		if (vma_link(mm, new_vma))
 			goto out_vma_link;
 		*need_rmap_locks = false;
diff --git a/mm/mremap.c b/mm/mremap.c
index 2ccdd1561f5b..d24a79bcb1a1 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -622,6 +622,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
 			return -ENOMEM;
 	}
 
+	vma_write_lock(vma);
 	new_pgoff = vma->vm_pgoff + ((old_addr - vma->vm_start) >> PAGE_SHIFT);
 	new_vma = copy_vma(&vma, new_addr, new_len, new_pgoff,
 			   &need_rmap_locks);
-- 
2.39.0

