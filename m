Return-Path: <linuxppc-dev+bounces-2649-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A59B3B44
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 21:22:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XclDF73xcz2y8F;
	Tue, 29 Oct 2024 07:22:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730106481;
	cv=none; b=VPzsJySkUP/3KvxMGqooY/SuBoLuQsw4PTp3spwTATqVmPGizKe2lkKQG0rl8sKZc06iYyBIVbdiyCFs14aDfR1POIyJ/Qn4LwNvyvJaYpPZ6Of4TbnddC2Hd/bEwKQiiMlKPMH8biez049JoUsl8xJrNvfA/rSXI9RCS6GD1lfKWjKIgWz+gkpnfSWD1vTShlH+VSEvnOBYtE2KGQXABVtQTUtTuy9LZxw4DR2tW+gvCoG1i7R1N2XuoizwbMp93qWw/eE/EnNEu0vz56chx/1BEVY3HHa2hxWiX11ttMaWjnkK+QJp81yrBY8bUKs/229jCOSMhd22hpwjFKA3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730106481; c=relaxed/relaxed;
	bh=wE5/Iw/lwocrXV8XsD2oqHO1pYal/2oKHjCKq8lYZgY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dUpHKOU1S0NP8o09IGLKoNeQKuUwzW7OLOvJHlQvjLyMjJwagPPeZxMeh43ftV2CAIo6VwlDxJ1TEntmXu8N+KubDaFprN9J99DKf+FR4G33RfdhaiUTT4kVG1E8nkLR7oguQArSbcpiCnBox0GDVGFGYgYTrNiOfQ/bwFCe9cZx6wZnEOPZhyKT1vJ95q6lZ3ykTdK7h7MeIKVruYPfCBTi6fCa2btLBpLZrykWoccfuw1etCGQ/5iAg77dWxw+FaHNyP30zM6njo3FYCBHsAW2KP7Xgb444qJa9dDGktb9PAuYR2ZJJ5cjpYLHzrYzRxFZrdB5xlQqn4NZ1bjEMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcSGR3yDcz2xPf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 20:07:57 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1256F497;
	Mon, 28 Oct 2024 02:07:55 -0700 (PDT)
Received: from udebian.localdomain (unknown [10.57.58.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10DAA3F66E;
	Mon, 28 Oct 2024 02:07:23 -0700 (PDT)
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	nd@arm.com,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: [PATCH v3 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Date: Mon, 28 Oct 2024 09:07:12 +0000
Message-Id: <20241028090715.509527-1-yury.khrustalev@arm.com>
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
Glibc manual [1] which in turn will help with introducing memory protection
keys on AArch64 targets [2].

Applies to 42f7652d3eb5 (tag: v6.12-rc4).

Note that I couldn't build ppc tests so I would appreciate if someone
could check the 3rd patch. Thank you!

[1] https://inbox.sourceware.org/libc-alpha/20241022073837.151355-1-yury.khrustalev@arm.com/
[2] https://inbox.sourceware.org/libc-alpha/20241011153614.3189334-1-yury.khrustalev@arm.com/

Signed-off-by: Yury Khrustalev <yury.khrustalev@arm.com>

---
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
 tools/include/uapi/asm-generic/mman-common.h         | 1 +
 tools/testing/selftests/mm/mseal_test.c              | 6 +++---
 tools/testing/selftests/mm/pkey-helpers.h            | 3 ++-
 tools/testing/selftests/mm/pkey_sighandler_tests.c   | 4 ++--
 tools/testing/selftests/mm/protection_keys.c         | 2 +-
 tools/testing/selftests/powerpc/include/pkeys.h      | 2 +-
 tools/testing/selftests/powerpc/mm/pkey_exec_prot.c  | 2 +-
 tools/testing/selftests/powerpc/mm/pkey_siginfo.c    | 2 +-
 tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 6 +++---
 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 6 +++---
 11 files changed, 19 insertions(+), 16 deletions(-)

-- 
2.39.5


