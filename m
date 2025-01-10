Return-Path: <linuxppc-dev+bounces-5012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E93A09828
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 18:11:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV7Tn27wfz3cb7;
	Sat, 11 Jan 2025 04:11:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736529069;
	cv=none; b=UXrbQA2nIiyUg2MF7UzUiYPJA8XTMcsCGmOUMu+A0VShDbL9mtZF6btRJj0lZH1M5bnoW1n0Y9cw3ed6qd4wpJZYMSX8GJ+A6eS3+tVkM+vBHozqi/G6kuFQvWV9uta596peS5D0Q2Q9RA11vgq9vDUJDhIGXscvOGEuRyAbrMMFSdQyf2w0GdXEAyH3yh2Ou9jFbXZeGzlhLLGyjIU20oZN0thURCFo4iWUwEXfFz7Ayp+iRWB7CUSxHwYwMpxXIvt0RFk+mVZmGW4T5Xg3Gt2/YlHFA15os78WoVbO24OQ5jkk/XmPdGOFL1KGNI0ijc0nLtSccY5kRCq/P6hCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736529069; c=relaxed/relaxed;
	bh=m4hM2krr1c3cfb20rA2BlFohuyMg9NIK1v9eCz9ef/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQ21I9OdSQkOoZTtvfDci2OKA9DvLRv+uuOqroCPJMRYyCveDkgXY25w6bzlxaSBIpqDDxYJRbRvgWMnKV4Aivw0/Er6cODOV8cioB/QpTKtMNszJSIcYMUK0FioPz6ELlH5cKmicd6ul4n7U3SsiOeuWx2TDyRe1uQDRZK7cL72jAibdlcr1spIWIZeq96YV0ljUnKv+UulwDGl9VWw5Grqf3DoncXXaxH4Bx1sfK0iXJQgHOaVzfV5asOU4UodJIH+1/ViVtm8Xzqk2QCP5zd9zYAmIxjmeGpeGuv+fPLbDbuH+kxoQIgOc7TKmmErSyPG8mzyIi4Hvkbt6Y3Srg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=SGLNghZt; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=SGLNghZt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV7Tc4Y9gz3cYP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 04:10:57 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id ADEB3240107
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 18:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736529053; bh=AOmEQRuXjkSD5R3WL5P7ffE1L4Z0MFgQj5vEGPUPTx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=SGLNghZtZWUvYW9e8yNrfReqiIiOidejL+5a8H3lEclTuNXgd5iSAKsBLOb74sPsY
	 yO8Gk4Q0kDBQntn3VlZ5ZV21/C+NlohZyqzMkn7CsPhR83Y2G5VCGpyjn1eotU7RQW
	 pJrh0NqYHW9Tfpe6wxa9x1bUfbnfrAekuvGl+qcv6HSSLqhfjUBzwT7lCfdX0NnQ/v
	 2QEIqLjNPCbAyh7NhZL8YwoDDJ/8z6MtdnxLWzXNqoAig746/VcAE+ZOYcn03NorKv
	 4/7LF97uuOtrM4aAKGRRIfdfv7GFgbA6VXIdMxKSOkJsxJyN50c9Q0VOD8ms2D+vVL
	 q3o3qp2f7YwXQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YV7TR1mHbz9rxB;
	Fri, 10 Jan 2025 18:10:51 +0100 (CET)
Date: Fri, 10 Jan 2025 17:10:51 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 16/19] powerpc: dts: Add LANCOM NWAPP2 board devicetree
Message-ID: <Z4FUmxeokwjGhdCJ@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-16-86f78ba2a7af@posteo.net>
 <b1e0fa68-6f55-4c21-8d61-f8d58d932afc@kernel.org>
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
In-Reply-To: <b1e0fa68-6f55-4c21-8d61-f8d58d932afc@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 04:24:27PM +0100, Krzysztof Kozlowski wrote:
> On 02/01/2025 19:31, J. Neuschäfer via B4 Relay wrote:
[...]
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/input/input.h>
> > +
> > +/ {
> > +	compatible = "lancom,nwapp2", "fsl,mpc8314e";
> 
> Missing bindings. Please run scripts/checkpatch.pl and fix reported
> warnings. After that, run also `scripts/checkpatch.pl --strict` and
> (probably) fix more warnings. Some warnings can be ignored, especially
> from --strict run, but the code here looks like it needs a fix. Feel
> free to get in touch if the warning is not clear.

Alright, I'll write the bindings.

> > +	model = "LANCOM NWAPP2";
> > +
> > +	memory {
> > +		reg = <0x00000000 0x08000000>;	// 128MB at 0
> > +	};
[...]
> > +&localbus {
> > +	status = "okay";
> > +	ranges = <0x0 0x0 0xfe000000 0x00008000>;
> > +
> > +	nand@0,0 {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		compatible = "fsl,mpc8315-fcm-nand",
> 
> Compatible is always the first property.
> 
> > +			     "fsl,elbc-fcm-nand";
> > +		reg = <0x0 0x0 0x2000>;
> 
> reg follows.

Ok, will fix.

