Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 471BF2151E7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 06:50:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0Y6l3DJTzDqTN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 14:50:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XOdg5H2E; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0Xp65bypzDqBx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 14:36:30 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id l17so37806472wmj.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 21:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cAuLxDL8CkBp1tpBnhqClilHhcD0O782TDI+bdg1kNU=;
 b=XOdg5H2E4lNGYFhYc0/rxP9u8/fuTv6VeFja8Noz+koduO9ASBPQiUJIZhJUoe3FZ1
 5j6pJEMPoDcUJa4a693ePzR0S0bWCuP+okHF201wWOQJPeFXc19q1Wjad8zvFortsca4
 BAU2cWVym6HmdO3WF6QoeaegeTIDsaaabWgHbqVLzx2BEzkwec86jclgPu2E2A4yUupb
 d2wbC887pQ79Xz0sn+vujqemnZPZJNUPEuhO9Ih5S3OuA12J314AIXAeIrWLtZfjUxBp
 DPfOl5ls1Z513+Q9hqkmMlLQbBDtAUtP8bHoauVyDliR6Voin8q9hhSW7niY5xE76rE4
 BlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cAuLxDL8CkBp1tpBnhqClilHhcD0O782TDI+bdg1kNU=;
 b=UMtVBF9AQhgner/WhN/DAYxc91aqnIzd0GVNk7kStCIJYSKOiPEnrRgKYmeC+dOcOz
 eWax2wOxOZjnbYGEj/qxvzWBtoM74it4BZ4DCt+xQDn7x8pw9gmeDFtsx3e9k84Q+DpH
 d2NDsXZOnRB8PvobZ/8d7/uXsbCXGOfn48T9vjdufvUJjMcmJ2MFBJYbC7mKn/V5oHKs
 ivy8VvvImA2+te2h3wnFUuN4XSLlKjxETjIG6XXJxXd4+tLP4oC7IahEDkNhEzP7Wlo2
 Gw+EiWWyavTCcCLBtzqVYeA9hWFSCEy0sNtEeihZFyTYwq88vgtkk4cSziZEyG5+KJHt
 TNZA==
X-Gm-Message-State: AOAM532+YWQyP4xbBJJu4ITR+Xnh1WWCtxd+NfVM5S9S3dBFimCKC7aQ
 nbwfcIa46jergKAn4XihRyuc48YD
X-Google-Smtp-Source: ABdhPJw3xwCHjl66IDwjNwnrVaS+sYKKRxEjT29tJBVhRnVy0iHX8mmwPpg7n6zCTYEyHFzW18ALwQ==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr49403893wmi.66.1594010186996; 
 Sun, 05 Jul 2020 21:36:26 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id r10sm22202309wrm.17.2020.07.05.21.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 21:36:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 6/6] powerpc/qspinlock: optimised atomic_try_cmpxchg_lock
 that adds the lock hint
Date: Mon,  6 Jul 2020 14:35:40 +1000
Message-Id: <20200706043540.1563616-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200706043540.1563616-1-npiggin@gmail.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This brings the behaviour of the uncontended fast path back to
roughly equivalent to simple spinlocks -- a single atomic op with
lock hint.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/atomic.h    | 28 ++++++++++++++++++++++++++++
 arch/powerpc/include/asm/qspinlock.h |  2 +-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 498785ffc25f..f6a3d145ffb7 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -193,6 +193,34 @@ static __inline__ int atomic_dec_return_relaxed(atomic_t *v)
 #define atomic_xchg(v, new) (xchg(&((v)->counter), new))
 #define atomic_xchg_relaxed(v, new) xchg_relaxed(&((v)->counter), (new))
 
+/*
+ * Don't want to override the generic atomic_try_cmpxchg_acquire, because
+ * we add a lock hint to the lwarx, which may not be wanted for the
+ * _acquire case (and is not used by the other _acquire variants so it
+ * would be a surprise).
+ */
+static __always_inline bool
+atomic_try_cmpxchg_lock(atomic_t *v, int *old, int new)
+{
+	int r, o = *old;
+
+	__asm__ __volatile__ (
+"1:\t"	PPC_LWARX(%0,0,%2,1) "	# atomic_try_cmpxchg_acquire	\n"
+"	cmpw	0,%0,%3							\n"
+"	bne-	2f							\n"
+"	stwcx.	%4,0,%2							\n"
+"	bne-	1b							\n"
+"\t"	PPC_ACQUIRE_BARRIER "						\n"
+"2:									\n"
+	: "=&r" (r), "+m" (v->counter)
+	: "r" (&v->counter), "r" (o), "r" (new)
+	: "cr0", "memory");
+
+	if (unlikely(r != o))
+		*old = r;
+	return likely(r == o);
+}
+
 /**
  * atomic_fetch_add_unless - add unless the number is a given value
  * @v: pointer of type atomic_t
diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index f5066f00a08c..b752d34517b3 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -37,7 +37,7 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
 {
 	u32 val = 0;
 
-	if (likely(atomic_try_cmpxchg_acquire(&lock->val, &val, _Q_LOCKED_VAL)))
+	if (likely(atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL)))
 		return;
 
 	queued_spin_lock_slowpath(lock, val);
-- 
2.23.0

