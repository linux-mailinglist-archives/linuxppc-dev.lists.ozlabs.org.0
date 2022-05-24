Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C35326A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 11:40:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6q234mg3z3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 19:40:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I86vb4PB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I86vb4PB; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6q1S4nnjz30BP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 19:40:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA32F6164E;
 Tue, 24 May 2022 09:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE16DC385AA;
 Tue, 24 May 2022 09:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653385209;
 bh=XsiPB+YmgXZsRlXprg01ZA3bkNDDn/VDzc7T4K91VkQ=;
 h=From:To:Cc:Subject:Date:From;
 b=I86vb4PBaO9vScyygfzJ8J4eaAUxqUdt7VKo32RX6XV/TOxkMEZwtuXWPvTR8XawH
 cJdtEIJqjJPQsHGQ4lXTeP3jZXjTM2KWg0JC8TgtO0vxfiae/eAAEPzn24QfYX0mSW
 bdZ7FzX0Kgs+xoXpwknpvubbysG7H8dR1EZFn1WRrGGB3Y8x6ybPgwJkMN6YNSLFjo
 7+OrKyweIoplXE66LAsGUuqo+Kd8jvCoszAcHZBsKc846Y5P7jbL5uYZKjazxfZuxH
 lktWa1+wA1mxXpRwTDcfpWX9BVn34w3o2Wkhfa1sVHdP7Ac1ZNxKkkx4JmS34X5kRr
 HN5mXjfCaK4rQ==
Received: by pali.im (Postfix)
 id 392A09ED; Tue, 24 May 2022 11:40:06 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Date: Tue, 24 May 2022 11:39:39 +0200
Message-Id: <20220524093939.30927-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

gcc e500 compiler does not support -mcpu=powerpc option. When it is
specified then gcc throws compile error:

  gcc: error: unrecognized argument in option ‘-mcpu=powerpc’
  gcc: note: valid arguments to ‘-mcpu=’ are: 8540 8548 native

So do not set -mcpu=powerpc option when CONFIG_E500 is set. Correct option
-mcpu=8540 for CONFIG_E500 is set few lines below in that Makefile.

Signed-off-by: Pali Rohár <pali@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/powerpc/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index eb541e730d3c..87f9f29ac9d2 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -22,11 +22,16 @@ ifdef CONFIG_PPC32
 # or platform code sets later on the command line, but they are needed
 # to set a sane 32-bit cpu target for the 64-bit cross compiler which
 # may default to the wrong ISA.
+# Never set -mcpu=powerpc option for gcc e500 compiler because this
+# option is unsupported and throws error. The correct option for
+# CONFIG_E500 is -mcpu=8540 and it is set few lines below.
+ifndef CONFIG_E500
 KBUILD_CFLAGS		+= -mcpu=powerpc
 KBUILD_AFLAGS		+= -mcpu=powerpc
 endif
 endif
 endif
+endif
 
 ifdef CONFIG_PPC_BOOK3S_32
 KBUILD_CFLAGS		+= -mcpu=powerpc
-- 
2.20.1

