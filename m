Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5043570699E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLtyY0WbRz3fqG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:20:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a5AKMGQ6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a5AKMGQ6;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtnj42B1z3f90
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:12:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E097A64719;
	Wed, 17 May 2023 13:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC7AC433A1;
	Wed, 17 May 2023 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329175;
	bh=jyfIU4kb2iohIZExECeJDgccrpywO2d4N5RO4/Lz9/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a5AKMGQ6H8c4SmWJA9acjTbaFCzZ0AA2wm05BPlzt7RdfOUiogdQAYWE+G+NGcZdX
	 yDjsODiNdpDTqKlvtQXPCuaGA3VC6/f234nMehw9xGV/czmg096DJmqiZsDf12qqFe
	 ej546ikNtCrc67wnEUFw1c3f59H4n265vxwBWYFw7f1ACFpU/dNvgnfSCj3KARvmhc
	 okU5JO6mfHibgPJap1ViK2c3byQdkDKbjHgzIgRlSYBev2T0JJyKlGkP2OUNIdoni8
	 hQe43lij086yvsSwf3Lz908iMLuTejdjlTVVg35FM3ecRVrHkCom9/KKxw7ZIB2uTs
	 DJJKGGvs0X6mw==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 10/14] suspend: add a arch_resume_nosmt() prototype
Date: Wed, 17 May 2023 15:10:58 +0200
Message-Id: <20230517131102.934196-11-arnd@kernel.org>
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

The arch_resume_nosmt() has a __weak definition, plus an x86
specific override, but no prototype that ensures the two have
the same arguments. This causes a W=1 warning:

arch/x86/power/hibernate.c:189:5: error: no previous prototype for 'arch_resume_nosmt' [-Werror=missing-prototypes]

Add the prototype in linux/suspend.h, which is included in
both places.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/suspend.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index f16653f7be32..bc911fecb8e8 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -472,6 +472,8 @@ static inline int hibernate_quiet_exec(int (*func)(void *data), void *data) {
 }
 #endif /* CONFIG_HIBERNATION */
 
+int arch_resume_nosmt(void);
+
 #ifdef CONFIG_HIBERNATION_SNAPSHOT_DEV
 int is_hibernate_resume_dev(dev_t dev);
 #else
-- 
2.39.2

