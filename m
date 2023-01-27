Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AB967EF02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:00:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3T2R5sH1z3fKW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:00:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kcxorgjD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3cinuywykdnefhe1ay3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kcxorgjD;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3SdS1FNkz3fHg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:42:04 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id o1-20020a252801000000b0080b8600bdc9so6361929ybo.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1VGgj1TmnjNrGwceq1Y9mwtgHdomU/ZJ3zMBBp7twvM=;
        b=kcxorgjDvieL4H0gsZ4o6ev4StdVYsVDA7GZVrIORQdjZKoFiGI1KoZQdzzvMshMrE
         snI0AzaYSvDLC9zEn2IBQumHO6CKLkrL/i3wJ9ueET6bm8oRn7QEPBX+BM7UODPO3hzZ
         U4MGRqXmViJMsS4HDNU6vnAmwplZNvnqe2D+qu3fGFBMwOJOM+QBc0aicDuQnfczJKX+
         vPW/+j1Kiez+csRZc1jn4fVsV2fgBwTNZpRX4guJZVX8gsy3dFik2ggDGPcziixMOIIZ
         ZlSkjqSVG2I0FEWcD7z9JqxBzo/zAlN1m8/Qkt+nlr6qzU3SYltCmGn1Rp59psmpvaAD
         Fzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1VGgj1TmnjNrGwceq1Y9mwtgHdomU/ZJ3zMBBp7twvM=;
        b=fq4lulSnMgtGxGYavwJCvIckstP3dGuoi69v6OOiwja3+jWY40870/SOQDEJL5tNqq
         7xBAnO7ESOzXQ/U7NjFFcXjZXaempv2kvOw6e3p9PBkxUs4rhxeiciGnx0m68Bd1E2IV
         3EcVO9RXMioLmid0y6OWNYNgfXsucVyrVrCTAG0+ztEyZJDFxrwne0xKmbBreET3/mSI
         8yGppEaD+FKx4NKLMpkivMhTi1k+dNoYNz1f8XNYY+CLBRt9+S2EanzxYINAhsksZICs
         Y8EFS9KQa9ZexzgQY8psuGQwLFnKKLBhtYyEt9zt3ntJJCKq4r4A7xOAy0/VMUQ9Ckcu
         PH6A==
X-Gm-Message-State: AO0yUKXjqxOFmsg3ROtzbvIq/GzIxP84Oihd4tj5gwCJRoIyLSRmuV8g
	frRqV+GD6gS9VwEX1+EXCsMDQRXdKdw=
X-Google-Smtp-Source: AK7set/jPsOwzlm+kUPz+CABbySieLCP3cL/8jypOFocWiEQOE8fcbH4Z91B+4ltIKP12TkxYenF+FhrAT0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a0d:cb8b:0:b0:50b:1b97:f19a with SMTP id
 n133-20020a0dcb8b000000b0050b1b97f19amr434148ywd.164.1674848522027; Fri, 27
 Jan 2023 11:42:02 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:57 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-21-surenb@google.com>
Subject: [PATCH v2 20/33] mm/mmap: write-lock adjacent VMAs if they can grow
 into unmapped area
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

While unmapping VMAs, adjacent VMAs might be able to grow into the area
being unmapped. In such cases write-lock adjacent VMAs to prevent this
growth.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 57cb3a2ac9b1..3baf218836bb 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2399,11 +2399,13 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	 * down_read(mmap_lock) and collide with the VMA we are about to unmap.
 	 */
 	if (downgrade) {
-		if (next && (next->vm_flags & VM_GROWSDOWN))
+		if (next && (next->vm_flags & VM_GROWSDOWN)) {
+			vma_start_write(next);
 			downgrade = false;
-		else if (prev && (prev->vm_flags & VM_GROWSUP))
+		} else if (prev && (prev->vm_flags & VM_GROWSUP)) {
+			vma_start_write(prev);
 			downgrade = false;
-		else
+		} else
 			mmap_write_downgrade(mm);
 	}
 
-- 
2.39.1

