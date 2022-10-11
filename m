Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 483A95FBC19
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 22:34:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mn6vn6tYvz3dry
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 07:34:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HTRD6zMn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HTRD6zMn;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mn6tr2BYxz306m
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 07:33:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4BC8861168;
	Tue, 11 Oct 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8D3C433C1;
	Tue, 11 Oct 2022 20:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665520414;
	bh=u/ngx5nkN4Heguu0mTv5ntQdOfvx9DRizvMHIBMZFBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTRD6zMn+QYXURS0Xv4rcmQ9+ca9gGY/ivP4U4j+PLGelg2oB6pXpRpdASuFUUs1N
	 IEdCoKkJyNNKldLLfiV8wN2XZTJLm7QlBASADnaibAtfNPOU1SNDa7+tEQiWTNwWMB
	 ejLR375TzQlXuvEAE0W+SbQ3kZU4hmXGoiMbiYqHNIWTlT1IkQ939fZp8gIubhMJJr
	 lwalcI/94AJXKlgH+e1vCau578ipHzFF1oblY1uZga+Pz6/Q9s+Brm5+30Rwrbgdd2
	 nrRwTH45iigXeo6U/+uRQQN1H9lNxvM5gPg+SqV9ZXWyZTwdcBAATBRZz+yi18r71m
	 C/yl6zIK44Ycg==
Date: Tue, 11 Oct 2022 13:33:32 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 11/16] objtool: Add --mnop as an option to --mcount
Message-ID: <20221011203332.zzmv6awd5eiydxgw@treble>
References: <20221002104240.1316480-1-sv@linux.ibm.com>
 <20221002104240.1316480-12-sv@linux.ibm.com>
 <1665401725.d3dolquorh.naveen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1665401725.d3dolquorh.naveen@linux.ibm.com>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, Sathvika Vasireddy <sv@linux.ibm.com>, jpoimboe@redhat.com, rostedt@goodmis.org, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 10, 2022 at 05:07:46PM +0530, Naveen N. Rao wrote:
> > +++ b/scripts/Makefile.lib
> > @@ -234,6 +234,7 @@ objtool_args =								\
> >  	$(if $(CONFIG_HAVE_NOINSTR_HACK), --hacks=noinstr)		\
> >  	$(if $(CONFIG_X86_KERNEL_IBT), --ibt)				\
> >  	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)		\
> > +	$(if $(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT), --mnop)                 \
> 
> This still won't help: for instance, if CONFIG_FTRACE itself is disabled. I
> think we should make this depend on CONFIG_FTRACE_MCOUNT_USE_OBJTOOL. The
> below change works for me:
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 54d2d6451bdacc..fd3f55a1fdb7bb 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -245,8 +245,8 @@ objtool_args =                                                              \
>        $(if $(CONFIG_HAVE_JUMP_LABEL_HACK), --hacks=jump_label)        \
>        $(if $(CONFIG_HAVE_NOINSTR_HACK), --hacks=noinstr)              \
>        $(if $(CONFIG_X86_KERNEL_IBT), --ibt)                           \
> -       $(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)             \
> -       $(if $(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT), --mnop)                 \
> +        $(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL),                       \
> +             $(if $(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT), --mcount --mnop, --mcount)) \
>        $(if $(CONFIG_UNWINDER_ORC), --orc)                             \
>        $(if $(CONFIG_RETPOLINE), --retpoline)                          \
>        $(if $(CONFIG_RETHUNK), --rethunk)                              \

This has a new conflict, may need something like:

--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -256,6 +256,9 @@ objtool-args-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+= --hacks=jump_label
 objtool-args-$(CONFIG_HAVE_NOINSTR_HACK)		+= --hacks=noinstr
 objtool-args-$(CONFIG_X86_KERNEL_IBT)			+= --ibt
 objtool-args-$(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL)	+= --mcount
+ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
+objtool-args-$(CONFIG_HAVE_OBJTOOL_NOP_MCOUNT)		+= --mnop
+endif
 objtool-args-$(CONFIG_UNWINDER_ORC)			+= --orc
 objtool-args-$(CONFIG_RETPOLINE)			+= --retpoline
 objtool-args-$(CONFIG_RETHUNK)				+= --rethunk
