Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D097B584A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 16:39:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZMwQ0BBMzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 00:39:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZMsj3nYNzDqC8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 00:36:41 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66EC520828;
 Thu, 27 Jun 2019 14:36:38 +0000 (UTC)
Date: Thu, 27 Jun 2019 10:36:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/7] ftrace: Expose __ftrace_replace_code()
Message-ID: <20190627103636.21122b0d@gandalf.local.home>
In-Reply-To: <0d09c94f19332b13707109f41cd15b6e0c45d120.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
 <0d09c94f19332b13707109f41cd15b6e0c45d120.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
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

On Thu, 27 Jun 2019 16:53:51 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> While over-riding ftrace_replace_code(), we still want to reuse the
> existing __ftrace_replace_code() function. Rename the function and
> make it available for other kernel code.
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  include/linux/ftrace.h | 1 +
>  kernel/trace/ftrace.c  | 8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index e97789c95c4e..fa653a561da5 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -456,6 +456,7 @@ ftrace_set_early_filter(struct ftrace_ops *ops, char *buf, int enable);
>  /* defined in arch */
>  extern int ftrace_ip_converted(unsigned long ip);
>  extern int ftrace_dyn_arch_init(void);
> +extern int ftrace_replace_code_rec(struct dyn_ftrace *rec, int enable);
>  extern void ftrace_replace_code(int enable);
>  extern int ftrace_update_ftrace_func(ftrace_func_t func);
>  extern void ftrace_caller(void);
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 5710a6b3edc1..21d8e201ee80 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -2351,8 +2351,8 @@ unsigned long ftrace_get_addr_curr(struct dyn_ftrace *rec)
>  		return (unsigned long)FTRACE_ADDR;
>  }
>  
> -static int
> -__ftrace_replace_code(struct dyn_ftrace *rec, int enable)
> +int
> +ftrace_replace_code_rec(struct dyn_ftrace *rec, int enable)

Make this a single line, as it removes static and "__" which should
keep it normal.

Other than that,

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve


>  {
>  	unsigned long ftrace_old_addr;
>  	unsigned long ftrace_addr;
> @@ -2403,7 +2403,7 @@ void __weak ftrace_replace_code(int mod_flags)
>  		if (rec->flags & FTRACE_FL_DISABLED)
>  			continue;
>  
> -		failed = __ftrace_replace_code(rec, enable);
> +		failed = ftrace_replace_code_rec(rec, enable);
>  		if (failed) {
>  			ftrace_bug(failed, rec);
>  			/* Stop processing */
> @@ -5827,7 +5827,7 @@ void ftrace_module_enable(struct module *mod)
>  		rec->flags = cnt;
>  
>  		if (ftrace_start_up && cnt) {
> -			int failed = __ftrace_replace_code(rec, 1);
> +			int failed = ftrace_replace_code_rec(rec, 1);
>  			if (failed) {
>  				ftrace_bug(failed, rec);
>  				goto out_loop;

