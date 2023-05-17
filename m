Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A539C706983
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:17:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLttn3Jddz3fFy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:17:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hhmQcB6W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hhmQcB6W;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtn670GLz3fF5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:12:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5223764715;
	Wed, 17 May 2023 13:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF66C4339C;
	Wed, 17 May 2023 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329144;
	bh=gekqQcdwspAqcYmV4wkiul0gbNa5okADC3lRsox7SxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hhmQcB6Wb+ZcCRzLdjmx7/zFED4SNzs0NBaokc4G4Ef+SjGqplVRCUUlj8VOql7xc
	 tVzUvC/YohY4HXanpHjF8gzBHtwkxcmoYXP+MIQ4qBiVNrFkbviwAVNhlQFEM5aG9z
	 u0KG2wrGCIiO4fxkS7CsDg7SKssZvao8JQ1WexuQEtCpz47qaTuW3Z1bOQL/MmRcVt
	 J43Gz9r687q17jYwvjwLN9fs0kn3xObEo5/anSq7dT5iAh0lVVtxnk6xLq54trRwvy
	 bwp4gagapMiXtQeSik0KOYf0nVPAhKydrIyt2a5DIE7rfoyB8tfvUPUW3O+QL/VQu3
	 AKt6l4x3F+ppA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 06/14] locking: add lockevent_read() prototype
Date: Wed, 17 May 2023 15:10:54 +0200
Message-Id: <20230517131102.934196-7-arnd@kernel.org>
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

lockevent_read() has a __weak definition and the only caller in
kernel/locking/lock_events.c, plus a strong definition in qspinlock_stat.h
that overrides it, but no other declaration. This causes a W=1
warning:

kernel/locking/lock_events.c:61:16: error: no previous prototype for 'lockevent_read' [-Werror=missing-prototypes]

Add shared prototype to avoid the warnings.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/locking/lock_events.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/locking/lock_events.h b/kernel/locking/lock_events.h
index 8c7e7d25f09c..a6016b91803d 100644
--- a/kernel/locking/lock_events.h
+++ b/kernel/locking/lock_events.h
@@ -57,4 +57,8 @@ static inline void __lockevent_add(enum lock_events event, int inc)
 #define lockevent_cond_inc(ev, c)
 
 #endif /* CONFIG_LOCK_EVENT_COUNTS */
+
+ssize_t lockevent_read(struct file *file, char __user *user_buf,
+		       size_t count, loff_t *ppos);
+
 #endif /* __LOCKING_LOCK_EVENTS_H */
-- 
2.39.2

