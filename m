Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D4AF7AAD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 19:22:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BfPK5QqVzF4Rs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 05:22:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bf8k1x1hzF1Rb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 05:11:49 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id f10so12034551oto.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 10:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3pgVptoZYzsTOg+Xnbn8wJxFJTLIjKkmJmwvN7XoJgQ=;
 b=FllgeF+oq9RSM0ZBtvmkLmAmqqYgzywW7X+FcUxmJLO9Cy4VMes6YaZXgjlz/n+zRr
 8LqP4cwzzvu1Q4QAVjYRtGa0+fx+tLkhcTmcEwEFOZbMDrKHhf5g3NRmyohlM9WvQJb+
 gB6OoA0om1c1oMR0H4QWGDVhU/oWQjzvZhN6QNMj3EDOSBsi/6lE9XyQvEFpSerGjioe
 i+N9tbKsP62btg8kKacA2bKIP5WUuHhdCzv1BThgEf47+CiGMqa1Mqf3FbA09P3APHzy
 ZZXPRNkL37kffd5T7f6yskwdf1OOOlqq0v+AoTm6s/bSLNY05WoDMgPJ4v4Y9mAgVgFS
 rEEA==
X-Gm-Message-State: APjAAAVDKpeQo/v+CoU+FN8/v2DBBEsZabk4MRGsl7pWf8hk2C2U07Aq
 NAwmf8FVEaV7Sd6UGgRS6XRAmGUQ
X-Google-Smtp-Source: APXvYqzDa4daAoriDBOZWPknTiCQwJvDjYUIGEtJRc7jKImNC1t+RHlCAduhZ5eWEyXlvnjVJKjAyg==
X-Received: by 2002:a9d:4a9c:: with SMTP id i28mr21491311otf.169.1573495906307; 
 Mon, 11 Nov 2019 10:11:46 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com.
 [209.85.167.173])
 by smtp.gmail.com with ESMTPSA id m205sm5210222oib.27.2019.11.11.10.11.45
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 10:11:45 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id n16so12322988oig.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 10:11:45 -0800 (PST)
X-Received: by 2002:aca:1702:: with SMTP id j2mr240762oii.13.1573495904943;
 Mon, 11 Nov 2019 10:11:44 -0800 (PST)
MIME-Version: 1.0
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-48-linux@rasmusvillemoes.dk>
 <CADRPPNQwnmPCh8nzQ5vBTLoieO-r2u0huh17mwcinhfhNgo04A@mail.gmail.com>
 <14894529-a6bd-9b7e-eacc-06d5e49cc8e8@rasmusvillemoes.dk>
In-Reply-To: <14894529-a6bd-9b7e-eacc-06d5e49cc8e8@rasmusvillemoes.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 11 Nov 2019 12:11:33 -0600
X-Gmail-Original-Message-ID: <CADRPPNQHtRhZOw0DuTQoPF_RgFHSFG4rGCtETFvCCSS8H6i=iQ@mail.gmail.com>
Message-ID: <CADRPPNQHtRhZOw0DuTQoPF_RgFHSFG4rGCtETFvCCSS8H6i=iQ@mail.gmail.com>
Subject: Re: [PATCH v4 47/47] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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
Cc: Scott Wood <oss@buserror.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 1:36 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On 09/11/2019 00.48, Li Yang wrote:
> > On Fri, Nov 8, 2019 at 7:05 AM Rasmus Villemoes
> > <linux@rasmusvillemoes.dk> wrote:
> >>
> >> There are also ARM and ARM64 based SOCs with a QUICC Engine, and the
> >> core QE code as well as net/wan/fsl_ucc_hdlc and tty/serial/ucc_uart
> >> has now been modified to not rely on ppcisms.
> >>
> >> So extend the architectures that can select QUICC_ENGINE, and add the
> >> rather modest requirements of OF && HAS_IOMEM.
> >>
> >> The core code as well as the ucc_uart driver has been tested on an
> >> LS1021A (arm), and it has also been tested that the QE code still
> >> works on an mpc8309 (ppc).
> >>
> >> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> >> ---
> >>  drivers/soc/fsl/qe/Kconfig | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
> >> index cfa4b2939992..f1974f811572 100644
> >> --- a/drivers/soc/fsl/qe/Kconfig
> >> +++ b/drivers/soc/fsl/qe/Kconfig
> >> @@ -5,7 +5,8 @@
> >>
> >>  config QUICC_ENGINE
> >>         bool "QUICC Engine (QE) framework support"
> >> -       depends on FSL_SOC && PPC32
> >> +       depends on OF && HAS_IOMEM
> >> +       depends on PPC32 || ARM || ARM64 || COMPILE_TEST
> >
> > Can you also add PPC64?  It is also used on some PPC64 platforms
> > (QorIQ T series).
>
> Sure, but if that's the only thing in the whole series, perhaps you
> could amend it when applying instead of me sending all 47 patches again.

Sure.  I can do that.

>
> Should PPC32 || PPC64 be spelled PPC?

Yes.  That will be good.

Regards,
Leo
