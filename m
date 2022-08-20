Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD0B59AD4B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 12:53:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8wTD2n7Zz3cfh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 20:53:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AVYVU8Hh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AVYVU8Hh;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8wSf1f7Vz3bgR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 20:52:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5FE0AB80B73;
	Sat, 20 Aug 2022 10:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00753C433D6;
	Sat, 20 Aug 2022 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660992766;
	bh=kjl8KFfWfLt1gRh1KXUyvdPAfOQf/V79CB8AnlsUiX8=;
	h=From:To:Cc:Subject:Date:From;
	b=AVYVU8HhkItCb7pSBIgp8UVduS0OM7h107GiQgb0SgQTADOiV1nSh7D1HRy0+MsLT
	 WsK4uhjLiRDtN/66bu2EVxk0R+NJXwrCENHGE4cQXnnjpJGPPkH6Ayi4VBIPMlpH9y
	 yIrv9SbVIAlevhJwCIFd+pEKfIrMoCCIfLbeIl7JEYtprBO77NNEJVNZsugJOXgyNN
	 r98HNcw277u9R58JGMb/Fh4DzUnMelAW46YLyW2cf/eUJMlcZ0H8O4DaM5LChnpF2O
	 i2H7vUt/XLJ0eThr+zMcVFFg2O58gQ11W07vpHY02mzmqlcUQoEDA5twO09Tm/eOzZ
	 H6T5/uR6MQ6ow==
Received: by pali.im (Postfix)
	id 067B15D0; Sat, 20 Aug 2022 12:52:42 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Joel Stanley <joel@jms.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: [PATCH] powerpc/boot: Fix compilation of uImage for e500 platforms
Date: Sat, 20 Aug 2022 12:52:00 +0200
Message-Id: <20220820105200.30425-1-pali@kernel.org>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 40a75584e526 ("powerpc/boot: Build wrapper for an appropriate CPU")
broke compilation of uImage target for mpc85xx platforms by powerpc e500
SPE capable cross compilers. After that commit build process throws error:

    BOOTAS  arch/powerpc/boot/crt0.o
  powerpc-linux-gnuspe-gcc: error: unrecognized argument in option ‘-mcpu=powerpc’
  powerpc-linux-gnuspe-gcc: note: valid arguments to ‘-mcpu=’ are: 8540 8548 native
  make[1]: *** [arch/powerpc/boot/Makefile:231: arch/powerpc/boot/crt0.o] Error 1

Fix this issue by checking for CONFIG_PPC_E500MC / CONFIG_E500 options and
applying appropriate -mcpu options for building uImage boot code.

Fixes: 40a75584e526 ("powerpc/boot: Build wrapper for an appropriate CPU")
Cc: stable@vger.kernel.org
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/boot/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index a9cd2ea4a861..d7cf5d87e4bc 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -44,8 +44,14 @@ else
 BOOTCFLAGS	+= -m64 -mcpu=powerpc64
 endif
 else
+ifdef CONFIG_PPC_E500MC
+BOOTCFLAGS	+= -m32 $(call cc-option,-mcpu=e500mc,-mcpu=powerpc)
+else ifdef CONFIG_E500
+BOOTCFLAGS	+= -m32 $(call cc-option,-mcpu=8540 -msoft-float,-mcpu=powerpc)
+else
 BOOTCFLAGS	+= -m32 -mcpu=powerpc
 endif
+endif
 
 BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
-- 
2.20.1

