Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 811E112568B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 23:20:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dTw64fw7zDqkx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 09:20:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dTsz1ZBLzDqht
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 09:18:12 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id 18so1325443oin.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 14:18:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uYxswBgZAiTLI2tTYUd7v8zHT1mrovfVUjVCk1N6olY=;
 b=J/S7dvFNgP6q1YQQQoo14PvWVDDdSzOKEVfqppYrxeWBQp0lgNr3h+/e/0X5bCkf+7
 MWAu/oRgxIej3JAe4QM7mCkm/KkpxpA47nrZ1JfZU8uG3zrF1jt0BoqwAkPSatQYqG3m
 XykaZgMdd9G8i0tcbUmIp4mczeHwJUM7bE7UobmeKo6FWWnwDyWImW1CDYB0OTY2aFT7
 Jdd3Jd0MzgL/GqYCB63OtcUz0mDnpxhWcJwxH98Hn4ZGc+O2SWaMikdLaC5iE3atjJUU
 b0a3SllxzRwwAlzPft6t9suP8eYOVHaxpl4XWSo8ocaj1LrOMu1Il1IAoBtJprlf2Top
 cEZA==
X-Gm-Message-State: APjAAAX50trYqI09PF23ZZmYllvOXISJBflvVbL4ufYyxhSbagl24wzA
 VdUDw8nRMRiGvAT/IxRA7A==
X-Google-Smtp-Source: APXvYqx1/vDB+TcHIO9sTlIA5oKvGc9NKrFg+21wXmHM5ouHlzRBUgHOjtgzGeFA5nBhdY34QJj2rw==
X-Received: by 2002:aca:1e0e:: with SMTP id m14mr1633487oic.114.1576707490155; 
 Wed, 18 Dec 2019 14:18:10 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r13sm1275547oic.52.2019.12.18.14.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 14:18:09 -0800 (PST)
Date: Wed, 18 Dec 2019 16:18:09 -0600
From: Rob Herring <robh@kernel.org>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH V3 01/13] powerpc/vas: Describe vas-port and interrupts
 properties
Message-ID: <20191218221808.GA20302@bogus>
References: <1576561080.16318.6531.camel@hbabu-laptop>
 <1576561720.16318.6532.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576561720.16318.6532.camel@hbabu-laptop>
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
 npiggin@gmail.com, hch@infradead.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 16, 2019 at 09:48:40PM -0800, Haren Myneni wrote:
> 

Commit message?

> Signed-off-by: Haren Myneni <haren@us.ibm.com>

Your author and S-o-b emails don't match.

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

64-bit?

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
