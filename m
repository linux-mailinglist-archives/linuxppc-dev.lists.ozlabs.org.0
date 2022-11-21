Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E771632B17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 18:34:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGDzZ5v19z3dvM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 04:34:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=hfMHqNKV;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=HoHMad2S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hansenpartnership.com (client-ip=96.44.175.130; helo=bedivere.hansenpartnership.com; envelope-from=james.bottomley@hansenpartnership.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=hfMHqNKV;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=HoHMad2S;
	dkim-atps=neutral
X-Greylist: delayed 51564 seconds by postgrey-1.36 at boromir; Tue, 22 Nov 2022 04:34:03 AEDT
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGDyg138Wz3c1n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 04:34:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1669052039;
	bh=1NBtM3ic574n1Twrt+hz9W3YFOsRlGAK5kI5ykv3AJw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=hfMHqNKVYci9A6OL7RrPHVSj1+fjQqUesByvXCWTpD4VnwLtv5YDW1JRN8Csya7op
	 uLgPvLjaO2YbSOjN4wYahNIyWUkxX5TlI1+QLg3WaWhlujBxrtFTHrqy/uEngA/y2n
	 4d9ObYfWnPQFfG5r8u+cQVwMFWtQgcYi6z4E0Xh8=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 29B2B128647B;
	Mon, 21 Nov 2022 12:33:59 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xzyyntl5lLVC; Mon, 21 Nov 2022 12:33:59 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1669052038;
	bh=1NBtM3ic574n1Twrt+hz9W3YFOsRlGAK5kI5ykv3AJw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=HoHMad2SLqp4HlUabcI9OV4eBb+9yM/KrRBmYc1yGrB3+7iRYKajqVC0FUeOCYulg
	 2XSfo2Ri/bc34rVnRpsXaX+LQpt123Zr9A2/dIVlxcff7qs5iYpgrK4abJ8D8k8uTb
	 m7TFERR+spJqRcqq+FeAE6mRuyUxoiJWyP8Om2HA=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 74E4812862F9;
	Mon, 21 Nov 2022 12:33:57 -0500 (EST)
Message-ID: <94fe007e8eab8bc7ae3f56b88ad94646b4673657.camel@HansenPartnership.com>
Subject: Re: [PATCH 2/4] fs: define a firmware security filesystem named
 fwsecurityfs
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 21 Nov 2022 12:33:55 -0500
In-Reply-To: <Y3uT0PJ5g86TAj6t@kroah.com>
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
	 <Y3uT0PJ5g86TAj6t@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2022-11-21 at 16:05 +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 21, 2022 at 09:03:18AM -0500, James Bottomley wrote:
> > On Mon, 2022-11-21 at 12:05 +0100, Greg Kroah-Hartman wrote:
> > > On Sun, Nov 20, 2022 at 10:14:26PM -0500, James Bottomley wrote:
[...]
> > > > I already explained in the email that sysfs contains APIs like
> > > > simple_pin_... which are completely inimical to namespacing.
> > > 
> > > Then how does the networking code handle the namespace stuff in
> > > sysfs? That seems to work today, or am I missing something?
> > 
> > have you actually tried?
> > 
> > jejb@lingrow:~> sudo unshare --net bash
> > lingrow:/home/jejb # ls /sys/class/net/
> > lo  tun0  tun10  wlan0
> > lingrow:/home/jejb # ip link show
> > 1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN mode DEFAULT
> > group
> > default qlen 1000
> >     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
> > 
> > So, as you see, I've entered a network namespace and ip link shows
> > me the only interface I can see in that namespace (a down loopback)
> > but sysfs shows me every interface on the system outside the
> > namespace.
> 
> Then all of the code in include/kobject_ns.h is not being used?  We
> have a whole kobject namespace set up for networking, I just assumed
> they were using it.  If not, I'm all for ripping it out.

Hm, looking at the implementation, it seems to trigger off the
superblock (meaning you have to remount inside a mount namespace) and
it only works to control visibility in label based namespaces, so this
does actually work

jejb@lingrow:~/git/linux> sudo unshare  --net --mount bash 
lingrow:/home/jejb # mount -t sysfs none /sys
lingrow:/home/jejb # ls /sys/class/net/
lo

The label based approach means that any given file can be shown in one
and only one namespace, which works for net, but not much else
(although it probably could be adapted).

James

