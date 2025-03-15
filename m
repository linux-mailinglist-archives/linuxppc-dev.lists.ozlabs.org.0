Return-Path: <linuxppc-dev+bounces-7089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FDDA62B5F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 11:59:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFJCG3vfJz30WR;
	Sat, 15 Mar 2025 21:59:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742036362;
	cv=none; b=oSJNIfjrIcRu8ZxLkwnm8eHlQwRP8gAIayFAjNvJoHTD3uX+nyAAldLdIGaMR3hp70SzR+LI6qPzlkTvWpA1yuGjxgZa9Pgh5Gs1Xm83c+OT9lRp+ap1BPR0EPeKPiz5TemdZz5JPcg5zsX9SQD7hRkhGqrNlknoV3fRihfThHeBbAa+w2vb958/XD6G8cYFmcuL3XSHkrNtetOAhOp8pTnF0/mE6PXj9DnanWeDiRQSJrwMhibuKa0LYLTRqvjsRE29BGe7Sz6R2js9idjpqB4iv1RFmIanmFOkEUZ8D3oxtadqnOi89+PCrb6GrisEt35yfa7BnXLLo6mWxFtYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742036362; c=relaxed/relaxed;
	bh=IrABPcdivvTaEQt+ie9Gu81RLwySO8rqlyCx4QdOs/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fMeq0RpqMk9YKnvN/Dcd6XiyZf7GGVTMQc4gVA1CoNEK78wrl3ML12gNkAZnWOrZveZuP3EuM/t/1qlpeCoWxV9KqztKu1SqPTj3Cwh2uK0FzRk4fpVzuT0yd4DwvKM7/h6cifL6JKvs3Ix8jluiBX28h45dq2PsqoCY0PZ16dqhcvWIOD/pyKshK2esZgj2QRmtnQ8Ye8t35OYX217ryNdG249gPE50imKLOmcyLi/eRJJI/UZY07eE6/PoFnSXoHz/no6SH/c5gGubXyDCfl0O1egV3BALF8M+YRJNVYDpTF51AbhGzngufZAhh5IqO/IMzuiAE62d8eYsU9ODvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QeGm8n/1; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QeGm8n/1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFJCF26Syz30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 21:59:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B91ADA48A11;
	Sat, 15 Mar 2025 10:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7029DC4CEE5;
	Sat, 15 Mar 2025 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742036357;
	bh=iNj1uai8aBt7DaA8QRTxehgmfPjURYUtO7lvJ9FyPYE=;
	h=From:To:Cc:Subject:Date:From;
	b=QeGm8n/1yaBlknAiTM9PbcGBvfecLE14NaWyggw7irJxQ9ZUD4gwqWeD6R+76W8+o
	 5gZQY1kDfZgbS3U5Ra1LSv3PhQMXoT5G/0Dkekya8DP5aDGcA/Nui9Iw/HTHBij+GU
	 KaOwiwXausYMh5f+P2Dhq3ZRMVh0bV870WhMtPWKeMqxj3BUGb6y9gI31eLbZi6tpu
	 2yddEKW6LavqZ+2iOUFrf5fg3qxiiVYyA5TbVg5+qaqjOZDpQJzNk/oRrL9Stu5ouB
	 IwMueWvL5VGHzPMBsUALBkRyLFmjUPO0kQAnAqcZ0HX4E2/y0YbuJD6CcBwjOue+pl
	 IOVRtFaA0/coQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Julian Vetter <julian@outer-limits.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 0/6] asm-generic: io.h cleanups
Date: Sat, 15 Mar 2025 11:59:01 +0100
Message-Id: <20250315105907.1275012-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

After the previous round of cleanups for asm-generic/io,h on the
ioread64 helpers, I had another look at the architecture specific
versions, especially those that caused build failures in the past.

These are some simplifications that I would like to merge at the same
time, please have a look. Hopefully these are all uncontroversial.

I have a few more patches for m68k that need a more thorough
review and testing, will post them after the merge window.

Arnd Bergmann (6):
  alpha: stop using asm-generic/iomap.h
  sh: remove duplicate ioread/iowrite helpers
  parisc: stop using asm-generic/iomap.h
  powerpc: asm/io.h: remove split ioread64/iowrite64 helpers
  mips: drop GENERIC_IOMAP wrapper
  m68k/nommu: stop using GENERIC_IOMAP

 arch/alpha/include/asm/io.h   |  31 ++++---
 arch/m68k/Kconfig             |   2 +-
 arch/m68k/include/asm/io_no.h |   4 -
 arch/mips/Kconfig             |   2 +-
 arch/mips/include/asm/io.h    |  21 ++---
 arch/mips/lib/iomap-pci.c     |   9 ++
 arch/parisc/include/asm/io.h  |  36 ++++++--
 arch/powerpc/include/asm/io.h |  48 ----------
 arch/sh/include/asm/io.h      |  30 ++-----
 arch/sh/kernel/Makefile       |   3 -
 arch/sh/kernel/iomap.c        | 162 ----------------------------------
 arch/sh/kernel/ioport.c       |   5 --
 arch/sh/lib/io.c              |   4 +-
 drivers/sh/clk/cpg.c          |  25 +++---
 14 files changed, 84 insertions(+), 298 deletions(-)
 delete mode 100644 arch/sh/kernel/iomap.c

-- 
2.39.5

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Julian Vetter <julian@outer-limits.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org

