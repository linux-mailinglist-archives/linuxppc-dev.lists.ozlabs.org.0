Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F546E060
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 06:59:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qf1V3KWyzDqSS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 14:59:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="H+FsSm6x"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qcrL2VH8zDqjh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 14:06:26 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E889218BC;
 Fri, 19 Jul 2019 04:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563509184;
 bh=5objRnYHCmulPFW07H0iD2s+QME+63EI23t7tqFFspE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H+FsSm6xBSdtu3WlnOPn20Svr32W2CbKKVjpy8xMZYsos5A6PD8zA6PbLRva47XXT
 EPEzOE+dmxWFDeLNzKNgbUm6ZeHEsymJl3ezv1EeHUQSDs/M11xBSNyuI2KwXZHsxg
 FFmtXcKK5ukNkBo9aYnWa6QCz7bxIw/+yoKrcD0I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 112/141] powerpc/boot: add {get,
 put}_unaligned_be32 to xz_config.h
Date: Fri, 19 Jul 2019 00:02:17 -0400
Message-Id: <20190719040246.15945-112-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit 9e005b761e7ad153dcf40a6cba1d681fe0830ac6 ]

The next commit will make the way of passing CONFIG options more robust.
Unfortunately, it would uncover another hidden issue; without this
commit, skiroot_defconfig would be broken like this:

|   WRAP    arch/powerpc/boot/zImage.pseries
| arch/powerpc/boot/wrapper.a(decompress.o): In function `bcj_powerpc.isra.10':
| decompress.c:(.text+0x720): undefined reference to `get_unaligned_be32'
| decompress.c:(.text+0x7a8): undefined reference to `put_unaligned_be32'
| make[1]: *** [arch/powerpc/boot/Makefile;383: arch/powerpc/boot/zImage.pseries] Error 1
| make: *** [arch/powerpc/Makefile;295: zImage] Error 2

skiroot_defconfig is the only defconfig that enables CONFIG_KERNEL_XZ
for ppc, which has never been correctly built before.

I figured out the root cause in lib/decompress_unxz.c:

| #ifdef CONFIG_PPC
| #      define XZ_DEC_POWERPC
| #endif

CONFIG_PPC is undefined here in the ppc bootwrapper because autoconf.h
is not included except by arch/powerpc/boot/serial.c

XZ_DEC_POWERPC is not defined, therefore, bcj_powerpc() is not compiled
for the bootwrapper.

With the next commit passing CONFIG_PPC correctly, we would realize that
{get,put}_unaligned_be32 was missing.

Unlike the other decompressors, the ppc bootwrapper duplicates all the
necessary helpers in arch/powerpc/boot/.

The other architectures define __KERNEL__ and pull in helpers for
building the decompressors.

If ppc bootwrapper had defined __KERNEL__, lib/xz/xz_private.h would
have included <asm/unaligned.h>:

| #ifdef __KERNEL__
| #       include <linux/xz.h>
| #       include <linux/kernel.h>
| #       include <asm/unaligned.h>

However, doing so would cause tons of definition conflicts since the
bootwrapper has duplicated everything.

I just added copies of {get,put}_unaligned_be32, following the
bootwrapper coding convention.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190705100144.28785-1-yamada.masahiro@socionext.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/boot/xz_config.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/boot/xz_config.h b/arch/powerpc/boot/xz_config.h
index e22e5b3770dd..ebfadd39e192 100644
--- a/arch/powerpc/boot/xz_config.h
+++ b/arch/powerpc/boot/xz_config.h
@@ -20,10 +20,30 @@ static inline uint32_t swab32p(void *p)
 
 #ifdef __LITTLE_ENDIAN__
 #define get_le32(p) (*((uint32_t *) (p)))
+#define cpu_to_be32(x) swab32(x)
+static inline u32 be32_to_cpup(const u32 *p)
+{
+	return swab32p((u32 *)p);
+}
 #else
 #define get_le32(p) swab32p(p)
+#define cpu_to_be32(x) (x)
+static inline u32 be32_to_cpup(const u32 *p)
+{
+	return *p;
+}
 #endif
 
+static inline uint32_t get_unaligned_be32(const void *p)
+{
+	return be32_to_cpup(p);
+}
+
+static inline void put_unaligned_be32(u32 val, void *p)
+{
+	*((u32 *)p) = cpu_to_be32(val);
+}
+
 #define memeq(a, b, size) (memcmp(a, b, size) == 0)
 #define memzero(buf, size) memset(buf, 0, size)
 
-- 
2.20.1

