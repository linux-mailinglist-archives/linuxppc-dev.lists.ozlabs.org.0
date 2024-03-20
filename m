Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 444DD881712
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 19:04:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KT2XkyjS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0Ggk0Tr3z3vbg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 05:04:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KT2XkyjS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0Gg15kTnz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 05:03:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 092156106D;
	Wed, 20 Mar 2024 18:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB2AC433F1;
	Wed, 20 Mar 2024 18:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710957819;
	bh=rtNpxUvHf2jH9+p/WX4OSE0NIMCFyZPxBNfrQ4XJKF0=;
	h=From:To:Cc:Subject:Date:From;
	b=KT2XkyjSLxo+ONcnO2ZQba1NcVrBFuY3cN/I5oHrVScqmqp8rPKW1u4eVhfpYX+F0
	 MxiguZiKMdh6jhNQEV7wP9JabdOCN1N/2j5jjzezYGu63fgCmy4mU5O6xFh4G6BQbU
	 va//epIxZCHyAy+IRRin8Cpmr8NioOUq2C21SYOY5eG93+mK1RqJGeRUWfd6wqiGV/
	 3d1ySDWIE1fDQi7X/ypZcbBpI0oDjIxot0d0VFB9pDmtc9VLnh7f5C3LinVoMOGuZQ
	 FNB+moL3NNlpOV+v0ZV77opjIS9FwIfQGo/xRiyxMTPqPBPzmePxT1KgCvE41Ov88H
	 G9CIrwyLNFDBw==
From: Arnd Bergmann <arnd@kernel.org>
To: Geoff Levand <geoff@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Paul Mackerras <paulus@ozlabs.org>,
	Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: [PATCH] powerpc: ps3: mark ps3_notification_device static for stack usage
Date: Wed, 20 Mar 2024 19:03:21 +0100
Message-Id: <20240320180333.151043-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Kevin Hao <haokexin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Justin Stitt <justinstitt@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The device is way too large to be on the stack, causing a warning for
an allmodconfig build with clang:

arch/powerpc/platforms/ps3/device-init.c:771:12: error: stack frame size (2064) exceeds limit (2048) in 'ps3_probe_thread' [-Werror,-Wframe-larger-than]
  771 | static int ps3_probe_thread(void *data)

There is only a single thread that ever accesses this, so it's fine to
make it static, which avoids the warning.

Fixes: b4cb2941f855 ("[POWERPC] PS3: Use the HVs storage device notification mechanism properly")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/platforms/ps3/device-init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
index 878bc160246e..ce99f06698a9 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -770,7 +770,7 @@ static struct task_struct *probe_task;
 
 static int ps3_probe_thread(void *data)
 {
-	struct ps3_notification_device dev;
+	static struct ps3_notification_device dev;
 	int res;
 	unsigned int irq;
 	u64 lpar;
-- 
2.39.2

