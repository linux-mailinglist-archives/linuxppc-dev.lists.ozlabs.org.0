Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D6A47C48D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 18:02:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJN6j1rw0z3cRs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 04:02:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t+2SY3ct;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t+2SY3ct; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJN5S1dtLz2y7Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 04:01:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 01EACCE1759;
 Tue, 21 Dec 2021 17:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02DBC36AF1;
 Tue, 21 Dec 2021 17:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640106071;
 bh=Oy/NR31/F+xIHSgTDjx6GQ7Gg7r+DRliyRChxoAHfB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t+2SY3ctNJy2loFboEsO1g1VwFMmfV1vqCzgFiBIAs+nQOxvy14mfPk6ozxvJiD0B
 eg90VAmLXNGCPOo9oB6vWiAiXtJiBS3aQw6asEkpwbbZRLsh0QbyPMz/5HiCv1MTpd
 IPAajqWSbzXDNhuf5QsWfR4GKqaHvQGOOX8oAUUCadtRsuEsG81hDYcWSXE0SDJfUS
 f3zeqKgVzuacH2+clEiw3G/1gOfpdBu8YvQjO8L5lIRyoAdFqjvTUmDM13Onb0pWlO
 yWXPjHR3GYyfgiGta4BbY4xbA66cojMLT2j8WuuzRs5FsgX8G01zNHESnkL4troWbC
 JU9hzS/5ry9ag==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com
Subject: [PATCH 1/8] sched: Remove unused TASK_SIZE_OF
Date: Wed, 22 Dec 2021 01:00:50 +0800
Message-Id: <20211221170057.2637763-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221170057.2637763-1-guoren@kernel.org>
References: <20211221170057.2637763-1-guoren@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.or,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux, now. Delete in include/linux/sched.h
and arch's include/asm. This would confuse people who are
implementing the COMPAT feature for architecture.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 include/linux/sched.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 78c351e35fec..8e5689d06ac8 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2166,10 +2166,6 @@ static inline bool vcpu_is_preempted(int cpu)
 extern long sched_setaffinity(pid_t pid, const struct cpumask *new_mask);
 extern long sched_getaffinity(pid_t pid, struct cpumask *mask);
 
-#ifndef TASK_SIZE_OF
-#define TASK_SIZE_OF(tsk)	TASK_SIZE
-#endif
-
 #ifdef CONFIG_SMP
 /* Returns effective CPU energy utilization, as seen by the scheduler */
 unsigned long sched_cpu_util(int cpu, unsigned long max);
-- 
2.25.1

