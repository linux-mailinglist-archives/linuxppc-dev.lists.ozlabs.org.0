Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F2A2530CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 16:04:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc70348nNzDqWb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 00:04:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=1dYnX6jG; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc6lg2pbGzDqW0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 23:53:51 +1000 (AEST)
Received: from localhost (unknown [70.37.104.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD06422B4B;
 Wed, 26 Aug 2020 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598450028;
 bh=gMVm8mMUGjtFLow1+9B5XyghKkKUfhUCmTV1Av0gOT8=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=1dYnX6jGXHQBauIIlNDf0qaLs6C4HylzjiPodPdy6YhlJOFEnQCqq4vzfHW9vkDK9
 xBHCZUcIwid6OPgURhAVQhwicw067mk/WxIQGA3nlkk5/knYXJNeK9WYxg2ZkRa+69
 7twxVbRirJvrrFUugYGfMEbZ2+ZpUCtb6n8QBQ0w=
Date: Wed, 26 Aug 2020 13:53:48 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] powerpc/rtas: Restrict RTAS requests from userspace
In-Reply-To: <20200820044512.7543-1-ajd@linux.ibm.com>
References: <20200820044512.7543-1-ajd@linux.ibm.com>
Message-Id: <20200826135348.AD06422B4B@mail.kernel.org>
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
Cc: nathanl@linux.ibm.com, leobras.c@gmail.com, stable@vger.kernel.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.8.2, v5.7.16, v5.4.59, v4.19.140, v4.14.193, v4.9.232, v4.4.232.

v5.8.2: Build OK!
v5.7.16: Build OK!
v5.4.59: Failed to apply! Possible dependencies:
    1a8916ee3ac2 ("powerpc: Detect the secure boot mode of the system")
    4238fad366a6 ("powerpc/ima: Add support to initialize ima policy rules")
    9155e2341aa8 ("powerpc/powernv: Add OPAL API interface to access secure variable")
    bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")

v4.19.140: Failed to apply! Possible dependencies:
    0261a508c9fc ("powerpc/mm: dump segment registers on book3s/32")
    136bc0397ae2 ("powerpc/pseries: Introduce option to build secure virtual machines")
    1a8916ee3ac2 ("powerpc: Detect the secure boot mode of the system")
    75d9fc7fd94e ("powerpc/powernv: move OPAL call wrapper tracing and interrupt handling to C")
    7c91efce1608 ("powerpc/mm: dump block address translation on book3s/32")
    97026b5a5ac2 ("powerpc/mm: Split dump_pagelinuxtables flag_array table")
    a49dddbdb0cc ("powerpc/kernel: Add ucall_norets() ultravisor call handler")
    b2133bd7a553 ("powerpc/book3s/32: do not include pte-common.h")
    bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
    cbcbbf4afd6d ("powerpc/mm: Define platform default caches related flags")
    d81e6f8b7c66 ("powerpc/mm: don't use _PAGE_EXEC in book3s/32")
    d82fd29c5a8c ("powerpc/mm: Distribute platform specific PAGE and PMD flags and definitions")
    e66c3209c7fd ("powerpc: Move page table dump files in a dedicated subdirectory")
    fb0b0a73b223 ("powerpc: Enable kcov")
    ff00552578ba ("powerpc/8xx: change name of a few page flags to avoid confusion")

v4.14.193: Failed to apply! Possible dependencies:
    136bc0397ae2 ("powerpc/pseries: Introduce option to build secure virtual machines")
    1a8916ee3ac2 ("powerpc: Detect the secure boot mode of the system")
    4e56207130ed ("kbuild: Cache a few more calls to the compiler")
    4fa8bc949de1 ("kbuild: rename *-asn1.[ch] to *.asn1.[ch]")
    74ce1896c6c6 ("kbuild: clean up *.dtb and *.dtb.S patterns from top-level Makefile")
    75d9fc7fd94e ("powerpc/powernv: move OPAL call wrapper tracing and interrupt handling to C")
    8438ee76b004 ("Makefile: disable PIE before testing asm goto")
    8f2133cc0e1f ("powerpc/pseries: hcall_exit tracepoint retval should be signed")
    92e3da3cf193 ("powerpc: initial pkey plumbing")
    9a8dfb394c04 ("kbuild: clean up *.lex.c and *.tab.[ch] patterns from top-level Makefile")
    9ce285cfe360 (".gitignore: move *-asn1.[ch] patterns to the top-level .gitignore")
    a49dddbdb0cc ("powerpc/kernel: Add ucall_norets() ultravisor call handler")
    bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
    c64ba044ed57 ("kbuild: gcov: enable -fno-tree-loop-im if supported")
    d677a4d60193 ("Makefile: support flag -fsanitizer-coverage=trace-cmp")
    d682026dd3c5 (".gitignore: ignore ASN.1 auto generated files")
    e08d6de4e532 ("kbuild: remove kbuild cache")
    e501ce957a78 ("x86: Force asm-goto")
    e9666d10a567 ("jump_label: move 'asm goto' support test to Kconfig")
    ef46d9b3dc01 ("kbuild: clean up *.i and *.lst patterns by make clean")

v4.9.232: Failed to apply! Possible dependencies:
    1515ab932156 ("powerpc/mm: Dump hash table")
    1a8916ee3ac2 ("powerpc: Detect the secure boot mode of the system")
    6cc89bad60a6 ("powerpc/kprobes: Invoke handlers directly")
    7644d5819cf8 ("powerpc: Create asm/debugfs.h and move powerpc_debugfs_root there")
    7c0f6ba682b9 ("Replace <asm/uaccess.h> with <linux/uaccess.h> globally")
    8eb07b187000 ("powerpc/mm: Dump linux pagetables")
    92e3da3cf193 ("powerpc: initial pkey plumbing")
    bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
    da6658859b9c ("powerpc: Change places using CONFIG_KEXEC to use CONFIG_KEXEC_CORE instead.")
    dd5ac03e0955 ("powerpc/mm: Fix page table dump build on non-Book3S")

v4.4.232: Failed to apply! Possible dependencies:
    019132ff3daf ("x86/mm/pkeys: Fill in pkey field in siginfo")
    0e749e54244e ("dax: increase granularity of dax_clear_blocks() operations")
    1a8916ee3ac2 ("powerpc: Detect the secure boot mode of the system")
    33a709b25a76 ("mm/gup, x86/mm/pkeys: Check VMAs and PTEs for protection keys")
    34c0fd540e79 ("mm, dax, pmem: introduce pfn_t")
    3565fce3a659 ("mm, x86: get_user_pages() for dax mappings")
    52db400fcd50 ("pmem, dax: clean up clear_pmem()")
    5c1d90f51027 ("x86/mm/pkeys: Add PTE bits for storing protection key")
    63c17fb8e5a4 ("mm/core, x86/mm/pkeys: Store protection bits in high VMA flags")
    69660fd797c3 ("x86, mm: introduce _PAGE_DEVMAP")
    7b2d0dbac489 ("x86/mm/pkeys: Pass VMA down in to fault signal generation code")
    8f62c883222c ("x86/mm/pkeys: Add arch-specific VMA protection bits")
    92e3da3cf193 ("powerpc: initial pkey plumbing")
    b2e0d1625e19 ("dax: fix lifetime of in-kernel dax mappings with dax_map_atomic()")
    b95f5f4391fa ("libnvdimm: convert to statically allocated badblocks")
    bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
    f25748e3c34e ("mm, dax: convert vmf_insert_pfn_pmd() to pfn_t")
    fe683adabfe6 ("dax: guarantee page aligned results from bdev_direct_access()")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
