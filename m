Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91082B7475
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 09:55:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Ypzn15tLzF4d7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 17:55:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Ypx35q1HzF4RX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 17:52:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="SBAxLABF"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Ypwy16CFz9s4Y;
 Thu, 19 Sep 2019 17:52:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568879574;
 bh=MQ8i8P7x2CIntxGyuHQOnvXpKPoSHnuNRpmky603kjI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SBAxLABFw4vvY6CS2eOFusJcODowDpeY/9sSgVE831lCrQSnYnI7mlbhEEFUiI0+D
 WH3apBam2mKZAvDFvQdZ+d8exmnQ/GsGkGAZWYX8H8TUftz/bb8WuG1s0Ak4Vd+TOT
 GXwL6+CxGCCgfjMFs+YYQtDAxZNKX5Wij5BVup5a5zs07tdnwqeFrtPgQDdZhVSTKa
 HbV1oXW5r/tNE2b/bPw7hE7HC9Vl0uRdjzY3NvWJLMZEpRc7u97L+dsN6P7KSVZKet
 L0dy8e3HBhcWXyswwtNyNdRntkyLHlCZkF5oyxjL4Ut/n9bqpflQvG3AyW0fHqBKLW
 UnjBlzcBJGiBQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oleg Nesterov <oleg@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH?] powerpc: Hard wire PT_SOFTE value to 1 in gpr_get() too
In-Reply-To: <20190917121256.GA8659@redhat.com>
References: <20190917121256.GA8659@redhat.com>
Date: Thu, 19 Sep 2019 17:52:39 +1000
Message-ID: <87ftksvi2g.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi Oleg,

Thanks for the patch.

Oleg Nesterov <oleg@redhat.com> writes:
> I don't have a ppc machine, this patch wasn't even compile tested,
> could you please review?
>
> The commit a8a4b03ab95f ("powerpc: Hard wire PT_SOFTE value to 1 in
> ptrace & signals") changed ptrace_get_reg(PT_SOFTE) to report 0x1,
> but PTRACE_GETREGS still copies pt_regs->softe as is.

Ugh, that certainly seems broken. I guess we forgot/didn't-know that
there were two paths through ptrace to get the one register.

> This is not consistent and this breaks
> http://sourceware.org/systemtap/wiki/utrace/tests/user-regs-peekpoke

That's a 404 for me?

Is it this: https://sourceware.org/systemtap/wiki/utrace/tests/

That seems to point me to a CVS repo? Which then didn't build. But now I
have that one test built, and you're right it fails with:

$ ./user-regs-peekpoke 
mismatch at offset 0x138: poked 0 but peeked 1


> Reported-by: Jan Kratochvil <jan.kratochvil@redhat.com>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  arch/powerpc/kernel/ptrace.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
> index 8c92feb..9e9342c 100644
> --- a/arch/powerpc/kernel/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace.c
> @@ -363,11 +363,36 @@ static int gpr_get(struct task_struct *target, const struct user_regset *regset,
>  	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
>  		     offsetof(struct pt_regs, msr) + sizeof(long));
>  
> +#ifdef CONFIG_PPC64
> +	if (!ret)
> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
> +					  &target->thread.regs->orig_gpr3,
> +					  offsetof(struct pt_regs, orig_gpr3),
> +					  offsetof(struct pt_regs, softe));
> +
> +	if (!ret) {
> +		unsigned long softe = 0x1;
> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &msr,
> +					  offsetof(struct pt_regs, softe),
> +					  offsetof(struct pt_regs, softe) +
> +					  sizeof(softe));
> +	}
> +
> +	BUILD_BUG_ON(offsetof(struct pt_regs, trap) !=
> +		     offsetof(struct pt_regs, softe) + sizeof(long));
> +
> +	if (!ret)
> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
> +					  &target->thread.regs->trap,
> +					  offsetof(struct pt_regs, trap),
> +					  sizeof(struct user_pt_regs));
> +#else
>  	if (!ret)
>  		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
>  					  &target->thread.regs->orig_gpr3,
>  					  offsetof(struct pt_regs, orig_gpr3),
>  					  sizeof(struct user_pt_regs));
> +#endif
>  	if (!ret)
>  		ret = user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
>  					       sizeof(struct user_pt_regs), -1);

It would be nice if we could isolate the special logic in once place,
ie. ptrace_get_reg().

We could do it like below. I'm 50/50 though on whether it's worth it, or
if we should just go with the big ifdef like in your patch.

cheers


diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
index 8c92febf5f44..55510f1a7ec1 100644
--- a/arch/powerpc/kernel/ptrace.c
+++ b/arch/powerpc/kernel/ptrace.c
@@ -334,6 +334,11 @@ int ptrace_put_reg(struct task_struct *task, int regno, unsigned long data)
 	return -EIO;
 }
 
+#ifndef __powerpc64__
+/* Needed on 32-bit to make the SOFTE logic below work without ifdefs */
+#define PT_SOFTE	PT_MQ
+#endif
+
 static int gpr_get(struct task_struct *target, const struct user_regset *regset,
 		   unsigned int pos, unsigned int count,
 		   void *kbuf, void __user *ubuf)
@@ -367,6 +372,24 @@ static int gpr_get(struct task_struct *target, const struct user_regset *regset,
 		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
 					  &target->thread.regs->orig_gpr3,
 					  offsetof(struct pt_regs, orig_gpr3),
+					  PT_SOFTE * sizeof(long));
+
+	/* SOFTE is special on 64-bit, the logic is in ptrace_get_reg() */
+	if (!ret) {
+		unsigned long val = 0;
+		ptrace_get_reg(target, PT_SOFTE, &val);
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &val,
+					  PT_SOFTE * sizeof(long),
+					  offsetof(struct pt_regs, trap));
+	}
+
+	BUILD_BUG_ON(offsetof(struct pt_regs, trap) !=
+		     (PT_SOFTE * sizeof(long)) + sizeof(long));
+
+	if (!ret)
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+					  &target->thread.regs->trap,
+					  offsetof(struct pt_regs, trap),
 					  sizeof(struct user_pt_regs));
 	if (!ret)
 		ret = user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
@@ -3384,9 +3407,13 @@ void __init pt_regs_check(void)
 #ifdef __powerpc64__
 	BUILD_BUG_ON(offsetof(struct pt_regs, softe) !=
 		     offsetof(struct user_pt_regs, softe));
+	BUILD_BUG_ON(offsetof(struct pt_regs, softe) !=
+		     PT_SOFTE * sizeof(long));
 #else
 	BUILD_BUG_ON(offsetof(struct pt_regs, mq) !=
 		     offsetof(struct user_pt_regs, mq));
+	BUILD_BUG_ON(offsetof(struct pt_regs, mq) !=
+		     PT_MQ * sizeof(long));
 #endif
 	BUILD_BUG_ON(offsetof(struct pt_regs, trap) !=
 		     offsetof(struct user_pt_regs, trap));
