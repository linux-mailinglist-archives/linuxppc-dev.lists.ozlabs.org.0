Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 275B8E68E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:31:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t7tR4Tf3zDqND
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 01:31:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=efficios.com
 (client-ip=167.114.142.138; helo=mail.efficios.com;
 envelope-from=mathieu.desnoyers@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.b="djkcTcOT";
 dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t7r022srzDq8v
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:29:34 +1000 (AEST)
Received: from localhost (ip6-localhost [IPv6:::1])
 by mail.efficios.com (Postfix) with ESMTP id E14411C1D5F;
 Mon, 29 Apr 2019 11:29:30 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
 by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
 with ESMTP id 5MW_MUXV3BF9; Mon, 29 Apr 2019 11:29:30 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
 by mail.efficios.com (Postfix) with ESMTP id 43A221C1D1D;
 Mon, 29 Apr 2019 11:29:28 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 43A221C1D1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1556551768;
 bh=wPddiBdShBppXNiDLwqz7lNkyC8NrgYYgntI0yfX9Z0=;
 h=From:To:Date:Message-Id;
 b=djkcTcOTO2e0LgcW0rucWSFWEWUJPhpyMGSN2HRPFxnhMnfknL1g2oJ4jHd8pSNT1
 DpXvmoEQC/i53SVp2ypPnpeqL5bNqJSjZ2h8pYY9Ro8iUScNFXUO7rhvvJLmbcXK7m
 PN5qjiCPP2kkGQzDgyc30y0pYGP9xeraRKzGnWepX2GKjl60bdLbVdcITd24T58/GY
 0Qtej+HIRS6o14IUNO+w6c+VZ4yWG6fTM9sb1LMVQm2DikKa+CvhgjO5jJdIsc9JZD
 zXBjvuPJS4vQ9E3mxvftE1SPhUju+PFJpkHba447OYkaYzZNMw1V0OvPtc/mY6+Y98
 yYo2PXp6psyuA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
 by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id NRO-4hextqik; Mon, 29 Apr 2019 11:29:28 -0400 (EDT)
Received: from thinkos.internal.efficios.com (192-222-157-41.qc.cable.ebox.net
 [192.222.157.41])
 by mail.efficios.com (Postfix) with ESMTPSA id 49AF71C1CFA;
 Mon, 29 Apr 2019 11:29:27 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Shuah Khan <shuah@kernel.org>
Subject: [PATCH for 5.2 10/12] rseq/selftests: powerpc code signature:
 generate valid instructions
Date: Mon, 29 Apr 2019 11:28:01 -0400
Message-Id: <20190429152803.7719-11-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190429152803.7719-1-mathieu.desnoyers@efficios.com>
References: <20190429152803.7719-1-mathieu.desnoyers@efficios.com>
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
Cc: Joel Fernandes <joelaf@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Dave Watson <davejwatson@fb.com>,
 Will Deacon <will.deacon@arm.com>, Andi Kleen <andi@firstfloor.org>,
 Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Chris Lameter <cl@linux.com>, Russell King <linux@arm.linux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>, Paul Turner <pjt@google.com>,
 Alan Modra <amodra@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ben Maurer <bmaurer@fb.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use "twui" as the guard instruction for the restartable sequence abort
handler.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
CC: Paul Mackerras <paulus@samba.org>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
CC: Alan Modra <amodra@gmail.com>
CC: linuxppc-dev@lists.ozlabs.org
---
 tools/testing/selftests/rseq/rseq-ppc.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rseq/rseq-ppc.h b/tools/testing/selftests/rseq/rseq-ppc.h
index 9df18487fa9f..76be90196fe4 100644
--- a/tools/testing/selftests/rseq/rseq-ppc.h
+++ b/tools/testing/selftests/rseq/rseq-ppc.h
@@ -6,7 +6,15 @@
  * (C) Copyright 2016-2018 - Boqun Feng <boqun.feng@gmail.com>
  */
 
-#define RSEQ_SIG	0x53053053
+/*
+ * RSEQ_SIG is used with the following trap instruction:
+ *
+ * powerpc-be:    0f e5 00 0b           twui   r5,11
+ * powerpc64-le:  0b 00 e5 0f           twui   r5,11
+ * powerpc64-be:  0f e5 00 0b           twui   r5,11
+ */
+
+#define RSEQ_SIG	0x0fe5000b
 
 #define rseq_smp_mb()		__asm__ __volatile__ ("sync"	::: "memory", "cc")
 #define rseq_smp_lwsync()	__asm__ __volatile__ ("lwsync"	::: "memory", "cc")
-- 
2.11.0

