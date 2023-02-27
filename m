Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E46A489E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:52:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSl30ByJz3fpy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:52:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QlvGB3sb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ter8ywykddwqspclzemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QlvGB3sb;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPC57Qrz3c3G
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:19 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536b7eb9117so153584687b3.14
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWwKpXjDg6WAvmp/os9+Adpl/ccsxZtoSX3Q5XOWyQ0=;
        b=QlvGB3sbxoYWlBS31TzcGu38FuNf7Lhjhtq2VlYCxWOSVfHgnAjaRBrb1w97aEacbe
         K6advecLicCSUfFEo9GDjw6ni0z0vYUO24YPFOrOT6PGrUxiFDeAMZRvmYa7tXn8nDcV
         jQQpuW50daFJ8WQmqyVE7pXe4jO0h72Ly1mymbXPSaJk3hcoxxEHUhmsYcU7Utdafwgh
         EoU7EkscyBq5l+R+tPrIdVU+apzyZHKYcAM5J8frjMBd1EpUZg/bzw2FKzGiNCJc/yPF
         OX60CUqczCC42EwMz0GH4Ohwd96NL51ADp4JavDsEQkoG6zGf4C60SM+ihxfLXuX3u7Q
         RNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWwKpXjDg6WAvmp/os9+Adpl/ccsxZtoSX3Q5XOWyQ0=;
        b=oHz0q29F2rfajlciHJwAV+QDjljoVyeQgPDr4o1Fd6DDgOMAFkmhYSUXRKafiaI82P
         ahAB3jM+dhOXNL+qdYB1elTpcEzxzN6mmD2YipQlh6RK9zczegz2IN1TFgetYnnP+n1d
         yRRTjJzCQuC3p/Rxk2Qc8f/V0EpbgczPx0x87Wei6Zn1BWLqlHWBV9U7P+PdQgBKLvlw
         MsrMA4qWMHIZO/wCaY4cjNRP4eYf7KIwwfVmFsBO+CIitAQfmfJHRy76dvkNBJudnbH+
         diu8NP/2DIObjl+BUNy+JTFxcfnMI8/nbe1mbWhRsvs8jcUBknd8WE643AAwpiCWKDgt
         jVZA==
X-Gm-Message-State: AO0yUKWSNHH3J/z57A04xXFad+uZ3ASlpemx90IJy+hFVxrwfK1JcGkj
	WUFoSILSNjisS2MHGOOJSU4KUdQ0HFg=
X-Google-Smtp-Source: AK7set/Ab7tdetucxhQI7Y0d4CepnVZrRoikg6zNi8DSW4Q8ICogb5HvJ+8Ost/w6wLIBwUIyCkVrkJznGc=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a05:6902:10c:b0:a9f:3ee4:51a0 with SMTP id
 o12-20020a056902010c00b00a9f3ee451a0mr10ybh.505.1677519437283; Mon, 27 Feb
 2023 09:37:17 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:16 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-18-surenb@google.com>
Subject: [PATCH v4 17/33] mm/mremap: write-lock VMA while remapping it to a
 new address range
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, Laurent Dufour <laurent.dufour@fr.ibm.com>, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstr
 eet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Write-lock VMA as locked before copying it and when copy_vma produces
a new VMA.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
---
 mm/mmap.c   | 1 +
 mm/mremap.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index e73fbb84ce12..1f42b9a52b9b 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3189,6 +3189,7 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 			get_file(new_vma->vm_file);
 		if (new_vma->vm_ops && new_vma->vm_ops->open)
 			new_vma->vm_ops->open(new_vma);
+		vma_start_write(new_vma);
 		if (vma_link(mm, new_vma))
 			goto out_vma_link;
 		*need_rmap_locks = false;
diff --git a/mm/mremap.c b/mm/mremap.c
index 1ddf7beb62e9..327c38eb132e 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -623,6 +623,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
 			return -ENOMEM;
 	}
 
+	vma_start_write(vma);
 	new_pgoff = vma->vm_pgoff + ((old_addr - vma->vm_start) >> PAGE_SHIFT);
 	new_vma = copy_vma(&vma, new_addr, new_len, new_pgoff,
 			   &need_rmap_locks);
-- 
2.39.2.722.g9855ee24e9-goog

