Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD8E9B7B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 22:34:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FY5j47DFzDsM4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 06:34:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=stackframe.org
 (client-ip=2001:470:70c5:1111::170; helo=smtp.duncanthrax.net;
 envelope-from=svens@stackframe.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=stackframe.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=duncanthrax.net header.i=@duncanthrax.net
 header.b="Im41WT9I"; dkim-atps=neutral
X-Greylist: delayed 2558 seconds by postgrey-1.36 at bilbo;
 Sat, 24 Aug 2019 06:32:22 AEST
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FY3p1hhrzDrgT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 06:32:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From;
 bh=aYGInAzUl0pRN0zpAIIO8vJ9r1QZKJubVPM0UJO9dBI=; b=Im41WT9IYAtJS2etr6YHVfjUg5
 Zua/fAQD/0mBmdHR+i+1I4y3J9CWRFK6IsiltBmHVjzRL3BnHjcxvygCXzCYyN60OTm+A5VKBA5Hs
 EPgupl4Gu+4DPepfknwQkb9E1gJxeUvJiKIzL/2+VoBtI3VpZ4hBBMI0J9Bq0adpz4n0=;
Received: from [134.3.44.134] (helo=x280.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1i1FZ1-00071n-W6; Fri, 23 Aug 2019 21:49:36 +0200
From: Sven Schnelle <svens@stackframe.org>
To: kexec@lists.infradead.org
Subject: [PATCH v5 0/7] kexec: add generic support for elf kernel images
Date: Fri, 23 Aug 2019 21:49:12 +0200
Message-Id: <20190823194919.30916-1-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 linuxppc-dev@lists.ozlabs.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changes to v4:
 - rebase on current powerpc/merge tree
 - fix syscall name in commit message
 - remove a few unused #defines in arch/powerpc/kernel/kexec_elf_64.c

Changes to v3:
 - add support for 32-bit ELF files

Changes to v2:
 - use git format-patch -C

Changes to v1:
 - split up patch into smaller pieces
 - rebase onto powerpc/next
 - remove unused variable in kexec_elf_load()

Changes to RFC version:
 - remove unused Elf_Rel macro
 - remove section header parsing
 - remove PURGATORY_STACK_SIZE
 - change order of elf_*_to_cpu() functions
 - remove elf_addr_to_cpu macro

Sven Schnelle (7):
  kexec: add KEXEC_ELF
  kexec_elf: change order of elf_*_to_cpu() functions
  kexec_elf: remove parsing of section headers
  kexec_elf: remove PURGATORY_STACK_SIZE
  kexec_elf: remove Elf_Rel macro
  kexec_elf: remove unused variable in kexec_elf_load()
  kexec_elf: support 32 bit ELF files

 arch/Kconfig                                  |   3 +
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/kernel/kexec_elf_64.c            | 545 +-----------------
 include/linux/kexec.h                         |  23 +
 kernel/Makefile                               |   1 +
 .../kexec_elf_64.c => kernel/kexec_elf.c      | 394 +++----------
 6 files changed, 115 insertions(+), 852 deletions(-)
 copy arch/powerpc/kernel/kexec_elf_64.c => kernel/kexec_elf.c (50%)

-- 
2.23.0.rc1

