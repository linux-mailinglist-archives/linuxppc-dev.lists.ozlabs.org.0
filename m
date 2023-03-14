Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4936B8C52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 08:58:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbQrc512nz3ccl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 18:58:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=RG3+iLr/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=RG3+iLr/;
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbQqh1Dd0z3bym
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 18:57:48 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4461B1C000A;
	Tue, 14 Mar 2023 07:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678780664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rV/48DFH0VRtT8styWUtBxfjMGT8+CfYXF8J4C5hkDc=;
	b=RG3+iLr/iC05m99Svg5Uu2IkjXiuvdGWcpm6yDSeZEWm+E5c0c3WUExdpe20VHpuyw7oRp
	sR1TnJ7M9s9WS9jFpzOPPVfWvKEHVUaZefl982MrSxEHgN/noBm3HP/EKnAzwXK13/YiD9
	htDf5t1pzBEvhdUHYJJWYl+7x/8c2A6+ouv9VE2jFcdR8IrigfdrlZA5DuLECwtItfy6P9
	LqJC9W/6/pl9gV4fUjwbS9UV4zalfIHL3C4uMBN2hRcsBoj7+M4Ijl37sIkodESZtuHfHH
	xQZ4joqYKs6UefCIYMfSwyBVPTrLf5TvciPH8/oHYpCcqtkroJROuF++5bmMww==
Date: Tue, 14 Mar 2023 08:57:41 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: Question about the dependency on the config SOC_FSL in CPM_QMC
Message-ID: <20230314085741.6f968e68@bootlin.com>
In-Reply-To: <CAKXUXMwwQuwssyzBrOXHOz__YRpa1Rjgqmwn5rRFjDVLBbabPA@mail.gmail.com>
References: <CAKXUXMwwQuwssyzBrOXHOz__YRpa1Rjgqmwn5rRFjDVLBbabPA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Lukas,

On Tue, 14 Mar 2023 08:21:50 +0100
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Dear Herve,
>=20
> In your patch below, you added the config CPM_QMC which depends on the
> non-existing config SOC_FSL:
>=20
> https://lore.kernel.org/r/20230217145645.1768659-7-herve.codina@bootlin.c=
om
>=20
> Up to my knowledge, the config SOC_FSL never existed in the mainline
> tree. Is this dependency really required or can the expression simply
> be reduced to COMPILE_TEST and we drop the dependency to SOC_FSL?
>=20
> Note: This patch has now shown up in linux-next with commit
> 3178d58e0b97. Currently, it would not be possible to compile test this
> driver, as the dependency on SOC_FSL is never met.
>=20
>=20
> Best regards,
>=20
> Lukas

My bad :(

The dependency must be FSL_SOC instead of SOC_FSL.
I mean:
diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index f90cfdf0c763..7268c2fbcbc1 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -47,7 +47,7 @@ config CPM_TSA
 config CPM_QMC
        tristate "CPM QMC support"
        depends on OF && HAS_IOMEM
-       depends on CPM1 || (SOC_FSL && COMPILE_TEST)
+       depends on CPM1 || (FSL_SOC && COMPILE_TEST)
        depends on CPM_TSA
        help
          Freescale CPM QUICC Multichannel Controller



--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
