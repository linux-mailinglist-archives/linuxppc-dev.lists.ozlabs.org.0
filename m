Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 927A8828FA3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 23:17:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qB46A5Sp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8lfw1FP9z3cPR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 09:17:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qB46A5Sp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8ldy2qj7z30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 09:16:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 902D461578;
	Tue,  9 Jan 2024 22:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA61FC433F1;
	Tue,  9 Jan 2024 22:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704838610;
	bh=EHvco0VkqOSJGuxdue1TEtXAL00jI8VZrVZxCAuX2+E=;
	h=From:Subject:Date:To:Cc:From;
	b=qB46A5SpFD/NpmrZNfvwVgTddKr4FozL/Nm6NTWqjJuavIDeYbyWj8WbTz/AJAYAd
	 rCq1xH2+lrNbAzymhVqtxXCmJQYKKBtigLbuskx+y07oOM7Fuhn5KtE5lAQldU86ff
	 zsHlTOsJZDWVdq5RMMJKOsWvG0Sf8ZHgtVjZur4CTnnCh2KmHRiE+g9IYh0N3JSxTK
	 HD8CBIbqmmGPG+MOnwgxTifgp44rGjZZFXk0l6vXeduRl6TLk9LScel7oWlPR5uz1g
	 UsvtcwNt/LBd82QaDZxv1VzpZC3HDPVzq86WEch1mZNDSm/ODiPUOVtCeJtXC34hlE
	 7d2vmCHDFTLIQ==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] Update LLVM Phabricator and Bugzilla links
Date: Tue, 09 Jan 2024 15:16:28 -0700
Message-Id: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALzFnWUC/x3MQQqAIBBA0avErBtQi8CuEi0kpxoyCy0JwrsnL
 d/i/xciBaYIffVCoMSRD18g6wqm1fiFkG0xKKFaIYXG+7TmInQu7ejYbxGtaGZtu1aTJCjdGWj
 m538OY84fszs+Z2MAAAA=
To: akpm@linux-foundation.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2460; i=nathan@kernel.org;
 h=from:subject:message-id; bh=EHvco0VkqOSJGuxdue1TEtXAL00jI8VZrVZxCAuX2+E=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKlzj17YHOFbeqmmzSTv+Yl3Dvc2pO2+wn2gftPWtOlmz
 ZFzErc87ShlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATcYlj+J+VsOtwv+FtLr6v
 L2ptJLoTJ1xwvPM+afI7W55fz9vnRocyMsxLsi56rXP33S6VMzNvVJ4tXR/xeu4ma9Zvvc8ruWO
 PdPIDAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: linux-efi@vger.kernel.org, kvm@vger.kernel.org, llvm@lists.linux.dev, ast@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, mykolal@fb.com, daniel@iogearbox.net, andrii@kernel.org, amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org, linux-pm@vger.kernel.org, bridge@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, patches@lists.linux.dev, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series updates all instances of LLVM Phabricator and Bugzilla links
to point to GitHub commits directly and LLVM's Bugzilla to GitHub issue
shortlinks respectively.

I split up the Phabricator patch into BPF selftests and the rest of the
kernel in case the BPF folks want to take it separately from the rest of
the series, there are obviously no dependency issues in that case. The
Bugzilla change was mechanical enough and should have no conflicts.

I am aiming this at Andrew and CC'ing other lists, in case maintainers
want to chime in, but I think this is pretty uncontroversial (famous
last words...).

---
Nathan Chancellor (3):
      selftests/bpf: Update LLVM Phabricator links
      arch and include: Update LLVM Phabricator links
      treewide: Update LLVM Bugzilla links

 arch/arm64/Kconfig                                 |  4 +--
 arch/powerpc/Makefile                              |  4 +--
 arch/powerpc/kvm/book3s_hv_nested.c                |  2 +-
 arch/riscv/Kconfig                                 |  2 +-
 arch/riscv/include/asm/ftrace.h                    |  2 +-
 arch/s390/include/asm/ftrace.h                     |  2 +-
 arch/x86/power/Makefile                            |  2 +-
 crypto/blake2b_generic.c                           |  2 +-
 drivers/firmware/efi/libstub/Makefile              |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  2 +-
 drivers/media/test-drivers/vicodec/codec-fwht.c    |  2 +-
 drivers/regulator/Kconfig                          |  2 +-
 include/asm-generic/vmlinux.lds.h                  |  2 +-
 include/linux/compiler-clang.h                     |  2 +-
 lib/Kconfig.kasan                                  |  2 +-
 lib/raid6/Makefile                                 |  2 +-
 lib/stackinit_kunit.c                              |  2 +-
 mm/slab_common.c                                   |  2 +-
 net/bridge/br_multicast.c                          |  2 +-
 security/Kconfig                                   |  2 +-
 tools/testing/selftests/bpf/README.rst             | 32 +++++++++++-----------
 tools/testing/selftests/bpf/prog_tests/xdpwall.c   |  2 +-
 .../selftests/bpf/progs/test_core_reloc_type_id.c  |  2 +-
 23 files changed, 40 insertions(+), 40 deletions(-)
---
base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
change-id: 20240109-update-llvm-links-d03f9d649e1e

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

