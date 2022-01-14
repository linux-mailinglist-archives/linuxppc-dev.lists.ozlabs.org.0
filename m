Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7548E33D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 05:22:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZp6g5pcDz30Jh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 15:22:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ezl71945;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ezl71945; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZp5z43vjz2yLy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 15:21:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18567611CF;
 Fri, 14 Jan 2022 04:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488CEC36AE9;
 Fri, 14 Jan 2022 04:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642134098;
 bh=K8rVDTrL8ekMJTmZz7hTGjg4/bALqUZU+kMCsh3aWxU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ezl71945hwdnf1Iahw6K2BK+nuP7D6d7D8ptZ9mlSLZ7kqxak9qsI/kbpvs22Aj5T
 jXDDaC6X2lA5hM0HFbtMByvbYtQ0IrAfeidD8ut4TDXSTSZekJz6pXSlPr1OrQB1Ax
 21joaN26D+QBcvyEF0LPdoefHw5qZ1Yse66+w5aSfYWSjYDZwxVPODuLUWPFa9g8o9
 HcIsDPP3YHKN5OjLeAjFaX5S80el6rAPyVfAsWilx1yH1MQEVJ4htIg2csSHMXy4Zp
 9MEVSU28dB/BRW29xacgY+xG1/Xq8ppIUpZHZ6ZAbMxGkt8y9rCLWcO/i5jvq4AjH6
 ccto0Jw3Z93Jg==
Date: Thu, 13 Jan 2022 20:21:37 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] net: apple: mace: Fix build since dev_addr constification
Message-ID: <20220113202137.65ea4d41@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220114031252.2419042-1-mpe@ellerman.id.au>
References: <20220114031252.2419042-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 14 Jan 2022 14:12:52 +1100 Michael Ellerman wrote:
> Since commit adeef3e32146 ("net: constify netdev->dev_addr") the mace
> driver no longer builds with various errors (pmac32_defconfig):
>=20
>   linux/drivers/net/ethernet/apple/mace.c: In function =E2=80=98mace_prob=
e=E2=80=99:
>   linux/drivers/net/ethernet/apple/mace.c:170:20: error: assignment of re=
ad-only location =E2=80=98*(dev->dev_addr + (sizetype)j)=E2=80=99
>     170 |   dev->dev_addr[j] =3D rev ? bitrev8(addr[j]): addr[j];
>         |                    ^
>   linux/drivers/net/ethernet/apple/mace.c: In function =E2=80=98mace_rese=
t=E2=80=99:
>   linux/drivers/net/ethernet/apple/mace.c:349:32: warning: passing argume=
nt 2 of =E2=80=98__mace_set_address=E2=80=99 discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type
>     349 |     __mace_set_address(dev, dev->dev_addr);
>         |                             ~~~^~~~~~~~~~
>   linux/drivers/net/ethernet/apple/mace.c:93:62: note: expected =E2=80=98=
void *=E2=80=99 but argument is of type =E2=80=98const unsigned char *=E2=
=80=99
>      93 | static void __mace_set_address(struct net_device *dev, void *ad=
dr);
>         |                                                        ~~~~~~^~=
~~
>   linux/drivers/net/ethernet/apple/mace.c: In function =E2=80=98__mace_se=
t_address=E2=80=99:
>   linux/drivers/net/ethernet/apple/mace.c:388:36: error: assignment of re=
ad-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
>     388 |  out_8(&mb->padr, dev->dev_addr[i] =3D p[i]);
>         |                                    ^
>=20
> Fix it by making the modifications to a local macaddr variable and then
> passing that to eth_hw_addr_set(), as well as adding some missing const
> qualifiers.
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
