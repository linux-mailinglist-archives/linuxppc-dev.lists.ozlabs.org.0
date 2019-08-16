Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC558FC90
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 09:41:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468wH76sybzDr7d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 17:41:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468wF24vJ7zDr5d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 17:39:17 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id k18so8886092otr.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 00:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rNgiwRT8IqruHTtyg4qTM81WOjWWtlc2s7dRDLMNYXA=;
 b=lIQ9peSDpku3ykacqJmjIbrZUxwVigq1mRR8rt/EoMqS9c1dRYOZ98UgcpPTBOIvxz
 i1/DJPUh9yKsxo5j0iZeU+tIbatA4e7o7chQOph8lDXlnCc58XUaAmmojwMiLHCt/OQ3
 2CbgGzJ9yMcQL3PLDvgA6vhUnWW+rD+lfAsRI/+orpUOtMT7FcEPRUmpZeYBNN57okAH
 cwARNtWf68sd3Nu59GKLmcXRV+TmsqLXNgZ6kDyhxVFmx/phOyJsL6GJ+tyLCy7lR652
 SshVudxNttYsgxR3zRsiPbLHmqZ9XuYEL9TEaFyFEXthJO7mUAVcHeEyVnSqXoTbUJe0
 r9CA==
X-Gm-Message-State: APjAAAVXwkUknKHtvio/HYyuWsOUFUjw5jtl3hRFmG6GfGNWDk53/00X
 LvY2It5WFu5JW7CiwbfTwNBoUbBhzS/EYGCzRn8=
X-Google-Smtp-Source: APXvYqz193ixgGnhQHDM0sA58o87yH16orCv5VbCTsKEDkS808wZnFykFKzgKwDR213pxnj04zPYszKH8AWAfSfEEwQ=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr6603053oto.250.1565941154237; 
 Fri, 16 Aug 2019 00:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190816062435.881-1-hch@lst.de> <20190816062435.881-7-hch@lst.de>
In-Reply-To: <20190816062435.881-7-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Aug 2019 09:39:03 +0200
Message-ID: <CAMuHMdVj+4Kh6pRGrz32w4zgwGHH4-r+-iHX1CSAXU6t4sprJw@mail.gmail.com>
Subject: Re: [PATCH 6/6] driver core: initialize a default DMA mask for
 platform device
To: Christoph Hellwig <hch@lst.de>
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
Cc: Gavin Li <git@thegavinli.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Linux-Arch <linux-arch@vger.kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Minas Harutyunyan <hminas@synopsys.com>, Bin Liu <b-liu@ti.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On Fri, Aug 16, 2019 at 8:30 AM Christoph Hellwig <hch@lst.de> wrote:
> We still treat devices without a DMA mask as defaulting to 32-bits for
> both mask, but a few releases ago we've started warning about such
> cases, as they require special cases to work around this sloppyness.
> Add a dma_mask field to struct platform_device so that we can initialize
> the dma_mask pointer in struct device and initialize both masks to
> 32-bits by default, replacing similar functionality in m68k and
> powerpc.  The arch_setup_pdev_archdata hooks is now unused and removed.
>
> Note that the code looks a little odd with the various conditionals
> because we have to support platform_device structures that are
> statically allocated.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/m68k/kernel/dma.c               |  9 -------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

>  arch/sh/boards/mach-ecovec24/setup.c |  2 --
>  arch/sh/boards/mach-migor/setup.c    |  1 -

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
given "[PATCH 0/2] Remove calls to empty arch_setup_pdev_archdata()"
https://lore.kernel.org/linux-renesas-soc/1526641611-2769-1-git-send-email-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
