Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AE211BAD3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 18:58:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y4RW2nxLzDq9W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 04:58:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="h9x1n5q2"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y1LN3HgQzDqft
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 02:38:52 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71B342467F;
 Wed, 11 Dec 2019 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576078730;
 bh=IG9kGKLljauydAeaT7R+w9w3rEQaS3pDBysxhkF6U/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h9x1n5q2tbIyxwxJ0z3JcbN1K1sXNlj5HyieaMbWqex5TfE8cbOu2P1492f/Ibhth
 YfR/12TM5Ru+qoj2OnYwKdx6S4myIsAs1mlJQFFma3Sfpp/X4Vg2p4HCNmts/bubpD
 Kw97iab3a8H/4VxeFT6Mi5/J2vA8NaC0gCGXHxSI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 34/37] libfdt: define INT32_MAX and UINT32_MAX in
 libfdt_env.h
Date: Wed, 11 Dec 2019 10:38:10 -0500
Message-Id: <20191211153813.24126-34-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211153813.24126-1-sashal@kernel.org>
References: <20191211153813.24126-1-sashal@kernel.org>
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
 Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit a8de1304b7df30e3a14f2a8b9709bb4ff31a0385 ]

The DTC v1.5.1 added references to (U)INT32_MAX.

This is no problem for user-space programs since <stdint.h> defines
(U)INT32_MAX along with (u)int32_t.

For the kernel space, libfdt_env.h needs to be adjusted before we
pull in the changes.

In the kernel, we usually use s/u32 instead of (u)int32_t for the
fixed-width types.

Accordingly, we already have S/U32_MAX for their max values.
So, we should not add (U)INT32_MAX to <linux/limits.h> any more.

Instead, add them to the in-kernel libfdt_env.h to compile the
latest libfdt.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/compressed/libfdt_env.h | 4 +++-
 arch/powerpc/boot/libfdt_env.h        | 2 ++
 include/linux/libfdt_env.h            | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/compressed/libfdt_env.h b/arch/arm/boot/compressed/libfdt_env.h
index 005bf4ff1b4cb..f3ddd4f599e3e 100644
--- a/arch/arm/boot/compressed/libfdt_env.h
+++ b/arch/arm/boot/compressed/libfdt_env.h
@@ -1,11 +1,13 @@
 #ifndef _ARM_LIBFDT_ENV_H
 #define _ARM_LIBFDT_ENV_H
 
+#include <linux/limits.h>
 #include <linux/types.h>
 #include <linux/string.h>
 #include <asm/byteorder.h>
 
-#define INT_MAX			((int)(~0U>>1))
+#define INT32_MAX	S32_MAX
+#define UINT32_MAX	U32_MAX
 
 typedef __be16 fdt16_t;
 typedef __be32 fdt32_t;
diff --git a/arch/powerpc/boot/libfdt_env.h b/arch/powerpc/boot/libfdt_env.h
index 0b3db6322c793..5f2cb1c53e151 100644
--- a/arch/powerpc/boot/libfdt_env.h
+++ b/arch/powerpc/boot/libfdt_env.h
@@ -5,6 +5,8 @@
 #include <string.h>
 
 #define INT_MAX			((int)(~0U>>1))
+#define UINT32_MAX		((u32)~0U)
+#define INT32_MAX		((s32)(UINT32_MAX >> 1))
 
 #include "of.h"
 
diff --git a/include/linux/libfdt_env.h b/include/linux/libfdt_env.h
index 8850e243c9406..bd0a55821177a 100644
--- a/include/linux/libfdt_env.h
+++ b/include/linux/libfdt_env.h
@@ -6,6 +6,9 @@
 
 #include <asm/byteorder.h>
 
+#define INT32_MAX	S32_MAX
+#define UINT32_MAX	U32_MAX
+
 typedef __be16 fdt16_t;
 typedef __be32 fdt32_t;
 typedef __be64 fdt64_t;
-- 
2.20.1

