Return-Path: <linuxppc-dev+bounces-5173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7EFA0BE50
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 18:07:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWzFj4db2z3cgx;
	Tue, 14 Jan 2025 04:07:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736788025;
	cv=none; b=Sq7qy1g78ykRUBnQPUhdyFdeWXNpBfAe25w7izFLMI5Pu1L5t5ehAyFGLHXFIQO2CkO7KT0/fWiQ97zAKk6hko1KG4Y9tasjG7Ph9rtPx8lrIGKN5TmZlMOjD8pTvgZmzlJI8InWmC2qExIMyAAwFYwgVjQgI7P9BIuN5VcIbcpvRwdI3HHnVpqSJ77QskxDPFi1Z/260kMrjq9PhNuKDLCf7rLZyzby8gKcudHWT+PbLF7tGbCmpo0CDqWOuUEPumyA5mL6gUeKQhj8LG/AJ3holBr4p/My1L5cLZC5Ghay0SQkJJh8nqWXDvMrUN63qHj7XEZFfUnMpk9iK75/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736788025; c=relaxed/relaxed;
	bh=87zAL3DZcqPYFzoHGYuBI9BAT1ktFT16wiQFT/4+t9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KoNlKw3xzMq86US1U8mol0aoh0Uzf/ru58AwGlbyoHs4/FtxSMEams6kv3Mhza6WmW1G/6L5TFQ2i7DrW7PfitVdRsvplvrSvPIRm9E2Ct7AIVFI5SY6JooWZpl/Q7Zpw7sY8/2neJRJFUmG5BurIWlwHuEEwb1UGnxgOTkbX8Ia5O7Jtqy+nuuwMLXStcm7epoATUK8xvzex8k4Qt/4vy+60YUPDoU/aaVj/ifS96IrpVXBwu7jIK4zhDxnSH+AaL/guK/3eMXCHUqLaqfm9chyvl99hAC/XR1dCXxh+YhXz3ntcxILOEXZo3SN2oX25sFLRf9y6eLtz5HsRWjVRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWzFg75Rhz3cgt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 04:07:02 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C242312FC;
	Mon, 13 Jan 2025 09:06:55 -0800 (PST)
Received: from udebian.localdomain (unknown [10.1.25.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BE843F673;
	Mon, 13 Jan 2025 09:06:25 -0800 (PST)
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	nd@arm.com,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: [RESEND v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Date: Mon, 13 Jan 2025 17:06:16 +0000
Message-Id: <20250113170619.484698-1-yury.khrustalev@arm.com>
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
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add PKEY_UNRESTRICTED macro to mman.h and use it in selftests.

For context, this change will also allow for more consistent update of the
Glibc manual which in turn will help with introducing memory protection
keys on AArch64 targets.

Applies to 5bc55a333a2f (tag: v6.13-rc7).

Note that I couldn't build ppc tests so I would appreciate if someone
could check the 3rd patch. Thank you!

Signed-off-by: Yury Khrustalev <yury.khrustalev@arm.com>

---
Changes in v4:
 - Removed change to tools/include/uapi/asm-generic/mman-common.h as it is not
   necessary.

Link to v3: https://lore.kernel.org/all/20241028090715.509527-1-yury.khrustalev@arm.com/

Changes in v3:
 - Replaced previously missed 0-s tools/testing/selftests/mm/mseal_test.c
 - Replaced previously missed 0-s in tools/testing/selftests/mm/mseal_test.c

Link to v2: https://lore.kernel.org/linux-arch/20241027170006.464252-2-yury.khrustalev@arm.com/

Changes in v2:
 - Update tools/include/uapi/asm-generic/mman-common.h as well
 - Add usages of the new macro to selftests.

Link to v1: https://lore.kernel.org/linux-arch/20241022120128.359652-1-yury.khrustalev@arm.com/

---

Yury Khrustalev (3):
  mm/pkey: Add PKEY_UNRESTRICTED macro
  selftests/mm: Use PKEY_UNRESTRICTED macro
  selftests/powerpc: Use PKEY_UNRESTRICTED macro

 include/uapi/asm-generic/mman-common.h               | 1 +
 tools/testing/selftests/mm/mseal_test.c              | 6 +++---
 tools/testing/selftests/mm/pkey-helpers.h            | 3 ++-
 tools/testing/selftests/mm/pkey_sighandler_tests.c   | 4 ++--
 tools/testing/selftests/mm/protection_keys.c         | 2 +-
 tools/testing/selftests/powerpc/include/pkeys.h      | 2 +-
 tools/testing/selftests/powerpc/mm/pkey_exec_prot.c  | 2 +-
 tools/testing/selftests/powerpc/mm/pkey_siginfo.c    | 2 +-
 tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 6 +++---
 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 6 +++---
 10 files changed, 18 insertions(+), 16 deletions(-)

-- 
2.39.5


