Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 537225AB987
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 22:41:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK8vf148Fz3c7H
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 06:41:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.53; helo=mail-oa1-f53.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK8vF5rcrz2x9L
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 06:40:57 +1000 (AEST)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1225219ee46so7673993fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 13:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=U5bfnocd2IXvJjzkeYcrneHAtTL0tLxVWAnFTPonQPs=;
        b=qP8ccJQ5EKh3Sz/uTr+aQiizznQr3Att2s49WXuwsVxWzM9gqlBjSyvuxzam3FhirY
         Y00M048bHYE81NExgmJFY+i8cscRwcevDusQ0F6vBIdN2b0AIPirZr/+48ivpamNYbsd
         cEGOjqkKcLjJruoczwYpOUbNgRpJbBALZEjLTicwel+CTGN3kGMtY3QcyEfpOL/SViMh
         8kqAfWCNiqo7pC0u6pj35pGF8hDGozcYJyT4dQA4F4IUi7hhYhBkSI/y8HGqGHoe+ChG
         HJrfut2xgZ2xvneauDsGYrdKaow0lFZrLSAhUk/kAdL8nDNPBV9v2QAD2xuo1afluB8n
         D2Jw==
X-Gm-Message-State: ACgBeo0Md7OU5F8geD6FPFKzXJaNmjLF6oOh2rfLnNhi5/YmVWAX5j3X
	pw+cJPCAZhSuS2kRy+PHCZ7/baHTWg==
X-Google-Smtp-Source: AA6agR7c9KlrcKvup9eSN+hecDDFBvkHt8bHoU6QtfOak5USU4slqSnsd1aqOh60IhLub4MMC1iPKQ==
X-Received: by 2002:a05:6808:17a3:b0:343:300a:6a96 with SMTP id bg35-20020a05680817a300b00343300a6a96mr2537106oib.169.1662151255041;
        Fri, 02 Sep 2022 13:40:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h6-20020a9d6406000000b00636f7059b27sm1534212otl.5.2022.09.02.13.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 13:40:54 -0700 (PDT)
Received: (nullmailer pid 377769 invoked by uid 1000);
	Fri, 02 Sep 2022 20:40:54 -0000
Date: Fri, 2 Sep 2022 15:40:54 -0500
From: Rob Herring <robh@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: reset: syscon-reboot: Add priority
 property
Message-ID: <20220902204054.GB356619-robh@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220830230012.9429-1-pali@kernel.org>
 <a5d148c1-70c1-4e86-a50c-7dc6da45ff2f@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5d148c1-70c1-4e86-a50c-7dc6da45ff2f@www.fastmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 31, 2022 at 09:26:17AM +0200, Arnd Bergmann wrote:
> On Wed, Aug 31, 2022, at 1:00 AM, Pali Rohár wrote:
> > a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml 
> > b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> > index da2509724812..4c8b0d0a0111 100644
> > --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> > +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> > @@ -42,6 +42,11 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description: The reset value written to the reboot register (32 
> > bit access).
> > 
> > +  priority:
> > +    $ref: /schemas/types.yaml#/definitions/int32
> > +    description: Priority level of this syscon reset device.
> > +    default: 192
> > +
> 
> My first thought was that this is looks very Linux specific and
> probably should be documented as such. However I see there is
> already precedent in
> Documentation/devicetree/bindings/power/reset/gpio-restart.yaml,
> which defines the same thing with a more detailed description.
> 
> Since this is an optional property for both, and it has the
> same meaning here, is it possible to move the description
> to a common place where it either gets included from both,
> or from all reboot bindings?

Yes, that is what I said in my other replies.

Rob
