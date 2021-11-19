Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 468BB456E42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 12:33:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwZLM0wN9z3cFh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 22:33:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=URmJEXNO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=URmJEXNO; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwZJL0Wpsz2ynp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 22:32:01 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id x5so9205371pfr.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 03:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HNWfPJEA+TK3OOf6ZR3iwJQRckjNFQtzKStHMcKosHg=;
 b=URmJEXNOclDW1ealeA2WsN0nInHSFowJsaKhpz/ZVDoKioP2WdCfjtQctCza90ugiw
 FnUvwOfS1JKLZbkcRCxlWujtg/U1QIeIGFxEpqGX0cTlKNLeVUJOnwqmOuakvGEO0nZp
 GvIvcaAAGpcxlnsyar5TbHHglp/s9NJIBR3/uV4VztiuQmldg6GaSF4RyOHO6gJKVwwf
 GQlE0LNjlam62/k/yHO3x6Ue3/noJwV10r6LtxO/ms1bwERYkJ8hBeBTkG/P8xRQ7l67
 n+rIpM5BluREfHjNUGDTCw//AScFsh3MhsR8DDj2N/0pzqtqD08v7vsUTBnYkjUO6Cxb
 vj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNWfPJEA+TK3OOf6ZR3iwJQRckjNFQtzKStHMcKosHg=;
 b=E4mgFj4yE40DpZCtEKS4IGyxmA6dyq5u0sf4w3H59i0dbyBHnmkLvom8vmBwR4LciX
 EgUoyJ3d0vLtDHJZhDfUB0HxrWkRejwvNY9L43TOF7jnpPv+YaVb6eEDOyO/Bh+nbwPO
 tPoBN/Clm5trCz9f3Twp/1mjQ72TNX93Su4yvd6I7jJ2cizgIxEQ0y5tpMwIg1lsB1GZ
 84Lj6Q2oymiWfvZNs4IgqkooIjkQtUREbI+PAS4PepdCSKUS4Qkuj9mQncUpsrDOcp6h
 a0V/13qyPLZMp+7hTezDgBQAS0IkupO3o0hH4vW256Fj2ukjLepyFgFnXarqZVDWfVCy
 nYlA==
X-Gm-Message-State: AOAM530P4ajXOoMZQLORG+fV6y3ZoFjlRLyJbkvI0hrueGC1d/uDK53A
 W7RSKkPwN9cboflSAg/LpxJK3Sr3QFA=
X-Google-Smtp-Source: ABdhPJz0KmcKJ9xREgY6bbC//IExVboXL5OmX5lEX+jCjkKvflk5rHa6fKIeCs1vWgvorPDWOw/aUQ==
X-Received: by 2002:a63:684:: with SMTP id 126mr16639968pgg.213.1637321519594; 
 Fri, 19 Nov 2021 03:31:59 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-240-2-228.tpgi.com.au. [60.240.2.228])
 by smtp.gmail.com with ESMTPSA id
 g17sm2632626pfv.136.2021.11.19.03.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:31:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/5] powerpc/watchdog: tighten non-atomic read-modify-write
 access
Date: Fri, 19 Nov 2021 21:31:43 +1000
Message-Id: <20211119113146.752759-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211119113146.752759-1-npiggin@gmail.com>
References: <20211119113146.752759-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most updates to wd_smp_cpus_pending are under lock except the watchdog
interrupt bit clear.

This can race with non-atomic RMW updates to the mask under lock, which
can happen in two instances:

Firstly, if another CPU detects this one is stuck, removes it from the
mask, mask becomes empty and is re-filled with non-atomic stores. This
is okay because it would re-fill the mask with this CPU's bit clear
anyway (because this CPU is now stuck), so it doesn't matter that the
bit clear update got "lost". Add a comment for this.

Secondly, if another CPU detects a different CPU is stuck and removes it
from the pending mask with a non-atomic store to bytes which also
include the bit of this CPU. This case can result in the bit clear being
lost and the end result being the bit is set. This should be so rare it
hardly matters, but to make things simpler to reason about just avoid
the non-atomic access for that case.

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 36 ++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index ad94a2c6b733..588f54350d19 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -131,10 +131,10 @@ static void wd_lockup_ipi(struct pt_regs *regs)
 	/* Do not panic from here because that can recurse into NMI IPI layer */
 }
 
-static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
+static bool set_cpu_stuck(int cpu, u64 tb)
 {
-	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
-	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
+	cpumask_set_cpu(cpu, &wd_smp_cpus_stuck);
+	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
 	/*
 	 * See wd_smp_clear_cpu_pending()
 	 */
@@ -144,11 +144,9 @@ static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
 		cpumask_andnot(&wd_smp_cpus_pending,
 				&wd_cpus_enabled,
 				&wd_smp_cpus_stuck);
+		return true;
 	}
-}
-static void set_cpu_stuck(int cpu, u64 tb)
-{
-	set_cpumask_stuck(cpumask_of(cpu), tb);
+	return false;
 }
 
 static void watchdog_smp_panic(int cpu, u64 tb)
@@ -177,15 +175,17 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 		 * get a backtrace on all of them anyway.
 		 */
 		for_each_cpu(c, &wd_smp_cpus_pending) {
+			bool empty;
 			if (c == cpu)
 				continue;
+			/* Take the stuck CPUs out of the watch group */
+			empty = set_cpu_stuck(c, tb);
 			smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
+			if (empty)
+				break;
 		}
 	}
 
-	/* Take the stuck CPUs out of the watch group */
-	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
-
 	wd_smp_unlock(&flags);
 
 	if (sysctl_hardlockup_all_cpu_backtrace)
@@ -243,6 +243,22 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 		return;
 	}
 
+	/*
+	 * All other updates to wd_smp_cpus_pending are performed under
+	 * wd_smp_lock. All of them are atomic except the case where the
+	 * mask becomes empty and is reset. This will not happen here because
+	 * cpu was tested to be in the bitmap (above), and a CPU only clears
+	 * its own bit. _Except_ in the case where another CPU has detected a
+	 * hard lockup on our CPU and takes us out of the pending mask. So in
+	 * normal operation there will be no race here, no problem.
+	 *
+	 * In the lockup case, this atomic clear-bit vs a store that refills
+	 * other bits in the accessed word wll not be a problem. The bit clear
+	 * is atomic so it will not cause the store to get lost, and the store
+	 * will never set this bit so it will not overwrite the bit clear. The
+	 * only way for a stuck CPU to return to the pending bitmap is to
+	 * become unstuck itself.
+	 */
 	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
 
 	/*
-- 
2.23.0

