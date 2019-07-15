Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2393685A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 10:41:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nH842212zDqR1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 18:41:56 +1000 (AEST)
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
 header.b="e/DOrSVP"; dkim-atps=neutral
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nGqY6pQjzDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 18:27:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From;
 bh=9YDoZ6M1rILhsm1tBvT2sq8Sf1YUipH1oLZXeoqDKfY=; b=e/DOrSVP00YS5xETKrPa1zGjS9
 d76TYCd9SnaYd3SV4HR5IATQZjst/6yaf2NtmL6G/7XKq8ZXBnquf8zdzI6PuVm3apwXDhMSkEMDY
 nSLe4v3DrHixs84r7JRkW8yyrjK+64LH7W1P89pr7Lmi+rOmCKiG68Z22FN8ZagQOm5w=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.intern)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1hmwKZ-0005LV-8Y; Mon, 15 Jul 2019 10:27:31 +0200
From: Sven Schnelle <svens@stackframe.org>
To: kexec@lists.infradead.org
Subject: [PATCH v4 0/7] kexec: add generic support for elf kernel images
Date: Mon, 15 Jul 2019 10:26:55 +0200
Message-Id: <20190715082702.27308-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Sven Schnelle <svens@stackframe.org>, deller@gmx.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

 arch/Kconfig                       |   3 +
 arch/powerpc/Kconfig               |   1 +
 arch/powerpc/kernel/kexec_elf_64.c | 551 +----------------------------
 include/linux/kexec.h              |  23 ++
 kernel/Makefile                    |   1 +
 kernel/kexec_elf.c                 | 418 ++++++++++++++++++++++
 6 files changed, 456 insertions(+), 541 deletions(-)
 create mode 100644 kernel/kexec_elf.c

-- 
2.20.1

