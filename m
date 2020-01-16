Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DA913FA88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 21:25:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zG096x6JzDqpd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 07:25:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=Kxs0ezyw; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zBkw08bgzDqf0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:58:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47zBkm2LMgz9v0MV;
 Thu, 16 Jan 2020 18:58:24 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Kxs0ezyw; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ni5IDxU2PZjV; Thu, 16 Jan 2020 18:58:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47zBkm19zpz9v0MQ;
 Thu, 16 Jan 2020 18:58:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579197504; bh=PWRUMcmoHAjONpDuJZiavA8lZ2SQsMCwaOs7HJNDLqQ=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Kxs0ezywgzeua1J6Nz2TH6hRDY686ycC0eBvlT+7VEaf6BG1OMSaTqx3ZNlzL7Dmz
 GOomaHsGdxWUoegNBMPuu9onZpq1TYLSdQDZtpQNH2tlc65PLxh72kb0MscKCVKpF5
 /iR0akD7SHPV0Z7uztGRM/gxxxo2UJ/f+WVDgXqE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C7B508B82D;
 Thu, 16 Jan 2020 18:58:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YBr-0Bk7q74Z; Thu, 16 Jan 2020 18:58:25 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 86BA18B82C;
 Thu, 16 Jan 2020 18:58:25 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 606F564A35; Thu, 16 Jan 2020 17:58:25 +0000 (UTC)
Message-Id: <ea5531da61c0ede78226b4f6f0ee595be25c4309.1579196675.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1579196675.git.christophe.leroy@c-s.fr>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v4 01/11] powerpc/64: Don't provide time functions in
 compat VDSO32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 nathanl@linux.ibm.com, arnd@arndb.de, tglx@linutronix.de,
 vincenzo.frascino@arm.com, luto@kernel.org
Date: Thu, 16 Jan 2020 17:58:25 +0000 (UTC)
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
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to allow use of generic C VDSO, remove time functions
from the 32 bits VDSO on PPC64.

This (temporary) removal is needed because powerpc kernel C headers
are not prepared for building 32 bits code on PPC64.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/vdso32/Makefile     | 3 ++-
 arch/powerpc/kernel/vdso32/vdso32.lds.S | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 06f54d947057..738d52105392 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -3,7 +3,8 @@
 # List of files in the vdso, has to be asm only for now
 
 obj-vdso32-$(CONFIG_PPC64) = getcpu.o
-obj-vdso32 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o \
+obj-vdso32-$(CONFIG_PPC32) = gettimeofday.o
+obj-vdso32 = sigtramp.o datapage.o cacheflush.o note.o \
 		$(obj-vdso32-y)
 
 # Build rules
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 00c025ba4a92..9400b182e163 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -144,7 +144,7 @@ VERSION
 		__kernel_datapage_offset;
 
 		__kernel_get_syscall_map;
-#ifndef CONFIG_PPC_BOOK3S_601
+#if defined(CONFIG_PPC32) && !defined(CONFIG_PPC_BOOK3S_601)
 		__kernel_gettimeofday;
 		__kernel_clock_gettime;
 		__kernel_clock_getres;
-- 
2.13.3

