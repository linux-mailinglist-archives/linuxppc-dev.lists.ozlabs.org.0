Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE89D5A9E45
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:41:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJSy26mt4z3fDY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:40:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LBJTSzoC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3bu0qywykdksdfcpymrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LBJTSzoC;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSqz0xFVz2ymS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:43 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-335ff2ef600so235534237b3.18
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=sXPRs4un8Hv1KgYmIkiOTpDZHlwje1UN18vDRt/znXA=;
        b=LBJTSzoCXGb4iiWKyO0OEdlY4M2wMr4mJ5fdr9ss+SWylmfoHLBZ3bDcjUEYCuu5eS
         feBNbsez+RUGQT+LSEIL3jhNfGQ3mzrdU70gDdYtaUSlqG4c3zRWe4jgoZRdVjvHQEvZ
         SPCTeif98/8TgsTaO2lykBXQO/Ydnr0/XtxYChsH6bMYMfoCTEgHM9QVPOJS0Mu1k2UR
         t6jxn7uXNz4Ix/YY107csqUZ1FzpL1YUPLT0wcSHa5tJ7jOlfkB6DfkgR6ONkj0xZI4Q
         CdDjSBazMRaOu6i4p9xpWVSdGu4/KGHF+Yxu3Dy4GMEd28lc2vp55tWuelmW724hNsiA
         vxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=sXPRs4un8Hv1KgYmIkiOTpDZHlwje1UN18vDRt/znXA=;
        b=Tozg3jKp2SO6gQYAZML4FUHaEOlHTHNJcmVpxsorK0k88bS4jA+oXFJilEE5qx5Thz
         M+hTzZd/DiPGVxsrirUlDo81IBEuSKwHRMcxCUTiGtzBIDwClKcS7bDHKFy5qVN+NhE8
         rm1StPLq51srnIcACFTh1Ik1JCyPymlEEXsn54zoTE23OhwrdfuOgfopXjr7LQgVPz5C
         Uw6uTNIPMyefFiav1gdP5pCaTrF+kb9XP3I9ya0GIqSFAqQNLFDQx/ddrF47nOApN8Q0
         QW+NjPo8pOV/z1351FOfsHYixmCuqhfmm5J+u5dApmvScmfjO6/tNBsugG+Sd/PWcPFF
         wiWw==
X-Gm-Message-State: ACgBeo32HvpYgjcBZMp/TOOiEsTuojclVnxaGL356NQRpI0i0kRaMTPs
	kcn1vznnNXbzLowjQ68zw7Nga+C9g6c=
X-Google-Smtp-Source: AA6agR4Ppy4TlAx5Lt/45OnUgJ5yxX2999apq2x6zNaCId6+AMBNoDmW6LxkNrA1Ax704mp9y4OtGqUy/dg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a05:6902:120f:b0:676:aaa4:8434 with SMTP id
 s15-20020a056902120f00b00676aaa48434mr20939193ybu.218.1662053742565; Thu, 01
 Sep 2022 10:35:42 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:56 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-9-surenb@google.com>
Subject: [RFC PATCH RESEND 08/28] mm/khugepaged: mark VMA as locked while
 collapsing a hugepage
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
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
2.37.2.789.g6183377224-goog

