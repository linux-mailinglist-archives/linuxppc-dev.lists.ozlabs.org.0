Return-Path: <linuxppc-dev+bounces-10481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C5B16C13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 08:33:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bszmJ0pdzz2yLB;
	Thu, 31 Jul 2025 16:33:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753943584;
	cv=none; b=aP6/cXzuTKNvRudq1Itn/k209Av9hLdJcupH/jSV/0NqKQGWzUwkGFy0TBDp89KoaIiTamIRIyLi85ngjGsmrVPAHlgF13/FRkocEvN3RisTR186r5P7RXdwtokdQjjZSkNLSaHzMQB2qGNe4XQO8mTbBsU3ILl9XLRlPVl5upIUjUk8+Ffm2JA0qD12K82QgeSUhvhw+xsAbw0Ll6cH9iFAfQQcYlRTdlQT3H18BOpwWPsSThC2gI4KOtS7FRt/qY049KuGS4pSLmbBQq7MeBQyhhMOnfs3LsCYPh5+Isffc6wDcJUM1kAQ7aqLTmIc8tyIuseKN4lfaWbH+ZuIvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753943584; c=relaxed/relaxed;
	bh=To58GqKtVDhgzD+Qyo+UHbj1HickfStGsC4DJIVqF9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVFeBBNQGylr18s2Nnlja9JWIgxuFA6HyXByLkuSFIemO7k4ek49qSFkdTLahqknEYT7DVH7J0fd4C1ZokpuvSKBqqJvk41hj3ko9bjiI975SBpnY2xvfmPe2pDUsU0BVOh48Rk5PZf5juvd5oratzRbR4EIhm2SnGIcsB+ZZzgD5PQqU9ox6VRXMATI22m/rrldViJkKAAGq/E52aU0RrWk4CxuEVIB8G+Eg5qxzzrlTHvvOBhaBqUrD/QWLQxTYxFkJW4Ib51f7d2HcFyoa2ixlt6MHaPF+85O/BYpOuUj5gcm5p2r8WrraMIAfyvB56UyYGOL3qyvvYyvRu/LzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qws2gpyy; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qws2gpyy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bszmH1QVbz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 16:33:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E242A5525E;
	Thu, 31 Jul 2025 06:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F7CC4CEF6;
	Thu, 31 Jul 2025 06:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753943579;
	bh=10nRDdbRtJZpHUKeiyBjTnyVRKN1Tb81tLf8PDNnHBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qws2gpyyV9j+BYOBQcfUihn50ogp1E76SRWdvRY5sivhOzlu55L+gTg7zdkawi0Cq
	 9V7bw5Qn69XjBc2KXcsXrbTJc7vn57Yjt5Uhe1TL8hH7NdpRbhXJQxmzBKUhn3XAIH
	 gqDz81yxQHsmzE0cSqqwM1WHIakZFoqVfYBYugtyYxs/xQkPEdYzs3Cv4e5LiMhouq
	 I+0Q9ACzC/Dk/pdabZXRkANb6chMAZ0QHpH9XdcELC2iKB9CY0NrdAp4Ocl3xP+zDF
	 K6CpzFjnXD+Q9hLDVfGrlEpDiv1tAlxD56K+nCteqTYUvHvUKaVoNCkpbcF75Lw3PK
	 pyfWNc24urbXg==
Date: Thu, 31 Jul 2025 08:32:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: fsl: fsl,rcpm: Add
 #power-domain-cells
Message-ID: <20250731-funky-crab-of-defense-7cd658@kuoka>
References: <20250731055806.2265628-1-alexander.stein@ew.tq-group.com>
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
In-Reply-To: <20250731055806.2265628-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 31, 2025 at 07:58:04AM +0200, Alexander Stein wrote:
> dtbs_check for ls1021.dtsi warns about unsupported property:
>  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> But if removed the check warns about missing property:
>  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' is a required property


And if any other warning says something, are you going to do that as
well?

> 
> Given commit 8bcf67b8d893b ("ARM: dts: ls1021a: add #power-domain-cells
> for power-controller node") explicitly added that property, add it
> to the expected property list as well.

No, commit does not explain why! It's one of this NXP commits without
explanation, doing random things.

No, explain why do you think this is a power domain provider - fast
look told me that it is NOT.

Best regards,
Krzysztof


