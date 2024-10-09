Return-Path: <linuxppc-dev+bounces-1909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD389975AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 21:26:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XP2tm06k1z3bhs;
	Thu, 10 Oct 2024 06:26:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728501983;
	cv=none; b=YxtgG68HOm/3YjjA4ldWpTbM7TcyZQjUxSME83osQqSimHrSeRlYB2wzjXixDETQK7dozYyVeo+vmXRUjYuQGo5GcVISeiSSjk1rsuy6pIcdkUXnk6nUKL54mVAUQsjD/CDyYSbOLWd01JoY6EDGCjdV2lyxydXVR/d3WvmDHaKGFFHjsdKWtgNWjIV4iGfQr5vJfibcmFpeCPJu41e7ppOzQAJ3GhhdSt5DOtD93Wz9hcOQKZEnZGbiY5kX/SeeEVdsq192hwtKe5IjZv/kh1uUnOD+yghWX8D5lVeYyUBZF80zQDjWF1dingR/m37s4/AXDHi8ab8K4wxeamyPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728501983; c=relaxed/relaxed;
	bh=5582ACgw8E09yqe/iSfVRqWBYC9ULsQviENPBlIXp7U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XiUYLgYfGoN05rwYEORTp4b/ibLXXDM6iN4SLkV3s5e6fIqLNMmUWKGSfz1RkaarV+fwEA35UcSiofWs4+hi+dGSVfJgnU6sNqh4Cj7KQcT7GfxtoGo5mEC0xEX8753YsXfHR0oyPIYXogw+HV21s3N1a8fLAtI+bvOHGjGQ00f5fuYgvy8JMSGm+puU7K8gVrIKQGMA4t7KjOClN/Ez1xfOV9ggZa25o4RXff7Ot1tdd9jjCX21sIPkYZlxd+kuB1TkIU4LBIEOgiIadfLbLr7w+DRkwT/C6KZBGmcsCiO1HDIXLQx6Ymswq1rS1B9CxGoZ7DrT5sTHAGOX9yY8tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IASgu2YC; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IASgu2YC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XP2tk2hg6z3bcs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 06:26:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E44CA44482;
	Wed,  9 Oct 2024 19:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDA2C4CEC3;
	Wed,  9 Oct 2024 19:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728501977;
	bh=Vuglrov0S5KUMROzD8A+tpB0125ZTYYW7D7CNFqovC4=;
	h=From:Subject:Date:To:Cc:From;
	b=IASgu2YCRbcdjzxnkpBu7W5HXlRtuNGZaSsq5eRYRR8GXqrpMYXQ5hDQvdUcoue0u
	 MgR788e9SCBga+F2f7ZMxoUJka9SQuLBTzDZJETdTRXlZuruAcSHZo53CrZrJNq8zY
	 ScjnPastRxDgzDVG/9enS48TYznrcTNy1iXg0FzX9qzLivy+oYouyabJiv6TmRjBkl
	 peSe/sJBjgVfUTvVuHf93ppRwCTfEe6edBMf/tKcojFqzscHlUgP4Jnoqep2rpQMQ5
	 vpBcV0dw3sm2Y1V1LtYYAJLzEgHzqLv/GT4YLa9GBFb9WVehrihdRBxQWX8L+sh4AQ
	 Nv0M80CXQ0GgQ==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 0/2] powerpc: Prepare for clang's per-task stack
 protector support
Date: Wed, 09 Oct 2024 12:26:07 -0700
Message-Id: <20241009-powerpc-fix-stackprotector-test-clang-v2-0-12fb86b31857@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/YBmcC/42NQQ6CMBBFr2Jm7Zi2qYCuvIdhgWWABkKbaYMaw
 t0dSdy7fD95/62QiD0luB5WYFp88mEWMMcDuKGZe0LfCoNRxmqlLMbwJI4OO//ClBs3Rg6ZXA6
 MmVJGN4mFlaWipLYyXWFAviKTCHvnXgsPPonx3rOL/q6/QvlnYdGoUFVOnx+muFiyt5F4pukUu
 Id627YPm2g979sAAAA=
X-Change-ID: 20241004-powerpc-fix-stackprotector-test-clang-84e67ed82f62
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Keith Packard <keithp@keithp.com>, linuxppc-dev@lists.ozlabs.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2108; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Vuglrov0S5KUMROzD8A+tpB0125ZTYYW7D7CNFqovC4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOlsN268aNQ6/+7BYqXi5rD1M+MLLVc8iD1ir7Bh5wv34
 H9LpSQ1O0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBE1rYxMlwwNKtqdll99LuI
 fvnqfydjcib/uJG2al5bbJxJ/qxpivsY/umWnKp/ufPhUuUzxmqp3/tvKS9mm/H5q8aPnf5WXLN
 1ijgB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This series prepares the powerpc Kconfig and Kbuild files for clang's
per-task stack protector support. clang requires
'-mstack-protector-guard-offset' to always be passed with the other
'-mstack-protector-guard' flags, which does not always happen with the
powerpc implementation, unlike arm, arm64, and riscv implementations.
This series brings powerpc in line with those other architectures, which
allows clang's support to work right away when it is merged.
Additionally, there is one other fix needed for the Kconfig test to work
correctly when targeting 32-bit.

I have tested this series in QEMU against LKDTM's REPORT_STACK_CANARY
with ppc64le_guest_defconfig and pmac32_defconfig built with a toolchain
that contains Keith's in-progress pull request, which should land for
LLVM 20:

https://github.com/llvm/llvm-project/pull/110928

---
Changes in v2:
- Combined patch 1 and 3, as they are fixing the same test for similar
  reasons; adjust commit message accordingly (Christophe)
- Moved stack protector guard flags on one line in Makefile (Christophe)
- Add 'Cc: stable' targeting 6.1 and newer for the sake of simplicity,
  as it is the oldest stable release where this series applies cleanly
  (folks who want it on earlier releases can request or perform a
  backport separately).
- Pick up Keith's Reviewed-by and Tested-by on both patches.
- Add a blurb to commit message of patch 1 explaining why clang's
  register selection behavior differs from GCC.
- Link to v1: https://lore.kernel.org/r/20241007-powerpc-fix-stackprotector-test-clang-v1-0-08c15b2694e4@kernel.org

---
Nathan Chancellor (2):
      powerpc: Fix stack protector Kconfig test for clang
      powerpc: Adjust adding stack protector flags to KBUILD_CLAGS for clang

 arch/powerpc/Kconfig  |  4 ++--
 arch/powerpc/Makefile | 13 ++++---------
 2 files changed, 6 insertions(+), 11 deletions(-)
---
base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
change-id: 20241004-powerpc-fix-stackprotector-test-clang-84e67ed82f62

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


