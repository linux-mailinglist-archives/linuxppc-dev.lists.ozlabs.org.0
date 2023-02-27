Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0F36A4898
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:51:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSjv1h6Gz3fVb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:51:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MCQ0c4ia;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3sur8ywykddknpmziwbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MCQ0c4ia;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSP74Ssqz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:15 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536a5a0b6e3so155605477b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h8ePWaoI68GEISPuC9Ge+4qXkO8FW2G00MOJpn9vfbw=;
        b=MCQ0c4ia6IOTYMEFJR7GcbSkx2aCS+J3n3kLqdT/eCneA5RnZIfOSsLVqqbhg8oV3C
         z6a/cjMHL2s70DKPWTui5sWqdtSoRO2Sa3X/ZDXnFAdUlSIwaWZO5o28PzA9YRicQEsL
         lrmb7xLSeO5Upy8PojNo03zIknEUlOaIGEk3GY2vDeeMswBskS1b7cfH1kyMJjq2FiTa
         EPOOWdtU+2jcY+efHi/NzqtHu6KIrndJCcMf9jiuRTBG5FPDsaXOxEi35OK/QcXUq7OH
         bWHqrLVOAQNuSwHdqjlfEqvb31BygBYoGvuY/kisE56Bi1ONNPXA+NnMTkKqBCgcNMjA
         jbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8ePWaoI68GEISPuC9Ge+4qXkO8FW2G00MOJpn9vfbw=;
        b=NEQXlc6HjqwQLz0xrs6TjUi4NWGAU81xZ7r7l4MqGZpsEWQl9Tcl+xwxmQ9NgRxzkw
         DjwM0wQhE0QJ3031fhqzHcTJFUwSeKKLDqdhkotzZyna5beMJL2RrH0AyyRJI8jD6zx2
         VkS8YfIGYWkczTmT+yHvDeBU8O21FFtrOriEdEeOKVOLItvARQSe5dTVEgUbeLGx2Nf/
         DWGrGM3z7xb0DEKv1gHSUMa0gnP4VwfyjF/UjIg6RHjygGhFAmwcnFQnYh39UGqZweCO
         gmUez0lyzEwhIG4YQo6hKnsBP8awLo8BjGsJSg0c5skaGNYmRtOWMscfTOz+0dbUej5H
         hHIQ==
X-Gm-Message-State: AO0yUKVLXU8IL7nTr6FREzi5hLDEWEBoRAsJcuNWeMnKvZ7zePpVxV2X
	tDBaa2mV4Tfk3UOkLWnsigIBLLgUMmg=
X-Google-Smtp-Source: AK7set9am1xybr1j78qWLG/uhzYsiBlXA8SkEZQ4RtcwObl9A6wj5gHEFg0gqcEhjrM4bOMvHErmcMX4UGI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a5b:84b:0:b0:a09:32fb:be73 with SMTP id
 v11-20020a5b084b000000b00a0932fbbe73mr9490924ybq.0.1677519434899; Mon, 27 Feb
 2023 09:37:14 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:15 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-17-surenb@google.com>
Subject: [PATCH v4 16/33] mm/mmap: write-lock VMAs in vma_prepare before
 modifying them
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

Write-lock all VMAs which might be affected by a merge, split, expand
or shrink operations. All these operations use vma_prepare() before
making the modifications, therefore it provides a centralized place to
perform VMA locking.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 92893d86c0af..e73fbb84ce12 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -502,6 +502,16 @@ static inline void init_vma_prep(struct vma_prepare *vp,
  */
 static inline void vma_prepare(struct vma_prepare *vp)
 {
+	if (vp->vma)
+		vma_start_write(vp->vma);
+	if (vp->adj_next)
+		vma_start_write(vp->adj_next);
+	/* vp->insert is always a newly created VMA, no need for locking */
+	if (vp->remove)
+		vma_start_write(vp->remove);
+	if (vp->remove2)
+		vma_start_write(vp->remove2);
+
 	if (vp->file) {
 		uprobe_munmap(vp->vma, vp->vma->vm_start, vp->vma->vm_end);
 
-- 
2.39.2.722.g9855ee24e9-goog

