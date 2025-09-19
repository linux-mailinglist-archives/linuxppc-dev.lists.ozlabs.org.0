Return-Path: <linuxppc-dev+bounces-12424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5480BB8A413
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 17:24:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSxBK0cvyz3cYr;
	Sat, 20 Sep 2025 01:24:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758295464;
	cv=none; b=a5j9DOsK9JZ4NCQXfCDoPmHFVaP5VR50F3bOhlu7v6DhIf1x7lkMHIuoHKTTiQ7vjkMnKI75ReYLqN5LXYsatUdYLxVe8dIo3fxGMIOnYGOeCqnXgYR9tr5wtNKedKLalej5cRmxyLoq3BMUgghqn1l0AmJaJMV9dwqCZlUkJVKbLD7KONtKS8h+LW80Gqrx8s9AiGMfLgfaccExJ4WI1McdfzYJekI6PmsxEjmYdlAcueUOyUqdvBnOs48ah7SFW2sQ+0J9fc8vSzmE0WCEmnJ7YWl+MlKpVSAvkqCfm/zcKreOmAgHgYq/FTjkOR/DSf+KaIfRZDTtd2DAouomCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758295464; c=relaxed/relaxed;
	bh=WX+3QVQrdEoBVgygNt/gvGVjG0i16otbvUqZM1g4YOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n39NzB137GNrrGiz3G/MSQHLWJE+pHOjMVfVk1DaKJaXyC07h0lj3s4Z1arYTiCcl2OsvcqrPtzPE7zWcA/1HlmfRwN4EYiT8H7oX8hI8KwP/8Zpf4KlO2IfIwCX3IfV/n7cx1UZFQZ2jWcxRBS+yWTfHpyL/hkeHpNGAqep+5fALrO5t8j/H+b0tlaeeso1HzO/5BZw/JAcWMKqx55PdtUUy4Gh6NsH6lJIHP+zNmnf5chEQPEzHPiFdqC0wBDvjQ1VfTTFqOnLL+FumEujWpXRuD0n5LvdKNPAG2z714B1KdZGiQ8gWDy/Vedq10MkJh6NasL2C3QELooGp9zniw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DU3dHtFI; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DU3dHtFI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSxBJ1glNz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 01:24:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 253B360194;
	Fri, 19 Sep 2025 15:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B27C4CEF0;
	Fri, 19 Sep 2025 15:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758295461;
	bh=ABPSXlxAq7jRyiDCS/EVwlVL/meoOY0nO0Ad+jU4kDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DU3dHtFIBsAxB7Pt5UVMSZJt7VS4WcAeAutUWseQBKC3/LV2iFNdTkOSl/JwGx2i/
	 sLZdGnErEYEAnsGyaijiiaZ6WDIOVntvtMC7lgCKAFrGN08e1if82OrLI+K3F7dmpO
	 MLBQHh9Ijh22VanE3obrw/2WwaxYSWN3nwNB4Cu3c+AFaFgX6iNk5WStniMZxlCaAQ
	 DDBhLjgbgo56vcWx/G2yobWmdru3hZbMEUfkasPAqnoC5ixr+oewGsXXV9oTTPY9PM
	 keZff9OUrkv1q5YI9gzQkiqRnXErR7arzVhi76QCBOFtJ7n+GzOoVaz5akrRgRb9y8
	 5XFW5AMSHhUNA==
Date: Fri, 19 Sep 2025 10:24:14 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 7/7] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
Message-ID: <20250919152414.GB852815-robh@kernel.org>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
 <7269082e90d20cf2cb4c11ceb61e24f0520d0154.1758212309.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <7269082e90d20cf2cb4c11ceb61e24f0520d0154.1758212309.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 18, 2025 at 06:23:27PM +0200, Christophe Leroy wrote:
> In the QE, a few GPIOs have an associated IRQ to notify changes.
> Add IRQ support to QE GPIO.
> 
> As not all GPIOs have an associated IRQ, the driver needs to know
> to which GPIO corresponds each provided IRQ. This is provided via
> multiple compatible properties:
> 
> 	compatible = "fsl,mpc8323-qe-pario-bank-a"
> 	compatible = "fsl,mpc8323-qe-pario-bank-b"
> 	compatible = "fsl,mpc8323-qe-pario-bank-c"
> 
> 	compatible = "fsl,mpc8360-qe-pario-bank-a"
> 	compatible = "fsl,mpc8360-qe-pario-bank-b"
> 	compatible = "fsl,mpc8360-qe-pario-bank-c"
> 	compatible = "fsl,mpc8360-qe-pario-bank-d"
> 	compatible = "fsl,mpc8360-qe-pario-bank-e"
> 	compatible = "fsl,mpc8360-qe-pario-bank-f"
> 	compatible = "fsl,mpc8360-qe-pario-bank-g"
> 
> 	compatible = "fsl,mpc8568-qe-pario-bank-a"
> 	compatible = "fsl,mpc8568-qe-pario-bank-b"
> 	compatible = "fsl,mpc8568-qe-pario-bank-c"
> 	compatible = "fsl,mpc8568-qe-pario-bank-d"
> 	compatible = "fsl,mpc8568-qe-pario-bank-e"
> 	compatible = "fsl,mpc8568-qe-pario-bank-f"
> 
> When not using IRQ and for banks having no IRQ (like bank D on mpc8323)
> the origin compatible = "fsl,mpc8323-qe-pario-bank" is still valid.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../gpio/fsl,mpc8323-qe-pario-bank.yaml       | 27 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> index 0dd9c0e6ca39..c34aeea119e0 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> @@ -14,6 +14,22 @@ properties:
>      items:
>        - enum:
>            - fsl,chip-qe-pario-bank
> +          - fsl,mpc8323-qe-pario-bank-a
> +          - fsl,mpc8323-qe-pario-bank-b
> +          - fsl,mpc8323-qe-pario-bank-c
> +          - fsl,mpc8360-qe-pario-bank-a
> +          - fsl,mpc8360-qe-pario-bank-b
> +          - fsl,mpc8360-qe-pario-bank-c
> +          - fsl,mpc8360-qe-pario-bank-d
> +          - fsl,mpc8360-qe-pario-bank-e
> +          - fsl,mpc8360-qe-pario-bank-f
> +          - fsl,mpc8360-qe-pario-bank-g
> +          - fsl,mpc8568-qe-pario-bank-a
> +          - fsl,mpc8568-qe-pario-bank-b
> +          - fsl,mpc8568-qe-pario-bank-c
> +          - fsl,mpc8568-qe-pario-bank-d
> +          - fsl,mpc8568-qe-pario-bank-e
> +          - fsl,mpc8568-qe-pario-bank-f

Is this supposed to be mpc8569? I don't see any existing 
"fsl,mpc8568-qe-pario-bank" compatibles.

This breaks the ABI. If the OS relied on "fsl,mpc8360-qe-pario-bank" for 
example, you just broke it.

As the GPIO bank doesn't do any interrupt handling itself 
(mask/unmask/ack), you can just do this (using 
fsl,mpc8360-qe-pario-bank-a case):

interrupt-map-mask = <0x1f 0>;
interrupt-map = <15 0 &qepic 0>,
                <16 0 &qepic 1>,
                <29 0 &qepic 2>,
                <30 0 &qepic 3>;

And then a user of the GPIO interrupt just says "interrupts = <15 0>;".

Rob

