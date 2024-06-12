Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A994D904AD3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:24:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f/2X5Ok1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzYrh4gSrz3cTp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 15:24:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f/2X5Ok1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzYqD4KClz3cTS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:23:36 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-6c5a6151ff8so4964009a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718169814; x=1718774614; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LYx9pWe+IXQn9iXJjFIm9X9Ha+gW+XiixBi0YYKAco=;
        b=f/2X5Ok1HpcE2aE5GHpR+kylpevotZVTlkXOWFGkU6jeJd/e0K5Ztm2KG78QrAv0rv
         eiF+6PlZ+PJgxtFC9MYqRpWDPQUd0G5jslgBY+BCP8VCkv3nIgogdgcf/Zz5PiKtvsUh
         u9UGJ/Z1vvVq6LfWTSP7Z/+yHmeE0RM0f5uSVWYSA8XISNgobrTiRP96yrrbnV7G661+
         9L1pSKe4xiyscIo68NR80VyxahJW0d0/sx7wjfdj7WWFfRnMFCYSfn3C0D4ZKWL8KBlQ
         2aRfpqOqmXaAVeE+GRo3Mp9jJrftozNZXJ1f9M87eDs/RKUPa9tDZGXBCm1cwsnJ709f
         c2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169814; x=1718774614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LYx9pWe+IXQn9iXJjFIm9X9Ha+gW+XiixBi0YYKAco=;
        b=SVpo9v5Ran5wKLeAvARquk+IYbRcAYuMY9RO6SpDt8KIoz+8i+9dzrIez7eNp0SJJu
         SWeg+Embq1jVLvaNo0aQiTg49jkB2gk3ay5esmD/o5hpcHV3o2KVGailpKhZ+muTdAO4
         AUjW6ezTgdGIYg5vN3xrL6/4e26taUciS808GKV8Fc5qTp3vFo1PxmBRka+dXbnlYLb0
         mqtlrrr73ltetmWaH6sXaPEhkurkjjT6HQFc/KRKxsEhEEYRf3AaHHeqFI/vo0Bk2YWT
         KB9FfEUPNU1IxOIxYOMONkpUyUQYB1F+js/wzZ9rsNNLrMA79D8pftV+xzET8/IjW05G
         sn6g==
X-Forwarded-Encrypted: i=1; AJvYcCU8z1kqUdlk5Ln5yrx9cRitqAdlieU3iuPwhso2sRkguHypCyOnlnmuIcRApSAt4rVNnHIYHTSjWv7JdWoGDVas+U8aRyDqDGKX28LLug==
X-Gm-Message-State: AOJu0YzhacX+MGyXIuPnl1mdb3a7Yee8+9OAkioPrCjC+ynkND/75XE4
	sL1+B0nMWvn7WYGNS30vQPNHU043+wO4cUhHST+MkxWAkr8gmAtF47YuTQ==
X-Google-Smtp-Source: AGHT+IFKLAKOMwGgrW3gptnRK9NG8WToNY0soeikvGZ3tFM78QRkaQ5c6Eratbtmd2B75aByNiO65g==
X-Received: by 2002:a05:6a20:8402:b0:1b5:8d94:907a with SMTP id adf61e73a8af0-1b8a9b9e15amr986922637.14.1718169814157;
        Tue, 11 Jun 2024 22:23:34 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f711sm112170705ad.11.2024.06.11.22.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:23:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v10 01/15] powerpc: Add facility to query TCG or KVM host
Date: Wed, 12 Jun 2024 15:23:06 +1000
Message-ID: <20240612052322.218726-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612052322.218726-1-npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use device tree properties to determine whether KVM or TCG is in
use.

Logically these are not the inverse of one another, because KVM can run
on a TCG processor (if TCG is emulating HV mode, or it is using the
nested hypervisor APIs in pseries / spapr). And kvm-unit-tests can run
on that KVM.

This can be a problem because some issues relate to TCG CPU emulation
some to the spapr hypervisor implementation, some to KVM, some to real
hardware, so the TCG test is best-effort for now and is set to the
opposite of KVM. The two independent variables are added because we may
be able to more accurately determine this in future.

Use this facility to restrict some of the known test failures to TCG.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h |  3 +++
 lib/powerpc/setup.c         | 26 ++++++++++++++++++++++++++
 powerpc/interrupts.c        |  6 ++++--
 powerpc/sprs.c              |  2 +-
 powerpc/tm.c                |  2 +-
 5 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index a3859b5d4..a660344cb 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -10,6 +10,9 @@ void handle_exception(int trap, void (*func)(struct pt_regs *, void *), void *);
 void do_handle_exception(struct pt_regs *regs);
 #endif /* __ASSEMBLY__ */
 
+extern bool host_is_tcg;
+extern bool host_is_kvm;
+
 extern bool cpu_has_hv;
 extern bool cpu_has_power_mce;
 extern bool cpu_has_siar;
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 622b99e5d..86e2e144c 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -208,6 +208,9 @@ void cpu_init(struct cpu *cpu, int cpu_id)
 	cpu->exception_stack += SZ_64K - 64;
 }
 
+bool host_is_tcg;
+bool host_is_kvm;
+
 void setup(const void *fdt)
 {
 	void *freemem = &stacktop;
@@ -259,6 +262,29 @@ void setup(const void *fdt)
 	assert(ret == 0);
 	freemem += fdt_size;
 
+	if (!fdt_node_check_compatible(fdt, 0, "qemu,pseries")) {
+		assert(!cpu_has_hv);
+
+		/*
+		 * host_is_tcg incorrectly does not get set when running
+		 * KVM on a TCG host (using powernv HV emulation or spapr
+		 * nested HV).
+		 */
+		ret = fdt_subnode_offset(fdt, 0, "hypervisor");
+		if (ret < 0) {
+			host_is_tcg = true;
+			host_is_kvm = false;
+		} else {
+			/* KVM is the only supported hypervisor */
+			assert(!fdt_node_check_compatible(fdt, ret, "linux,kvm"));
+			host_is_tcg = false;
+			host_is_kvm = true;
+		}
+	} else {
+		assert(cpu_has_hv);
+		host_is_tcg = true;
+		host_is_kvm = false;
+	}
 	ret = dt_get_initrd(&tmp, &initrd_size);
 	assert(ret == 0 || ret == -FDT_ERR_NOTFOUND);
 	if (ret == 0) {
diff --git a/powerpc/interrupts.c b/powerpc/interrupts.c
index 552c48ef2..3e3622e59 100644
--- a/powerpc/interrupts.c
+++ b/powerpc/interrupts.c
@@ -72,7 +72,8 @@ static void test_mce(void)
 	is_fetch = false;
 	asm volatile("lbz %0,0(%1)" : "=r"(tmp) : "r"(addr));
 
-	report(got_interrupt, "MCE on access to invalid real address");
+	/* KVM does not MCE on access outside partition scope */
+	report_kfail(host_is_kvm, got_interrupt, "MCE on access to invalid real address");
 	if (got_interrupt) {
 		report(mfspr(SPR_DAR) == addr, "MCE sets DAR correctly");
 		if (cpu_has_power_mce)
@@ -82,7 +83,8 @@ static void test_mce(void)
 
 	is_fetch = true;
 	asm volatile("mtctr %0 ; bctrl" :: "r"(addr) : "ctr", "lr");
-	report(got_interrupt, "MCE on fetch from invalid real address");
+	/* KVM does not MCE on access outside partition scope */
+	report_kfail(host_is_kvm, got_interrupt, "MCE on fetch from invalid real address");
 	if (got_interrupt) {
 		report(recorded_regs.nip == addr, "MCE sets SRR0 correctly");
 		if (cpu_has_power_mce)
diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index a85011ad5..dc810b8da 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -590,7 +590,7 @@ int main(int argc, char **argv)
 
 		if (sprs[i].width == 32 && !(before[i] >> 32) && !(after[i] >> 32)) {
 			/* known failure KVM migration of CTRL */
-			report_kfail(i == 136, pass,
+			report_kfail(host_is_kvm && i == 136, pass,
 				"%-10s(%4d):\t        0x%08lx <==>         0x%08lx",
 				sprs[i].name, i,
 				before[i], after[i]);
diff --git a/powerpc/tm.c b/powerpc/tm.c
index 507eaf492..d4f436147 100644
--- a/powerpc/tm.c
+++ b/powerpc/tm.c
@@ -135,7 +135,7 @@ int main(int argc, char **argv)
 	}
 	/* kvm-unit-tests can limit number of CPUs present */
 	/* KVM does not report TM in secondary threads in POWER9 */
-	report_kfail(true, cpus_with_tm >= nr_cpus_present,
+	report_kfail(host_is_kvm, cpus_with_tm >= nr_cpus_present,
 	       "TM available in all 'ibm,pa-features' properties");
 
 	all = argc == 1 || !strcmp(argv[1], "all");
-- 
2.45.1

