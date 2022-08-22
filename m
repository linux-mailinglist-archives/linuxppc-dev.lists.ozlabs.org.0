Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4704759C54E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 19:46:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBKXz3qzMz3chs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 03:46:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.178; helo=mail-oi1-f178.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBKXX5pRPz3bsy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 03:46:03 +1000 (AEST)
Received: by mail-oi1-f178.google.com with SMTP id t140so4226635oie.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 10:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ifHDFxdQQ4rKGhhjDb2X0gYbrmGOuiotWdJhKeoht1I=;
        b=tZYGMapUT87KF3e2a+f7H1sR6QbWynnWoSisXSgLV56Gd0qup3QuujIl1qqRM5tWVo
         E7NsdPS7P8KqWG1+ldSHI6JFA6FcAy9Bh6IdLOoyOheFQ5gLVk8thAoinln/V+wAp8GB
         5CecGAbxznRkgO2M0nOMDJ9mnZLsXZ+MCmdMvfQ+l6TLlo0K10aZMgzoZnRVZoTHIS7i
         OIikKdGF0T8gmgpIXws20GQusGDow6TbpDFnfbOZrvBDNshQKRoD64boKfiseWSI1htL
         9OCedfEoMwze9NzXCx7hJIvdj51lAV4mTf3+Wd/FpQWriSEqpi2iS8cu+1So6Kx90ie0
         ZRRQ==
X-Gm-Message-State: ACgBeo3EVLbS1CmDhWtfIy5dfSdSPIfG0WbseO02OIrMPouFO+QEKe5G
	q76tlSZyXYh6BE8eGag0Zw==
X-Google-Smtp-Source: AA6agR5QsREs07ny8eIvz2gV/Ar/7vPkMTzYP+oipTqEbuZIqX+RuZlDjP55UFVzlilAKJUOEVqv8w==
X-Received: by 2002:aca:5bc3:0:b0:345:30a2:89da with SMTP id p186-20020aca5bc3000000b0034530a289damr6755128oib.3.1661190360670;
        Mon, 22 Aug 2022 10:46:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k188-20020a4a4ac5000000b0042859bebfebsm2605613oob.45.2022.08.22.10.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 10:46:00 -0700 (PDT)
Received: (nullmailer pid 39462 invoked by uid 1000);
	Mon, 22 Aug 2022 17:45:59 -0000
Date: Mon, 22 Aug 2022 12:45:59 -0500
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH net-next v4 2/8] dt-bindings: net: fman: Add additional
 interface properties
Message-ID: <20220822174559.GA39398-robh@kernel.org>
References: <20220804194705.459670-1-sean.anderson@seco.com>
 <20220804194705.459670-3-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804194705.459670-3-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 04 Aug 2022 15:46:59 -0400, Sean Anderson wrote:
> At the moment, mEMACs are configured almost completely based on the
> phy-connection-type. That is, if the phy interface is RGMII, it assumed
> that RGMII is supported. For some interfaces, it is assumed that the
> RCW/bootloader has set up the SerDes properly. This is generally OK, but
> restricts runtime reconfiguration. The actual link state is never
> reported.
> 
> To address these shortcomings, the driver will need additional
> information. First, it needs to know how to access the PCS/PMAs (in
> order to configure them and get the link status). The SGMII PCS/PMA is
> the only currently-described PCS/PMA. Add the XFI and QSGMII PCS/PMAs as
> well. The XFI (and 10GBASE-KR) PCS/PMA is a c45 "phy" which sits on the
> same MDIO bus as SGMII PCS/PMA. By default they will have conflicting
> addresses, but they are also not enabled at the same time by default.
> Therefore, we can let the XFI PCS/PMA be the default when
> phy-connection-type is xgmii. This will allow for
> backwards-compatibility.
> 
> QSGMII, however, cannot work with the current binding. This is because
> the QSGMII PCS/PMAs are only present on one MAC's MDIO bus. At the
> moment this is worked around by having every MAC write to the PCS/PMA
> addresses (without checking if they are present). This only works if
> each MAC has the same configuration, and only if we don't need to know
> the status. Because the QSGMII PCS/PMA will typically be located on a
> different MDIO bus than the MAC's SGMII PCS/PMA, there is no fallback
> for the QSGMII PCS/PMA.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Add vendor prefix 'fsl,' to rgmii and mii properties.
> - Set maxItems for pcs-names
> - Remove phy-* properties from example because dt-schema complains and I
>   can't be bothered to figure out how to make it work.
> - Add pcs-handle as a preferred version of pcsphy-handle
> - Deprecate pcsphy-handle
> - Remove mii/rmii properties
> 
> Changes in v2:
> - Better document how we select which PCS to use in the default case
> 
>  .../bindings/net/fsl,fman-dtsec.yaml          | 53 ++++++++++++++-----
>  .../devicetree/bindings/net/fsl-fman.txt      |  5 +-
>  2 files changed, 43 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
