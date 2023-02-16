Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E66698C10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:34:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNtC4L7Sz3fvq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:34:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NZSRPVmV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3q7ztywykdaiuwtgpdiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NZSRPVmV;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWx6KgCz3f3q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:37 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 191-20020a2504c8000000b008e2fd9e34e6so854439ybe.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gs5XDlSmqlz144wCEPg25vfe9kudkVyQE95J1Pewv8Q=;
        b=NZSRPVmVQg07iGqxuaNSoyEyX/JUlE5074LqD7StZA8wPOZx80SXxNMt5E5KxxrtoC
         5GmbXen1kftSSNBaHdmndb327iEU+JgvGlsjv+jrut0kw6bBF6uNimcKzz4dFOSEItYW
         Y4LEl4ERFvkTfh+pRssZBSprx0WHPyqr3iZkWvDeufJqDlNo5Dl9o53Xv9skjZ4WRCg9
         pPw2zfwLYTP83BBCg7T3fM4u8tR26MmRDA1XMM3A/clmWDV/BI6rgpWB66aseND2aMHJ
         sak6MgPcdV5XEwJQs9ETMkutqiCQEhW6TAM4KAr4SAjK7KgYItsJ/rcb5RNyZGDs+f6q
         Q5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gs5XDlSmqlz144wCEPg25vfe9kudkVyQE95J1Pewv8Q=;
        b=gkTMzSzEv21iz5arikqjdiZ19t+vqnQb2zE2GTe+PIc7bibA9HNwtpYddOkRoz0XED
         LZMndK6LmrnNY58BkjVwXdynY3OktnVNkpWj3lfEdWY9P+2v4PHH+UrBvbBNZGbIevPm
         bh09dkzOIW6BNq4kRkghWbUBVSYPczMXSnq/SGHuUCLjSW8fP2iOXt141Kr1hiRHP7QD
         6JuH9k/3l4drNxnmBiekWqOBbuGE3OM90PXNLUVpUdI7JzXt1aQky+hohehZkXXtyXYq
         0l9xWNwEXbjQe9cijNU+1Cc/cUqGYmi7SeR13HQ+7FtQ1zyC4UVYAcRdzOrKgA62tjbP
         7DkQ==
X-Gm-Message-State: AO0yUKV9eB4SX8RYnLH1bHDddyFVzYw4rr5qqhCVS3JxH6F/MA++QbTi
	Pb1eelSy+T+1I+6gclCSGxbakUIBPoY=
X-Google-Smtp-Source: AK7set81sG3yc9X92pQzrCT4qIFN1iEujQCfNrT8GtjdXbA2djctnG24/XowjsXx2FP9/9bsOvEUQhAtEC0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a81:9345:0:b0:52e:e6ed:30bb with SMTP id
 k66-20020a819345000000b0052ee6ed30bbmr607996ywg.571.1676524715849; Wed, 15
 Feb 2023 21:18:35 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:32 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-18-surenb@google.com>
Subject: [PATCH v3 17/35] mm/mmap: write-lock VMA before shrinking or
 expanding it
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

vma_expand and vma_shrink change VMA boundaries. Expansion might also
result in freeing of an adjacent VMA. Write-lock affected VMAs to prevent
concurrent page faults.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index ec2f8d0af280..f079e5bbcd57 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -674,6 +674,9 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
 		ret = dup_anon_vma(vma, next);
 		if (ret)
 			return ret;
+
+		/* Lock the VMA  before removing it */
+		vma_start_write(next);
 	}
 
 	init_multi_vma_prep(&vp, vma, NULL, remove_next ? next : NULL, NULL);
@@ -686,6 +689,7 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	if (vma_iter_prealloc(vmi))
 		goto nomem;
 
+	vma_start_write(vma);
 	vma_adjust_trans_huge(vma, start, end, 0);
 	/* VMA iterator points to previous, so set to start if necessary */
 	if (vma_iter_addr(vmi) != start)
@@ -725,6 +729,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	if (vma_iter_prealloc(vmi))
 		return -ENOMEM;
 
+	vma_start_write(vma);
 	init_vma_prep(&vp, vma);
 	vma_adjust_trans_huge(vma, start, end, 0);
 	vma_prepare(&vp);
-- 
2.39.1

