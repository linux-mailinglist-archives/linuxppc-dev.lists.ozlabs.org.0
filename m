Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE9E698C3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:42:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHP3X2skXz3fj5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:42:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FCDmrKEx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3wbztywykdbggif2bz4cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FCDmrKEx;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNXM4Phcz3f5g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:59 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4bdeb1bbeafso8704977b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=76w8C0WtscQXhYR05yNYHvPFGtZWYYoigmdRBKNsAGs=;
        b=FCDmrKExzLuCArz312mMsT1GG2XBAJpY0IRk4Dudkq8tacxOtpStMHAB4mCqF7cHzr
         HxmYKbJzh0e/OlcI5tze/pJirqiUzOseaOUlDEtDH80qm7FP3CxiVmnvUlVVgBXp61ej
         ykGRdx137mYbxOiW4ntwVshjUhNYXqvxbpsd7tR4+U5K8xmf3z6sAC5BmIr5igjBFbE2
         Lhh7YXKnyKDhial8w7C+wSOyLz2qDj3wAEjKVPIMU3N4BzLNr3q2F7Jzk8qKKMPeJp0i
         mhDW6Px8X9de0wrc9+taZBLP7xnnbG62Qe2RXE2u3O0X+3PidgLM2eknvp7ECPYQAyqI
         26OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76w8C0WtscQXhYR05yNYHvPFGtZWYYoigmdRBKNsAGs=;
        b=RtuYbE9LC0EtVTTymNFtI/cWGAJkFbgGakHJa4AwqeFgiQC6AdOTQRkZvYedVhDUNs
         BK96L1043L+Lir8gktSW1NlqDGpOmEvVe0jBUmUPrs5iDxHX/XC9eMbuSWCmk0wa7tUw
         Bi9BP3Rv3xVyxg3kMk7lBHlp4CbIaUkuMqqnegQZEwVHqJFMroC01navFjkNzQBf4xNu
         jiCiy27j7Ku/izsFSQeN+YoPrD1P8wi9ygsAdZW9fq3MMfTq5v0M9Q1dvbUaV0zFN9dk
         iiAoczIaO23EOYlYlsXueEmo+h2Jv7HJYlD5kidwkx+HYN07Ymvqhx4L8J7jdbHyCqJR
         ITAQ==
X-Gm-Message-State: AO0yUKVEYkP4TqM+wN+4XG42OepX1FDCc6JARG/YM0nvc9soDtkFMSUQ
	ya8n20UJBo+N3tYM1it3k5IxBVj9QvA=
X-Google-Smtp-Source: AK7set/7Y/K8KWVB4K6J3b/XMgTvXO7u2Z/Kc+o++p3RcwHAcWZWf0oYrOVDXbq6GKc7ezqD+HuFayT02ok=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a81:9e0a:0:b0:532:a8a0:8d76 with SMTP id
 m10-20020a819e0a000000b00532a8a08d76mr235300ywj.85.1676524737340; Wed, 15 Feb
 2023 21:18:57 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:41 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-27-surenb@google.com>
Subject: [PATCH v3 26/35] mm: fall back to mmap_lock if vma->anon_vma is not
 yet set
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
  hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When vma->anon_vma is not set, page fault handler will set it by either
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
index 5e1c124552a1..13369ff15ec1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5242,6 +5242,10 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma_is_anonymous(vma))
 		goto inval;
 
+	/* find_mergeable_anon_vma uses adjacent vmas which are not locked */
+	if (!vma->anon_vma)
+		goto inval;
+
 	if (!vma_start_read(vma))
 		goto inval;
 
-- 
2.39.1

