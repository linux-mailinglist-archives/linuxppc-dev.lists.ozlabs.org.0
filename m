Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEE417B4BF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 03:59:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YXPw06f5zDqwr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 13:59:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YXMl4nZNzDqgk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 13:57:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=fgJdQRG8; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48YXMl24Y3z9sPJ;
 Fri,  6 Mar 2020 13:57:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1583463427; bh=jpjw5OFah6kEPVNVvcpiQA3pv8k2QyMsCs3Mb1RKBHw=;
 h=Date:From:To:Cc:Subject:From;
 b=fgJdQRG80ReVgf4vrhLIVyV2vqusF1qUmsRm14QvvudCsNZqYp16J32jK9BtT2soI
 j3kPzEvgq9Afr8BClb+7cxoYky/YeF2nt/KvdSOrX/vSsYuO7o3W7p3Zt8lJo0G+S3
 8zhycTEKsbK2XOhY+M429vbC8x4ZbfcoWKEqteCbcy0dzRQAmkq4dPCStUKaMAe8qy
 JfFlFEaBDFlbFR3Y9PEGgJUPZvJa3XuyBhfrGtL1pAr2K2Jofda5X5iJxkZ9BFl4g/
 PnYXrV1xTT8IbppKpyhGjRKD/nkapjPX5eCMWD/oTK/D3KBOKlyRrA06JKxf6VIl3u
 t+nIoz5l2A96g==
Date: Fri, 6 Mar 2020 13:57:05 +1100
From: Anton Blanchard <anton@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/vdso: Fix multiple issues with sys_call_table
Message-ID: <20200306135705.7f80fcad@kryten.localdomain>
X-Mailer: Mutt/1.8.0 (2017-02-23)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

The VDSO exports a bitmap of valid syscalls. vdso_setup_syscall_map()
sets this up, but there are both little and big endian bugs. The issue
is with:

       if (sys_call_table[i] != sys_ni_syscall)

On little endian, instead of comparing pointers to the two functions,
we compare the first two instructions of each function. If a function
happens to have the same first two instructions as sys_ni_syscall, then
we have a spurious match and mark the instruction as not implemented.
Fix this by removing the inline declarations.

On big endian we have a further issue where sys_ni_syscall is a function
descriptor and sys_call_table[] holds pointers to the instruction text.
Fix this by using dereference_kernel_function_descriptor().

Cc: stable@vger.kernel.org
Signed-off-by: Anton Blanchard <anton@ozlabs.org>

---
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index b9a108411c0d..d186b729026e 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -17,6 +17,7 @@
 #include <linux/elf.h>
 #include <linux/security.h>
 #include <linux/memblock.h>
+#include <linux/syscalls.h>
 
 #include <asm/pgtable.h>
 #include <asm/processor.h>
@@ -30,6 +31,7 @@
 #include <asm/vdso.h>
 #include <asm/vdso_datapage.h>
 #include <asm/setup.h>
+#include <asm/syscall.h>
 
 #undef DEBUG
 
@@ -644,19 +646,16 @@ static __init int vdso_setup(void)
 static void __init vdso_setup_syscall_map(void)
 {
 	unsigned int i;
-	extern unsigned long *sys_call_table;
-#ifdef CONFIG_PPC64
-	extern unsigned long *compat_sys_call_table;
-#endif
-	extern unsigned long sys_ni_syscall;
+	unsigned long ni_syscall;
 
+	ni_syscall = (unsigned long)dereference_kernel_function_descriptor(sys_ni_syscall);
 
 	for (i = 0; i < NR_syscalls; i++) {
 #ifdef CONFIG_PPC64
-		if (sys_call_table[i] != sys_ni_syscall)
+		if (sys_call_table[i] != ni_syscall)
 			vdso_data->syscall_map_64[i >> 5] |=
 				0x80000000UL >> (i & 0x1f);
-		if (compat_sys_call_table[i] != sys_ni_syscall)
+		if (compat_sys_call_table[i] != ni_syscall)
 			vdso_data->syscall_map_32[i >> 5] |=
 				0x80000000UL >> (i & 0x1f);
 #else /* CONFIG_PPC64 */
