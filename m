Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E1D62F874
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 15:56:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDKc81cMVz3dwc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 01:56:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=EDb4yO6y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=EDb4yO6y;
	dkim-atps=neutral
X-Greylist: delayed 12747 seconds by postgrey-1.36 at boromir; Sat, 19 Nov 2022 01:55:34 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKbB2QSBz3bhn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 01:55:33 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id A1D8221FB8;
	Fri, 18 Nov 2022 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1668783329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RcWbup5BnnjHzEPpsHQeQ/9zmfC/ktCQBWDNShm4WAU=;
	b=EDb4yO6yUhovxR1R/uuiYft78ukr2h+oU+IjaIre1crSLD6FqDa7tOBl7T9GdFyjImWzLl
	fuZVE7BJe7raqlKMXUK6GnRr1NqEKply8FF3aod58x9Whn9xAOWMtUkNgxO/GnqpzSdULK
	TFzAN6y09Rae96AY+OVlAOuIn3VhXg8=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 093D42C141;
	Fri, 18 Nov 2022 14:55:28 +0000 (UTC)
Date: Fri, 18 Nov 2022 15:55:27 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v5 00/40] reduce console_lock scope
Message-ID: <Y3ec3/fpdAQacAOW@alley>
References: <20221116162152.193147-1-john.ogness@linutronix.de>
 <Y3drEOkD1fuZcvV2@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3drEOkD1fuZcvV2@alley>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net, dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Daniel Thompson <daniel.thompson@linaro.org>, linux-samsung-soc@vger.kernel.org, Tom Rix <trix@redhat.com>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org, Aaron Tomlin <atomlin@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@xilinx.com>, linux-um@lists.
 infradead.org, Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>, Lukas Wunner <lukas@wunner.de>, Thomas Zimmermann <tzimmermann@suse.de>, Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2022-11-18 12:22:58, Petr Mladek wrote:
> On Wed 2022-11-16 17:27:12, John Ogness wrote:
> > This is v5 of a series to prepare for threaded/atomic
> > printing. v4 is here [0]. This series focuses on reducing the
> > scope of the BKL console_lock. It achieves this by switching to
> > SRCU and a dedicated mutex for console list iteration and
> > modification, respectively. The console_lock will no longer
> > offer this protection.
> 
> The patchset looks ready for linux-next from my POV.
> 
> I am going to push it there right now to get as much testing
> as possible before the merge window.

JFYI, the patchset is committed in printk/linux.git,
branch rework/console-list-lock.

I'll eventually merge it into rework/kthreads. But I wanted to have
it separated until it gets some more testing in linux-next and
eventually some more review.

Best Regards,
Petr
