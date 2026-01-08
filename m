Return-Path: <linuxppc-dev+bounces-15427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F97D05FEE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 21:10:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnGHQ5llMz2yFk;
	Fri, 09 Jan 2026 07:10:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767903042;
	cv=none; b=Tu/pHNBjmvbT9tdMU+5k0wiY78LA57orB6hDBfFXZ0wmaR6Io9529ghL3HBqb8+eNJrkAWPomk6B+1y8ZR+f37oZOJuhWjJTrh43so7xUVGDsIaL+zBZGpMUrA8l7sekLF0ntrqoJeUM1entKfgE0kblmd/zG0b+ZivOZHd5PksFh8ijsydrXc9yYID9uWc8hRXkwy9eLyS48OSvimZuAriU5TSHbCbTwqkPon621E5OkN/82S1nzZLMqdZl18B9XkwciUM6/7GLV9ywVZPeK5vtTcTEB4ceX3d2HEHL7adc6NPWNSkackFCB/pUEhHMEO+yYufAhpgUng8Pf99fpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767903042; c=relaxed/relaxed;
	bh=nvh6vFDxnLLRCkd44oRBGvN0fikzmU6YF3y7N7iZ7UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIfCEehvjYFBXBuoh+ekOqE1tL6FDOGfe0aej4cY2APrFZLz4MiW8dhzgz1QGgPgkvbEiZNWBVVSKc/HIiUIuVmDBISks7442GsZnI6bDUyY2P8GBrge8SF8U7k9Fl02SGfMOrVWyVDg04tjSoSuI1JEC24hhPUatKHD59H9Nr/HRpP1WdMATjF9hyk/S98Ia8KxBMPGBPBwJiMPCT3l9mtd5h9DpPndkCsVSpu+AOvXxxhk56EtIeGWX6NZSaKJsiTjf0IMNZ6Olo++2u5WzUU2UXGBq6b/7ZhW/8byuhM5iR1CpwOVvZR3K9WAP+02D4GyOIpsVKpdG0oOIzHcuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VnwMcz3m; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VnwMcz3m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnGHP6Jszz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 07:10:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13CFD419FF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jan 2026 20:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C50C16AAE
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jan 2026 20:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767903007;
	bh=twpVp3jzla1rgtXT0dqZxOaRWr0DQx/Arkcq8HDQVLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VnwMcz3m353GwyoCTBKxBkVqCsz3Qyd0uSYsbWpDabDqf5AqP9r1elUwhLSdpimgF
	 /Rs5ht8zVQRuPCDLVhu77WN3AiR93RdFEwytWXd1JpW+2TwCP+xOAS+kMCOTtqK2Rn
	 HievxgxzcNRqVcdkRLFo92uiP7ZN/k6xEafj6J+H/SGKsZldl3oieqEvBK9AM/4iIc
	 lk2zXYSLdvm0kneB6qP7mbG6vm/W/4YFaKTH9R1sMpEhb2BjNrycunk6usFUdsJLMD
	 pE+dpbfLdoMvDsUVsmyvWMEOFCI1/B5ud+4RW2yPEMkO0nOmwiiL8ND2WkNbWPElBh
	 CWb2EW0GVRf3Q==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b843d418e37so391024366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 12:10:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQb4mtvC/nqOEf+2O1wlwkXOz3lkZaM4gGhHXwkiJyUl2Ouw2NNdxt3TrRLM6TEc21j0O6IJ6sUf4F1oE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywhx+qathKxg4ZhxM4YvMJaeqSep4rmHkYm9qSgHbbjMQi9iDV7
	utIDOGvtgQ5yt3niSYCyb5XEVpV0SSQxKWV7GWNQGOPvT6stlo7YbO76gO2Qpw7NLin3JIHr6sI
	Ht12t4Wfuy9JU3Gcdf6O5cYf2Y761eA==
X-Google-Smtp-Source: AGHT+IEWcso0Tnf8qe72vO8BkFVooAKgs1PSHRAVZTJGZfHsd5GMBoa4Ex7+q1SOboQ2YL+MeIVhXMxTH82k0CgWVFM=
X-Received: by 2002:a17:907:1b08:b0:b80:344b:421a with SMTP id
 a640c23a62f3a-b8444f43f86mr807433766b.18.1767903006462; Thu, 08 Jan 2026
 12:10:06 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
 <7708243d6cca21004de8b3da87369c06dbee3848.1767804922.git.chleroy@kernel.org>
 <20260108190203.GA780464-robh@kernel.org> <8a8c8a31-ebe8-48cb-9836-c69c6d65a545@kernel.org>
In-Reply-To: <8a8c8a31-ebe8-48cb-9836-c69c6d65a545@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Jan 2026 14:09:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLTPOFve5v-V2mmoSqiO9+Woh9vhq4Kof7pMtuVFp2C+g@mail.gmail.com>
X-Gm-Features: AQt7F2r6GjuLRCY1szfRMCPd1iuSpzfSLJ-3dWB8YNgbFdjDgn4XP8KB1EDvxjE
Message-ID: <CAL_JsqLTPOFve5v-V2mmoSqiO9+Woh9vhq4Kof7pMtuVFp2C+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 8, 2026 at 1:44=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 08/01/2026 =C3=A0 20:02, Rob Herring a =C3=A9crit :
> > On Wed, Jan 07, 2026 at 05:59:10PM +0100, Christophe Leroy (CS GROUP) w=
rote:
> >> The QUICC Engine provides interrupts for a few I/O ports. This is
> >> handled via a separate interrupt ID and managed via a triplet of
> >> dedicated registers hosted by the SoC.
> >>
> >> Implement an interrupt driver for it so that those IRQs can then
> >> be linked to the related GPIOs.
> >>
> >> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Already? On a v1?
>
> This is extracted from a previous series, here:
> https://lore.kernel.org/all/67987bbf42344398709949cb53e3e8415260ec09.1758=
212309.git.christophe.leroy@csgroup.eu/
>
> Should I have called it v7 even if it is only a small part of the
> initial series ?

Probably. Otherwise, b4 might think v6 is newer.

Regardless, the history matters.

>
> Ack is here:
> https://lore.kernel.org/all/20250818-babbling-studio-81a974afc169@spud/
>
> >
> >> ---
> >>   .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 51 +++++++++++++++++=
++
> >>   1 file changed, 51 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/=
fsl,qe-ports-ic.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-p=
orts-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-port=
s-ic.yaml
> >> new file mode 100644
> >> index 0000000000000..1f3c652b1569d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic=
.yaml
> >> @@ -0,0 +1,51 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%2Fdevicetree.org%2Fschemas%2Fsoc%2Ffsl%2Fcpm_qe%2Ffsl%2Cqe-ports-ic.yaml%2=
3&data=3D05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6e4c1b33836d4443b5c608de=
4ee86aff%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639034957294961534%7C=
Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa=
W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DmH5SPbAw48C6BG=
cazDPJMtoiM71TXswUGBvSZf15dUQ%3D&reserved=3D0
> >> +$schema: https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3=
A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C02%7Cchrist=
ophe.leroy%40csgroup.eu%7C6e4c1b33836d4443b5c608de4ee86aff%7C8b87af7d86474d=
c78df45f69a2011bb5%7C0%7C0%7C639034957294990994%7CUnknown%7CTWFpbGZsb3d8eyJ=
FbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIl=
dUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DRhD807Jcx3MerOAXGWuwgwHkATpTzTkDIQC7lO3=
t1AA%3D&reserved=3D0
> >> +
> >> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
> >> +
> >> +maintainers:
> >> +  - Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - fsl,mpc8323-qe-ports-ic
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupt-controller: true
> >> +
> >> +  '#address-cells':
> >> +    const: 0
> >> +
> >> +  '#interrupt-cells':
> >> +    const: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupt-controller
> >> +  - '#address-cells'
> >> +  - '#interrupt-cells'
> >> +  - interrupts
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    interrupt-controller@c00 {
> >> +      compatible =3D "fsl,mpc8323-qe-ports-ic";
> >> +      reg =3D <0xc00 0x18>;
> >> +      interrupt-controller;
> >> +      #address-cells =3D <0>;
> >> +      #interrupt-cells =3D <1>;
> >> +      interrupts =3D <74 0x8>;
> >> +      interrupt-parent =3D <&ipic>;
> >
> > This doesn't look like a separate block, but just part of its parent. S=
o
> > just add interrupt-controller/#interrupt-cells to the parent.
>
> I don't understand what you mean, can you explain with the extract below =
?
>
> Extract from device tree including the parent:
>
>         soc8321@b0000000 {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
>                 device_type =3D "soc";
>                 compatible =3D "simple-bus";
>                 ranges =3D <0x0 0xb0000000 0x00100000>;
>                 reg =3D <0xb0000000 0x00000200>;
>                 bus-frequency =3D <0>;
>
>                 ipic:pic@700 {
>                         interrupt-controller;
>                         #address-cells =3D <0>;
>                         #interrupt-cells =3D <2>;
>                         reg =3D <0x700 0x100>;
>                         device_type =3D "ipic";
>                 };
>
>                 qepic:interrupt-controller@c00 {
>                         compatible =3D "fsl,mpc8323-qe-ports-ic";
>                         reg =3D <0xc00 0x18>;
>                         interrupt-controller;
>                         #address-cells =3D <0>;
>                         #interrupt-cells =3D <1>;
>                         interrupts =3D <74 0x8>;
>                         interrupt-parent =3D <&ipic>;

There's not some overall QuiccEngine node/device? I guess that's
qe@e0100000, so this is outside of it and is fine. Just move it to
bindings/interrupt-controller/ since it is not part of anything else.

Rob

