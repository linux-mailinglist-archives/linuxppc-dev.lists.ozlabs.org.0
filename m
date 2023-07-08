Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2E74BEE6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 21:14:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1k2h2Lzi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz0M93QnKz30Nn
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 05:14:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1k2h2Lzi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3fbwpzaykdficeby7v08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz0JS3Zhvz300q
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 05:12:24 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-57704aa6c69so32639547b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 12:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688843541; x=1691435541;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTV0xihdJDZ3LmT5b0VvbfWVPo2l/pYZxiWhaA2z/Wc=;
        b=1k2h2Lzi2Y7Zso2QCXABxD6tKxYBi69Od4eg/BJzd/oZKr/yo1QC9zYTy+F7bkwUsr
         MJ4Cs8yuMwfbeH9sKlCNAwVo49wzFYe05nOmOIFdL12CZV8/kFSu5wJrvCOBni6b6XLW
         llu6z1SxXl9jUD2la6uHivLOfnp3yDTzL+wbIb/uZmz+uMYQ0KGYXgadTEUmWm9Uz2p8
         OvPqWDoLPuHzUoISVlQIJ3HwqRiXh8i6S85Nr9mydxCOVHJ3byBf5nAejApz8KtI+7VG
         nVka+9EAa6kAPb4o2CIYQlx+qV3ecK270Nq5eVaYu0hTPSFmvNlGf9LGupgmu1sf8Ore
         83wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688843541; x=1691435541;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oTV0xihdJDZ3LmT5b0VvbfWVPo2l/pYZxiWhaA2z/Wc=;
        b=hRwGrrv4By9CqZsKwipqO8WXpK/JPa++jZMiCfJFnoAmQFmC4eYvBvdQ/qO/+UJoj9
         DjJlCFd5j3yuMrk6PWMvjmqJTWpg4Fasl7wXU5NTydkjiTpKqHPxllJyReijqg2j651T
         r+6Q4GHURPbwz2L0yTf606zMJkR3GB7MabO1wTT9WIoY+tTqW1MYgkYEGq4KVnnYGSvd
         ShbGgSLFQi5XeQz55nhLH7QwhHpg7raS58S4IKNUAe0MDD3SLPtVVhtz2ykpR1KT1fKF
         f7sF9nPgWULF9CYYGH3NI4prRK7YiQ7+itvv6LU63RAUysj26mhEJjA0xKXJksLVuo0k
         O32g==
X-Gm-Message-State: ABy/qLahbBm4+SAILbIbw2ubxANx/3iC4yBIH4bNxSg9rzhAPq5DODSs
	1oL/7nPyxOiow6ocZNrIAWkKsQt7T9E=
X-Google-Smtp-Source: APBJJlHVrRFpZyyO6dwy1Gjn4/30Rl1D+ek+P+dzMKAoVpdfL0WWnvznDWyGgdeVaC3RV2FWAanbuAUiF7I=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:6f0:5193:79db:25b3])
 (user=surenb job=sendgmr) by 2002:a81:ac20:0:b0:565:b269:5ef7 with SMTP id
 k32-20020a81ac20000000b00565b2695ef7mr58334ywh.1.1688843541040; Sat, 08 Jul
 2023 12:12:21 -0700 (PDT)
Date: Sat,  8 Jul 2023 12:12:12 -0700
In-Reply-To: <20230708191212.4147700-1-surenb@google.com>
Mime-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com>
X-Mailer: git-send-email 2.41.0.390.g38632f3daf-goog
Message-ID: <20230708191212.4147700-3-surenb@google.com>
Subject: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
From: Suren Baghdasaryan <surenb@google.com>
To: torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, liam.howlett@oracle.com, Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, willy@infradead.org, bagasdotme@gmail.com, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Holger=20Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When forking a child process, parent write-protects an anonymous page
and COW-shares it with the child being forked using copy_present_pte().
Parent's TLB is flushed right before we drop the parent's mmap_lock in
dup_mmap(). If we get a write-fault before that TLB flush in the parent,
and we end up replacing that anonymous page in the parent process in
do_wp_page() (because, COW-shared with the child), this might lead to
some stale writable TLB entries targeting the wrong (old) page.
Similar issue happened in the past with userfaultfd (see flush_tlb_page()
call inside do_wp_page()).
Lock VMAs of the parent process when forking a child, which prevents
concurrent page faults during fork operation and avoids this issue.
This fix can potentially regress some fork-heavy workloads. Kernel build
time did not show noticeable regression on a 56-core machine while a
stress test mapping 10000 VMAs and forking 5000 times in a tight loop
shows ~5% regression. If such fork time regression is unacceptable,
disabling CONFIG_PER_VMA_LOCK should restore its performance. Further
optimizations are possible if this regression proves to be problematic.

Suggested-by: David Hildenbrand <david@redhat.com>
Reported-by: Jiri Slaby <jirislaby@kernel.org>
Closes: https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@ke=
rnel.org/
Reported-by: Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com>
Closes: https://lore.kernel.org/all/b198d649-f4bf-b971-31d0-e8433ec2a34c@ap=
plied-asynchrony.com/
Reported-by: Jacob Young <jacobly.alt@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217624
Fixes: 0bff0aaea03e ("x86/mm: try VMA lock-based page fault handling first"=
)
Cc: stable@vger.kernel.org
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 kernel/fork.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index b85814e614a5..d2e12b6d2b18 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -686,6 +686,7 @@ static __latent_entropy int dup_mmap(struct mm_struct *=
mm,
 	for_each_vma(old_vmi, mpnt) {
 		struct file *file;
=20
+		vma_start_write(mpnt);
 		if (mpnt->vm_flags & VM_DONTCOPY) {
 			vm_stat_account(mm, mpnt->vm_flags, -vma_pages(mpnt));
 			continue;
--=20
2.41.0.390.g38632f3daf-goog

