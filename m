Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B2F236BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 15:11:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456zmd1gp1zDqCw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 23:11:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=cz5i=tu=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456zk05Xv2zDqCp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 23:08:56 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99DCC20815;
 Mon, 20 May 2019 13:08:53 +0000 (UTC)
Date: Mon, 20 May 2019 09:08:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 1/4] ftrace: Expose flags used for
 ftrace_replace_code()
Message-ID: <20190520090852.66f6f629@gandalf.local.home>
In-Reply-To: <f2aa621d26056aa9fc8a6b82e3ceeaf44201d86d.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
 <f2aa621d26056aa9fc8a6b82e3ceeaf44201d86d.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 18 May 2019 00:32:45 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> Since ftrace_replace_code() is a __weak function and can be overridden,
> we need to expose the flags that can be set. So, move the flags enum to
> the header file.
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

> ---
>  include/linux/ftrace.h | 5 +++++
>  kernel/trace/ftrace.c  | 5 -----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 20899919ead8..835e761f63b0 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -162,6 +162,11 @@ enum {
>  	FTRACE_OPS_FL_TRACE_ARRAY		= 1 << 15,
>  };
>  
> +enum {
> +	FTRACE_MODIFY_ENABLE_FL		= (1 << 0),
> +	FTRACE_MODIFY_MAY_SLEEP_FL	= (1 << 1),
> +};
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE
>  /* The hash used to know what functions callbacks trace */
>  struct ftrace_ops_hash {
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index b920358dd8f7..38c15cd27fc4 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -78,11 +78,6 @@
>  #define ASSIGN_OPS_HASH(opsname, val)
>  #endif
>  
> -enum {
> -	FTRACE_MODIFY_ENABLE_FL		= (1 << 0),
> -	FTRACE_MODIFY_MAY_SLEEP_FL	= (1 << 1),
> -};
> -
>  struct ftrace_ops ftrace_list_end __read_mostly = {
>  	.func		= ftrace_stub,
>  	.flags		= FTRACE_OPS_FL_RECURSION_SAFE | FTRACE_OPS_FL_STUB,

