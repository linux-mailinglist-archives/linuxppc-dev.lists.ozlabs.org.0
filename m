Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B827947B9C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 06:59:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5Q54FPBz3c9G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 16:59:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5Pg1DrWz2ynK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 16:59:18 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 165B0804D0;
 Tue, 21 Dec 2021 00:59:07 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 0/6] powerpc: Build with LLVM_IAS=1
Date: Tue, 21 Dec 2021 16:58:58 +1100
Message-Id: <20211221055904.555763-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, Alan Modra <amodra@au1.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows compiling the upstream Linux with the upstream llvm with one fix on top;
https://reviews.llvm.org/D115419

This is based on sha1
798527287598 Michael Ellerman "Automatic merge of 'next' into merge (2021-12-14 00:12)".

Please comment. Thanks.



Alan Modra (1):
  powerpc/toc: PowerPC64 future proof kernel toc, revised for lld

Alexey Kardashevskiy (3):
  powerpc/64/asm: Inline BRANCH_TO_C000
  powerpc/mm: Switch obsolete dssall to .long
  powerpc/mm/book3s64/hash: Switch pre 2.06 tlbiel to .long

Daniel Axtens (2):
  powerpc: check for support for -Wa,-m{power4,any}
  powerpc/64/asm: Do not reassign labels

 arch/powerpc/Makefile                   |  9 +++--
 arch/powerpc/include/asm/head-64.h      | 12 +++----
 arch/powerpc/include/asm/ppc-opcode.h   |  4 +++
 arch/powerpc/include/asm/sections.h     | 14 ++++----
 arch/powerpc/kernel/idle.c              |  2 +-
 arch/powerpc/mm/book3s64/hash_native.c  |  4 +--
 arch/powerpc/mm/mmu_context.c           |  2 +-
 arch/powerpc/boot/crt0.S                |  2 +-
 arch/powerpc/boot/zImage.lds.S          |  7 ++--
 arch/powerpc/kernel/exceptions-64s.S    | 47 ++++++++++---------------
 arch/powerpc/kernel/head_64.S           | 20 +++++------
 arch/powerpc/kernel/idle_6xx.S          |  2 +-
 arch/powerpc/kernel/interrupt_64.S      |  2 +-
 arch/powerpc/kernel/l2cr_6xx.S          |  6 ++--
 arch/powerpc/kernel/swsusp_32.S         |  2 +-
 arch/powerpc/kernel/swsusp_asm64.S      |  2 +-
 arch/powerpc/kernel/vmlinux.lds.S       |  8 ++---
 arch/powerpc/platforms/powermac/cache.S |  4 +--
 18 files changed, 69 insertions(+), 80 deletions(-)

-- 
2.30.2

