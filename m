Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC2663259
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:11:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRSS3wvSz3fMw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:11:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EbLgVpiN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3a3-8ywykdbggif2bz4cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EbLgVpiN;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5K4vbmz2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:29 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id k204-20020a256fd5000000b007b8b040bc50so8774191ybc.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mttq8CcSxh6pk/PDvvqo/9XfYX/awSV+YKJHUec4DWQ=;
        b=EbLgVpiNWauCxYsPhZzluNh8i7Jc9od95XU7q4baD/bZuTFbACugKjaBqwn3ZlwjPK
         DyA2dJROokooe1X9hWF9cqxx7R8dzaLC4TQ2VgG1K6ZzCrV6Cn+bNgWtTm8qKV2EPlQI
         C3EgQy0lx8995KoeqPGehRxKjsY9DJj6pO/ydpCP34y4VCDsA5lFDA9xaQObsm54nagL
         gf/rqX49ePSI64VKn0w7yUB28hwRSupVRZyvn8G3inMqKMvhkMvaFS5iHqspfhqeeQGW
         sJQNxcx4h1OW/3tP5B8wZxgrbXFTXvC0zscvDZLigjE3sBlwiKuCEIrG4zHiBAmIFXhN
         sp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mttq8CcSxh6pk/PDvvqo/9XfYX/awSV+YKJHUec4DWQ=;
        b=HuHbx8TNAFw14zeJU5bIl/mXfjf7BbezdQveAx6/Ov7roZVjD5i3YDLzTrshgf4rKC
         8Ei/JJhwnWv9QU31qRY1pa7vuTK8R+haNPVWCA9rH5ryeshq9FtRfX/maoc6n9UiJ3y6
         LCt+H0DQjdmhXRIPYc0cbuj8XIhxnLMHsyeklcpf/Sp/fKC5/DBMyb7Sm8pu2c9xr4rZ
         ugqh9O4YJo5Uu53mb+dZZXUTJeKhL4BhLjzBx+u/Ed7WOSYvL3ZGhjEpyEtusrdiQBEL
         W/G1K3DqNlV0+rHwHkB+uiBUMbcBMrOY7FkO9SLC3q935FqmDGxWjw6PUy23RT1Z/3rv
         YE4g==
X-Gm-Message-State: AFqh2koIRvebuKfiWru+GGuiXApe8Kcqvmj9/QQe7+brUriIGLbAAVuk
	2Syh77gFJnN9TedQrFJJL4c2uEvDGt8=
X-Google-Smtp-Source: AMrXdXsB8fbMiTP1DYP5J5XEU88bTBTK0YYISNp2DJzOoqciXF/+cmYxWMxqmdOzbjRBqH/+xJjk8vQehVo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:850e:0:b0:6f8:42d8:2507 with SMTP id
 w14-20020a25850e000000b006f842d82507mr8097864ybk.110.1673297667509; Mon, 09
 Jan 2023 12:54:27 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:13 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-19-surenb@google.com>
Subject: [PATCH 18/41] mm/khugepaged: write-lock VMA while collapsing a huge page
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Protect VMA from concurrent page fault handler while collapsing a huge
page. Page fault handler needs a stable PMD to use PTL and relies on
per-VMA lock to prevent concurrent PMD changes. pmdp_collapse_flush(),
set_huge_pmd() and collapse_and_free_pmd() can modify a PMD, which will
not be detected by a page fault handler without proper locking.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/khugepaged.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 5376246a3052..d8d0647f0c2c 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1032,6 +1032,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	if (result != SCAN_SUCCEED)
 		goto out_up_write;
 
+	vma_write_lock(vma);
 	anon_vma_lock_write(vma->anon_vma);
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, NULL, mm,
@@ -1503,6 +1504,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		goto drop_hpage;
 	}
 
+	/* Lock the vma before taking i_mmap and page table locks */
+	vma_write_lock(vma);
+
 	/*
 	 * We need to lock the mapping so that from here on, only GUP-fast and
 	 * hardware page walks can access the parts of the page tables that
@@ -1690,6 +1694,7 @@ static int retract_page_tables(struct address_space *mapping, pgoff_t pgoff,
 				result = SCAN_PTE_UFFD_WP;
 				goto unlock_next;
 			}
+			vma_write_lock(vma);
 			collapse_and_free_pmd(mm, vma, addr, pmd);
 			if (!cc->is_khugepaged && is_target)
 				result = set_huge_pmd(vma, addr, pmd, hpage);
-- 
2.39.0

