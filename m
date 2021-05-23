Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A3A38DB39
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 15:25:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fp1LZ0WN3z3bx4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 23:25:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fp1LC4Vp4z2xZD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 May 2021 23:25:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4Fp1L224XdzB6pT;
 Sun, 23 May 2021 15:25:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsG_czGrW-V2; Sun, 23 May 2021 15:25:14 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Fp1L212RgzB6hw;
 Sun, 23 May 2021 15:25:14 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id C951716D; Sun, 23 May 2021 15:29:37 +0200 (CEST)
Received: from 37-164-13-85.coucou-networks.fr
 (37-164-13-85.coucou-networks.fr [37.164.13.85]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Sun, 23 May 2021 15:29:37 +0200
Date: Sun, 23 May 2021 15:29:37 +0200
Message-ID: <20210523152937.Horde.5kC0kzvaP3No5BC63LlZ_A7@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH net-next] ethernet: ucc_geth: Use kmemdup() rather than
 kmalloc+memcpy
In-Reply-To: <20210523075616.14792-1-yuehaibing@huawei.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: rasmus.villemoes@prevas.dk, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, kuba@kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

YueHaibing <yuehaibing@huawei.com> a =C3=A9crit=C2=A0:

> Issue identified with Coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ethernet/freescale/ucc_geth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.c=20=20
>=20b/drivers/net/ethernet/freescale/ucc_geth.c
> index e0936510fa34..51206272cc25 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth.c
> +++ b/drivers/net/ethernet/freescale/ucc_geth.c
> @@ -3590,10 +3590,10 @@ static int ucc_geth_probe(struct=20=20
>=20platform_device* ofdev)
>  	if ((ucc_num < 0) || (ucc_num > 7))
>  		return -ENODEV;
>
> -	ug_info =3D kmalloc(sizeof(*ug_info), GFP_KERNEL);
> +	ug_info =3D kmemdup(&ugeth_primary_info, sizeof(*ug_info),
> +			  GFP_KERNEL);

Can you keep that as a single line ? The tolerance is 100 chars per line no=
w.

>  	if (ug_info =3D=3D NULL)
>  		return -ENOMEM;
> -	memcpy(ug_info, &ugeth_primary_info, sizeof(*ug_info));
>
>  	ug_info->uf_info.ucc_num =3D ucc_num;
>
> --
> 2.17.1


