Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF9C74BEE5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 21:13:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rDyzKJgv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz0LC6sPXz3c60
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 05:13:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rDyzKJgv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3erwpzaykde89b8v4sx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz0JQ3C2Qz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 05:12:22 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-573d70da2dcso35078067b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688843539; x=1691435539;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4rAZiN8CFc+wkQPvmF3sDwgaLYdtc/sQi/Gu45S9YQ=;
        b=rDyzKJgvSb4iVFr4MU6yl+skVCEaDOmrNnUTQxW2AR6lwndLcFZirFs7K8NVbOet/l
         Hz1ezj81fpfDhby24QFHC8W4yNrvRhOZmkRPzGk0HoDpmSzVRvUFh46uDhRrvrsHj0T+
         bWfsgAAuSrJUkxovFXIvpjT+3mNLViAPukrwkqTZEVh67uYSSdkV3/RB6xiSA1ML8ef8
         x4SI1Wv4IyWtXrra9hN2OOMwSs1hHi6cndf596Frps7d08xkQhXDxEudvyECcS4PhaDT
         YUU3z/ec3eCdOsvrUHORdE6FKycuZJ6n6CZZT2tr9aAc7ZTwuikUkUWUt+zO7jA28nYB
         wf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688843539; x=1691435539;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4rAZiN8CFc+wkQPvmF3sDwgaLYdtc/sQi/Gu45S9YQ=;
        b=TND4yqGuRB51+9EJpSpjMFRB1xxExtl1H5geWp7XFRd6eFLYZ5ffxfiZLd2VFeEWBE
         kIRkJapEoIKwW9NP8WWS7SbyTpnidRqr9lIv7o4nXW3BHaHligaCbelmpCeIdsxD777c
         tQRpZgiFSKHT54rsof31GuOUfSRPsOCy3PcBaIa7gb9UJcEiwpjCzLD7dJEeV/LCOb4+
         OINuoMBsBCSwzqP6/0HnE1R2JYvKZeX9m+L1fcqesaGxXEEEs2ckP9MS+fPxsNVxDPSU
         fbtwPNQw9kGwQkeG8obF1wAH1OhtQAchW4Kb4g8Zf0kJBAqS36GE7cF8RUrziEcUCLvx
         nzdA==
X-Gm-Message-State: ABy/qLaWXLlkKiXkUhFGa53LfKVOtrDx15kaIDv8ZLJzBWS+wpOCQRAB
	/8333WNH1uVbQXzTPDTYHy5IrJUr1Sw=
X-Google-Smtp-Source: APBJJlHlFE3mHfSxux3qV7DD1eHyTN3Bj7OluqfqRLk3Ndt0avHOdBy2KrtMLyVg6El02lkP8km17cLgxIM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:6f0:5193:79db:25b3])
 (user=surenb job=sendgmr) by 2002:a25:b05:0:b0:c24:7d1c:6145 with SMTP id
 5-20020a250b05000000b00c247d1c6145mr69068ybl.2.1688843538817; Sat, 08 Jul
 2023 12:12:18 -0700 (PDT)
Date: Sat,  8 Jul 2023 12:12:11 -0700
In-Reply-To: <20230708191212.4147700-1-surenb@google.com>
Mime-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com>
X-Mailer: git-send-email 2.41.0.390.g38632f3daf-goog
Message-ID: <20230708191212.4147700-2-surenb@google.com>
Subject: [PATCH v2 2/3] mm: lock newly mapped VMA which can be modified after
 it becomes visible
From: Suren Baghdasaryan <surenb@google.com>
To: torvalds@linux-foundation.org
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, david@redhat.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, liam.howlett@oracle.com, Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, willy@infradead.org, bagasdotme@gmail.com, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mmap_region adds a newly created VMA into VMA tree and might modify it
afterwards before dropping the mmap_lock. This poses a problem for page
faults handled under per-VMA locks because they don't take the mmap_lock
and can stumble on this VMA while it's still being modified. Currently
this does not pose a problem since post-addition modifications are done
only for file-backed VMAs, which are not handled under per-VMA lock.
However, once support for handling file-backed page faults with per-VMA
locks is added, this will become a race.
Fix this by write-locking the VMA before inserting it into the VMA tree.
Other places where a new VMA is added into VMA tree do not modify it
after the insertion, so do not need the same locking.

Cc: stable@vger.kernel.org
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index c66e4622a557..84c71431a527 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2812,6 +2812,8 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	if (vma->vm_file)
 		i_mmap_lock_write(vma->vm_file->f_mapping);
 
+	/* Lock the VMA since it is modified after insertion into VMA tree */
+	vma_start_write(vma);
 	vma_iter_store(&vmi, vma);
 	mm->map_count++;
 	if (vma->vm_file) {
-- 
2.41.0.390.g38632f3daf-goog

