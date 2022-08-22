Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 992F859BFB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 14:47:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBBwT2c0rz3chQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 22:47:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.48; helo=mail-ot1-f48.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBBw438t2z3bq5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 22:47:31 +1000 (AEST)
Received: by mail-ot1-f48.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso7599559otb.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 05:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=7cbjI0WaZhQTvZlNz7q5LmNIlRjDT3q4dyHallkLrTo=;
        b=0mIiSgJhLzPOCCPGHfVVQICE7mdf7QXptYf7uyE2mBjVRFp/0hlnUBb5o9FZvwMVd9
         9MrsotR9LE5Ay3cqz5JYYJo8VCxI6cGTpWTAYk1ceJFcXZ7HuY95m/ns+4EgE5+Oq0ML
         NOD7hZg6Zg6obs57J/0+tfg556rk4aaPfRUWm1Aa25apZDm2p+YVa1cWAznohE63o6qD
         971ucbgRqTndMR3CotnO1VjvtRGxXM53rdXyF8Ac6x2obeAB1EyssFvx9E4/unR2q5Zd
         2hi9Oa/usYaz5K7E417JOQ18jA33PCu0UXCr0wdtHINzwlXIwzoOHaGsDc3Z9bCDoFfH
         uQOw==
X-Gm-Message-State: ACgBeo0Q5v7Pmac95KFrxPjCw/kUER6dFP6zIJeHvoWKOepleuKCEjAl
	7S7E1ikGkwQW1VdElZBZGg==
X-Google-Smtp-Source: AA6agR6HuU3nFQ4lGlufxXNkmmzngtFFlaInk7mDi0EkehJepEpbode3NOBV0cAGi7IkodNWlHOamA==
X-Received: by 2002:a05:6830:310d:b0:637:1b6c:6647 with SMTP id b13-20020a056830310d00b006371b6c6647mr7668149ots.170.1661172448975;
        Mon, 22 Aug 2022 05:47:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k4-20020a056870570400b0010f07647598sm2978471oap.7.2022.08.22.05.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 05:47:28 -0700 (PDT)
Received: (nullmailer pid 3653297 invoked by uid 1000);
	Mon, 22 Aug 2022 12:47:28 -0000
Date: Mon, 22 Aug 2022 07:47:28 -0500
From: Rob Herring <robh@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: reset: syscon-reboot: Add priority
 property
Message-ID: <20220822124728.GA3641041-robh@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220820102925.29476-1-pali@kernel.org>
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
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 20, 2022 at 12:29:23PM +0200, Pali Rohár wrote:
> This new optional priority property allows to specify custom priority level
> of reset device. Default level was always 192.

Why do we need/want this? What problem does it solve?

> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  .../devicetree/bindings/power/reset/syscon-reboot.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> index da2509724812..d905133aab27 100644
> --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> @@ -42,6 +42,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: The reset value written to the reboot register (32 bit access).
>  
> +  priority:

A bit too generic for the name.

> +    $ref: /schemas/types.yaml#/definitions/sint32
> +    description: Priority level of this syscon reset device. Default 192.

default: 192


Though I'm not really sure about the whole concept of this in DT. Where 
does 192 come from? Presumably if we have more than 1 reset device, then 
'priority' is needed in multiple places. So you need a common schema 
defining the property (as property types should be defined exactly 
once) which this schema can reference.

Rob
