Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37A5A9E4D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJSzL1TRyz3c25
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:42:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kNx38Jhq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3do0qywykdlejlivesxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kNx38Jhq;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSr65Cz2z2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:50 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-343a77f2129so37854867b3.15
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=DiVLSVAVO410fRJcvWWuX+r6LjGy2i2DyacaHp6fzuc=;
        b=kNx38Jhqjx9XlmKxOVsRKukj17KeQAoUkvOgezSjJcI7qDa8s6siy6+ZCSn18LnVHi
         n4QLcTPTYnWQedOp2NOA065emr+I7/FhDV/20btA2UJprNGZCfJvY2fzU6JS3rffkIEf
         2FurYAnF0+QmVLyL1XlOy/6eS9/B08Rzb+EHT4ihXLuAM0YGViLuLR9Pls5xzIb0RA++
         peqVg5K5+yJOyniQSXXLxLw8N9e7jk4WJ8bD01w4ADM9IUXJZsw/A2NPWpCJiNE61osh
         1/9xE4X1j0QNkz0GiHjK4YBUmosqgJkbBEuUlP/cGGRjR6eOLhrxcNhT+yoJZX8wCM9W
         ZvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=DiVLSVAVO410fRJcvWWuX+r6LjGy2i2DyacaHp6fzuc=;
        b=BOb2wIqiohQ7B9GQ4nbgdPCKg50MCQ3tQrsS5Jg0ecdlkPgWS217vwXG4Nka1Lmi3G
         n4AepBXRNyywBaGTAF4hI5NPAG/HP5XBEiLKpOxYYpY6ehleNyE2WAY5hnuL9QMG9358
         FR4k1Ib68B+LHLKgQIHI7f23eJqVkJcd/vNFr6o4sXxsofCwN7+OsmLnu66S7FOSYY49
         F/JD63B0Kwyn0Venw0EE9zrp6IFi+nCDKZ7cporH98UOPS18veMBA9SY8LP3YsVQb3At
         EcdZHSeNxuUbyp+uGHRHgJgZ+QNS2yPCX4qXocR6Q9GXEnweuQF3A/LGqBOi2uQMXjoS
         atBQ==
X-Gm-Message-State: ACgBeo2ax9x2s0HZsgfd1qEDOWgRp1OQGYxtfSRqLv3aJnBhklyHq9K7
	rz1YPMJiliRf56U8TvV11wC2MRAxars=
X-Google-Smtp-Source: AA6agR4qMG/7UuuiqhHhvohWNal3nFjDJKXC1X/Q7rlLCDCvl4ZyXaMMKRMmizmDLQF7LDsGfEt+/G6N4D4=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:bf92:0:b0:695:8d8f:2af4 with SMTP id
 l18-20020a25bf92000000b006958d8f2af4mr20427159ybk.200.1662053748060; Thu, 01
 Sep 2022 10:35:48 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:58 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-11-surenb@google.com>
Subject: [RFC PATCH RESEND 10/28] mm/mmap: mark VMAs as locked in vma_adjust
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vma_adjust modifies a VMA and possibly its neighbors. Mark them as locked
before making the modifications.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index f89c9b058105..ed58cf0689b2 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -710,6 +710,10 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
 	long adjust_next = 0;
 	int remove_next = 0;
 
+	vma_mark_locked(vma);
+	if (next)
+		vma_mark_locked(next);
+
 	if (next && !insert) {
 		struct vm_area_struct *exporter = NULL, *importer = NULL;
 
@@ -754,8 +758,11 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
 			 * If next doesn't have anon_vma, import from vma after
 			 * next, if the vma overlaps with it.
 			 */
-			if (remove_next == 2 && !next->anon_vma)
+			if (remove_next == 2 && !next->anon_vma) {
 				exporter = next->vm_next;
+				if (exporter)
+					vma_mark_locked(exporter);
+			}
 
 		} else if (end > next->vm_start) {
 			/*
@@ -931,6 +938,8 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
 			 * "vma->vm_next" gap must be updated.
 			 */
 			next = vma->vm_next;
+			if (next)
+				vma_mark_locked(next);
 		} else {
 			/*
 			 * For the scope of the comment "next" and
-- 
2.37.2.789.g6183377224-goog

