Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F24384216C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 11:36:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPM6Z3Hbkz3cY6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 21:36:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPM6920vkz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 21:36:31 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TPM625ppBz9sB6;
	Tue, 30 Jan 2024 11:36:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ws_uhNN709Je; Tue, 30 Jan 2024 11:36:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TPM4R4bMWz9vDl;
	Tue, 30 Jan 2024 11:35:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 93C778B76E;
	Tue, 30 Jan 2024 11:35:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5Vre96fi8PyS; Tue, 30 Jan 2024 11:35:03 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.134])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D09B58B763;
	Tue, 30 Jan 2024 11:35:01 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 0/5] mm: ptdump: Refactor CONFIG_DEBUG_WX and check_wx_pages debugfs attribute
Date: Tue, 30 Jan 2024 11:34:31 +0100
Message-ID: <cover.1706610398.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706610876; l=2737; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=GLnDgyafe3Abwdfr1jBJzmg1hyqpqoPnd3cHPH0oxrY=; b=tIZe4XZQjVwWyWqJ6WaH1FMomnKnFXJjNxF+XKnvH0G3eYwBTTFLAyHmPCAqyI2HJixgHIMEp +ciHrtrDDPHBl9BQwIT71a8HT+O9hvNWFDyEfO0KDZbwbPjdDLV5qLD
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
Cc: mark.rutland@arm.com, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Phong Tran <tranmanphong@gmail.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, steven.price@arm.com, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Greg KH <greg@kroah.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linu
 x-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Refer old discussion at https://lore.kernel.org/lkml/20200422152656.GF676@willie-the-truck/T/#m802eaf33efd6f8d575939d157301b35ac0d4a64f
And https://github.com/KSPP/linux/issues/35

This series refactors CONFIG_DEBUG_WX for the 5 architectures
implementing CONFIG_GENERIC_PTDUMP

First rename stuff in ARM which uses similar names while not
implementing CONFIG_GENERIC_PTDUMP.

Then define a generic version of debug_checkwx() that calls
ptdump_check_wx() when CONFIG_DEBUG_WX is set. Call it immediately
after calling mark_rodata_ro() instead of calling it at the end of
every mark_rodata_ro().

Then implement a debugfs attribute that can be used to trigger
a W^X test at anytime and regardless of CONFIG_DEBUG_WX

Changes in v2:
- Fixed a few build failures (patch 1 and 2)
- Added patch 4
- Make the attribute return SUCCESS/FAILURE as suggested by Heiko (patch 5)

Christophe Leroy (5):
  arm: ptdump: Rename CONFIG_DEBUG_WX to CONFIG_ARM_DEBUG_WX
  arm64, powerpc, riscv, s390, x86: ptdump: Refactor CONFIG_DEBUG_WX
  powerpc,s390: ptdump: Define ptdump_check_wx() regardless of
    CONFIG_DEBUG_WX
  mm: ptdump: Have ptdump_check_wx() return bool
  mm: ptdump: add check_wx_pages debugfs attribute

 arch/arm/Kconfig.debug               |  2 +-
 arch/arm/configs/aspeed_g4_defconfig |  2 +-
 arch/arm/configs/aspeed_g5_defconfig |  2 +-
 arch/arm/include/asm/ptdump.h        |  6 +++---
 arch/arm/mm/init.c                   |  2 +-
 arch/arm64/include/asm/ptdump.h      |  7 -------
 arch/arm64/mm/mmu.c                  |  2 --
 arch/arm64/mm/ptdump.c               | 11 ++++++++---
 arch/powerpc/mm/mmu_decl.h           |  6 ------
 arch/powerpc/mm/pgtable_32.c         |  4 ----
 arch/powerpc/mm/pgtable_64.c         |  3 ---
 arch/powerpc/mm/ptdump/ptdump.c      | 21 ++++++++++++++-------
 arch/riscv/include/asm/ptdump.h      | 22 ----------------------
 arch/riscv/mm/init.c                 |  3 ---
 arch/riscv/mm/ptdump.c               | 12 ++++++++----
 arch/s390/include/asm/ptdump.h       | 14 --------------
 arch/s390/mm/dump_pagetables.c       | 21 +++++++++++----------
 arch/s390/mm/init.c                  |  2 --
 arch/x86/include/asm/pgtable.h       |  5 ++---
 arch/x86/mm/dump_pagetables.c        | 20 ++++++++++++++------
 arch/x86/mm/init_32.c                |  2 --
 arch/x86/mm/init_64.c                |  2 --
 include/linux/ptdump.h               |  7 +++++++
 init/main.c                          |  2 ++
 mm/ptdump.c                          | 22 ++++++++++++++++++++++
 25 files changed, 95 insertions(+), 107 deletions(-)
 delete mode 100644 arch/riscv/include/asm/ptdump.h
 delete mode 100644 arch/s390/include/asm/ptdump.h

-- 
2.43.0

