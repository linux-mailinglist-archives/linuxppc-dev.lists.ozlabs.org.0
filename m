Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F71151101
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 21:28:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BKD55gsbzDqM2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 07:28:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BFmn5Y3GzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 04:53:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=yZNSUeOU; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48BFmn463Fz8t3y
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 04:53:29 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48BFmn3Zzlz9sRY; Tue,  4 Feb 2020 04:53:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=yZNSUeOU; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48BFmn0xpmz9sRR
 for <linuxppc-dev@ozlabs.org>; Tue,  4 Feb 2020 04:53:28 +1100 (AEDT)
Received: from cakuba.hsd1.ca.comcast.net (unknown [199.201.64.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4530B2087E;
 Mon,  3 Feb 2020 17:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580752406;
 bh=+F911pBIa8UlZE0vunHO6BITHlbAp/snKVv81Rwfgu4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=yZNSUeOU9BuVDZG2NfZ2Cjbin6LdM35W5BRwsUTgG2fMGQpmbEIRG55wlqFO2Q1vb
 KZ03OAq6Q/zN85eIgsgOpx1N/Aw2Rg4CgvUUg7goyX16hRidDcTC32/9skI+kg/PKA
 XdgO+q/Pevl+hIOGqxPWBzNuO70YsRXXDwtYhRI8=
Date: Mon, 3 Feb 2020 09:53:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: Latest Git kernel: avahi-daemon[2410]: ioctl(): Inappropriate
 ioctl for device
Message-ID: <20200203095325.24c3ab1c@cakuba.hsd1.ca.comcast.net>
In-Reply-To: <9624aebf-edb9-a3b0-1a29-b61df6b7ba2f@xenosoft.de>
References: <20200126115247.13402-1-mpe@ellerman.id.au>
 <CAPDyKFrbYmV6_nV6psVLq6VRKMXf0PXpemBbj48yjOr3P130BA@mail.gmail.com>
 <58a6d45c-0712-18df-1b14-2f04cf12a1cb@xenosoft.de>
 <75aab3c9-1cb6-33bf-5de1-e05bbd98b6fb@c-s.fr>
 <9624aebf-edb9-a3b0-1a29-b61df6b7ba2f@xenosoft.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 04 Feb 2020 07:27:33 +1100
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
Cc: DTML <devicetree@vger.kernel.org>, Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@ozlabs.org, "contact@a-eon.com" <contact@a-eon.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2 Feb 2020 16:02:18 +0100, Christian Zigotzky wrote:
> On 02 February 2020 at 09:19 am, Christophe Leroy wrote:
> > Hello,
> >
> > Le 02/02/2020 =C3=A0 01:08, Christian Zigotzky a =C3=A9crit=C2=A0: =20
> >> Hello,
> >>
> >> We regularly compile and test Linux kernels every day during the=20
> >> merge window. Since Thuesday we have very high CPU loads because of=20
> >> the avahi daemon on our desktop Linux systems (Ubuntu, Debian etc).
> >>
> >> Error message: avahi-daemon[2410]: ioctl(): Inappropriate ioctl for=20
> >> device =20
> >
> > Do you know which ioctl, on which device ?
> > Can you take a trace of running avahi-daemon with 'strace' ?
> >
> > Can you bisect ?
> >
> > Christophe =20
> Hi Christophe,
> Hi All,
>=20
> I figured out that the avahi-daemon has a problem with the IPv6 address=20
> of a network interface since the Git kernel from Thursday. (Log attached)
> This generates high CPU usage because the avahi-daemon tries to access=20
> the IPv6 address again and again and thereby it produces a lot of log=20
> messages.
>=20
> We figured out that the networking updates aren't responsible for this=20
> issue because we created a test kernel on Wednesday. The issue is=20
> somewhere in the commits from Wednesday night to Thursday (CET).

FWIW Thursday is when the latest networking pull came in, so could well
be networking related..

> Please compile the latest Git kernel and test it with a desktop linux=20
> distribution for example Ubuntu. In my point of view there are many=20
> desktop machines affected. Many server systems don't use the avahi=20
> daemon so they aren't affected.
>=20
> It's possible to deactivate the access to the IPv6 address with the=20
> following line in the file "/etc/avahi/avahi-daemon.conf":
>=20
> use-ipv6=3Dno
>=20
> After a reboot the CPU usage is normal again. This is only a temporary=20
> solution.
>=20
> Unfortunately I don't have the time for bisecting next week. I have a=20
> lot of other work to do. In my point of view it is very important that=20
> you also compile the latest Git kernels. Then you will see the issue and=
=20
> then you have a better possibility to fix the issue.
