Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 694C28D1BF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 15:01:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ICY6tl54;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpXXK1Qb7z79BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 22:54:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ICY6tl54;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 298 seconds by postgrey-1.37 at boromir; Tue, 28 May 2024 22:53:48 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpXWc0DyJz3vYM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 22:53:47 +1000 (AEST)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 12A26C5E77
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 12:48:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4721FF809;
	Tue, 28 May 2024 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716900506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLJWkJDSvhOXa3XSbG71htDtV3QhuWVrpRwUqqioGx0=;
	b=ICY6tl549JvPFPlVwt7iObOMHzhwO2lt67WGlfgFejMB/CKbBgh0rHR0kbXuCmasmx4bAF
	X/za9QNoeNAJlaHCDrzMsH+35b9WPdDGQpZ7AHVDDay3ObaxU2lQj8Dc3JH6fJmX8qW8AJ
	h3HlXE4vvI9RI8NreTXfiU6d/1ZwADbZKLSNSjlRvrrin8YNfItjGk5eWQDCAHal0Iv9pC
	hjiVU6v+VeEwDNHxhfAKOnjCN4Xs62Z9A/i2yii7l2bdqsNKzLNC/rWvHIzZEE6Qna5ZTq
	UxnZB3XMLJO/2rXiu8CDVjQM98YnjqCKGP+MsBKcRMAxwH4LXtfx/AuUo9IPpQ==
Date: Tue, 28 May 2024 14:48:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Esben Haabendal <esben@geanix.com>
Subject: Re: [PATCH v2 1/2] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
Message-ID: <20240528144823.2ec929f6@xps-13>
In-Reply-To: <20240528-fsl-ifc-config-v2-1-5fd7be76650d@geanix.com>
References: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
	<20240528-fsl-ifc-config-v2-1-5fd7be76650d@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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
Cc: Michael Walle <mwalle@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Pratyush Yadav <pratyush@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Esben,

esben@geanix.com wrote on Tue, 28 May 2024 14:28:52 +0200:

> While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
> driver selects FSL_IFC automatically, we need the CONFIG_FSL_IFC option to
> be selectable for platforms using fsl_ifc with NOR flash.
>=20
> Fixes: ea0c0ad6b6eb ("memory: Enable compile testing for most of the driv=
ers")
> Signed-off-by: Esben Haabendal <esben@geanix.com>

Looks good to me.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
