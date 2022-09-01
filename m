Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA46F5A9E65
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:45:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT3W4Lykz3ffx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:45:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pbMRwoSF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3g-0qywykdmay0xkthmuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pbMRwoSF;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrQ5SKDz2yYj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:06 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id x8-20020a17090a1f8800b001faa9857ef2so1648891pja.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=VpPGH26B3JaNkIfQAA8lk0M2gmgFVNCTIjkTHyeGjq0=;
        b=pbMRwoSFwQraZzGGZr7x5dEEGoBSSezJwWCkFmGpQHOK/gJ9jZl7heInRLvxfZubEx
         Wj7mEqLcXRU9xxWHf3t+7qSl6CnhQuuJSVxfC2zOp1biHU7QYf19J34qbstjhGHRGexS
         HGkcltAazUrmNYZt5EcV0prllxXaFrscwVZ4MeMfR5YBnXhADmsl05WrPEXFggi7Gjas
         iHFv8bsKjSzXGdd4TTCY9kFoj2NTn7nIEkBcfDuEl9YbNXUKLbiljFvk9VYo3diziCwb
         KLzO8tBeRwrd5fwSMEAfN7AuoAZXQe3a89hFtIYEbzmUJ/R7GnSkDta2dkqtwJ/Rto29
         WT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=VpPGH26B3JaNkIfQAA8lk0M2gmgFVNCTIjkTHyeGjq0=;
        b=goiOewzW7Y06vSBa+slQWKDI9X4nVagZir1F02Qm1H9mtwBHPAUFccT/ZzW6fEPJ8e
         RqGe9fZVHz4rZFQTMzuOUHskeAz7+3irzzPXYHz1m9Q6zxC0NeKnNc+nRz0tEYIauJwq
         y2PT7vdwByvz2RyqTxW5BY9RrVpNtKpSaBBZaBkIYc2+naT6SFkKtoebrMRnft8xBrrI
         Z4yG3uwirbi8BhDpMHTzLQmVOoSJsZoUitPw/sW5xSmcZSSDf+84ldJa/7j90wUvhh+u
         KxnTjVhkI1jEcyFrK9kOGAiE6qaaL06NkfuFu79URMvhy/seSr60xDheM5zER+o1rDvg
         VSwA==
X-Gm-Message-State: ACgBeo22sMBmwv/a+VPtosS2f+Gfhqoin+rMYSUPLumDaz1xAFZwvlRp
	YjNNxIftTapXZD3uOEm07VOjSHGbGsY=
X-Google-Smtp-Source: AA6agR5wOS2QTAVmPmwy5O8cxRkpTpms/e+UYL0OyAuyLY0hN8kJNMUzvy3oLdSFlDJRhvwngVhT3DguUUM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a63:b250:0:b0:422:e3a6:47f2 with SMTP id
 t16-20020a63b250000000b00422e3a647f2mr4539554pgo.478.1662053763882; Thu, 01
 Sep 2022 10:36:03 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:04 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-17-surenb@google.com>
Subject: [RFC PATCH RESEND 16/28] kernel/fork: assert no VMA readers during
 its destruction
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
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
2.37.2.789.g6183377224-goog

