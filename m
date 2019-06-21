Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D25D4EB39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 16:53:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VhXD2QH6zDqTv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 00:53:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="VTUHdnMa"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VhSc5sm6zDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 00:50:40 +1000 (AEST)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8CC92089E;
 Fri, 21 Jun 2019 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561128638;
 bh=S09RYkUMMxHYoHx76cTWh53Cqr6Fibp+qLvkSIpPItQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VTUHdnMaOZ0iDcqeySu7ks48hk5JDg+Vls1nObiTqE94DrxyTAcElQrmmD0FfzeE9
 AwmbDFds/aoQsDKuurx+IyjCDHZpJZduH7+ddd7CTjxtE1jKJw5wlP3K/vPLj2FMDx
 wx5gT00rQzju9oABrDET2XzyIALVVE/Zxk+5tSlI=
Date: Fri, 21 Jun 2019 23:50:34 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 7/7] powerpc/kprobes: Allow probing on any ftrace address
Message-Id: <20190621235034.acc00fc3e2b2c7e89caa1fd5@kernel.org>
In-Reply-To: <d26f5467577ff0aeecea55e7035ea64e303bdf17.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <d26f5467577ff0aeecea55e7035ea64e303bdf17.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 18 Jun 2019 20:17:06 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> With KPROBES_ON_FTRACE, kprobe is allowed to be inserted on instructions
> that branch to _mcount (referred to as ftrace location). With
> -mprofile-kernel, we now include the preceding 'mflr r0' as being part
> of the ftrace location.
> 
> However, by default, probing on an instruction that is not actually the
> branch to _mcount() is prohibited, as that is considered to not be at an
> instruction boundary. This is not the case on powerpc, so allow the same
> by overriding arch_check_ftrace_location()
> 
> In addition, we update kprobe_ftrace_handler() to detect this scenarios
> and to pass the proper nip to the pre and post probe handlers.
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/kprobes-ftrace.c | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
> index 972cb28174b2..6a0bd3c16cb6 100644
> --- a/arch/powerpc/kernel/kprobes-ftrace.c
> +++ b/arch/powerpc/kernel/kprobes-ftrace.c
> @@ -12,14 +12,34 @@
>  #include <linux/preempt.h>
>  #include <linux/ftrace.h>
>  
> +/*
> + * With -mprofile-kernel, we patch two instructions -- the branch to _mcount
> + * as well as the preceding 'mflr r0'. Both these instructions are claimed
> + * by ftrace and we should allow probing on either instruction.
> + */
> +int arch_check_ftrace_location(struct kprobe *p)
> +{
> +	if (ftrace_location((unsigned long)p->addr))
> +		p->flags |= KPROBE_FLAG_FTRACE;
> +	return 0;
> +}
> +
>  /* Ftrace callback handler for kprobes */
>  void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
>  			   struct ftrace_ops *ops, struct pt_regs *regs)
>  {
>  	struct kprobe *p;
> +	int mflr_kprobe = 0;
>  	struct kprobe_ctlblk *kcb;
>  
>  	p = get_kprobe((kprobe_opcode_t *)nip);
> +	if (unlikely(!p)) {

Hmm, is this really unlikely? If we put a kprobe on the second instruction address,
we will see p == NULL always.

> +		p = get_kprobe((kprobe_opcode_t *)(nip - MCOUNT_INSN_SIZE));
> +		if (!p)

Here will be unlikely, because we can not find kprobe at both of nip and
nip - MCOUNT_INSN_SIZE.

> +			return;
> +		mflr_kprobe = 1;
> +	}
> +
>  	if (unlikely(!p) || kprobe_disabled(p))

"unlikely(!p)" is not needed here.

Thank you,

>  		return;
>  
> @@ -33,6 +53,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
>  		 */
>  		regs->nip -= MCOUNT_INSN_SIZE;
>  
> +		if (mflr_kprobe)
> +			regs->nip -= MCOUNT_INSN_SIZE;
> +
>  		__this_cpu_write(current_kprobe, p);
>  		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
>  		if (!p->pre_handler || !p->pre_handler(p, regs)) {
> @@ -45,6 +68,8 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
>  				kcb->kprobe_status = KPROBE_HIT_SSDONE;
>  				p->post_handler(p, regs, 0);
>  			}
> +			if (mflr_kprobe)
> +				regs->nip += MCOUNT_INSN_SIZE;
>  		}
>  		/*
>  		 * If pre_handler returns !0, it changes regs->nip. We have to
> @@ -57,6 +82,11 @@ NOKPROBE_SYMBOL(kprobe_ftrace_handler);
>  
>  int arch_prepare_kprobe_ftrace(struct kprobe *p)
>  {
> +	if ((unsigned long)p->addr & 0x03) {
> +		printk("Attempt to register kprobe at an unaligned address\n");
> +		return -EILSEQ;
> +	}
> +
>  	p->ainsn.insn = NULL;
>  	p->ainsn.boostable = -1;
>  	return 0;
> -- 
> 2.22.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
