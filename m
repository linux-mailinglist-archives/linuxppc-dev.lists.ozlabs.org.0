Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3623E262224
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 23:51:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmJkJ2BNSzDqMF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 07:51:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.196;
 helo=mail-il1-f196.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmJgc0YRkzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 07:48:43 +1000 (AEST)
Received: by mail-il1-f196.google.com with SMTP id t13so371321ile.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 14:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ykDez5db4Tg7JVuX7yTUCZ67kcBqZSeX+Z9NmcRdJzo=;
 b=ELCmL+U7vYDDxqILdBV22YtV22i9oqLHLCBWsueJVQr8055NBvwDg8LoQ3nNs6OIib
 FipyPslvUdGDKHIAP+8IWEwlq9TTIfhBmeCyuEPxZTKJNyuVA0Cf7xMUSjI9hj/2jDsz
 70WCrOC935XEMt5+0JoWDuKoN2VD23RlsC+6vOWgSpPx0afNqyfGfEqIKTRA3RnZRcpa
 fnmdUekddk9fYsujSkZ2Qkv4LtfBUnQsa9kjzNZeGbRHz50kDasXp5u//Y7ICs+OcCOI
 Sm/LTIG1GNvcmpi4wrXju1yURKzyuJE+xIIZts9T2IKVwRighN5vEDoxOqNrxW/sxWli
 +NEQ==
X-Gm-Message-State: AOAM5302XOf6nVXNaAc6wumBbaBFOnh5irHSMYwi+XA3jbwi+UKy24Y/
 Il8+WLAvNgz/bvuWaI9EpA==
X-Google-Smtp-Source: ABdhPJwskaz0wCDXi8foT/IWYK5iyOa+/wg9K9BuESseQJfz6jF847jD/XiRsH6le8yJLULQsKFXXA==
X-Received: by 2002:a92:d792:: with SMTP id d18mr791213iln.195.1599601721478; 
 Tue, 08 Sep 2020 14:48:41 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id k11sm294466iof.40.2020.09.08.14.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 14:48:40 -0700 (PDT)
Received: (nullmailer pid 987185 invoked by uid 1000);
 Tue, 08 Sep 2020 21:48:39 -0000
Date: Tue, 8 Sep 2020 15:48:39 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: vendor-prefixes: Add Cisco Meraki vendor
 prefix
Message-ID: <20200908214839.GA987127@bogus>
References: <20200822154045.16036-1-chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200822154045.16036-1-chunkeey@gmail.com>
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com,
 Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 22 Aug 2020 17:40:45 +0200, Christian Lamparter wrote:
> Meraki was founded in 2006. The start-up quickly rose to prominence
> by being based in part on the MIT Roofnet Project.
> In December 2012, Cisco Systems, Inc. bought Meraki.
> The "Meraki" branding is still around to this day.
> 
> Web site of the company: https://meraki.cisco.com/
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> 
> v1 -> v2:
> 	Split from Meraki MR32 upstreaming attempt. (Florian Fainelli)
> 	(This patch will be needed for the MR24 upstreaming series as well)
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
