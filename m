Return-Path: <linuxppc-dev+bounces-981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3396BA13
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 13:19:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzKkl0Dhlz2yNJ;
	Wed,  4 Sep 2024 21:19:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.196
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725438803;
	cv=none; b=L/HVqwECQuvaCmr/W496d3ixXOvJ2t+/cC0b+I131DEaWsDSPNF0rKNomR177l0KBT96yJCUduGK9PgaFyohe2+yHjwNd7VrPNii8UGnRe6sh0UYbSj0n/E9F/R53lbr2LNU/sTCWNbS0Bu3TWDvLX5SK+jEmmH23m5Vo2ShAnpAgz3sMXTbnnAxm0n4MDTMEID9x7ljyaxvArQxoUIOSh+gV0tIlgpPYinbtLGCvjaSf5KJOnnRkz9h637ZV9vlEEfC+SmoRS2+tItOmPyhgtCNFGfXBDTdrGOqM0Kk3ocGeNzAcpyiu7WtcWEJ2vd5vEPPmBnxlXwj91kA5Udogg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725438803; c=relaxed/relaxed;
	bh=TUGv9wHevgRZb5cc15QcdSSIcNgojKzy+jo82zKMyNc=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type; b=lh+zabOitPr8M3RG4oZYGcJFAD5ghGZvqUxrRIuSFuNnCpeaG5XqJ2YY+xV0tpBBC+hqmN/LCTwkIqYrymarJKC/C9sU2OgV1Fe2EE4twcBZyby2XKHS7YQQfLGZfrAUo9xEGUbZ4UFY/y8g/FVm86JSKrUctnYJUhSw9h3soxhd1D2v+Fo4sbVawlxAUYjncPaVtU07AqASe0oT8uIx7pHvIqv64kyYTRi9a1n8OZMzj0ZqbKfTMT081KyQEh7+0HRoALUWPBJZ9D7jWFzjDG7JkM01nTsdGoZNnXOCRvNv1MJrD+PJ6gSKENnrfp8tBB5tXQQz5iF/x9+aXpm1vQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=eGVbKqY1; dkim-atps=neutral; spf=pass (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=eGVbKqY1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzG3Q5pxrz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:33:21 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A26AE0002;
	Wed,  4 Sep 2024 08:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725438797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TUGv9wHevgRZb5cc15QcdSSIcNgojKzy+jo82zKMyNc=;
	b=eGVbKqY1J+/gbeDzfyyEbvjwQtZ/8Gz6/IvBdLy9Z7ZMyo/3mmyPyiQYv+f7P0fCtK50AL
	ji6uVTvvZ8lZPOjkb8l9US43KD7pugQf+XszbkD2i73SKjZsy3DIuETg2t0ry/4CmFyQRq
	aOFJl1rYEQ3v4xXsLClVU/Qvev41Dklh/Zi7lJl31HcrTz9tytd8d6xGS2rUP1ZqajP2bP
	czUUX6rmfRRlnk7QK5ndVnndzHCG2v0w4xvzSNJzEKvAxI3EfD6Wd45jS1B6dIAXe0o+Aj
	g7IO5Tmm9H9cc91OU5zUkSkwPBLhf97o6taIa+QkbuBk5rx5j7h86NNoZgq6AQ==
Date: Wed, 4 Sep 2024 10:33:13 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>
Subject: Re: [PATCH] soc: fsl: cpm1: qmc: Fix dependency on fsl_soc.h
Message-ID: <20240904103313.21aed2de@bootlin.com>
In-Reply-To: <fcca0369d0bcd527aa77bccdfc0894faa029cead.1725431771.git.christophe.leroy@csgroup.eu>
References: <fcca0369d0bcd527aa77bccdfc0894faa029cead.1725431771.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Christophe,

On Wed,  4 Sep 2024 09:51:09 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> QMC driver requires fsl_soc.h to use function get_immrbase().
> This header is provided by powerpc architecture and the functions
> it declares are defined only when FSL_SOC is selected.
> 
> Today the dependency is the following:
> 
> 	depends on CPM1 || QUICC_ENGINE || \
> 		   (FSL_SOC && (CPM || QUICC_ENGINE) && COMPILE_TEST)
> 
> This dependency tentatively ensure that FSL_SOC is there when doing a
> COMPILE_TEST.
> 
> CPM1 is only selected by PPC_8xx and cannot be selected manually.
> CPM1 selects FSL_SOC
> 
> QUICC_ENGINE on the other hand can be selected by ARM or ARM64 which
> doesn't select FSL_SOC. QUICC_ENGINE can also be selected with just
> COMPILE_TEST.
> 
> It is therefore possible to end up with CPM_QMC selected
> without FSL_SOC.
> 
> So fix it by making it depend on FSL_SOC at all time.
> 
> The rest of the above dependency is the same as the one for CPM_TSA on
> which CPM_QMC also depends, so it can go away, leaving only a simple
> dependency on FSL_SOC.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/lkml/20240904104859.020fe3a9@canb.auug.org.au/
> Fixes: 8655b76b7004 ("soc: fsl: cpm1: qmc: Handle QUICC Engine (QE) soft-qmc firmware")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks for this patch!

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

