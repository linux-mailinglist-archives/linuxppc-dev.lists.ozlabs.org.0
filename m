Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24808901D1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 10:40:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FYaNHIWH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyQH63YcBz3cSX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 18:40:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FYaNHIWH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyQGQ5Frkz30TK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 18:39:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42D6160AB8;
	Mon, 10 Jun 2024 08:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25718C2BBFC;
	Mon, 10 Jun 2024 08:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718008779;
	bh=ja0F8E5mpqd3wHBq+jUnpLeKU4nNxSQxOz90WvjQzGU=;
	h=From:To:Cc:Subject:Date:From;
	b=FYaNHIWHBDmm+usoHfDngTtJzY+U+2d98dvYfq6nlK/SDtGTbBBIqO04XZjY3qqzA
	 bEKJ/6fEh1EIEURqM/n8y+fu1bbuIxo8p7I/FZfrrmXHpmLWRzddZ7t2dCkciFyFF1
	 7j2Gd/xmd+pXWGknbeGQlESxBthnL/KNHl4rYjGZoeZBXl6NoqzGuQHbQqJlt842EH
	 n7FRm0Kg8Qn03V0KI2FQrHLh94+Fi5N+10xd4yozBWCutAcWhTlMYjXVdbqz5k6V01
	 x3GIGqsLhb+EgDHGkyRjHDkKnj/RdBMH28enC+mK4PHJMhIrscBc6vDpiBvOkEihHN
	 0jHEYNMNFJOzA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH v2 0/5] powerpc/ftrace: Move ftrace sequence out of line
Date: Mon, 10 Jun 2024 14:08:13 +0530
Message-ID: <cover.1718008093.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
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
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is v2 of the series posted here:
http://lkml.kernel.org/r/cover.1702045299.git.naveen@kernel.org

Since v2, the primary change is that the entire ftrace sequence is moved 
out of line and this is now restricted to 64-bit powerpc by default.  
Patch 5 has the details.

I have dropped patches to enable DYNAMIC_FTRACE_WITH_CALL_OPS and ftrace 
direct support so that this approach can be finalized.

This series depends on Benjamin Gray's series adding support for 
patch_ulong():
http://lkml.kernel.org/r/20240515024445.236364-1-bgray@linux.ibm.com


Appreciate feedback on the approach.


Thanks,
Naveen



Naveen N Rao (5):
  powerpc/kprobes: Use ftrace to determine if a probe is at function
    entry
  powerpc/ftrace: Remove pointer to struct module from dyn_arch_ftrace
  powerpc/ftrace: Unify 32-bit and 64-bit ftrace entry code
  kbuild: Add generic hook for architectures to use before the final
    vmlinux link
  powerpc64/ftrace: Move ftrace sequence out of line

 arch/Kconfig                             |   3 +
 arch/powerpc/Kconfig                     |   4 +
 arch/powerpc/Makefile                    |   4 +
 arch/powerpc/include/asm/ftrace.h        |  11 +-
 arch/powerpc/include/asm/module.h        |   5 +
 arch/powerpc/kernel/asm-offsets.c        |   4 +
 arch/powerpc/kernel/kprobes.c            |  18 +--
 arch/powerpc/kernel/module_64.c          |  67 +++++++-
 arch/powerpc/kernel/trace/ftrace.c       | 196 ++++++++++++++++++++---
 arch/powerpc/kernel/trace/ftrace_64_pg.c |  73 ++++-----
 arch/powerpc/kernel/trace/ftrace_entry.S |  75 ++++++---
 arch/powerpc/kernel/vmlinux.lds.S        |   3 +-
 arch/powerpc/tools/vmlinux_o.sh          |  47 ++++++
 scripts/link-vmlinux.sh                  |  18 ++-
 14 files changed, 419 insertions(+), 109 deletions(-)
 create mode 100755 arch/powerpc/tools/vmlinux_o.sh


base-commit: 2c644f2847c188b4fa545e602e4a1d4db55e8c8d
prerequisite-patch-id: a1d50e589288239d5a8b1c1f354cd4737057c9d3
prerequisite-patch-id: da4142d56880861bd0ad7ad7087c9e2670a2ee54
prerequisite-patch-id: 609d292e054b2396b603890522a940fa0bdfb6d8
prerequisite-patch-id: 6f7213fb77b1260defbf43be0e47bff9c80054cc
prerequisite-patch-id: ad3b71bf071ae4ba1bee5b087e61a2055772a74f
-- 
2.45.2

