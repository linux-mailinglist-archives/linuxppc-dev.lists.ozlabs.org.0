Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C95F3CCB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 08:35:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhSdS15jJz3dqS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 17:35:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lwtBnAl7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lwtBnAl7;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhSZY3cjGz2ysx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 17:33:25 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 2so6338465pgl.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Oct 2022 23:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zFKmwZATkvUZrvny3kxh1DBoY3Qz6msxoC1UQ3esBlE=;
        b=lwtBnAl7OZqMUl7Ijx04t1wowNs0MwcWv807mpIhFjo6PRWLdtqr6yXScdVMsUkpBz
         Cp5xL6U9iO6bqLMBXuyBz6FgtXVgkiuWTZOtg9Ij4tdxsGuwpN/CrJVCg2L/y11SAAz+
         uiGctmACZO4WDdEGNDB2vLV5Kq0/ihqutBwUfbxKxd/ZdiAqcBEVD5H3CKBLcMRn54b2
         auYpGCWtIAgV4bWrBgQjBxokQ7rRxpORwCelNQM0AqdFixwkax45KAkjofJ45Ggvg4QT
         6wyjCTsXtP18TKd4v1QjZmRGH7dRXAbfSeb843+tbjazRM3GAgVLEOYsBbWVnk7iRz/U
         V7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zFKmwZATkvUZrvny3kxh1DBoY3Qz6msxoC1UQ3esBlE=;
        b=FHT0PPr5kAyd8VNCvVsPjY/j627DSeAwa4VUulaNxT0yR6TZK/qvy0U1mK7LET0mq9
         n5u1BeIGJ2CwbCbyk+sfnRyNrvkA2vEtTY8lmwMY8cZzGVhDC/awvfT82Mf+KMJBKzVn
         vMPNJzwMaPhBxOSneIw5z27pAVSMW1hHr15aq0nrXrJ9nEDYMTDtMQ7z/4ziYpyWz+4j
         g6c5Dru4AdsE/Iw29kziSd2ZdU+Rzh8CRwNhNjZSUYkSN1woj3V+dQG8LJ8YM2I+xGUx
         GjkKRb5JVCBDYlGtCOJ10SccFyZLthkwATMrmew/2Kvl2p6UKpbNlAIknsGquIUS2Ch9
         eIfQ==
X-Gm-Message-State: ACrzQf3gitcs51v/G50PsdSsnatVdnQm7v7qcdUo2UWPo+R/mIslt8hr
	nVaZ47wX1b+7TcO7lpijilZyub1S+24=
X-Google-Smtp-Source: AMsMyM4oSliLXaGVVCXS54plj8a0Hu5ea4aBIUfT7TufXobjBXGas26+pIReiDXRttwvsZVAm+74NA==
X-Received: by 2002:a62:6347:0:b0:531:c5a7:b209 with SMTP id x68-20020a626347000000b00531c5a7b209mr26151068pfb.60.1664865203181;
        Mon, 03 Oct 2022 23:33:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (123-243-1-173.tpgi.com.au. [123.243.1.173])
        by smtp.gmail.com with ESMTPSA id s17-20020aa78bd1000000b0056160437e88sm3701782pfd.20.2022.10.03.23.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:33:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/3] powerpc: remove the last remnants of cputime_t
Date: Tue,  4 Oct 2022 16:33:05 +1000
Message-Id: <20221004063306.511154-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221004063306.511154-1-npiggin@gmail.com>
References: <20221004063306.511154-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cputime_t is no longer, converted to u64.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/cputime.h | 17 +----------------
 arch/powerpc/kernel/time.c         | 23 ++---------------------
 2 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
index 431ae2343022..4961fb38e438 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -21,23 +21,8 @@
 #include <asm/param.h>
 #include <asm/firmware.h>
 
-typedef u64 __nocast cputime_t;
-typedef u64 __nocast cputime64_t;
-
-#define cmpxchg_cputime(ptr, old, new) cmpxchg(ptr, old, new)
-
 #ifdef __KERNEL__
-/*
- * Convert cputime <-> microseconds
- */
-extern u64 __cputime_usec_factor;
-
-static inline unsigned long cputime_to_usecs(const cputime_t ct)
-{
-	return mulhdu((__force u64) ct, __cputime_usec_factor);
-}
-
-#define cputime_to_nsecs(cputime) tb_to_ns((__force u64)cputime)
+#define cputime_to_nsecs(cputime) tb_to_ns(cputime)
 
 /*
  * PPC64 uses PACA which is task independent for storing accounting data while
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index a2ab397065c6..d68de3618741 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -130,7 +130,7 @@ unsigned long tb_ticks_per_jiffy;
 unsigned long tb_ticks_per_usec = 100; /* sane default */
 EXPORT_SYMBOL(tb_ticks_per_usec);
 unsigned long tb_ticks_per_sec;
-EXPORT_SYMBOL(tb_ticks_per_sec);	/* for cputime_t conversions */
+EXPORT_SYMBOL(tb_ticks_per_sec);	/* for cputime conversions */
 
 DEFINE_SPINLOCK(rtc_lock);
 EXPORT_SYMBOL_GPL(rtc_lock);
@@ -150,21 +150,6 @@ EXPORT_SYMBOL_GPL(ppc_tb_freq);
 bool tb_invalid;
 
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
-/*
- * Factor for converting from cputime_t (timebase ticks) to
- * microseconds. This is stored as 0.64 fixed-point binary fraction.
- */
-u64 __cputime_usec_factor;
-EXPORT_SYMBOL(__cputime_usec_factor);
-
-static void calc_cputime_factors(void)
-{
-	struct div_result res;
-
-	div128_by_32(1000000, 0, tb_ticks_per_sec, &res);
-	__cputime_usec_factor = res.result_low;
-}
-
 /*
  * Read the SPURR on systems that have it, otherwise the PURR,
  * or if that doesn't exist return the timebase value passed in.
@@ -369,10 +354,7 @@ void vtime_flush(struct task_struct *tsk)
 	acct->hardirq_time = 0;
 	acct->softirq_time = 0;
 }
-
-#else /* ! CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
-#define calc_cputime_factors()
-#endif
+#endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 
 void __delay(unsigned long loops)
 {
@@ -914,7 +896,6 @@ void __init time_init(void)
 	tb_ticks_per_jiffy = ppc_tb_freq / HZ;
 	tb_ticks_per_sec = ppc_tb_freq;
 	tb_ticks_per_usec = ppc_tb_freq / 1000000;
-	calc_cputime_factors();
 
 	/*
 	 * Compute scale factor for sched_clock.
-- 
2.37.2

