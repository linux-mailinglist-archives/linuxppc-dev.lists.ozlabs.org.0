Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A644C53D2CB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 22:24:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LFDrd1Hw5z3cBw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 06:24:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.172; helo=mail-oi1-f172.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LFDrC5tlBz3bmH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jun 2022 06:24:27 +1000 (AEST)
Received: by mail-oi1-f172.google.com with SMTP id r206so11800421oib.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun 2022 13:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LpgNDBdoP6t/KspsiFUK1Wc3xwi9X5pe8MvB3spUO50=;
        b=bT4n19Z9Z5e0VifEpCDsiF0tvEoHVFby5cCWbSJ8NEd9y8uM2sJYqRT/xwFGyOVUMx
         dKXljKJ32jTg8wwf41ZhLd6ad8kpHvvolxDAHafjtzp5R8EEJ6gcUzjqclCtqEuxcgkZ
         J4PHGHnzEcwgyES+a5ZNvw/mWAnmR3IuMoWa/+yvo/pV46bUKbvow1iGsIGMODJ0iYOH
         TVs+cXnEOcl/hKQ95cCkAoXrAn9eF5+31jriXUq/q27dcEP9+9HFPmwaes5gNB8xluod
         rvu0v133M1ls0Ld29PGJ7OnmTiMXHfbSgwmPra4kgJvPbUq/MRXS5g6qIWJwjdVCLxa8
         2Iqg==
X-Gm-Message-State: AOAM5336zXuxMUVHD0wp1cdp56XttaonD1ZLRA/3R4Ii7xZ7dXdf+sUe
	ZdMZyKSSfF/m3Rml2Um/5Q==
X-Google-Smtp-Source: ABdhPJyAyekreTTcq3AklohCDOmKQVGg8+La0qAOOFzpP42Wl6yg4YtE9wkVWK6Zz4dB/w01fJ63Zg==
X-Received: by 2002:a05:6808:2002:b0:32e:5e09:5201 with SMTP id q2-20020a056808200200b0032e5e095201mr1449575oiw.91.1654287864839;
        Fri, 03 Jun 2022 13:24:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r26-20020a4ad4da000000b0041b5d2f3c92sm536552oos.24.2022.06.03.13.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 13:24:24 -0700 (PDT)
Received: (nullmailer pid 846852 invoked by uid 1000);
	Fri, 03 Jun 2022 20:24:22 -0000
Date: Fri, 3 Jun 2022 15:24:22 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Subject: Re: [PATCH v2 1/4] of: constify of_property_check_flags() prop
 argument
Message-ID: <20220603202422.GA845694-robh@kernel.org>
References: <20220601081801.348571-1-clement.leger@bootlin.com>
 <20220601081801.348571-2-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220601081801.348571-2-clement.leger@bootlin.com>
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
Cc: David Hildenbrand <david@redhat.com>, Paul Mackerras <paulus@samba.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>, Frank Rowand <frowand.list@gmail.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Steen Hegelund <steen.hegelund@microchip.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, YueHaibing <yuehaibing@huawei.com>, Bjorn Helgaas <helgaas@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Allan Nielsen <allan.nielsen@microchip.com>, Laurent Dufour <ldufour@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Lizhi Hou <lizhi.hou@xilinx.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 01 Jun 2022 10:17:58 +0200, Clément Léger wrote:
> This argument is not modified and thus can be set as const.
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
> ---
>  include/linux/of.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

As this looks independent of the rest of the series, applied, thanks!
