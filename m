Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4965A56A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGkvM0TPJz3blw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:02:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ef83aGWT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=30y4nywykdiq02zmvjowwotm.kwutqv25xxk-lm3tq010.w7tij0.wzo@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ef83aGWT;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk4k5Ykxz3bVt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:25:41 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id m14-20020a170902db0e00b0017336b7f6b9so6725897plx.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=cPhW2Jsm5VYfGL+tNkfF3HbuaaNlLZ4rflaa6thsEZ0=;
        b=Ef83aGWTdm10niN8twSSpG3ds5UuJPZXIlmBxHFg2pzrVEdcovVnDh3P/RYOinFzyL
         56g3s4OBiiWq4sYS4zyOn+I3sJdcQzzrlMjpsAwGpe/6DNb56LumMLV46gfcGkdOoroQ
         Xn2Ez1+n3LVumJ9ul/e3Fo4g/eC812QXSiR/GOAlZ/X37IBJZ8GhOEEF+zxhXhrBOhrA
         wyQ3RxsgNeUblE3TddZPmpCUfJPQ1JoHkMsqbRXnrreQjskaAOAntkxj5MpJLWS1ppBQ
         s3y364HBN4NsSi7BBvtTGWNjoBJVZ6VaguwCOOzVv7z+u5EVx5HkEViGicNoS6cS9car
         5ukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=cPhW2Jsm5VYfGL+tNkfF3HbuaaNlLZ4rflaa6thsEZ0=;
        b=M85YHqV9PirRv6mmkdgL/ERRQrRwku55inkbWhB1J+szxDxs3bpJMnwtV11KSbatE8
         016w+G7xPDGWOvWtzIbpVjLYlJtfVo2jyKCAEtnFsGsi4lxjGrJhwhTolWCHpzlRMBrC
         2FjSx2mxdsI30WWuW5d7c2DBywn5kfOerHT4GV54kj16i9saLXVbd8ZNv75gXi1Bo2sL
         VK5/cH0SSiO87MmTLPQ6UGgtNHpeHi58FSmFpsaWeWDXiwUy03ef0EnROvKai/ZwXPuU
         50qiaxCzeeKGENEPGku4mqRaxnTt5D5SW5l0PSnTNZIkIKESQptHwFvo93LlRuQVzEW9
         lS+Q==
X-Gm-Message-State: ACgBeo3rWY8Cm65laBsNh4f8ndMv7QGZIQDP4L0Z+1D5Xz95jv/WGil6
	cZ6eZ+fCcI8mqFZHJAcme5N/ezgubZChxIjkHS+ek/NYjBAkHVXMEHkCiTOra5lbA8YApbpWnCa
	vIQY4EL1AEg1P4XVvsOo82w==
X-Google-Smtp-Source: AA6agR4h8d6XU8wf7Rba89JuzvO6/M5QQD9xRgO2erAMFyngZx2nEIGpax2LUa1YM3lFKVFmr9HgbHhBg9U=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:902:694a:b0:16e:e270:1f84 with SMTP id
 k10-20020a170902694a00b0016ee2701f84mr17988146plt.89.1661808339339; Mon, 29
 Aug 2022 14:25:39 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:05 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-3-surenb@google.com>
Subject: [RFC PATCH 02/28] mm: rcu safe VMA freeing
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-ccpol: medium
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

From: Michel Lespinasse <michel@lespinasse.org>

This prepares for page faults handling under VMA lock, looking up VMAs
under protection of an rcu read lock, instead of the usual mmap read lock.

Signed-off-by: Michel Lespinasse <michel@lespinasse.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm_types.h | 16 +++++++++++-----
 kernel/fork.c            | 13 +++++++++++++
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index cf97f3884fda..bed25ef7c994 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -403,12 +403,18 @@ struct anon_vma_name {
 struct vm_area_struct {
 	/* The first cache line has the info for VMA tree walking. */
 
-	unsigned long vm_start;		/* Our start address within vm_mm. */
-	unsigned long vm_end;		/* The first byte after our end address
-					   within vm_mm. */
+	union {
+		struct {
+			/* VMA covers [vm_start; vm_end) addresses within mm */
+			unsigned long vm_start, vm_end;
 
-	/* linked list of VM areas per task, sorted by address */
-	struct vm_area_struct *vm_next, *vm_prev;
+			/* linked list of VMAs per task, sorted by address */
+			struct vm_area_struct *vm_next, *vm_prev;
+		};
+#ifdef CONFIG_PER_VMA_LOCK
+		struct rcu_head vm_rcu;	/* Used for deferred freeing. */
+#endif
+	};
 
 	struct rb_node vm_rb;
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 90c85b17bf69..614872438393 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -481,10 +481,23 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	return new;
 }
 
+#ifdef CONFIG_PER_VMA_LOCK
+static void __vm_area_free(struct rcu_head *head)
+{
+	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
+						  vm_rcu);
+	kmem_cache_free(vm_area_cachep, vma);
+}
+#endif
+
 void vm_area_free(struct vm_area_struct *vma)
 {
 	free_anon_vma_name(vma);
+#ifdef CONFIG_PER_VMA_LOCK
+	call_rcu(&vma->vm_rcu, __vm_area_free);
+#else
 	kmem_cache_free(vm_area_cachep, vma);
+#endif
 }
 
 static void account_kernel_stack(struct task_struct *tsk, int account)
-- 
2.37.2.672.g94769d06f0-goog

