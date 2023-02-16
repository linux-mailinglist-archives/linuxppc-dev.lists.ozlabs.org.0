Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5977F698C04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:31:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNq01C38z3fjw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:31:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Aww5hQNu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3pbztywykdpouwtgpdiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Aww5hQNu;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWq2mmDz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:31 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id b38-20020a25aea6000000b0092aabd4fa90so838033ybj.18
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pCPLSRzUXQbjlFnRzNKKqjCLNtpc7ieGcBzd48Gb76w=;
        b=Aww5hQNuikXrQshFEtykppDfMBP38yEIiv8YZeHijhJepfYOC8bhl72PA7W7euJsgq
         UTdE3Yop6yuQ+QJ/imxEBpOD963eWsY1ljkA0jBaqGGg7cF+cENyfejTL2VbGXvtI8Gp
         zk9pQRaFettmR6L6WtIha8F6CvO6a31a83bm3SVswwIqM5PcX+z7DGQBjncH/5EAGpUc
         AT/XTvZe03bL8P4vyUJmA5jKJVVP1mrUYpMWnBW8gSUZQLx6c9BBl7Qtd+VfpJh9LBNJ
         HXZBHaakiRojDQMlDwmDxwqFzGyn5/4IdZKihfypYjTTs63kUZWxAGQtxOSq8MgWRU/t
         uPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCPLSRzUXQbjlFnRzNKKqjCLNtpc7ieGcBzd48Gb76w=;
        b=VCtdaDNGrt/+jrg0PcTfpYnktWgTLTTO4YKDdaeqzb/DJLVL1PNv5U8Cehm4o+c1Mv
         //csL9iNrTxqxcstgi9grCcd7jUBFrbNnaPxibplu5oXHs2V9ysXmOzXKTdiwlGUQEkU
         7eFxzn6f4/o/P2illwTrLSay/Aj6ZWkOUjDf+zfo6j95Rn76xsWitRhHYSfeoly189Qm
         vxHHp7sxMvdmqDGtylhETyWsIZMB4jAfgw8S3tUJpv2DGlgw2hykhvrsun7aW3iSGKXE
         QmInBwLBbAC9gPvIOCttPw1KDhv86AcL/55gr+ZCfCrIOUTJuisjaaXd0bh23vZO/a9y
         Q/Jw==
X-Gm-Message-State: AO0yUKU7/Qk9Bj8YIbJHKQ6Af+fCbk2znyGqOEuKCYUBx2VxDoldk+Qv
	vLwC+BPKC4udCTbKyW8Tifzu9CIdQ10=
X-Google-Smtp-Source: AK7set+U14wrD6Ap1lad6EVJBTJXnEdfFV5kP7qrWMf6wQhZaMdydVfue60wPwI1XeNtgIFp8aY/q1HqCcY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a0d:d5c6:0:b0:500:e6a3:a141 with SMTP id
 x189-20020a0dd5c6000000b00500e6a3a141mr575676ywd.470.1676524709201; Wed, 15
 Feb 2023 21:18:29 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:29 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-15-surenb@google.com>
Subject: [PATCH v3 14/35] mm/mmap: move VMA locking before vma_adjust_trans_huge
 call
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

vma_adjust_trans_huge() modifies the VMA and such modifications should
be done after VMA is marked as being written. Therefore move VMA flag
modifications before vma_adjust_trans_huge() so that VMA is marked
before all these modifications.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 06c0f6686de8..c5f2ddf17b87 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2910,11 +2910,12 @@ static int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
 		if (vma_iter_prealloc(vmi))
 			goto unacct_fail;
 
+		/* Set flags first to implicitly lock the VMA before updates */
+		vm_flags_set(vma, VM_SOFTDIRTY);
 		vma_adjust_trans_huge(vma, vma->vm_start, addr + len, 0);
 		init_vma_prep(&vp, vma);
 		vma_prepare(&vp);
 		vma->vm_end = addr + len;
-		vm_flags_set(vma, VM_SOFTDIRTY);
 		vma_iter_store(vmi, vma);
 
 		vma_complete(&vp, vmi, mm);
-- 
2.39.1

