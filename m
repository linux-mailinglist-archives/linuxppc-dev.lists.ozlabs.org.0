Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DDDF5900
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 22:02:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478t5G5Y1WzF7nw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 08:02:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478t1f183ZzF7PC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 07:59:33 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id r24so6333783otk.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 12:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iHMB6rGLleO6OxcrYYe8ZvDxdU9fIQ0DXLT+ABSPcOU=;
 b=GKmG0B+D16bFWbpVZ/jMAMHmls048euqr2LBfopJpnJfYQLIXNUqJskYf7cW3HeeI+
 pMI+pkNLgD1oI+rE+v1uRluWkGn4+kMbAitI9JCaQ5Cnfj7TnzE1xyL20RNDFBddPojO
 bbfGm0JyUAAgk/sDeQrVPkpohg1PKE3upU3dFzCAWRH6/ZVuD+gbFTut04t5Ojv2kyA/
 B+rfAsLvWALWidihE2X+M13cQENp4VhX5fCc5WEHrclMZXBoWwRQZNGoqvsZe9B7BFfm
 Sl4Ef8ZcFxzWxV8eWoQ6oJOeI1QPahWSQYpYCrzQ43LY3Tnep/8WGGhNXqZ0Zeq6Lj+c
 G8UQ==
X-Gm-Message-State: APjAAAX0sOFA8bV8dCctR6cLLtS1zGxuJzJ8JxoSPGXOYPYC8ZdWEoOV
 ZcXz51zrMujm6uGOlDae71b62l+R
X-Google-Smtp-Source: APXvYqxUeHZONOoZsro78gDH1p8em0Gn2lB2KNP3Q7HgwiFtiM6p4wv/rfrzvgDoe4VbBiG1zdZmZw==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr10416571otq.346.1573246770285; 
 Fri, 08 Nov 2019 12:59:30 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54])
 by smtp.gmail.com with ESMTPSA id l23sm2122616oig.44.2019.11.08.12.59.29
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2019 12:59:29 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id v24so6383520otp.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 12:59:29 -0800 (PST)
X-Received: by 2002:a9d:173:: with SMTP id 106mr10294718otu.205.1573246769515; 
 Fri, 08 Nov 2019 12:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20191108130213.23684-1-yuehaibing@huawei.com>
 <20191108151720.GB216543@piout.net>
In-Reply-To: <20191108151720.GB216543@piout.net>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 8 Nov 2019 14:59:18 -0600
X-Gmail-Original-Message-ID: <CADRPPNS0z913xkwJwZRU_37RHOs_-AjivR_aqOh-LGZPm607iA@mail.gmail.com>
Message-ID: <CADRPPNS0z913xkwJwZRU_37RHOs_-AjivR_aqOh-LGZPm607iA@mail.gmail.com>
Subject: Re: [PATCH -next] soc: fsl: Enable COMPILE_TEST
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 YueHaibing <yuehaibing@huawei.com>, lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 8, 2019 at 9:20 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> On 08/11/2019 21:02:13+0800, YueHaibing wrote:
> > When do COMPILE_TEST buiding for RTC_DRV_FSL_FTM_ALARM,
> > we get this warning:
> >
> > WARNING: unmet direct dependencies detected for FSL_RCPM
> >   Depends on [n]: PM_SLEEP [=y] && (ARM || ARM64)
> >   Selected by [m]:
> >   - RTC_DRV_FSL_FTM_ALARM [=m] && RTC_CLASS [=y] && (ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST [=y])
> >
> > This enable COMPILE_TEST for FSL_RCPM to fix the issue.
> >
> > Fixes: e1c2feb1efa2 ("rtc: fsl-ftm-alarm: allow COMPILE_TEST")
>
> I've removed that patch until the fsl maintainers apply this one.

I think it is wrong to have RTC_DRV_FSL_FTM_ALARM select FSL_RCPM from
the begining.  The FTM_ALARM is primarily used as a wakeup source for
the deep sleep.  But it shouldn't be depending on it or selecting it.
I will create a patch to move that.

Regards,
Leo

>
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> > In commit c6c2d36bc46f ("rtc: fsl-ftm-alarm: Fix build error without PM_SLEEP")
> > I posted a wrong kconfig warning(which PM_SLEEP is n), sorry for confusion.
> > ---
> >  drivers/soc/fsl/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
> > index 4df32bc..e142662 100644
> > --- a/drivers/soc/fsl/Kconfig
> > +++ b/drivers/soc/fsl/Kconfig
> > @@ -43,7 +43,7 @@ config DPAA2_CONSOLE
> >
> >  config FSL_RCPM
> >       bool "Freescale RCPM support"
> > -     depends on PM_SLEEP && (ARM || ARM64)
> > +     depends on PM_SLEEP && (ARM || ARM64 || COMPILE_TEST)
> >       help
> >         The NXP QorIQ Processors based on ARM Core have RCPM module
> >         (Run Control and Power Management), which performs all device-level
> > --
> > 2.7.4
> >
> >
>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
