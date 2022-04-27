Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845E511878
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 15:47:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpKnH05D9z3brL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 23:47:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org;
 envelope-from=srs0=av7o=vf=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpKmq0X2cz2xlF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 23:47:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5EB3BB82766;
 Wed, 27 Apr 2022 13:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714F6C385A9;
 Wed, 27 Apr 2022 13:47:00 +0000 (UTC)
Date: Wed, 27 Apr 2022 09:46:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] ftrace: Drop duplicate mcount locations
Message-ID: <20220427094658.502fcaee@gandalf.local.home>
In-Reply-To: <9b1b816cff1f479c8de0e9baa5a6ac680b84e17e.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <9b1b816cff1f479c8de0e9baa5a6ac680b84e17e.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Apr 2022 15:01:21 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> In the absence of section symbols [1], objtool (today) and recordmcount
> (with a subsequent patch) generate __mcount_loc relocation records with
> weak symbols as the base. This works fine as long as those weak symbols
> are not overridden, but if they are, these can result in duplicate
> entries in the final vmlinux mcount location table. This will cause
> ftrace to fail when trying to patch the same location twice. Fix this by
> dropping duplicate locations during ftrace init.
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  kernel/trace/ftrace.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 4f1d2f5e726341..8bc4f282bb3ff4 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6496,7 +6496,7 @@ static int ftrace_process_locs(struct module *mod,
>  	struct dyn_ftrace *rec;
>  	unsigned long count;
>  	unsigned long *p;
> -	unsigned long addr;
> +	unsigned long addr, prev_addr = 0;
>  	unsigned long flags = 0; /* Shut up gcc */
>  	int ret = -ENOMEM;
>  
> @@ -6550,6 +6550,16 @@ static int ftrace_process_locs(struct module *mod,
>  	while (p < end) {
>  		unsigned long end_offset;
>  		addr = ftrace_call_adjust(*p++);
> +
> +		/*
> +		 * Drop duplicate entries, which can happen when weak
> +		 * functions are overridden, and __mcount_loc relocation
> +		 * records were generated against function names due to
> +		 * absence of non-weak section symbols
> +		 */
> +		if (addr == prev_addr)
> +			addr = 0;

Please don't use the side effect of addr == 0 causing the loop to continue
for this logic. The two are not related. Simply call continue.

		if (addr == prev_addr)
			continue;


-- Steve


> +
>  		/*
>  		 * Some architecture linkers will pad between
>  		 * the different mcount_loc sections of different
> @@ -6569,6 +6579,7 @@ static int ftrace_process_locs(struct module *mod,
>  
>  		rec = &pg->records[pg->index++];
>  		rec->ip = addr;
> +		prev_addr = addr;
>  	}
>  
>  	/* We should have used all pages */

