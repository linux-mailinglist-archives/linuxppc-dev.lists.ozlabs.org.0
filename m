Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 643472C9552
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 03:40:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClRCP1TNbzDqnn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 13:40:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=qnpz=ff=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClR7R3yzYzDqtY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 13:36:35 +1100 (AEDT)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A87120857;
 Tue,  1 Dec 2020 02:36:32 +0000 (UTC)
Date: Mon, 30 Nov 2020 21:36:29 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 03/14] ftrace: Fix cleanup in error path of
 register_ftrace_direct()
Message-ID: <20201130213629.185216e8@oasis.local.home>
In-Reply-To: <5a10d77b845633fbd13f1c3c71e7f9777bbbe601.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
 <5a10d77b845633fbd13f1c3c71e7f9777bbbe601.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Nov 2020 23:38:40 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> We need to remove hash entry if register_ftrace_function() fails.
> Consolidate the cleanup to be done after register_ftrace_function() at
> the end.

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  kernel/trace/ftrace.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 9c1bba8cc51b03..3844a4a1346a9c 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -5136,8 +5136,6 @@ int register_ftrace_direct(unsigned long ip, unsigned long addr)
>  	__add_hash_entry(direct_functions, entry);
>  
>  	ret = ftrace_set_filter_ip(&direct_ops, ip, 0, 0);
> -	if (ret)
> -		remove_hash_entry(direct_functions, entry);
>  
>  	if (!ret && !(direct_ops.flags & FTRACE_OPS_FL_ENABLED)) {
>  		ret = register_ftrace_function(&direct_ops);
> @@ -5146,6 +5144,7 @@ int register_ftrace_direct(unsigned long ip, unsigned long addr)
>  	}
>  
>  	if (ret) {
> +		remove_hash_entry(direct_functions, entry);
>  		kfree(entry);
>  		if (!direct->count) {
>  			list_del_rcu(&direct->next);

