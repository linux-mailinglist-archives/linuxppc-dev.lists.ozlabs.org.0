Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85371444D3A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 03:18:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl6kJ2Shrz2yQw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 13:18:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=IzgQQMkP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.41.104;
 helo=mail-41104.protonmail.ch;
 envelope-from=stanley.johnson.001@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=IzgQQMkP; 
 dkim-atps=neutral
X-Greylist: delayed 558 seconds by postgrey-1.36 at boromir;
 Thu, 04 Nov 2021 13:09:57 AEDT
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl6Xj2CqRz2xXG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 13:09:57 +1100 (AEDT)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4Hl6Kw1LBbz4x0YC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 02:00:36 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="IzgQQMkP"
Date: Thu, 04 Nov 2021 02:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1635991223;
 bh=ucEUvP4fMdXZ3ON+npG0Nj5C5gtYGUN1jsZOWwRupK8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=IzgQQMkPKL5s1kQH1zEt7+Kokn75aTMVoqDWYwZj7Ab2ob3p+EfOwaFricUR6pcH+
 CXDC4Ackz4VJnxadEwNeaSQbvIooK4Hl9h6uqlFHUS9irdrhaIBCxk09ppSjdxJzA8
 o2BU+S6fEmCJTSLuPlSBVslUENdli8MEAnWaWcek=
To: Finn Thain <fthain@linux-m68k.org>
From: Stanley Johnson <stanley.johnson.001@protonmail.com>
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
Message-ID: <m0OyfpLa146ICa5BY-R6updiBgoAJmoZY4ywxwIMXAXKPzX6HQrpXInpO7V28XnYOm87T4pTbY4VTmJxeY2c_L4u7s4D84cvxQ3Ab-D86_M=@protonmail.com>
In-Reply-To: <3723058-87f1-cba7-c8ad-ac8dc5722abe@linux-m68k.org>
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
 <48c3ed15-2ecf-cc12-c287-2b61457f5fb__21333.0969143257$1635819996$gmane$org@nippy.intranet>
 <87cznh39lk.fsf@igel.home>
 <3723058-87f1-cba7-c8ad-ac8dc5722abe@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.8 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,SUSPICIOUS_RECIPS
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Thu, 04 Nov 2021 13:17:44 +1100
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
Reply-To: Stanley Johnson <stanley.johnson.001@protonmail.com>
Cc: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Andreas Schwab <schwab@linux-m68k.org>,
 Riccardo Mottola <riccardo.mottola@libero.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday, November 3rd, 2021 at 4:26 PM, Finn Thain <fthain@linux-m68k.=
org> wrote:

> On Wed, 3 Nov 2021, Andreas Schwab wrote:
>
> > On Nov 02 2021, Finn Thain wrote:
> >
> > > After many builds and tests, Stan and I were able to determine that t=
his
> > >
> > > regression only affects builds with CONFIG_USER_NS=3Dy. That is,
> > >
> > > d3ccc9781560 + CONFIG_USER_NS=3Dy --> fail
> > >
> > > d3ccc9781560 + CONFIG_USER_NS=3Dn --> okay
> > >
> > > d3ccc9781560~ + CONFIG_USER_NS=3Dy --> okay
> > >
> > > d3ccc9781560~ + CONFIG_USER_NS=3Dn --> okay
> >
> > On my iBook G4, X is working alright with 5.15 and CONFIG_USER_NS=3Dy.
>
> Stan said his Cube has these packages installed:
>
> dpkg --list | grep Xorg
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> ii xserver-xorg-core 2:1.20.11-1
>
> powerpc Xorg X server - core server
>
> ii xserver-xorg-legacy 2:1.20.11-1
>
> powerpc setuid root Xorg server wrapper
>
> I gather that Riccardo also runs Debian SID.
>
> Perhaps there is some interaction between d3ccc9781560, CONFIG_USER_NS an=
d
>
> the SUID wrapper...
>
> Does your Xorg installation use --enable-suid-wrapper, Andreas?

Hi Andreas,

Does X work for you if you use the current Debian SID installation with the=
ir current default kernel? That's how this all started. The problem was eve=
ntually isolated via a git bisect and an exhaustive search of kernel option=
s to the identified "bad commit" and the kernel option CONFIG_USER_NS. The =
kernel just before the bad commit works with or without CONFIG_USER_NS set,=
 but as of the bad commit, X works only with CONFIG_USER_NS not set, at lea=
st on my G4 Cube.

Hi Riccardo,

The G3 system I used for testing was a PowerBook Series II Wallstreet, usin=
g the same kernel and Xorg versions that I'm using on the Cube. The same te=
st that failed on the Cube worked on the Wallstreet. Of course, this result=
 may not be consistent with other G3 systems. On your iBook G4, if you reco=
mpile the kernel (the one that results in an X that doesn't work on your sy=
stem) and set CONFIG_USER_NS=3Dn, does X then work?

-Stan

