Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A64B66632DA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:28:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRrP3NTzz3fZB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:28:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=C0RC5qgB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3mx-8ywykdey02zmvjowwotm.kwutqv25xxk-lm3tq010.w7tij0.wzo@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=C0RC5qgB;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR6C465xz3fBk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:55:15 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id r7-20020a25c107000000b006ff55ac0ee7so10232351ybf.15
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JqE4Jv/Ie7jJyt+ylXoJ6xWWNYJ7mAmWvaygaHhGgmA=;
        b=C0RC5qgBD/V26736LQT1/agfFQE3oawoBsVodaZr+HfHKR+SKXSkxzHnqRRZUQyjCF
         /VKZZZ+vJ6kaEdIfo26R2t3ZnpRNnactrnv5DhopT9zYmpMMrFjwmeMN0NuvQGOG9Ma5
         xgohCqYaIMlqK/c6f2BeWoXmU7iZ4/9gccjpi+n1Vpya+2P9xxgUSOybhe5uijKT6IMh
         I/M50QEDZcxaCjlrD2td9ExwPf2mPPj9P3UPSnAgQR/cCy9DPbczOjnWTPsq0XpCcdbi
         g/lQrqmdlC6kTELYjuH3lVXIdNQlERXCKK1DKiV3+4JsEhkwrKU78EAKu+F90rDI8Z8t
         c6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JqE4Jv/Ie7jJyt+ylXoJ6xWWNYJ7mAmWvaygaHhGgmA=;
        b=jBY9VI3TlIMgjeI9TqGFctYcDHPf14haq2TZea9ZzeTh0N+NxhnElLUShy56fiw9Bm
         POw5qf53d3pjO3jfU+JUE5c895Ju6wBBvJjvJ3zDN5lBqcwmDbRoL9JlyyIrZ76oHnVO
         K9/QxwrzsN+O//ZVRYSaLqVCKKDncrUtijTr7K/acupWgjWbGs2lun5k6YsR2DYHM1+8
         CrPUXu0alSAj2+k32B10Cr82GK4CLnrq7dU5Yn5UTri3RWBs2Elsq3jzKQPWNgd++d9V
         NZLybytH5RoShNQPA3VMdV3bjCRPSy7/+HtWQxNro5rGw0cp2plfPxkYZgDGYy2HLpnR
         Ol0Q==
X-Gm-Message-State: AFqh2kreAqkpA7pCAn3nAaIqzle6/1O9I6mbirLQXXggkUTKFo2KUWLY
	uuFaIdA1tapDFm1YmYu2Cdx9SveUn/Q=
X-Google-Smtp-Source: AMrXdXsVSd5Wz07hI5hxUAzF2wzs/BFzwaLObvOXI24uMhgcUHGkQCCTKMo/jOVrGruw6pJEAc/B3Pke/WM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a0d:dbce:0:b0:4ad:7104:1f63 with SMTP id
 d197-20020a0ddbce000000b004ad71041f63mr3427748ywe.49.1673297713421; Mon, 09
 Jan 2023 12:55:13 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:32 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-38-surenb@google.com>
Subject: [PATCH 37/41] mm: introduce mod_vm_flags_nolock
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

In cases when VMA flags are modified after VMA was isolated and mmap_lock
was downgraded, flags modifications do not require per-VMA locking and
an attempt to lock the VMA would result in an assertion because mmap
write lock is not held.
Introduce mod_vm_flags_nolock to be used in such situation.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2e3be1d45371..7d436a5027cc 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -743,6 +743,14 @@ void clear_vm_flags(struct vm_area_struct *vma, unsigned long flags)
 	vma->vm_flags &= ~flags;
 }
 
+static inline
+void mod_vm_flags_nolock(struct vm_area_struct *vma,
+		  unsigned long set, unsigned long clear)
+{
+	vma->vm_flags |= set;
+	vma->vm_flags &= ~clear;
+}
+
 static inline
 void mod_vm_flags(struct vm_area_struct *vma,
 		  unsigned long set, unsigned long clear)
-- 
2.39.0

