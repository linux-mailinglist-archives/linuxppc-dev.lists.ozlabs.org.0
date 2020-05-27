Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB421E5195
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 01:06:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XRJy3bHdzDqXw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 09:06:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.68; helo=mail-io1-f68.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XRGN5r4NzDqXr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 09:03:56 +1000 (AEST)
Received: by mail-io1-f68.google.com with SMTP id y5so5129357iob.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 16:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PEuMtD6LgYJonBecnZRafA5xWf0FkDz2r/VmLiB6F4s=;
 b=FOJavJaHiowojyGW6iX8apud20/lPZPv6D3W/q5bNc7d1AWfhhGjGl2uawA4Wz1Yjm
 1yXB00DN1s8oTxYKuXXPnonikV0gqwv882CpQxTlmlbcLmIcsqO9Cfet1yt36HIlDl6V
 BtQ90ROop1W567l2ar7gILN/7SQwiYhRDj+PjbAL7GnXz3XY8VLSs2208TkSe2rqva1c
 HPED1K/DCgIJj/p/I87tG1YyMCJEF+bJlKmGzojmxlGmQom/zmfKl1XpQSHgETbDqlOT
 gODtAh3cfyfJFY5iMFF/ddxsEpm/xpQAIRuc1YkG9VecWdxH6BeYB3PB+rGP1zbo6XF+
 tjQw==
X-Gm-Message-State: AOAM53063kmbHLngfGO61UjSVQLUIrUFdB1FwKBzrYLYaZQn9V06i9W/
 5ERw5BJcGAyQXe5jkZa8vmGUF8Dw
X-Google-Smtp-Source: ABdhPJwi8+8qdyAWt/eHii7hXXRnG7opCfWR6obDCaOtSYOpLOB4BWsxiKVqIWop1LzUCvGRUdXn4g==
X-Received: by 2002:a02:a904:: with SMTP id n4mr223326jam.105.1590620634747;
 Wed, 27 May 2020 16:03:54 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179])
 by smtp.gmail.com with ESMTPSA id g4sm2265768ilj.45.2020.05.27.16.03.53
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 16:03:54 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id q18so4674720ilm.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 16:03:53 -0700 (PDT)
X-Received: by 2002:a92:5cc1:: with SMTP id d62mr517275ilg.95.1590620633009;
 Wed, 27 May 2020 16:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200527034228.23793-1-biwen.li@oss.nxp.com>
 <20200527034228.23793-2-biwen.li@oss.nxp.com>
In-Reply-To: <20200527034228.23793-2-biwen.li@oss.nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 27 May 2020 18:03:24 -0500
X-Gmail-Original-Message-ID: <CADRPPNS9+QM3pPKpXA_QZ7nLGu5WpyfY=GPx7pJFREUS4s=55A@mail.gmail.com>
Message-ID: <CADRPPNS9+QM3pPKpXA_QZ7nLGu5WpyfY=GPx7pJFREUS4s=55A@mail.gmail.com>
Subject: Re: [v3 2/2] dts: ppc: t1024rdb: remove interrupts property
To: Biwen Li <biwen.li@oss.nxp.com>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Biwen Li <biwen.li@nxp.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 26, 2020 at 10:52 PM Biwen Li <biwen.li@oss.nxp.com> wrote:
>
> From: Biwen Li <biwen.li@nxp.com>
>
> Since the interrupt pin for RTC DS1339 is not connected
> to the CPU on T1024RDB, remove the interrupt property
> from the device tree.
>
> This also fix the following warning for hwclock.util-linux:
> $ hwclock.util-linux
> hwclock.util-linux: select() to /dev/rtc0
> to wait for clock tick timed out
>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
>  arch/powerpc/boot/dts/fsl/t1024rdb.dts | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/boot/dts/fsl/t1024rdb.dts b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> index 645caff98ed1..605ceec66af3 100644
> --- a/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> +++ b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> @@ -161,7 +161,6 @@
>                         rtc@68 {
>                                 compatible = "dallas,ds1339";
>                                 reg = <0x68>;
> -                               interrupts = <0x1 0x1 0 0>;
>                         };
>                 };
>
> --
> 2.17.1
>
