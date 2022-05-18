Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B4452C4A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 22:47:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Q6Q56mGz3cBM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 06:47:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=H9e/AGfg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=H9e/AGfg; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3Q5p6sBvz2xt3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 06:47:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA85461A2A;
 Wed, 18 May 2022 20:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270FDC385A9;
 Wed, 18 May 2022 20:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1652906826;
 bh=/rxYrjMqwNlL+24I8XRuVFiiERaiBmaRHgjd3WqHu8M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H9e/AGfg9nDIZpmXwiwrXfey5wMS26IhfiwndlzuAflZx/V2poGYdYQMw6qMLGwMe
 tmL+pdqdr2nIUad1zE/pXjF2HENquMEFkTlPHZ+DkF9ir5T5uUZjvq0SmwsZHxauHU
 N5wtP3IFn/vFyQE2TWylQ1ADXUxyu5cq+zQ+p52I=
Date: Wed, 18 May 2022 13:47:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
Message-Id: <20220518134705.7ae186d5419b24d689a38ccc@linux-foundation.org>
In-Reply-To: <20220518181828.645877-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20220518181828.645877-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Eric Biederman <ebiederm@xmission.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 18 May 2022 23:48:28 +0530 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
> symbols") [1], binutils (v2.36+) started dropping section symbols that
> it thought were unused.  This isn't an issue in general, but with
> kexec_file.c, gcc is placing kexec_arch_apply_relocations[_add] into a
> separate .text.unlikely section and the section symbol ".text.unlikely"
> is being dropped. Due to this, recordmcount is unable to find a non-weak
> symbol in .text.unlikely to generate a relocation record against.
> 
> Address this by dropping the weak attribute from these functions:
> - arch_kexec_apply_relocations() is not overridden by any architecture
>   today, so just drop the weak attribute.
> - arch_kexec_apply_relocations_add() is only overridden by x86 and s390.
>   Retain the function prototype for those and move the weak
>   implementation into the header as a static inline for other
>   architectures.
> 
> ...
>

Sigh.  This patch demonstrates why I like __weak :<

> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -229,6 +225,30 @@ extern int crash_exclude_mem_range(struct crash_mem *mem,
>  				   unsigned long long mend);
>  extern int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
>  				       void **addr, unsigned long *sz);
> +
> +#if defined(CONFIG_X86_64) || defined(CONFIG_S390)

Let's avoid listing the architectures here?  Better to add

	select ARCH_HAVE_ARCH_KEXEC_APPLY_RELOCATIONS_ADD

to arch/<arch>/Kconfig?

Please cc me on any additional work on this.
