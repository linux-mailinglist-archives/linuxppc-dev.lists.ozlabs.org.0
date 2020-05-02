Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D333A1C24F4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:56:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DndL5JbszDqhm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:56:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W7UdLSyt; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmr42Mv1zDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:20:20 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id 7so5271691pjo.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 04:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2HyciahCFMxe6R5fKnTUUAj0hJW4ymHA2fRAQaelpsQ=;
 b=W7UdLSytigtJh66m2pNrsSZA+beoY2XGp+vCuTGjQwa93aoYrz6Sp4M+X5Mi37vBiv
 3J+1Wu4cEv8VXt7466FYeq8M0FKwDYrDJtsTBGRbnYjTPB1zMknAH/KHrx+JVx9Y5DFK
 vcSI88vHCe3XpB8qpuLBoLsEuZRffvhBpPtLlpDM5nh6CqbyAfwMCzf9Gkf75x8vQlv6
 s9BDobLe/bpb8KpjxvRZKBSDl6CKYWc5aHNHd/nKRgI4rVUihx1da3ocKh7eBNSTRY/j
 njcvlENBFcW0Gq0cqhoTodpTV/dOUuracSbRTTWGkPpzr/0xnQt7zBPC4ZOizNVluw23
 4XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2HyciahCFMxe6R5fKnTUUAj0hJW4ymHA2fRAQaelpsQ=;
 b=mq3vdjTZzvaFjhCfC3L86E8evZFgPuQuvusyJqH1TH3xJYSKS29gw4C+pANmnig9RX
 ri3tYJTAxNoMahR3+E4clbMVJF1d3F1AmxSNqtpwGx7ocgJLTivuzXd84U3NS0p/IOu/
 JJAZQ7QR3qPD+0HRbqMhAusqgtiwx58vSNkhV2c7mPHbWOpNIIRHTuBs1UsjAhiuaqud
 ajeBwLc4SyGEbvxnGsBiKS2cQI1gRWj5wdU/JReV+ekwgi4Lpg6RlsAFZwcy1igkOr0K
 d5U7VHv6bC/DnTrejL7xt+y7hVxzveZ4CIUID7cwiRuNFsYCYGp/WXEvzZ2Rgu2JRLD+
 fWYQ==
X-Gm-Message-State: AGi0PuboRKXtkA8mqD7LYHdA/J94Zee+UsvTmtMXmyFHGWhwick9J7F8
 J9s84tLBTicSzBWoyo8LKHSjhrfT
X-Google-Smtp-Source: APiQypKqhYEsHDRAKIZ2nzVmmQcqvnqkUs37l7v1xeQnXEAgQi7guPSMSMT6Nzi41LSBvHQHqTgdFw==
X-Received: by 2002:a17:902:b203:: with SMTP id
 t3mr8227311plr.276.1588418416497; 
 Sat, 02 May 2020 04:20:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q15sm3862790pgj.52.2020.05.02.04.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:20:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 09/10] powerpc/powernv: OPAL V4 OS services
Date: Sat,  2 May 2020 21:19:13 +1000
Message-Id: <20200502111914.166578-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200502111914.166578-1-npiggin@gmail.com>
References: <20200502111914.166578-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This implements OPAL_REGISTER_OS_OPS and implements the printf
service.

When this API is called, OPAL switches to V4 mode which requires
the OS to subsequently handle its program interrupts and printf
calls.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/opal-api.h        |  7 ++++-
 arch/powerpc/include/asm/opal.h            |  1 +
 arch/powerpc/platforms/powernv/opal-call.c |  1 +
 arch/powerpc/platforms/powernv/opal.c      | 36 ++++++++++++++++++++++
 4 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 0be5ff4e51b5..1b2f176677fc 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -218,7 +218,8 @@
 #define OPAL_SYM_TO_ADDR			182
 #define OPAL_REPORT_TRAP			183
 #define OPAL_FIND_VM_AREA			184
-#define OPAL_LAST				184
+#define OPAL_REGISTER_OS_OPS			185
+#define OPAL_LAST				185
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
@@ -1202,6 +1203,10 @@ struct opal_vm_area {
 	__be64  vm_flags;
 };
 
+struct opal_os_ops {
+	__be64  os_printf; /* void printf(int32_t level, const char *str) */
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __OPAL_API_H */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 199b5582b700..09985b7718b3 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -406,6 +406,7 @@ void opal_psr_init(void);
 void opal_sensor_groups_init(void);
 
 int64_t opal_find_vm_area(uint64_t addr, struct opal_vm_area *opal_vm_area);
+int64_t opal_register_os_ops(struct opal_os_ops *ops, uint64_t size);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 4bdad3d2fa18..11f419e76059 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -350,3 +350,4 @@ OPAL_CALL(opal_addr_to_sym,			OPAL_ADDR_TO_SYM);
 OPAL_CALL(opal_sym_to_addr,			OPAL_SYM_TO_ADDR);
 OPAL_CALL(opal_report_trap,			OPAL_REPORT_TRAP);
 OPAL_CALL(opal_find_vm_area,			OPAL_FIND_VM_AREA);
+OPAL_CALL(opal_register_os_ops,			OPAL_REGISTER_OS_OPS);
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 98d6d7fc5411..0fbfcd088c58 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -47,6 +47,7 @@ static LIST_HEAD(msg_list);
 
 struct mm_struct *opal_mm __read_mostly;
 bool opal_v4_present __read_mostly;
+bool opal_v4_enabled __read_mostly;
 bool opal_mm_enabled __read_mostly;
 
 /* /sys/firmware/opal */
@@ -152,6 +153,8 @@ unsigned long arch_symbol_lookup_name(const char *name)
 	return be64_to_cpu(addr);
 }
 
+static void os_printf(int32_t level, const char *str);
+
 int __init early_init_dt_scan_opal(unsigned long node,
 				   const char *uname, int depth, void *data)
 {
@@ -1045,6 +1048,28 @@ static void opal_init_heartbeat(void)
 		kopald_tsk = kthread_run(kopald, NULL, "kopald");
 }
 
+static void os_printf(int32_t level, const char *str)
+{
+	const char *l;
+
+	/* Assuming printk does not work in real mode */
+	if (WARN_ON_ONCE(!(mfmsr() & (MSR_IR|MSR_DR))))
+		return;
+
+	switch (level) {
+	case 0: l = KERN_EMERG; break;
+	case 1: l = KERN_ALERT; break;
+	case 2: l = KERN_CRIT; break;
+	case 3: l = KERN_ERR; break;
+	case 4: l = KERN_WARNING; break;
+	case 5: l = KERN_NOTICE; break;
+	case 6: l = KERN_INFO; break;
+	case 7: l = KERN_DEBUG; break;
+	default: l = KERN_ERR;
+	}
+	printk("%s[OPAL] %s", l, str);
+}
+
 static pgprot_t opal_vm_flags_to_prot(uint64_t flags)
 {
 	pgprot_t prot;
@@ -1137,6 +1162,8 @@ static int __init opal_init_early(void)
 	int rc;
 
 	if (opal_v4_present) {
+		struct opal_os_ops opal_os_ops;
+
 		if (radix_enabled()) {
 			/* Hash can't resolve SLB faults to the switched mm */
 			rc = opal_init_mm();
@@ -1144,6 +1171,15 @@ static int __init opal_init_early(void)
 				pr_warn("OPAL virtual memory init failed, firmware will run in real-mode.\n");
 			}
 		}
+
+		memset(&opal_os_ops, 0, sizeof(opal_os_ops));
+		opal_os_ops.os_printf = cpu_to_be64(&os_printf);
+		if (opal_register_os_ops(&opal_os_ops, sizeof(opal_os_ops))) {
+			pr_warn("OPAL register OS ops failed, firmware will run in v3 mode.\n");
+		} else {
+			opal_v4_enabled = true;
+			pr_warn("OPAL running in v4 mode!\n");
+		}
 	}
 
 	return 0;
-- 
2.23.0

