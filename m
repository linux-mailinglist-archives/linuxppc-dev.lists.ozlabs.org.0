Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C63672968F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 06:01:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHVsQ4fT3zDr3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 15:01:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHVqq75TGzDqyS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 15:00:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TR21svSb; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CHVqq5gxwz9sSW; Fri, 23 Oct 2020 15:00:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CHVqq4vQ1z9sSn; Fri, 23 Oct 2020 15:00:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603425607;
 bh=VhbbGh3y1UeQQdGvzohO13+IR1sQ8VT9mRNBUoiT6oQ=;
 h=From:To:Subject:Date:From;
 b=TR21svSbplTbZy8B65WsblUEpztoBwuQazPNqVxZaP6hvHg4DhmlJJdtgc1sBZYk2
 sYw0+9ah8Kf8FZ0xFol1wdj7nnlwTnA3MW7jMyy0Kay2LKLHzDNi7gIzcS2WGqYDrr
 dezxbI1QpkrrmToL35u6vScVneV4rioqgz2Dqo/8Zim1B6uibqG/pokC55ULcQHvXA
 qkenhTNTFqu+H12TA7/G7F2wEU8NtOe+KoEihKrmjS/skQxh9iitdGvadhiwUs+gSZ
 2ofmAFmcH3rjKgaxio+YCfbUcjK7rg2qn27LNXh2NUAGVhHicdg90Bv8k7tFXWckhx
 DbOe44F9kBNYA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc: Add config fragment for disabling -Werror
Date: Fri, 23 Oct 2020 15:00:02 +1100
Message-Id: <20201023040002.3313371-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This makes it easy to disable building with -Werror:

  $ make defconfig
  $ grep WERROR .config
  # CONFIG_PPC_DISABLE_WERROR is not set
  CONFIG_PPC_WERROR=y

  $ make disable-werror.config
    GEN     Makefile
  Using .config as base
  Merging arch/powerpc/configs/disable-werror.config
  Value of CONFIG_PPC_DISABLE_WERROR is redefined by fragment arch/powerpc/configs/disable-werror.config:
  Previous value: # CONFIG_PPC_DISABLE_WERROR is not set
  New value: CONFIG_PPC_DISABLE_WERROR=y
  ...

  $ grep WERROR .config
  CONFIG_PPC_DISABLE_WERROR=y

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/disable-werror.config | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 arch/powerpc/configs/disable-werror.config

diff --git a/arch/powerpc/configs/disable-werror.config b/arch/powerpc/configs/disable-werror.config
new file mode 100644
index 000000000000..6ea12a12432c
--- /dev/null
+++ b/arch/powerpc/configs/disable-werror.config
@@ -0,0 +1 @@
+CONFIG_PPC_DISABLE_WERROR=y
-- 
2.25.1

