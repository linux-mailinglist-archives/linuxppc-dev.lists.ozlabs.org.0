Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED612600823
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 09:54:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrTlg4l8Qz3c4K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 18:54:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=IZApUDce;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=IZApUDce;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrTkk4mVGz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 18:53:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1665993188;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=JtfsYCsUICzmwX0ptWIcaY6Vu7OLivbGEJZFsC1Cdx0=;
    b=IZApUDcezTeplvCL/EKUfB5CgZWsz4NsPucgBXfk98rJ8nI82KsUfyy2AmHQFYo4cv
    ZUWi7Qc/qJ05RWrTWuim4bo0/9WeIp3sJgnkofrl0DDygQzsO8ODpzv6Ww0wrTjzaxQO
    XJYrFE+ZDMshf06bSNChu6ziVfDhfnIIBcEi/OdfmOCxn8w0guOhPwccQCYdjru7Z1T4
    DptvbydxvJDYXgzg8X65n4sCzw/wXOClCHT/bhM8Fy3iOZJkmZvNtZ/LALkGhgBa0cNb
    oeP4zdfrXTjfqDoOt2z1TvnM9TZ5Fq4t7yt4uXDq49y+G2cf7SRe2YiXNU9jmoOemb6+
    qbcw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aW9yg7ptxnXpGu7JNmh/OkQXbEmHh6ySqrUfMZQ="
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 48.2.0 AUTH)
    with ESMTPSA id j7449ey9H7r6YA1
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 17 Oct 2022 09:53:06 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
Date: Mon, 17 Oct 2022 09:53:04 +0200
Message-Id: <BCDB3B67-48A1-45E6-806D-2501C7EA6D8C@xenosoft.de>
References: <87y1tfl1pt.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y1tfl1pt.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: iPhone Mail (19H12)
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com, rmclure@linux.ibm.com, mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 17. Oct 2022, at 02:43, Michael Ellerman <mpe@ellerman.id.au> wrote:
> Previously BIG_ENDIAN && GENERIC_CPU would use -mcpu=3Dpower5, now it uses=

> -mcpu=3Dpower4.

Maybe this is the issue. We will wait and not release the RC1 for testing be=
cause it is a risk for our testers to test these new kernels because of this=
 issue.

It is really important do not to rewrite code, that is well worked before.
Bugfixing and adding some new features is ok but rewriting of good code is e=
xpensive and doesn=E2=80=99t make any sense.

=E2=80=94 Christian

>=20
>=20
> cheers
>=20
>>>> On 16. Oct 2022, at 18:51, Segher Boessenkool <segher@kernel.crashing.o=
rg> wrote:
>>>=20
>>> =EF=BB=BFOn Fri, Oct 14, 2022 at 06:11:21PM +0200, Christian Zigotzky wr=
ote:
>>>> make oldconfig has asked because of the CPU family. I choosed GENERIC f=
or my P.A. Semi PWRficient PA6T-1682M. Is this correct? Maybe this is the pr=
oblem.
>>>>=20
>>>> config GENERIC_CPU
>>>> -    bool "Generic (POWER4 and above)"
>>>> +    bool "Generic (POWER5 and PowerPC 970 and above)"
>>>>   depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
>>>>   select PPC_64S_HASH_MMU
>>>>=20
>>>> There isn=E2=80=99t a POWER4 anymore and I used it via CONFIG_GENERIC_C=
PU=3Dy before.
>>>=20
>>> PA6T is ISA 2.04, just like POWER5+.  It should be fine.
>>>=20
>>>=20
>>> Segher

