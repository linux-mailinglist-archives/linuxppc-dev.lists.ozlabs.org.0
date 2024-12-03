Return-Path: <linuxppc-dev+bounces-3691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B89FD9E120E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 04:54:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2RbY5KpXz2yR3;
	Tue,  3 Dec 2024 14:54:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733198041;
	cv=none; b=GPwWclHvg4U0rj4guZEXJd8WPTmNznoeQsUYde7DT9Cb1MtexoMEJIzJGqresbE9bod0mRhsLRCTv1ADPRrJnEnMljZMTjenAiwjUuZf0II7xdXUPNR8XtISmHXfidbjTLnw5mVkfJdEjaHQkkk33strlgVF83lhM50BtIkQ5114H6Q7tA8Yi71Wzq5BnFZUATdTyoCnS8awm/6Jj8rGn3hrlLoywsoWvQoT8ZHEXhe1zwz23mIaZweiNLGz0yY3j2S0kdu0jx7xOrgvlTk7GO674LzsF7rIoUkiPZ2n/EbVQ3IQIrykA2Be26B8P51WmuzRpu1/ZI5NHMyBDgdHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733198041; c=relaxed/relaxed;
	bh=zQqUbmF1clmBdR2j9z40+gFSt387kXFIYgaoe3LL5fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jvv9+ogWdaXSiKURMpPYCmJiImr3S8uBja2AoaEH8peejDxxlhJ5TkU36rToaGCy6WFBoAABaHZe3NMz1N/QcT7AZ+P+Eza2DIxYAbV8FJ+uulLNVBYe8bthR7QvSub2rGfjm7H1vmWQxWbIBFCUz/vJyF9XB9H2ydAWR8hjThCUXIS6RLkqdl8BkaOErmqsI76+2kGOrFBPMxKY7wd0WGVnZl3Bs0bE3wiKNbjqZXLGFoTEt06STPeVZpOHSXZCzTsaZUVqJRMgI5R3bwsjXrfeXMapECXsJvDP6c9vJR89ev6OEB3edL2Lmp4oL1y9ZnypKRyn5EZfYwol6gac4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G0gotNSR; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G0gotNSR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2RbX3qW1z2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 14:54:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F7745C6A61;
	Tue,  3 Dec 2024 03:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8441AC4CECF;
	Tue,  3 Dec 2024 03:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733198035;
	bh=nKvcOkAgT9eGLo+1IwUFYryCnxBo3MpKhtpqtDuNVl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0gotNSRONxMRV3ybu2QdEkE9nK/sNKtOf3PG1b5012GdQHoNtospa/lqZYwD5rPe
	 /0tDnWHQfpsN7GWoEEFAAKM0byhFfPyUaQKaj9vOvceUZuAozwS3bT9uP9DysLc4zi
	 HsIJqXpxDmRBkW7OXeH8/mMgDWThI4MV9t0JDb2qB7e1WlgnrLeKRJZijWtZczy2RD
	 Ex9qhn7giClb+jMZlvE7rQeRiXBF7vCs1CfAiZercJhfash4D7zdO0qweR7dQtXBIg
	 sWGmmkuUoav3BFp0ZcuhZsxDTB5mbxyyaCU2xeQ62+Y7GxygLBJ3lCcE65BPcVkCWR
	 GN0S8lEEHAK5Q==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	x86@kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 06/11] tools headers: Sync *xattrat syscall changes with the kernel sources
Date: Mon,  2 Dec 2024 19:53:44 -0800
Message-ID: <20241203035349.1901262-7-namhyung@kernel.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241203035349.1901262-1-namhyung@kernel.org>
References: <20241203035349.1901262-1-namhyung@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

To pick up the changes in this cset:

  6140be90ec70c39f ("fs/xattr: add *at family syscalls")

This addresses these perf build warnings:

  Warning: Kernel ABI header differences:
    diff -u tools/include/uapi/asm-generic/unistd.h include/uapi/asm-generic/unistd.h
    diff -u tools/perf/arch/x86/entry/syscalls/syscall_32.tbl arch/x86/entry/syscalls/syscall_32.tbl
    diff -u tools/perf/arch/x86/entry/syscalls/syscall_64.tbl arch/x86/entry/syscalls/syscall_64.tbl
    diff -u tools/perf/arch/powerpc/entry/syscalls/syscall.tbl arch/powerpc/kernel/syscalls/syscall.tbl
    diff -u tools/perf/arch/s390/entry/syscalls/syscall.tbl arch/s390/kernel/syscalls/syscall.tbl
    diff -u tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl arch/mips/kernel/syscalls/syscall_n64.tbl

The arm64 changes are not included as it requires more changes in the
tools.  It'll be worked for the later cycle.

Please see tools/include/uapi/README for further details.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>
CC: x86@kernel.org
CC: linux-mips@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-s390@vger.kernel.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/include/uapi/asm-generic/unistd.h             | 11 ++++++++++-
 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl |  4 ++++
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  |  4 ++++
 tools/perf/arch/s390/entry/syscalls/syscall.tbl     |  4 ++++
 tools/perf/arch/x86/entry/syscalls/syscall_32.tbl   |  4 ++++
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl   |  4 ++++
 6 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
index 5bf6148cac2b93e3..88dc393c2bca38c0 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
@@ -841,8 +841,17 @@ __SYSCALL(__NR_lsm_list_modules, sys_lsm_list_modules)
 #define __NR_mseal 462
 __SYSCALL(__NR_mseal, sys_mseal)
 
+#define __NR_setxattrat 463
+__SYSCALL(__NR_setxattrat, sys_setxattrat)
+#define __NR_getxattrat 464
+__SYSCALL(__NR_getxattrat, sys_getxattrat)
+#define __NR_listxattrat 465
+__SYSCALL(__NR_listxattrat, sys_listxattrat)
+#define __NR_removexattrat 466
+__SYSCALL(__NR_removexattrat, sys_removexattrat)
+
 #undef __NR_syscalls
-#define __NR_syscalls 463
+#define __NR_syscalls 467
 
 /*
  * 32 bit systems traditionally used different
diff --git a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
index 1464c6be6eb3c752..c844cd5cda620b28 100644
--- a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
+++ b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
@@ -377,3 +377,7 @@
 460	n64	lsm_set_self_attr		sys_lsm_set_self_attr
 461	n64	lsm_list_modules		sys_lsm_list_modules
 462	n64	mseal				sys_mseal
+463	n64	setxattrat			sys_setxattrat
+464	n64	getxattrat			sys_getxattrat
+465	n64	listxattrat			sys_listxattrat
+466	n64	removexattrat			sys_removexattrat
diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index ebae8415dfbbab6f..d8b4ab78bef076bd 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -553,3 +553,7 @@
 460	common	lsm_set_self_attr		sys_lsm_set_self_attr
 461	common	lsm_list_modules		sys_lsm_list_modules
 462	common	mseal				sys_mseal
+463	common	setxattrat			sys_setxattrat
+464	common	getxattrat			sys_getxattrat
+465	common	listxattrat			sys_listxattrat
+466	common	removexattrat			sys_removexattrat
diff --git a/tools/perf/arch/s390/entry/syscalls/syscall.tbl b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
index 01071182763e96ff..e9115b4d8b635b84 100644
--- a/tools/perf/arch/s390/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
@@ -465,3 +465,7 @@
 460  common	lsm_set_self_attr	sys_lsm_set_self_attr		sys_lsm_set_self_attr
 461  common	lsm_list_modules	sys_lsm_list_modules		sys_lsm_list_modules
 462  common	mseal			sys_mseal			sys_mseal
+463  common	setxattrat		sys_setxattrat			sys_setxattrat
+464  common	getxattrat		sys_getxattrat			sys_getxattrat
+465  common	listxattrat		sys_listxattrat			sys_listxattrat
+466  common	removexattrat		sys_removexattrat		sys_removexattrat
diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_32.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_32.tbl
index 534c74b14fab5117..4d0fb2fba7e208ae 100644
--- a/tools/perf/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/tools/perf/arch/x86/entry/syscalls/syscall_32.tbl
@@ -468,3 +468,7 @@
 460	i386	lsm_set_self_attr	sys_lsm_set_self_attr
 461	i386	lsm_list_modules	sys_lsm_list_modules
 462	i386	mseal 			sys_mseal
+463	i386	setxattrat		sys_setxattrat
+464	i386	getxattrat		sys_getxattrat
+465	i386	listxattrat		sys_listxattrat
+466	i386	removexattrat		sys_removexattrat
diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
index 7093ee21c0d1c041..5eb708bff1c791de 100644
--- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
@@ -386,6 +386,10 @@
 460	common	lsm_set_self_attr	sys_lsm_set_self_attr
 461	common	lsm_list_modules	sys_lsm_list_modules
 462 	common  mseal			sys_mseal
+463	common	setxattrat		sys_setxattrat
+464	common	getxattrat		sys_getxattrat
+465	common	listxattrat		sys_listxattrat
+466	common	removexattrat		sys_removexattrat
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
-- 
2.47.0.338.g60cca15819-goog


