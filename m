Return-Path: <linuxppc-dev+bounces-3865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A299E8F19
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 10:48:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6H9P0gBlz2xHl;
	Mon,  9 Dec 2024 20:48:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733737689;
	cv=none; b=X3fXfKk5Wv2AC69vTBMU2eRA8TN4qe4LNHWHkABF3+RENJhCU9i0AnffyRZprUjyDj0fV2n//2WiSonMAPsv4Bb8avmiyy8M3OHI1zQ36cqPjvYWs7uHAJFNgNYljPMsxe1VocEiLvzV7YSwsL12SFz+5d+qfQV6tW7SYNE9KpVNQD4e6H+9d3LcIj4zQi2Vh9f5wvvQEdWdZKkhCagX3z3oYpSs+2XB9r/dtDGIDAmGKeAj9ZfEO/HnaF+Fq9m+PTzyTkLWbumavvgr/LX4GN0ydmsDS8FCB571FN6Rwa32EuDiAGJ4zxwJjxvrQGkhca7i8nZ0ARXU8mqMtEa1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733737689; c=relaxed/relaxed;
	bh=He/giAmEHqNfp9S7J2TVvzS3qQ0ix2iFGgVJ7ep2j4w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ba2e1/Me9k2p8y5jcLY+ujhiL/jIHoYiLV516WWuCRIQfGUxoAPIBVNLY5DBV8lgSIN26c28Y1QfraL7sV3L47LYDKQLVeCU0D5HfXvIKGnpHyr2VYkWMJvbnyVGNh03kMN0QU6RAD9Cd+6uAAeYjjpPPcyV5tNhznLAb7eJbu/KlhQ4Mg0nBdMXL6ZRZQMKcyKXTOwCVzscigPMZSxjSE01hmUJjylWvC6Beis+xhNr9JNn0VEEM2T1ZsVi6HZxuvJiNntqX8VcdDA4fImy8Nz4K/RcMggC3vq3mZOViRqzOWwGRH0BpMq/ftJJmhB+JIIDk49/z9KtOzsPMS8rAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6H9L5WPnz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 20:48:04 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15355113E;
	Mon,  9 Dec 2024 01:47:59 -0800 (PST)
Received: from udebian.localdomain (unknown [10.1.35.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91E573F720;
	Mon,  9 Dec 2024 01:47:28 -0800 (PST)
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
	nd@arm.com,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: [RESEND v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Date: Mon,  9 Dec 2024 09:47:16 +0000
Message-Id: <20241209094719.2431126-1-yury.khrustalev@arm.com>
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

Applies to fac04efc5c79 (tag: v6.13-rc2).

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


