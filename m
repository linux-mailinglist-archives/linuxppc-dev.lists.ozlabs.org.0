Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB6C926DCB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 05:02:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qEQFNE4Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WF1dl54hBz3fR8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 13:02:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qEQFNE4Z;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WF1d06p2Kz3c3H
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 13:01:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720062084;
	bh=08bw283wAwwr7luwSNsiMYD2RxYSDrVcyBFIdCUHTU8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qEQFNE4ZqbatHG2jCgJfbvRT5U3MXjSgFcHdWNSExucDaO+xTC6ajCfjBQBEh473K
	 o2ZiYZJ8Rcl7M4mmZMjT060YP63n6pT9gAQqS1a+3tAhMZBvcofU1I3XfJRyQ8Kr06
	 VwakH1YG7yl/sE3O39PqgWemBmuNi1Ri3bJt6JUUElW1MniL3EZlOh/qb1GFPOLAVf
	 CSUZLFfMv9B8v2EyPWKYQ9Il5h4kVXOjojbGmLowuHzTqJSr59FalJWTAirwvAaOPt
	 pshF6wQSVXuv9T6y0efx70UDLkYWE5Lzg0I3wSVzCH8MiY3/ZPDRMlIxHmAm+1dai+
	 CfurPAaIQYHKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WF1cy0mGQz4wxs;
	Thu,  4 Jul 2024 13:01:22 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mark Brown <broonie@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 07/10] soc: fsl: cpm1: qmc: Introduce functions to
 get a channel from a phandle list
In-Reply-To: <a8c44188-d5d8-445d-9d64-bbfce6b1b628@sirena.org.uk>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
 <20240701113038.55144-8-herve.codina@bootlin.com>
 <a8c44188-d5d8-445d-9d64-bbfce6b1b628@sirena.org.uk>
Date: Thu, 04 Jul 2024 13:01:21 +1000
Message-ID: <87a5ixkghq.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, devicetree@vger.kernel.org, linux-sound@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark Brown <broonie@kernel.org> writes:
> On Mon, Jul 01, 2024 at 01:30:34PM +0200, Herve Codina wrote:
>> qmc_chan_get_byphandle() and the resource managed version retrieve a
>> channel from a simple phandle.
>> 
>> Extend the API and introduce qmc_chan_get_byphandles_index() and the
>> resource managed version in order to retrieve a channel from a phandle
>> list using the provided index to identify the phandle in the list.
>
> These two PowerPC patches seem trivial enough and have got no response,
> unless someone objects I'll go ahead and apply them.

Ack.

MAINTAINERS says:

FREESCALE QUICC ENGINE LIBRARY
M:      Qiang Zhao <qiang.zhao@nxp.com>
L:      linuxppc-dev@lists.ozlabs.org
S:      Maintained
F:      drivers/soc/fsl/qe/
F:      include/soc/fsl/qe/

But I see no email from that address since January 2021:

  https://lore.kernel.org/all/?q=f%3Aqiang.zhao%40nxp.com

And actually drivers/soc/fsl was marked orphan in April, maybe this
should be also.

Or does Herve want to take over maintaining it?

cheers
