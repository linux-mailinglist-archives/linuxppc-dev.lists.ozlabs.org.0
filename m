Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF8D595E3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 16:23:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6YKL1wymz3cdm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 00:23:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=mgjk=yu=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6YJt5m3Fz3bXy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 00:22:54 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1F2961019;
	Tue, 16 Aug 2022 14:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BA2C433C1;
	Tue, 16 Aug 2022 14:22:50 +0000 (UTC)
Date: Tue, 16 Aug 2022 10:22:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/ftrace: Ignore weak functions
Message-ID: <20220816102258.34d09229@gandalf.local.home>
In-Reply-To: <20220809105425.424045-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20220809105425.424045-1-naveen.n.rao@linux.vnet.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue,  9 Aug 2022 16:24:25 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> Extend commit b39181f7c6907d ("ftrace: Add FTRACE_MCOUNT_MAX_OFFSET to
> avoid adding weak function") to ppc32 and ppc64 -mprofile-kernel by
> defining FTRACE_MCOUNT_MAX_OFFSET.
> 
> For ppc64 -mprofile-kernel ABI, we can have two instructions at function
> entry for TOC setup followed by 'mflr r0' and 'bl _mcount'. So, the
> mcount location is at most the 4th instruction in a function. For ppc32,
> mcount location is always the 3rd instruction in a function, preceded by
> 'mflr r0' and 'stw r0,4(r1)'.
> 
> With this patch, and with ppc64le_guest_defconfig and some ftrace/bpf
> config items enabled:
>   # grep __ftrace_invalid_address available_filter_functions | wc -l
>   79

I wonder if this patch answers the question to my last email. ;-)

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/ftrace.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index 3cee7115441b41..ade406dc6504e3 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -10,6 +10,13 @@
>  
>  #define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
>  
> +/* Ignore unused weak functions which will have larger offsets */
> +#ifdef CONFIG_MPROFILE_KERNEL
> +#define FTRACE_MCOUNT_MAX_OFFSET	12
> +#elif defined(CONFIG_PPC32)
> +#define FTRACE_MCOUNT_MAX_OFFSET	8
> +#endif
> +
>  #ifndef __ASSEMBLY__
>  extern void _mcount(void);
>  
> 
> base-commit: ff1ed171e05c971652a0ede3d716997de8ee41c9

