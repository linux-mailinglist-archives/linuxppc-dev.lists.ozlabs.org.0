Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CFE476E79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 11:04:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF74x1pBfz3cSC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 21:04:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF74S5VL6z2xtM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 21:04:07 +1100 (AEDT)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 98B45D74C2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 09:51:12 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7102024000D;
 Thu, 16 Dec 2021 09:50:45 +0000 (UTC)
Date: Thu, 16 Dec 2021 10:50:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 0/5] rtc: nintendo: Add a RTC driver for the GameCube, 
 Wii and Wii U
Message-ID: <YbsL9C6qjo/8SgjU@piout.net>
References: <20211027223516.2031-1-linkmauve@linkmauve.fr>
 <20211215175501.6761-1-linkmauve@linkmauve.fr>
 <87tuf9kv6c.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuf9kv6c.fsf@mpe.ellerman.id.au>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 devicetree@vger.kernel.org, Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 linux-kernel@vger.kernel.org, rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Ash Logan <ash@heyquark.com>, linuxppc-dev@lists.ozlabs.org,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 16/12/2021 15:52:59+1100, Michael Ellerman wrote:
> > Emmanuel Gil Peyrot (5):
> >   rtc: gamecube: Add a RTC driver for the GameCube, Wii and Wii U
> >   rtc: gamecube: Report low battery as invalid data
> >   powerpc: wii.dts: Expose HW_SRNPROT on this platform
> >   powerpc: gamecube_defconfig: Enable the RTC driver
> >   powerpc: wii_defconfig: Enable the RTC driver
> >
> >  drivers/rtc/Kconfig                     |  11 +
> >  drivers/rtc/Makefile                    |   1 +
> >  drivers/rtc/rtc-gamecube.c              | 377 ++++++++++++++++++++++++
> 
> This is basically an rtc series as far as I'm concerned.
> 
> >  arch/powerpc/boot/dts/wii.dts           |   5 +
> >  arch/powerpc/configs/gamecube_defconfig |   2 +-
> >  arch/powerpc/configs/wii_defconfig      |   2 +-
> 
> I have nothing queued in the powerpc tree that touches any of those
> files, so conflicts are unlikely.
> 
> So I'm happy for this to go via the rtc tree whenever it's ready.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

That's done, thanks.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
