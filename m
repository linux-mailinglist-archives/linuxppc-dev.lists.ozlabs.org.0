Return-Path: <linuxppc-dev+bounces-10602-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C0DB1A775
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:44:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7q3Ql1z3bx0;
	Tue,  5 Aug 2025 02:44:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325863;
	cv=none; b=lg48k8VwnYxmu7NM2DVnlovRQ25hGYrRnTZMjyN8gcRwmcHCiSUudDOkvKj6jgt69/bT4MKSsI2Nh0iwnChkqCFdNkyHomkulv5sPHJfAVMc3uTrFeOSRWPGPc+2FcUJqweqEvEqVzq8/0kNYOB7gziCcr18byFw3d6LPXSB8FvZ9Rq/3ZIqUVNm6XrdoT9O2UWwbHXZyCEqDesT4C5/9W/tgeafmpiM5P8LdFppB6wYv/r9PnxDRuKaLOD4o//d60tqXdGLc/9GVakl0SJyBx5zB73shMk61z+Y6TtA6rK0nFOsLemUhTYAUndhHjPPIuYRfqJ1i7Dlr920yDGSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325863; c=relaxed/relaxed;
	bh=GulY2NGH+GAvhrkZ7kDuuCeL3PXB98pk5SZokpCjbqk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f19o1BimkKsxAiw5FbT93zpXlKGMYiE57dyCm9PwPnsZ8AXFu08g83VE7RJIHN+aA/Ilwzul9V0+ZEYWbO3uqkabeczI4ualaCTvurjqRFioQSquWnG1GLA04HrnAm/qg2Bap0NAhgvu6ZHFhupD2eDirdnoimdPvWQgIDveVTchBWMK4gHSTElsKVvqCb5wtx9l4jvX8FN/EYEWNPmzLx3kc+fBQ80hzSld0k6Y0XKR4sd8KmUqsBG1GKpnFwyyIbkj4X/obo79I+z8WZg+FnPSmlrM+De0EpGuYsrk/Igvf+wmYGFsRIdC2hFPp3Fy8xoeh6qg0FdTBfd+S4aSAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qoDkY9It; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qoDkY9It;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7m6qbsz3bnc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3799560200;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE13C4CEE7;
	Mon,  4 Aug 2025 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325857;
	bh=r2v62d4bVt9owj808SKHRzdSx9oLY8KjiUCy34x/12Y=;
	h=From:To:Cc:Subject:Date:From;
	b=qoDkY9It5/lqR9fbX6g8iGg/nmmtCv14BOgAwhkb5uNiClyFaMkiukY7Oc+J1MaKh
	 dZnz4X/S3ajFCt76duYJHDx0quVZH6oSu/c0vStSRzaSzbCcMKFV4L18ye0ZTJoXPN
	 i3oURUhH5BvGFLUiBhUMaVt9LAqwPNrH4pyC8RyKbvz3yMn0pqcXcQS+g91j40QHjM
	 lNQCmlS8pNR7LcsmFHjuc2AbEWdFGnRvWbhlC/VB8DAo2fUatOIF7DscYokL7FpXgy
	 l5z39sJCmL4o5lHPcQDJdF9jtn/jsrC9WDmDQnvKWCYKZ26XpAxSx9TjSBv7Ns52lt
	 j7UHemkdNe4Mg==
From: Kees Cook <kees@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 00/17] Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:43:56 -0700
Message-Id: <20250804163910.work.929-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3619; i=kees@kernel.org; h=from:subject:message-id; bh=r2v62d4bVt9owj808SKHRzdSx9oLY8KjiUCy34x/12Y=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHofFXgjp7KzykhVPcF48Q+LLy7qNn3Wc38x5WLbt/ 44z4VPWdZSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEzERo7hf8kiKe0FSd8l7Cv7 We7uUrdPYDs+m0lg/c5Dkx57tW49XMrwT2vS53lTDZ/v/XEnZcFFsaM9CXKfOL49eCxys3TZx5i tytwA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

While tracking down a problem where constant expressions used by
BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
initializer was convincing the compiler that it couldn't track the state
of the prior statically initialized value. Tracing this down found that
ffs() was used in the initializer macro, but since it wasn't marked with
__attribute_const__, the compiler had to assume the function might
change variable states as a side-effect (which is not true for ffs(),
which provides deterministic math results).

Add KUnit tests for the family of functions and then add __attribute_const__
to all architecture implementations and wrappers.

-Kees

[1] https://github.com/KSPP/linux/issues/364

Kees Cook (17):
  KUnit: Introduce ffs()-family tests
  bitops: Add __attribute_const__ to generic ffs()-family
    implementations
  csky: Add __attribute_const__ to ffs()-family implementations
  x86: Add __attribute_const__ to ffs()-family implementations
  powerpc: Add __attribute_const__ to ffs()-family implementations
  sh: Add __attribute_const__ to ffs()-family implementations
  alpha: Add __attribute_const__ to ffs()-family implementations
  hexagon: Add __attribute_const__ to ffs()-family implementations
  riscv: Add __attribute_const__ to ffs()-family implementations
  openrisc: Add __attribute_const__ to ffs()-family implementations
  m68k: Add __attribute_const__ to ffs()-family implementations
  mips: Add __attribute_const__ to ffs()-family implementations
  parisc: Add __attribute_const__ to ffs()-family implementations
  s390: Add __attribute_const__ to ffs()-family implementations
  xtensa: Add __attribute_const__ to ffs()-family implementations
  sparc: Add __attribute_const__ to ffs()-family implementations
  KUnit: ffs: Validate all the __attribute_const__ annotations

 lib/Kconfig.debug                          |  14 +
 lib/tests/Makefile                         |   1 +
 arch/alpha/include/asm/bitops.h            |  14 +-
 arch/csky/include/asm/bitops.h             |   8 +-
 arch/hexagon/include/asm/bitops.h          |  10 +-
 arch/m68k/include/asm/bitops.h             |  14 +-
 arch/mips/include/asm/bitops.h             |   8 +-
 arch/openrisc/include/asm/bitops/__ffs.h   |   2 +-
 arch/openrisc/include/asm/bitops/__fls.h   |   2 +-
 arch/openrisc/include/asm/bitops/ffs.h     |   2 +-
 arch/openrisc/include/asm/bitops/fls.h     |   2 +-
 arch/parisc/include/asm/bitops.h           |   6 +-
 arch/powerpc/include/asm/bitops.h          |   4 +-
 arch/riscv/include/asm/bitops.h            |   6 +-
 arch/s390/include/asm/bitops.h             |  10 +-
 arch/sh/include/asm/bitops.h               |   4 +-
 arch/sparc/include/asm/bitops_64.h         |   8 +-
 arch/x86/include/asm/bitops.h              |  12 +-
 arch/xtensa/include/asm/bitops.h           |  10 +-
 include/asm-generic/bitops/__ffs.h         |   2 +-
 include/asm-generic/bitops/__fls.h         |   2 +-
 include/asm-generic/bitops/builtin-__ffs.h |   2 +-
 include/asm-generic/bitops/builtin-__fls.h |   2 +-
 include/asm-generic/bitops/builtin-fls.h   |   2 +-
 include/asm-generic/bitops/ffs.h           |   2 +-
 include/asm-generic/bitops/fls.h           |   2 +-
 include/asm-generic/bitops/fls64.h         |   4 +-
 include/linux/bitops.h                     |   2 +-
 lib/clz_ctz.c                              |   8 +-
 lib/tests/ffs_kunit.c                      | 566 +++++++++++++++++++++
 30 files changed, 656 insertions(+), 75 deletions(-)
 create mode 100644 lib/tests/ffs_kunit.c

-- 
2.34.1


