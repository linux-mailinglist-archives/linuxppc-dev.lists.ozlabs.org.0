Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 110BB6341C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 17:44:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGqpb6mWyz3cMb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 03:44:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ai29wCwr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ai29wCwr;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGqnd51TXz3c5w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 03:43:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A8C9CB81CBD;
	Tue, 22 Nov 2022 16:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CD1C433D6;
	Tue, 22 Nov 2022 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669135392;
	bh=HhGB03f7yfLJTw6SIRqhGxERi9Gom4x4ToervBUNQF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ai29wCwrSrFMalECnQg3VZFE6JJ7w1PVvNsX/nUcTdZGvwJT9FgVXh0Qu1fP/KZjg
	 gLL1mmmGyJUPfkwUZ8U8rfzyORb4k7cg2ocWkdlYVwXPJu4ByDHKX8FbqktGuqI0/r
	 L84ihOeSNwOdUyo5JUrjvyIoAUgVxWDKIToY6zCM=
Date: Tue, 22 Nov 2022 17:43:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v5 00/40] reduce console_lock scope
Message-ID: <Y3z8HOt0yOd1nceY@kroah.com>
References: <20221116162152.193147-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116162152.193147-1-john.ogness@linutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net, dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, Eric Dumazet <edumazet@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Daniel Thompson <daniel.thompson@linaro.org>, linux-samsung-soc@vger.kernel.org, Tom Rix <trix@redhat.com>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org, Aaron Tomlin <atomlin@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Paolo Abeni <pabeni@redhat.com>, Petr Mladek <pmladek@suse.com>, Michal Simek <michal.simek@xilinx.com>, linux-u
 m@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>, Lukas Wunner <lukas@wunner.de>, Thomas Zimmermann <tzimmermann@suse.de>, Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16, 2022 at 05:27:12PM +0106, John Ogness wrote:
> This is v5 of a series to prepare for threaded/atomic
> printing. v4 is here [0]. This series focuses on reducing the
> scope of the BKL console_lock. It achieves this by switching to
> SRCU and a dedicated mutex for console list iteration and
> modification, respectively. The console_lock will no longer
> offer this protection.
> 
> Also, during the review of v2 it came to our attention that
> many console drivers are checking CON_ENABLED to see if they
> are registered. Because this flag can change without
> unregistering and because this flag does not represent an
> atomic point when an (un)registration process is complete,
> a new console_is_registered() function is introduced. This
> function uses the console_list_lock to synchronize with the
> (un)registration process to provide a reliable status.
> 
> All users of the console_lock for list iteration have been
> modified. For the call sites where the console_lock is still
> needed (for other reasons), comments are added to explain
> exactly why the console_lock is needed.
> 
> All users of CON_ENABLED for registration status have been
> modified to use console_is_registered(). Note that there are
> still users of CON_ENABLED, but this is for legitimate purposes
> about a registered console being able to print.
> 
> The base commit for this series is from Paul McKenney's RCU tree
> and provides an NMI-safe SRCU implementation [1]. Without the
> NMI-safe SRCU implementation, this series is not less safe than
> mainline. But we will need the NMI-safe SRCU implementation for
> atomic consoles anyway, so we might as well get it in
> now. Especially since it _does_ increase the reliability for
> mainline in the panic path.
> 
> Changes since v4:
> 
> printk:
> 
> - Introduce console_init_seq() to handle the now rather complex
>   procedure to find an appropriate start sequence number for a
>   new console upon registration.
> 
> - When registering a non-boot console and boot consoles are
>   registered, try to flush all the consoles to get the next @seq
>   value before falling back to use the @seq of the enabled boot
>   console that is furthest behind.
> 
> - For console_force_preferred_locked(), make the console the
>   head of the console list.
> 


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
