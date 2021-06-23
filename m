Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F0C3B1AB5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 15:05:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G93RM0LlFz3btK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 23:05:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=G16SYSvF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=G16SYSvF; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G93Qm1Zx8z307t
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 23:05:19 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G93Qj1lG8z9shn; Wed, 23 Jun 2021 23:05:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624453517;
 bh=2vyZt3Kg4E267YPAtAruOCah0DvzM1ACHK0GBJftCHc=;
 h=From:To:Subject:Date:From;
 b=G16SYSvFNlyc4nlYoeUz4Ml0enTlXA8LFi48+AiEe7Gr7n8aMfy1uITiRBOqujLRE
 8vhzksbun2zLKIMmFC1BNPr+JluGKdooj1bK07dI3qBMwZtTt6/6GizDrA0SD5mctz
 A884Vl7deMFA9YKTDXr2WtuUuCeKg5wjFP4kqCDQ7CyHQfjo4oMZ6kRMAQuPn3B56W
 DkEeDuXL8US7CecXhE5YsOQjIG9j/c+zugg1BwjuTyh32VHA/3C7l0zqdD+Bl9ch0r
 mTT4zXlPQhNqcb9xf0xYPXEODA0MFpanugsNeRjdyZxXPhB+DwO799QSWw/xhjIIx9
 Aw8eITUqOOJ3Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Fix is_kvm_guest() / kvm_para_available()
Date: Wed, 23 Jun 2021 23:05:14 +1000
Message-Id: <20210623130514.2543232-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit a21d1becaa3f ("powerpc: Reintroduce is_kvm_guest() as a fast-path
check") added is_kvm_guest() and changed kvm_para_available() to use it.

is_kvm_guest() checks a static key, kvm_guest, and that static key is
set in check_kvm_guest().

The problem is check_kvm_guest() is only called on pseries, and even
then only in some configurations. That means is_kvm_guest() always
returns false on all non-pseries and some pseries depending on
configuration. That's a bug.

For PR KVM guests this is noticable because they no longer do live
patching of themselves, which can be detected by the omission of a
message in dmesg such as:

  KVM: Live patching for a fast VM worked

To fix it make check_kvm_guest() an initcall, to ensure it's always
called at boot. It needs to be core so that it runs before
kvm_guest_init() which is postcore. To be an initcall it needs to return
int, where 0 means success, so update that.

We still call it manually in pSeries_smp_probe(), because that runs
before init calls are run.

Fixes: a21d1becaa3f ("powerpc: Reintroduce is_kvm_guest() as a fast-path check")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/kvm_guest.h |  4 ++--
 arch/powerpc/kernel/firmware.c       | 10 ++++++----
 arch/powerpc/platforms/pseries/smp.c |  4 +++-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_guest.h b/arch/powerpc/include/asm/kvm_guest.h
index 2fca299f7e19..c63105d2c9e7 100644
--- a/arch/powerpc/include/asm/kvm_guest.h
+++ b/arch/powerpc/include/asm/kvm_guest.h
@@ -16,10 +16,10 @@ static inline bool is_kvm_guest(void)
 	return static_branch_unlikely(&kvm_guest);
 }
 
-bool check_kvm_guest(void);
+int check_kvm_guest(void);
 #else
 static inline bool is_kvm_guest(void) { return false; }
-static inline bool check_kvm_guest(void) { return false; }
+static inline int check_kvm_guest(void) { return 0; }
 #endif
 
 #endif /* _ASM_POWERPC_KVM_GUEST_H_ */
diff --git a/arch/powerpc/kernel/firmware.c b/arch/powerpc/kernel/firmware.c
index c9e2819b095a..c7022c41cc31 100644
--- a/arch/powerpc/kernel/firmware.c
+++ b/arch/powerpc/kernel/firmware.c
@@ -23,18 +23,20 @@ EXPORT_SYMBOL_GPL(powerpc_firmware_features);
 
 #if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_GUEST)
 DEFINE_STATIC_KEY_FALSE(kvm_guest);
-bool check_kvm_guest(void)
+int __init check_kvm_guest(void)
 {
 	struct device_node *hyper_node;
 
 	hyper_node = of_find_node_by_path("/hypervisor");
 	if (!hyper_node)
-		return false;
+		return 0;
 
 	if (!of_device_is_compatible(hyper_node, "linux,kvm"))
-		return false;
+		return 0;
 
 	static_branch_enable(&kvm_guest);
-	return true;
+
+	return 0;
 }
+core_initcall(check_kvm_guest); // before kvm_guest_init()
 #endif
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index c70b4be9f0a5..096629f54576 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -211,7 +211,9 @@ static __init void pSeries_smp_probe(void)
 	if (!cpu_has_feature(CPU_FTR_SMT))
 		return;
 
-	if (check_kvm_guest()) {
+	check_kvm_guest();
+
+	if (is_kvm_guest()) {
 		/*
 		 * KVM emulates doorbells by disabling FSCR[MSGP] so msgsndp
 		 * faults to the hypervisor which then reads the instruction
-- 
2.25.1

