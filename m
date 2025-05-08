Return-Path: <linuxppc-dev+bounces-8427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96030AAF400
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 08:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtN0Y1GwVz2yr4;
	Thu,  8 May 2025 16:44:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746686685;
	cv=none; b=IVtbSeHqz75aYJiIDQSFxas66EX8wTr9nCckUG6L/UVd8xE/f9EeY8gkmL3X+Rm/NRuY+wPWHsUJFNTLhHZPEwLvWeNJMW/16t9V94VKkzV6gnMv78Y63kwxp6U4HH2hzvi8CeRQ5CvDWViCbyFKlgS3oBpAa1w59BEEIA/W0FrirXrS3hiN8tlOBQHpMPoGLW0yqoCauu8RrLtEBuHUT5aZDfJXDPJiI7+hAkpoU+/x6SCXj2YOWLLIX6YNAQrdvAPXvmDLBvKwvfxQF6V6TX5dyNBR5iCEY7pM7HciOu/XLTl3zweWRIaPzGTwK+ju9++1qRY+N4SC/leEDBTr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746686685; c=relaxed/relaxed;
	bh=RioPm0xJ4W43VIZ298ljMriygcUBpD1F17cLUVA/coE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pug0ZWoDCO4rtIIi+x8OBT9ae3kBjhCkVO2Q6ztzvmNS9Uo2j3V0Mv5U1j3yS+GKsTDBQWiGvCArNILZw7xVpJM81zhI7SdVFhXW/QtkLJMYa/vKR9VeMNtkSVI9QUb2BTwn7U3lsdi8kzFQ6Dkypc/P1+vA9NzA62VOcDXLrp3JrMrjQc7ClsU5heJ0QC6cpke8BH/L494EPZ82jOqc5RzrQ/eH674A994m81+Z9UsKkdGEfo10A7Gz+Oh/p8shW5oEqrkuYJENh8JOqIcQrT7qMlq/bQHvBFnNzGOAH/7tGnMkpxSwr7wwVyoI4sQHB3MDgoNLaPQQhKzyNpZjHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qHP9aykz; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qHP9aykz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtN0X2FYCz2yh4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 16:44:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C19B5C61F9;
	Thu,  8 May 2025 06:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0624EC4CEED;
	Thu,  8 May 2025 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746686681;
	bh=Hy0g0Il8Xl3COvvl59eRO9qYPHsgZeK09RVf7oNgihY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHP9aykz1rHNs6oq2hKLyC5C2+8wP9LG4iSrr9nXjIyEhmw9OFG9hQtAqQLIXB20N
	 o6sIhgvbqs6cHu1/gFRf3kB183UzoYLtyGKL4t0OdefJ04kg3sNXLlJhnkWH/OgjHZ
	 3IaFgb4oYDKN0mOKWZqaMHR+ndsS45T5DYyg0Op8GKDqrTLupVLHDrojyKPa6isDH9
	 SiyFNIGTHArebJytVBbTZEtVeui2PhCme/4oTyAYq8HSx/nAJGmNOiBA2iEluf6g5P
	 1wg9zO+DuTQoFPWfHLCBZzWCccoL3yr9WPiRgQu0V9mvlNfi2dVFEi0bshRZ06B4fc
	 nXdrcIHiCw5tw==
Date: Thu, 8 May 2025 08:44:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in
 $id
Message-ID: <20250508-determined-terrier-of-tolerance-ad0ab1@kuoka>
References: <20250507215903.2748698-1-robh@kernel.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507215903.2748698-1-robh@kernel.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 04:59:02PM GMT, Rob Herring (Arm) wrote:
> The $id value has a double "//". Drop it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Fixes: 9ca5a7d9d2e0 ("dt-bindings: soc: fsl: Add fsl,ls1028a-reset for reset syscon node")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


