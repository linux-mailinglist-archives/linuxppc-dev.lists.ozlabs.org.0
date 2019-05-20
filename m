Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E4623094
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 11:41:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456v7424TPzDqBN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 19:41:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="kRUu+TQs"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456v5Q5Nd0zDqHb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 19:40:25 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5FA3920675;
 Mon, 20 May 2019 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558345222;
 bh=KlsviQfKrQui86twPZxBf/IfvPh7qAn/XGim2VH7goY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kRUu+TQsj8X8DYHPnUWAnW9UfPuTekrHZCS+FwPGmiXfiNR6UEgfjm6nJ7tM1/Wte
 ogYjtWT1+MLAYyC4w6gZW+gKMVQinsQhzVwvbjg3FdQlFNxTPFaEMZW+UQHc6bAPCH
 qM6nm1h++frHWcQYWEFSQPe7HpSMxEwAYA+wLzmo=
Date: Mon, 20 May 2019 11:40:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] kbuild: do not check name uniqueness of builtin modules
Message-ID: <20190520094020.GC15326@kroah.com>
References: <20190520025437.13825-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520025437.13825-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Michael Schmitz <schmitzmic@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Rusty Russell <rusty@rustcorp.com.au>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Lucas De Marchi <lucas.de.marchi@gmail.com>, Jessica Yu <jeyu@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2019 at 11:54:37AM +0900, Masahiro Yamada wrote:
> I just thought it was a good idea to scan builtin.modules in the name
> uniqueness checking, but Stephen reported a false positive.
> 
> ppc64_defconfig produces:
> 
>   warning: same basename if the following are built as modules:
>     arch/powerpc/platforms/powermac/nvram.ko
>     drivers/char/nvram.ko
> 
> ..., which is a false positive because the former is never built as
> a module as you see in arch/powerpc/platforms/powermac/Makefile:
> 
>   # CONFIG_NVRAM is an arch. independent tristate symbol, for pmac32 we really
>   # need this to be a bool.  Cheat here and pretend CONFIG_NVRAM=m is really
>   # CONFIG_NVRAM=y
>   obj-$(CONFIG_NVRAM:m=y)         += nvram.o
> 
> Since we cannot predict how tricky Makefiles are written in wild,
> builtin.modules may potentially contain false positives. I do not
> think it is a big deal as far as kmod is concerned, but false positive
> warnings in the kernel build makes people upset. It is better to not
> do it.
> 
> Even without checking builtin.modules, we have enough (and more solid)
> test coverage with allmodconfig.
> 
> While I touched this part, I replaced the sed code with neater one
> provided by Stephen.
> 
> Link: https://lkml.org/lkml/2019/5/19/120
> Link: https://lkml.org/lkml/2019/5/19/123
> Fixes: 3a48a91901c5 ("kbuild: check uniqueness of module names")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
