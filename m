Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F92E32B490
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 06:27:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dr2ZG0DsFz3cxl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 16:27:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d6eV35ZP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d6eV35ZP; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqnmp0vM8z30N7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 06:50:49 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A6CC60201;
 Tue,  2 Mar 2021 19:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614714646;
 bh=S5zLlyqTS4bPCDBeQLQlrq+lr35udnmJMzLYiOmY8f8=;
 h=From:To:Cc:Subject:Date:From;
 b=d6eV35ZP5ds1iqC9d0QYDkq5pojZ2icNP1P+w9EXalsdPml0LtRCCZINGg2QYzbJY
 Mu1t5lBk+gUMPwskrQkjAWgndAv3mYpd9otYcI3ZF8dEqR1jsHB9dKOVkxUTYDIEnx
 TEo8TB7bOY6ZHRRRAuhnrQWOfuc+HQpS80rkMutcWhbQrv12PDEemF8RqlYg+EgDdf
 3XHe/ZZfdKr90xGC16DpKkv/Ws984SDRbtDh2RYZ/un6/tCSzwwX7HLA1B0hjH58Sd
 phkESWQw+62mvh7zqOwIUcF/SpsBLAuMqCOmj+KDB+x5Dn8QFiEXa6MG1WDCUHAYqL
 7/VlXhfwPG+fg==
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/fadump: Mark fadump_calculate_reserve_size as __init
Date: Tue,  2 Mar 2021 12:50:14 -0700
Message-Id: <20210302195013.2626335-1-nathan@kernel.org>
X-Mailer: git-send-email 2.31.0.rc0.75.gec125d1bc1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Mar 2021 16:27:13 +1100
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
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If fadump_calculate_reserve_size() is not inlined, there is a modpost
warning:

WARNING: modpost: vmlinux.o(.text+0x5196c): Section mismatch in
reference from the function fadump_calculate_reserve_size() to the
function .init.text:parse_crashkernel()
The function fadump_calculate_reserve_size() references
the function __init parse_crashkernel().
This is often because fadump_calculate_reserve_size lacks a __init
annotation or the annotation of parse_crashkernel is wrong.

fadump_calculate_reserve_size() calls parse_crashkernel(), which is
marked as __init and fadump_calculate_reserve_size() is called from
within fadump_reserve_mem(), which is also marked as __init.

Mark fadump_calculate_reserve_size() as __init to fix the section
mismatch. Additionally, remove the inline keyword as it is not necessary
to inline this function; the compiler is still free to do so if it feels
it is worthwhile since commit 889b3c1245de ("compiler: remove
CONFIG_OPTIMIZE_INLINING entirely").

Fixes: 11550dc0a00b ("powerpc/fadump: reuse crashkernel parameter for fadump memory reservation")
Link: https://github.com/ClangBuiltLinux/linux/issues/1300
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

Send while streaming at https://www.twitch.tv/nathanchance :P

 arch/powerpc/kernel/fadump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 8482739d42f3..eddf362caedc 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -292,7 +292,7 @@ static void fadump_show_config(void)
  * that is required for a kernel to boot successfully.
  *
  */
-static inline u64 fadump_calculate_reserve_size(void)
+static __init u64 fadump_calculate_reserve_size(void)
 {
 	u64 base, size, bootmem_min;
 	int ret;

base-commit: 5c88a17e15795226b56d83f579cbb9b7a4864f79
-- 
2.31.0.rc0.75.gec125d1bc1

