Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3897466324E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:10:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRRS08Pqz3fcD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:10:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oTTbEHXX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3ah-8ywykdbudfcz8w19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oTTbEHXX;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5H0m3hz3cHK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:26 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id u2-20020a17090341c200b00192bc565119so7006980ple.16
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hDqG76VNjmKFCkYaVQCHk1jK9PV7CZBX+MdyRpSUw7Y=;
        b=oTTbEHXXf074UTT/LXfKIzTlYAOVSZBWjz/z2pi8uw2sgTsKOn0pf4M+FUmb3fhKEp
         t8utYb+BYUrtOmcMbBRfjQmj3HjZCnvt7nX8XXsh4x467hUw4mc17N9vBA4v3IH0gXYu
         Tf0NgJ8TRnq+dnC575YF2XUlugz8igLSTMm592zbLFSlzWIJOjCEMLUlmrt7z2QrvV2T
         gekww8A2UJVHgfp1zwqjj/KBiOxEMFrYzziSkpJrGHAD1djB4N2zU8kmwkE7PnEOrNUu
         hxvDlopUQbh5t04B3B6cW3kLOVcLSOY+TAkcMQBqHoc5+w1BV2sS39QIbB6FPKvgrwld
         s2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDqG76VNjmKFCkYaVQCHk1jK9PV7CZBX+MdyRpSUw7Y=;
        b=5JP6QlpZAE0m0jKS0NJB936ycUSvjGSw/erMqy9+NvdBuwE4gFxZme5iqxHrXKs8uH
         r7f9xXn5UGP1JWvL/txfn3IJKUBO/hmmH198KK3XaDjPjubxNs+hLV5uuvHsz55hbBpc
         hAHxIMOZPPMZ+WLfsiFpQURN6mK0ZoTOVkpUe5A62g4JSzjALoVu2id4Ab69/6Cy/q1q
         i2fOe48BqhVBMqb9ltk7fESxwNirKH0Vdsz6UgQ5nacFVnoUx0ECCVOYO15eMgHEKQg6
         9M23+RzuCY/H0WjV7xC7QlB8M1Z+Xie6NVqRwP/rx4uy/ge1lGpPINuEcvu0fdmB93aX
         LS7g==
X-Gm-Message-State: AFqh2kqigglTUFcS9GdvEU830unP3geGaWgawOLfe1V+VMEdsLYCYyQl
	o+em3nHEArqX7AIKYCiiKW6k63w2Oqk=
X-Google-Smtp-Source: AMrXdXvx+5mjUKCd2siyFSRbOdBiHgQPNh6ZnBtsj8lXWONeXJTph7ewao1odYnxoExvO1xzjoIbjT4zuzo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a17:90a:638b:b0:221:52e3:1f56 with SMTP id
 f11-20020a17090a638b00b0022152e31f56mr5166916pjj.225.1673297664681; Mon, 09
 Jan 2023 12:54:24 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:12 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-18-surenb@google.com>
Subject: [PATCH 17/41] mm/mmap: move VMA locking before anon_vma_lock_write call
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

Move VMA flag modification (which now implies VMA locking) before
anon_vma_lock_write to match the locking order of page fault handler.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index fa994ae903d9..53d885e70a54 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2953,13 +2953,13 @@ static int do_brk_flags(struct ma_state *mas, struct vm_area_struct *vma,
 		if (mas_preallocate(mas, vma, GFP_KERNEL))
 			goto unacct_fail;
 
+		set_vm_flags(vma, VM_SOFTDIRTY);
 		vma_adjust_trans_huge(vma, vma->vm_start, addr + len, 0);
 		if (vma->anon_vma) {
 			anon_vma_lock_write(vma->anon_vma);
 			anon_vma_interval_tree_pre_update_vma(vma);
 		}
 		vma->vm_end = addr + len;
-		set_vm_flags(vma, VM_SOFTDIRTY);
 		mas_store_prealloc(mas, vma);
 
 		if (vma->anon_vma) {
-- 
2.39.0

