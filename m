Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2519174BFE8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 01:05:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=mgCi5qSa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz5TM0CX8z3c5h
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 09:05:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=mgCi5qSa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz5Ry2q5Mz3byy
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 09:04:14 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5776312eaddso39205697b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 16:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688857451; x=1691449451;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O+qLESJCRFN7dcIsyw3NJtjwIsXtHYZLjT5v4tk5DvU=;
        b=mgCi5qSaZ0QN848AO4FEdlrrUOrB86sH23LbXPcpsn4qyESlzAQawFfOF04UBU4Kgv
         9/lqmDRKXg+cqWxZ2Jzz8dSkhhwyJvxS413AvX/bJBFnXjkhbSF26g90mSr+UkOXy8qt
         Lg0ffkvvfGuyQCAHGQNyalDtsOWJwlyjwicSAZnEWb8DRbiUVaPqcJE1hmf3pb5JbHCV
         F+aCGx7iX12vcDpSmC0d09+31EprSu+CfzDgy+pt2tM4zg6JDFCADKQwoJX7LmkAFVnW
         HfnY7DNlbwjqy3xmZ1ahFCq1H6iUoXJC9PL/ZtQyNPupEGpCxTeiUlFqcf0amr0w6t44
         ARKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688857451; x=1691449451;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+qLESJCRFN7dcIsyw3NJtjwIsXtHYZLjT5v4tk5DvU=;
        b=IhPyZQKGrRjXvatXXpHxJT/msZJra42/HggbksyPe1OdYtAQqMwJfjQy5+zEt4mKkz
         NhDcYqgrXkdkx/uegomoddxTp95E9eVEYxkxLz9fPy4qhRIc9HiPhXnb49e4sBh/xi9H
         MXOwcu9t75WRWYLFctJB+4IfmMpVHwpS3TjX/bwNozpkmMwLHESf02xDmF008nsEQm7T
         wyTpSnkaSbdPIjBEtlSCYWMIzwHuisfA3cUchi8QJZStXNgyS0i8oKgHYZYycjfZcWRM
         7hqE9qUF5HVSyH/lsASZEAPoxRVc7igxd4F5u1spif964Yl50Q8je8MfOtz/24sGzrYk
         x1Yg==
X-Gm-Message-State: ABy/qLbFfCXaYcl74dcAeCJ4y+inwpPxvabiZuV5ug50QDkLPxD77wdA
	Zgbmq/SY0vtJLw4nXZGQExk7LQ==
X-Google-Smtp-Source: APBJJlHxsUrb2PsB8Vr/SdiFDl5l/hnimxuzYl85A5so5Ag/YE5k+SY0YoZnZodNyJi7fr5g0LxUxA==
X-Received: by 2002:a81:4e87:0:b0:573:527b:747b with SMTP id c129-20020a814e87000000b00573527b747bmr8684830ywb.36.1688857450765;
        Sat, 08 Jul 2023 16:04:10 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d205-20020a8168d6000000b0056cd3e598d8sm2108255ywc.114.2023.07.08.16.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 16:04:10 -0700 (PDT)
Date: Sat, 8 Jul 2023 16:04:00 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] mm: lock newly mapped VMA with corrected ordering
Message-ID: <b5a5626-2684-899d-874b-801e7974b17@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, david@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, gregkh@linuxfoundation.org, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lockdep is certainly right to complain about
(&vma->vm_lock->lock){++++}-{3:3}, at: vma_start_write+0x2d/0x3f
               but task is already holding lock:
(&mapping->i_mmap_rwsem){+.+.}-{3:3}, at: mmap_region+0x4dc/0x6db
Invert those to the usual ordering.

Fixes: 33313a747e81 ("mm: lock newly mapped VMA which can be modified after it becomes visible")
Cc: stable@vger.kernel.org
Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/mmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 84c71431a527..3eda23c9ebe7 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2809,11 +2809,11 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	if (vma_iter_prealloc(&vmi))
 		goto close_and_free_vma;
 
+	/* Lock the VMA since it is modified after insertion into VMA tree */
+	vma_start_write(vma);
 	if (vma->vm_file)
 		i_mmap_lock_write(vma->vm_file->f_mapping);
 
-	/* Lock the VMA since it is modified after insertion into VMA tree */
-	vma_start_write(vma);
 	vma_iter_store(&vmi, vma);
 	mm->map_count++;
 	if (vma->vm_file) {
-- 
2.35.3
