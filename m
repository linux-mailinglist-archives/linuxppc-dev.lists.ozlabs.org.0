Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9531CD311
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 09:42:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LCZT57dyzDqP3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 17:42:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=RTIe1Iso; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LCVt3KtDzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 17:39:18 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CE4820708;
 Mon, 11 May 2020 07:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589182756;
 bh=3lytq8v2NbYj3GmC4uNuIFBx8IWKYkcjo1rsyy6Dtt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTIe1IsoYMoTia0048SJi2pfWTObXYv2MtN6HsuOtRDWfSmrxITnFJEJf9wmxX2lQ
 X/4F0kST4FgAyo+dtsM4s1+wC8KLA6vgXu9fgbBVQr/WsTrO3jLvQV+5FoNcWhPJyk
 0yRhsK37lI4mtP5MQ7a/pPWdy/V76rK4w0fMkp9k=
Date: Mon, 11 May 2020 09:39:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: rananta@codeaurora.org
Subject: Re: [PATCH] tty: hvc: Fix data abort due to race in hvc_open
Message-ID: <20200511073913.GA1347819@kroah.com>
References: <20200428032601.22127-1-rananta@codeaurora.org>
 <20200506094851.GA2787548@kroah.com>
 <98bbe7afabf48d8e8fe839fdc9e836a5@codeaurora.org>
 <20200510064819.GB3400311@kroah.com>
 <77d889be4e0cb0e6e30f96199e2d843d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77d889be4e0cb0e6e30f96199e2d843d@codeaurora.org>
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
Cc: andrew@daynix.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, jslaby@suse.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 11, 2020 at 12:23:58AM -0700, rananta@codeaurora.org wrote:
> On 2020-05-09 23:48, Greg KH wrote:
> > On Sat, May 09, 2020 at 06:30:56PM -0700, rananta@codeaurora.org wrote:
> > > On 2020-05-06 02:48, Greg KH wrote:
> > > > On Mon, Apr 27, 2020 at 08:26:01PM -0700, Raghavendra Rao Ananta wrote:
> > > > > Potentially, hvc_open() can be called in parallel when two tasks calls
> > > > > open() on /dev/hvcX. In such a scenario, if the
> > > > > hp->ops->notifier_add()
> > > > > callback in the function fails, where it sets the tty->driver_data to
> > > > > NULL, the parallel hvc_open() can see this NULL and cause a memory
> > > > > abort.
> > > > > Hence, serialize hvc_open and check if tty->private_data is NULL
> > > > > before
> > > > > proceeding ahead.
> > > > >
> > > > > The issue can be easily reproduced by launching two tasks
> > > > > simultaneously
> > > > > that does nothing but open() and close() on /dev/hvcX.
> > > > > For example:
> > > > > $ ./simple_open_close /dev/hvc0 & ./simple_open_close /dev/hvc0 &
> > > > >
> > > > > Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
> > > > > ---
> > > > >  drivers/tty/hvc/hvc_console.c | 16 ++++++++++++++--
> > > > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/tty/hvc/hvc_console.c
> > > > > b/drivers/tty/hvc/hvc_console.c
> > > > > index 436cc51c92c3..ebe26fe5ac09 100644
> > > > > --- a/drivers/tty/hvc/hvc_console.c
> > > > > +++ b/drivers/tty/hvc/hvc_console.c
> > > > > @@ -75,6 +75,8 @@ static LIST_HEAD(hvc_structs);
> > > > >   */
> > > > >  static DEFINE_MUTEX(hvc_structs_mutex);
> > > > >
> > > > > +/* Mutex to serialize hvc_open */
> > > > > +static DEFINE_MUTEX(hvc_open_mutex);
> > > > >  /*
> > > > >   * This value is used to assign a tty->index value to a hvc_struct
> > > > > based
> > > > >   * upon order of exposure via hvc_probe(), when we can not match it
> > > > > to
> > > > > @@ -346,16 +348,24 @@ static int hvc_install(struct tty_driver
> > > > > *driver, struct tty_struct *tty)
> > > > >   */
> > > > >  static int hvc_open(struct tty_struct *tty, struct file * filp)
> > > > >  {
> > > > > -	struct hvc_struct *hp = tty->driver_data;
> > > > > +	struct hvc_struct *hp;
> > > > >  	unsigned long flags;
> > > > >  	int rc = 0;
> > > > >
> > > > > +	mutex_lock(&hvc_open_mutex);
> > > > > +
> > > > > +	hp = tty->driver_data;
> > > > > +	if (!hp) {
> > > > > +		rc = -EIO;
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > >  	spin_lock_irqsave(&hp->port.lock, flags);
> > > > >  	/* Check and then increment for fast path open. */
> > > > >  	if (hp->port.count++ > 0) {
> > > > >  		spin_unlock_irqrestore(&hp->port.lock, flags);
> > > > >  		hvc_kick();
> > > > > -		return 0;
> > > > > +		goto out;
> > > > >  	} /* else count == 0 */
> > > > >  	spin_unlock_irqrestore(&hp->port.lock, flags);
> > > >
> > > > Wait, why isn't this driver just calling tty_port_open() instead of
> > > > trying to open-code all of this?
> > > >
> > > > Keeping a single mutext for open will not protect it from close, it will
> > > > just slow things down a bit.  There should already be a tty lock held by
> > > > the tty core for open() to keep it from racing things, right?
> > > The tty lock should have been held, but not likely across
> > > ->install() and
> > > ->open() callbacks, thus resulting in a race between hvc_install() and
> > > hvc_open(),
> > 
> > How?  The tty lock is held in install, and should not conflict with
> > open(), otherwise, we would be seeing this happen in all tty drivers,
> > right?
> > 
> Well, I was expecting the same, but IIRC, I see that the open() was being
> called in parallel for the same device node.

So open and install are happening at the same time?  And the tty_lock()
does not protect the needed fields from being protected properly?  If
not, what fields are being touched without the lock?

> Is it expected that the tty core would allow only one thread to
> access the dev-node, while blocking the other, or is it the client
> driver's responsibility to handle the exclusiveness?

The tty core should handle this correctly, for things that can mess
stuff up (like install and open at the same time).  A driver should not
have to worry about that.

> > > where hvc_install() sets a data and the hvc_open() clears it.
> > > hvc_open()
> > > doesn't
> > > check if the data was set to NULL and proceeds.
> > 
> > What data is being set that hvc_open is checking?
> hvc_install sets tty->private_data to hp, while hvc_open sets it to NULL (in
> one of the paths).

I see no use of private_data in drivers/tty/hvc/ so what exactly are you
referring to?  The file private_data or the port private_data or
something else?

> > And you are not grabbing a lock in your install callback, you are only
> > serializing your open call here, I don't see how this is fixing anything
> > other than perhaps slowing down your codepaths.
> Basically, my intention was to add a NULL check before accessing *hp in
> open().
> The intention of the lock was to protect against this check.
> If the tty layer would have taken care of this, then perhaps there won't be
> a
> need to check for NULL.

Ah, driver_data is what you are referring to, not private_data.

Look at hvc_close(), no locking is done there to test for private_data,
right?  Why not?  The only thing setting driver_data is in install, and
your lock is not touching that.

And again, install and open should not race, if so, the tty core needs
to be fixed.

> > As an arument why this isn't correct, can you answer why this same type
> > of change wouldn't be required for all tty drivers in the tree?
> > 
> I agree, that if it's already taken care by the tty-core, we don't need it
> here.
> Correct me if I'm wrong, but looks like the tty layer is allowing parallel
> accesses
> to open(),

I do not think that happens, try counting the calls to open(), there
should only be one.  If not, that's a bug somewhere else.

thanks,

greg k-h
