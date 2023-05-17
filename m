Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22570706979
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:16:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLtst0FfBz3fGf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:16:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tyU1+/JQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tyU1+/JQ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtmy69TMz3fBT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:12:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3AC8364706;
	Wed, 17 May 2023 13:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81DCC433A7;
	Wed, 17 May 2023 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329137;
	bh=7NFY4e1GRdJpBgrCbtxoc1LfzebP5DErPZUbazdtedA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tyU1+/JQyb06JHCoISP/aGPwtCQn0y+G2NG5LZRAoqMZ2rrQjRXynp/TD2rSNP+yu
	 1MAgn39GOwDx0XjC/LCCoz8eWqzWrh1MPxapDvHcn+PH1s06DifD+01A3XTAew1Xad
	 7kiU/kNm6uC/vwrOUnFMNzz/s1aP2ZTB5AZ44+nRwW23Ewv7Oudccx2C7eFBMHX70o
	 bRraU85jXL9lIeSgOiof8kzLy3rFvqHD/NGDlZjQWIMKbB80Ds7TOcR89bmpDrx2M6
	 DjfDS8BLtKEoQUWgQ9ZjdRzMuh416rmJ35iErYbPeR1Cy3wac2W8wJ0tUTeKW2RkF7
	 Kn4dcDyi8DEBA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 05/14] lib: devmem_is_allowed: include linux/io.h
Date: Wed, 17 May 2023 15:10:53 +0200
Message-Id: <20230517131102.934196-6-arnd@kernel.org>
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

The devmem_is_allowed() function is defined in a file of the same name,
but the declaration is in asm/io.h, which is not included there, causing
a W=1 warning:

lib/devmem_is_allowed.c:20:5: error: no previous prototype for 'devmem_is_allowed' [-Werror=missing-prototypes]

Include the appropriate header to avoid the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/devmem_is_allowed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/devmem_is_allowed.c b/lib/devmem_is_allowed.c
index 60be9e24bd57..9c060c69f134 100644
--- a/lib/devmem_is_allowed.c
+++ b/lib/devmem_is_allowed.c
@@ -10,6 +10,7 @@
 
 #include <linux/mm.h>
 #include <linux/ioport.h>
+#include <linux/io.h>
 
 /*
  * devmem_is_allowed() checks to see if /dev/mem access to a certain address
-- 
2.39.2

