Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F2137AAC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 17:34:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfhmW09QHz3bs9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 01:34:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZjsrZAwb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZjsrZAwb; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ffhm34MVWz2yXV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 01:33:55 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4305C6188B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 15:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620747232;
 bh=0ycZJyo5rPknGQbcP1uAKYtdIN0dctFP9qaEHA1Lmtk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZjsrZAwbc/lBKJzT5Qnk9hhA7hlNe9/+wsYAaQ2hCTHDuuS714UHT6/PWDkPLtFVN
 PGNsYrLkQZQ1njQMFNmrF+rY39q/TgojalbAiTiTFUb8PZp5nbjHm2FQrAyGecNVnb
 EFjtdDxosV0WEHHZtJzjScukgd4H65tzu8ct8/DgkOWVpEXiQRX93jUgit8bPoBFw8
 4UaZJ8n36ZGgLFTGYdVNhCLgSUAdMe+PK32kf2pkJ+5uBrTdO+Lm2MfL5TkWLGYyuF
 UzXOSq495Yh6kMMp2pjKebGAlUkklNesbZGSBbHQ6dUDDZshlwFG4FA61TEF9kzj8H
 s2J+Xs12uTA1Q==
Received: by mail-qk1-f179.google.com with SMTP id a2so19098897qkh.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 08:33:52 -0700 (PDT)
X-Gm-Message-State: AOAM530Mq7amM3T9/Ehb3m3zHTLRp/NjOKccEaa+qssEwQDso8dnzWQ9
 Xqcev1YwJYK9HnDU/2KivW1nD/dUV18UJ5woIw==
X-Google-Smtp-Source: ABdhPJzgBwoKu9MHPdLj91APOY8pzFmxS2DLOE3Q2ktzZ0fUiNWOhbcxKfUo1JHMW7OvuM894BUmNNo5VnEbhOJ8/vY=
X-Received: by 2002:a37:6116:: with SMTP id v22mr14616810qkb.464.1620747229748; 
 Tue, 11 May 2021 08:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
 <20210507004047.4454-2-chris.packham@alliedtelesis.co.nz>
 <20210507214936.GA2944698@robh.at.kernel.org>
 <c5d6f8d0-9b8a-b3bf-b7c3-884f03f7ecee@alliedtelesis.co.nz>
In-Reply-To: <c5d6f8d0-9b8a-b3bf-b7c3-884f03f7ecee@alliedtelesis.co.nz>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 May 2021 10:33:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKaeubNxYwGNOJYv=VcwR_6NzwkXnQ4DjOwXDudEmZ2Rg@mail.gmail.com>
Message-ID: <CAL_JsqKaeubNxYwGNOJYv=VcwR_6NzwkXnQ4DjOwXDudEmZ2Rg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: mpc: Add fsl,
 i2c-erratum-a004447 flag
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wsa@kernel.org" <wsa@kernel.org>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 9, 2021 at 4:08 PM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
>
>
> On 8/05/21 9:49 am, Rob Herring wrote:
> > On Fri, May 07, 2021 at 12:40:45PM +1200, Chris Packham wrote:
> >> Document the fsl,i2c-erratum-a004447 flag which indicates the presence
> >> of an i2c erratum on some QorIQ SoCs.
> >>
> >> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >> ---
> >>   Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> >> index 7b553d559c83..98c6fcf7bf26 100644
> >> --- a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> >> +++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> >> @@ -46,6 +46,13 @@ properties:
> >>       description: |
> >>         I2C bus timeout in microseconds
> >>
> >> +  fsl,i2c-erratum-a004447:
> >> +    $ref: /schemas/types.yaml#/definitions/flag
> >> +    description: |
> >> +      Indicates the presence of QorIQ erratum A-004447, which
> >> +      says that the standard i2c recovery scheme mechanism does
> >> +      not work and an alternate implementation is needed.
> > The problem with adding a property for an errata is you have to update
> > the dtb. If you use the compatible string, then only an OS update is
> > needed. That assumes you have specific enough compatible strings.
>
> I was following the style of the existing fsl,usb-erratum-a007792 or
> fsl,erratum-a008585 properties. But that's not really a compelling reason.
>
> The existing compatible string is "fsl-i2c" and it's used by pretty much
> every powerpc QorIQ SoC. There are some specific compatible strings in
> the driver for some of the older mpc SoCs. A more specific compatible
> string will work although determining which ones are affected might be a
> bit troublesome. That we know of the P2041 and P1010 are affected but I
> suspect there may be more. One disadvantage of using the compatible
> string is that as affected SoCs are identified we'll have to update the
> driver to know that SoC is affected and update the dtb to use it. With
> the property we'd just have to update the dtb.

If you don't have specific compatibles in the dtb already, then it's
mute as the point was to avoid the dtb update.

> I'm not too fussed either way so if that's a hard NACK on the property I
> can send a version that uses compatible strings instead.

Acked-by: Rob Herring <robh@kernel.org>

You could still add compatibles for the next time...
