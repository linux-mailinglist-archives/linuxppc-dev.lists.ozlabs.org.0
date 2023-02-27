Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AF36A4902
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:59:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSvB65CQz3fr2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:59:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ehrse2Vd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3xer8ywykdew685s1pu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ehrse2Vd;
	dkim-atps=neutral
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPX60LKz3chD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:36 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id p5-20020a056a0026c500b005cbeecd5c0dso3713640pfw.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrP8wdv0q5g6TZoHkkTnkJI1bRVcCya3euyXWiQCR7k=;
        b=ehrse2VdjDnpUSRaJ3cu0jOOkJfFGFsUNPVo557shDqmppFkfxAsvzUOYaJjQ0PijB
         EblMOtm5g5NRXaAPcMrHVwQAv8s/x+GnRlxruVHPkK5jtQN3yNt/EBweE+tKCGKaism7
         U3HUjXQbto1B7qoo3unz00bS4zA1LfeWfOlzZkorv9RHy9hKyHRYaEA4i2TEzaJJuMBg
         IRIyIDCAlrqJadscsfwaMyXl67M96LYiFdG5WP3t9rIaF13TbFMOYIsSXYvDmmcAe7mT
         R89y28xjRtFN9b/E58zHscfzaCRWqNFydygKz6NtUn93MmZ0Jv953fv4FHoISujugl1t
         udmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrP8wdv0q5g6TZoHkkTnkJI1bRVcCya3euyXWiQCR7k=;
        b=nqvtbkb+3r5sqzd5jE790EhGq8rIG6ETtPvKo0FWX0ssUlRP/bQ+2Cajkx9egj9ZZZ
         cUXkz6jqFWtHlW7p1pyCAqwjJW0qsZy37TVY7yIyR4QUybttplWFHLrPWv9//hW3/biL
         WKIs6XwluHyvSp4oDl+Pfqb+wUX0DJBoY5HLUlrr4ltJE/B9yBsPhQ6E8mseatqB57nU
         VQ/uNRFE5eFXJICWqET4tX3J0LD9AMS0m2lDgmIOrXhmwnYOD4Zt/xm0tZnv/vW2G03R
         YupMLn/mSzW7n07gHQzj4RhNsjcdngm0TC7cC3UjuSIaJn9D5Eb06N9AeBgwSGLLr0Wi
         3yWw==
X-Gm-Message-State: AO0yUKXHlMyFKkYjHd6qyfZC1w2L1zAHM1s08IfIpcWEKW7+9DMrN57g
	7gWGbGnAY2Iuaw6eCz3uGJWLfFX0t5I=
X-Google-Smtp-Source: AK7set/aNutcI5JPOH6nKZSnuzXLxYVujD/4TtRCmI167JUO0duhDMkhOBXuPDJivfwxfw4Ct9inq/o370Q=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a17:902:ab58:b0:19b:e4c:2039 with SMTP id
 ij24-20020a170902ab5800b0019b0e4c2039mr6578302plb.4.1677519453804; Mon, 27
 Feb 2023 09:37:33 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:23 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-25-surenb@google.com>
Subject: [PATCH v4 24/33] mm: fall back to mmap_lock if vma->anon_vma is not
 yet set
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

When vma->anon_vma is not set, page fault handler will set it by either
reusing anon_vma of an adjacent VMA if VMAs are compatible or by
allocating a new one. find_mergeable_anon_vma() walks VMA tree to find
a compatible adjacent VMA and that requires not only the faulting VMA
to be stable but also the tree structure and other VMAs inside that tree.
Therefore locking just the faulting VMA is not enough for this search.
Fall back to taking mmap_lock when vma->anon_vma is not set. This
situation happens only on the first page fault and should not affect
overall performance.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/memory.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index bda4c1a991f0..8855846a361b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5243,6 +5243,10 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma_is_anonymous(vma))
 		goto inval;
 
+	/* find_mergeable_anon_vma uses adjacent vmas which are not locked */
+	if (!vma->anon_vma)
+		goto inval;
+
 	if (!vma_start_read(vma))
 		goto inval;
 
-- 
2.39.2.722.g9855ee24e9-goog

