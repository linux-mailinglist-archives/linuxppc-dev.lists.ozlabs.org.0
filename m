Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B2322DB9B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 05:58:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDq171VFvzDrqB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 13:58:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kc5uO4cr; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDpsz0fTTzF0X4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 13:52:22 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id d4so7530903pgk.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 20:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mP8fwMzDz+zf7SJGclqA6IKQezLUGhUA0/W1tyd1LDQ=;
 b=kc5uO4cr2sX40sV0z9EylrlZXXvHQRrh7drF1njZfhDbZKV2Z9kBAYZzBPfEja9Cad
 RMqlcpGjYZhCOP9szSt44B/XTtw9TfbykZnHdmPLlw8VhQkI3y98YAgmUOf+PeZn801y
 L/lFx/1T5byIQbw8jOLrc2vNlPT6eqDCQqfzguyo3LaCvBOE+Xy0I3E99g2OasQpTGwk
 tSQ+fUvUTJWRhA5K7ZjLxLxL4gfx7cShbcbTecYv6PqHoJZYJ8UNkNBGEWBrkrRiT89S
 Wp5Ig7epW9TFAB502lHaAT52qVfVSnj5c7kQDAy0cOa19GZmyjOJCIgtTlSeCWOx/8gP
 IYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mP8fwMzDz+zf7SJGclqA6IKQezLUGhUA0/W1tyd1LDQ=;
 b=QI5oy00RejovduOZSUKVX+9vCkP8p/gT3mTFrNX2lXr0zczQWVDYyFJeGrOHbbM3Ju
 TSu6ksKxq6u4ZssvZ4w1pPeriXuLr5aP61vkdAyY0e/VeYHv6IJkiblqRpYOj4ux2rBy
 EBNX4LSptRCOgi2bzoCarJW/NL6ZnlbS8h4IV7KR8Od3mEwEvVKe3bF9guQaqOSgQyjH
 kTBsAKoqJPiXYrVfVVy/HOOto8D4g/yYJ7emYk8LiDwBf1ENg4FE7FeqJb/LX0ZAfLOb
 4LZFQhtDnEGqCgYcRoAlTuyvB1TvN2zFZ3vQLTvvq6tl76c9zxciiL5ejnKTZMZqDS6J
 MF7g==
X-Gm-Message-State: AOAM530mneNxkOg505r5uGObLAO+aPRYxV/Q/lJjvut1XMstOudTRCxw
 J7frz9ORRKM1/ZXwdKl9ozGjf9cC
X-Google-Smtp-Source: ABdhPJwQZvL4gPT4jiHhrKX5YH6mvIWXl5tvzq7dcrp/yDRkLTuIppEmEMVEmpCxh8r0sUqKuU155A==
X-Received: by 2002:a63:531e:: with SMTP id h30mr13921733pgb.165.1595735540686; 
 Sat, 25 Jul 2020 20:52:20 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au.
 [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id p1sm3638860pjp.10.2020.07.25.20.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 20:52:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/3] powerpc/pseries: Add KVM guest doorbell restrictions
Date: Sun, 26 Jul 2020 13:51:55 +1000
Message-Id: <20200726035155.1424103-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200726035155.1424103-1-npiggin@gmail.com>
References: <20200726035155.1424103-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Anton Blanchard <anton@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM guests have certain restrictions and performance quirks when using
doorbells. This patch moves the EPAPR KVM guest test so it can be shared
with PSERIES, and uses that in doorbell setup code to apply the KVM
guest quirks and  improves IPI performance for two cases:

 - PowerVM guests may now use doorbells even if they are secure.

 - KVM guests no longer use doorbells if XIVE is available.

There is a valid complaint that "KVM guest" is not a very reasonable
thing to test for, it's preferable for the hypervisor to advertise
particular behaviours to the guest so they could change if the
hypervisor implementation or configuration changes. However in this case
we were already assuming a KVM guest worst case, so this patch is about
containing those quirks. If KVM later advertises fast doorbells, we
should test for that and override the quirks.

Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/firmware.h  |  6 +++++
 arch/powerpc/include/asm/kvm_para.h  | 26 +++----------------
 arch/powerpc/kernel/Makefile         |  5 ++--
 arch/powerpc/kernel/firmware.c       | 19 ++++++++++++++
 arch/powerpc/platforms/pseries/smp.c | 38 +++++++++++++++++-----------
 5 files changed, 53 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 6003c2e533a0..f67efbaba17f 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -132,6 +132,12 @@ extern int ibm_nmi_interlock_token;
 
 extern unsigned int __start___fw_ftr_fixup, __stop___fw_ftr_fixup;
 
+#if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_GUEST)
+bool is_kvm_guest(void);
+#else
+static inline bool is_kvm_guest(void) { return false; }
+#endif
+
 #ifdef CONFIG_PPC_PSERIES
 void pseries_probe_fw_features(void);
 #else
diff --git a/arch/powerpc/include/asm/kvm_para.h b/arch/powerpc/include/asm/kvm_para.h
index 9c1f6b4b9bbf..744612054c94 100644
--- a/arch/powerpc/include/asm/kvm_para.h
+++ b/arch/powerpc/include/asm/kvm_para.h
@@ -8,35 +8,15 @@
 #ifndef __POWERPC_KVM_PARA_H__
 #define __POWERPC_KVM_PARA_H__
 
-#include <uapi/asm/kvm_para.h>
-
-#ifdef CONFIG_KVM_GUEST
-
-#include <linux/of.h>
-
-static inline int kvm_para_available(void)
-{
-	struct device_node *hyper_node;
-
-	hyper_node = of_find_node_by_path("/hypervisor");
-	if (!hyper_node)
-		return 0;
+#include <asm/firmware.h>
 
-	if (!of_device_is_compatible(hyper_node, "linux,kvm"))
-		return 0;
-
-	return 1;
-}
-
-#else
+#include <uapi/asm/kvm_para.h>
 
 static inline int kvm_para_available(void)
 {
-	return 0;
+	return IS_ENABLED(CONFIG_KVM_GUEST) && is_kvm_guest();
 }
 
-#endif
-
 static inline unsigned int kvm_arch_para_features(void)
 {
 	unsigned long r;
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 244542ae2a91..852164439dcb 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -45,11 +45,10 @@ obj-y				:= cputable.o syscalls.o \
 				   signal.o sysfs.o cacheinfo.o time.o \
 				   prom.o traps.o setup-common.o \
 				   udbg.o misc.o io.o misc_$(BITS).o \
-				   of_platform.o prom_parse.o
+				   of_platform.o prom_parse.o firmware.o
 obj-y				+= ptrace/
 obj-$(CONFIG_PPC64)		+= setup_64.o \
-				   paca.o nvram_64.o firmware.o note.o \
-				   syscall_64.o
+				   paca.o nvram_64.o note.o syscall_64.o
 obj-$(CONFIG_COMPAT)		+= sys_ppc32.o signal_32.o
 obj-$(CONFIG_VDSO32)		+= vdso32/
 obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
diff --git a/arch/powerpc/kernel/firmware.c b/arch/powerpc/kernel/firmware.c
index cc4a5e3f51f1..fe48d319d490 100644
--- a/arch/powerpc/kernel/firmware.c
+++ b/arch/powerpc/kernel/firmware.c
@@ -11,8 +11,27 @@
 
 #include <linux/export.h>
 #include <linux/cache.h>
+#include <linux/of.h>
 
 #include <asm/firmware.h>
 
+#ifdef CONFIG_PPC64
 unsigned long powerpc_firmware_features __read_mostly;
 EXPORT_SYMBOL_GPL(powerpc_firmware_features);
+#endif
+
+#if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_GUEST)
+bool is_kvm_guest(void)
+{
+	struct device_node *hyper_node;
+
+	hyper_node = of_find_node_by_path("/hypervisor");
+	if (!hyper_node)
+		return 0;
+
+	if (!of_device_is_compatible(hyper_node, "linux,kvm"))
+		return 0;
+
+	return 1;
+}
+#endif
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index 67e6ad5076ce..7af0003b40b6 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -236,24 +236,32 @@ static __init void pSeries_smp_probe(void)
 	if (!cpu_has_feature(CPU_FTR_SMT))
 		return;
 
-	/*
-	 * KVM emulates doorbells by disabling FSCR[MSGP] so msgsndp faults
-	 * to the hypervisor which then reads the instruction from guest
-	 * memory. This can't be done if the guest is secure, so don't use
-	 * doorbells in secure guests.
-	 *
-	 * Under PowerVM, FSCR[MSGP] is enabled so doorbells could be used
-	 * by secure guests if we distinguished this from KVM.
-	 */
-	if (is_secure_guest())
-		return;
+	if (is_kvm_guest()) {
+		/*
+		 * KVM emulates doorbells by disabling FSCR[MSGP] so msgsndp
+		 * faults to the hypervisor which then reads the instruction
+		 * from guest memory, which tends to be slower than using XIVE.
+		 */
+		if (xive_enabled())
+			return;
+
+		/*
+		 * XICS hcalls aren't as fast, so we can use msgsndp (which
+		 * also helps exercise KVM emulation), however KVM can't
+		 * emulate secure guests because it can't read the instruction
+		 * out of their memory.
+		 */
+		if (is_secure_guest())
+			return;
+	}
 
 	/*
-	 * The guest can use doobells for SMT sibling IPIs, which stay in
-	 * the core rather than going to the interrupt controller. This
-	 * tends to be slower under KVM where doorbells are emulated, but
-	 * faster for PowerVM where they're enabled.
+	 * Under PowerVM, FSCR[MSGP] is enabled as guest vCPU siblings are
+	 * gang scheduled on the same physical core, so doorbells are always
+	 * faster than the interrupt controller, and they can be used by
+	 * secure guests.
 	 */
+
 	ic_cause_ipi = smp_ops->cause_ipi;
 	smp_ops->cause_ipi = dbell_or_ic_cause_ipi;
 }
-- 
2.23.0

