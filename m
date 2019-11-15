Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB330FE6DB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 22:08:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F9tr71WCzF6qD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 08:08:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="TK0eriJD"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F9rd2v2GzF43g
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 08:06:40 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id t8so12260408qtc.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 13:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PVeUd0Z9qID74jwTLN71/X5ho1REfkJ1WwqU2FF2PSI=;
 b=TK0eriJDcFnWuO9O157SGzkRAyr6VHRcA7oMDgqrEmpehZYvWbIXiYVuMtdHtdn1y6
 6y8xxDuJ/xzb/5fbtQAjwpXd7iMrXIZz15GFEQ91jHgA0G/cOlbPnNZz5er57yCILzyf
 O6GsrUgx8v9gK+PFWALE9lj+lKn6q4lXdJ8hpTeU+EgLwr7TnG0p9Nm1k0uOKUSFQc2f
 wQKhKin3tmKzlNqngYtpxcgxw1fHrZfNdHzFj4Xgm9bYFUUrxYV2FDSxTT4NlXTJ25WG
 r+PzjOkX0Az2Pgtllj8bPpOC4gxl6f6lFtyPc/a3wuqoTQZnpVCJ6Ck//OxjJBe+TXry
 O9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PVeUd0Z9qID74jwTLN71/X5ho1REfkJ1WwqU2FF2PSI=;
 b=OxD9pKlK32tty/HNIMXmIYeRhimbAKagFtYW+636W2wg0qRmdehtjOxMV41OrI33l6
 /ZNkbrdtbqAVfhyXmfy4DZL2wviYr3l9zfD77Jl3OJ2LB5WbQM12DYqh8479/PLEstJZ
 svOwtb4zMwubB7eaLY4UcLlWstyxCr3DmarC9nIgP5ebDXPZzZSR7VXB8RPrdXLNnIQQ
 vpn6QhVNrd+kB515MD//FaWOIDC2w/CZast4/qqovtncXvVbif4H0E+TKZUMMc9aL7Ws
 QKQvW9KG8rXtFCzXRlNY9I0S04GcPArwJKggLJ1IKHMMtDVMZOzCnGlmTfP9cQMv0tOE
 vbaQ==
X-Gm-Message-State: APjAAAUE4wCeXwbB9LxoI1NhSCkhDSaUmPilz95Mm5mlHy3/EsYbLp6I
 hXyxe4Hk2FKJyqpUPuJS99gPn/PdkCo=
X-Google-Smtp-Source: APXvYqw4SOGDOoWQJs12lnlimfm/ZUDq9OCmmNY6RKMEEYMcSf2xS9P8MXAO3XVBW7XJs3aVHB+K1Q==
X-Received: by 2002:ac8:3142:: with SMTP id h2mr16647308qtb.182.1573851996738; 
 Fri, 15 Nov 2019 13:06:36 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id m65sm5397635qte.54.2019.11.15.13.06.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Nov 2019 13:06:35 -0800 (PST)
Message-ID: <1573851994.5937.138.camel@lca.pw>
Subject: Re: powerpc ftrace broken due to "manual merge of the ftrace tree
 with the arm64 tree"
From: Qian Cai <cai@lca.pw>
To: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 15 Nov 2019 16:06:34 -0500
In-Reply-To: <20191115160230.78871d8f@gandalf.local.home>
References: <1573849732.5937.136.camel@lca.pw>
 <20191115160230.78871d8f@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 2019-11-15 at 16:02 -0500, Steven Rostedt wrote:
> On Fri, 15 Nov 2019 15:28:52 -0500
> Qian Cai <cai@lca.pw> wrote:
> 
> > # echo function >/sys/kernel/debug/tracing/current_tracer
> > 
> > It hangs forever with today's linux-next on powerpc. Reverted the conflict fix
> > [1] as below fixes the issue.
> > 
> > [1] https://lore.kernel.org/linux-next/20191115135357.10386fac@canb.auug.org.au/
> 
> What's your config file.

https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config

> 
> And can you test the two conflicting commits to see which one caused
> your error?
> 
> Test this commit please: b83b43ffc6e4b514ca034a0fbdee01322e2f7022

# git reset --hard b83b43ffc6e4b514ca034a0fbdee01322e2f7022

Yes, that one is bad.

> 
> And see if the issue is with that one, and not with the one without it.
> 
> -- Steve
> 
> 
> > 
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-
> > generic/vmlinux.lds.h
> > index 7d0d03a03d4d..a92222f79b53 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -136,29 +136,20 @@
> >  #endif
> >  
> >  #ifdef CONFIG_FTRACE_MCOUNT_RECORD
> > -/*
> > - * The ftrace call sites are logged to a section whose name depends on the
> > - * compiler option used. A given kernel image will only use one, AKA
> > - * FTRACE_CALLSITE_SECTION. We capture all of them here to avoid header
> > - * dependencies for FTRACE_CALLSITE_SECTION's definition.
> > - */
> > -/*
> > - * Need to also make ftrace_graph_stub point to ftrace_stub
> > - * so that the same stub location may have different protocols
> > - * and not mess up with C verifiers.
> > - */
> > -#define MCOUNT_REC()	. = ALIGN(8);				\
> > +#ifdef CC_USING_PATCHABLE_FUNCTION_ENTRY
> > +#define MCOUNT_REC()	. = ALIGN(8)				\
> >  			__start_mcount_loc = .;			\
> > -			KEEP(*(__mcount_loc))			\
> >  			KEEP(*(__patchable_function_entries))	\
> >  			__stop_mcount_loc = .;			\
> >  			ftrace_graph_stub = ftrace_stub;
> >  #else
> > -# ifdef CONFIG_FUNCTION_TRACER
> > -#  define MCOUNT_REC()	ftrace_graph_stub = ftrace_stub;
> > -# else
> > -#  define MCOUNT_REC()
> > -# endif
> > +#define MCOUNT_REC()	. = ALIGN(8);				\
> > +			__start_mcount_loc = .;			\
> > +			KEEP(*(__mcount_loc))			\
> > +			__stop_mcount_loc = .;
> > +#endif
> > +#else
> > +#define MCOUNT_REC()
> >  #endif
> >  
> >  #ifdef CONFIG_TRACE_BRANCH_PROFILING
> 
> 
