Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7005A56C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:08:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl1n0jlhz3fnL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:08:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OQFmY5p6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=34y4nywykdjqgif2bz4cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OQFmY5p6;
	dkim-atps=neutral
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk532Bp1z3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:25:59 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id i3-20020aa78b43000000b005320ac5b724so3587964pfd.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=iuFA+HN3YQAhGF4lKe/pszwBtaIFpTgsToRqXaNjG7k=;
        b=OQFmY5p6Pe2rtWh8HoOtibHP8P5GG7l2q0OSc7HNXnd2wSmQX9hqgXeo/WRhgSbde1
         3GOMVRznNWUQpWpM6oRymYxlQgfSmhokZzxHMaOud6hAHMI7hRSvRQgnpTP2D9VCRijV
         tvYOdRbm6MoDu4UgOmxt7sejA6CQywedGjOTRBl30ijbrDgQETYn5oZOqnGCtaAYcPZu
         MjsJRXAG04ApiH5Z6mU8Nc2C+hXCaIEB6zH7hUa5Up7nSwAgqcd3I/44d6H2f140ISuN
         zqINoaSTwBSBF/Nj+3hF7XpzbCbRiSR9QvteChaGaDG9beNmWGZas127F5+VFT8rM/v5
         R54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=iuFA+HN3YQAhGF4lKe/pszwBtaIFpTgsToRqXaNjG7k=;
        b=G2tI5O5gmZsFJINXBBdvy+RhoQzOHXcbeYF/lugiddTeW6N2mAKkqsYu+MyWZ2LAo2
         8LQehgxwHSll/wxOtasOZK99vQ0pVVXKxKSHtzDT8QOjy61KlLzBsmsO4r4r2Np7NoqK
         3fpquGZ0ajYJXw1+ZLuPyZ1ZVS7LoddFJNgKzQhu88zLUx41ZpIfCDp+ycgxFKDtKjqs
         r9a/DMMzPJzUUhuKdE7x46sSKuivTRIkvbyMvgHg2H74kFrJaCbOxbcVJJdOWhbrwPVk
         ET1UByhxuhqfs6vv23WE3/uYmj1Xq4eUxGw98p3GnowpkhfBnz8xX7hdSgw5HCuw7Gzu
         DxOA==
X-Gm-Message-State: ACgBeo3vCbKkriZ9kg6DVhnBF+p5CTHuU6HNLFs0d82RmY+3K1zGUrUI
	p3RFQUsjTT7JzC+3thxwB8CNh5k/TW0=
X-Google-Smtp-Source: AA6agR67llFT6eQ0+3Cyyc4Z2yCAV5KwAp4HusV+mlw9qyUeJ6m9H2aBfcEzix7gu6JpzsX42cg/TQ27QPw=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:90a:e558:b0:1fb:c4b7:1a24 with SMTP id
 ei24-20020a17090ae55800b001fbc4b71a24mr21023pjb.1.1661808355887; Mon, 29 Aug
 2022 14:25:55 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:14 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-12-surenb@google.com>
Subject: [RFC PATCH 11/28] mm/mmap: mark VMAs as locked before merging or
 splitting them
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

Decisions about whether VMAs can be merged or split must be made while
VMAs are protected from the changes which can affect that decision.
For example, merge_vma uses vma->anon_vma in its decision whether the
VMA can be merged. Meanwhile, page fault handler changes vma->anon_vma
during COW operation.
Mark all VMAs which might be affected by a merge or split operation as
locked before making decision how such operations should be performed.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index ed58cf0689b2..ade3909c89b4 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1147,10 +1147,17 @@ struct vm_area_struct *vma_merge(struct mm_struct *mm,
 	if (vm_flags & VM_SPECIAL)
 		return NULL;
 
+	if (prev)
+		vma_mark_locked(prev);
 	next = vma_next(mm, prev);
 	area = next;
-	if (area && area->vm_end == end)		/* cases 6, 7, 8 */
+	if (area)
+		vma_mark_locked(area);
+	if (area && area->vm_end == end) {		/* cases 6, 7, 8 */
 		next = next->vm_next;
+		if (next)
+			vma_mark_locked(next);
+	}
 
 	/* verify some invariant that must be enforced by the caller */
 	VM_WARN_ON(prev && addr <= prev->vm_start);
@@ -2687,6 +2694,7 @@ int __split_vma(struct mm_struct *mm, struct vm_area_struct *vma,
 	struct vm_area_struct *new;
 	int err;
 
+	vma_mark_locked(vma);
 	if (vma->vm_ops && vma->vm_ops->may_split) {
 		err = vma->vm_ops->may_split(vma, addr);
 		if (err)
-- 
2.37.2.672.g94769d06f0-goog

