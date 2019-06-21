Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 404BA4EAFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 16:47:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VhNZ4vzczDqHG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 00:47:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="z8vJLfX+"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VhGL43DrzDqbr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 00:41:46 +1000 (AEST)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A2FF2089E;
 Fri, 21 Jun 2019 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561128104;
 bh=Zx8Cb3sL7YY/8HdLMmq9f5WsUHM/Py3MlcVld2ei5Jo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=z8vJLfX+AQ0JZQfXq307TNp2IDXglTStolUHvFcBpgj1DxYpi4qD386PJeQeLg4TN
 uND0xqA5PxXmC8Dtf8w1p0JZ6mGe+/8eVM/D6U797f+mt07uppsqnVP9Ly2cXalJGi
 hptA7WUg5PQJ2Vt63iDJpgVvfw67y8nb/MnSvsRw=
Date: Fri, 21 Jun 2019 23:41:40 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 6/7] kprobes/ftrace: Use ftrace_location() when
 [dis]arming probes
Message-Id: <20190621234140.5604fcd4ae5260b1020deccb@kernel.org>
In-Reply-To: <4fedad69107b7fd81b9324315ce4fbf6287e5084.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <4fedad69107b7fd81b9324315ce4fbf6287e5084.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
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

On Tue, 18 Jun 2019 20:17:05 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> Ftrace location could include more than a single instruction in case of
> some architectures (powerpc64, for now). In this case, kprobe is
> permitted on any of those instructions, and uses ftrace infrastructure
> for functioning.
> 
> However, [dis]arm_kprobe_ftrace() uses the kprobe address when setting
> up ftrace filter IP. This won't work if the address points to any
> instruction apart from the one that has a branch to _mcount(). To
> resolve this, have [dis]arm_kprobe_ftrace() use ftrace_function() to
> identify the filter IP.

This looks good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you!

> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  kernel/kprobes.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 445337c107e0..282ee704e2d8 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -978,10 +978,10 @@ static int prepare_kprobe(struct kprobe *p)
>  /* Caller must lock kprobe_mutex */
>  static int arm_kprobe_ftrace(struct kprobe *p)
>  {
> +	unsigned long ftrace_ip = ftrace_location((unsigned long)p->addr);
>  	int ret = 0;
>  
> -	ret = ftrace_set_filter_ip(&kprobe_ftrace_ops,
> -				   (unsigned long)p->addr, 0, 0);
> +	ret = ftrace_set_filter_ip(&kprobe_ftrace_ops, ftrace_ip, 0, 0);
>  	if (ret) {
>  		pr_debug("Failed to arm kprobe-ftrace at %pS (%d)\n",
>  			 p->addr, ret);
> @@ -1005,13 +1005,14 @@ static int arm_kprobe_ftrace(struct kprobe *p)
>  	 * non-empty filter_hash for IPMODIFY ops, we're safe from an accidental
>  	 * empty filter_hash which would undesirably trace all functions.
>  	 */
> -	ftrace_set_filter_ip(&kprobe_ftrace_ops, (unsigned long)p->addr, 1, 0);
> +	ftrace_set_filter_ip(&kprobe_ftrace_ops, ftrace_ip, 1, 0);
>  	return ret;
>  }
>  
>  /* Caller must lock kprobe_mutex */
>  static int disarm_kprobe_ftrace(struct kprobe *p)
>  {
> +	unsigned long ftrace_ip = ftrace_location((unsigned long)p->addr);
>  	int ret = 0;
>  
>  	if (kprobe_ftrace_enabled == 1) {
> @@ -1022,8 +1023,7 @@ static int disarm_kprobe_ftrace(struct kprobe *p)
>  
>  	kprobe_ftrace_enabled--;
>  
> -	ret = ftrace_set_filter_ip(&kprobe_ftrace_ops,
> -			   (unsigned long)p->addr, 1, 0);
> +	ret = ftrace_set_filter_ip(&kprobe_ftrace_ops, ftrace_ip, 1, 0);
>  	WARN_ONCE(ret < 0, "Failed to disarm kprobe-ftrace at %pS (%d)\n",
>  		  p->addr, ret);
>  	return ret;
> -- 
> 2.22.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
