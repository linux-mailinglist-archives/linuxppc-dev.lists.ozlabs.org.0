Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E7C43B35E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 15:49:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdtTQ0yRBz3bjC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 00:48:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdtSz0fjRz2yLv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 00:48:34 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4HdtSv29bWz9s33;
 Tue, 26 Oct 2021 15:48:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEubgNQj05Kl; Tue, 26 Oct 2021 15:48:31 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.149])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by pegase1.c-s.fr (Postfix) with ESMTPS id 4HdtSs65MJz9s2p;
 Tue, 26 Oct 2021 15:48:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19QDmTSo008371
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 15:48:29 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19QDmTEb008370;
 Tue, 26 Oct 2021 15:48:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3] powerpc/boot: Set LC_ALL=C in wrapper script
Date: Tue, 26 Oct 2021 15:48:29 +0200
Message-Id: <a9ff3bc98035f63b122c051f02dc47c7aed10430.1635256089.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635256108; l=2449; s=20211009;
 h=from:subject:message-id; bh=xZ0rGjGP56sOdSPMSs1kgCpiDc1GM8DbeevvhKq0/uE=;
 b=Z6mpj2Pdaog41vslEG+aG0Glmbja4AIHN4KNRNegZIhSvulWH0b0+YxZESRB38O7+h8pcjoseybB
 xsrpqvRBDIzhGd5dpG3sqXAewXx0CmSmsyOZ07EpKG6FkFATAWe4
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

While trying to build a simple Image for ACADIA platform, I got the
following error:

	  WRAP    arch/powerpc/boot/simpleImage.acadia
	INFO: Uncompressed kernel (size 0x6ae7d0) overlaps the address of the wrapper(0x400000)
	INFO: Fixing the link_address of wrapper to (0x700000)
	powerpc64-linux-gnu-ld : mode d'émulation non reconnu : -T
	Émulations prises en charge : elf64ppc elf32ppc elf32ppclinux elf32ppcsim elf64lppc elf32lppc elf32lppclinux elf32lppcsim
	make[1]: *** [arch/powerpc/boot/Makefile:424 : arch/powerpc/boot/simpleImage.acadia] Erreur 1
	make: *** [arch/powerpc/Makefile:285 : simpleImage.acadia] Erreur 2

Trying again with V=1 shows the following command

	powerpc64-linux-gnu-ld -m -T arch/powerpc/boot/zImage.lds -Ttext 0x700000 --no-dynamic-linker -o arch/powerpc/boot/simpleImage.acadia -Map wrapper.map arch/powerpc/boot/fixed-head.o arch/powerpc/boot/simpleboot.o ./zImage.3278022.o arch/powerpc/boot/wrapper.a

The argument of '-m' is missing.

This is due to the wrapper script calling 'objdump -p vmlinux' and
looking for 'file format', whereas the output of objdump is:

	vmlinux:     format de fichier elf32-powerpc

	En-tête de programme:
	    LOAD off    0x00010000 vaddr 0xc0000000 paddr 0x00000000 align 2**16
	         filesz 0x0069e1d4 memsz 0x006c128c flags rwx
	    NOTE off    0x0064591c vaddr 0xc063591c paddr 0x0063591c align 2**2
	         filesz 0x00000054 memsz 0x00000054 flags ---

Add LC_ALL=C at the beginning of the wrapper script in order to get the
output expected by the script:

	vmlinux:     file format elf32-powerpc

	Program Header:
	    LOAD off    0x00010000 vaddr 0xc0000000 paddr 0x00000000 align 2**16
	         filesz 0x0069e1d4 memsz 0x006c128c flags rwx
	    NOTE off    0x0064591c vaddr 0xc063591c paddr 0x0063591c align 2**2
	         filesz 0x00000054 memsz 0x00000054 flags ---

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Also change patch's subject:
v2: Use LC_ALL=C per Segher
---
 arch/powerpc/boot/wrapper | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 1cd82564c996..9184eda780fd 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -26,6 +26,8 @@
 # Stop execution if any command fails
 set -e
 
+export LC_ALL=C
+
 # Allow for verbose output
 if [ "$V" = 1 ]; then
     set -x
-- 
2.31.1

