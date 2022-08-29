Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CD55A56B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:06:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGkzs3QCFz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:06:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=I4AROHhc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=33s4nywykdi4ac9w5ty66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=I4AROHhc;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk4v3yd0z3bVt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:25:51 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id c18-20020a170902d49200b001750f4fb8beso514492plg.15
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=ooNZAin4dExMhxnzVFEqRWXW+87JR2sLE0fevcXKZcM=;
        b=I4AROHhc91xv1qcH3nCi9ZpRLfIZ0YYOknUuCx0UCVegrJDEOhp2xXx6sXe9aCLn1C
         FzO21jqONtvqpljlp8Pb4Y+CdSx9zRBCbsYcOU1CMA6tT/zAnvmRorbY0bmK2T02uMkI
         Atv+IFZLAVnvs+tVzbF09RqlClFEsd0HUKtTSkQ+YRbpf3d4jB4ZfuXvxVp5TLyaLLyx
         AxdLnxV0cUJcHwzUd+Lxky4P92oXj4Xhl4or9fJrlsG5GoIvzarsCtdrQ2b29IJKR80y
         NIBWQdZUPTZNVXZAtYrsTzYsNpAhtyZg3hqM9pNuOBs9nY5UdbnMfXBZJ7yLdA5TAp1d
         MxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=ooNZAin4dExMhxnzVFEqRWXW+87JR2sLE0fevcXKZcM=;
        b=hheWXE0Mkz2ougoUnIOrQ7fkbhvz3hOhoSM1F97j1nnp8vR9o6eXhaY77dGIVwb3yd
         Oum5JRKjD6dPE3iZ5INJFGBSzxBP+BA4tNzXcfcPIpng9tbvgltE/TVOhyk6Vs3rkDnh
         6mc8+CiVcwerQapxVrQhbHi4osiTuJOwj67PfVTtCL61Rs8YfNcYi/QDjEdFHke/SyvM
         I+Fvq5gno70kxrNDT8SC+TLuI+/BhfAtS90dngFK8yeJataTS4vDKCX1uOxfbGHK9Q1H
         3dtKLZhagyfGGamE2edD64gP5postF+eFbnKgCias1WCcpaTg0wd7GRANMQ4YKqHWtmb
         zRuQ==
X-Gm-Message-State: ACgBeo1epYn4MJRjIP7L1vLbdB6cL3q/Fk5NSC51o5vfWTwLAKhw2ON0
	+8osKM/Les/CJRJvv4WSHpOUAszdkoM=
X-Google-Smtp-Source: AA6agR6Ch+8H2P4ZiI/nyVX9BprKXIg4wSUP+mENwsodRVHrGORNiLr4bLOGgyZYxzbEnnQphTeE0ezRPcY=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:90a:4607:b0:1fa:f794:2c0d with SMTP id
 w7-20020a17090a460700b001faf7942c0dmr20939608pjg.24.1661808349897; Mon, 29
 Aug 2022 14:25:49 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:11 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-9-surenb@google.com>
Subject: [RFC PATCH 08/28] mm/khugepaged: mark VMA as locked while collapsing
 a hugepage
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

Protect VMA from concurrent page fault handler while modifying it in
collapse_huge_page.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/khugepaged.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 01f71786d530..030680633989 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1072,6 +1072,7 @@ static void collapse_huge_page(struct mm_struct *mm,
 	if (mm_find_pmd(mm, address) != pmd)
 		goto out_up_write;
 
+	vma_mark_locked(vma);
 	anon_vma_lock_write(vma->anon_vma);
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, NULL, mm,
-- 
2.37.2.672.g94769d06f0-goog

