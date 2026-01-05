Return-Path: <linuxppc-dev+bounces-15263-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1799CF37C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 13:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlCzp4b0tz2yK7;
	Mon, 05 Jan 2026 23:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767615606;
	cv=none; b=Q3Tgrk4deeYsLFgKyORI3CzE5B95Q8sXlXVKF+9E+MaXejx0BDhNrLTgmHz5YO3v/nFmnD14cPEx2o+qziDFpEc4zfEB+5x5IO7SPeBQdBiLzlhmKHaAIXswhpF10Qa/fy1rjuoGmh6TQqrYmPJXnM/NLfo74BugjewcuPhewNjGseLMianl42LdgdxkHHPyDM0tn82jK7EyQ7UTWFb1LV9yk6R9BpvRJbGFnO2aUyAusiNyO9vASTPAF0gJitcsUI4CgI0V+mAlsBfMMc3eD/MqsvQvA3IMQvTamJUHGYVdzLAiKx+DcrRgoxhFK9tlDa0oTDMsCpwddc/fVX79SA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767615606; c=relaxed/relaxed;
	bh=m5LYmxF46So4teTC+/oCRVtVgBkfT7UaMLi9v+OV7s4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GyZkicBHZnFfsFXnvz5Drw0oSn5q44BvSDDvrj44XGuHYctPuG1xFmTPTnV6PPBUVin2zWXaweOkSCEX2TmTQSgUs0pzRkzQZZU7g4B1ZdfoN3o8Lgs2iI+RwzNm8dM+mSIXGv2E6zjXFVQiDibwo4PRz6gBSW08EXcaxnx7P35mYzmHeUWpLqqrQM7SwgJjhMyzpaeEFbgTB8HCsfdhaIBSsDF3S1j8xIqjFgiLFDWYs4dMMb9xuBjeTkJuHcckh+QmOlMBesEmT1UzK7YFnyDM7qCwLc8ZCKTFuPBYrqOm9BwOWv0aEfVS/AiXuOZSX0YMe7wg4CcpZFrKLEiecA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hDaCXN/Q; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hDaCXN/Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 534 seconds by postgrey-1.37 at boromir; Mon, 05 Jan 2026 23:20:04 AEDT
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlCzm4YpHz2yFW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 23:20:03 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A02171A265C;
	Mon,  5 Jan 2026 12:11:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B4EC60726;
	Mon,  5 Jan 2026 12:11:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD090103C84E1;
	Mon,  5 Jan 2026 13:10:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767615061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m5LYmxF46So4teTC+/oCRVtVgBkfT7UaMLi9v+OV7s4=;
	b=hDaCXN/QDa3HyGkKumXh/rRN3I3owCmfG7llh88Kw+9vkZSCIlHM9BnDzCteX2UMLY3HvT
	Uq013YD+P0GDQOrhbw0cpfNAsNpgwv/1q7t5uwXkhDQ2cWj103bR5zDqIUvjjIU4xmZR0e
	1/6vkwmaJBNF9TS1jFUu8cn0lBHxXMRJvrqZ8a8o6SnUuucQkAe0zqAwKNp2pybs1Dmu7R
	u1KhCWWFUw0JBcOLS3+WIdByDf/vgZGAXSwMtGcumAzoevI1F5OCJIIA3DAOGGFiLRs2k6
	UU9iXegSZfu/qDYIk/iFHlridOzNdeeDpsEo7EbnZwUYesM+Rh8RKJfsgRBGZw==
Date: Mon, 5 Jan 2026 13:10:56 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: Simplify with scoped for each OF child
 loop
Message-ID: <20260105131056.391904af@bootlin.com>
In-Reply-To: <20260102124754.64122-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124754.64122-2-krzysztof.kozlowski@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Krzysztof,

On Fri,  2 Jan 2026 13:47:55 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/soc/fsl/qe/qmc.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)

Thanks for the patch.

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

