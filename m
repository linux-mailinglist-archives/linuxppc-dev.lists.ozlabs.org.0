Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BED698C3D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:44:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHP5j4JScz3gDX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:44:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aDErRd7k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3xbztywykdbwkmj6f38gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aDErRd7k;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNXQ27DPz3f74
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:19:02 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-52f2ab6a942so8480767b3.14
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+haucx/0aUjNKP4B5JYWnKqFhX48IZcct98M2E1/jbw=;
        b=aDErRd7kkY+Kp4AaU6gjM3F503YHpBTPjjocmaNoc4zXVCAuMI2RAQKjzcRAbLtJge
         uySjaOCoHcGS53W7o3RYdOQoeaAfeHvH08PuG1fh1bxXWOGZDVGDBlzIfGuJz8kR8m0P
         4LCu9IW21ZFA5+XCq7hXP9c4LIZtK/mDOJpY3r8EhzjVEo7Ti1XlFspuAz3gf99Vo08U
         GQhyt4xy4/c9ROtLln2G8n+ixCeeiCqz1U0tO8VqF1k+R16fVXyhOw17lx8zHct64i1Z
         f89mO/K5qgtX3vlh4Aty7U18axNicxnQBp8nhqlTIla4iaOnphrb06qKzWIf+oeLlfcz
         N8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+haucx/0aUjNKP4B5JYWnKqFhX48IZcct98M2E1/jbw=;
        b=dJctqBgUqjfFUkE53YBOdFKnbWKJAAK4WyiO16cpNjv7N1d+JGTylW7XU7lADqnfTn
         owJLDMvNBap+gPTx9/QVSLQvB7YXyNJ795Jpu3735oEpRguRoNOTUPUzwZ8q/4U3kw49
         29GmgAabFdKnE3m9DEMJptNhmllmEpdR86BwUvChtIxJiLfabAtp72tRfCFa5qGc8TAA
         6+kQxB3wL9TkU0HVdI8CXxhnRe+ikr3isbC41aKIZ6UwI6Xe+swhN4xQ97O5zyr89P4+
         8LiOLoWLHZ+/AqB/4rzBZ4xfIVJkKcsYSBZghxU/SG5CDbIrJXhcME0UWrehOA7SOGWR
         4rXw==
X-Gm-Message-State: AO0yUKXeKIfCXl78wDkrGIFfCYG+kLMcjdA3hiZtjBFI8093Voq3v9nU
	BZTDk80bDn2Q7VnjYoz96wwCTLtqY7c=
X-Google-Smtp-Source: AK7set9hR8JRk82RlKZHeYCMxCYi1ok7+igo70HcdJvHzw/Nn50rv4GE5Ev7Sgo0D41w7o23DTD5b6roJhQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a5b:c41:0:b0:91d:ddda:665f with SMTP id
 d1-20020a5b0c41000000b0091dddda665fmr396601ybr.589.1676524741694; Wed, 15 Feb
 2023 21:19:01 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:43 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-29-surenb@google.com>
Subject: [PATCH v3 28/35] mm: prevent do_swap_page from handling page faults
 under VMA lock
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, Laurent Dufour <laurent.dufour@fr.ibm.com>, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstr
 eet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Due to the possibility of do_swap_page dropping mmap_lock, abort fault
handling under VMA lock and retry holding mmap_lock. This can be handled
more gracefully in the future.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
---
 mm/memory.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 13369ff15ec1..555612d153ad 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3688,6 +3688,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	if (!pte_unmap_same(vmf))
 		goto out;
 
+	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
+		ret = VM_FAULT_RETRY;
+		goto out;
+	}
+
 	entry = pte_to_swp_entry(vmf->orig_pte);
 	if (unlikely(non_swap_entry(entry))) {
 		if (is_migration_entry(entry)) {
-- 
2.39.1

