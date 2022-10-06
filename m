Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DC25F649E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 12:58:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjpLt2fy4z3dqX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 21:57:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oCaAz4wK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oCaAz4wK;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjpKy22VKz2xHL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 21:57:08 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id v10-20020a17090a634a00b00205e48cf845so3988382pjs.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 03:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Mdro6EiGbuHiRFPRYdMdhzUKRLZHxNxEXL/yW781dNg=;
        b=oCaAz4wKLPfGxgqSCoy3u3cckZj46QkRd7dfcTyOw0F5Ms90F2R7LJnUDU0D4ZTzT/
         N+V+Y3ajC/p5KFZdfHXt7LiwklvzXZVBXkvsvKL+SrN5KlFJ0Sd62Hxsft2bdDNaG/4O
         Pg8Ae+VWpc9wOvGcgKUfZ/HcuUK5F31ot3F10snSbloMO7wT/thTQ4v9ejdmBxehhrOY
         GLhKTKfRfR6QACoP5lds1jCMFbw13PGxxtNTOCGqS8B97xPD33xOd6SaUOT9PMLXvHLV
         R8l9o1isfQGtoW0QjCBOx6yCM4n2Dw9UwXqNCt3FpBlEBLIkTR1cpQbzUhMPkOIyp1gs
         16Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Mdro6EiGbuHiRFPRYdMdhzUKRLZHxNxEXL/yW781dNg=;
        b=WoKSBXsuyaEiAjl3PBn+ekfQK1BWdV6bGWXV7PSDN4vDWvFZ253RYyDhD3ruN3T/xV
         3JDX43Xsp0FYQKwufDctPWNH0yoUBlgdOIHkS4jMrPBp5/SuswZeZinCbPrfSxx0AqAR
         2PTMehVNHB4ditytZX15gqBmcHro4jckUn+tNXlESDTwGnqMwbMx/48fES9cUulTTcV3
         AnP5ELXa0LOp4NXZOxhs/51ncoTX0WatxVGaz67HaJCj0Dj0h6v7gdp3HG3OLnuVaGcx
         H0zPP4tD/y3LJ8huXoMUqfyAnJcupIT7jzhAkbSmmq6a80+sAbmisC2mFYkGXxRTo9YC
         7KcQ==
X-Gm-Message-State: ACrzQf35q/4rT14/deh7t4J5A0lPP7w4znv4+WEzFVKuVDmiIFzHXFyj
	vfz7fjpimrhEcZxsIS8C0fxERa5B+Qs=
X-Google-Smtp-Source: AMsMyM4qoaSRBwi28D2kyQ/SzMeUKnqqeTmdJGDW6HgFBCqP4NKC9uNDlnjK2+mnAMb7NlX8wQRiRw==
X-Received: by 2002:a17:902:7598:b0:178:3f96:4ffc with SMTP id j24-20020a170902759800b001783f964ffcmr4388169pll.53.1665053824170;
        Thu, 06 Oct 2022 03:57:04 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id g24-20020a632018000000b0044ed37dbca8sm1532382pgg.2.2022.10.06.03.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 03:57:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: remove the last remnants of cputime_t
Date: Thu,  6 Oct 2022 20:56:53 +1000
Message-Id: <20221006105653.115829-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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

cputime_t was a core kernel type, removed by commits
ed5c8c854f2b..b672592f0221. As explained in commit b672592f0221
("sched/cputime: Remove generic asm headers"), the final cleanup
is for the arch to provide cputime_to_nsec[s](). Commit ade7667a981b
("powerpc: Add cputime_to_nsecs()") did that, but justdidn't remove
the then-unused cputime_to_usecs(), cputime_t type, and associated
remnants.

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

