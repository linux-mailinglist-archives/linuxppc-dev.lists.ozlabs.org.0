Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ED263274F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 16:06:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NG9hr5HFtz3cKk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 02:06:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wgEmmbjY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wgEmmbjY;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NG9gt2Hllz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 02:06:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 191D6B81088;
	Mon, 21 Nov 2022 15:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4A6C433D6;
	Mon, 21 Nov 2022 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669043155;
	bh=69fnffLkz/ILK6bYr21czslsgeqwii9nzQ1KmDeEAF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wgEmmbjYMxg528j5wuwTzPboE9RBUDUwjIV2gNsrOBwiIFh7KjwAVpFzD9dRUycw6
	 LGvn+xCfvrRYuDHNEFnQENBJpbGO6vP97nFlevknNth7LVb7SLaAmUZl7BdwzraGNC
	 hZmKPSHWuadxhFWfGEsvQJpgTCv4levVp/MeYLcA=
Date: Mon, 21 Nov 2022 16:05:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH 2/4] fs: define a firmware security filesystem named
 fwsecurityfs
Message-ID: <Y3uT0PJ5g86TAj6t@kroah.com>
References: <Y2uvUFQ9S2oaefSY@kroah.com>
 <8447a726-c45d-8ebb-2a74-a4d759631e64@linux.vnet.ibm.com>
 <Y2zLRw/TzV/sWgqO@kroah.com>
 <44191f02-7360-bca3-be8f-7809c1562e68@linux.vnet.ibm.com>
 <Y3anQukokMcQr+iE@kroah.com>
 <d615180d-6fe5-d977-da6a-e88fd8bf5345@linux.vnet.ibm.com>
 <Y3pSF2MRIXd6aH14@kroah.com>
 <88111914afc6204b2a3fb82ded5d9bfb6420bca6.camel@HansenPartnership.com>
 <Y3tbhmL4oG1YTyT/@kroah.com>
 <10c85b8f4779700b82596c4a968daead65a29801.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10c85b8f4779700b82596c4a968daead65a29801.camel@HansenPartnership.com>
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

On Mon, Nov 21, 2022 at 09:03:18AM -0500, James Bottomley wrote:
> On Mon, 2022-11-21 at 12:05 +0100, Greg Kroah-Hartman wrote:
> > On Sun, Nov 20, 2022 at 10:14:26PM -0500, James Bottomley wrote:
> > > On Sun, 2022-11-20 at 17:13 +0100, Greg Kroah-Hartman wrote:
> > > > On Sat, Nov 19, 2022 at 01:20:09AM -0500, Nayna wrote:
> > > > > 
> > > > > On 11/17/22 16:27, Greg Kroah-Hartman wrote:
> > > > > > On Mon, Nov 14, 2022 at 06:03:43PM -0500, Nayna wrote:
> > > > > > > On 11/10/22 04:58, Greg Kroah-Hartman wrote:
> > > [...]
> > > > > > > > I do not understand, sorry.  What does namespaces have to
> > > > > > > > do
> > > > > > > > with this?
> > > > > > > > sysfs can already handle namespaces just fine, why not
> > > > > > > > use
> > > > > > > > that?
> > > > > > > Firmware objects are not namespaced. I mentioned it here as
> > > > > > > an
> > > > > > > example of the difference between firmware and kernel
> > > > > > > objects.
> > > > > > > It is also in response to the feedback from James Bottomley
> > > > > > > in
> > > > > > > RFC v2 [
> > > > > > > https://lore.kernel.org/linuxppc-dev/41ca51e8db9907d9060cc38ad
> > > > > > > b59a66dcae4c59b.camel@HansenPartnership.com/].
> > > > > > I do not understand, sorry.  Do you want to use a namespace
> > > > > > for
> > > > > > these or not?  The code does not seem to be using
> > > > > > namespaces. 
> > > > > > You can use sysfs with, or without, a namespace so I don't
> > > > > > understand the issue here.
> > > > > > 
> > > > > > With your code, there is no namespace.
> > > > > 
> > > > > You are correct. There's no namespace for these.
> > > > 
> > > > So again, I do not understand.  Do you want to use filesystem
> > > > namespaces, or do you not?
> > > 
> > > Since this seems to go back to my email quoted again, let me
> > > repeat: the question isn't if this patch is namespaced; I think
> > > you've agreed several times it isn't.  The question is if the
> > > exposed properties would ever need to be namespaced.  This is a
> > > subtle and complex question which isn't at all explored by the
> > > above interchange.
> > > 
> > > > How again can you not use sysfs or securityfs due to namespaces? 
> > > > What is missing?
> > > 
> > > I already explained in the email that sysfs contains APIs like
> > > simple_pin_... which are completely inimical to namespacing.
> > 
> > Then how does the networking code handle the namespace stuff in
> > sysfs?
> > That seems to work today, or am I missing something?
> 
> have you actually tried?
> 
> jejb@lingrow:~> sudo unshare --net bash
> lingrow:/home/jejb # ls /sys/class/net/
> lo  tun0  tun10  wlan0
> lingrow:/home/jejb # ip link show
> 1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN mode DEFAULT group
> default qlen 1000
>     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
> 
> So, as you see, I've entered a network namespace and ip link shows me
> the only interface I can see in that namespace (a down loopback) but
> sysfs shows me every interface on the system outside the namespace.

Then all of the code in include/kobject_ns.h is not being used?  We have
a whole kobject namespace set up for networking, I just assumed they
were using it.  If not, I'm all for ripping it out.

thanks,

greg k-h
