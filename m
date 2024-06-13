Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C43907E7E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:02:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0bwq08wqz3cYg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 08:02:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhengyejian1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0P4z3NFcz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 23:53:23 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W0Ncw5QKGzwTS8;
	Thu, 13 Jun 2024 21:32:32 +0800 (CST)
Received: from dggpeml500012.china.huawei.com (unknown [7.185.36.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 0E8DA180069;
	Thu, 13 Jun 2024 21:36:40 +0800 (CST)
Received: from localhost.localdomain (10.67.175.61) by
 dggpeml500012.china.huawei.com (7.185.36.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 21:36:39 +0800
From: Zheng Yejian <zhengyejian1@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>, <mark.rutland@arm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen.n.rao@linux.ibm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <mcgrof@kernel.org>, <mathieu.desnoyers@efficios.com>,
	<masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas@fjasle.eu>,
	<kees@kernel.org>, <james.clark@arm.com>, <kent.overstreet@linux.dev>,
	<yhs@fb.com>, <jpoimboe@kernel.org>, <peterz@infradead.org>
Subject: [PATCH 0/6] kallsyms: Emit symbol for holes in text and fix weak function issue
Date: Thu, 13 Jun 2024 21:37:05 +0800
Message-ID: <20240613133711.2867745-1-zhengyejian1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.61]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500012.china.huawei.com (7.185.36.15)
X-Mailman-Approved-At: Fri, 14 Jun 2024 08:01:41 +1000
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
Cc: zhengyejian1@huawei.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ftrace_location() was changed to not only return the __fentry__ location
when called for the __fentry__ location, but also when called for the
sym+0 location after commit aebfd12521d9 ("x86/ibt,ftrace: Search for
__fentry__ location"). That is, if sym+0 location is not __fentry__,
ftrace_location() would find one over the entire size of the sym.

However, there is case that more than one __fentry__ exist in the sym
range (described below) and ftrace_location() would find wrong __fentry__
location by binary searching, which would cause its users like livepatch/
kprobe/bpf to not work properly on this sym!

The case is that, based on current compiler behavior, suppose:
 - function A is followed by weak function B1 in same binary file;
 - weak function B1 is overridden by function B2;
Then in the final binary file:
 - symbol B1 will be removed from symbol table while its instructions are
   not removed;
 - __fentry__ of B1 will be still in __mcount_loc table;
 - function size of A is computed by substracting the symbol address of
   A from its next symbol address (see kallsyms_lookup_size_offset()),
   but because symbol info of B1 is removed, the next symbol of A is
   originally the next symbol of B1. See following example, function
   sizeof A will be (symbol_address_C - symbol_address_A):

     symbol_address_A
     symbol_address_B1 (Not in symbol table)
     symbol_address_C

The weak function issue has been discovered in commit b39181f7c690
("ftrace: Add FTRACE_MCOUNT_MAX_OFFSET to avoid adding weak function")
but it didn't resolve the issue in ftrace_location().

Peter suggested to use entry size for FUNC type objects to find holes in
the text and fill them with a symbol, then check the mcount locations
against the symbol table and for every one that falls in a hole [1] [2].

What the patch set does is described as follows:

- Patch 1: Do an optimization for scripts/kallsym.c about memory allocation
  when read symbols from file. This patch has little to do with the above
  issue, but since I changed this script, so it also can be reviewed here;

- Patch 2: Change scripts/kallsyms.c to emit a symbol where there is a hole
  in the text, the symbol name is temporarily named "__hole_symbol_XXXXX";

- Patch 3: When lookup symbols in module, use entry size info to determine
  the exact boundaries of a function symbol;

- Patch 4: Holes in text have been found in previous patches, now check
  __fentry__ in mcount table and skip those locate in the holes;

- Patch 5: Accidentally found a out-of-bound issue when all __fentry__
  are skipped, so fix it;

- Patch 6: Revert Steve's patch about the FTRACE_MCOUNT_MAX_OFFSET
  solution, also two related definition for powerpc.

[1] https://lore.kernel.org/all/20240607150228.GR8774@noisy.programming.kicks-ass.net/
[2] https://lore.kernel.org/all/20240611092157.GU40213@noisy.programming.kicks-ass.net/

Zheng Yejian (6):
  kallsyms: Optimize multiple times of realloc() to one time of malloc()
  kallsyms: Emit symbol at the holes in the text
  module: kallsyms: Determine exact function size
  ftrace: Skip invalid __fentry__ in ftrace_process_locs()
  ftrace: Fix possible out-of-bound issue in ftrace_process_locs()
  ftrace: Revert the FTRACE_MCOUNT_MAX_OFFSET workaround

 arch/powerpc/include/asm/ftrace.h |   7 --
 arch/x86/include/asm/ftrace.h     |   7 --
 include/linux/kallsyms.h          |  13 +++
 include/linux/module.h            |  14 +++
 kernel/module/kallsyms.c          |  42 ++++++--
 kernel/trace/ftrace.c             | 174 ++++++------------------------
 scripts/kallsyms.c                | 134 ++++++++++++++++++++---
 scripts/link-vmlinux.sh           |   4 +-
 scripts/mksysmap                  |   2 +-
 9 files changed, 216 insertions(+), 181 deletions(-)

-- 
2.25.1

