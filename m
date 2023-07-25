Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C561762019
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 19:28:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EXnFZ73G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9PBf14gYz3c3y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 03:28:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EXnFZ73G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9P9k70Mgz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 03:27:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 19082617DC;
	Tue, 25 Jul 2023 17:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B55C433C8;
	Tue, 25 Jul 2023 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690306054;
	bh=CcM1IgStycED3EC2PKiW7/oey5fK8XVGM11fqAHnwvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXnFZ73GREwzmyNVPlOFvkbZgDlHBbesKIUKiXMcyp55Md7qsCMXEmF/hlur29jWS
	 CDkFah8B31D/Rks/YVgvJ/bYhvbGy2A87YIxg6JTSBRFlr9IUSp/6WlQ9F3E21nWNq
	 gB7XseMaLUGC9VB5SaqZS+ORGkAcRHDavz7cPI1M=
Date: Tue, 25 Jul 2023 19:27:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: devices.txt: reconcile serial/ucc_uart
 minor numers
Message-ID: <2023072544-cloning-footsie-65e0@gregkh>
References: <20230724063341.28198-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724063341.28198-1-rdunlap@infradead.org>
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
Cc: Timur Tabi <timur@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 23, 2023 at 11:33:41PM -0700, Randy Dunlap wrote:
> Reconcile devices.txt with serial/ucc_uart.c regarding device number
> assignments. ucc_uart.c supports 4 ports and uses minor devnums
> 46-49, so update devices.txt with that info.
> Then update ucc_uart.c's reference to the location of the devices.txt
> list in the kernel source tree.
> 
> Fixes: d7584ed2b994 ("[POWERPC] qe-uart: add support for Freescale QUICCEngine UART")
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Timur Tabi <timur@kernel.org>
> Cc: Kumar Gala <galak@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: linux-serial@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/admin-guide/devices.txt |    2 +-
>  drivers/tty/serial/ucc_uart.c         |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Very nice, thanks for catching this, I'll go queue it up.

Actually, how did you notice this?  I don't think the devices.txt file
is up to date at all anymore, and odds are, other things are wrong in it
too.

thanks,

greg k-h
