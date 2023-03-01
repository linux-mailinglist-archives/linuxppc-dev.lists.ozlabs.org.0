Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D46A73FE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 20:05:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRkGW6SBqz3cMn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 06:05:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Fyrl4aN8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=33kh_ywykdeuz1yluinvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Fyrl4aN8;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRkFZ4NpJz2xD7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 06:05:04 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a137-20020a25ca8f000000b0091b90b20cd9so1319384ybg.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 11:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677697501;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eZZzZE8GpdNY+MwogNnFVaUs2b/RvHe7OTvEU8aJPfc=;
        b=Fyrl4aN8thLa08lvSwfnz3pS77dLDE/JPDoL0n+GfSBVkEYmU/na7n6N3awmHGcBsx
         fg4YM6nkuIRNWndpa/Vvh28BBbpGpJRQu2vsHAWiO6a5ZOUjmcMA7LOEEPP8t186icRE
         TTzl2f0lYKQ2gEv3faqd7R7sHmLmFHvz7aRO6WVgfOeUssnPkNyUgEAinVLSyUArDjIp
         kbm/6C3MBv1I4BXWlD3jhzvuaIkNNoC3TdQPTPCNNYNwWctyfsetJwP6v0E+I8n/tQPA
         F1L2rtHP4dGjfzEUvNlYgeld/2PRYT7D9g8oV1r1Tb8v8B8+31LZevINjOdzhGWMe5yh
         P0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677697501;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZZzZE8GpdNY+MwogNnFVaUs2b/RvHe7OTvEU8aJPfc=;
        b=T4D3LeL/0Ljsw+0dg/K8paIQjcTzmk9euT48wYB2rytYIPrAqXVWMJkzasKiMcaWTb
         32bAFFGdRfjIpm9PhxJUFWglqCWxs5Tw9Nd2rysrUYg2OmlgjqAJQ/KB4WvZ3o36vDHk
         LGMAq53WkDHlv0eDg6SFMOsX6vzThzdPMRPqPFO6T2LGD+CaUbXG09wz4BnO6zUGsHqt
         AOyIZOqQ4Vk9BBqMyTtTyNxZxXDHOwrUWjF1QbuXqYOeP4ORbxic1p3PEHTCkG+H1VYd
         hc/Cv5FdiCO8iARTyLISa5/OhN8KApJ7M14cvKx3I/pE8Z+WcL43gWTjVYdR6bXhPd6n
         RpCA==
X-Gm-Message-State: AO0yUKWCu7vtpVRz2lJFbUx9mkrZPyIKXtFYKnVqeOAT0iV7osrMdWAj
	eWvovJBiAliFAd6bDy6quMqYH1kYZyU=
X-Google-Smtp-Source: AK7set/9C/tFDvwQ8AH2AjoEK29ndZJWeqFhKnrMFIlBfk3w7trnnd608E+7P+Ccqu1RqtfeQNT22abiIwk=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:3c40:eeb3:7c3a:807e])
 (user=surenb job=sendgmr) by 2002:a0d:c506:0:b0:533:b8f6:828e with SMTP id
 h6-20020a0dc506000000b00533b8f6828emr19ywd.411.1677697500632; Wed, 01 Mar
 2023 11:05:00 -0800 (PST)
Date: Wed,  1 Mar 2023 11:04:57 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230301190457.1498985-1-surenb@google.com>
Subject: [PATCH 1/1] mm/nommu: remove unnecessary VMA locking
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Hyeonggon Yoo <42.hyeyoo@gmail.com>, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@lin
 ux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since CONFIG_PER_VMA_LOCK depends on CONFIG_MMU, the changes in nommu
are not needed. Remove them.

Fixes: bad94decd6a4 ("mm: write-lock VMAs before removing them from VMA tree")
Reported-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Link: https://lore.kernel.org/all/Y%2F8CJQGNuMUTdLwP@localhost/
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
Fix cleanly applies over mm-unstable, SHA in "Fixes" is from that tree.

 mm/nommu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/mm/nommu.c b/mm/nommu.c
index 2ab162d773e2..57ba243c6a37 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -588,7 +588,6 @@ static int delete_vma_from_mm(struct vm_area_struct *vma)
 		       current->pid);
 		return -ENOMEM;
 	}
-	vma_start_write(vma);
 	cleanup_vma_from_mm(vma);
 
 	/* remove from the MM's tree and list */
@@ -1520,10 +1519,6 @@ void exit_mmap(struct mm_struct *mm)
 	 */
 	mmap_write_lock(mm);
 	for_each_vma(vmi, vma) {
-		/*
-		 * No need to lock VMA because this is the only mm user and no
-		 * page fault handled can race with it.
-		 */
 		cleanup_vma_from_mm(vma);
 		delete_vma(mm, vma);
 		cond_resched();
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

