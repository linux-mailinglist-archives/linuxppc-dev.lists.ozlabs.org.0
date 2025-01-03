Return-Path: <linuxppc-dev+bounces-4618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C2A00594
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 09:13:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPbtb70BCz30P3;
	Fri,  3 Jan 2025 19:13:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735892007;
	cv=none; b=bPY+Znx+BZqmGYEd+0LnZLH5G/3U1obvHxxmF+LSVLv38jHjwOT/O8wDNkfebD1BZiEyHgBRnSFnZmF6/8Wo5fSI77ApF1rdqhTp7Hx94IZvvctt6KawOys0htNqiVpfGHLgVg9rw1SgqFNSQvqZzD+3caxGFZEq71eFu2/wQK7SXCNui1rVLZ9MiP4yHT7nijcLjc1w3EQ+pFvDcGnxrISryyNGgqU8orkyWzROkaq78USTEWm4tgh+TVtZ4pAQ5LteGr6CKEF3Qz1ADrZctale1a8zUB8UdT4cpvLx4AaoSUKom72HdZqQipbwMtAawTvkli2yaI+mnyVw7Yc5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735892007; c=relaxed/relaxed;
	bh=FHjpOjYihZhIT4kZlc5KXVrJJ6F3pbE3Wxo5iFV1HHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jvfehan4Q7cmasbFp6TvQsQZCGm8uIA2p386vPxBhh4Y9UXq4Dosh9XBE3hIMDJO1dSCNgGcjcteyJ51SolLIWmGAPj6VkifC1iqXNq8tEa3abjRBrPT0gX5J8hapkv/5u9C59uTl7VH4J7tj3Sql0yWZ2gMwriph1RjoOLh7i04zPLSDGZ9r/5SCeDSNqIcVsARPBK4GV3oRl9wh7+HodifbAOXesfDRlC+rydG7wlav5d3WT1uWO696frWMd+UKxt0ql27I9ezpZkq45CLa0ZyFBDpx4j4/jHksTZxxvuhLkUkYwljZ195vonkwBHcwuYFKhLG1LWUXp8ovu4NFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VrX/Qa9k; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VrX/Qa9k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPbtb0Xl0z30Gm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 19:13:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 042575C5FE1;
	Fri,  3 Jan 2025 08:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2D3C4CECE;
	Fri,  3 Jan 2025 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735891997;
	bh=S47wggyuRv2A8v9Z9jq7+8RA2lHFl31wl43mZE2j1JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrX/Qa9k/5KPueZGlHVOaMkG+y3cTcFVPcC4045Q6b+bmBVm1ejC28kL7Ctbvj4r6
	 7COCIxVdPat2bNQorI0sJi/odT8PRInOcH+Y5/CY3whH9eFVXRrNPTXcQN8VzDOhRt
	 /E7ZKazmSHnCLdcmMK632d+J4tozJf6jOmDsN64jIua0w/uTW3fzLGMuYolKtAxlWV
	 +GIm21EOxstpR9bM2yzz5bPBQsRqZWjJNBfKsEppXFjn9k1UMpFcEa7H36z/YYFQKB
	 VHe0uK1b7dH357g5Wh93PFfmq5FjoMSXmFPYMJJ3vFNhPwMWxOS6HiRN97Brm4bFQ+
	 /CsXYYPQFI4VA==
Date: Fri, 3 Jan 2025 09:13:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 11/19] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible
 string fsl,mpc8314-gpio
Message-ID: <ovcdrqxlniliv5qq2uds64hh5qavafxwccvf2m6yivwoggh4r3@62qvynvphnju>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-11-86f78ba2a7af@posteo.net>
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
In-Reply-To: <20250102-mpc83xx-v1-11-86f78ba2a7af@posteo.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 02, 2025 at 07:31:52PM +0100, J. Neusch=C3=A4fer wrote:
> This is for the MPC831{4,5}{,E} SoCs.
>=20
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>  Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


