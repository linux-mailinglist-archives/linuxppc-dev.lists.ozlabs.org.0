Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC581B154
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 10:04:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swky12cYQz3clc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 20:04:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwkxX0lfZz2yk6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 20:03:42 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4SwkxN5mzlz9v53;
	Thu, 21 Dec 2023 10:03:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tm02GcTpcMgN; Thu, 21 Dec 2023 10:03:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Swkwl2gZCz9v9j;
	Thu, 21 Dec 2023 10:03:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 547208B788;
	Thu, 21 Dec 2023 10:03:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id g2LunAC6MO_5; Thu, 21 Dec 2023 10:03:03 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (PO25106.IDSI0.si.c-s.fr [192.168.232.169])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DB8878B765;
	Thu, 21 Dec 2023 10:03:02 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at all time
Date: Thu, 21 Dec 2023 10:02:46 +0100
Message-ID: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703149365; l=2195; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=/AIa48/U2JNmUZJkGyrwlJh42cfDMW1BNtC2uinCoaY=; b=LrnKh2JOl5Cp+V1qOy+g9kRkNM6HoOyag17kloED7mt/LyBc2hyuX4Up/SKP6y038By7URw0z /xyreKV1/AzDtiLswENNb9DcheB/ZUVRR/JTz+ksnCELBXJtMfwI597
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-modules@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Declaring rodata_enabled and mark_rodata_ro() at all time
helps removing related #ifdefery in C files.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/init.h |  4 ----
 init/main.c          | 21 +++++++--------------
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/include/linux/init.h b/include/linux/init.h
index 01b52c9c7526..d2b47be38a07 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -168,12 +168,8 @@ extern initcall_entry_t __initcall_end[];
 
 extern struct file_system_type rootfs_fs_type;
 
-#if defined(CONFIG_STRICT_KERNEL_RWX) || defined(CONFIG_STRICT_MODULE_RWX)
 extern bool rodata_enabled;
-#endif
-#ifdef CONFIG_STRICT_KERNEL_RWX
 void mark_rodata_ro(void);
-#endif
 
 extern void (*late_time_init)(void);
 
diff --git a/init/main.c b/init/main.c
index e24b0780fdff..807df08c501f 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1396,10 +1396,9 @@ static int __init set_debug_rodata(char *str)
 early_param("rodata", set_debug_rodata);
 #endif
 
-#ifdef CONFIG_STRICT_KERNEL_RWX
 static void mark_readonly(void)
 {
-	if (rodata_enabled) {
+	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) && rodata_enabled) {
 		/*
 		 * load_module() results in W+X mappings, which are cleaned
 		 * up with call_rcu().  Let's make sure that queued work is
@@ -1409,20 +1408,14 @@ static void mark_readonly(void)
 		rcu_barrier();
 		mark_rodata_ro();
 		rodata_test();
-	} else
+	} else if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
 		pr_info("Kernel memory protection disabled.\n");
+	} else if (IS_ENABLED(CONFIG_ARCH_HAS_STRICT_KERNEL_RWX)) {
+		pr_warn("Kernel memory protection not selected by kernel config.\n");
+	} else {
+		pr_warn("This architecture does not have kernel memory protection.\n");
+	}
 }
-#elif defined(CONFIG_ARCH_HAS_STRICT_KERNEL_RWX)
-static inline void mark_readonly(void)
-{
-	pr_warn("Kernel memory protection not selected by kernel config.\n");
-}
-#else
-static inline void mark_readonly(void)
-{
-	pr_warn("This architecture does not have kernel memory protection.\n");
-}
-#endif
 
 void __weak free_initmem(void)
 {
-- 
2.41.0

