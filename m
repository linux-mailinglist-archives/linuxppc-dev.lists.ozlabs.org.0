Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED94656D344
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh8CP5YcHz3c8k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:15:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pztaqCqU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pztaqCqU;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh81j11x2z3f38
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:07:05 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id a15so3676775pfv.13
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tdsQtDh9ydz0DQxCA7b12Fun0HjpQZpE3ts2FTH9aC4=;
        b=pztaqCqUvMENf5y8TkHMz4WL+EDFAi/75x6tcXyjrSQfB5w3pyjPEJGKwa9n/zwaUP
         8w7Fyl2IDCH3M4bd+fwQ4/qNRTRR1Ou7V4qeT1Eqo1GwV0PVVuYSEGIm69PUYb4LW259
         d+AvUi6ieRDen2F3O8sbWtZJXuhIfihV5W+RpHAT4s2rI90hORoeP39dzHgCBEDDv5Tx
         WzCumHZ9hv/dwah7byJzQf5izfm4MQh3VnaeXlKUStoPOpyEptU0me3TgOFD1hzjuOKR
         i9PnURT6f3yyqa8qwaR/EkZvwwXSuCm+oTvX0vN8IXZBCEGQcye7qZATbxcFmReMyrOm
         iC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tdsQtDh9ydz0DQxCA7b12Fun0HjpQZpE3ts2FTH9aC4=;
        b=mi6vj2ssTxRAIEnMTt1mI+SaM3ENFTEV5VUG9nxV+4KpD2UUSPLmOXsE2qatpIro7A
         Ym+3Hj4CjFhqWW44obs6BvaYEOmgA50tZ7kBewEUhiBAvBFFpUTSFrpcnEVtudYPkWUl
         c5D+QNYv4Z0NBSjYJVSYSl7jEYCYjlEYXx82GjFFQnu61AR8SkFeWi/8EMmX6ziToRPB
         BJray0XGyfF32SFGLQs6TuFZdl9JTwDPHA5XkiYFXlbFQkmKDTd9siiJpARQVItm65wj
         gG07RZp7C91lZAqlLhIawfbM5WIREgLbPYqnfcCYKSHEoyGo2ydQucmbn8JZc96zBRJG
         qPNw==
X-Gm-Message-State: AJIora8gj8JvfivcBjlqTDtsNT5/bQXsTgbvtNCjfuUADWZyKZjLiGhU
	k+BwATa/B73Xe3DOgrimYjSVWU7DvZ8=
X-Google-Smtp-Source: AGRyM1sRaacrj72ciU6CYZgvxrgFdSUc6QfbiXY4z49PrOqIgLTppfiTuxMhhR2/QHW1A+SVhXDuOw==
X-Received: by 2002:a63:5a21:0:b0:3fd:41e4:f833 with SMTP id o33-20020a635a21000000b003fd41e4f833mr14022285pgb.409.1657508822763;
        Sun, 10 Jul 2022 20:07:02 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id t12-20020a170902e84c00b0016a17da4ad4sm3432372plg.39.2022.07.10.20.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:07:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64: poison __per_cpu_offset to catch use-before-init
Date: Mon, 11 Jul 2022 13:06:53 +1000
Message-Id: <20220711030653.150950-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711030653.150950-1-npiggin@gmail.com>
References: <20220711030653.150950-1-npiggin@gmail.com>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the boot CPU tries to access per-cpu data of other CPUs before
per cpu areas are set up, it will unexpectedly use offset 0.

Try to catch such accesses by poisoning the __per_cpu_offset array.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/percpu.h | 1 +
 arch/powerpc/kernel/paca.c        | 2 +-
 arch/powerpc/kernel/setup_64.c    | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
index 8e5b7d0b851c..6ca1a9fc5725 100644
--- a/arch/powerpc/include/asm/percpu.h
+++ b/arch/powerpc/include/asm/percpu.h
@@ -7,6 +7,7 @@
  * Same as asm-generic/percpu.h, except that we store the per cpu offset
  * in the paca. Based on the x86-64 implementation.
  */
+#define PER_CPU_OFFSET_POISON 0xfeeeeeeeeeeeeeeeULL
 
 #ifdef CONFIG_SMP
 
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index ba593fd60124..914d27c8b84a 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -223,7 +223,7 @@ void __init initialise_paca(struct paca_struct *new_paca, int cpu)
 	new_paca->hw_cpu_id = 0xffff;
 	new_paca->kexec_state = KEXEC_STATE_NONE;
 	new_paca->__current = &init_task;
-	new_paca->data_offset = 0xfeeeeeeeeeeeeeeeULL;
+	new_paca->data_offset = PER_CPU_OFFSET_POISON;
 #ifdef CONFIG_PPC_64S_HASH_MMU
 	new_paca->slb_shadow_ptr = NULL;
 #endif
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 5761f08dae95..60f0d1258526 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -812,7 +812,7 @@ static __init int pcpu_cpu_to_node(int cpu)
 	return early_cpu_to_node(cpu);
 }
 
-unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
+unsigned long __per_cpu_offset[NR_CPUS] __read_mostly = { [0 ... NR_CPUS-1 ] = PER_CPU_OFFSET_POISON };
 EXPORT_SYMBOL(__per_cpu_offset);
 
 void __init setup_per_cpu_areas(void)
-- 
2.35.1

