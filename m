Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D86E1009FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 18:13:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GwWz45lRzDqdh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 04:13:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="MH3iZKyp"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GwTz6lLczDqcG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 04:11:33 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id i17so21052806qtq.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 09:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CLWuzn35UcCrxAH0vPUkNSjLox6KKcBRbOlrNyg/FIg=;
 b=MH3iZKypeEMn6eJb9Ix/Otz7onqgGHRJL9afadNFwPY0KDIvW4KrX0L3JQ6qwF8/jA
 N1oCKYAU8Dz9r6TX6rqm31mg4N1/Wvg+5Yw096OvLhzj/43uvpC2fNWILPUDBNvmTDgL
 nvGRd6miKKmeDVZ8u3Z+HMjVMlLyJ3Ahewvbx4kx98y+GVFAgG7iDjuryjAnL8mSGvYs
 a+olFnVuUuc4Gg94cTcPII9Sykl9gDE9dPTjmymuo9L+k+y6GyLEdzyO3AAVW6YUW1pp
 R9lhOhRE5PqL2bcKrAjPMq1plY0/64fqqdSzd6An8Ugn8H8l9r9XN/bXU4yJQ8SNnsnV
 dcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CLWuzn35UcCrxAH0vPUkNSjLox6KKcBRbOlrNyg/FIg=;
 b=GQXpNnshMEKuzCEorlTihla4PVz6QWXdTVaj+ZpOKQ+CM/oHeAzS5ICn/CSrAacaGz
 Rl7s0m3M9Q9yqe4WYrYfV7f0B71VyPWZTd2M1nlYOp8G6hehZ+G1B/kWNxZmYSuDjRZv
 bR98FPJgjkVUETrPuhsB/s+pOjzkvHm46c+LMJ4Zc97LoJh9kcvc8S0DURLxiIkLIU+y
 obKLUtMLBDwzlTtJtsECaAkEX6Kz71p+ymMd3dE+pVMprPgILq/27/APfN93vSVgZ8C/
 CG4xylBnf1AkoIM/NswvHVVpHOxP4o3ezs7dTlL/QSP8opLSxIMQBzPme7gWljjxIg9q
 mBDQ==
X-Gm-Message-State: APjAAAUwnEPepKtmLe/uqJX6UgyMR3DFPiDC2Rv4CX7shp3vKha56Vqx
 pjiAC0k9MkgnWnhYK4ZyActe2w==
X-Google-Smtp-Source: APXvYqzliPKDmikS4XgP3WlBwNZGz6arPLK8vRNTOmMUT5SgSVY0OZfuJoTZKIegW2snRbtqR/4JdA==
X-Received: by 2002:ac8:6f17:: with SMTP id g23mr9774921qtv.104.1574097090195; 
 Mon, 18 Nov 2019 09:11:30 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id t24sm11012562qtc.97.2019.11.18.09.11.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 09:11:29 -0800 (PST)
Message-ID: <1574097087.5937.141.camel@lca.pw>
Subject: Re: powerpc ftrace broken due to "manual merge of the ftrace tree
 with the arm64 tree"
From: Qian Cai <cai@lca.pw>
To: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 18 Nov 2019 12:11:27 -0500
In-Reply-To: <20191118101645.2f68c521@oasis.local.home>
References: <1573849732.5937.136.camel@lca.pw>
 <20191115160230.78871d8f@gandalf.local.home>
 <1573851994.5937.138.camel@lca.pw>
 <20191118095104.0daebbc3@oasis.local.home>
 <20191118095842.546b38d8@oasis.local.home>
 <20191118101645.2f68c521@oasis.local.home>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-11-18 at 10:16 -0500, Steven Rostedt wrote:
> On Mon, 18 Nov 2019 09:58:42 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Mon, 18 Nov 2019 09:51:04 -0500
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> > 
> > > > > Test this commit please: b83b43ffc6e4b514ca034a0fbdee01322e2f7022      
> > > > 
> > > > # git reset --hard b83b43ffc6e4b514ca034a0fbdee01322e2f7022
> > > > 
> > > > Yes, that one is bad.    
> > > 
> > > Can you see if this patch fixes the issue for you?  
> > 
> > Don't bother. This isn't the right fix, I know see the real issue.
> > 
> > New fix coming shortly.
> > 
> 
> Can you try this?

Yes, it works fine.

> 
> It appears that I picked a name "ftrace_graph_stub", that was already in
> use by powerpc. This just renames the function stub I used.
> 
> -- Steve
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 0f358be551cd..996db32c491b 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -112,7 +112,7 @@
>  #ifdef CONFIG_FTRACE_MCOUNT_RECORD
>  #ifdef CC_USING_PATCHABLE_FUNCTION_ENTRY
>  /*
> - * Need to also make ftrace_graph_stub point to ftrace_stub
> + * Need to also make ftrace_stub_graph point to ftrace_stub
>   * so that the same stub location may have different protocols
>   * and not mess up with C verifiers.
>   */
> @@ -120,17 +120,17 @@
>  			__start_mcount_loc = .;			\
>  			KEEP(*(__patchable_function_entries))	\
>  			__stop_mcount_loc = .;			\
> -			ftrace_graph_stub = ftrace_stub;
> +			ftrace_stub_graph = ftrace_stub;
>  #else
>  #define MCOUNT_REC()	. = ALIGN(8);				\
>  			__start_mcount_loc = .;			\
>  			KEEP(*(__mcount_loc))			\
>  			__stop_mcount_loc = .;			\
> -			ftrace_graph_stub = ftrace_stub;
> +			ftrace_stub_graph = ftrace_stub;
>  #endif
>  #else
>  # ifdef CONFIG_FUNCTION_TRACER
> -#  define MCOUNT_REC()	ftrace_graph_stub = ftrace_stub;
> +#  define MCOUNT_REC()	ftrace_stub_graph = ftrace_stub;
>  # else
>  #  define MCOUNT_REC()
>  # endif
> diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
> index fa3ce10d0405..67e0c462b059 100644
> --- a/kernel/trace/fgraph.c
> +++ b/kernel/trace/fgraph.c
> @@ -336,10 +336,10 @@ int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace)
>   * Simply points to ftrace_stub, but with the proper protocol.
>   * Defined by the linker script in linux/vmlinux.lds.h
>   */
> -extern void ftrace_graph_stub(struct ftrace_graph_ret *);
> +extern void ftrace_stub_graph(struct ftrace_graph_ret *);
>  
>  /* The callbacks that hook a function */
> -trace_func_graph_ret_t ftrace_graph_return = ftrace_graph_stub;
> +trace_func_graph_ret_t ftrace_graph_return = ftrace_stub_graph;
>  trace_func_graph_ent_t ftrace_graph_entry = ftrace_graph_entry_stub;
>  static trace_func_graph_ent_t __ftrace_graph_entry = ftrace_graph_entry_stub;
>  
> @@ -619,7 +619,7 @@ void unregister_ftrace_graph(struct fgraph_ops *gops)
>  		goto out;
>  
>  	ftrace_graph_active--;
> -	ftrace_graph_return = ftrace_graph_stub;
> +	ftrace_graph_return = ftrace_stub_graph;
>  	ftrace_graph_entry = ftrace_graph_entry_stub;
>  	__ftrace_graph_entry = ftrace_graph_entry_stub;
>  	ftrace_shutdown(&graph_ops, FTRACE_STOP_FUNC_RET);
