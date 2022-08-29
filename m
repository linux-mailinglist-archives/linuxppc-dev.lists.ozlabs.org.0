Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA305A56D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl515LQLz3dvx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:11:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gO3BAu2t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=37c4nywykdj0probk8dlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gO3BAu2t;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk5C1WDlz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:07 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-3328a211611so146177287b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=NYe8oOJNfY11QXfRhGHbzq3PtP5qYF5OBWlNRgI/ICw=;
        b=gO3BAu2tPnt5ajc2wonv12EyC/cky1iEagPrWs8TIsmrfOPEdnZICXVlt39nBHt3WW
         tTV55lawhiZGMRBmA7gdT3YGawg8JjnJFEe5+7PrxS+L7PuBHZcRqu/eGZS5+7HkD+/v
         WBe3l/+DgKFH8adTgdOoThkCyU3oUkPdhTm9bGePyXaQUn5Kf04YxKMvEOmZ7WCBWmLN
         BXoUJ7D1rnsd47mFF47xSWH/cS8u1UFuDHVuHAEZYgUQ7/tjgR1JcWJgnN0k47FfJT+A
         /f4moE4fkIQHN9Nb1qOXqxym1C/DCmqaA6CVw+YBif80n7h7hRdtT5oL02KCkdJe7ned
         iBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=NYe8oOJNfY11QXfRhGHbzq3PtP5qYF5OBWlNRgI/ICw=;
        b=5kVHgeMElleI438MpRIiI8m/KWfvBFs+vksGFDhF9zLMAX7xNLyX16KWhZIKTab+wg
         PeRMDF906mKYAhC41bTsZy7JbTyhG5FormKo8lt3fA/glwOhT9te0qjPesaKbdvivUJL
         yPJuA7gn9bQQVxEzrdDVgVGG6G6F0HQrLteAi2EUhnVfLWjOq7dgCY7MXWMG9ZgCLcdH
         nsVCaiVMYJF94uQb2IVJRVfWM7LN2fa2jBErMbMVEfa0GimYNdx3VCuoLkC82KOde1A9
         ZLEo7K5yE4evq1Oax17bRFkW+Xn8HPg9EZdFWam4TzEl6wLGFi8pK7C5ITWJbEVm0WWV
         tDIA==
X-Gm-Message-State: ACgBeo1TnG6Wo+MsKNOYYkUVeJD0BDtP2XhYpKjnpHplp0uv5qZpWBDR
	c2wnVR3RE0gtZ6cYuJrA9EJhspkP7Vg=
X-Google-Smtp-Source: AA6agR7nmkBRROpS79vTx3reOak4mrTZffxlmMbexsEub45N/wO5CnqJNjif+IJpyxwlCbKERnK2QUttv8k=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a25:d944:0:b0:695:6056:7dda with SMTP id
 q65-20020a25d944000000b0069560567ddamr9840482ybg.277.1661808364958; Mon, 29
 Aug 2022 14:26:04 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:19 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-17-surenb@google.com>
Subject: [RFC PATCH 16/28] kernel/fork: assert no VMA readers during its destruction
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Aug 2022 08:01:45 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, riel@surriel.com, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Assert there are no holders of VMA lock for reading when it is about to be
destroyed.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 8 ++++++++
 kernel/fork.c      | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dc72be923e5b..0d9c1563c354 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -676,6 +676,13 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma, int pos)
 	VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
 }
 
+static inline void vma_assert_no_reader(struct vm_area_struct *vma)
+{
+	VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock) &&
+		      vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq),
+		      vma);
+}
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline void vma_init_lock(struct vm_area_struct *vma) {}
@@ -685,6 +692,7 @@ static inline bool vma_read_trylock(struct vm_area_struct *vma)
 static inline void vma_read_unlock(struct vm_area_struct *vma) {}
 static inline void vma_assert_locked(struct vm_area_struct *vma) {}
 static inline void vma_assert_write_locked(struct vm_area_struct *vma, int pos) {}
+static inline void vma_assert_no_reader(struct vm_area_struct *vma) {}
 
 #endif /* CONFIG_PER_VMA_LOCK */
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 1872ad549fed..b443ba3a247a 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -487,6 +487,8 @@ static void __vm_area_free(struct rcu_head *head)
 {
 	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
 						  vm_rcu);
+	/* The vma should either have no lock holders or be write-locked. */
+	vma_assert_no_reader(vma);
 	kmem_cache_free(vm_area_cachep, vma);
 }
 #endif
-- 
2.37.2.672.g94769d06f0-goog

