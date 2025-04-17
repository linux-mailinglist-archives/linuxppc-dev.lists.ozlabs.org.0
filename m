Return-Path: <linuxppc-dev+bounces-7745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DBDA91F5B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 16:19:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zdg4Y2JL7z2ygK;
	Fri, 18 Apr 2025 00:19:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744899549;
	cv=none; b=KB/b6lJCjYGwDc7b/P7j98EPQOqNj7NJE8ooFQ30c9xdjHkU66v1/G1tb9GCbffYn4IpfZTBZnpP/vqUjy8QsrqR0IKTfxUU/alYO7X9ou5CeuB7jcWIAxrXXEqsHj5wwixhK4eb4j1+ZThMl/Gp03HVzOoOOJHfFVqkQqt/2dUJ2JPn2ibny13U9fTRQvCMDIZqLDr10za9YEq2gyFK52e8Ov83//+vVUv54ATmnf/DEzCXOzfgSgl/iVe/zuKCVqMNENXgSy3OUj/OFZJp4WCH0jlLiSnuMREBGnCJ+15oisENmAy1BWVTOONZPnF6/TTxoT7b4VJWG3fnoWvSww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744899549; c=relaxed/relaxed;
	bh=LYKUAE7w/PuTuSwMwOcfwNPDzoaeaOm76gYKFAbUHEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOmOUYUrPc89Do+MnWdUuQShzsSKeiTwuqK1MKfTfUcz22Vtu7P833NuJaIagATt0K4D9cJn9ZnopcElMCgYqEkswvGwizC5+3A0suVx39zx+HUUHuBa/sNHtp3sXPlHVYgpZ/PCSbzBuYXnVQrKGG3Kl6irwiczVnKHSjZvEFvYS2yw8rI8YO9bC/97yARrYh3sYpRrTXJxJgCAxlTkwuI2wE4PpA6c36Yt+mNEsN7BSVa1ev22e6SPOan8kxHc/eqo/dUXZIE678aKJWYx0Ni8qvJPfgvp/QvqN/Oc6THQ/qAjME0MBRdxP++H+K3P5cPiub5bdNl0ji64sl3iLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=IcEvn5P7; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=IcEvn5P7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zdg4S688jz2ydv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 00:19:01 +1000 (AEST)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id F11A8240027
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 16:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1744899531; bh=PrJVLP5f8fwnGGlUkRAHMFELfuQEh6br7KhpaFyfBEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=IcEvn5P7CPvR3WM212MVKLuhSZCSaIZzkri4rgqml2phktYxIjWjN0vJACvsJVfIz
	 CtBFwykipg7y1p5DEvXTxHjhm8F1eErOcyPUlhlVUFFj30F0VFDddFDgAzpRokljY+
	 oXh0uIFlk68wZEUf3WreCJGGJK1rVgoSyxpb9SzgzGQKO94IAg0M1+a3oHvAXOOayn
	 1yp1Ak1zdr5Jk/v2kLIAswnvTyNtxppCrmBePqvhfBc8GuCW6A9fWoK/JrBuYJh1ks
	 +6MsvGJlVzCexLxExnb3wo2fim/XWGDqBn4Uy49+8sdVBa6e3EsLeAW2bxzEOhQ+c3
	 DLQzlMpvIdnoA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Zdg491zWsz6tyf;
	Thu, 17 Apr 2025 16:18:49 +0200 (CEST)
Date: Thu, 17 Apr 2025 14:18:49 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Crystal Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: powerpc: Convert fsl/pmc.txt to YAML
Message-ID: <aAENyZObpPCmm1m9@probook>
References: <20250412-fslpmc-yaml-v2-1-98c0948a2921@posteo.net>
 <20250412183732.GA1442430-robh@kernel.org>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250412183732.GA1442430-robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Apr 12, 2025 at 01:37:32PM -0500, Rob Herring wrote:
> On Sat, Apr 12, 2025 at 02:49:38PM +0200, J. Neuschäfer wrote:
> > This patch rewrites pmc.txt into YAML format. Descriptive texts are
> > expanded or shortened in a few places to better fit today's conventions.
> > 
> > The list of compatible strings (and combinations of them) is based on
> > existing device trees in arch/powerpc as well as compatible strings
> > already mentioned in the plain-text version of the binding.
> > 
> > One thing I didn't handle are soc-clk@... nodes as seen in
> > Documentation/devicetree/bindings/powerpc/fsl/pmc.yaml.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > Changes in v2:
> > - Rebase on v6.15-rc1
> > - Link to v1: https://lore.kernel.org/r/20250315-fslpmc-yaml-v1-1-10ba354a85c2@posteo.net
> > ---
> > 
> > Note: The examples include a consumer (sata@19000), to demonstrate how
> > sleep specifiers work. I've heard that "unrelated" nodes in examples are
> > generally discouraged, but I'm not sure if it's better to keep it or to
> > drop it in this example.
> 
> I'd drop. Unless you want to fix the error. There's nothing really 
> unique with how 'sleep' property works.

Okay.

> > +properties:
> > +  compatible:
> > +    oneOf:
[...]
> > +      - const: fsl,mpc8548-pmc
> > +
> > +      - const: fsl,mpc8641d-pmc
> 
> 1 enum for these 2.

Will do.


Thanks,
J. Neuschäfer

