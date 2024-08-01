Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4505D94503F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 18:13:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ut9hH4gH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYt01M9Tz3dRk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 02:13:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ut9hH4gH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYsJ58tRz30YZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 02:12:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C0B762908
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 16:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE88EC4AF11
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 16:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722528769;
	bh=2Ie04mSHgFdn3r8Q7k1jYkG+oGrFLofZ+lysI1ZWPOQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ut9hH4gHjPyq5vDMGhVWueCxfwZezELn8OEFXLVb/NUb5exmVb9gKIMoZpyMqS9Iu
	 fIUvQNfCd5Q3ZO6dbEIGOPwzYxrhqDav4D050DZqJNCRYzcwW+1KCwd7xnZipjNeX6
	 fza3Q6zvlmVsSbMmTNdX8++eweR2xNw2ALuzd34opRkD8oT6YaTumlXp0JPIKTJZOv
	 xdaSmnus8Iqbyz61keFQniAdw/noOBCwQHERXA9bMDGXJWy9ORHz3CK5dme8kkqeMZ
	 +/nGZwredybhVLxneYBGN24rwGIF4XasDEV/JLdp/Mm8Z3jOTDjAadJVTVls97nGx2
	 EwD6lV1UoaiSw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso115530661fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Aug 2024 09:12:49 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx+oNwo+pFHo4+le4m88ltPa4TE87+1+K/trGzfk6DaObqqnPsC
	d4zjW+vYMvHCr6QVCNK//fMF8mC17mqMrxLgDX290VtyEYHViBcx2ey37aN6AIiyzHOUH3+xVF+
	+zZHkt+t5eWg2/Iu8w9XvElqrBA==
X-Google-Smtp-Source: AGHT+IGncQu6neIyJIzYRmFRoi4mAUStoczccHBnCM7t9chOdIKJaL1uoXvQ/+Sivukw+eV00ecVLPXJOtrZ7y8gFZA=
X-Received: by 2002:a2e:8718:0:b0:2ef:21e5:1f01 with SMTP id
 38308e7fff4ca-2f15aa888ecmr5842651fa.20.1722528768109; Thu, 01 Aug 2024
 09:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240801051402.584652-1-paweldembicki@gmail.com>
In-Reply-To: <20240801051402.584652-1-paweldembicki@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 1 Aug 2024 10:12:34 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+YMHAv312PQoSCRpgGedhg3OYJnDC9=YHWg6nJkQSaLQ@mail.gmail.com>
Message-ID: <CAL_Jsq+YMHAv312PQoSCRpgGedhg3OYJnDC9=YHWg6nJkQSaLQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: dtc: update P2020RDB dts
To: Pawel Dembicki <paweldembicki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 31, 2024 at 11:14=E2=80=AFPM Pawel Dembicki <paweldembicki@gmai=
l.com> wrote:
>

On the subject, every patch is an 'update'. Please make it more
specific. If you have a hard time coming up with something specific,
that's a sign your patch is making too many separate changes.

> P2020RDB contains multiple peripherals, which isn't added to
> devicetree:
>   - Switch: Microchip VSC7385
>   - PMIC: Renesas ZL2006
>   - Temperature sensor: Analog Devices ADT7461
>   - Two eeproms: 24C256 and 24C01
>   - GPIO expander: NXP PCA9557
>   - reset gpios of Ethernet PHYs
>
> This commit adds it.
>
> Some refreshments was done:
>   - fixed link in ethernet-node
>   - platform drivers nodes names
>   - added 'gpio0' label in pq3-gpio-0.dtsi
>
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---
>  arch/powerpc/boot/dts/fsl/p2020rdb.dts    | 85 +++++++++++++++++++++--
>  arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi |  2 +-
>  2 files changed, 81 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/boot/dts/fsl/p2020rdb.dts b/arch/powerpc/boot/d=
ts/fsl/p2020rdb.dts
> index 3acd3890b397..d563d37b91f1 100644
> --- a/arch/powerpc/boot/dts/fsl/p2020rdb.dts
> +++ b/arch/powerpc/boot/dts/fsl/p2020rdb.dts
> @@ -6,6 +6,7 @@
>   */
>
>  /include/ "p2020si-pre.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>
>  / {
>         model =3D "fsl,P2020RDB";
> @@ -33,7 +34,7 @@ lbc: localbus@ffe05000 {
>                           0x1 0x0 0x0 0xffa00000 0x00040000
>                           0x2 0x0 0x0 0xffb00000 0x00020000>;
>
> -               nor@0,0 {
> +               nor@0 {

Make these clean-ups a separate patch.

>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
>                         compatible =3D "cfi-flash";
> @@ -79,7 +80,7 @@ partition@f00000 {
>                         };
>                 };
>
> -               nand@1,0 {
> +               nand@1 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
>                         compatible =3D "fsl,p2020-fcm-nand",
> @@ -128,11 +129,49 @@ partition@1100000 {
>                         };
>                 };
>
> -               L2switch@2,0 {
> +               ethernet-switch@2 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> -                       compatible =3D "vitesse-7385";
> +                       compatible =3D "vitesse,vsc7385";

There are 7 occurrences of this. Please fix them all. (And again,
separate patch).

>                         reg =3D <0x2 0x0 0x20000>;
> +                       reset-gpios =3D <&gpio0 12 GPIO_ACTIVE_LOW>;
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       label =3D "lan1";
> +                               };
> +                               port@2 {
> +                                       reg =3D <2>;
> +                                       label =3D "lan2";
> +                               };
> +                               port@3 {
> +                                       reg =3D <3>;
> +                                       label =3D "lan3";
> +                               };
> +                               port@4 {
> +                                       reg =3D <4>;
> +                                       label =3D "lan4";
> +                               };
> +                               vsc: port@6 {
> +                                       reg =3D <6>;
> +                                       label =3D "cpu";
> +                                       ethernet =3D <&enet0>;
> +                                       phy-mode =3D "rgmii";
> +                                       rx-internal-delay-ps =3D <1400>;
> +                                       tx-internal-delay-ps =3D <2000>;
> +
> +                                       fixed-link {
> +                                               speed =3D <1000>;
> +                                               full-duplex;
> +                                               pause;
> +                                       };
> +                               };
> +                       };
> +
>                 };
>
>         };
> @@ -141,12 +180,39 @@ soc: soc@ffe00000 {
>                 ranges =3D <0x0 0x0 0xffe00000 0x100000>;
>
>                 i2c@3000 {
> +                       temperature-sensor@4c {
> +                               compatible =3D "adi,adt7461";
> +                               reg =3D <0x4c>;
> +                       };
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +
>                         rtc@68 {
>                                 compatible =3D "dallas,ds1339";
>                                 reg =3D <0x68>;
>                         };
>                 };
>
> +               i2c@3100 {
> +                       pmic@11 {
> +                               compatible =3D "zl2006";

Missing vendor prefix.

> +                               reg =3D <0x11>;
> +                       };
> +
> +                       gpio@18 {
> +                               compatible =3D "nxp,pca9557";
> +                               reg =3D <0x18>;
> +                       };
> +
> +                       eeprom@52 {
> +                               compatible =3D "atmel,24c01";
> +                               reg =3D <0x52>;
> +                       };
> +               };
> +
>                 spi@7000 {
>                         flash@0 {
>                                 #address-cells =3D <1>;
> @@ -200,11 +266,15 @@ mdio@24520 {
>                         phy0: ethernet-phy@0 {
>                                 interrupts =3D <3 1 0 0>;
>                                 reg =3D <0x0>;
> +                               reset-gpios =3D <&gpio0 14 GPIO_ACTIVE_LO=
W>;
>                         };
> +
>                         phy1: ethernet-phy@1 {
>                                 interrupts =3D <3 1 0 0>;
>                                 reg =3D <0x1>;
> +                               reset-gpios =3D <&gpio0 6 GPIO_ACTIVE_LOW=
>;
>                         };
> +
>                         tbi-phy@2 {
>                                 device_type =3D "tbi-phy";
>                                 reg =3D <0x2>;
> @@ -232,8 +302,13 @@ ptp_clock@24e00 {
>                 };
>
>                 enet0: ethernet@24000 {
> -                       fixed-link =3D <1 1 1000 0 0>;
>                         phy-connection-type =3D "rgmii-id";
> +
> +                       fixed-link {
> +                               speed =3D <1000>;
> +                               full-duplex;
> +                               pause;
> +                       };
>                 };
>
>                 enet1: ethernet@25000 {
> diff --git a/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi b/arch/powerpc/boo=
t/dts/fsl/pq3-gpio-0.dtsi
> index a1b48546b02d..5181117ea6b5 100644
> --- a/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi
> @@ -32,7 +32,7 @@
>   * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>   */
>
> -gpio-controller@fc00 {
> +gpio0: gpio-controller@fc00 {
>         #gpio-cells =3D <2>;
>         compatible =3D "fsl,pq3-gpio";
>         reg =3D <0xfc00 0x100>;
> --
> 2.34.1
>
