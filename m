Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F05A9E53
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT0665Fhz3fNT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:42:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RqTxEDKm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3du0qywykdlmlnkxguzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RqTxEDKm;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSr93l5Yz3bnj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:52 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-343a77f2129so37855687b3.15
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=IUrOZBQLzZPUHaSf75EcaCRmzwc/1Uln8Bhr3CCRW40=;
        b=RqTxEDKmKz8lQ9e4qoEc4uYxV2l6ZaYMJyNDEM2PccdKcjIk6CnRCwBsEF2cj3JFvG
         j1vM9+I5MFJ8Y28kW9pfnzwXL/sLYGBlEyABKHcApM/RmMkSzapOCNpQMv7qth5lMe9Z
         r4q/GOZemPIxyE1pZ9TWp0QmyjLs2nHHEkPOAyS+5ktrUUhx4EO8hL8MjHB9ieBIjUIm
         Yg7XSf+rAL+v2NSP5NDXERvFs20Phv4/bhur7fMLyFA6L2AN5XBQFKbc4pQ3AuRWkJ+n
         hhBQmROSc08GaGFWWbM/WsNha74+z1T1INvujKYoiSdnjlDI7QzZLxl1fThOa82IPdUF
         4lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=IUrOZBQLzZPUHaSf75EcaCRmzwc/1Uln8Bhr3CCRW40=;
        b=DC8R5B0bfLXdSR4pNppT9qGafxzkyKBwBDDnyAoX4o/3ThFcMfOrAm2yQUjrxLPxGo
         xpWFbrewjXOnKkcRNJn/VFquSoilPB9OxxtNYBENdMPb0p7jcpZvauYF8qYHbJSGARZQ
         FuplsqQK7/WXC3V97Bc8mR+fch5AMF1sT7XaBFqWgEzWEIF4e5Ncapzt+GQWHo8EETz/
         DSZxHh5hgMAWQwVJ5odDOjq3esdOGivClr70an2DBinPglyGnxT/QbOC1aFo5tf7y4Yz
         6uIyGEY46Mqw+mbOEOcBJnzTo8JKhUeOPZfazYlTSO7mgKfDy3yWHno8Sc97AocgCW/x
         1S3g==
X-Gm-Message-State: ACgBeo1S8d4n7qdOeoarMK/nFNzMOM5JjVNIpWm1yYU6yhHafjy0LZV8
	BrgG5voGBgirjqVjNPfmoFIr+4v/Ftk=
X-Google-Smtp-Source: AA6agR7hyHeb8khg+/3ZoJp3oFVauMFyBSatbGnIGl1CpSfGDYZylUwLzf/LZXvggze+7Aght5uln8kJbB0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a0d:e083:0:b0:343:2928:867f with SMTP id
 j125-20020a0de083000000b003432928867fmr6902464ywe.467.1662053750534; Thu, 01
 Sep 2022 10:35:50 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:59 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-12-surenb@google.com>
Subject: [RFC PATCH RESEND 11/28] mm/mmap: mark VMAs as locked before merging
 or splitting them
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

Decisions about whether VMAs can be merged or split must be made while
VMAs are protected from the changes which can affect that decision.
For example, merge_vma uses vma->anon_vma in its decision whether the
VMA can be merged. Meanwhile, page fault handler changes vma->anon_vma
during COW operation.
Mark all VMAs which might be affected by a merge or split operation as
locked before making decision how such operations should be performed.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index ed58cf0689b2..ade3909c89b4 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1147,10 +1147,17 @@ struct vm_area_struct *vma_merge(struct mm_struct *mm,
 	if (vm_flags & VM_SPECIAL)
 		return NULL;
 
+	if (prev)
+		vma_mark_locked(prev);
 	next = vma_next(mm, prev);
 	area = next;
-	if (area && area->vm_end == end)		/* cases 6, 7, 8 */
+	if (area)
+		vma_mark_locked(area);
+	if (area && area->vm_end == end) {		/* cases 6, 7, 8 */
 		next = next->vm_next;
+		if (next)
+			vma_mark_locked(next);
+	}
 
 	/* verify some invariant that must be enforced by the caller */
 	VM_WARN_ON(prev && addr <= prev->vm_start);
@@ -2687,6 +2694,7 @@ int __split_vma(struct mm_struct *mm, struct vm_area_struct *vma,
 	struct vm_area_struct *new;
 	int err;
 
+	vma_mark_locked(vma);
 	if (vma->vm_ops && vma->vm_ops->may_split) {
 		err = vma->vm_ops->may_split(vma, addr);
 		if (err)
-- 
2.37.2.789.g6183377224-goog

