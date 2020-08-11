Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A6241ACC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 14:09:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQs7c1FpyzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 22:09:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQs5N2vcRzDqPC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 22:07:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=epOUAdKw; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQs5M4H6qz9sTR;
 Tue, 11 Aug 2020 22:07:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597147624;
 bh=pb6dXzfa2UA0hCpfDnFm4lqr+4kZIHCcfkntrubsbmM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=epOUAdKw8rGRYYkzHGeceNWOqXrXBOAZUHmg8Du5RAI7CnY0Pce78OEqmsBg00vdF
 hRjoQ3DzthPHf4nGFGSVmAEw2lbBg0cnNiz8CGE1pDhF5PeW9PA6N0aASDF9FEHb+E
 N/wbs+D5YAj66UU0r/b0PXwNVL0jcO7xx2qcPSAdMJErNhr7s9An4+NGcKyuDk0ZJK
 mMkmWrG65+myCZqoqF+CV8K41oEmOFR3OBQZBJm6oY3hQdpQJAl2xrw78TZnFhvYUo
 GTqQYyJhzNRJZD0HchERImxhS7RjF+U6v/dVSEPenRa+qtE5Tr9EvMbZ/XipzTRNUn
 EVxz/T1itG/OQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [RFC PATCH v1] power: don't manage floating point regs when no FPU
In-Reply-To: <95c00a811897f6d9176d30bf2ac92dab8c9c8e95.1596816789.git.christophe.leroy@csgroup.eu>
References: <95c00a811897f6d9176d30bf2ac92dab8c9c8e95.1596816789.git.christophe.leroy@csgroup.eu>
Date: Tue, 11 Aug 2020 22:07:02 +1000
Message-ID: <87o8nh9yjd.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> There is no point in copying floating point regs when there
> is no FPU and MATH_EMULATION is not selected.

Yeah I guess you're right. I've never touched a system with neither, but
if such a thing exists then it does seem silly to copy regs around that
can't be used.

> Create a new CONFIG_PPC_FPU_REGS bool that is selected by
> CONFIG_MATH_EMULATION and CONFIG_PPC_FPU, and use it to
> opt out everything related to fp_state in thread_struct.
>
> The following app runs in approx 10.50 seconds on an 8xx without
> the patch, and in 9.45 seconds with the patch.
>
> 	void sigusr1(int sig) { }
>
> 	int main(int argc, char **argv)
> 	{
> 		int i = 100000;
>
> 		signal(SIGUSR1, sigusr1);
> 		for (;i--;)
> 			raise(SIGUSR1);
> 		exit(0);
> 	}
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/Kconfig                      |  1 +
>  arch/powerpc/include/asm/processor.h      |  2 ++
>  arch/powerpc/kernel/asm-offsets.c         |  2 ++
>  arch/powerpc/kernel/process.c             |  4 ++++
>  arch/powerpc/kernel/ptrace/ptrace-novsx.c |  8 ++++++++
>  arch/powerpc/kernel/ptrace/ptrace.c       |  4 ++++
>  arch/powerpc/kernel/signal.c              | 12 +++++++++++-
>  arch/powerpc/kernel/signal_32.c           |  4 ++++
>  arch/powerpc/kernel/traps.c               |  4 ++++
>  arch/powerpc/platforms/Kconfig.cputype    |  4 ++++
>  10 files changed, 44 insertions(+), 1 deletion(-)

In general this looks fine.

It's a bit #ifdef heavy. Maybe some of those can be cleaned up a bit
with some wrapper inlines?

> diff --git a/arch/powerpc/kernel/ptrace/ptrace-novsx.c b/arch/powerpc/kernel/ptrace/ptrace-novsx.c
> index b2dc4e92d11a..8f87a11f3f8c 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-novsx.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-novsx.c
> @@ -28,6 +29,9 @@ int fpr_get(struct task_struct *target, const struct user_regset *regset,
>  
>  	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
>  				   &target->thread.fp_state, 0, -1);
> +#else
> +	return 0;
> +#endif

Should we return -ENODEV/EIO here? Wonder if another arch can give us a clue.

cheers
