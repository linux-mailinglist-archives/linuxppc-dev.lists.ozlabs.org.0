Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F30570698F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:19:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLtxW01hMz3fh2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:19:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=niHVPUaD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=niHVPUaD;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtnY5w8hz3fDW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:12:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3108163E73;
	Wed, 17 May 2023 13:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7145AC4331F;
	Wed, 17 May 2023 13:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329167;
	bh=GzyYzd/7tEPxQhzzg+PJ/PWcyEzzBXzJLcduAakWhaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=niHVPUaD0YGdt5iRkDpEydf7mr631oogoVQvkL81qpJ5TW0/YDUHFkUu/ZKWJdSyH
	 WVXjhzTUAGxnOs0Vegl0ZmfHCdPZuJ7YUjlFkitUTUNbJVo7lI5FO1LgLzd52JuqCx
	 Wr1JJezEgRxZbp9NdZwExiCGViAREtrVIVavopDauE3wvvOAYNu+BznmFcHd0fJK4u
	 wZIaM4wBxCe+a/H0IRCT0p9ml11d7gsP+vlmdEZuhfHUfwxnHCQLwlRz2WmfAlqtqM
	 +0195gf2dqreO3HDtP8xhqKkWgE47ff7qay5jg24K0FITidNlAbdN4XuegelYOnMhE
	 eS4jr0xmyomCA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 09/14] kunit: include debugfs header file
Date: Wed, 17 May 2023 15:10:57 +0200
Message-Id: <20230517131102.934196-10-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis
 @redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

An extra #include statement is needed to ensure the prototypes
for debugfs interfaces are visible, avoiding this warning:

lib/kunit/debugfs.c:28:6: error: no previous prototype for 'kunit_debugfs_cleanup' [-Werror=missing-prototypes]
lib/kunit/debugfs.c:33:6: error: no previous prototype for 'kunit_debugfs_init' [-Werror=missing-prototypes]
lib/kunit/debugfs.c:102:6: error: no previous prototype for 'kunit_debugfs_create_suite' [-Werror=missing-prototypes]
lib/kunit/debugfs.c:118:6: error: no previous prototype for 'kunit_debugfs_destroy_suite' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/kunit/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/debugfs.c b/lib/kunit/debugfs.c
index b08bb1fba106..22c5c496a68f 100644
--- a/lib/kunit/debugfs.c
+++ b/lib/kunit/debugfs.c
@@ -10,6 +10,7 @@
 #include <kunit/test.h>
 
 #include "string-stream.h"
+#include "debugfs.h"
 
 #define KUNIT_DEBUGFS_ROOT             "kunit"
 #define KUNIT_DEBUGFS_RESULTS          "results"
-- 
2.39.2

