Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7395E5A56D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:11:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl5g2Wg2z3g5Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:11:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sfdQ+2Ny;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=37i4nywykdj8rtqdmafnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sfdQ+2Ny;
	dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk5D3yfrz3bry
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:08 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id 125-20020a621483000000b0053814ac4b8bso1876133pfu.16
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=+ZeFgC+onLi5H2Gk/r+wfB2lUIAEpTgiMaISz2j8Yh8=;
        b=sfdQ+2NyYwxA7WE4W+U26tjnRsGpTwH+W4yCMsULIhDPYOMjHM3COZzPg/S6KTqrLL
         mCgPnd6W8rrgwvL37XiGeYHG8ArgrFQG0UGf2gLsolv/ME8hJmTyRg7Fg1LBPlsPaNI3
         te4whtYEHF8c2GeRvQHa/rDrJjk62KSTUlVEPYqGvjKgQGKn8f4Dp8C4KiASRefP1Qh1
         bQmVBjd8KI32N8+vGT1M5VRcf57cOjajmNaLyJUUpin1ccvlQLSGjkUAJOTaDxWOJrJ5
         Pk3cN7LOZgsgUwKnowGjucplCuekHbu//K343iXFhb3F2AjszKhuURdvTUr7Fsy7vLjJ
         fKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=+ZeFgC+onLi5H2Gk/r+wfB2lUIAEpTgiMaISz2j8Yh8=;
        b=qsx77Yn+j6cAtA3AJ8dHaV2aNpb7azdAqp5Sx5ruA9J6vUYW3+BMpzaq5kbqcXOtpV
         7OsoonLBPZ69AjoR53kYIuPV9rGv13/9p8rRHeBuIikDtSNVJKYh3yyznd8MwHAYVwpM
         zunIARRlNia1nBqrIdiFOwooh7wcmPbqHPwt21jC4JYaf1sxgShfAGuQJr91NwOBqUP8
         KjNcKXb39j6pFW8hzrnERXCqVN7W8InuqrCcx6CB1TUQ6D3XKJRU0IvpOo2hwfaW5W9Q
         XeXUFKPmMQMH43YcPArRieoD6WAnqnU16A+V7B+lTEqphL0d243+m/L06M71heeeQzpV
         QhDw==
X-Gm-Message-State: ACgBeo0iFpMi0/hvJX1FbBY3c00OaAM1l07WBqQf6ANZr666lgb4EwOd
	N8RoghWqV8Pqrdm41BOGaWn/chN/SWQ=
X-Google-Smtp-Source: AA6agR60gqv1XJF9S7yhKpnItHkmCdUjQh3CpTVXyWE3xiDHKhNiTBjmbY9F8YGX1B9vpUO9txTmTcIisVc=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:902:6b88:b0:173:c1:691b with SMTP id
 p8-20020a1709026b8800b0017300c1691bmr18372367plk.18.1661808366708; Mon, 29
 Aug 2022 14:26:06 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:20 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-18-surenb@google.com>
Subject: [RFC PATCH 17/28] mm/mmap: prevent pagefault handler from racing with
 mmu_notifier registration
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

Pagefault handlers might need to fire MMU notifications while a new
notifier is being registered. Modify mm_take_all_locks to mark all VMAs
as locked and prevent this race with fault handlers that would hold VMA
locks.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index b31cc97c2803..1edfcd384f5e 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3538,6 +3538,7 @@ static void vm_lock_mapping(struct mm_struct *mm, struct address_space *mapping)
  *     hugetlb mapping);
  *   - all i_mmap_rwsem locks;
  *   - all anon_vma->rwseml
+ *   - all vmas marked locked
  *
  * We can take all locks within these types randomly because the VM code
  * doesn't nest them and we protected from parallel mm_take_all_locks() by
@@ -3579,6 +3580,7 @@ int mm_take_all_locks(struct mm_struct *mm)
 		if (vma->anon_vma)
 			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
 				vm_lock_anon_vma(mm, avc->anon_vma);
+		vma_mark_locked(vma);
 	}
 
 	return 0;
@@ -3636,6 +3638,7 @@ void mm_drop_all_locks(struct mm_struct *mm)
 	mmap_assert_write_locked(mm);
 	BUG_ON(!mutex_is_locked(&mm_all_locks_mutex));
 
+	vma_mark_unlocked_all(mm);
 	for (vma = mm->mmap; vma; vma = vma->vm_next) {
 		if (vma->anon_vma)
 			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
-- 
2.37.2.672.g94769d06f0-goog

