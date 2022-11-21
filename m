Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E85632BCA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 19:13:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGFrC30t2z3dv8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 05:13:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ev62ZYHq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ev62ZYHq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGFqK1b82z2xDv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 05:12:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3ED98613DC;
	Mon, 21 Nov 2022 18:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092D4C433D7;
	Mon, 21 Nov 2022 18:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669054360;
	bh=3hKMiUWSJlNUwha4kRCYF6DVvlsHYc9XldvHrQoGMS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ev62ZYHqi31e22gyDngGK7EIfQceHN+E3DDkSWP1G3IXOBeCWfQmDmemGbtRgLukA
	 PMGWLB5QgVoQQljqfoH29fsa4KLSPEWOOnpn5Aiaqd8e5vxAhXnoElRuLtbWLwGYMI
	 TyhDZXlGf4swVfntlNQFIjIo5U9cdNUCbgZf9t6c=
Date: Mon, 21 Nov 2022 19:12:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH 2/4] fs: define a firmware security filesystem named
 fwsecurityfs
Message-ID: <Y3u/lF2wb7xWqnDO@kroah.com>
References: <Y2zLRw/TzV/sWgqO@kroah.com>
 <44191f02-7360-bca3-be8f-7809c1562e68@linux.vnet.ibm.com>
 <Y3anQukokMcQr+iE@kroah.com>
 <d615180d-6fe5-d977-da6a-e88fd8bf5345@linux.vnet.ibm.com>
 <Y3pSF2MRIXd6aH14@kroah.com>
 <88111914afc6204b2a3fb82ded5d9bfb6420bca6.camel@HansenPartnership.com>
 <Y3tbhmL4oG1YTyT/@kroah.com>
 <10c85b8f4779700b82596c4a968daead65a29801.camel@HansenPartnership.com>
 <Y3uT0PJ5g86TAj6t@kroah.com>
 <94fe007e8eab8bc7ae3f56b88ad94646b4673657.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94fe007e8eab8bc7ae3f56b88ad94646b4673657.camel@HansenPartnership.com>
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-efi@vger.kernel.org, Nayna <nayna@linux.vnet.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, Dov Murik <dovmurik@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-fsdevel@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 21, 2022 at 12:33:55PM -0500, James Bottomley wrote:
> On Mon, 2022-11-21 at 16:05 +0100, Greg Kroah-Hartman wrote:
> > On Mon, Nov 21, 2022 at 09:03:18AM -0500, James Bottomley wrote:
> > > On Mon, 2022-11-21 at 12:05 +0100, Greg Kroah-Hartman wrote:
> > > > On Sun, Nov 20, 2022 at 10:14:26PM -0500, James Bottomley wrote:
> [...]
> > > > > I already explained in the email that sysfs contains APIs like
> > > > > simple_pin_... which are completely inimical to namespacing.
> > > > 
> > > > Then how does the networking code handle the namespace stuff in
> > > > sysfs? That seems to work today, or am I missing something?
> > > 
> > > have you actually tried?
> > > 
> > > jejb@lingrow:~> sudo unshare --net bash
> > > lingrow:/home/jejb # ls /sys/class/net/
> > > lo  tun0  tun10  wlan0
> > > lingrow:/home/jejb # ip link show
> > > 1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN mode DEFAULT
> > > group
> > > default qlen 1000
> > >     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
> > > 
> > > So, as you see, I've entered a network namespace and ip link shows
> > > me the only interface I can see in that namespace (a down loopback)
> > > but sysfs shows me every interface on the system outside the
> > > namespace.
> > 
> > Then all of the code in include/kobject_ns.h is not being used?  We
> > have a whole kobject namespace set up for networking, I just assumed
> > they were using it.  If not, I'm all for ripping it out.
> 
> Hm, looking at the implementation, it seems to trigger off the
> superblock (meaning you have to remount inside a mount namespace) and
> it only works to control visibility in label based namespaces, so this
> does actually work
> 
> jejb@lingrow:~/git/linux> sudo unshare  --net --mount bash 
> lingrow:/home/jejb # mount -t sysfs none /sys
> lingrow:/home/jejb # ls /sys/class/net/
> lo
> 
> The label based approach means that any given file can be shown in one
> and only one namespace, which works for net, but not much else
> (although it probably could be adapted).

Great, thanks for verifying it works properly.

No other subsystem other than networking has cared about adding support
for namespaces to their sysfs representations.  But the base logic is
all there if they want to do so.

thanks,

greg k-h
