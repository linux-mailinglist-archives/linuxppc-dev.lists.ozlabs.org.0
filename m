Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE4EA852
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 01:41:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473RMP18WszF5GK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 11:41:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="KkZ+NNwM"; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473R925FY7zF3wN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 11:32:06 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id n15so4305471wrw.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LuWs8dcQ+Sr64TXmHkexn1zViahF1FUWncWFh41F/hk=;
 b=KkZ+NNwMPyqf8TZ/0SNrTMfEEbtY6AkiKFiX1KC01wShyWiWJD4un4RhPqMCse8c3V
 8vK8gBksSfUJfxpaB4aCkY3CXRfcAjThUYGNBHRSplOKOXvu8P10aMmaFwAncndK+2n7
 WBZui9XlT7Gxb2n8XS6MJwcIgLAsADNcZ+Lu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LuWs8dcQ+Sr64TXmHkexn1zViahF1FUWncWFh41F/hk=;
 b=T9DWrJ52fa8tuKQfZWhni58kFxpeI2RLV3EnKmTRk9rC59iZgy7tTaHVhjCsCFHiYI
 XU2muHgS6+QfSL3cWNuSI7GDgV7STOgKKL0MKUwatqj+R0bu50O7YTLTm5bh7fm7bvwA
 ohsDzJl27F1+sich34r7/TlMxeaGte0PqfPisJJCt/M0MZeFj2xKYjLovywC1lgiqEkg
 V8hvi2S0e169rDASzV/7QBb54kicEdQBKjbtCL3mXffFZuA/7tWvf5GO8e5DaKoAyU21
 4QfdIoklTCeZuvpQSnm7cgGojL05aiJJlmij4FvwyIGgnuWTlAAHGEAzcUF344DfF2SI
 NMJw==
X-Gm-Message-State: APjAAAXcnXZIkIw+rHF0k09i/lolnZGlW/W9aL5Dw5JfOnFpoov2vYQe
 N3mRmxfI51Lgi8oVT5c63HS52Q==
X-Google-Smtp-Source: APXvYqz3E0Ue8yL/CCvXcgs/63oYTW+qO+n65QfV1mF9yHdNK4XvvLNQHrS7g7vfk5Y07iStl+BOkw==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr2407775wrp.353.1572481920804; 
 Wed, 30 Oct 2019 17:32:00 -0700 (PDT)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id r13sm2357111wra.74.2019.10.30.17.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 17:32:00 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/5] powerpc: make iowrite32be etc. inline
Date: Thu, 31 Oct 2019 01:31:49 +0100
Message-Id: <20191031003154.21969-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
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
Cc: Arnd Bergmann <arnd@arndb.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When trying to make the QUICC Engine drivers compile on arm, I
mechanically (with coccinelle) changed out_be32() to iowrite32be()
etc. Christophe pointed out [1][2] that that would pessimize the
powerpc SOCs since the IO accesses now incur a function call
overhead. He asked that I try to make those io accessors inline on
ppc, and this is the best I could come up with.

At first I tried something that wouldn't need to touch anything
outside arch/powerpc/, but I ended up with conditional inclusion of
asm-generic headers and/or duplicating a lot of their contents.

The diffstat may become a little better if kernel/iomap.c can indeed
be removed (due to !CONFIG_PPC_INDIRECT_PIO &&
CONFIG_PPC_INDIRECT_MMIO never happening).

[1] https://lore.kernel.org/lkml/6ee121cf-0e3d-4aa0-2593-fcb00995e429@c-s.fr/
[2] https://lore.kernel.org/lkml/886d5218-6d6b-824c-3ab9-63aafe41ff40@c-s.fr/

Rasmus Villemoes (5):
  asm-generic: move pcu_iounmap from iomap.h to pci_iomap.h
  asm-generic: employ "ifndef foo; define foo foo" idiom in iomap.h
  powerpc: move pci_iounmap() from iomap.c to pci-common.c
  powerpc: make pcibios_vaddr_is_ioport() static
  powerpc: make iowrite32 and friends static inline when no indirection

 arch/powerpc/include/asm/io.h         | 172 ++++++++++++++++++++++++++
 arch/powerpc/include/asm/pci-bridge.h |   9 --
 arch/powerpc/kernel/Makefile          |   2 +-
 arch/powerpc/kernel/iomap.c           |  13 --
 arch/powerpc/kernel/pci-common.c      |  15 ++-
 include/asm-generic/iomap.h           | 104 +++++++++++++---
 include/asm-generic/pci_iomap.h       |   7 ++
 7 files changed, 282 insertions(+), 40 deletions(-)

-- 
2.23.0

