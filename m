Return-Path: <linuxppc-dev+bounces-6940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BCAA5E767
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 23:27:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZClcJ0QjGz30WB;
	Thu, 13 Mar 2025 09:27:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c01:e000:3a1::42"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741818431;
	cv=none; b=YNLY7NIY9xgl4G3uaBDg5Qu+tj0WzwFw0pUeRCbNbWt/Ei4cAIvITlln2murNjfoeuwps+FBY1OagBh78ZtwC5bGD+5vHRRfJ4GQWdBT6Cd5RXVtZp6sN1Uz+j/s9ZMmaOy6GU4W4e9YZtQFUpYaus5e4maQIYTk0DnhlLrGPNCTs9NLG+ZXAvlL6GoxNcCAWuBGYpi5Ribk0kD+M645EKfB3ORrfzrdKk5hnns1zWp3jm7zfpqpkFmVzBai1ugZB/vNo+Nli6nBeuKm01YmeiTwUa2MeUKUWVzyh2I1RIMFcBqqWw58sSBXlk63NiOXyGrz/TPP0KFHpFaB0G15zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741818431; c=relaxed/relaxed;
	bh=xxL+8LhuOi8qnd+QuZQR12PXYmDYb9P5KqJMdTOYUKE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MK4yYw9IciJlabDtUxMj+QLmuAf98zuM2GMa4A8mrYxNxux0OqqiZiqULyUs0jS0pGn/va7H8nC6DwUezIj0x3v2nsLIdEYzGpZdqMG7b72DmIDxcEyNz/lPwo1cEsXO1mplTToj9aLYFx5eyJlNLt0jSN2rFsbdOkWVu7rBmUshaXbCo2nM+ks1hAtAwf63dpgwWl+BabobspuathIwU3jZ4kdsfNnaemE5Tl8rK9zjmYxeahQuRz9TmTHjlkR+37f313x6H+QE6bxHOWSqTV7bDpssdpRGA6OudxWsl+RdurRLZpJn1OGo/0Pgh2kFDY+C+f//dSGC6q4gqjchSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net; dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=gkKBvUrz; dkim-atps=neutral; spf=pass (client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org) smtp.mailfrom=lwn.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=gkKBvUrz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net (client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org)
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZClcB4HqTz30TQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 09:27:05 +1100 (AEDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4161B41063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1741818422; bh=xxL+8LhuOi8qnd+QuZQR12PXYmDYb9P5KqJMdTOYUKE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gkKBvUrzAdgZpOrEyPfR+tfKJp4wUVN6qmteR+rppA7xW2Mfrdtzhsr7KXcRDDvIJ
	 D7t4rQk3Ow5T9mlJyJ2gYn80COIIqRP2sTWx+LFeTdziVKl/lsBh0T0e1CoxQklrO9
	 sG1X60emZSrrQ5+HIkl+GOwobgFhaViA/ooxOMAEeAXeZT80OIYehoL7BMxRF/63v9
	 FOrZ+NR9xPkAhmgzkD9nz8EwRnHPfsVkXR2FLQB0DPcYaCEdQ5kehdgQ9FQHda6D16
	 B6v6dd1KT4zUV54se/PNl2QVCXnxo1OeJ4bJMsJ1gZpxP4bsHAwtYB7hIwg+gnqoGT
	 kOIk8Id4AxQ3w==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4161B41063;
	Wed, 12 Mar 2025 22:27:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Fritz Koenig <frkoenig@chromium.org>, Frederic Barrat
 <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fritz Koenig <frkoenig@chromium.org>
Subject: Re: [PATCH v2] Documentation: ocxl.rst: Update consortium site
In-Reply-To: <20250312-dead_site-v2-1-920a313743ee@chromium.org>
References: <20250312-dead_site-v2-1-920a313743ee@chromium.org>
Date: Wed, 12 Mar 2025 16:27:01 -0600
Message-ID: <871pv1nave.fsf@trenco.lwn.net>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Fritz Koenig <frkoenig@chromium.org> writes:

> Point to post-merger site.
>
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> ---
> Changes in v2:
> - Update link per feedback
> - Update commit message to reflect sureness in corectness
> - Link to v1: https://lore.kernel.org/r/20250311-dead_site-v1-1-7ab3cea374f2@chromium.org
> ---
>  Documentation/userspace-api/accelerators/ocxl.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/userspace-api/accelerators/ocxl.rst b/Documentation/userspace-api/accelerators/ocxl.rst
> index db7570d5e50d..4e213af70237 100644
> --- a/Documentation/userspace-api/accelerators/ocxl.rst
> +++ b/Documentation/userspace-api/accelerators/ocxl.rst
> @@ -3,8 +3,11 @@ OpenCAPI (Open Coherent Accelerator Processor Interface)
>  ========================================================
>  
>  OpenCAPI is an interface between processors and accelerators. It aims
> -at being low-latency and high-bandwidth. The specification is
> -developed by the `OpenCAPI Consortium <http://opencapi.org/>`_.
> +at being low-latency and high-bandwidth.
> +
> +The specification was developed by the OpenCAPI Consortium, and is now
> +available from the `Compute Express Link Consortium
> +<https://computeexpresslink.org/resource/opencapi-specification-archive/>`_.
>  

Applied, thanks.

jon

