Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B414718DFC5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 12:24:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kywT0v5KzDqss
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 22:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mansr.com (client-ip=81.2.72.234; helo=unicorn.mansr.com;
 envelope-from=mans@mansr.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mansr.com
X-Greylist: delayed 590 seconds by postgrey-1.36 at bilbo;
 Sat, 21 Mar 2020 22:21:37 AEDT
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kyrx62YhzDsxF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 22:21:37 +1100 (AEDT)
Received: by unicorn.mansr.com (Postfix, from userid 51770)
 id 9E2B015605; Sat, 21 Mar 2020 11:11:41 +0000 (GMT)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 07/10] ARM: dts: tango4: Make /serial compatible with
 ns16550a
References: <20200320174107.29406-1-lkundrak@v3.sk>
 <20200320174107.29406-8-lkundrak@v3.sk>
Date: Sat, 21 Mar 2020 11:11:41 +0000
In-Reply-To: <20200320174107.29406-8-lkundrak@v3.sk> (Lubomir Rintel's message
 of "Fri, 20 Mar 2020 18:41:04 +0100")
Message-ID: <yw1xd096hsia.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-serial@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lubomir Rintel <lkundrak@v3.sk> writes:

> ralink,rt2880-uart is compatible with ns16550a and all other
> instances of RT2880 UART nodes include it in the compatible property.
> Add it also here, to make the binding schema simpler.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Acked-by: Mans Rullgard <mans@mansr.com>

> ---
>  arch/arm/boot/dts/tango4-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/tango4-common.dtsi b/arch/arm/boot/dts/tan=
go4-common.dtsi
> index ff72a8efb73d0..54fd522badfc9 100644
> --- a/arch/arm/boot/dts/tango4-common.dtsi
> +++ b/arch/arm/boot/dts/tango4-common.dtsi
> @@ -85,7 +85,7 @@ tick-counter@10048 {
>  		};
>
>  		uart: serial@10700 {
> -			compatible =3D "ralink,rt2880-uart";
> +			compatible =3D "ralink,rt2880-uart", "ns16550a";
>  			reg =3D <0x10700 0x30>;
>  			interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-frequency =3D <7372800>;
> --=20
> 2.25.1
>

--=20
M=E5ns Rullg=E5rd
