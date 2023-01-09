Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB236632BB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:21:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRgz5KVyz3fLP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:21:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GjzlXD65;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3hn-8ywykddmhjgtcqvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GjzlXD65;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5r1Fmvz2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:56 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4c11ae6ab25so104152417b3.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bx36nWIWIaMqsyKC4DFh9Dy6zgkZnlvdwV69ikS09tQ=;
        b=GjzlXD654bxHD8qHg+BCMZfuuyb19mHGKgBfyrdYtuHPZI3RXY2mylK8MrrZ6vi/KV
         XpBGPAViKdrJ111khQK0LarqUyqdysojbfZLW54fo2JQeFn5ElZgOwEGNBdof4Exx32h
         oce1agjXuGHjstOPH9icNCzJQUnGWQYtYgBGU792WEzYIKYlpSXiCOhWF2Ne+MX/DqXf
         xrifjQ0boHWSv5tXEGAlsRbW4dbyfRz7jLqAVJ0lSkujXDjZ2O7m0HOdnuYL7/iH8Jk5
         Up4mHJat+wejXPO4fCLDWlYHvfZ/+JBFjf5EhWbTUQtFaZy2JybPs/XeOQ27EyoIyzsK
         wpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bx36nWIWIaMqsyKC4DFh9Dy6zgkZnlvdwV69ikS09tQ=;
        b=20tkB7ilw2ITOxiUZ7iOfBSn1K9kuTDJj8uZTwrN+xYCLx07QovTyJvt6aP/gRdqqU
         vG1EtOJ9Vtq71HqPLFkzTJdwbtHZFkMnLLmC/axXQXm4Vw5+/N+d683S82W0fzYlJQaH
         zUDRlElGdriPFfdlPKASqkAgDA9KbbfHI3G2BFDVdphMNAPwSb+HNTbwgIRMb8DFQh37
         qjSSuzpHpBKibPxp0lv+4w4K7GSbcF0afcCJGSx0niN0jIVoZImjtXG70aTcCwgti5+3
         MdRgG23/bmRuUiEntPnx+34hWqvzvsR/w2Te0ZmvTXnjaECsBZyIY6/YoM+RnXFo24iK
         TG+A==
X-Gm-Message-State: AFqh2kpb9KYXLfR/j+aZe7dnkzsP4TKstYAH4KB1YsO54ZFuPZGJSEin
	tjijmNA3g/0HU6LkJwykpCmvcUfbMew=
X-Google-Smtp-Source: AMrXdXsUnoeDnhtdWoii8DMH8rCFUM9XgPs0a9yaOqp3Qv/VXJUnVpuxBD4Is/HyplWdMowbocjku3a0aLg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:3c83:0:b0:700:604:2e1b with SMTP id
 j125-20020a253c83000000b0070006042e1bmr7014317yba.246.1673297694067; Mon, 09
 Jan 2023 12:54:54 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:24 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-30-surenb@google.com>
Subject: [PATCH 29/41] mm: fall back to mmap_lock if vma->anon_vma is not yet set
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

When vma->anon_vma is not set, pagefault handler will set it by either
reusing anon_vma of an adjacent VMA if VMAs are compatible or by
allocating a new one. find_mergeable_anon_vma() walks VMA tree to find
a compatible adjacent VMA and that requires not only the faulting VMA
to be stable but also the tree structure and other VMAs inside that tree.
Therefore locking just the faulting VMA is not enough for this search.
Fall back to taking mmap_lock when vma->anon_vma is not set. This
situation happens only on the first page fault and should not affect
overall performance.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/memory.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index a658e26d965d..2560524ad7f4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5264,6 +5264,10 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma_is_anonymous(vma))
 		goto inval;
 
+	/* find_mergeable_anon_vma uses adjacent vmas which are not locked */
+	if (!vma->anon_vma)
+		goto inval;
+
 	if (!vma_read_trylock(vma))
 		goto inval;
 
-- 
2.39.0

