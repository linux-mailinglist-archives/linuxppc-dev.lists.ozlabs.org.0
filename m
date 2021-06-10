Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 572933A257B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 09:30:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0wcY6N0bz3bTv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 17:30:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XM0DPwfw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XM0DPwfw; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0wc54rwqz2ykP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 17:30:13 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G0wc12MGsz9sW7; Thu, 10 Jun 2021 17:30:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623310209;
 bh=laHgaG8+yVPrQoIizKzrymi72voOCH7NKO20GZWXGvo=;
 h=From:To:Cc:Subject:Date:From;
 b=XM0DPwfw9cWloAJ8C8Y55X6vMVhC8pcuhaAWCj5Hyc7df/+0JzmtANfrM47O/E8Ug
 cIvOVipiP4p7dyuFFRkfA5URDMKZCWfbnpvs8epY7Md5i+U3WgViCCsATI95WieFsA
 jynCYOWX4cPWarMllBoEPP41tL2Rmxmxi+XqmxP7fwReTuPOjS2JvOdXURLZMxHXbC
 Cf8TGh2XLGjqQy3nOmUxBOW5GIMbSs7glQVEuJcoKQ7/ANAmT1EaqbaS026aK78Zd3
 5M7UcBRXTlXA4UewcFZEGa2qut+3KT4X5P2LxVjry/f+BiZTZM+Fd+402stU+loDUC
 6WKVmG4hcKZgQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/signal64: Don't read sigaction arguments back from
 user memory
Date: Thu, 10 Jun 2021 17:29:49 +1000
Message-Id: <20210610072949.3198522-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When delivering a signal to a sigaction style handler (SA_SIGINFO), we
pass pointers to the siginfo and ucontext via r4 and r5.

Currently we populate the values in those registers by reading the
pointers out of the sigframe in user memory, even though the values in
user memory were written by the kernel just prior:

  unsafe_put_user(&frame->info, &frame->pinfo, badframe_block);
  unsafe_put_user(&frame->uc, &frame->puc, badframe_block);
  ...
  if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
  	err |= get_user(regs->gpr[4], (unsigned long __user *)&frame->pinfo);
  	err |= get_user(regs->gpr[5], (unsigned long __user *)&frame->puc);

ie. we write &frame->info into frame->pinfo, and then read frame->pinfo
back into r4, and similarly for &frame->uc.

The code has always been like this, since linux-fullhistory commit
d4f2d95eca2c ("Forward port of 2.4 ppc64 signal changes.").

There's no reason for us to read the values back from user memory,
rather than just setting the value in the gpr[4/5] directly. In fact
reading the value back from user memory opens up the possibility of
another user thread changing the values before we read them back.
Although any process doing that would be racing against the kernel
delivering the signal, and would risk corrupting the stack, so that
would be a userspace bug.

Note that this is 64-bit only code, so there's no subtlety with the size
of pointers differing between kernel and user. Also the frame variable
is not modified to point elsewhere during the function.

In the past reading the values back from user memory was not costly, but
now that we have KUAP on some CPUs it is, so we'd rather avoid it for
that reason too.

So change the code to just set the values directly, using the same
values we have written to the sigframe previously in the function.

Note also that this matches what our 32-bit signal code does.

Using a version of will-it-scale's signal1_threads that sets SA_SIGINFO,
this results in a ~4% increase in signals per second on a Power9, from
229,777 to 239,766.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/signal_64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index dca66481d0c2..f58e7a98d0df 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -948,8 +948,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	regs->gpr[3] = ksig->sig;
 	regs->result = 0;
 	if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
-		err |= get_user(regs->gpr[4], (unsigned long __user *)&frame->pinfo);
-		err |= get_user(regs->gpr[5], (unsigned long __user *)&frame->puc);
+		regs->gpr[4] = (unsigned long)&frame->info;
+		regs->gpr[5] = (unsigned long)&frame->uc;
 		regs->gpr[6] = (unsigned long) frame;
 	} else {
 		regs->gpr[4] = (unsigned long)&frame->uc.uc_mcontext;
-- 
2.25.1

