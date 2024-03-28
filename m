Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1500A88FC53
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 11:01:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=KTgWnpwS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4zZt6Jk6z3vYL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 21:01:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=KTgWnpwS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4zZ64DMdz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 21:00:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WDDA18KE+f1Lba0LcdtNxU6aFsL8/adPlXelOyKmVfc=; t=1711620046; x=1712224846; 
	b=KTgWnpwS0m4eJwvD1KXvu1477WypPsV+ca7iR8v6g2VJilZAhRa4BZPzWZBN1t97TcYE5SCnctV
	TutgcywkD2lTi57wX7aUztKvjfpalz2ku3SGGw//gn365pyF7XDSk8ctfVR17v8VT9V+1etCv25KP
	70eC3ZG7H+oNFgsPvDYHAAeY/FxE2mY3LAotY7JUEEOHy1PPZn5FtI1iaR6sOq0wqwJfjVbV6HWkO
	g8P9FCNOOQqdMOmxe+TmneVeIAA9mgXhmOhDLhOJRiJAkhbKYgtfNFH8WyzndRmPZYEDA6i68XxoX
	G9R2KX75lE9Kl7XiwtrTsDgEcdJCYZ3bGKXw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.97)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1rpmYo-00000003cQ6-392W; Thu, 28 Mar 2024 11:00:38 +0100
Received: from p5b13a6ce.dip0.t-ipconnect.de ([91.19.166.206] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.97)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1rpmYo-00000001phz-2HJC; Thu, 28 Mar 2024 11:00:38 +0100
Message-ID: <1b7fb8364ed9a995d20de3cf3bc520a25094cbb3.camel@physik.fu-berlin.de>
Subject: Re: Boot failure with ppc64 port on iMacs G5
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Ellerman <mpe@ellerman.id.au>, tuxayo <victor@tuxayo.net>
Date: Thu, 28 Mar 2024 11:00:38 +0100
In-Reply-To: <871q8op1g1.fsf@mail.lhotse>
References: <fc93d03b-581d-40cd-8ab1-762a9ee2c20c@tuxayo.net>
	 <42e9a15f6733dd48c64cbceeb3ad27349ca8c3e4.camel@physik.fu-berlin.de>
	 <87r0gvg49s.fsf@mail.lhotse>
	 <be7a1a66e9cc4789704d2c93f0b770ea391a4c28.camel@physik.fu-berlin.de>
	 <87frxag1ew.fsf@mail.lhotse>
	 <1768836b7e6895f3c2fb0cb4a01a40fee7473dd5.camel@physik.fu-berlin.de>
	 <871q8op1g1.fsf@mail.lhotse>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.166.206
X-ZEDAT-Hint: PO
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Claudia Neumann <dr.claudia.neumann@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Wed, 2024-03-06 at 12:57 +1100, Michael Ellerman wrote:
> > Yep, the second, older image works as expected. However, the recent one=
 does not
> > and I have absolutely no clue why.
>=20
> I actually tested both, and both work, but then I cited the wrong one in
> my email >_<
>=20
> So at least on qemu that newer kernel is OK:
>=20
>   Preparing to boot Linux version 6.6.15-powerpc64 (debian-kernel@lists.d=
ebian.org) (gcc-13 (Debian 13.2.0-13) 13.2.0, GNU ld (GNU Binutils for Debi=
an) 2.42) #1 SMP Debian 6.6.15-2 (2024-02-04)
>   ...
>   Booting Linux via __start() @ 0x0000000004800000 ...
>   Hello World !
>   smp_core99_probe
>   smp_core99_bringup_done
>   Starting system log daemon: syslogd, klogd.

Did you get around testing the images on real hardware?

And can tell me what command line you used for booting with QEMU?
Maybe that gives us a clue where the problem is.

Users are still reporting boot lockups with kernel 6.6.x.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
