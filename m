Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3CD114838
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 21:39:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TSHR2D01zDqbk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 07:38:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TSDR5T8wzDqb1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 07:36:22 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id x195so4040523oix.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2019 12:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZxDdi4tWZwGx16qsUivpeEYi/QdxFDG6lu1aaAIGIhQ=;
 b=U5LBmvcL0lefhyRW03sM+z0CVcc1REabOYZdN+Zu9cp6LdeSuUmtyGuEa0GwsQ5wLM
 Om5aaluMWtuBtgFhyI95ktEGH8VwJrJCWaEwl02uAXLmZTBAtiEF0p5ED9B9rQ+qErL0
 xDlciD67b5FBk2LDquU9nqRwqVKVN67iYJoe2NKivyeT1AOS89/Q8K/wbv+Fvn9Z6Nfc
 2FNVkp19AY5DmvFl4bYJSzwSzKWKvJ5Ht7uY22vhgWHBdvo6s9KjXaUEYjhB1ywRg8BU
 UzrfoGQdn/9mfTEhnoBdADEjtCplHXr2BtU2Fy6iBYDSzihrtnQqV1WW0Qc8QPuGbVlo
 +DHA==
X-Gm-Message-State: APjAAAWI7e9nrqgxwozA68FthpySEsU+KAmkZjyub+jfdrYAxw7ZJCdt
 FM/h8Emw4Q70iau2pZQo/w==
X-Google-Smtp-Source: APXvYqzYl1PiM/lOBJJsKXVawc+2jiuwRnCBFFqCTTpp7sRvT16zLjnLLQFobFKmhv+5fOCdXqzUnw==
X-Received: by 2002:aca:ad11:: with SMTP id w17mr9342474oie.85.1575578179673; 
 Thu, 05 Dec 2019 12:36:19 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e6sm3766415otl.12.2019.12.05.12.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 12:36:18 -0800 (PST)
Date: Thu, 5 Dec 2019 14:36:18 -0600
From: Rob Herring <robh@kernel.org>
To: Haren Myneni <haren@linux.vnet.ibm.com>
Subject: Re: [PATCH 01/14] powerpc/vas: Describe vas-port and interrupts
 properties
Message-ID: <20191205203618.GA26880@bogus>
References: <1574816523.13250.4.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574816523.13250.4.camel@hbabu-laptop>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 26, 2019 at 05:02:03PM -0800, Haren Myneni wrote:
> [PATCH 01/14] powerpc/vas: Describe vas-port and interrupts properties

Something wrong here with the subject in the body.

> 
> Signed-off-by: Haren Myneni <haren@us.ibm.com>
> ---
>  Documentation/devicetree/bindings/powerpc/ibm,vas.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
> index bf11d2f..12de08b 100644
> --- a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
> +++ b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
> @@ -11,6 +11,8 @@ Required properties:
>    window context start and length, OS/User window context start and length,
>    "Paste address" start and length, "Paste window id" start bit and number
>    of bits)
> +- ibm,vas-port : Port address for the interrupt.

What's the size of this property?

> +- interrupts: IRQ value for each VAS instance and level.
>  
>  Example:
>  
> @@ -18,5 +20,8 @@ Example:
>  		compatible = "ibm,vas", "ibm,power9-vas";
>  		reg = <0x6019100000000 0x2000000 0x6019000000000 0x100000000 0x8000000000000 0x100000000 0x20 0x10>;
>  		name = "vas";
> +		interrupts = <0x1f 0>;
> +		interrupt-parent = <&mpic>;
>  		ibm,vas-id = <0x1>;
> +		ibm,vas-port = <0x6010001000000>;
>  	};
> -- 
> 1.8.3.1
> 
> 
> 
