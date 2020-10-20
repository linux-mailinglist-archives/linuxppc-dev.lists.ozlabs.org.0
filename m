Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45338294362
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 21:42:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG3tv6QkNzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 06:42:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=googlemail.com (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com;
 envelope-from=martin.blumenstingl@googlemail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20161025 header.b=GX3Yqx/L; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG3rp00M7zDqXw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 06:40:56 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id 184so3583996lfd.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 12:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SW+VSHIXtiXnaj2ApmMbMQMGmNjny+0l3tNBxFDXzPQ=;
 b=GX3Yqx/LGzHLUIjGjsF1kKPysogDyG2vVY+8s+N8PTYhKPTyh4ACcyF24+wMsvDkWV
 HoMpNTIC+E6bYuB8fDaKiYToCjnyJy6T5P8ksA6DbiLXI/qy2awow9Wiy4i+9ico7tmr
 g6jxHMX3ONcndVRYk8KlG6vNoPIB1NwOrTcKrEG/xos8ZEWNISy0RXB0os+sLxmUtWNF
 mgBSgcXSWHi7HK7kT9NbcjuAFZmSoLbt447t0YfPcndqwk592RUbYmWW1b5IBWZnDxKd
 4tKQPDU3IsTlwgNvOBhPO3gCVZHDTNVuPZstd9pobY90Gnq6dtOLbL4656x9U1Qqpt1D
 D3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SW+VSHIXtiXnaj2ApmMbMQMGmNjny+0l3tNBxFDXzPQ=;
 b=mF0sJRZK/0vwF0+fjxGRl72UbwRu8LNzf9NHHC6abhgl4GPhH2CJ4Bn12c9icdB2Yj
 jynGdAflSsTpKfi/Sy2Z0QOgttdVUo5KgLCEYGwnvPEYIt6rSsJR1SG8Ycm/Kow0/AA+
 OOZBlRRVFL+weJigW6oYjCpMLb3s46MffGhl2D6C048zycq9tV9On3RhWGQlD146e6li
 Gywp2/F0wGAzT0dPyoXhAL8d4zqiC2Oegzsi7jI8lEPZOBLMaCpCxWj1V0rxHWyYqSFB
 MokKSgClc4dbursCNl0TOz42FBYc6g+urNs5stn7x8rvVeqEuyOkWTtHU+k/PiTnZ9NQ
 4OhQ==
X-Gm-Message-State: AOAM530ig8bK6vzBdmfZqGnWrmAcVt++6YvE8s6uUMYp8+JKSjNbx1ZT
 NHMmaumT4xx9kzP8ib5AHN3RrvINyPKwQaLPVw4j5LJWqyw=
X-Google-Smtp-Source: ABdhPJyz+B9K91a/msM+dSi3tWDZXEiIxtxc7t7+Nz5WVzNWfdgNtM43dsiSzf+FIStCK900mQNbeVT/50ZkdTQrSrg=
X-Received: by 2002:aa7:c683:: with SMTP id n3mr4407224edq.146.1603222460451; 
 Tue, 20 Oct 2020 12:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru>
 <20201020112101.19077-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020112101.19077-6-Sergey.Semin@baikalelectronics.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Oct 2020 21:34:09 +0200
Message-ID: <CAFBinCA+4c6pjYFx3MW3-G=rCKon_jUXQ77pYSxXpRE9k0mpAA@mail.gmail.com>
Subject: Re: [PATCH v3 05/16] dt-bindings: usb: usb-hcd: Add generic "usb-phy"
 property
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 20, 2020 at 1:21 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> Even though the Generic PHY framework is the more preferable way of
> setting the USB PHY up, there are still many dts-files and DT bindings
> which rely on having the legacy "usb-phy" specified to attach particular
> USB PHYs to USB cores. Let's have the "usb-phy" property described in
> the generic USB HCD binding file so it would be validated against the
> nodes in which it's specified. Mark the property as deprecated to
> discourage the developers from using it.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
