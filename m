Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 832E585473F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 11:38:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yAdiU5Zg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZZR43B0Pz3dXG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 21:38:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yAdiU5Zg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZZQM31Q5z3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 21:37:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 54D21618C9;
	Wed, 14 Feb 2024 10:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C309C433F1;
	Wed, 14 Feb 2024 10:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707907047;
	bh=cxED5YPWgHhSBwJHo1owowGzFn88/peBM/syHypcwGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yAdiU5ZgI53hqY9FwXIbYtEU1neJBgYWFVbQJYJQwKXuydESuXEAkxtgQ1Doj7u+i
	 cWtV6GEl8rnlmooZ4HfX5YgYMbwAoMxyqATdC1vH4siqe7TubRvZGjMd0jFL5pEv2P
	 BM0MlKnjrrgvHqS9R/ysZy5aq4ai9YmWWeaP6ePU=
Date: Wed, 14 Feb 2024 11:37:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH] tty: hvc-iucv: fix function pointer casts
Message-ID: <2024021426-unleveled-unhearing-8021@gregkh>
References: <20240213101756.461701-1-arnd@kernel.org>
 <20240213191254.GA19790@gate.crashing.org>
 <57d72e2ccc8245fe99982613a11c461c@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57d72e2ccc8245fe99982613a11c461c@AcuMS.aculab.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jiri Slaby <jirislaby@kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Justin Stitt <justinstitt@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 14, 2024 at 09:46:33AM +0000, David Laight wrote:
> From: Segher Boessenkool
> > Sent: 13 February 2024 19:13
> > 
> > On Tue, Feb 13, 2024 at 11:17:49AM +0100, Arnd Bergmann wrote:
> > > clang warns about explicitly casting between incompatible function
> > > pointers:
> > >
> > > drivers/tty/hvc/hvc_iucv.c:1100:23: error: cast from 'void (*)(const void *)' to 'void (*)(struct
> > device *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
> > >  1100 |         priv->dev->release = (void (*)(struct device *)) kfree;
> > >       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Such a cast of course is explicitly allowed by 6.3.2.3/8, only calling a
> > function using a non-compatible type is UB.  This warning message is
> > quite misleading.  Doubly so because of the -Werror, as always.
> 
> But it will get called using the wrong type.
> And (is it) fine-ibt will reject the incorrect call.

And rightfully so, this type of casting abuse is just that, abuse.

Almost no one should be just calling kfree() on a device pointer, I'll
look at the surrounding code as odds are something odd is going on.  But
for now, this patch is correct.

thanks,

greg k-h
