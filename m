Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D63C16632C5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:23:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRl95PJWz3fpM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:23:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=b707Zl9+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3jx-8ywykddooqnajxckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=b707Zl9+;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5z3cPPz3cCL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:55:03 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id i17-20020a25bc11000000b007b59a5b74aaso10158889ybh.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kEbjJObwF3X8F3sFkf3mioj7FiTBVSLxL3AOZVg1QSY=;
        b=b707Zl9+U9/mZ9c+XkHaueCkegKOCNYI/oVAEusRFU63I3srOxecFlDkxyKx//4mW5
         JwP5obEgccip2H4R9+fiuFL4CW2k5fc/GSQhSK1HsVxo3ZKjTR0Lux66eUg0E3PQlBTw
         wXh6GkCABKuopnTH7q3BfoKfyBQ/HE6fsvI1JacGKFSqz7wW0ul/c07mqYyM4k4N+tIJ
         sPYdgU87tyvftSSm83lgw37DswrvUBJMsShqXbiuQjXDGVNwSgoByZHvozZ1Xmfis7g3
         cB964lLozfT6WEMDCdFsl0vR2EiUHB+3pHP9fkmg+z92l6SffusdjR7B04cQIU05PEZE
         4Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEbjJObwF3X8F3sFkf3mioj7FiTBVSLxL3AOZVg1QSY=;
        b=AUBQeTpOos9mX+XSO3+gMZ8q0w93OfUScfd3iCejYvvw1j1/fvOJ7ZUjgiNgC7X12x
         Kz8JIqaa14CKBg/9cSfgZk3nGn8HOdwIMjIGI6CeShApTJTFustF7/Peib2/cBbip0F1
         0oqXaNU99Eu3cVu05UcS2pylg5dWqzC01A38XE5Slu7RHkz1E1HvJajpREw67AwzCnVP
         9Z+hskI6uxDzcd5AWtzD9VL7AasH6GJORoWblccI5Anz1Fv/rU+gx9DhcVuOxKUL/0/I
         T8sIaJN06eDt7eMaSirt//Z2PmVqTSkMfWv5FcsJhMpib1sM8STo2lYsBcBdLjXZu47z
         qSQA==
X-Gm-Message-State: AFqh2koctF4e3tc4ZdWCd3xMYB8WoO/E+MZJSw33jmz3alEELwqndYiP
	U3zZ5o5LLk+rX97aR7bvHNnXEwmJq/Y=
X-Google-Smtp-Source: AMrXdXuMlfQ+hsH5bYnRbFVRQKfHDnoMxNv1bo1mLunTWqhQUT5+3qxDxTtfm+RaU7eYfnfY1D8yBkPOjiE=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:9304:0:b0:7bf:ffcb:79d7 with SMTP id
 f4-20020a259304000000b007bfffcb79d7mr163411ybo.446.1673297701437; Mon, 09 Jan
 2023 12:55:01 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:27 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-33-surenb@google.com>
Subject: [PATCH 32/41] mm: prevent userfaults to be handled under per-vma lock
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

Due to the possibility of handle_userfault dropping mmap_lock, avoid fault
handling under VMA lock and retry holding mmap_lock. This can be handled
more gracefully in the future.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Suggested-by: Peter Xu <peterx@redhat.com>
---
 mm/memory.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 20806bc8b4eb..12508f4d845a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5273,6 +5273,13 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma->anon_vma)
 		goto inval;
 
+	/*
+	 * Due to the possibility of userfault handler dropping mmap_lock, avoid
+	 * it for now and fall back to page fault handling under mmap_lock.
+	 */
+	if (userfaultfd_armed(vma))
+		goto inval;
+
 	if (!vma_read_trylock(vma))
 		goto inval;
 
-- 
2.39.0

