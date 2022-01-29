Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 241B84A2F6E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 13:28:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmDBs0PLXz3dtY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 23:28:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QiH+nw9z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QiH+nw9z; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmD0M3qvvz3cTr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 23:19:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB04B60C3D;
 Sat, 29 Jan 2022 12:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD13C340EB;
 Sat, 29 Jan 2022 12:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643458769;
 bh=TkpF1bKo3WdGRomoemQuFbEscNstYtWDC/I865vm/5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QiH+nw9zDyHJc3hC6rPAh5+xb6u2xZ68pGImJn0IoRtvLm+UdUZQqHHisi2Or1C0/
 Qy8wvZ10rC3gyD1YLxRy73gMRgBDCbRa2TJ2fRi7/Cz51U+AbgCYjKYnIxjPQLiSew
 OmfjJyfd4DyNd4P+DhZKHvaD0WGYt/G57Vj0cBmt2mSxvofduwGjquK5Q6PwGBLkQu
 9/40XHIn/rlwq6mrWrKQMr8Gjsd40DhTRuLLtALG/D/VliYRU+vrMDFH1MepxwLiAg
 GtROPKDkeWzGrG9r9guU+xlU8y4sEdYp8unqyYzNENBzjJ6rckmZkhMNSSAQ0kWLvh
 kyBGR8NbeOYhg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Subject: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
Date: Sat, 29 Jan 2022 20:17:27 +0800
Message-Id: <20220129121728.1079364-17-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129121728.1079364-1-guoren@kernel.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-parisc@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

Adds initial skeletal COMPAT Kbuild (Runing 32bit U-mode on 64bit
S-mode) support.
 - Setup kconfig & dummy functions for compiling.
 - Implement compat_start_thread by the way.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..6f11df8c189f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -73,6 +73,7 @@ config RISCV
 	select HAVE_ARCH_KGDB if !XIP_KERNEL
 	select HAVE_ARCH_KGDB_QXFER_PKT
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
+	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
@@ -123,12 +124,18 @@ config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8
 
+config ARCH_MMAP_RND_COMPAT_BITS_MIN
+	default 8
+
 # max bits determined by the following formula:
 #  VA_BITS - PAGE_SHIFT - 3
 config ARCH_MMAP_RND_BITS_MAX
 	default 24 if 64BIT # SV39 based
 	default 17
 
+config ARCH_MMAP_RND_COMPAT_BITS_MAX
+	default 17
+
 # set if we run in machine mode, cleared if we run in supervisor mode
 config RISCV_M_MODE
 	bool
@@ -406,6 +413,18 @@ config CRASH_DUMP
 
 	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
+config COMPAT
+	bool "Kernel support for 32-bit U-mode"
+	default 64BIT
+	depends on 64BIT && MMU
+	help
+	  This option enables support for a 32-bit U-mode running under a 64-bit
+	  kernel at S-mode. riscv32-specific components such as system calls,
+	  the user helper functions (vdso), signal rt_frame functions and the
+	  ptrace interface are handled appropriately by the kernel.
+
+	  If you want to execute 32-bit userspace applications, say Y.
+
 endmenu
 
 menu "Boot options"
-- 
2.25.1

