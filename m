Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51D67EECF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:53:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3StB6dq7z3fTs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:53:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SD5yhaj9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=39ijuywykdl0vxuhqejrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SD5yhaj9;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Sd52y98z3fJQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:45 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-4b34cf67fb6so65243897b3.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hq20e7KS4f4C48PKmYYknVSNimtVVHYzyV8VwmVTJ0Y=;
        b=SD5yhaj9WNDyBmH2zVXxIQSAPvkdOOdT/eZZRKlGP77z2J9nVnn6Obfbxv5sauUEV/
         LCtaz+vX4qip57892cEocWjVTNmQS4/TdyxbxT8xLbIWgkt6lFG5ZxopwUuxBJEnTkjr
         vQID9RMKTIQGW2sRQmcGmPfXjoMh0D1eDPyuL/b6rqwKxYdkfEYgEgHjQL0Tw8ZlMbjX
         ZH2/uoF+k+VRzud7oIym//RQdtO+lmKAHdfjocpDVWhkn9piFYOBRbFkKQo8sM+osjEQ
         FxFQ0vmeBJ9JfrQeSA2WMn51BintgFmdPrgL1EZjLw25vLNDWAlkic6I+BYJ/3xqK9CW
         +GQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hq20e7KS4f4C48PKmYYknVSNimtVVHYzyV8VwmVTJ0Y=;
        b=mzW2855Dqp7KdSsZYb1iyquHs44io4XR9OexUHB73TGpzKx1W3q2wPmjCdZvLNo31g
         v1VlM6ttdnDF9cq5YSFuQqFFNT9U0KYNxwctnVIxzhfeo4SDjZ3CO82kU/jkcvwF3WNj
         t4lfbjJAArW45fDe9cYhHYj1Xk9baCp6+RVlRx8MANucMNquCdHPuGn3JygaToNx6BCx
         qP1gmqhBkt9Mw4PrlZwhQ9dnZVF8jNKcJIoSs1LemwFDoKtBNKiewKtgGLnLBoqA1qdb
         yjnmkEK5Pki82V6d9cI36OSbXzYnCFjwJc8s1Qab8q0O5hCEdkqZjk47WBYJuesdp9He
         t7pg==
X-Gm-Message-State: AO0yUKUPuUQf/hXDXAnnplrEeTAJeA1ZN8sLZN1YHioJksQPmlrqBbmk
	WymBrrf6Nz3/pZcteG9XdTTrN1IjTGo=
X-Google-Smtp-Source: AK7set9CI7/3kZjfJSWqixfLkcUok8XHsx1YNSreUFU581ZlI+jbpFxEiZ86BfATPj+NjPN8bnYvtim468k=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a25:b283:0:b0:80b:c7cb:6d1f with SMTP id
 k3-20020a25b283000000b0080bc7cb6d1fmr1156521ybj.298.1674848502930; Fri, 27
 Jan 2023 11:41:42 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:49 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-13-surenb@google.com>
Subject: [PATCH v2 12/33] mm: mark VMA as being written when changing vm_flags
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Updates to vm_flags have to be done with VMA marked as being written for
preventing concurrent page faults or other modifications.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index fee08e8fdce7..66dca140695e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -720,21 +720,21 @@ static inline void vm_flags_init(struct vm_area_struct *vma,
 static inline void vm_flags_reset(struct vm_area_struct *vma,
 				  vm_flags_t flags)
 {
-	mmap_assert_write_locked(vma->vm_mm);
+	vma_start_write(vma);
 	vm_flags_init(vma, flags);
 }
 
 static inline void vm_flags_set(struct vm_area_struct *vma,
 				vm_flags_t flags)
 {
-	mmap_assert_write_locked(vma->vm_mm);
+	vma_start_write(vma);
 	ACCESS_PRIVATE(vma, __vm_flags) |= flags;
 }
 
 static inline void vm_flags_clear(struct vm_area_struct *vma,
 				  vm_flags_t flags)
 {
-	mmap_assert_write_locked(vma->vm_mm);
+	vma_start_write(vma);
 	ACCESS_PRIVATE(vma, __vm_flags) &= ~flags;
 }
 
@@ -755,7 +755,7 @@ static inline void __vm_flags_mod(struct vm_area_struct *vma,
 static inline void vm_flags_mod(struct vm_area_struct *vma,
 				vm_flags_t set, vm_flags_t clear)
 {
-	mmap_assert_write_locked(vma->vm_mm);
+	vma_start_write(vma);
 	__vm_flags_mod(vma, set, clear);
 }
 
-- 
2.39.1

