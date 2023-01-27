Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E7B67EF0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:01:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3T3b2GTJz3fwh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:01:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oI0LJkxW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3dcnuywykdnmhjg3c05dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oI0LJkxW;
	dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3SdV4R7Mz3fLb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:42:06 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id c75-20020a621c4e000000b00592501ac524so2224795pfc.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cy3b4YdYe1JheypyM1qEqlntx+LNPOiVtlvqoTpRTGk=;
        b=oI0LJkxWJWb4FwrADuA4kk3Z1VuG/PqmB+wfudzVRf1FutZSssy7j1ZDpJRsJeC2x6
         AK+2fBcgvA6Z1yebvss3n+ODruOq7UlamXlS7DfsbRapPdytBdlVYqH5VQCwBS0bW5Cs
         14NyRgqd5c0dS96F3WtaSc6UYIsY2Q866sZsgDc9kakHc8RR5OiJX50DOvF/naV3sW35
         K5NQwDrUGeBVt7kutcZKVO5xLo4MSKoGaFWDyWGZ3caTDR6ZBpyZR8N/O+LnlyPsEjZa
         UEkxm7VSV5agQqzuF3YgYMg0fZBeMdeXvS4WgRk9vqB/9OKyGK8SEZXO7u7cVN0V9JOR
         wUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cy3b4YdYe1JheypyM1qEqlntx+LNPOiVtlvqoTpRTGk=;
        b=i/AIgiTCv40aNvQFpCtx0VSZdx82d/POjXQdQTouyWELno4vgQK3aMZxJEQwgQGT7T
         L6RVXFM+ZigLiwDUF1nNOMkQ4SqmWGaCTW8cG8NQP00hIw/3itO/U4akqEHlaCvRMB9U
         JiLPmsRvysPwwQ/w+TvmzOlzxEEsrRTVW6OMpZwxJWGEdDapI1D7mV1dYvcV9KIh27mS
         zIRnrJp3Vb6Nd3B3PZ793p9cOBxeqUV9+c4qkVK8CsT8Cl+xeVh/iK7Y6J6Lv90PGHO5
         jr74S6NRTZRm3J9T1gFsRMXKAE9Iap6GqcT8k49qpGYc8NIlkkCrG5Dnpp9wad04ZXcv
         B/4A==
X-Gm-Message-State: AO0yUKUVfWLwfnu1UJVkEl6bF7xEGoj3O9dSrwWM2ZVrz/pAmFXES/jF
	y9kB+yusrxRS8yH1Ef8RfuSuUHdU8a0=
X-Google-Smtp-Source: AK7set/yd1hcYRvbMqSOfXS0bVRoPLBLaG1qWLcI1OwZ+QZcbDYXkFqGvC1aaqenThgkEbN36zZqWHoF630=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a63:ba1a:0:b0:4dc:3b99:6f67 with SMTP id
 k26-20020a63ba1a000000b004dc3b996f67mr1091417pgf.47.1674848524282; Fri, 27
 Jan 2023 11:42:04 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:58 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-22-surenb@google.com>
Subject: [PATCH v2 21/33] kernel/fork: assert no VMA readers during its destruction
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

Assert there are no holders of VMA lock for reading when it is about to be
destroyed.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 kernel/fork.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 9141427a98b2..a08cc0e2bfde 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -491,6 +491,9 @@ static void vm_area_free_rcu_cb(struct rcu_head *head)
 {
 	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
 						  vm_rcu);
+
+	/* The vma should not be locked while being destroyed. */
+	VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock), vma);
 	__vm_area_free(vma);
 }
 #endif
-- 
2.39.1

