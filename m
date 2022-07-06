Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92953568A3D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 15:56:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdLgb3ct3z3c62
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 23:56:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=QO+KNfi7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=igxa=xl=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=QO+KNfi7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdLfy2smZz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 23:56:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C71661E24;
	Wed,  6 Jul 2022 13:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30861C341C6;
	Wed,  6 Jul 2022 13:56:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QO+KNfi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1657115762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iz7TiYsQg28wABHZ/Sl8o/JBmFyo1X4h6JHxFO/2QFU=;
	b=QO+KNfi7bosC2YJDjjg+3/p1YBt79iQ4yagiPDOsXPXuswqtg6CW7QzzzzLHe5bYAJajqz
	lJ1uYpw141WbDpvaa9p1cFXyX5AAi5jWxlLdhhC1cA7kV3FkaOwez6I8Mf7z7lgI0KslPb
	HD4WDjK1rPD6V6STN+1QfEhFQxvzuOo=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c2f90772 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Wed, 6 Jul 2022 13:56:01 +0000 (UTC)
Date: Wed, 6 Jul 2022 15:55:55 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3] random: remove CONFIG_ARCH_RANDOM
Message-ID: <YsWUa7JWsYDYDFBL@zx2c4.com>
References: <20220706003225.335768-1-Jason@zx2c4.com>
 <20220706105411.406259-1-Jason@zx2c4.com>
 <YsWBhaZT5dCQHfwp@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsWBhaZT5dCQHfwp@zn.tnic>
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
Cc: linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Borislav,

On Wed, Jul 06, 2022 at 02:35:17PM +0200, Borislav Petkov wrote:
> On Wed, Jul 06, 2022 at 12:54:11PM +0200, Jason A. Donenfeld wrote:
> > So this commit simplifies things by removing CONFIG_ARCH_RANDOM, keeping
> 
> No need to say "this commit" or "this patch" - just write "as if you are
> giving orders to the codebase to change its behaviour."
> 
> In this case, "So simplify things by ... "

Thanks for the tip. I used to do this, and then in the last 3 weeks my
style unwittingly slipped into this new thing for some reason. I've got
to send a v+1 anyway for some more build breakage, so I'll fix that up.

Jason
