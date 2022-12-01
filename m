Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3EE63EE14
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 11:40:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNCKK0j5cz3bb3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 21:40:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mtH77xWq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNCJP0L9Xz30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 21:40:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mtH77xWq;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NNCJN4W7qz4xFy;
	Thu,  1 Dec 2022 21:40:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669891204;
	bh=KTDVN/7lIjIrER/XXkOz9H8eWtf2nxvkUgRAGM5il/U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mtH77xWqReqw3bUURmWOaOMUgI1fnhJeqxa/jFrTE2AiPxZgRHJOdcrEogd7m6t+K
	 hSD5E6U7i+ckFXkoXJyBCf9GV9mhqfTh6a2EhgZiI/SRGv0KENZChmJYXHVWQJ6yRk
	 6YrETuvLSFH3GLBrIHlAqPWESejuap3arDVMjfILKy+BGr1aGCqxlVdA7HLC4kSTkB
	 h2Fc1q1HQQmg4WuwySsEcmNguqQitD5GKa/mEHq6/vneU8YBjQFOfp9St3mhaor2x1
	 6DM3kpUr8F1g1c/fjGREENP6GL+7W1pjUv9OMijMtZXQ/VLwrb7rHigKdo6xpjkop7
	 l5PmypY+0tAfg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Pali
 =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>
Subject: Re: [PATCH 5/5] powerpc: dts: remove label = "cpu" from DSA dt-binding
In-Reply-To: <20221130141040.32447-6-arinc.unal@arinc9.com>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-6-arinc.unal@arinc9.com>
Date: Thu, 01 Dec 2022 21:40:03 +1100
Message-ID: <87a647s8zg.fsf@mpe.ellerman.id.au>
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com> writes:
> This is not used by the DSA dt-binding, so remove it from all devicetrees.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/powerpc/boot/dts/turris1x.dts | 2 --
>  1 file changed, 2 deletions(-)

Adding Pali to Cc.

These were only recently updated in commit:

  8bf056f57f1d ("powerpc: dts: turris1x.dts: Fix labels in DSA cpu port nod=
es")

Which said:

  DSA cpu port node has to be marked with "cpu" label.

But if the binding doesn't use them then I'm confused why they needed to
be updated.

cheers


> diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/t=
urris1x.dts
> index 045af668e928..3841c8d96d00 100644
> --- a/arch/powerpc/boot/dts/turris1x.dts
> +++ b/arch/powerpc/boot/dts/turris1x.dts
> @@ -147,7 +147,6 @@ ports {
>=20=20
>  					port@0 {
>  						reg =3D <0>;
> -						label =3D "cpu";
>  						ethernet =3D <&enet1>;
>  						phy-mode =3D "rgmii-id";
>=20=20
> @@ -184,7 +183,6 @@ port@5 {
>=20=20
>  					port@6 {
>  						reg =3D <6>;
> -						label =3D "cpu";
>  						ethernet =3D <&enet0>;
>  						phy-mode =3D "rgmii-id";
>=20=20
> --=20
> 2.34.1
