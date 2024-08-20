Return-Path: <linuxppc-dev+bounces-222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C0A9585CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 13:28:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp6fB2NGZz2xy7;
	Tue, 20 Aug 2024 21:28:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp6fB010cz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 21:28:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wp6f24sJjz9sSK;
	Tue, 20 Aug 2024 13:28:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FMbKl540KsHO; Tue, 20 Aug 2024 13:28:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wp6f243Xwz9sSH;
	Tue, 20 Aug 2024 13:28:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C6168B778;
	Tue, 20 Aug 2024 13:28:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nbey0QpDfNSf; Tue, 20 Aug 2024 13:28:10 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.72])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 275298B763;
	Tue, 20 Aug 2024 13:28:10 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/vdso: Don't discard rela sections
Date: Tue, 20 Aug 2024 13:28:07 +0200
Message-ID: <45c3e6fc76cad05ad2cac0f5b5dfb4fae86dc9d6.1724153239.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724153287; l=2140; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=7B8+M/Fb75kjCItR5+3I02za1jo5KRize8Lpna3H3iY=; b=1rZ7EVC/17O6gwXBouEqcHmQ7k3Lf6P8XwMTqcqXvN+N1nrKYKx7Q5v2URHH2+jgNG5XjW2CU lItGiILDyqtCwpsWl1eF8SHUM7KUkxOQ4VGA+wUNhUJpYe/J13G2v1E
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

After building the VDSO, there is a verification that it contains
no dynamic relocation, see commit aff69273af61 ("vdso: Improve
cmd_vdso_check to check all dynamic relocations").

This verification uses readelf -r and doesn't work if rela sections
are discarded.

Fixes: 8ad57add77d3 ("powerpc/build: vdso linker warning for orphan sections")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Was part of series "Wire up getrandom() vDSO implementation on powerpc" but
it is not directly related and should be fixed independantly as it may happen
already, for instance if the compiler wants rest_gpr30 instead of rest_gpr31.
---
 arch/powerpc/kernel/vdso/vdso32.lds.S | 4 +++-
 arch/powerpc/kernel/vdso/vdso64.lds.S | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index 426e1ccc6971..8f57107000a2 100644
--- a/arch/powerpc/kernel/vdso/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
@@ -74,6 +74,8 @@ SECTIONS
 	.got		: { *(.got) }			:text
 	.plt		: { *(.plt) }
 
+	.rela.dyn	: { *(.rela .rela*) }
+
 	_end = .;
 	__end = .;
 	PROVIDE(end = .);
@@ -87,7 +89,7 @@ SECTIONS
 		*(.branch_lt)
 		*(.data .data.* .gnu.linkonce.d.* .sdata*)
 		*(.bss .sbss .dynbss .dynsbss)
-		*(.got1 .glink .iplt .rela*)
+		*(.got1 .glink .iplt)
 	}
 }
 
diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
index bda6c8cdd459..400819258c06 100644
--- a/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -69,7 +69,7 @@ SECTIONS
 	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
 	.eh_frame	: { KEEP (*(.eh_frame)) }	:text
 	.gcc_except_table : { *(.gcc_except_table) }
-	.rela.dyn ALIGN(8) : { *(.rela.dyn) }
+	.rela.dyn ALIGN(8) : { *(.rela .rela*) }
 
 	.got ALIGN(8)	: { *(.got .toc) }
 
@@ -86,7 +86,7 @@ SECTIONS
 		*(.data .data.* .gnu.linkonce.d.* .sdata*)
 		*(.bss .sbss .dynbss .dynsbss)
 		*(.opd)
-		*(.glink .iplt .plt .rela*)
+		*(.glink .iplt .plt)
 	}
 }
 
-- 
2.44.0


