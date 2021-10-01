Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F6C41F5EE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 21:52:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLgk448nVz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 05:52:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.47; helo=mail-qv1-f47.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLgjZ1Xkfz2ybL
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 05:51:45 +1000 (AEST)
Received: by mail-qv1-f47.google.com with SMTP id a14so6260503qvb.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 12:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CP2czsJFLPOz9RraUZFgCkPw+6TZRIivrlAU3dXRTyE=;
 b=Bqlf4y5xlMoDsq8KAIJrUS59IVSTbySRjvHHhGgv3dgzcfNWB3lBTDwuvqLnXzH42v
 SdS+OQqvc46xzwnwHoV6YOGTz5U4Djwnpa7/v2ZhsnDoO4vFlKkQTumr/Xba+vl9am9g
 axOopV0hyuAWk1yISK2KaMdAAnhhrSPwt3/GfRn0tXJcQXbDtV3YFmADIn+dwkEbuM4t
 82YJPvqEKvYPUilY4XC2aLivuKwKAaa5zrvOIFJo/oTCsKlg31Mpu2SLoXboaFkdArMj
 bzsPzcoYU1br+/xq+I382LiQen52cIyWnTOa1Js6hBCkuXbethOVBlGhXdfqJCpNw3o2
 KKIw==
X-Gm-Message-State: AOAM531OOhbwLYbCFmcHk0GgB2ia12G7Oorv26b5q/1yOnWQEpbzPKZc
 4hjmgYKwym7S5LhVTgYBfL+Qkv8EksA=
X-Google-Smtp-Source: ABdhPJyotzM4h+81IVtmoQpspZ1QHvsvMcoK7rIcnJ1G7o0XQUC9ViTY1/hHsE+RaBItvny1adEUYA==
X-Received: by 2002:a0c:9146:: with SMTP id q64mr10924699qvq.38.1633117901750; 
 Fri, 01 Oct 2021 12:51:41 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182])
 by smtp.gmail.com with ESMTPSA id n13sm3459454qke.100.2021.10.01.12.51.40
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 12:51:41 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id f15so10068638qtv.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 12:51:40 -0700 (PDT)
X-Received: by 2002:ac8:1e0e:: with SMTP id n14mr14774869qtl.95.1633117900842; 
 Fri, 01 Oct 2021 12:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211001000924.15421-1-leoyang.li@nxp.com>
 <4697aa5c-35de-8331-e7a9-831837618477@canonical.com>
In-Reply-To: <4697aa5c-35de-8331-e7a9-831837618477@canonical.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 1 Oct 2021 14:51:29 -0500
X-Gmail-Original-Message-ID: <CADRPPNRv2n7RHX9=2CTQ25Qce1PNeJnYZ3rt1EwYuCx5Ku5-PQ@mail.gmail.com>
Message-ID: <CADRPPNRv2n7RHX9=2CTQ25Qce1PNeJnYZ3rt1EwYuCx5Ku5-PQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] convert ifc binding to yaml and drop "simple-bus"
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 1, 2021 at 4:46 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 01/10/2021 02:09, Li Yang wrote:
> > Convert the ifc binding to yaml schema, in the mean while remove the
> > "simple-bus" compatible from the binding to make sure ifc device probes
> > before any of the child devices.  Update the driver and existing DTSes
> > accordingly.
> >
> > DTS changes should be merged together with the driver/binding changes
> > if DTS maintainer is ok with it or after the driver changes are applied.
> >
>
> It's discouraged to merge DTS along with drivers (e.g. soc folks don't
> accept such pull requests), so I propose to apply it in the next cycle.

Ok.  Will separate the DTS changes in the next version.

>
> Best regards,
> Krzysztof
