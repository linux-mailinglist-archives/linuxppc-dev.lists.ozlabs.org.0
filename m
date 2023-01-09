Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C4663236
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:06:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRMD0FWcz3fJS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:06:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RKn/zVLZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=39x68ywykdao241oxlqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RKn/zVLZ;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR533JCBz3cd6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:15 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id p2-20020a17090a74c200b00226cc39b0afso3633104pjl.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ThjMRKbwnKxVGB3eylsidymuk6Qi/iLA6nYtJEm4MU=;
        b=RKn/zVLZEJYWNukTXjRCu4nz81zaytlRkR7rakIR2uB/aIfeElp0yCIRzuM8+pvZ3x
         BQOElK8tbS+rhMmhhEhBtfHOWGZOyvH/HCUdLENpEngLYbZsqjJ9OUXahFZPUHh+XaxU
         YMwkVhfHQ73TasfAveK5V4w8pX7O6IKpRzfg+l1/+SN9l2l60gXMRIOKbNPAPi3/90FE
         v/HorT/klJnq8Lcd3XX+VkW89j017v/vCfpCQTBG4XFodaDoUu6obKl8t1y+jpshNDo0
         91Vfmkl3EHo0Elu4jQ9efLprq8Gy+cE160O08y2PdqRoSx1lsEPlDSvoNxeAyXeTk2x0
         qpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ThjMRKbwnKxVGB3eylsidymuk6Qi/iLA6nYtJEm4MU=;
        b=htFiGEXJjWZqNTfH/vr0zViE94rifMcIHrH14lzWEQMQFovlEI/GTfA9CEqJVDQAiW
         gJcuSZ8v1UxZk62077njy1bmXN/KeLqBA/J5b5Tg39ZQBi+IroXY9V5NqVQyGLUOuheP
         jN1pwGO5BgQS+ulKXnLYvI26Yc8B9GoIh4cJZYiqwg6H57DpXZMYCby1757g5bccMr+E
         CXKPbevhYAg3r84dHcMH/JCOF6rCLKQ0g4asARBitQBDmtDHL8X5ewE6ubo1C+X/7h8L
         v/DB+6pDRQZeuDTYENvuh9Dnp32Dl1tURBE/fyDgr2QdRjBVvaI6BS4sEWKO8mxtfe1T
         /x1Q==
X-Gm-Message-State: AFqh2kq34clC5cZTIEsUI1+on4pqhgfc/Z0dxDUttwEAr+l0BQiV3yY/
	rLGJqKeO1dlQc0ScEjkcM5X8dPD/rEc=
X-Google-Smtp-Source: AMrXdXvxnut8BEB8WYWMFHzY9PnfOwu60Xd9fTsfu57bMChvZCCQkV4pslftmJOaEGGsy1IoVxboiXkLZWU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a17:90a:5c86:b0:219:c1fb:5da8 with SMTP id
 r6-20020a17090a5c8600b00219c1fb5da8mr5399379pji.221.1673297653600; Mon, 09
 Jan 2023 12:54:13 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:08 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-14-surenb@google.com>
Subject: [PATCH 13/41] mm: introduce vma->vm_flags modifier functions
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

To keep vma locking correctness when vm_flags are modified, add modifier
functions to be used whenever flags are updated.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h       | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/mm_types.h |  8 +++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ec2c4c227d51..35cf0a6cbcc2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -702,6 +702,44 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma_init_lock(vma);
 }
 
+/* Use when VMA is not part of the VMA tree and needs no locking */
+static inline
+void init_vm_flags(struct vm_area_struct *vma, unsigned long flags)
+{
+	WRITE_ONCE(vma->vm_flags, flags);
+}
+
+/* Use when VMA is part of the VMA tree and needs appropriate locking */
+static inline
+void reset_vm_flags(struct vm_area_struct *vma, unsigned long flags)
+{
+	vma_write_lock(vma);
+	init_vm_flags(vma, flags);
+}
+
+static inline
+void set_vm_flags(struct vm_area_struct *vma, unsigned long flags)
+{
+	vma_write_lock(vma);
+	vma->vm_flags |= flags;
+}
+
+static inline
+void clear_vm_flags(struct vm_area_struct *vma, unsigned long flags)
+{
+	vma_write_lock(vma);
+	vma->vm_flags &= ~flags;
+}
+
+static inline
+void mod_vm_flags(struct vm_area_struct *vma,
+		  unsigned long set, unsigned long clear)
+{
+	vma_write_lock(vma);
+	vma->vm_flags |= set;
+	vma->vm_flags &= ~clear;
+}
+
 static inline void vma_set_anonymous(struct vm_area_struct *vma)
 {
 	vma->vm_ops = NULL;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5f7c5ca89931..0d27edd3e63a 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -553,7 +553,13 @@ struct vm_area_struct {
 	 * See vmf_insert_mixed_prot() for discussion.
 	 */
 	pgprot_t vm_page_prot;
-	unsigned long vm_flags;		/* Flags, see mm.h. */
+
+	/*
+	 * Flags, see mm.h.
+	 * WARNING! Do not modify directly to keep correct VMA locking.
+	 * Use {init|reset|set|clear|mod}_vm_flags() functions instead.
+	 */
+	unsigned long vm_flags;
 
 #ifdef CONFIG_PER_VMA_LOCK
 	int vm_lock_seq;
-- 
2.39.0

