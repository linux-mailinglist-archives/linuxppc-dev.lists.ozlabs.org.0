Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA3B523CE3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 20:51:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz3sV3xhFz3cdR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 04:51:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jrXbXPNa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jrXbXPNa; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz3rG4VXzz3brf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 04:50:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC7D560FB6;
 Wed, 11 May 2022 18:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F918C34116;
 Wed, 11 May 2022 18:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652295020;
 bh=KFtyK20wD7qo3wx7y06tzmCYkVP3dZQUR8hshfm6OQM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jrXbXPNa7Vz8OrBEmX/RvrQpymYcwQmcnu4Pr03TYdhA2Yg1mcMLWfvSIUK0jQKRO
 +XIogWi14iyKeRdr/bUtRUXNulSyAmkIYNNyfIcAugT+NFuCfLY31+cgobwxaSQsAs
 Hr3sDp+l6mUJz8fdroa98/2xqTY+b2fTtl8sAu3lRm9NbyOi3TJTnt+4wpKIZm4fa1
 GeaezhNFs4HuCHMhvRPoy0qxB1VNouKZExwauBz1f8WZGGnWGVYQwYhm3mC9zsKJOT
 cMqoO6rX5M7gZC2zbBO9eW+0ifhiRd22mhIEkNTuaYKTmI4sW0Y//KuKEx5IiY7/5P
 gkD1aCAjEP2RQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 1/2] powerpc/vdso: Remove unused ENTRY in linker scripts
Date: Wed, 11 May 2022 11:50:00 -0700
Message-Id: <20220511185001.3269404-2-nathan@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511185001.3269404-1-nathan@kernel.org>
References: <20220511185001.3269404-1-nathan@kernel.org>
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
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When linking vdso{32,64}.so.dbg with ld.lld, there is a warning about
not finding _start for the starting address:

  ld.lld: warning: cannot find entry symbol _start; not setting start address
  ld.lld: warning: cannot find entry symbol _start; not setting start address

Looking at GCC + GNU ld, the entry point address is 0x0:

  $ llvm-readelf -h vdso{32,64}.so.dbg &| rg "(File|Entry point address):"
  File: vdso32.so.dbg
    Entry point address:               0x0
  File: vdso64.so.dbg
    Entry point address:               0x0

This matches what ld.lld emits:

  $ powerpc64le-linux-gnu-readelf -p .comment vdso{32,64}.so.dbg

  File: vdso32.so.dbg

  String dump of section '.comment':
    [     0]  Linker: LLD 14.0.0
    [    14]  clang version 14.0.0 (Fedora 14.0.0-1.fc37)

  File: vdso64.so.dbg

  String dump of section '.comment':
    [     0]  Linker: LLD 14.0.0
    [    14]  clang version 14.0.0 (Fedora 14.0.0-1.fc37)

  $ llvm-readelf -h vdso{32,64}.so.dbg &| rg "(File|Entry point address):"
  File: vdso32.so.dbg
    Entry point address:               0x0
  File: vdso64.so.dbg
    Entry point address:               0x0

Remove ENTRY to remove the warning, as it is unnecessary for the vDSO to
function correctly.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/kernel/vdso/vdso32.lds.S | 1 -
 arch/powerpc/kernel/vdso/vdso64.lds.S | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index 58e0099f70f4..e0d19d74455f 100644
--- a/arch/powerpc/kernel/vdso/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
@@ -13,7 +13,6 @@ OUTPUT_FORMAT("elf32-powerpcle", "elf32-powerpcle", "elf32-powerpcle")
 OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc", "elf32-powerpc")
 #endif
 OUTPUT_ARCH(powerpc:common)
-ENTRY(_start)
 
 SECTIONS
 {
diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
index 0288cad428b0..1a4a7bc4c815 100644
--- a/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -13,7 +13,6 @@ OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
 OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
 #endif
 OUTPUT_ARCH(powerpc:common64)
-ENTRY(_start)
 
 SECTIONS
 {
-- 
2.36.1

