Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6C5EF3D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 13:03:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdVpY1z3zz3btV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 21:03:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q+73VmIr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q+73VmIr;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdVnw70jfz2yph
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 21:03:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C04F6B8214A;
	Thu, 29 Sep 2022 11:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F08C433C1;
	Thu, 29 Sep 2022 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664449374;
	bh=1VKWcQeDFKoJAmUYEj0cP+tUilaieyXVJciTnlHebk0=;
	h=From:To:Cc:Subject:Date:From;
	b=q+73VmIrJSKTOrXEXCR//Hmhd8F9RT7ay/M9j1lNH382HTIx4DS/lfnw6yCCZz6KQ
	 C9QYo70W6DutBh8eHnqn9XKIbKWV6BXOTgq+RkWj6aZYmhLsC6TV8hC3uBagA3Gh8n
	 b8yxcIiVq3ZjtB/aYb3W1uChmUDW14XfbvgYyzyTLpevyvSr2LcOxLlflPV+ul/677
	 CK5GHm9iMVdPCkpiIyZ/3reUMa4PMCxnDLO+8VkkAcNOELJSwgMXKzUPUnOUogs80Q
	 4SFw0mZLnJvhn1zkrHWjxsnC+uqvBLXMlfeo1MgKUkEVQu2z8W9B9Fb09qgBEiWacH
	 o6Mb9+69fTJGA==
From: broonie@kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>,
	PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the powerpc tree with the kbuild tree
Date: Thu, 29 Sep 2022 12:02:48 +0100
Message-Id: <20220929110248.39712-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

Today's linux-next merge of the powerpc tree got conflicts in:

  arch/powerpc/Makefile
  arch/powerpc/kernel/Makefile

between commits:

  4f62512adbe9a ("kbuild: use obj-y instead extra-y for objects placed at the head")
  0f17eda6118db ("kbuild: remove head-y syntax")

from the kbuild tree and commits:

  dfc3095cec27f ("powerpc: Remove CONFIG_FSL_BOOKE")
  688de017efaab ("powerpc: Change CONFIG_E500 to CONFIG_PPC_E500")
  3e7318584dfec ("powerpc: Remove CONFIG_PPC_FSL_BOOK3E")
  6556fd1a1e9fc ("powerpc: Cleanup idle for e500")

from the powerpc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/powerpc/Makefile
index 89c27827a11fb,19470d29de163..0000000000000
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
diff --cc arch/powerpc/kernel/Makefile
index ad3decb9f20ba,1f121c1888051..0000000000000
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@@ -118,12 -116,12 +116,12 @@@ obj-$(CONFIG_PPC_E500)		+= cpu_setup_e5
  obj-$(CONFIG_PPC_DOORBELL)	+= dbell.o
  obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
  
 -extra-$(CONFIG_PPC64)		:= head_64.o
 -extra-$(CONFIG_PPC_BOOK3S_32)	:= head_book3s_32.o
 -extra-$(CONFIG_40x)		:= head_40x.o
 -extra-$(CONFIG_44x)		:= head_44x.o
 -extra-$(CONFIG_PPC_85xx)	:= head_85xx.o
 -extra-$(CONFIG_PPC_8xx)		:= head_8xx.o
 +obj-$(CONFIG_PPC64)		+= head_64.o
 +obj-$(CONFIG_PPC_BOOK3S_32)	+= head_book3s_32.o
 +obj-$(CONFIG_40x)		+= head_40x.o
 +obj-$(CONFIG_44x)		+= head_44x.o
- obj-$(CONFIG_FSL_BOOKE)		+= head_fsl_booke.o
++obj-$(CONFIG_PPC_85xx)		+= head_85xx.o
 +obj-$(CONFIG_PPC_8xx)		+= head_8xx.o
  extra-y				+= vmlinux.lds
  
  obj-$(CONFIG_RELOCATABLE)	+= reloc_$(BITS).o
