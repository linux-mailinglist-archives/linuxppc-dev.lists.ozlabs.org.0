Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C18E3E3284
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 03:04:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhPJm0vbsz3ddb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 11:04:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=mJxmzl3O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.6.42; helo=pv50p00im-zteg10011501.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=mJxmzl3O; dkim-atps=neutral
Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com
 [17.58.6.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhPHH6P4dz3cM1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 11:03:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1628298218; bh=G20sjdPi/op3pAshzrZ7wcSCo/+E1ubXJyBUNeyTABs=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=mJxmzl3OLT/SdEk9sdKk23Pm32bNHfbOtuPgucet4MDzmXPD0DV/blp3ua9ZgfJVQ
 pjEiLg7zslyL7BJ56BcpXDICwW8QhIoF8MjzLH7MsCWglo/b7kh+6qFhe2btL3h7/K
 nNERqvgrJlrKM/Wb+VTK9/3/8G47GHSjPx07rLLm1E1bOCjCzZL1bsUoygvlI5qJlW
 m6HOIwUkGpKEshOXhOkkk8oMVg4hXtyi3FV8838FONCagbzsjI9j5UKb4Jgn8i2yvW
 prmU0qwMBhVWY95y6tnMKnGlZVzTLO1ZTiz3fQqJMdyNYolMFjP3i/wpo2H9R7LNHw
 bY5b3gbWWUfAA==
Received: from xiongwei.. (unknown [120.245.2.134])
 by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id C5486B003BF;
 Sat,  7 Aug 2021 01:03:33 +0000 (UTC)
From: sxwjean@me.com
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] powerpc: Optimize register usage for dear register
Date: Sat,  7 Aug 2021 09:02:38 +0800
Message-Id: <20210807010239.416055-4-sxwjean@me.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210807010239.416055-1-sxwjean@me.com>
References: <20210807010239.416055-1-sxwjean@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_08:2021-08-06,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=744 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2108070004
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
Cc: ravi.bangoria@linux.ibm.com, Xiongwei Song <sxwjean@gmail.com>,
 aneesh.kumar@linux.ibm.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, efremov@linux.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiongwei Song <sxwjean@gmail.com>

Create an anonymous union for dar and dear regsiters, we can reference
dear to get the effective address when CONFIG_4xx=y or CONFIG_BOOKE=y.
Otherwise, reference dar. This makes code more clear.

Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h   | 5 ++++-
 arch/powerpc/kernel/process.c       | 2 +-
 arch/powerpc/kernel/ptrace/ptrace.c | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index c252d04b1206..fa725e3238c2 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -43,7 +43,10 @@ struct pt_regs
 			unsigned long mq;
 #endif
 			unsigned long trap;
-			unsigned long dar;
+			union {
+				unsigned long dar;
+				unsigned long dear;
+			};
 			union {
 				unsigned long dsisr;
 				unsigned long esr;
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index f74af8f9133c..50436b52c213 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1499,7 +1499,7 @@ static void __show_regs(struct pt_regs *regs)
 	    trap == INTERRUPT_DATA_STORAGE ||
 	    trap == INTERRUPT_ALIGNMENT) {
 		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
-			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->esr);
+			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dear, regs->esr);
 		else
 			pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
 	}
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index a222fd4d6334..7c7093c17c45 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -373,6 +373,8 @@ void __init pt_regs_check(void)
 		     offsetof(struct user_pt_regs, trap));
 	BUILD_BUG_ON(offsetof(struct pt_regs, dar) !=
 		     offsetof(struct user_pt_regs, dar));
+	BUILD_BUG_ON(offsetof(struct pt_regs, dear) !=
+		     offsetof(struct user_pt_regs, dar));
 	BUILD_BUG_ON(offsetof(struct pt_regs, dsisr) !=
 		     offsetof(struct user_pt_regs, dsisr));
 	BUILD_BUG_ON(offsetof(struct pt_regs, esr) !=
-- 
2.30.2

