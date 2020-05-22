Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBBA1DEFF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 21:26:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TGgC02qczDr0l
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 05:25:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.193;
 helo=mail-il1-f193.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TGbv3Vz9zDqrW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 05:23:07 +1000 (AEST)
Received: by mail-il1-f193.google.com with SMTP id c20so11774857ilk.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 12:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vn57VCqr9h90wdQTLGEGnujFsrIL8E9uyvK19tk59RM=;
 b=STolIWI7xK7oMcyn5bXLiW+G6TSsSix8B74kOzb0V62cVGXg/jiZqHvxRl7KXN+JVw
 eFyMO4sRu0my3W/1brHvSK0WazD/yTsJuBkjYjL+4HwIelJitafdgpaTpAPRsuns+Hn0
 NW+RmPOiXR/wPp5HauQfV+GNUDwva1LlsgqqAFzWipr45b/Q0EjShsrjNT63CIAi9lPY
 3SCc4A+vs1ppQtJT6XUWecZT3dlb60E0mw9x7JYYDw1owybIDb2Lk34+pZYf50iQ5Nrn
 VtlcKFvOD5yxismU46vbG9Uz9DLayZW4B8/S3atiDvitArnaXGcBjnrbrqQEN1T6uPdX
 74Kw==
X-Gm-Message-State: AOAM531MaWEOS4rRe3nhikgsXQnv7a/PqmQ8tNq3IellbgHTpAXrOzKt
 N8w/3iBv+ryiQ0o9XRpiRSFWI6ls
X-Google-Smtp-Source: ABdhPJyccLa39gQjC1wb4+YyoQSYyIaT8Ecutwku5DMyqZ6YyIKFzlCN85jF4Z6LPXQvOzw2CQM19g==
X-Received: by 2002:a92:aa4e:: with SMTP id j75mr14582597ili.174.1590175385046; 
 Fri, 22 May 2020 12:23:05 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com.
 [209.85.166.49])
 by smtp.gmail.com with ESMTPSA id h5sm4899256ile.35.2020.05.22.12.23.04
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 12:23:04 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id h10so12493831iob.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 12:23:04 -0700 (PDT)
X-Received: by 2002:a02:7f42:: with SMTP id r63mr4574513jac.32.1590175384093; 
 Fri, 22 May 2020 12:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200520091543.44692-1-biwen.li@oss.nxp.com>
 <20200520091543.44692-2-biwen.li@oss.nxp.com>
In-Reply-To: <20200520091543.44692-2-biwen.li@oss.nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 22 May 2020 14:22:40 -0500
X-Gmail-Original-Message-ID: <CADRPPNTFfUs=YnsfYadp35SyqN4i7JqSPyF3avo=XSBFaLghPQ@mail.gmail.com>
Message-ID: <CADRPPNTFfUs=YnsfYadp35SyqN4i7JqSPyF3avo=XSBFaLghPQ@mail.gmail.com>
Subject: Re: [v2 2/2] dts: ppc: t1024rdb: remove interrupts property
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

On Wed, May 20, 2020 at 4:21 AM Biwen Li <biwen.li@oss.nxp.com> wrote:
>
> From: Biwen Li <biwen.li@nxp.com>
>
> This removes interrupts property to drop warning as follows:
>     - $ hwclock.util-linux
>       hwclock.util-linux: select() to /dev/rtc0
>       to wait for clock tick timed out
>
> My case:
>     - RTC ds1339s INT pin isn't connected to cpus INT pin on T1024RDB,
>       then the RTC cannot inform cpu about alarm interrupt
>
> How to fix it?
>     - remove IRQ line

This style is not the recommended style for commit message.  Please
see my comment for the other patch.

>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
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
