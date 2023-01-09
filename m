Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A792663278
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:12:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRVV1n7Bz3fD9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:12:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=m9qNPQfv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3b3-8ywykdbwkmj6f38gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=m9qNPQfv;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5P6jFKz3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:33 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id e12-20020a25500c000000b007b48c520262so10314702ybb.14
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FDedOk4BDhI0jXVeiXMnt29MYEOAHvgEHolCeEtDVh8=;
        b=m9qNPQfvAaSk/cZYvrILeQolkFuo8oX0rPOdz+ZeBZe0viaaMWSs2xM9wojEerSzR9
         Ehc0liLdN4Rf9t9ITHbgyUo/TpjLKodzNOt3cYyWGhisrg0tQj8O7DOpS0TtK3tPQLQG
         qUB/3EWr0qIxJ9v9dQ2Qpf6kyj6P77wOGaZ+XxUB3NlRJ4nvQo0f4D36W3MPMO4ktFMc
         ysLVV5w6Mp+QnxSVtHOQDDwbxZ7kpIUBpnDdTFd6J6q0MuwMTyvve19XzRy6+EFEsY7p
         5CEU/qiYVWTESVV3KMWaGXvUZnEBFFh/Tdv+49ubumcalCQjcVJZu4o8Eo8hhtY4lcfd
         RRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDedOk4BDhI0jXVeiXMnt29MYEOAHvgEHolCeEtDVh8=;
        b=5FBkWyRMCdjJEwa8udGXdr126KJGJU4FQCXGm6UcE3df59yjsshaXDofB8pVums4NQ
         MTbJoO23l+v1L4iNsB/0Ul8RKxbwgmsJ7eeXmw3DMVyfBcRh2nxaO90V9iFv+07uTFP+
         7oWknONEL/oWu0WrvYmyHEkhqcH6aLMrUPilIbQ+ji6g2OH4yOYFiXhFnHjMaL/VSMtM
         F9dirukEyUf6sbeWOSzPvWAOXgWCnVYD4AIDXl3HnbKCt8hKS9nXRiuq7CluoIgRx9B6
         aF+VvG1zAKERDdg4FjSa5XYrnK8ce1gtIWiri5PkKgDQ3nvENbHLZnD2IsvkuVnW5jjB
         WUcg==
X-Gm-Message-State: AFqh2kr1Z31dMlFIsoISliuGuFNdG+GDrZ2JpmHqUXdM3lqKl8+9MECO
	TrX5u5X4ITppSaQevISvJopOaovezBA=
X-Google-Smtp-Source: AMrXdXvGyOxiOv+MuSWvovzrd0so3mEpN1Edvcx+Z2HBXoeLvz+P6Hw4SXaxw2akuo9mk6+zHwkliVPrxQU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:1489:0:b0:6fb:ef1e:bb1a with SMTP id
 131-20020a251489000000b006fbef1ebb1amr6925224ybu.168.1673297671808; Mon, 09
 Jan 2023 12:54:31 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:15 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-21-surenb@google.com>
Subject: [PATCH 20/41] mm/mmap: write-lock VMAs in vma_adjust
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

vma_adjust modifies a VMA and possibly its neighbors. Write-lock them
before making the modifications.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index f6ca4a87f9e2..1e2154137631 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -614,6 +614,12 @@ inline int vma_expand(struct ma_state *mas, struct vm_area_struct *vma,
  * The following helper function should be used when such adjustments
  * are necessary.  The "insert" vma (if any) is to be inserted
  * before we drop the necessary locks.
+ * 'expand' vma is always locked before it's passed to __vma_adjust()
+ * from vma_merge() because vma should not change from the moment
+ * can_vma_merge_{before|after} decision is made.
+ * 'insert' vma is used only by __split_vma() and it's always a brand
+ * new vma which is not yet added into mm's vma tree, therefore no need
+ * to lock it.
  */
 int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
 	unsigned long end, pgoff_t pgoff, struct vm_area_struct *insert,
@@ -633,6 +639,10 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
 	MA_STATE(mas, &mm->mm_mt, 0, 0);
 	struct vm_area_struct *exporter = NULL, *importer = NULL;
 
+	vma_write_lock(vma);
+	if (next)
+		vma_write_lock(next);
+
 	if (next && !insert) {
 		if (end >= next->vm_end) {
 			/*
@@ -676,8 +686,11 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
 			 * If next doesn't have anon_vma, import from vma after
 			 * next, if the vma overlaps with it.
 			 */
-			if (remove_next == 2 && !next->anon_vma)
+			if (remove_next == 2 && !next->anon_vma) {
 				exporter = next_next;
+				if (exporter)
+					vma_write_lock(exporter);
+			}
 
 		} else if (end > next->vm_start) {
 			/*
@@ -850,6 +863,8 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
 		if (remove_next == 2) {
 			remove_next = 1;
 			next = next_next;
+			if (next)
+				vma_write_lock(next);
 			goto again;
 		}
 	}
-- 
2.39.0

