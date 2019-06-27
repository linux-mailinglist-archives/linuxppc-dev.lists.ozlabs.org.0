Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9442C58390
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 15:33:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZLSL3VnbzDqF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 23:33:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=021e=u2=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZLMk697GzDqXD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 23:29:06 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CF132083B;
 Thu, 27 Jun 2019 13:29:03 +0000 (UTC)
Date: Thu, 27 Jun 2019 09:29:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/7] x86/ftrace: Fix use of flags in
 ftrace_replace_code()
Message-ID: <20190627092902.253971d2@gandalf.local.home>
In-Reply-To: <abc56ad177f370ec423edcfc538d35b418c1808e.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
 <abc56ad177f370ec423edcfc538d35b418c1808e.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
 Masami Hiramatsu <mhiramat@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 27 Jun 2019 16:53:50 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> In commit a0572f687fb3c ("ftrace: Allow ftrace_replace_code() to be
> schedulable), the generic ftrace_replace_code() function was modified to
> accept a flags argument in place of a single 'enable' flag. However, the
> x86 version of this function was not updated. Fix the same.
> 
> Fixes: a0572f687fb3c ("ftrace: Allow ftrace_replace_code() to be schedulable")

I don't mind this change, but it's not a bug, and I'm not sure it
should have the fixes tag. The reason being, the
FTRACE_MODIFY_ENABLE_FL is only set when ftrace is called by with the
command flag FTRACE_MAY_SLEEP, which is never done on x86.

That said, I'm fine with the change as it makes it more robust, but by
adding the fixes tag, you're going to get this into all the stable
code, and I'm not sure that's really necessary.

-- Steve


> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/x86/kernel/ftrace.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index 0927bb158ffc..f34005a17051 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -573,8 +573,9 @@ static void run_sync(void)
>  		local_irq_disable();
>  }
>  
> -void ftrace_replace_code(int enable)
> +void ftrace_replace_code(int mod_flags)
>  {
> +	int enable = mod_flags & FTRACE_MODIFY_ENABLE_FL;
>  	struct ftrace_rec_iter *iter;
>  	struct dyn_ftrace *rec;
>  	const char *report = "adding breakpoints";

