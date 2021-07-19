Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CCF3CE094
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 18:07:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT6Dm4Py2z3bgZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 02:07:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT6DP5D57z2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 02:06:58 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GT6DF4xN0zB58n;
 Mon, 19 Jul 2021 18:06:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COi69W5SXrwD; Mon, 19 Jul 2021 18:06:53 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GT6DF3zhRzB58l;
 Mon, 19 Jul 2021 18:06:53 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id BD3BA37C; Mon, 19 Jul 2021 18:12:05 +0200 (CEST)
Received: from 37.172.104.68 ([37.172.104.68]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Mon, 19 Jul 2021 18:12:05 +0200
Date: Mon, 19 Jul 2021 18:12:05 +0200
Message-ID: <20210719181205.Horde.xU8C00MIRgjqhZQ3-RrANw8@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Salah Triki <salah.triki@gmail.com>
Subject: Re: [PATCH] replace if with min
In-Reply-To: <20210712204546.GA1492390@pc>
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
Cc: herbert@gondor.apana.org.au, linux-kernel@vger.kernel.org, paulus@samba.org,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Salah Triki <salah.triki@gmail.com> a =C3=A9crit=C2=A0:

> Replace if with min in order to make code more clean.
>
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/crypto/nx/nx-842.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/crypto/nx/nx-842.c b/drivers/crypto/nx/nx-842.c
> index 2ab90ec10e61..0d1d5a463899 100644
> --- a/drivers/crypto/nx/nx-842.c
> +++ b/drivers/crypto/nx/nx-842.c
> @@ -134,8 +134,7 @@ EXPORT_SYMBOL_GPL(nx842_crypto_exit);
>  static void check_constraints(struct nx842_constraints *c)
>  {
>  	/* limit maximum, to always have enough bounce buffer to decompress */
> -	if (c->maximum > BOUNCE_BUFFER_SIZE)
> -		c->maximum =3D BOUNCE_BUFFER_SIZE;
> +	c->maximum =3D min(c->maximum, BOUNCE_BUFFER_SIZE);

For me the code is less clear with this change, and in addition it=20=20
slightly=20changes the behaviour. Before, the write was done only when=20=
=20
the=20value was changing. Now you rewrite the value always, even when it=20=
=20
doesn't=20change.

>  }
>
>  static int nx842_crypto_add_header(struct nx842_crypto_header *hdr, u8 *=
buf)
> --
> 2.25.1


