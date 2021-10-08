Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FA3427338
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 23:51:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HR22G08F1z30Bm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 08:51:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.173;
 helo=mail-qk1-f173.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HR21l5xWGz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 08:50:51 +1100 (AEDT)
Received: by mail-qk1-f173.google.com with SMTP id g21so10897817qki.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Oct 2021 14:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=87pjQOukYh/71KH9vTFlkUdLWGcZvypjWjlv+KGMBmE=;
 b=UzwVByIbQjXF89sE0u2qJQKrZq6ke2fQr45GE1qLA9yhCu8JTalWn3LyNL+HBSkPGb
 eDCH+fM32uzlidJ6Y5GMBWriXb0eKSlGVB7l5FGZfWzYjaNpYefj8/i05SM6N0tKIz4g
 zgvf+M5ujPPQMHqtoV44bEXWJvdJMM3hImBV0LV8OqLNyPjtotPNQGCFCQsE8yD2N5Px
 9c436KCzkFqiKNd+/aTbGzIbrkFbnITAXlOFZrW+oBLEzUEkrhfckF3jV6/1bk/vU+Zc
 M8+S/wSPJn4Msq9YIQiKh1CzPzLHGjXED9KzpSIN/n7n7ieBHBDFhL8j0nCkt7oO+hce
 byhA==
X-Gm-Message-State: AOAM5334AMSF4V22veXSQr12G32piE9qPMGMcnYpgaKP/IAAVy/HovAX
 sSXXeI2dKzKf48xSDf+Dglbwbq2ziZ0=
X-Google-Smtp-Source: ABdhPJwbLJFYFB1TUR7VSterRRsqZA6rsUEYZsI5NAFpF0ZsIdOvyeI9AeFZZsqbDciU9iX215w8Tw==
X-Received: by 2002:a37:2ec6:: with SMTP id u189mr5048655qkh.466.1633729847588; 
 Fri, 08 Oct 2021 14:50:47 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com.
 [209.85.222.181])
 by smtp.gmail.com with ESMTPSA id m11sm712967qkp.0.2021.10.08.14.50.46
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 14:50:47 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id p4so10923662qki.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Oct 2021 14:50:46 -0700 (PDT)
X-Received: by 2002:a37:c12:: with SMTP id 18mr5001969qkm.12.1633729846634;
 Fri, 08 Oct 2021 14:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211001000924.15421-1-leoyang.li@nxp.com>
 <20211001000924.15421-2-leoyang.li@nxp.com>
 <db751cb1-9107-3857-7576-644bde4c28e5@canonical.com>
 <CADRPPNROVBp_QB=6XEgk8WF5fnEPFTSko4Nn+mm8oLM3iGTuuw@mail.gmail.com>
 <e42fa620-810b-fdcc-c827-602a14d10d97@canonical.com>
In-Reply-To: <e42fa620-810b-fdcc-c827-602a14d10d97@canonical.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 8 Oct 2021 16:50:35 -0500
X-Gmail-Original-Message-ID: <CADRPPNQ=32pzrLLqB+a_Ek6U8GcTeNDB18pRY_f2+JYcxDo0=Q@mail.gmail.com>
Message-ID: <CADRPPNQ=32pzrLLqB+a_Ek6U8GcTeNDB18pRY_f2+JYcxDo0=Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: memory: fsl: convert ifc binding to yaml
 schema
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
 <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 4, 2021 at 4:32 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 01/10/2021 18:17, Li Yang wrote:
> > On Fri, Oct 1, 2021 at 5:01 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
>
> (...)
>
> >>> +
> >>> +  interrupts:
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +    description: |
> >>> +      IFC may have one or two interrupts.  If two interrupt specifiers are
> >>> +      present, the first is the "common" interrupt (CM_EVTER_STAT), and the
> >>> +      second is the NAND interrupt (NAND_EVTER_STAT).  If there is only one,
> >>> +      that interrupt reports both types of event.
> >>> +
> >>> +  little-endian:
> >>> +    $ref: '/schemas/types.yaml#/definitions/flag'
> >>
> >> type: boolean
> >
> > It will not have a true or false value, but only present or not.  Is
> > the boolean type taking care of this too?
>
> boolean is for a property which does not accept values and true/false
> depends on its presence.
> See:
> Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml

From the dtschema/schemas/types.yaml file, flag type is defined as:
  flag:
    oneOf:
      - type: boolean
        const: true
      - type: 'null'

It looks like more than the boolean type itself.  But if the standard
boolean type is actually the same as the flag type we defined.
Shouldn't we remove the custom flag type then?

Regards,
Leo
