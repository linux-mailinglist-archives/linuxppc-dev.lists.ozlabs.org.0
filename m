Return-Path: <linuxppc-dev+bounces-7898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEF3A96AEF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 14:50:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zhht86yFgz3bZs;
	Tue, 22 Apr 2025 22:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745326240;
	cv=none; b=XhOIxs7TuiXVvDtvYylk3GDKvygn4NSeb5pL7Pw1iv/vWq4Rwn7kwdU/OTtxFgKgTGSqHGURLCoIbtIno5FumNLScjBJv77/GZJRcuyt3QdgYcGgtJ/UHAqMoYGbw9SSgKQFAVANGq/b8D/UgztBoHDUeNoSkiWpSzYW10bjiJQfzaxkPCTFuRgraalsz7C/4kBWWWzLasS2jX72qeN3tgu3pRAOW9nJWhg0JbgIUDclbgx7LQhJINLFCW8MCtCOtGvn/yu4IdwLNRbvkpcVCSzIB3l6RMcepkHu6qrh/wl7WkxQBOOp2Gw2p+Tzvxj5xsDcjn8TB+V6t7PcEjpWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745326240; c=relaxed/relaxed;
	bh=hc7msAx4AniUD+av7LSexkbA5wCUZEzUg7jMT6Ga/Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZwWD7HELVyRdTCVh3ehgKo+ZQLR5YT/AHo5wFCw0A3Om/84Kv5T7yuONxT58aRCqxdotGgRjDuYeB71hAs7Ip5Ot0Mp4QZGmJh+0WICqh6CHOQ+ECb8SwGwb99iu5NzkMobM9YUPBlqf/2t2JPKtHIivuEnZAApcCfXEPlIF4S53TkKixCXPSqLQP57hme3tPuyFdpNx+/eDsIy8sVN8F4YPMp19InHA6+w4lWJf/hJq84xicMG+pyWCNWWRM3rNv47DZ09hFIhBXQTOYZaZkLKo9cGC6uhKJUJ3YuGlP/ymexHBOmtFVevhSZuTWESfPGSVKAa+bX6zR5ZfZgGeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sQfXeIP0; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sQfXeIP0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zhht82DqTz304l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 22:50:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64EE343A26;
	Tue, 22 Apr 2025 12:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DFDC4CEEA;
	Tue, 22 Apr 2025 12:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745326237;
	bh=ezUAAvrWZq+SfBhumiyZwTC1b8cAjSVNn0r03WnlHbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQfXeIP0FUDQkmQeNKo3qBQXsZ2p1REsH/Rj5cc5Ec1jdgX+eik8C+na4GVgWdEBl
	 VKg6iH/Rx3hGrRXOCB3wuKBdbeuXoX0j8bk+y0t1hIiQ6IRp5Ld0/Ggt3eIZQoMLry
	 vEibG7bdts7/IZYnXID1EwrV7+RMzcEY7if8nniC3uiYcrKpaR7bfkqQO68Mh0bz90
	 IllVIIPlS0zjZrDa68OZodTqvlH+pew4aO7NXp/TSNOBTXowm2g28pkATIwzTKI9y2
	 IdaKQrcUNRWQrVTm5vycOHMjz9dj4g8ZfPga6A82/CO4XXLwfJrOJfeWEdr6VJtCy2
	 ZIX121RSoHZhg==
Date: Tue, 22 Apr 2025 07:50:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Naveen N Rao <naveen@kernel.org>,
	devicetree@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Conor Dooley <conor+dt@kernel.org>, Crystal Wood <oss@buserror.net>
Subject: Re: [PATCH v3] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML
Message-ID: <174532623458.953813.9838833701705754537.robh@kernel.org>
References: <20250417-fslpmc-yaml-v3-1-b3eccd389176@posteo.net>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417-fslpmc-yaml-v3-1-b3eccd389176@posteo.net>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 17 Apr 2025 16:21:14 +0200, J. Neuschäfer wrote:
> This patch rewrites pmc.txt into YAML format. Descriptive texts are
> expanded or shortened in a few places to better fit today's conventions.
> 
> The list of compatible strings (and combinations of them) is based on
> existing device trees in arch/powerpc as well as compatible strings
> already mentioned in the plain-text version of the binding.
> 
> One thing I didn't handle are soc-clk@... nodes as seen in
> arch/powerpc/boot/dts/fsl/pq3-power.dtsi. They are also ignored
> by Linux drivers.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> Changes in v3:
> - Combine two compatible strings into one "enum"
> - Remove sleep consumer (sata@19000) from example
> - Fix reference to example for soc-clk@... nodes, and explain why they
>   are not modeled
> - Link to v2: https://lore.kernel.org/r/20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net
> 
> Changes in v2:
> - Rebase on v6.15-rc1
> - Link to v1: https://lore.kernel.org/r/20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net
> ---
>  .../devicetree/bindings/powerpc/fsl/pmc.txt        |  63 ---------
>  .../devicetree/bindings/powerpc/fsl/pmc.yaml       | 152 +++++++++++++++++++++
>  2 files changed, 152 insertions(+), 63 deletions(-)
> 

Applied, thanks!


