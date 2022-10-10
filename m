Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E31AE5F97FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 07:59:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm7Y063Q9z2yJQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 16:59:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dVajeWBC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:2:aacc::; helo=out2.migadu.com; envelope-from=vineet.gupta@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dVajeWBC;
	dkim-atps=neutral
X-Greylist: delayed 321 seconds by postgrey-1.36 at boromir; Mon, 10 Oct 2022 16:23:50 AEDT
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm6lV2Sq6z2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 16:23:50 +1100 (AEDT)
Message-ID: <8da9812d-eb84-2a84-321e-ea2826ef8981@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1665379096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RPNRy9onik+CC8H+dbLBGG/JFwC/8JgqUDFh6TQvjgI=;
	b=dVajeWBCcCO1PzScOej77248yySjwbUmP9SvX6xR/puhU5jnZMHgj6LOku/wZMaMMQ98Ki
	yfo+nMCN0uF3CE04ZlxkeKXtYTYNGRGuE1oxwx74rgy0CIYe1/njfj6gTTjQAl8S86mL5O
	rJsCdqqalBAjnegbuN5Fmk7Xe1Lqvpk=
Date: Sun, 9 Oct 2022 22:18:11 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/4] arc: Use generic dump_stack_print_cmdline()
 implementation
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, linux-s390@vger.kernel.org,
 Josh Triplett <josh@joshtriplett.org>, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20220808130917.30760-1-deller@gmx.de>
 <20220808130917.30760-5-deller@gmx.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <20220808130917.30760-5-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 10 Oct 2022 16:59:02 +1100
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
Cc: Alexey Brodkin <abrodkin@synopsys.com>, Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/8/22 06:09, Helge Deller wrote:
> The process program name and command line is now shown in generic code
> in dump_stack_print_info(), so drop the arc-specific implementation.
>
> Signed-off-by: Helge Deller <deller@gmx.de>

But that info printing was added back in 2018 by e36df28f532f882.
I don't think arc is using show_regs_print_info -> dump_stack_print_info 
yet.
Or is there a different code path now which calls here ?

> ---
>   arch/arc/kernel/troubleshoot.c | 24 ------------------------
>   1 file changed, 24 deletions(-)
>
> diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
> index 7654c2e42dc0..9807e590ee55 100644
> --- a/arch/arc/kernel/troubleshoot.c
> +++ b/arch/arc/kernel/troubleshoot.c
> @@ -51,29 +51,6 @@ static void print_regs_callee(struct callee_regs *regs)
>   		regs->r24, regs->r25);
>   }
>
> -static void print_task_path_n_nm(struct task_struct *tsk)
> -{
> -	char *path_nm = NULL;
> -	struct mm_struct *mm;
> -	struct file *exe_file;
> -	char buf[ARC_PATH_MAX];
> -
> -	mm = get_task_mm(tsk);
> -	if (!mm)
> -		goto done;
> -
> -	exe_file = get_mm_exe_file(mm);
> -	mmput(mm);
> -
> -	if (exe_file) {
> -		path_nm = file_path(exe_file, buf, ARC_PATH_MAX-1);
> -		fput(exe_file);
> -	}
> -
> -done:
> -	pr_info("Path: %s\n", !IS_ERR(path_nm) ? path_nm : "?");
> -}
> -
>   static void show_faulting_vma(unsigned long address)
>   {
>   	struct vm_area_struct *vma;
> @@ -176,7 +153,6 @@ void show_regs(struct pt_regs *regs)
>   	 */
>   	preempt_enable();

Maybe we remove preempt* as well now (perhaps as a follow up patch) 
since that was added by f731a8e89f8c78 "ARC: show_regs: lockdep: 
re-enable preemption" where show_regs -> print_task_path_n_nm -> mmput 
was triggering lockdep splat which is supposedly removed.

>
> -	print_task_path_n_nm(tsk);
>   	show_regs_print_info(KERN_INFO);
>
>   	show_ecr_verbose(regs);
> --
> 2.37.1
>
>
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc

