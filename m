Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9285952062D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 22:48:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxtY63kYKz3cR7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 06:48:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XES4qUCA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XES4qUCA; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxtWp2zQkz3bbp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 06:47:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5C05616EB;
 Mon,  9 May 2022 20:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54442C385BC;
 Mon,  9 May 2022 20:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652129218;
 bh=8b9BPSUDAbX/vgt6SHngGTCLvHF7koypNrvZpxSa5Rk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XES4qUCAyhyBfNoKKttczOaGkMn9KiNfx7WItnK6Spbf90sutbnriX4PGoGcZBRx7
 qsycQkwhrnmzL7mcWeK6x5gmAIFRqp3AvdAxkirZw1uY1imLNVAjuQOQMhJJtNHqbi
 PzSl8jyD1QKQQRckCtHzJ1RK9EZ4+puJgxQ+YpXtWeu71t8qu8sPbhegJlJvzc9dXt
 sIKKsmI7NA8eFQ10/f8fC7iq2TvAwWa9qHpwo8776u5B5BUsTN7B7/QrbSY9F+Z0Bl
 hIgRlv3kHkMhzCBjFOiy77UsOcqJpSiZlkmxfeHLxhRDcElQOXDAaeuPW66aJJNEO+
 BC4x4giXWd8vA==
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/vdso: Remove unused ENTRY in linker scripts
Date: Mon,  9 May 2022 13:46:34 -0700
Message-Id: <20220509204635.2539549-2-nathan@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220509204635.2539549-1-nathan@kernel.org>
References: <20220509204635.2539549-1-nathan@kernel.org>
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

