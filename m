Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6254767EEE1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:56:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3SyP1T5zz3fNm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:56:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Cb3p2QcN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3acnuywykdmc574r0ot11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Cb3p2QcN;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3SdG5f6zz3fLC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:54 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5073cf66299so66255567b3.17
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z2/pTj5C3cgEFiOJp2CeCn46OI8ibDfme0ccGGe2ykQ=;
        b=Cb3p2QcNsUnk+wL6/K6P4ED35dG3ZUcB734zcAsddvwr/PVSkrRYzepHFsLMU82wqr
         DCByjFxSWTXuXxKpPzrEyhOes5tD65SfDW58DVPGzZ4bl/GM62EXvV72BYyh+FkQftRL
         9ik0iporDuduJD370bXV4KniJvgp40Hs/4xlWBjuzB4w/OEbzQnMEDOcEM26lHODokML
         801aFmGgsonG3Ea3SKObTIkdYEG/WUj/siwNQ/Elnoh6/xVR3ypDahdEx2v1JUXFD+l6
         cbwz8ftG3Ry5zhC62QLkQy0TB2bZZjts/vu8EdbF1X6krxdoifCb7qgLuiaEVqlGXvIi
         PdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2/pTj5C3cgEFiOJp2CeCn46OI8ibDfme0ccGGe2ykQ=;
        b=4/mpsjlCZbr1EO4f5atrGOrR0asaGiWKZ37wdpkgfhzsvcp39KUNvRrVt+SoXGEyzw
         EN5REOzfGB0B8e0gk6xg0IRVg3ct4yKSfMOz5+llBaF78IYOxQ/nblBVcLaFKeal7kl8
         KuXn915XObhEbTb6CtRd1qMiiHZpCnlXjQBkRoDv0K1LG1qOPss8P8aUwe3qN+PjJ2mQ
         U5dQlUPdo79UQc+TOPE/gycRHR7JNbfIQaXTzNWhWiMj29HWf/GpG17X5RsB0KAFDhLC
         rOlHFMJhTQMQ1uS/1659voNImw7cRLPlKkAXNLsY6bRMbn0MkaT1TDSseh1l3evVig7M
         F/Rw==
X-Gm-Message-State: AFqh2kp5QxnUNiwQ/cqktTSHxJPOc4wLt/BL6rHPQVb4yFHhQfJP+p59
	tGAX59hYGxXypdcwfRYRoVodhb9t4Fs=
X-Google-Smtp-Source: AMrXdXvc0ioDltykhYGthi7quhcG5gFdvKFRYGkIf9fgUkYhxxt/rX6VwG8N7AhqKPLty1w08hNt6tf3mAM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a0d:f6c2:0:b0:4dc:1241:cc0a with SMTP id
 g185-20020a0df6c2000000b004dc1241cc0amr6165876ywf.499.1674848512603; Fri, 27
 Jan 2023 11:41:52 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:53 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-17-surenb@google.com>
Subject: [PATCH v2 16/33] mm/mmap: write-lock VMA before shrinking or
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
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
index 6fff76334177..60038c24d836 100644
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

