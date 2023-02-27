Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B776A4914
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 19:01:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSxL2gcVz3fkn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 05:01:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ltU27wOg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3zer8ywykdfqegd09x2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ltU27wOg;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPg42BFz3cjC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:43 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-536c8bcae3bso154406857b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQTFxYC9vfA9jf0qnv7gyPX3j3jACtIk3rCkUF/FJDY=;
        b=ltU27wOgGhATSjAgpKpsKxT2cYCgBXmJjPP7Vlf66xgvCPyy9Y+Q9/fs6W0SzgF7Jz
         AXhDZAKO1i4O/EUJVs8bawuizzatT9I4VypR9NCPeHEKAKGbhmDhab1/2DAQYWqdJDRL
         SlVcHXqIAb6AFOFtWd+XMHyyClJx99DPXWU2Oc6Hu8D9kLp3zMzECqCZ3BlXkfECm7ag
         vCaq44G6you6yfY7K1dBcUrSymqL5XjWSs2bzGHgp5mJNuIzmcdPLIfUbaNclxIn5eWy
         D+XKgbxlwvwdAgDoeqhoNS8X6MSQFy0GYxkz6nxN9qX46TIoCwJZF4rSw2+QWBYvnyX8
         AYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQTFxYC9vfA9jf0qnv7gyPX3j3jACtIk3rCkUF/FJDY=;
        b=y8pfQPqdb4okfsMGZTAUi+3CMztJD3PmIYgvGN4r3/KfT/7FZgSH+v/qwbY27gfsaG
         PSa0ZUPl8sPwLW4q/w5XwXV8dibpl9YS1VFo73aN6uTOX5CGy+ANezLZeNJJRD0VHCMD
         J67w2EHJh5PObLEwk0fVgObGWn7HXIlxB1ullBmBlwuMpF5oYncAKfxKPyORWxL9K7hJ
         P//BP5OwMC1PYc0u1DrBBD5axEfUAC++Xe+ViBnQJ340oPhfTwZgFGaRrIPTraG354Jq
         RaVavr3pENNm2Rh491Xn9VunHN8a//MRKDDRWv9Enc11QmGUkowsYYCLW0mi6GurLeNo
         VMqg==
X-Gm-Message-State: AO0yUKX1ShBDTsQlQ+4lOk9DXOTcCvrIAux7dWoRrK6+scmseM0ZPRWW
	7eOlufsM4MvHO9r8uztZVr9ITaUZIMg=
X-Google-Smtp-Source: AK7set9z2RIB1+MnUTCI+d6tD2+X/XlUvgLJksvCvzE5szG4B6uXrDxC8Bbk9Da1F9i9cjnu9YsjeU4IwLs=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a0d:ca10:0:b0:52e:e6ed:3094 with SMTP id
 m16-20020a0dca10000000b0052ee6ed3094mr727498ywd.532.1677519461069; Mon, 27
 Feb 2023 09:37:41 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:26 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-28-surenb@google.com>
Subject: [PATCH v4 27/33] mm: prevent userfaults to be handled under per-vma lock
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

Due to the possibility of handle_userfault dropping mmap_lock, avoid fault
handling under VMA lock and retry holding mmap_lock. This can be handled
more gracefully in the future.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Suggested-by: Peter Xu <peterx@redhat.com>
---
 mm/memory.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index af3c2c59cd11..f734f80d28ca 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5255,6 +5255,15 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma_start_read(vma))
 		goto inval;
 
+	/*
+	 * Due to the possibility of userfault handler dropping mmap_lock, avoid
+	 * it for now and fall back to page fault handling under mmap_lock.
+	 */
+	if (userfaultfd_armed(vma)) {
+		vma_end_read(vma);
+		goto inval;
+	}
+
 	/* Check since vm_start/vm_end might change before we lock the VMA */
 	if (unlikely(address < vma->vm_start || address >= vma->vm_end)) {
 		vma_end_read(vma);
-- 
2.39.2.722.g9855ee24e9-goog

