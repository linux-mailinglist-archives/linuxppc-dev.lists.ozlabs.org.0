Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D6B1BB194
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 00:42:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B0CX5tgnzDqjn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 08:42:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=M1Bzf7im; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B09h0yBzzDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 08:40:54 +1000 (AEST)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D8742075E;
 Mon, 27 Apr 2020 22:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588027251;
 bh=CC6rMEFyGSKGcmYNdgrkgIArdM9m2XSVKnBpMMN2Afc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M1Bzf7imQ9+pFeCE+KA+cbdSB5d1Q5QGQB9MnKaltdtd5VWtUvFW7fQAnmE0URwl5
 3BA6ohXMoMglNl9UZcTo0fBye8BSMjujqHnJjVYOuU0KjCzBVzKwaD+JYsXxpLWgrr
 AEvVdCbCW82EWkeE0LLaMEaXsLBh2Bd66+0Ooopg=
Date: Mon, 27 Apr 2020 15:40:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/7] signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
Message-Id: <20200427154050.e431ad7fb228610cc6b95973@linux-foundation.org>
In-Reply-To: <20200426074039.GA31501@lst.de>
References: <20200421154204.252921-1-hch@lst.de>
 <20200421154204.252921-3-hch@lst.de>
 <20200425214724.a9a00c76edceff7296df7874@linux-foundation.org>
 <20200426074039.GA31501@lst.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jeremy Kerr <jk@ozlabs.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 "Eric W . Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 26 Apr 2020 09:40:39 +0200 Christoph Hellwig <hch@lst.de> wrote:

> On Sat, Apr 25, 2020 at 09:47:24PM -0700, Andrew Morton wrote:
> > I looked at fixing it but surely this sort of thing:
> > 
> > 
> > int copy_siginfo_to_user32(struct compat_siginfo __user *to,
> > 			   const struct kernel_siginfo *from)
> > #if defined(CONFIG_X86_X32_ABI) || defined(CONFIG_IA32_EMULATION)
> > {
> > 	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
> > }
> > int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
> > 			     const struct kernel_siginfo *from, bool x32_ABI)
> > #endif
> > {
> > 	...
> > 
> > 
> > is too ugly to live?
> 
> I fixed it up in my earlier versions, but Eric insisted to keep it,
> which is why I switched to his version given that he is the defacto
> signal.c maintainer.
> 
> Here is what I would have preferred:
> 
> https://www.spinics.net/lists/kernel/msg3473847.html
> https://www.spinics.net/lists/kernel/msg3473840.html
> https://www.spinics.net/lists/kernel/msg3473843.html

OK, but that doesn't necessitate the above monstrosity?  How about

static int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
			     const struct kernel_siginfo *from, bool x32_ABI)
{
	struct compat_siginfo new;
	copy_siginfo_to_external32(&new, from);
	...
}

int copy_siginfo_to_user32(struct compat_siginfo __user *to,
			   const struct kernel_siginfo *from)
{
#if defined(CONFIG_X86_X32_ABI) || defined(CONFIG_IA32_EMULATION)
	return __copy_siginfo_to_user32(to, from, in_x32_syscall());
#else
	return __copy_siginfo_to_user32(to, from, 0);
#endif
}

Or something like that - I didn't try very hard.  We know how to do
this stuff, and surely this thing isn't how!
