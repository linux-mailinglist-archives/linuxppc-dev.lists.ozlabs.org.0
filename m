Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D845A37F2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 15:40:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MFHrf1pk7z3c79
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 23:40:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GbnCrUrh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GbnCrUrh;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MFHr450RCz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 23:39:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6403C60C71;
	Sat, 27 Aug 2022 13:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E6CC433D6;
	Sat, 27 Aug 2022 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661607585;
	bh=WpVdubWclY2UMHlcAsADqLj3KpeQOgXN4jbUOblbBQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GbnCrUrhQ7FWd0XKQtnR0RZ1wAKCkv9XM5JBDTtTJq6j1jcmGUkVTrrc3NKM3ZNKa
	 Yhs2QadSfAP0ZnCrIPCR4G6kf84K9KhBv/d2bP3UZbz03Lke2mAAKcZmWa0iPKQBIk
	 iv3BDBidEAjZPirYGZn0t+0Off0jJhUymt24PenMb+lsawQ1zZHaVqAMHcgoXsJcO2
	 U+7cDY3SBtqs7qxA3IaP0O0e6+0fyqf0EiIilyQGwKgzLMlNOf6x0LEqDmUacY6/E1
	 iLwcK40zDTueJuA0wsPR8kedQfWgbaO20IJtKPC/fTfSVcZojZTgB+dNRb50jwY3Rx
	 wGTc20x1q2nMw==
Received: by pali.im (Postfix)
	id 1BDEEC7A; Sat, 27 Aug 2022 15:39:43 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Joel Stanley <joel@jms.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: [PATCH v2] powerpc/boot: Don't always pass -mcpu=powerpc when building 32-bit uImage
Date: Sat, 27 Aug 2022 15:39:00 +0200
Message-Id: <20220827133900.16634-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220820105200.30425-1-pali@kernel.org>
References: <20220820105200.30425-1-pali@kernel.org>
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

For 32-bit uImage try to use CONFIG_TARGET_CPU option for -mcpu. This fixes
following compiler error when building kernel with powerpc e500 SPE capable
cross compilers:

    BOOTAS  arch/powerpc/boot/crt0.o
  powerpc-linux-gnuspe-gcc: error: unrecognized argument in option ‘-mcpu=powerpc’
  powerpc-linux-gnuspe-gcc: note: valid arguments to ‘-mcpu=’ are: 8540 8548 native
  make[1]: *** [arch/powerpc/boot/Makefile:231: arch/powerpc/boot/crt0.o] Error 1

For 64-bit uImage and 64-bit kernels with 32-bit uImage wrapper there is no
change.

Similar change was already introduced for the main powerpc Makefile in
commit 446cda1b21d9 ("powerpc/32: Don't always pass -mcpu=powerpc to the
compiler").

Fixes: 40a75584e526 ("powerpc/boot: Build wrapper for an appropriate CPU")
Cc: stable@vger.kernel.org
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/boot/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index a9cd2ea4a861..f56a5f90a5d8 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -44,8 +44,16 @@ else
 BOOTCFLAGS	+= -m64 -mcpu=powerpc64
 endif
 else
+ifdef CONFIG_PPC32
+ifdef CONFIG_TARGET_CPU_BOOL
+BOOTCFLAGS	+= -m32 -mcpu=$(CONFIG_TARGET_CPU)
+else
+BOOTCFLAGS	+= -m32 -mcpu=powerpc
+endif
+else
 BOOTCFLAGS	+= -m32 -mcpu=powerpc
 endif
+endif
 
 BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
-- 
2.20.1

