Return-Path: <linuxppc-dev+bounces-15805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC12D23961
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 10:35:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsHrv1Nrcz309N;
	Thu, 15 Jan 2026 20:35:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768469711;
	cv=none; b=HO6K5gNPekyTIJpO9J/JYZrjZnydREaXh1Q+4zrh8TdYLjlN3uIgbNm8+qJ+JEI0/0TjZbxa0tH/eSAL//l+Pb7zQmZn0/dZcW/+zHbI6RZ3cGC+e3V3pp+24FEcMF0OOx5TGV7DB3F7sF2TLVbTIKRPv5+BgP6PQD98b+VSfumtna4kBUKGkX+slw8EsMvhoY4qhfk3XQlQgXI5ZMAJ3PYUBVK2dWTCz0itqbEGjIgpSfdON/6WjYlIU8vEdipR6MlCbGbVWEg4dAxSXuotpGA7N/F5Gj8qWsjVK8lQNE3eGGE/RPaYoEFfiOT+3XxaRG2c0o93I9OZchx7+gP11w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768469711; c=relaxed/relaxed;
	bh=J7TRkCPCuMhNnfg62i2sqEPJqaQsITtAb0s1d67kXOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aa5rKYPZkKAIQDR0Q6OcC6pJNAPJnkvdwSlbRoQnTkRv//yG8bVgPt4lXbB0OGvcFSdiCDfHbMY+Mln8jGkA+wnJuOo27auGQ1nmSAp0JnBIXo8qkAKTag1jvHXzmpZFP+gEbNeT7fB6QoPqoWgPYGbLJByEjzdlNoOXqtdfPAyMf0K7hxyjIForiG0LDVlSrq8rlKd9fykY8HYQsPfzb+rD4SUaj7q38OLm4dA7gj+iIS7QxWj7txB8+AcaOXVhY4csLpilN6wd7xOh5uypaAIjkjh9ELwUAhmXLhvG7k4EjzB9vG2WTU3tdLuivDtcHRM7qDmhoqSHSlONlmgs/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uMp4GtGL; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uMp4GtGL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsHrt3x6xz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 20:35:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C54243F29;
	Thu, 15 Jan 2026 09:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA932C16AAE;
	Thu, 15 Jan 2026 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768469707;
	bh=SSDkmMF+IODJFDYFIJgpnmI+1nvN8+lx0HlSTFA4zgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uMp4GtGL7P+vbe+wWO0FzanFpYnV0LsPC19sEANYragKdUc9CO37v4paShJlFNUWs
	 JdA8Gyw9kdLwwLnILOmuFIlo/L/w9TPoqEe4T2YjH5LVl1RHBvjDxHx7s+XUW4eFwZ
	 usqvKyxT5msdYw3X+k//CAGrEyn13KQuIMEtu2NO0nmKdIl/YRXYqSvzeYvqyC7GFF
	 uL4Ru1hEX8DfPJY1ipddgQsnCVq9X115Hvx+G2o/EkWo+7sGiJg5PKDE71u2r5P2+R
	 4gZCDl6/ccI0jHRPKcz7Vgei+iMG5I47FguPva3XpZJW7JqOfbasH7N8cmNzV32zEp
	 PRIQU4MUe8Diw==
Date: Thu, 15 Jan 2026 10:35:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,sai: Add support for i.MX952
 platform
Message-ID: <20260115-truthful-marvellous-okapi-edeb92@quoll>
References: <20260115061418.4131432-1-shengjiu.wang@nxp.com>
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
In-Reply-To: <20260115061418.4131432-1-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 02:14:18PM +0800, Shengjiu Wang wrote:
> Add a new compatible string 'fsl,imx952-sai' for i.MX952 platform, which
> is fallback compatible with 'fsl,imx95-sai'.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - drop driver changes, as it is fallback compatible with mx95
> 
>  Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


