Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA16D5A56C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:07:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl176cQxz3fjQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:07:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=PCjrqm9N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=34s4nywykdjiegd09x2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=PCjrqm9N;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk511Bwxz3bkx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:25:56 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id g11-20020a17090a4b0b00b001fb5f1e195fso3865385pjh.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=nWFFKiz2JrcFJbZNC6h3WaeWKSGRlWYuGKA4mg+JUNY=;
        b=PCjrqm9NhycPwB3kYWPhGmirug2EAINieO21R1tkNllFgsambVeodQV2SWE+SPKnLk
         B35opb3MQlODsxNphVo3gt2yyCr1QpWXQKLcx1/vKzcN/4STqp6cRFJdHuKeBk+NsfTT
         tDOTylgaSdZ5nEY1ymyrW4L9evpwJBVsw8WgcZFUheAteEM8kYWXWY1xc4VUjrsXgS7n
         TvpEAgLiNbXgMlGNPVj+MFOM++dtX+BoFzGnROjLhFZB70sHOrsgtuWSCJIJNO8R1S+2
         S3QUIvJ5IyCicdMqNDVbeJ892T5I6yDVEmvFVjdkZe2DnjLJIY2H8E2Qt303ElEJo4Tc
         HSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=nWFFKiz2JrcFJbZNC6h3WaeWKSGRlWYuGKA4mg+JUNY=;
        b=QM/UsKrmVVM6SEpD2l3NKcG+5wg27FTPXrdO3xC+iMt0fvH17KXDnepZo9Q10eXbMh
         K8eTr7js9BzYwrIRRT5ITTVAZC+pLazE34xnTpBvS9Cp9PPnBHmKrdAVuyZ8Yb0by55H
         Lt4fI5p83bXbX8WR5U3BR45c5vd8woKEarYBpYXUPIHWQ/sFMw6Ns9rZVZ7jxBC9GOtF
         kq2cWZRF/MEwvjBdoU/84s86kw6hMUyU4qd5zukl/BOBJo13ED+wDF14CqZcz+uAuBhS
         po5pDfd4CC9oKjcIVgNIkaOFAlg8ot/RDReg/lApUk3fcgtNECF+PTg1ms64rORsJXMP
         iv5g==
X-Gm-Message-State: ACgBeo1G21aWw0Y50QziO/A/dbamXp1z7tP5k5DDZCeSlW9hkvAV5Uk0
	SBjg5NpgkT8kayh1CYs4AaR5bLaHW+w=
X-Google-Smtp-Source: AA6agR4dglPLGzQSnoqHwxEZwo0Lk0EwUGiOTYsdKQuDkqIVlV54iwLYmhw7nxi8GDICS/TsbTVUTOyC/V4=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with SMTP id
 t9-20020a17090a024900b001e0a8a33c6cmr21107pje.0.1661808353487; Mon, 29 Aug
 2022 14:25:53 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:13 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-11-surenb@google.com>
Subject: [RFC PATCH 10/28] mm/mmap: mark VMAs as locked in vma_adjust
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
2.37.2.672.g94769d06f0-goog

