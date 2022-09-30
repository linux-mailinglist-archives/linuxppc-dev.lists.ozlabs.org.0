Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA85F14FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 23:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MfNp34Wgzz3cBk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Oct 2022 07:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PGp2WcUd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=matt@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PGp2WcUd;
	dkim-atps=neutral
X-Greylist: delayed 395 seconds by postgrey-1.36 at boromir; Fri, 30 Sep 2022 14:34:30 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mdy7B68DQz3bY3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 14:34:30 +1000 (AEST)
Received: from [192.168.14.220] (unknown [159.196.94.94])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 478B42003E;
	Fri, 30 Sep 2022 12:27:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1664512070;
	bh=r4fFhlwf0v6iaogsrq9jxyIOcDxel5IAjkgU3R5gOUM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PGp2WcUdjz179q0WCdh8XVIe7Yu9mVbPArxr8+QClmJq9/LkNAF8CMAU2NlhM1/vj
	 0HD3nDYpxUjdBoEsDuzfbI9NEuzQ+lpCdq9Yk/xYbO5g4BpdQg3H11r2cohZUoGH2B
	 gP6dy6CtWTC4nTaEoGn3rd+cHWQrkZGx6Q+mGN/irBSIQJJQOeVWhfOxgGVSDbW7GY
	 ys/Epa61u+DzSF8zNeJxQO06Ai+fUpduYKqxpY4KlcVVuHjvkCrDTAt8LQl2y0wrgY
	 0z2NP30fa3aALYMlSQNGRK1ZvRxkKF8M7YcOMQ2BN+NDYi8ERW17OjDzoGnUMeLRyh
	 lKZOt4tr9/PjQ==
Message-ID: <e7acd77abd6bc71e415672c05684a5a96a30eb00.camel@codeconstruct.com.au>
Subject: Re: [PATCH] powerpc/microwatt: Add litesd
From: Matt Johnston <matt@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 30 Sep 2022 12:27:49 +0800
In-Reply-To: <20220929022546.2730192-1-joel@jms.id.au>
References: <20220929022546.2730192-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 01 Oct 2022 07:35:42 +1000
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-09-29 at 11:55 +0930, Joel Stanley wrote:
> This is the register layout of the litesd peripheral for the fusesoc
> based Microwatt SoC.

The register layout looks right, but the upstream litemmc driver also now
needs the property

clocks =3D <&sys_clk>;

(and associated sys_clk node).

"non-removable" has a typo, though I'm not sure we want non-removable anywa=
y?
Most devices have a SD or microSD socket, and eMMC needs other driver litem=
mc
changes.

Cheers,
Matt


> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/powerpc/boot/dts/microwatt.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/=
microwatt.dts
> index b69db1d275cd..0a2e82ca1c79 100644
> --- a/arch/powerpc/boot/dts/microwatt.dts
> +++ b/arch/powerpc/boot/dts/microwatt.dts
> @@ -141,6 +141,21 @@ ethernet@8020000 {
>  			litex,slot-size =3D <0x800>;
>  			interrupts =3D <0x11 0x1>;
>  		};
> +
> +		mmc@8040000 {
> +			compatible =3D "litex,mmc";
> +			reg =3D <0x8042800 0x800
> +				0x8041000 0x800
> +				0x8040800 0x800
> +				0x8042000 0x800
> +				0x8041800 0x800>;
> +			reg-names =3D "phy", "core", "reader", "writer", "irq";
> +			bus-width =3D <4>;
> +			interrupts =3D <0x13 1>;
> +			cap-sd-highspeed;
> +			non-removeable;
> +			status =3D "disabled";
> +		};
>  	};
> =20
>  	chosen {

