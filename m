Return-Path: <linuxppc-dev+bounces-10818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59328B21325
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 19:28:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c11nz0q23z3dFS;
	Tue, 12 Aug 2025 03:28:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754933335;
	cv=none; b=cKdK7zh0QAqkTT34b6q5KJbpm7cRSkOuGKZhnFrSNZtY4wbWVMli59Q2DQPAr9ds3BLD+TD5SRxbAEey1lUvDh33vpxGg63Kjs5HJj+bYg83s660TbAdooQwQrDLOqkVjVyLfe989cXyOAFP7iAzDHlUHKjcTFSWBHLW+ZTrMBoAayaIYDq6zlmsisrz+cOtmB3uXoFKE773IlvCpy7l+UQ8VX0VUnb4rjQsW1ZLnIaJiijdrdDn13WdsTlxQKXfTdyZfPu3J+SeM/8gVaSPsQHZvNPdzGU0x3Lku4TGUWDG9BCu7iakGkqpzoWhHHlBuluaeroa+/VFN4A2TWnyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754933335; c=relaxed/relaxed;
	bh=ztqQwoo6+KUPLDZvylz/n2KJXoFMlt958vmwd5nxUG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fc9XnKH9TGNvVFKN3X3yT1scCc1hu4wetifLOycZUiLaP225IM+eE0/Zh54kPU1kOwO/76rcM1jYHCdiZDqnYFM9d6dN1Kcf5QtllWgbJTuBXqk3B4l6SYddS3Tl3+fplQD11VEmPhlLqoJIL1Sr9J5nmQ/jVPULm6BHOu1Erwakl7Z3MnY3Q56NB4W1+FMjOI4VGjTYMbWIYcXCOjF593sNlXS3AU+lWUR3WVOsnuv6D3gphtXsxIJN4310knKK0wPcPle/RS8vP1hfBo4KJCwy/GdicGQRPPlCWrgA/rNiWGbJ3+h9G9jXZ7N4AXKitikqj44Ylp6KbAYJu2h/Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KTE7tFWc; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KTE7tFWc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c11nx6jHmz3dBs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 03:28:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D887361482;
	Mon, 11 Aug 2025 17:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BD8C4CEED;
	Mon, 11 Aug 2025 17:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754933330;
	bh=9XSbHbfFnw3XIaRpvKnt/hioK7AaWjMpyvzXjCeNyEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KTE7tFWchqSfKGfWKXO+oLy2j2snSzC+gwd/SC7Zn2Cffnn18e1k3l9cXgXa/F86h
	 0cJFMZk4mJMXr0x15gQAo1zB6Im31tDgvtWVKCUh9Oon7vTw9+KqZzHRMX9LaTqfK7
	 rs9Dn2oqM0/hghOMcIDBEyQS/3WuUhccCs+XevhptWl8mkVCNnRIjYdPqnK1FrKe7H
	 Ydy8ple9K7VqfKWHQa48s692TrDWf+IbGp3ID2ulJmP9wt1KfuoEHFD58jkUvNrthp
	 22BT2SVhhpbmYVlODBpBcG/ctqMnx2IIYNVdwFoQ/+KiE/mSkdHIE5Cr6fvH/yLULB
	 AEVajkqahSRYA==
Date: Mon, 11 Aug 2025 12:28:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Scott Wood <oss@buserror.net>,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: powerpc: Drop duplicate fsl/mpic.txt
Message-ID: <175493332847.3843132.2055857937103048620.robh@kernel.org>
References: <20250807214432.4173273-1-robh@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807214432.4173273-1-robh@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 07 Aug 2025 16:44:30 -0500, Rob Herring (Arm) wrote:
> The chrp,open-pic binding schema already supports the "fsl,mpic"
> compatible. A couple of properties are missing, so add them and remove
> fsl/mpic.txt.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../interrupt-controller/chrp,open-pic.yaml   |  12 +
>  .../devicetree/bindings/powerpc/fsl/mpic.txt  | 231 ------------------
>  2 files changed, 12 insertions(+), 231 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
> 

Applied, thanks!


