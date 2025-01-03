Return-Path: <linuxppc-dev+bounces-4617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 205D9A0058E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 09:12:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPbsK3jbqz30NF;
	Fri,  3 Jan 2025 19:12:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735891941;
	cv=none; b=eIacdZy1/ts818wxPyxVGradlqlbfdtsAMmgoRydj0b/+7lgZB16K+YhzRgVBcXgE+PBFQ/OO0om6LYqrOuAV7TZ/9MdIOskyDtdAUZLhjk7lmH0KTlzziTy9IjHi1xKNTGVJuaEEPtPFcKv8cv1wZq08Y+jWKNbqfZK3xKvjK5DT5huBg7M9UQmXe2NSVYLWP7Uiy19SG2HH3WLUP0Amj9pJL+DW/2ook0KrLZBJG4k1JHOg4XeSiokOiEFI8jCnEqHrjOwcVtho11d63Q5uXdE9MOApYEp1RJySgABoMXJ4Tt4H/xFiuW0HejJsAasP9QuHScis+F7ONwLbiqHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735891941; c=relaxed/relaxed;
	bh=flwz+HMVrg1hEQrBdPT5IwVJNtuUCB1JV4oXXLz6OMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbymhZ7Rl6lUbDc2vrrJegDw7yH6E95j1h87ECfBhlyw4spjnatH5tDrIvHt/IhTZHgaEPvBLfc4MPx+JVUj6RZgHE1yp472+2krdqwsfn8pcd3gEwK9OrJFIYdH4/l+GlBYwXzY4p1VeNRmqM0+UAcRqj/LXjdvJvpUaK5bc9OGfiyWts+rzmG+Sx0FTR7GLbh300f/w/gWaUkSfW/CHyaB5RXzEDIe9fV50HwfkDmYCkeneb0Kysf8LEZAqL6Wxw8XnKOTQ+ZhyltIK7lLQlF4VB7TRJ/BgD63HFXn/nzqHcKiYDirDXu62BP4uRsItyZZDNBYVAGpQXWXifU6VQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WK8SaiEo; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WK8SaiEo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPbsH6nJvz30Gm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 19:12:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06EBBA40427;
	Fri,  3 Jan 2025 08:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16836C4CECE;
	Fri,  3 Jan 2025 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735891935;
	bh=wNTe2dD8cq7ARum+Rs0SN994vsRAZeHnb2rd5cMp40E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WK8SaiEoknbqAka9wpLvF/CrpINvc8K9DCyGT32TXF+BiXrdJmvZnp9WxnamTPAa/
	 FL5uTC1iE5NQRfNWjdYrieQ+spaVOUojfPe0yN9yNIHhhTOVEbwXJ5PgEZy02ZmHx9
	 wNxokVfZY1wD2eoRZDXh4GxAvDhaA6FHKCe3MKcTKpSDG2zgTbLCLfC/tZIG0hFocw
	 kV7gw80c/8+YYmfrjdX2MJ9xzm0grorH4ZLWqpC7KxGj8jl4ikC7FKVOIKZSGBOGCF
	 Di0ZQDlYfXhLjYcvKicIYDos8AEDzDeBCMzCiUeFhE0NxAvWYlGwPqeYPPujQgi/3K
	 5pX5lP1nGYScw==
Date: Fri, 3 Jan 2025 09:12:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 15/19] dt-bindings: vendor-prefixes: Add LANCOM Systems
 GmbH
Message-ID: <orlb6cianhugmggxnsaoullcsno46gqvq56xdio6dw34gy2grm@i2lguc3hz2xi>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-15-86f78ba2a7af@posteo.net>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250102-mpc83xx-v1-15-86f78ba2a7af@posteo.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 02, 2025 at 07:31:56PM +0100, J. Neusch=C3=A4fer wrote:
> LANCOM Systems is a manufacturer of networking equipment.
>=20
>   https://www.lancom-systems.com/
>=20
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


