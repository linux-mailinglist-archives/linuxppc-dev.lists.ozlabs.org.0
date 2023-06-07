Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B257266A7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:00:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbtrq3hWMz3dx4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:00:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=od3nkh2a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=od3nkh2a;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbtqw4wLqz2ynB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 02:59:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD27760A49;
	Wed,  7 Jun 2023 16:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DACC433D2;
	Wed,  7 Jun 2023 16:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157194;
	bh=woiS94PmT66z+RZDytngA7mFZdKO2orj/7MeVTOOgpw=;
	h=From:To:Cc:Subject:Date:From;
	b=od3nkh2auc9K6/GLLt1tXMCQ2uv6YvkTaS9w7npA9jbM2Kng4HfD6tGUtsZKOxqbP
	 QmY+ySPajBG74CUKOMdQ+LLm4s6Snt9nbheBjxKIPVldSUF3X3uzrdACLT1WZYv0pT
	 HsH+81ni7KkAh9J84hMY7gejuK7HP8JqV8xvRdeXw3ozLcZGhfWTOeo0ZHTUKpk7f0
	 D/4VJLy4amQi1YbfVtDVP0cWK/6g33VAAXzI15ufOpV6xTUh9o8wkIo35y5SJBzWcq
	 nL9QHESDWY4xKmiSgLpNuhNUPktRxbAYw7w9KlqcGiZJzFuAM2Z+2EBeyueVblEoHH
	 yCh8r0LMl2Yog==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 00/15] powerpc/ftrace: refactoring and support for -fpatchable-function-entry
Date: Wed,  7 Jun 2023 22:25:15 +0530
Message-Id: <cover.1686151854.git.naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a follow-on RFC to the patch I previously posted here:
http://lore.kernel.org/20230519192600.2593506-1-naveen@kernel.org

Since then, I have split up the patches, picked up a few more changes 
and given this more testing. More details in the individual patches.


- Naveen



Naveen N Rao (15):
  powerpc/module: Remove unused .ftrace.tramp section
  powerpc64/ftrace: Move ELFv1 and -pg support code into a separate file
  powerpc/ftrace: Simplify function_graph support in ftrace.c
  powerpc/ftrace: Use FTRACE_REGS_ADDR to identify the correct ftrace
    trampoline
  powerpc/ftrace: Extend ftrace support for large kernels to ppc32
  powerpc/ftrace: Consolidate ftrace support into fewer files
  powerpc/ftrace: Refactor ftrace_modify_code()
  powerpc/ftrace: Stop re-purposing linker generated long branches for
    ftrace
  powerpc/ftrace: Add separate ftrace_init_nop() with additional
    validation
  powerpc/ftrace: Simplify ftrace_make_nop()
  powerpc/ftrace: Simplify ftrace_make_call()
  powerpc/ftrace: Simplify ftrace_modify_call()
  powerpc/ftrace: Replace use of ftrace_call_replace() with
    ftrace_create_branch_inst()
  powerpc/ftrace: Implement ftrace_replace_code()
  powerpc/ftrace: Add support for -fpatchable-function-entry

 arch/powerpc/Kconfig                          |  14 +-
 arch/powerpc/Makefile                         |   5 +
 arch/powerpc/include/asm/ftrace.h             |  22 +-
 arch/powerpc/include/asm/module.h             |   4 -
 arch/powerpc/include/asm/sections.h           |   2 +
 arch/powerpc/include/asm/vermagic.h           |   4 +-
 arch/powerpc/kernel/module_64.c               |   2 +-
 arch/powerpc/kernel/trace/Makefile            |  12 +-
 arch/powerpc/kernel/trace/ftrace.c            | 908 +++++-------------
 arch/powerpc/kernel/trace/ftrace_64_pg.S      |  67 --
 arch/powerpc/kernel/trace/ftrace_64_pg.c      | 846 ++++++++++++++++
 .../{ftrace_low.S => ftrace_64_pg_entry.S}    |  64 +-
 .../{ftrace_mprofile.S => ftrace_entry.S}     |  67 ++
 arch/powerpc/kernel/vmlinux.lds.S             |   4 -
 .../gcc-check-fpatchable-function-entry.sh    |  26 +
 15 files changed, 1277 insertions(+), 770 deletions(-)
 delete mode 100644 arch/powerpc/kernel/trace/ftrace_64_pg.S
 create mode 100644 arch/powerpc/kernel/trace/ftrace_64_pg.c
 rename arch/powerpc/kernel/trace/{ftrace_low.S => ftrace_64_pg_entry.S} (54%)
 rename arch/powerpc/kernel/trace/{ftrace_mprofile.S => ftrace_entry.S} (83%)
 create mode 100755 arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh


base-commit: bd517a8442b6c6646a136421cd4c1b95bf4ce32b
-- 
2.40.1

