Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46848E33E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 05:22:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZp7N3lhYz3bZc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 15:22:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcdh+lEc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fcdh+lEc; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZp6F1ldtz30RR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 15:21:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E461B823A8;
 Fri, 14 Jan 2022 04:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF287C36AEA;
 Fri, 14 Jan 2022 04:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642134112;
 bh=fYIpZfdKm77yChqSoDkJtqXppTzLoylo7TRrCRzc6K4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fcdh+lEc0kmoBOoBXsCchdptPrKYwcSnnC0MrqYiX1GBjlERbPVveFdtGv6vG1ERh
 la5lLWpjHd/kjMtqbcMfW7aulYLHCt6b+dYiFttdshpaADVhsY7+MOoxeBkrFEHlOr
 6PdcJW5SfQalDZRYYEld9ye1caFH1V4dSpuDhrb+AFOTH1snkLqS48UVkuHr1HIawH
 ypU+R0BKOZQzSNeNDqFSAik5DEuH0ofsc/GGbFiCdr5wYY8wA7HKo01L3r5eTNp4xv
 Nmm+vSABot0i99QDAUk+rL5UGKQRE9fEI+8RqjsmE0dKwJ9PkL6YSHL8YRejQIZbJG
 rdlf/TWLxow6Q==
Date: Thu, 13 Jan 2022 20:21:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] net: apple: bmac: Fix build since dev_addr constification
Message-ID: <20220113202150.3a241d71@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220114031316.2419293-1-mpe@ellerman.id.au>
References: <20220114031316.2419293-1-mpe@ellerman.id.au>
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

On Fri, 14 Jan 2022 14:13:16 +1100 Michael Ellerman wrote:
> Since commit adeef3e32146 ("net: constify netdev->dev_addr") the bmac
> driver no longer builds with the following errors (pmac32_defconfig):
>=20
>   linux/drivers/net/ethernet/apple/bmac.c: In function =E2=80=98bmac_prob=
e=E2=80=99:
>   linux/drivers/net/ethernet/apple/bmac.c:1287:20: error: assignment of r=
ead-only location =E2=80=98*(dev->dev_addr + (sizetype)j)=E2=80=99
>    1287 |   dev->dev_addr[j] =3D rev ? bitrev8(addr[j]): addr[j];
>         |                    ^
>=20
> Fix it by making the modifications to a local macaddr variable and then
> passing that to eth_hw_addr_set().
>=20
> We don't use the existing addr variable because the bitrev8() would
> mutate it, but it is already used unreversed later in the function.
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Jakub Kicinski <kuba@kernel.org>

Thank you!
