Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076C7639523
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:06:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6nT5svTz3fBF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:06:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ckUaTtrj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ckUaTtrj;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fY036Qz3f3L
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 21:00:04 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id q1so5748174pgl.11
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Viza/i7++bfoOLQCqPDRK4YsIv/n6ZG7Kj4/9MpOfAM=;
        b=ckUaTtrjRBgWZS+i4L/b7pO/9tpoV3FvPVfsE03bCNw/QdY3A7WCfIO53FT8NLQKH1
         /Fxgusp2l2xPuUAAGIDFEg2WTP36//YHBo6dcH15EHTkgkPxrjSSM4i5s/7IXSUB/NcF
         f46/n08dxW7/HPbSThd+SOuPXZ+VX26ZVebkgGiuNjmvi3JGc7GWX8D3bhvkZ7kFHiL5
         Ec0hrf+L6eXb79PRtvFsBXiB3yALAYZqsF3MY4HTja6N5O7tUZ1dpXK/uRdkRRcibhNT
         qwGKWcrr6sITMgN41ZbNZzQfdOmJ84Ux5jTHZFUx/khKDzVqnyAj4cyRScXnckJiR/S8
         BsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Viza/i7++bfoOLQCqPDRK4YsIv/n6ZG7Kj4/9MpOfAM=;
        b=IDMX68yL/fkDtDaa/lOH9w3ZTR1JoQ5XUAFO8AHCUhnk6u4ZxLb8Zzao0HVVrh0ULa
         GJAalRb8fG2SrkoP5CQQm+sJkdN9zCL2SEvkQkIVUWc3ee84yyLm9RUmgsB52pz77J35
         iwEvQ+3rUSVAcIp1e0hiVFPhe1N8/JPkYzPoGSIdEprNRnvix4h7hX1xIShj+GurSbMK
         w1FkR7eB0THNJLIXYlTBPjhgikcGrdsQOPYUyTM9Kq7r+B0lpaohoQiAAi25Yb4DyXT4
         tVUkKh2p8jSen9ffE5eRLQAd9ssleBu2FhUwQPXEnqPPyl1d28GrLq8TGLlnKxjQROeW
         gxkw==
X-Gm-Message-State: ANoB5pkowpQB1J6rJ1suWsDuetMov4AL9uJauwo/60Gv8HsVWoHoNZkK
	iNREp6tdNDT/ekLulu9FlmaL83EJEHtPGQ==
X-Google-Smtp-Source: AA0mqf5x32Xex0QYqZRZgz1ahlHrSrNI4+1/h6IwAhN/OZm9SlZO2qmfzzzsulIjT5Wp3zcMOKoSDw==
X-Received: by 2002:aa7:9dc6:0:b0:561:b2ea:bfe9 with SMTP id g6-20020aa79dc6000000b00561b2eabfe9mr24772795pfq.4.1669456802260;
        Sat, 26 Nov 2022 02:00:02 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.01.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 02:00:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/17] powerpc/qspinlock: store owner CPU in lock word
Date: Sat, 26 Nov 2022 19:59:21 +1000
Message-Id: <20221126095932.1234527-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221126095932.1234527-1-npiggin@gmail.com>
References: <20221126095932.1234527-1-npiggin@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Store the owner CPU number in the lock word so it may be yielded to,
as powerpc's paravirtualised simple spinlocks do.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock.h       | 12 ++++++++++--
 arch/powerpc/include/asm/qspinlock_types.h | 12 +++++++++++-
 arch/powerpc/lib/qspinlock.c               |  2 +-
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 2a6f12a2c385..be53702e56fc 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -20,8 +20,15 @@ static __always_inline int queued_spin_is_contended(struct qspinlock *lock)
 	return !!(READ_ONCE(lock->val) & _Q_TAIL_CPU_MASK);
 }
 
+static __always_inline u32 queued_spin_encode_locked_val(void)
+{
+	/* XXX: make this use lock value in paca like simple spinlocks? */
+	return _Q_LOCKED_VAL | (smp_processor_id() << _Q_OWNER_CPU_OFFSET);
+}
+
 static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 {
+	u32 new = queued_spin_encode_locked_val();
 	u32 prev;
 
 	asm volatile(
@@ -33,7 +40,7 @@ static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 "\t"	PPC_ACQUIRE_BARRIER "						\n"
 "2:									\n"
 	: "=&r" (prev)
-	: "r" (&lock->val), "r" (_Q_LOCKED_VAL),
+	: "r" (&lock->val), "r" (new),
 	  "i" (IS_ENABLED(CONFIG_PPC64))
 	: "cr0", "memory");
 
@@ -42,6 +49,7 @@ static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 
 static __always_inline int __queued_spin_trylock_steal(struct qspinlock *lock)
 {
+	u32 new = queued_spin_encode_locked_val();
 	u32 prev, tmp;
 
 	/* Trylock may get ahead of queued nodes if it finds unlocked */
@@ -56,7 +64,7 @@ static __always_inline int __queued_spin_trylock_steal(struct qspinlock *lock)
 "\t"	PPC_ACQUIRE_BARRIER "						\n"
 "2:									\n"
 	: "=&r" (prev), "=&r" (tmp)
-	: "r" (&lock->val), "r" (_Q_LOCKED_VAL), "r" (_Q_TAIL_CPU_MASK),
+	: "r" (&lock->val), "r" (new), "r" (_Q_TAIL_CPU_MASK),
 	  "i" (IS_ENABLED(CONFIG_PPC64))
 	: "cr0", "memory");
 
diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
index 1911a8a16237..adfeed4aa495 100644
--- a/arch/powerpc/include/asm/qspinlock_types.h
+++ b/arch/powerpc/include/asm/qspinlock_types.h
@@ -29,7 +29,8 @@ typedef struct qspinlock {
  * Bitfields in the lock word:
  *
  *     0: locked bit
- *  1-15: unused bits
+ *  1-14: lock holder cpu
+ *    15: unused bit
  *    16: must queue bit
  * 17-31: tail cpu (+1)
  */
@@ -40,6 +41,15 @@ typedef struct qspinlock {
 #define _Q_LOCKED_BITS		1
 #define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
 
+/* 0x00007ffe */
+#define _Q_OWNER_CPU_OFFSET	1
+#define _Q_OWNER_CPU_BITS	14
+#define _Q_OWNER_CPU_MASK	_Q_SET_MASK(OWNER_CPU)
+
+#if CONFIG_NR_CPUS > (1U << _Q_OWNER_CPU_BITS)
+#error "qspinlock does not support such large CONFIG_NR_CPUS"
+#endif
+
 /* 0x00010000 */
 #define _Q_MUST_Q_OFFSET	16
 #define _Q_MUST_Q_BITS		1
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 979b17ac7bd1..a5b2c0377cf9 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -55,7 +55,7 @@ static inline int decode_tail_cpu(u32 val)
  */
 static __always_inline u32 trylock_clean_tail(struct qspinlock *lock, u32 tail)
 {
-	u32 newval = _Q_LOCKED_VAL;
+	u32 newval = queued_spin_encode_locked_val();
 	u32 prev, tmp;
 
 	asm volatile(
-- 
2.37.2

