Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0241F228
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 18:30:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLbF83gr5z30D0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 02:30:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.179;
 helo=mail-qt1-f179.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLbDh3bzdz2yPR
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 02:29:55 +1000 (AEST)
Received: by mail-qt1-f179.google.com with SMTP id j13so9501329qtq.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 09:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ITh0BGr5DcDj7xCp1Z0IhOFPgiSIbzrRXYfEGa/wJE=;
 b=Ds11eRV19tU1qBg7EJSu5VtI9Gy9eaw7A5pM0tVOOQODqEYnyJVta75zYfKi+Yp2ra
 qdgWTvu1zcv55iULBwsiEZRDiiiK1Gk6s61igBO+Ow5DylcT42gFeiAdx6WjsvrQ1Kdy
 aCXFO2LeNQyzBXIpHxxtPZj2qD98MgM7PC031eQpgBsQMzpRgwGNR86CALNPuUqLtzXl
 al7T59XnuyOEPtBYWU5TXXaCIHpQOtZZb5ktI3A7CfgWOi/+cfmEH1zTJQhdQS0pb4TA
 4Lunl1aDbNAsXIO72nRSuSp6DDZDnl9Vi5vib/lJ1erK73UbslvrooB83YgNDB/kn9mR
 vbNw==
X-Gm-Message-State: AOAM533og0sGJG9dGzhaxAwn/dy5CN8h9cajynj/Qrxtf8Zi8ZkMLDzW
 42daNLxSl79sNZrA7TBBVmQ5JeTbK3s=
X-Google-Smtp-Source: ABdhPJzMOfXVyPq/PFWDsHBiQHKNDVBERv/YfM33qXFD95pwG5njynILHRG9X7KXfCliIPY80bOIjg==
X-Received: by 2002:ac8:20a:: with SMTP id k10mr13631319qtg.7.1633105792336;
 Fri, 01 Oct 2021 09:29:52 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175])
 by smtp.gmail.com with ESMTPSA id o23sm3654199qtl.74.2021.10.01.09.29.51
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 09:29:52 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id f15so9488245qtv.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 09:29:51 -0700 (PDT)
X-Received: by 2002:ac8:74c7:: with SMTP id j7mr6215018qtr.118.1633105791433; 
 Fri, 01 Oct 2021 09:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211001000924.15421-1-leoyang.li@nxp.com>
 <20211001000924.15421-2-leoyang.li@nxp.com>
 <1633094217.843390.3666440.nullmailer@robh.at.kernel.org>
In-Reply-To: <1633094217.843390.3666440.nullmailer@robh.at.kernel.org>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 1 Oct 2021 11:29:39 -0500
X-Gmail-Original-Message-ID: <CADRPPNQBR63pS60nmfUQx02GbBoWEbgroU5Zw-iY62TodmB91Q@mail.gmail.com>
Message-ID: <CADRPPNQBR63pS60nmfUQx02GbBoWEbgroU5Zw-iY62TodmB91Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: memory: fsl: convert ifc binding to yaml
 schema
To: Rob Herring <robh@kernel.org>
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
 lkml <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 1, 2021 at 8:18 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 30 Sep 2021 19:09:20 -0500, Li Yang wrote:
> > Convert the txt binding to yaml format and add description.  Drop the
> > "simple-bus" compatible string from the example and not allowed by the
> > binding any more.  This will help to enforce the correct probe order
> > between parent device and child devices, but will require the ifc driver
> > to probe the child devices to work properly.
> >
> > Signed-off-by: Li Yang <leoyang.li@nxp.com>
> > ---
> > updates from previous submission:
> > - Drop "simple-bus" from binding and only "fsl,ifc" as compatible
> > - Fix one identiation problem of "reg"
> > - Add type restriction to "little-endian" property
> >
> >  .../bindings/memory-controllers/fsl/ifc.txt   |  82 -----------
> >  .../bindings/memory-controllers/fsl/ifc.yaml  | 137 ++++++++++++++++++
> >  2 files changed, 137 insertions(+), 82 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/memory-controllers/fsl/ifc.example.dt.yaml:0:0: /example-0/soc/ifc@ffe1e000/flash@1,0: failed to match any schema with compatible: ['fsl,ifc-nand']
> Documentation/devicetree/bindings/memory-controllers/fsl/ifc.example.dt.yaml:0:0: /example-0/soc/ifc@ffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']

These are defined in other bindings, but unfortunately they are not
converted to yaml format yet.

>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1535102
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
