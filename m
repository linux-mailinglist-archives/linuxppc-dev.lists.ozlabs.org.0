Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A0316E71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 19:23:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbSnZ63FnzDwk3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 05:23:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MlwAqcU5; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbSlW1H5bzDvY0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 05:21:57 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id o38so1759600pgm.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 10:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8TFcRC9iuBJ2WpmnaxpftbN969itbGQeYgO1bGjpcN0=;
 b=MlwAqcU5lq3xtW4URVea9vtF+NPmlMi1NIgohMuFor/5HMe6Q+dSGhBhcE/uKNqa6T
 XjqlXzROz+mS6IfsQi9vXuYvstpNRMEELxhe+akanQCRSUhu923h9dCg2S9edNC91+MB
 l43SfYS0KJGrmnRluhIPKXiFhjfPhL9byHciPoj85cfkUOF8U5PLEjDUHtaGWYsv7Q5g
 IdNMw1wILY0Jfo2l8Fvh0OLWFXrWAdh5P323A0l5xs9WVsSiATwS1VI3hUjrQrK7oPSo
 uXoumYeHiHRhXg6u3J1Lcuv1cSHGVRz91tQPgF38Qhe6sM/4OaU80vL6bb/FEbvk5bSP
 OvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8TFcRC9iuBJ2WpmnaxpftbN969itbGQeYgO1bGjpcN0=;
 b=p5s3/DxoBUgGH3g2hc4iWRSOjBEMKkP5piIwqi/ibxhIIymtvTS/y4F3zaziki+ToW
 nzIX04Uue6/IjqsSRZOwNdK3UTKS33kEnZNWAmztWv8wA1AQXtNgOGF1obJnWr3Nj/H+
 aT1f+RYJHgbRR+pAEERW4ys0GhqHYFoiQMnTM0/z+sbThT9MNnTA14OqbVnkswJd3SFL
 PsrMlD2jc4i9UKve6MFm+W6TerisYs4mFjmFhFn3ctWsWIF7QfNFh8nqQmJD7PHOs/d1
 cO6q/IRsKPc779oepMq99j2/jSo0NRs9oLw3upoXqa7llG+CaKY0KUNcsufun9MtXnwz
 87Ug==
X-Gm-Message-State: AOAM5314brMCVVJbdfJYI/7yHBEMvJ6ndtJoVxy9yBCeFgoPY07YJ/H5
 JKTu5cvCY76Iqml43CxUItc=
X-Google-Smtp-Source: ABdhPJwbFbmNRwzZ0b+9Bx+X9kBjmFcm6TR/x+3xdjpPtXHA2XZxLa3IvLiTK6U9ADFhs0f1Hg0cVQ==
X-Received: by 2002:a63:eb42:: with SMTP id b2mr4296167pgk.284.1612981313120; 
 Wed, 10 Feb 2021 10:21:53 -0800 (PST)
Received: from [10.67.49.228] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id r189sm3020845pgr.10.2021.02.10.10.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 10:21:52 -0800 (PST)
Subject: Re: [PATCH RESEND v6 00/10] dt-bindings: usb: Harmonize
 xHCI/EHCI/OHCI/DWC3 nodes name
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Felipe Balbi <balbi@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <e169630f-1255-7597-86f2-63ee8760cc8c@gmail.com>
Date: Wed, 10 Feb 2021 10:21:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, Amelie Delaunay <amelie.delaunay@st.com>,
 Tony Lindgren <tony@atomide.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Paul Mackerras <paulus@samba.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, linux-samsung-soc@vger.kernel.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Rafal Milecki <zajec5@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Wei Xu <xuwei5@hisilicon.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Hauke Mehrtens <hauke@hauke-m.de>, linuxppc-dev@lists.ozlabs.org,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Jun Li <lijun.kernel@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Benoit Cousson <bcousson@baylibre.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>, linux-usb@vger.kernel.org,
 Patrice Chotard <patrice.chotard@st.com>, Li Yang <leoyang.li@nxp.com>,
 Kukjin Kim <kgene@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/10/21 9:28 AM, Serge Semin wrote:
> As the subject states this series is an attempt to harmonize the xHCI,
> EHCI, OHCI and DWC USB3 DT nodes with the DT schema introduced in the
> framework of the patchset [1].
> 
> Firstly as Krzysztof suggested we've deprecated a support of DWC USB3
> controllers with "synopsys,"-vendor prefix compatible string in favor of
> the ones with valid "snps,"-prefix. It's done in all the DTS files,
> which have been unfortunate to define such nodes.
> 
> Secondly we suggest to fix the snps,quirk-frame-length-adjustment property
> declaration in the Amlogic meson-g12-common.dtsi DTS file, since it has
> been erroneously declared as boolean while having uint32 type. Neil said
> it was ok to init that property with 0x20 value.
> 
> Thirdly the main part of the patchset concern fixing the xHCI, EHCI/OHCI
> and DWC USB3 DT nodes name as in accordance with their DT schema the
> corresponding node name is suppose to comply with the Generic USB HCD DT
> schema, which requires the USB nodes to have the name acceptable by the
> regexp: "^usb(@.*)?". Such requirement had been applicable even before we
> introduced the new DT schema in [1], but as we can see it hasn't been
> strictly implemented for a lot the DTS files. Since DT schema is now
> available the automated DTS validation shall make sure that the rule isn't
> violated.
> 
> Note most of these patches have been a part of the last three patches of
> [1]. But since there is no way to have them merged in in a combined
> manner, I had to move them to the dedicated series and split them up so to
> be accepted by the corresponding subsystem maintainers one-by-one.
> 
> [1] Link: https://lore.kernel.org/linux-usb/20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru/
> Changelog v1:
> - As Krzysztof suggested I've created a script which checked whether the
>   node names had been also updated in all the depended dts files. As a
>   result I found two more files which should have been also modified:
>   arch/arc/boot/dts/{axc003.dtsi,axc003_idu.dtsi}
> - Correct the USB DWC3 nodes name found in
>   arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} too.
> 
> Link: https://lore.kernel.org/linux-usb/20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru
> Changelog v2:
> - Drop the patch:
>   [PATCH 01/29] usb: dwc3: Discard synopsys,dwc3 compatibility string
>   and get back the one which marks the "synopsys,dwc3" compatible string
>   as deprecated into the DT schema related series.
> - Drop the patches:
>   [PATCH 03/29] arm: dts: am437x: Correct DWC USB3 compatible string
>   [PATCH 04/29] arm: dts: exynos: Correct DWC USB3 compatible string
>   [PATCH 07/29] arm: dts: bcm53x: Harmonize EHCI/OHCI DT nodes name
>   [PATCH 08/29] arm: dts: stm32: Harmonize EHCI/OHCI DT nodes name
>   [PATCH 16/29] arm: dts: bcm5301x: Harmonize xHCI DT nodes name
>   [PATCH 19/29] arm: dts: exynos: Harmonize DWC USB3 DT nodes name
>   [PATCH 21/29] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
>   [PATCH 22/29] arm: dts: omap5: Harmonize DWC USB3 DT nodes name
>   [PATCH 24/29] arm64: dts: allwinner: h6: Harmonize DWC USB3 DT nodes name
>   [PATCH 26/29] arm64: dts: exynos: Harmonize DWC USB3 DT nodes name
>   [PATCH 27/29] arm64: dts: layerscape: Harmonize DWC USB3 DT nodes name
>   since they have been applied to the corresponding maintainers repos.
> - Fix drivers/usb/dwc3/dwc3-qcom.c to be looking for the "usb@"-prefixed
>   sub-node and falling back to the "dwc3@"-prefixed one on failure.
> 
> Link: https://lore.kernel.org/linux-usb/20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru
> Changelog v3:
> - Drop the patches:
>   [PATCH v2 04/18] arm: dts: hisi-x5hd2: Harmonize EHCI/OHCI DT nodes name
>   [PATCH v2 06/18] arm64: dts: hisi: Harmonize EHCI/OHCI DT nodes name
>   [PATCH v2 07/18] mips: dts: jz47x: Harmonize EHCI/OHCI DT nodes name
>   [PATCH v2 08/18] mips: dts: sead3: Harmonize EHCI/OHCI DT nodes name
>   [PATCH v2 09/18] mips: dts: ralink: mt7628a: Harmonize EHCI/OHCI DT nodes name
>   [PATCH v2 11/18] arm64: dts: marvell: cp11x: Harmonize xHCI DT nodes name
>   [PATCH v2 12/18] arm: dts: marvell: armada-375: Harmonize DWC USB3 DT nodes name
>   [PATCH v2 16/18] arm64: dts: hi3660: Harmonize DWC USB3 DT nodes name
>   since they have been applied to the corresponding maintainers repos.
> 
> Link: https://lore.kernel.org/linux-usb/20201205155621.3045-1-Sergey.Semin@baikalelectronics.ru
> Changelog v4:
> - Just resend.
> 
> Link: https://lore.kernel.org/linux-usb/20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru/
> Changelog v5:
> - Drop the patch:
>   [PATCH v4 02/10] arm64: dts: amlogic: meson-g12: Set FL-adj property value
>   since it has been applied to the corresponding maintainers repos.
> - Get back the patch:
>   [PATCH 21/29] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
>   as it has been missing in the kernel 5.11-rc7
> - Rebase onto the kernel 5.11-rc7
> 
> Link: https://lore.kernel.org/lkml/20210208135154.6645-1-Sergey.Semin@baikalelectronics.ru/
> Changelog v6:
> - Just resend and add linux-usb.vger.kernel.org to the list of Ccecipients.


If this needs to go on, can you drop the people who already took your
patches (trying to lower my email amount to something manageable).
Thank you.
-- 
Florian
