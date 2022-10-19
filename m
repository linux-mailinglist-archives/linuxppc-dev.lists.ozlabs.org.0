Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DF8604CA0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 18:02:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MswV42wZYz3cfQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 03:02:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DOW/0BNJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DOW/0BNJ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MswT76VHRz2yYj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 03:01:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C62EEB824F4;
	Wed, 19 Oct 2022 16:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F17C433C1;
	Wed, 19 Oct 2022 16:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666195279;
	bh=FZTldGwPXJWgnpdyFIKD51MCFfFHcZqhr6QdwyR7jEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DOW/0BNJlt856OZmudCrGNxwRrmucfHvxmsEdy46AtsA+QtX94a8y9N6JvcLguYOy
	 qqUoH0ajiLrcrvbTRbFEhCN4wpT6pxTzvxfceBycS4G8Vh1ei5ZkLRTnBGs7AhFME1
	 cmZ+9Ez6oHA8SJYKuQ7Pp1qOs9Da0En/pII+er5g=
Date: Wed, 19 Oct 2022 18:01:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v2 10/38] tty: hvc: use console_is_enabled()
Message-ID: <Y1AfTeBbjPcWFFib@kroah.com>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-11-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019145600.1282823-11-john.ogness@linutronix.de>
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
Cc: Petr Mladek <pmladek@suse.com>, Xianting Tian <xianting.tian@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org, Shile Zhang <shile.zhang@linux.alibaba.com>, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 19, 2022 at 05:01:32PM +0206, John Ogness wrote:
> Replace (console->flags & CON_ENABLED) usage with console_is_enabled().
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
