Return-Path: <linuxppc-dev+bounces-3034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5AF9C1881
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 09:54:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlCSJ2fk4z3bsP;
	Fri,  8 Nov 2024 19:54:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731056096;
	cv=none; b=DaZy2IbWYqIW88423msWggjiuxiikvTawz5GkpP40lMec4m5FmHW0zyFCFKGcv5nwVBW3/OjYQeaLBMqI9B/my/2z78tndmUMfgST6QEnoeMNyzMtKbWJSjbpGBy+B79FmeiH9AXUTT5T/B3N5ZX7+eEGxV/WUAnKE1j2VJGp27HoflNwy9roE7ORr78RrswOfWkVr25eVUXsaqhc52fXTblHKnqnXoUNmRMFQREf2Oi8+vImvC//3RSxzvYr0WVycRa83NecVpqUlztbcdDaBHwRuT5WNox4YIw+5vrFLi31GnVggPcnVU64UuFJrqLbCECvzssyjEt77PCk0rvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731056096; c=relaxed/relaxed;
	bh=bZnso4M0HYLe4asPhpb+FiMZnmXpcV+/3gy2LMcIQxA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=opo0JRqhmX7bWbytSbtQhVYlJm/PK523XNENn7J0ecYKppoOhNqFwLEN+jFEFd4GG0mjtg+vBP2hfGo1anH1744yzLJz3bM0J7emdwMyPfknXBZqB1Hh32OjbG0pZH3/Xy4Vgk1nJV6lnBSNlfOcFFiEVdhLS4MuGSTxRVjYv0vhuMEQZuioCzQC/s7QPclIdG7an8hJx2618yVEj1p/IH25Xswo1Im7S7y3fyXyWKi+KAC+S5MYoc+9C3MkQaOJXb8DQusOJuJ4OhKQSkSR635dqoO7KtnP6oElISkMElgQQc0FvJhVnMcZAXGen9MGdqFu3rNun/RUMLqiDDR7HQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlCSG3V0Hz2yVD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 19:54:52 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AF4F497;
	Fri,  8 Nov 2024 00:54:48 -0800 (PST)
Received: from udebian.localdomain (unknown [10.57.26.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 671733F66E;
	Fri,  8 Nov 2024 00:54:16 -0800 (PST)
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
Subject: [PATCH v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Date: Fri,  8 Nov 2024 08:53:55 +0000
Message-Id: <20241108085358.777687-1-yury.khrustalev@arm.com>
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

Applies to 819837584309 (tag: v6.12-rc5).

Note that I couldn't build ppc tests so I would appreciate if someone
could check the 3rd patch. Thank you!

[1] https://inbox.sourceware.org/libc-alpha/20241022073837.151355-1-yury.khrustalev@arm.com/
[2] https://inbox.sourceware.org/libc-alpha/20241011153614.3189334-1-yury.khrustalev@arm.com/

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


