Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F7166327D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:13:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRWg03Sxz3fjj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:13:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dyW75mch;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3cn-8ywykdb8npm9i6bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dyW75mch;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5Q6qrVz3cfY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:34 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 81-20020a250b54000000b007c002e178dfso1326209ybl.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1sz3d8Q6zHAextbGhc5zNdx6/hdXqibZ5+zjxQEPtcY=;
        b=dyW75mchIm8T3L3V0Aa5O5essWjp4aFupYS1LFKIISIPYObh/dim0X80nsutKOS2m/
         7vd6AcHVv3F7nL+fFOG4vgOpiulnyZtSLux8AIxMn/Q09ghgqU9hpb0yvL9ry+wKM1Wm
         UvSXVlZK7VJVWgc1kVtRM87LVA0ol6j3197yqrcZsN3y1TKaMHMTXNPpOvk38N+aLEKf
         U9xTtNcWgL4MRS7DZ4GXXUuetaMZa2ezppHTDMHc58pzPdKSGBN9qWFGFMwk1DYAuR6m
         mxxVO9djRkO0qH7ZMi64I+oMQN0AQu1sYjF82YaLSmfJI9fTdyDigl7Wn8SgruW4bLXZ
         WU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1sz3d8Q6zHAextbGhc5zNdx6/hdXqibZ5+zjxQEPtcY=;
        b=QuKE1pIUM6povNHcLNvCOQlU2SyKE621vvZpWldyHn6iGESb8GVamomnDl/ktgdklM
         odwWjp8g9YdntEk1TCv0HUGnA7938JyuFK6UlAImqm18Qthf+I4IXl8nCUnAwyrM7ZJb
         9IpxusAwT/hwtpF6H0jrQodA+2Vi/RSvXApF03DgT1ROrL/n+Qqv+SrvDvSjY692253S
         dpG7/XH1E/LlkCdirD4ZcHknWw9Tk/6a2lh+DJT6kzTz88My3cENI3iA1xsRb64a+Pag
         DJ8XcgtcNks6S41hjgXRC3RTDfkNi8OcEmB8/yUMPLrsMLd4/qz74ybb41KEOh62BOkB
         Uvpg==
X-Gm-Message-State: AFqh2kpZaN5cwyUaFJklJ+DOvlfMw9MZPCKnRAshRRdWYnepFv7JMN7q
	id9KnT5mz81lVuodV+a1m5otS4nLZOY=
X-Google-Smtp-Source: AMrXdXvYJ0MKAPgXdwWnp9E6tLdKAmG2zH31TOsESiFv0D3eqJovHEz4lb9T2t60zhYoFlt31PHaEzcWVdQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:830b:0:b0:731:a583:5571 with SMTP id
 s11-20020a25830b000000b00731a5835571mr8144189ybk.320.1673297674437; Mon, 09
 Jan 2023 12:54:34 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:16 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-22-surenb@google.com>
Subject: [PATCH 21/41] mm/mmap: write-lock VMAs affected by VMA expansion
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

vma_expand changes VMA boundaries and might result in freeing an adjacent
VMA. Write-lock affected VMAs to prevent concurrent page faults.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 1e2154137631..ff02cb51e7e7 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -544,6 +544,7 @@ inline int vma_expand(struct ma_state *mas, struct vm_area_struct *vma,
 	if (mas_preallocate(mas, vma, GFP_KERNEL))
 		goto nomem;
 
+	vma_write_lock(vma);
 	vma_adjust_trans_huge(vma, start, end, 0);
 
 	if (file) {
@@ -590,6 +591,7 @@ inline int vma_expand(struct ma_state *mas, struct vm_area_struct *vma,
 	}
 
 	if (remove_next) {
+		vma_write_lock(next);
 		if (file) {
 			uprobe_munmap(next, next->vm_start, next->vm_end);
 			fput(file);
-- 
2.39.0

