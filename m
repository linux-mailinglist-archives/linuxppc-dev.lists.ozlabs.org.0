Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA01E2C8F1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 21:26:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClGwj5FNnzDqx2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 07:26:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.67; helo=mail-ej1-f67.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClGtr6QpDzDq6q
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 07:25:07 +1100 (AEDT)
Received: by mail-ej1-f67.google.com with SMTP id f23so4404044ejt.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 12:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6b8ivBM6Oli9oGtMf1yFdu9kCZLwCSACgZwbQBElQoI=;
 b=p7ztRdYCBerLHN/5VENVls9ha9/BwVsP9sMhKsSfyJ7BP85BV4H3OU3FUT0tOVQHyE
 QfCwrbz/Y76vng2tCMnN+brXQxqw3GnfhsL/8R9vpi8mUPdw0sBXqByMa8F3bZ/Wlitb
 9nia3Ux93nO0BtYjt4GGPyIlSlY4i3gX+2yYXUXZYXWnW53IThMZcwbY3GACGsA29yYq
 vQhXc+UcPr/7aWoNAkkE5V/z3SIqNcsgS9MtMks+cekM+jqtgUdaR1C5ueyntmMk2E3K
 XF/Qgcbrr5B5Y9gcWubZplEZe7jLz2VeE98eq6HZdhBdyt5tXTefXC2kLj+UyRMBGLEo
 sgow==
X-Gm-Message-State: AOAM533Mf9HtYyOP/dWgfkzfCSDlykqmYvOKYzmoKn80aYGXUAUa2zX0
 iNCdIQZzOXviDlW3rxOUjj0=
X-Google-Smtp-Source: ABdhPJw43jHKCvzH5Ol/kuo8r2wqVPMFZO5f2gIMAGv9wMfgdu/Cmqi+0WgCA6uoH1f+BQqe2EHDSQ==
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr7922380ejj.105.1606767904160; 
 Mon, 30 Nov 2020 12:25:04 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id q24sm9418511edw.66.2020.11.30.12.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 12:25:03 -0800 (PST)
Date: Mon, 30 Nov 2020 22:25:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130202501.GA32878@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130191133.GA1565464@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130191133.GA1565464@ravnborg.org>
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
Cc: alexandre.belloni@bootlin.com, tony@atomide.com,
 linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 thierry.reding@gmail.com, paulus@samba.org, lee.jones@linaro.org,
 daniel.thompson@linaro.org, linux-omap@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, deller@gmx.de, linux@armlinux.org.uk,
 jonathanh@nvidia.com, ludovic.desroches@microchip.com, catalin.marinas@arm.com,
 linux-mips@vger.kernel.org, will@kernel.org, mripard@kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 linux-tegra@vger.kernel.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 emil.l.velikov@gmail.com, nicolas.ferre@microchip.com,
 Olof Johansson <olof@lixom.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 30, 2020 at 08:11:33PM +0100, Sam Ravnborg wrote:
> On Mon, Nov 30, 2020 at 03:21:32PM +0000, Andrey Zhizhikin wrote:
> > Since the removal of generic_bl driver from the source tree in commit
> > 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> > unused") BACKLIGHT_GENERIC config option became obsolete as well and
> > therefore subject to clean-up from all configuration files.
> > 
> > This series introduces patches to address this removal, separated by
> > architectures in the kernel tree.
> > 
> > Andrey Zhizhikin (5):
> >   ARM: configs: drop unused BACKLIGHT_GENERIC option
> >   arm64: defconfig: drop unused BACKLIGHT_GENERIC option
> >   MIPS: configs: drop unused BACKLIGHT_GENERIC option
> >   parisc: configs: drop unused BACKLIGHT_GENERIC option
> >   powerpc/configs: drop unused BACKLIGHT_GENERIC option
> 
> For defconfigs I expect arch maintainers to do a make xxxdefconfig / make
> savedefconfig / cp defconfig ... run now and then - this will remove
> all such symbols.

savedefconfig can be tricky because of risk of loosing options:
1. it will remove options which became the default or became selected,
2. later when the default is changed or selecting option is removed, the
   first option from #1 will not be brought back.

This was already for example with DEBUG_FS and the conclusion that time
was - do not run savedefconfig automatically.

Therefore if some symbol(s) can be safely removed, patch is welcomed.

Best regards,
Krzysztof

> 
> If the patches goes in like they are submitted then:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
