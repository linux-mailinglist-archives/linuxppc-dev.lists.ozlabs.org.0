Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF55AB980
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 22:37:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK8qc2pHpz3c6X
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 06:37:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.48; helo=mail-oa1-f48.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK8qB0Jnzz2yS0
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 06:37:25 +1000 (AEST)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-11f4e634072so7492876fac.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 13:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=D5I2FegB0/865hyvFadrtO3KVuPLcvZSOcVWjIZiMYE=;
        b=VwYk4zwXn2O++jnKJaBmIzvq1EV5QIhm1Su0yjqSgq3dmEbas2Eu8YZhA7Tv3T1SWs
         JywI+XyY+PDXyUdjhKPFmRwRXu9/cTx/bg0DkoPOPowukY1hOniPjskQLu3Y4y66rRVU
         +m9sc2YeDS+8OZOA9pt4rKgzDbdhgY1aNl68NLfFmoz8HEjnuHUdLQ7mgDLtqpk9Jd4q
         pL2N5spt6HVCFxt/bG0rzix7OIZdl9dZGbyWRDiNVtdVVAXD39fcvsWjJGRr4eQDfISZ
         PczQaPEdVmF/crhHyiD9j4Mxa27ev8N9gl421ZVJSfuJbMKrn4VlFurGEjePIsFrCIn8
         26nw==
X-Gm-Message-State: ACgBeo2VcAeVtlEu66EhE+yJ63y3Ggh3jCXbgTT9ds1wkL+NuxchYZ7n
	bmtln2o60o0PF2NaOgWLSw==
X-Google-Smtp-Source: AA6agR74vMjIV6E6x7glZrZm9SKfzRvLDhnq5sddCSsKFOxouv32JrJa1HCse/8QJkatK6iljKePLQ==
X-Received: by 2002:a05:6870:d7a5:b0:11d:a0b:f62b with SMTP id bd37-20020a056870d7a500b0011d0a0bf62bmr3000832oab.190.1662151042314;
        Fri, 02 Sep 2022 13:37:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e28-20020a544f1c000000b003436fa2c23bsm1408427oiy.7.2022.09.02.13.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 13:37:21 -0700 (PDT)
Received: (nullmailer pid 372769 invoked by uid 1000);
	Fri, 02 Sep 2022 20:37:21 -0000
Date: Fri, 2 Sep 2022 15:37:21 -0500
From: Rob Herring <robh@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: reset: syscon-reboot: Add priority
 property
Message-ID: <20220902203721.GA356619-robh@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220822124728.GA3641041-robh@kernel.org>
 <20220822135050.o4a4bw3dqkmhtjgb@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220822135050.o4a4bw3dqkmhtjgb@pali>
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

On Mon, Aug 22, 2022 at 03:50:50PM +0200, Pali Rohár wrote:
> On Monday 22 August 2022 07:47:28 Rob Herring wrote:
> > On Sat, Aug 20, 2022 at 12:29:23PM +0200, Pali Rohár wrote:
> > > This new optional priority property allows to specify custom priority level
> > > of reset device. Default level was always 192.
> > 
> > Why do we need/want this? What problem does it solve?
> 
> See patch 3/3.
> 
> > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > > ---
> > >  .../devicetree/bindings/power/reset/syscon-reboot.yaml        | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> > > index da2509724812..d905133aab27 100644
> > > --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> > > +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> > > @@ -42,6 +42,10 @@ properties:
> > >      $ref: /schemas/types.yaml#/definitions/uint32
> > >      description: The reset value written to the reboot register (32 bit access).
> > >  
> > > +  priority:
> > 
> > A bit too generic for the name.
> > 
> > > +    $ref: /schemas/types.yaml#/definitions/sint32
> > > +    description: Priority level of this syscon reset device. Default 192.
> > 
> > default: 192
> > 
> > 
> > Though I'm not really sure about the whole concept of this in DT. Where 
> > does 192 come from?
> 
> Implicitly from the current implementation and how it is used.

Implementation of what? u-boot? BSD? robOS?

> > Presumably if we have more than 1 reset device, then 
> > 'priority' is needed in multiple places. So you need a common schema 
> > defining the property (as property types should be defined exactly 
> > once) which this schema can reference.
> > 
> > Rob
> 
> Sorry, I do not understand.

So just keep sending new versions instead?

syscon-reboot is not the only binding for a system reset device, right? 
So those others reset devices will need 'priority' too. For a given 
property, there should only be one schema definition defining the type 
for the property. Otherwise, there might be conflicts. So you need a 
common schema doing that. And here you would just have 'priority: true' 
or possibly some binding specific constraints.

Rob
