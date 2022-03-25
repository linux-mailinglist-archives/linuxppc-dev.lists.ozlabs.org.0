Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30454E6E36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 07:33:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPsj9402Tz30HJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 17:33:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPshl1tpLz2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 17:32:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KPshc6CGzz9sSg;
 Fri, 25 Mar 2022 07:32:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcJddXA699EP; Fri, 25 Mar 2022 07:32:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KPshc58pBz9sSY;
 Fri, 25 Mar 2022 07:32:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 95B578B780;
 Fri, 25 Mar 2022 07:32:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id b2q8qNEYZCZ9; Fri, 25 Mar 2022 07:32:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 693648B763;
 Fri, 25 Mar 2022 07:32:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22P6WPw01929871
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 07:32:25 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22P6WOAi1929870;
 Fri, 25 Mar 2022 07:32:24 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Subject: [PATCH v2] MAINTAINERS: Enlarge coverage of TRACING inside
 architectures
Date: Fri, 25 Mar 2022 07:32:21 +0100
Message-Id: <e8338c0ad0e73991cbd8f31c215b16ea4efe212d.1648189904.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648189940; l=2471; s=20211009;
 h=from:subject:message-id; bh=yGp7FFa7HBbJp8rR4opj6dC3eUxH51ufjaS0fMwDaXA=;
 b=tn1cBoMKwSgWqRA31d1a6NhUAlf4APNizNT1B/nujBxHIRYNT9kz14hfxWscDnYT5g85WT/24Uoj
 G3b+uJI/Cz5y19M8c+1y+Y/pO1eo7lPcQ1IGcNjLsS+CvDG7RRMI
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most architectures have ftrace related stuff in arch/*/kernel/ftrace.c
but powerpc has it spread in multiple files located in
arch/powerpc/kernel/trace/
In several architectures, there are also additional files containing
'ftrace' as part of the name but with some prefix or suffix.

Use wildcards to enlarge coverage.

With arch/*/*/*/*ftrace*:
	arch/alpha/include/asm/ftrace.h
	arch/arm64/include/asm/ftrace.h
	arch/arm/include/asm/ftrace.h
	arch/csky/include/asm/ftrace.h
	arch/csky/kernel/probes/ftrace.c
	arch/ia64/include/asm/ftrace.h
	arch/m68k/include/asm/ftrace.h
	arch/microblaze/include/asm/ftrace.h
	arch/mips/include/asm/ftrace.h
	arch/nds32/include/asm/ftrace.h
	arch/parisc/include/asm/ftrace.h
	arch/powerpc/include/asm/ftrace.h
	arch/powerpc/kernel/trace/ftrace_64_pg.S
	arch/powerpc/kernel/trace/ftrace.c
	arch/powerpc/kernel/trace/ftrace_low.S
	arch/powerpc/kernel/trace/ftrace_mprofile.S
	arch/riscv/include/asm/ftrace.h
	arch/riscv/kernel/probes/ftrace.c
	arch/s390/include/asm/ftrace.h
	arch/s390/include/asm/ftrace.lds.h
	arch/sh/include/asm/ftrace.h
	arch/sparc/include/asm/ftrace.h
	arch/x86/include/asm/ftrace.h
	arch/x86/kernel/kprobes/ftrace.c
	arch/xtensa/include/asm/ftrace.h

With arch/*/*/*ftrace*:
	arch/arm64/kernel/entry-ftrace.S
	arch/arm64/kernel/ftrace.c
	arch/arm/kernel/entry-ftrace.S
	arch/arm/kernel/ftrace.c
	arch/csky/kernel/ftrace.c
	arch/ia64/kernel/ftrace.c
	arch/microblaze/kernel/ftrace.c
	arch/mips/kernel/ftrace.c
	arch/nds32/kernel/ftrace.c
	arch/parisc/kernel/ftrace.c
	arch/powerpc/kernel/kprobes-ftrace.c
	arch/riscv/kernel/ftrace.c
	arch/s390/kernel/ftrace.c
	arch/s390/kernel/ftrace.h
	arch/sh/kernel/ftrace.c
	arch/sparc/kernel/ftrace.c
	arch/x86/kernel/ftrace_32.S
	arch/x86/kernel/ftrace_64.S
	arch/x86/kernel/ftrace.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e127c2fb08a7..e03c471fcd73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19590,8 +19590,8 @@ M:	Ingo Molnar <mingo@redhat.com>
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git
 F:	Documentation/trace/ftrace.rst
-F:	arch/*/*/*/ftrace.h
-F:	arch/*/kernel/ftrace.c
+F:	arch/*/*/*/*ftrace*
+F:	arch/*/*/*ftrace*
 F:	fs/tracefs/
 F:	include/*/ftrace.h
 F:	include/linux/trace*.h
-- 
2.35.1

