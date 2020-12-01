Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B252C9550
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 03:38:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClR9K3B7lzDr0t
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 13:38:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClR6w1Hw1zDqkC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 13:36:07 +1100 (AEDT)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BBE6520809;
 Tue,  1 Dec 2020 02:36:04 +0000 (UTC)
Date: Mon, 30 Nov 2020 21:36:02 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 02/14] ftrace: Fix DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 dependency
Message-ID: <20201130213602.3647f2b8@oasis.local.home>
In-Reply-To: <fc4b257ea8689a36f086d2389a9ed989496ca63a.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
 <fc4b257ea8689a36f086d2389a9ed989496ca63a.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
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

On Thu, 26 Nov 2020 23:38:39 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> DYNAMIC_FTRACE_WITH_DIRECT_CALLS should depend on
> DYNAMIC_FTRACE_WITH_REGS since we need ftrace_regs_caller().
> 
> Fixes: 763e34e74bb7d5c ("ftrace: Add register_ftrace_direct()")
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

I'm pulling this in for stable as well.

-- Steve

> ---
>  kernel/trace/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index a4020c0b4508c9..e1bf5228fb692a 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -202,7 +202,7 @@ config DYNAMIC_FTRACE_WITH_REGS
>  
>  config DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	def_bool y
> -	depends on DYNAMIC_FTRACE
> +	depends on DYNAMIC_FTRACE_WITH_REGS
>  	depends on HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  
>  config FUNCTION_PROFILER

