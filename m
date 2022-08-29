Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC715A56B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:06:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGkzC42yrz3fRM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:05:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=P37RAGhP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=33c4nywykdi09b8v4sx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=P37RAGhP;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk4t04YVz3bVt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:25:49 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id u14-20020a17090341ce00b00172f000e493so6758528ple.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=knlkft8CSs4ctk+Wf5EGoFcT9IapAOL4+B6Ai/+T1Ew=;
        b=P37RAGhPa0fj1eu5oWQ75AvAaLtugohQsYRWKzKsYPy82nTGbYS2huH/UiZNVvoE/s
         88nyZ5hMCHsleX96EzwxSRzBq/7CUKc/bHbJ31Ts1GLCvmDOU9CmcQD2WQXDTk1c+h7j
         3oIUBNbln4Bxomo0AKLbatKVQNVrzgPz+A4aQoGdDS5LbHfkkFmAcE6pV6uk/ymeBjbJ
         1nc4oAeG1urj8/jUSameTDeH8ziLxBTZVHP9LQuagPlJAxjluMekWoC6NIdC1YJBWEbt
         nn2+QyaYYhDKNwmBnD8p146GgfwAnKteHIAkGMz5qwPGMxUQt1Cd0qMSAU4DAqNB0mVB
         aVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=knlkft8CSs4ctk+Wf5EGoFcT9IapAOL4+B6Ai/+T1Ew=;
        b=gRik1HX9TM7fyyUQ5Z12Ne9jMlxIiTtp8gkb8iq8VU0ZosWoahP0SjY/FC6q6EPrxk
         Eyw81QcES3XybhtoOXdhXW9qkdCoPWaSEGb06UQ4OeT0XheTMaCkF7a58EsTAqR+xL1S
         CIndrYzSnviURJgzxr6NM9UFi2rZsMLdWxawHxqhIs0m5yvvJIfeOtZqEqduGGJwh6dH
         ewM2HX4DxWkOMT0SwufjgCxdYePx6/TOf8Q6MSy4MPkW76/wbw0vdCScLXlo+hDpuXf8
         sALy6PQOjH6Zo41KblKDVgjPzCL0BdyArnlJA0MOprCtjRPqlfRuSKZvTPxKDecmdbyF
         WoNQ==
X-Gm-Message-State: ACgBeo01hLkXHXCmE0B8T3+YUo1xKii+5SamRY0F6cz3OxhZg9tF5x/s
	3HGcy0qB54f00Y37B+GOO/w5GcEaNJU=
X-Google-Smtp-Source: AA6agR7ucJtBhSAnuB+PqV9qzppZFKeEkxBUzS6um9UDd2r/XYBs5DAVo1iLh4VL9E0CKz9mlSvmLd+h5RQ=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:aa7:8d08:0:b0:538:105a:eb6a with SMTP id
 j8-20020aa78d08000000b00538105aeb6amr10112054pfe.42.1661808348114; Mon, 29
 Aug 2022 14:25:48 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:10 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-8-surenb@google.com>
Subject: [RFC PATCH 07/28] kernel/fork: mark VMAs as locked before copying
 pages during fork
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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

Protect VMAs from concurrent page fault handler while performing
copy_page_range for VMAs having VM_WIPEONFORK flag set.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 kernel/fork.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index bfab31ecd11e..1872ad549fed 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -709,8 +709,10 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
 		rb_parent = &tmp->vm_rb;
 
 		mm->map_count++;
-		if (!(tmp->vm_flags & VM_WIPEONFORK))
+		if (!(tmp->vm_flags & VM_WIPEONFORK)) {
+			vma_mark_locked(mpnt);
 			retval = copy_page_range(tmp, mpnt);
+		}
 
 		if (tmp->vm_ops && tmp->vm_ops->open)
 			tmp->vm_ops->open(tmp);
-- 
2.37.2.672.g94769d06f0-goog

