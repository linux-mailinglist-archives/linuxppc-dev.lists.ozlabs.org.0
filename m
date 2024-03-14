Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41587BB8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 11:51:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EwLkY4XJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwPMP5mTpz3dng
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 21:51:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EwLkY4XJ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwPLd6hX5z3d4L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 21:51:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710413464;
	bh=DRdiHGqYqxjEF8hsA5ZH+kEbHXJ9gHLyaDJurUBUBU8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EwLkY4XJ/XL6m9O01lkeRqb+bFGM+QvljzvF4nbDCTUEioyZoYoIMNbpMjw/ibU28
	 UaZLGEMxbKyyHXpBTLDqSOa9gMjkeg2wXcWsO6hB8FLPuII9r/uZvQoQ0axiGR9ZjI
	 OJoivYUdbYAy72HQQGSNAgfMInJNDl8EOWJ+HVA5xsz7/fbUPckzgw0OYMh8LYCfrh
	 AHfU/K+/T+ds+0JQChBbJxC55hFG5D9mFQW1g+NpydlfUrwdlDsmwljjoxuLlD129X
	 mFlBgg//ha/jnCRFFGrUoPpkT996Tpp2gKmcMniglSQgR/+XtpLQBEQyF4GYKAqh/K
	 6sl4QGJjol9Vw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TwPLZ4lVKz4wnr;
	Thu, 14 Mar 2024 21:51:02 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 1/5] net: wan: Add support for QMC HDLC
In-Reply-To: <20240314081200.5af62fab@bootlin.com>
References: <20240307113909.227375-1-herve.codina@bootlin.com>
 <20240307113909.227375-2-herve.codina@bootlin.com>
 <87ttl93f7i.fsf@mail.lhotse> <20240314081200.5af62fab@bootlin.com>
Date: Thu, 14 Mar 2024 21:51:01 +1100
Message-ID: <87r0gd2iju.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Ratheesh Kannoth <rkannoth@marvell.com>, Yury Norov <yury.norov@gmail.com>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Herve Codina <herve.codina@bootlin.com> writes:
> Hi Michael,
>
> On Thu, 14 Mar 2024 10:05:37 +1100
> Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>> Hi Herve,
>>=20
>> Herve Codina <herve.codina@bootlin.com> writes:
> ..
>> This breaks when building as a module (eg. ppc32_allmodconfig):
>>=20
>>   In file included from ../include/linux/device/driver.h:21,
>>                    from ../include/linux/device.h:32,
>>                    from ../include/linux/dma-mapping.h:8,
>>                    from ../drivers/net/wan/fsl_qmc_hdlc.c:13:
>>   ../drivers/net/wan/fsl_qmc_hdlc.c:405:25: error: =E2=80=98qmc_hdlc_dri=
ver=E2=80=99 undeclared here (not in a function); did you mean =E2=80=98qmc=
_hdlc_probe=E2=80=99?
>>     405 | MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);
>>         |                         ^~~~~~~~~~~~~~~
>>=20
>>=20
>> IIUIC it should be pointing to the table, not the driver, so:
>>=20
>> diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hd=
lc.c
>> index 5fd7ed325f5b..705c3681fb92 100644
>> --- a/drivers/net/wan/fsl_qmc_hdlc.c
>> +++ b/drivers/net/wan/fsl_qmc_hdlc.c
>> @@ -402,7 +402,7 @@ static const struct of_device_id qmc_hdlc_id_table[]=
 =3D {
>>         { .compatible =3D "fsl,qmc-hdlc" },
>>         {} /* sentinel */
>>  };
>> -MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);
>> +MODULE_DEVICE_TABLE(of, qmc_hdlc_id_table);
>>=20
>>  static struct platform_driver qmc_hdlc_driver =3D {
>>         .driver =3D {
>>=20
>>=20
>> Which then builds correctly.
>
> My bad, I missed that one.
> I fully agree with your modification.
>
> Do you want me to make a patch (copy/paste of your proposed modification)
> or do you plan to send the patch on your side ?

Yes if you can please turn it into a proper patch and submit it.

No need to add my SoB, it's trivial.

cheers
