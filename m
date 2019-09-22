Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2109ABA402
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2019 20:49:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bxMc4wGpzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 04:49:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="FjTFsT8t"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bxJF6FPTzDqL7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 04:46:53 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69F0D21D56;
 Sun, 22 Sep 2019 18:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569178010;
 bh=eMPlCWxTQpyconOk0Sr//jZgoyEkKBpyv80QPkFVPI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FjTFsT8tIpK/vNBKjgdeL78leIjHhrP6GEUDWV4oqp7VLukZL/48fJYLJjJOys1hK
 E6NpZ1LAt0zIs5k2BuTnhKiHbBOG6KlpiRhpPMa0hC4sBpIYL1nVoguww502HLlEMm
 F6cg0VLEGcKtGqpGlrO5VoaKYcpAzTJAvHX6yMSA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 097/203] powerpc/Makefile: Always pass --synthetic
 to nm if supported
Date: Sun, 22 Sep 2019 14:42:03 -0400
Message-Id: <20190922184350.30563-97-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922184350.30563-1-sashal@kernel.org>
References: <20190922184350.30563-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Peter Collingbourne <pcc@google.com>,
 linuxppc-dev@lists.ozlabs.org, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit 117acf5c29dd89e4c86761c365b9724dba0d9763 ]

Back in 2004 we added logic to arch/ppc64/Makefile to pass
the --synthetic option to nm, if it was supported by nm.

Then in 2005 when arch/ppc64 and arch/ppc were merged, the logic to
add --synthetic was moved inside an #ifdef CONFIG_PPC64 block within
arch/powerpc/Makefile, and has remained there since.

That was fine, though crufty, until recently when a change to
init/Kconfig added a config time check that uses $(NM). On powerpc
that leads to an infinite loop because Kconfig uses $(NM) to calculate
some values, then the powerpc Makefile changes $(NM), which Kconfig
notices and restarts.

The original commit that added --synthetic simply said:
  On new toolchains we need to use nm --synthetic or we miss code
  symbols.

And the nm man page says that the --synthetic option causes nm to:
  Include synthetic symbols in the output. These are special symbols
  created by the linker for various purposes.

So it seems safe to always pass --synthetic if nm supports it, ie. on
32-bit and 64-bit, it just means 32-bit kernels might have more
symbols reported (and in practice I see no extra symbols). Making it
unconditional avoids the #ifdef CONFIG_PPC64, which in turn avoids the
infinite loop.

Debugged-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index c345b79414a96..403f7e193833a 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -39,13 +39,11 @@ endif
 uname := $(shell uname -m)
 KBUILD_DEFCONFIG := $(if $(filter ppc%,$(uname)),$(uname),ppc64)_defconfig
 
-ifdef CONFIG_PPC64
 new_nm := $(shell if $(NM) --help 2>&1 | grep -- '--synthetic' > /dev/null; then echo y; else echo n; fi)
 
 ifeq ($(new_nm),y)
 NM		:= $(NM) --synthetic
 endif
-endif
 
 # BITS is used as extension for files which are available in a 32 bit
 # and a 64 bit version to simplify shared Makefiles.
-- 
2.20.1

