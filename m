Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A18A32514AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 10:55:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbN9m0hdGzDqRf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 18:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=balbi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=FpCcd+Yn; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbN7d6DRQzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 18:53:33 +1000 (AEST)
Received: from saruman (unknown [194.34.132.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 453F52065F;
 Tue, 25 Aug 2020 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598345610;
 bh=48jdtfx0JIE9oh33ZlDmHSVtXKTWqEXHMhhg+xQ6RL0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FpCcd+YnaQK51fsF4Mdu+gzQkmfevytY6LIFF128xwoldo7e0FZs0JI8071yvowTG
 yjSz8HJbFCxnGrfMIqIpO5LcjhuGfvzpz1ou6KEyoboQNf80Pz9+67ZY08w+totrlW
 1oGgWUqAjX0z5GsoDd8IY4UkA7nZNcKBwOyOZwqs=
From: Felipe Balbi <balbi@kernel.org>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "yebin10@huawei.com"
 <yebin10@huawei.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with
 zero in fsl_udc_probe
In-Reply-To: <2c2317ff8385f75466cbfa1f0109a1f2c3acbc48.camel@infinera.com>
References: <20200824080437.229826-1-yebin10@huawei.com>
 <20200824082122.GA336539@kroah.com>
 <f61f4bc3916f852799edb6af9740afb2118ec84f.camel@infinera.com>
 <87d03gjgbw.fsf@kernel.org>
 <2c2317ff8385f75466cbfa1f0109a1f2c3acbc48.camel@infinera.com>
Date: Tue, 25 Aug 2020 11:53:23 +0300
Message-ID: <877dtnjed8.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
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
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Joakim Tjernlund <Joakim.Tjernlund@infinera.com> writes:

> On Mon, 2020-08-24 at 16:58 +0300, Felipe Balbi wrote:
>> Joakim Tjernlund <Joakim.Tjernlund@infinera.com> writes:
>>=20
>> > On Mon, 2020-08-24 at 10:21 +0200, Greg KH wrote:
>> > >=20
>> > > On Mon, Aug 24, 2020 at 04:04:37PM +0800, Ye Bin wrote:
>> > > > Signed-off-by: Ye Bin <yebin10@huawei.com>
>> > >=20
>> > > I can't take patches without any changelog text, sorry.
>> >=20
>> > Still taking patches for fsl_udc_core.c ?
>> > I figured this driver was obsolete and should be moved to one of the C=
hipidea drivers.
>>=20
>> Nobody sent any patches to switch over the users of this driver to
>> chipidea. I would love to delete this driver :-)
>
> Me too, I got a few local patches here as the driver is quite buggy.
> Got to little USB knowledge to switch it over though :(

this wouldn't require USB knowledge. It only requires some minor DTS
knowledge and HW for testing.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9E0YMRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZAaBAArJgp8dg8Bner+zJ32pLdsLJG8r9c0IFh
bhLUKt9k0SHiA13MLsrrSiuRLTMSqXez9mIisB/SGei1qeybI7ut3ZxK69RgMX0/
DqLk4TJJdl7ZniSrvT8gV4TL/z0zAIgPHbZwbTEGTeFxDLFPdtfW5GoTwYZroacG
rOk8cRbwfA6yMItTEe8bnkcCSKIFp9CwdsryHhDth/RfiT4IrBldUSiyd1kdCMo7
hRJlWPScmR+jnpvOWv6YKjU2766t7PFFpCjui6XgMxReZRQCCpeomWyOmE/0aw+r
5PJGlgkoSjDPIq+KBULMp3FKy6NucorE1Fid1jWkTbKLTgWAaD+C9isLXookCZUF
4Z+GYUoSqQSQgB2vYjaD0LJiUe1DggJTpLlubmEE+cLi/8/E+pDGbm4fdqntypBY
Reso03GbaFn05OhKHWn382LXq3byRzQ1vK1pXoe7GZJ57J3tLS/tGiZmE0FppdjS
tCEDUui7m+S/4IfFe4IJFvh2N0oJAfRWpOf0kPh3I1t/+u9uHNC3E46TFCW+iLjN
Iye2Ql8b2dW0jDZ6SWawyXD2g/eh5nrgkCwp3SzJVuYC2kdLBYtc1YKovjv45KMe
Yl7fFBIv5uma180fjXyxUwxKUR7DXcA7mwhDdhag3/JGu1V7xx6z9RtpHTuNdvoI
f/19LIlQMdA=
=Oe2R
-----END PGP SIGNATURE-----
--=-=-=--
