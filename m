Return-Path: <linuxppc-dev+bounces-1805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5F4993DE4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 06:22:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN2tR1HvJz3013;
	Tue,  8 Oct 2024 15:22:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728361359;
	cv=none; b=bf0UvIiDgw5tXn85W5UOtpU11ebbJjKpSr4ihktrYm89BRvyuMut9eFVQISkPM3rlZOAFoqZEjOfr37Erijie4n5XUr3xQkq9v+iilMhvZQJ1pilAfsgzAcpoIZE5h8HuEBmCxpAP2MA7DOWcqsGJIBcfzpPC+dzrEEKLRCSUyDYbIZ7oQvBzMuHawVLWRh8yHU9NOyoBGfEN4YKWW3hIQM3u6bicx/viwnFlzPprjL3SPccGCpJIT/oiW48qNt6ckd3mdglrUfTrjMGHErpfdcobhxN3r8SyaUN90jOYoa/xuKY3R9P2JolDQGSEC1OmILUULP+5qRdV/JUvHwPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728361359; c=relaxed/relaxed;
	bh=3Z3T7VPi6NVACDtFq1TL8FoKgP6npj7aOGP67ebp1Qk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M4T3pdwLYYpCd+lrr6SIibhgYzJl7sp0PzSeWKxpAZ4yRGQDmro/HAfeeN0pQPIFQJPRWDtD9H13W2UM29slbYiML5W5lXKJL1pHkyY7pBrmJlHwwbDHUuLsSbfMwQh7XK76oJpPPcVmaPtw77fYNPs4X9vvgE6b4z/9hiowkY/YwHiN0SH/5hTfTVcVq08UzPWYw91M7SqahnyKj7rzRC/vSKBt0PuR+7MqvPCfLlgtQD8uGbG5KsFDZF/KWQeUE9IweK3BInMkRRDtsDaycoK3kcus6BQi6iMnDIKjiOKXmEwhCZ6rajWKySsuC0OjE43RDErir+x2ZJodwOx5pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ve9n/Y1F; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ve9n/Y1F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN2tP6xHPz2yTs
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 15:22:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14AA8A429AF;
	Tue,  8 Oct 2024 04:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42311C4CEC7;
	Tue,  8 Oct 2024 04:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728361353;
	bh=aBvIzYi0nH04voZ88M0abn2Dncgwg/QRfL20zKWDxJo=;
	h=From:Subject:Date:To:Cc:From;
	b=Ve9n/Y1F9k4nH7wnf3JglV3EwQET6h3j44/aUFstDg5nF3LjVEpm++oYa+FuvzgW3
	 l8/ecdPMiKVCZmoMk2J+/97VbaWOLo+shCPcKb5XgD3UJ8s+eCWyB4Gtrfwb0pzkb8
	 2P7/JP4HZBu0dz5NQghKwMrSQnCZtG2N3tGGun/ZL464Mkoz9I6XgwcYUyzVfHZQZ1
	 8Ks0H3GrWqU0d7DnYzmRpp/iD2mlb1meotsKCATSIU+tuVj9phsXr+9kvFhJ0yAqSQ
	 OFn0OeSIS4AmoyoeVj6oWzaaO+MjH0iP8T2FC1G0MSNvignB0tiUbFn0KrYQQx0OHR
	 PnFFIYnjrEuqQ==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] powerpc: Prepare for clang's per-task stack protector
 support
Date: Mon, 07 Oct 2024 21:22:02 -0700
Message-Id: <20241007-powerpc-fix-stackprotector-test-clang-v1-0-08c15b2694e4@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAGqzBGcC/x2NQQqDQAwAvyI5N7Aui5V+pfQgMWpocZcktAXx7
 w09zmFmDjBWYYNbd4DyW0zqHtBfOqBt2ldGmYMhp1z6lAq2+mFthIt80XyiZ9PqTF4Vnc2RXmH
 hWHi48jzmZcgQraYcwv9zf5znD+0UJWN3AAAA
X-Change-ID: 20241004-powerpc-fix-stackprotector-test-clang-84e67ed82f62
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Keith Packard <keithp@keithp.com>, linuxppc-dev@lists.ozlabs.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; i=nathan@kernel.org;
 h=from:subject:message-id; bh=aBvIzYi0nH04voZ88M0abn2Dncgwg/QRfL20zKWDxJo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOksm9vzT1remzgzOefTgnUyqVO0dh9irn/K/eRy3HPlQ
 0b3VHj+d5SyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJrOZk+Gfxzubds+OMK24o
 te2pDi1vaOctvJd/zWLVzwZXr+vbNjYx/NPM/yyQlf815K1X8tJ+uyUWtzU+zPjdm3O//OeBN/d
 +rWYCAA==
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
Nathan Chancellor (3):
      powerpc: Fix stack protector Kconfig test for clang
      powerpc: Adjust adding stack protector flags to KBUILD_CLAGS for clang
      powerpc: Include -m32 / -m64 for stack protector Kconfig test

 arch/powerpc/Kconfig  |  4 ++--
 arch/powerpc/Makefile | 15 ++++++---------
 2 files changed, 8 insertions(+), 11 deletions(-)
---
base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
change-id: 20241004-powerpc-fix-stackprotector-test-clang-84e67ed82f62

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


