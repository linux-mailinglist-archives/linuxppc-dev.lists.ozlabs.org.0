Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F65B4D9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 14:16:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XhsT384SzF37N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 22:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XhpF1nWpzDqWP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 22:13:04 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 459AF10CC1EB;
 Tue, 17 Sep 2019 12:13:02 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.72])
 by smtp.corp.redhat.com (Postfix) with SMTP id 1A4455C1D8;
 Tue, 17 Sep 2019 12:12:57 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Tue, 17 Sep 2019 14:13:02 +0200 (CEST)
Date: Tue, 17 Sep 2019 14:12:56 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Subject: [PATCH?] powerpc: Hard wire PT_SOFTE value to 1 in gpr_get() too
Message-ID: <20190917121256.GA8659@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 17 Sep 2019 12:13:02 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, Jan Kratochvil <jan.kratochvil@redhat.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I don't have a ppc machine, this patch wasn't even compile tested,
could you please review?

The commit a8a4b03ab95f ("powerpc: Hard wire PT_SOFTE value to 1 in
ptrace & signals") changed ptrace_get_reg(PT_SOFTE) to report 0x1,
but PTRACE_GETREGS still copies pt_regs->softe as is.

This is not consistent and this breaks
http://sourceware.org/systemtap/wiki/utrace/tests/user-regs-peekpoke

Reported-by: Jan Kratochvil <jan.kratochvil@redhat.com>
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 arch/powerpc/kernel/ptrace.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
index 8c92feb..9e9342c 100644
--- a/arch/powerpc/kernel/ptrace.c
+++ b/arch/powerpc/kernel/ptrace.c
@@ -363,11 +363,36 @@ static int gpr_get(struct task_struct *target, const struct user_regset *regset,
 	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
 		     offsetof(struct pt_regs, msr) + sizeof(long));
 
+#ifdef CONFIG_PPC64
+	if (!ret)
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+					  &target->thread.regs->orig_gpr3,
+					  offsetof(struct pt_regs, orig_gpr3),
+					  offsetof(struct pt_regs, softe));
+
+	if (!ret) {
+		unsigned long softe = 0x1;
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &msr,
+					  offsetof(struct pt_regs, softe),
+					  offsetof(struct pt_regs, softe) +
+					  sizeof(softe));
+	}
+
+	BUILD_BUG_ON(offsetof(struct pt_regs, trap) !=
+		     offsetof(struct pt_regs, softe) + sizeof(long));
+
+	if (!ret)
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+					  &target->thread.regs->trap,
+					  offsetof(struct pt_regs, trap),
+					  sizeof(struct user_pt_regs));
+#else
 	if (!ret)
 		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
 					  &target->thread.regs->orig_gpr3,
 					  offsetof(struct pt_regs, orig_gpr3),
 					  sizeof(struct user_pt_regs));
+#endif
 	if (!ret)
 		ret = user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
 					       sizeof(struct user_pt_regs), -1);
-- 
2.5.0


