Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF645F1C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 17:24:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J10Sy4nxCz3cQS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 03:24:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t4bsyMz9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=t4bsyMz9; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J10SH3mhGz2yPd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 03:24:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3658A622DE;
 Fri, 26 Nov 2021 16:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11490C93056;
 Fri, 26 Nov 2021 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1637943852;
 bh=Vgi66QN9GrkmxWdokZZIUkz1w8SHaCVhZ2xKywc0LJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t4bsyMz9sZ5SdNFbi8Lg+l0uMiN0ey9VkB0gZ4ewsPhDJKphrgo30OqgVl+Ib/hSy
 EnbF/tBud01uOKhBFfvaP88G5aI3yq4HPJp0GGxo5Vtv1vKTxg1DuYkD9aCYf+8qDc
 rMmxt6KmHuJFNfdoWl/FJDeKrEaiClZLjGWxbUyk=
Date: Fri, 26 Nov 2021 17:24:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] w1: Misuse of get_user()/put_user() reported by sparse
Message-ID: <YaEKKeNW70WJe38G@kroah.com>
References: <2163689da6544c289254b3c69848acc36db998f5.1637313047.git.christophe.leroy@csgroup.eu>
 <YaEEqeKyWPfUP7vM@kroah.com>
 <39ec092d-428c-7fce-7291-a88a4caf8b9f@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39ec092d-428c-7fce-7291-a88a4caf8b9f@csgroup.eu>
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
Cc: Evgeniy Polyakov <zbr@ioremap.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 26, 2021 at 05:10:46PM +0100, Christophe Leroy wrote:
> 
> 
> Le 26/11/2021 à 17:00, Greg Kroah-Hartman a écrit :
> > On Fri, Nov 19, 2021 at 10:15:09AM +0100, Christophe Leroy wrote:
> > > sparse warnings: (new ones prefixed by >>)
> > > > > drivers/w1/slaves/w1_ds28e04.c:342:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char [noderef] __user *_pu_addr @@     got char *buf @@
> > >     drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     expected char [noderef] __user *_pu_addr
> > >     drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     got char *buf
> > > > > drivers/w1/slaves/w1_ds28e04.c:356:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __user *_gu_addr @@     got char const *buf @@
> > >     drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     expected char const [noderef] __user *_gu_addr
> > >     drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     got char const *buf
> > > 
> > > The buffer buf is a failsafe buffer in kernel space, it's not user
> > > memory hence doesn't deserve the use of get_user() or put_user().
> > > 
> > > Access 'buf' content directly.
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Link: https://lore.kernel.org/lkml/202111190526.K5vb7NWC-lkp@intel.com/T/
> > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > ---
> > >   drivers/w1/slaves/w1_ds28e04.c | 10 ++--------
> > >   1 file changed, 2 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/w1/slaves/w1_ds28e04.c b/drivers/w1/slaves/w1_ds28e04.c
> > > index e4f336111edc..d75bb16fb7a1 100644
> > > --- a/drivers/w1/slaves/w1_ds28e04.c
> > > +++ b/drivers/w1/slaves/w1_ds28e04.c
> > > @@ -339,10 +339,7 @@ static BIN_ATTR_RW(pio, 1);
> > >   static ssize_t crccheck_show(struct device *dev, struct device_attribute *attr,
> > >   			     char *buf)
> > >   {
> > > -	if (put_user(w1_enable_crccheck + 0x30, buf))
> > > -		return -EFAULT;
> > > -
> > > -	return sizeof(w1_enable_crccheck);
> > > +	return sprintf(buf, "%d", w1_enable_crccheck);
> > 
> > This should be sysfs_emit(), right?
> 
> Ok
> 
> > 
> > >   }
> > >   static ssize_t crccheck_store(struct device *dev, struct device_attribute *attr,
> > > @@ -353,11 +350,8 @@ static ssize_t crccheck_store(struct device *dev, struct device_attribute *attr,
> > >   	if (count != 1 || !buf)
> > >   		return -EINVAL;
> > > -	if (get_user(val, buf))
> > > -		return -EFAULT;
> > > -
> > >   	/* convert to decimal */
> > > -	val = val - 0x30;
> > > +	val = *buf - 0x30;
> > 
> > Why not use a proper function that can parse a string and turn it into a
> > number?
> 
> I wanted to keep the change minimal. But I can also replace it with some
> scanf.
> 
> But don't we have any generic function to read and store a bool after all ?

Yes we do, please use kstrtobool().

thanks,

greg k-h
