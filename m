Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB24D5A56D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:10:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl4N4Kg1z3g0H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:10:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=B9JYMkX5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=36y4nywykdjwoqnaj7ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=B9JYMkX5;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk586xj8z3bms
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:04 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id e16-20020a17090301d000b00172fbf52e7dso6843717plh.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=KQbM9RENeAKpMamE0B+V4MUsqhzbhGXDlXXjmQQUA6A=;
        b=B9JYMkX5xydBJOgcGzuYw+brQarCWmRWS+0/Aqinb/OY26MbR1xT5axtOfpYrKlmA6
         qGVi7LP6LaJMDcQJmEECw3J6IqaSMiez5M7VUbq2lZEZKkVSQHjZtuqy9g7s10YpHljB
         L9LJY/vXV43u8aIw7/j+LcG51+Bdx5jgIt7f2hLczg1JgYzlwTyYBe/lmm+nmwMuVZWc
         thodE+2BI084oTXFC0MD73T0ggmHuAL+ik6FuitgxrIkPY+yM+/axTrbJYGoWGabXb1/
         atpqGKZe5bOiVGcNY/fR8gQx2/9qiwRjzQjgpRwLojxFdTcGDVT+d94c/I/T/XPhcGEF
         rEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=KQbM9RENeAKpMamE0B+V4MUsqhzbhGXDlXXjmQQUA6A=;
        b=osNQ/xHyrzizo8VpBQScYHdoSkAq0cCltwgROz8F2GFPqXj/I7aURaCFSYXHkm5YjE
         9LSyPP97BXRgLT44svLPrqsXLgkjBdJ1K/q2OcMCg2fZkAHkqOckXX/S16m2TYcyWyBO
         FMLcewFjFIqne314pSE5nfAqtJnaKylGe2IE9FFYsCU3RMs168f7PEOjon0CxdiO3Gcw
         udnXUwRihen4Bi6B5G7dV1g2D8uBddcqFwCTMEvFMAi6ubFeMdca8nYWbPYSelugIGss
         URjVJZY3YYtQDerk1j5m+ts6Diab3nKWNyPb0S5d8cdJIenMBJI0SqpvnQHhatnxqd53
         CJBQ==
X-Gm-Message-State: ACgBeo3/+HJ1mOz/NPwrBPYZC4RLgVAKWeQnnhLA87kDe5r/+fr6uExT
	ewb1jasAO/Arm/VPkMfC3w3Ez5nBemU=
X-Google-Smtp-Source: AA6agR7f4s+E2TUUdzlInwBIWNCTTjaS2dHpmImL6O3kfzXJ6rCAm5H+xn8nFf0AEemGeSJLYPdhv1d/+n8=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a05:6a00:b8a:b0:537:f81:203a with SMTP id
 g10-20020a056a000b8a00b005370f81203amr18341111pfj.80.1661808363176; Mon, 29
 Aug 2022 14:26:03 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:18 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-16-surenb@google.com>
Subject: [RFC PATCH 15/28] mm/mmap: mark adjacent VMAs as locked if they can
 grow into unmapped area
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Aug 2022 08:01:45 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, riel@surriel.com, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While unmapping VMAs, adjacent VMAs might be able to grow into the area
being unmapped. In such cases mark adjacent VMAs as locked to prevent
this growth.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index b0d78bdc0de0..b31cc97c2803 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2680,10 +2680,14 @@ detach_vmas_to_be_unmapped(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * VM_GROWSUP VMA. Such VMAs can change their size under
 	 * down_read(mmap_lock) and collide with the VMA we are about to unmap.
 	 */
-	if (vma && (vma->vm_flags & VM_GROWSDOWN))
+	if (vma && (vma->vm_flags & VM_GROWSDOWN)) {
+		vma_mark_locked(vma);
 		return false;
-	if (prev && (prev->vm_flags & VM_GROWSUP))
+	}
+	if (prev && (prev->vm_flags & VM_GROWSUP)) {
+		vma_mark_locked(prev);
 		return false;
+	}
 	return true;
 }
 
-- 
2.37.2.672.g94769d06f0-goog

