Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDBC477DF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 21:56:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFPYM5ml5z3cSN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 07:56:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 39924 seconds by postgrey-1.36 at boromir;
 Fri, 17 Dec 2021 07:56:15 AEDT
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFPXv49prz2yw5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 07:56:13 +1100 (AEDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3749240004;
 Thu, 16 Dec 2021 20:56:07 +0000 (UTC)
Date: Thu, 16 Dec 2021 21:56:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: [PATCH v3 0/5] rtc: nintendo: Add a RTC driver for the GameCube, 
 Wii and Wii U
Message-ID: <Ybun5qp6DH7qkAGy@piout.net>
References: <20211027223516.2031-1-linkmauve@linkmauve.fr>
 <20211215175501.6761-1-linkmauve@linkmauve.fr>
 <163964813197.6786.14005810276404182021.b4-ty@bootlin.com>
 <20211216202220.y6rctd2k72yuya5w@luna>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211216202220.y6rctd2k72yuya5w@luna>
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
 devicetree@vger.kernel.org, rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Ash Logan <ash@heyquark.com>,
 linuxppc-dev@lists.ozlabs.org,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/12/2021 21:22:20+0100, Emmanuel Gil Peyrot wrote:
> On Thu, Dec 16, 2021 at 10:49:44AM +0100, Alexandre Belloni wrote:
> > On Wed, 15 Dec 2021 18:54:56 +0100, Emmanuel Gil Peyrot wrote:
> > > These three consoles share a device, the MX23L4005, which contains a
> > > clock and 64 bytes of SRAM storage, and is exposed on the EXI bus
> > > (similar to SPI) on channel 0, device 1.  This driver allows it to be
> > > used as a Linux RTC device, where time can be read and set.
> > > 
> > > The hardware also exposes two timers, one which shuts down the console
> > > and one which powers it on, but these aren’t supported currently.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/5] rtc: gamecube: Add a RTC driver for the GameCube, Wii and Wii U
> >       commit: 86559400b3ef9de93ba50523cffe767c35cd531a
> > [2/5] rtc: gamecube: Report low battery as invalid data
> >       commit: 322539a014bcd24cbb9281832c09b24e07912237
> > [3/5] powerpc: wii.dts: Expose HW_SRNPROT on this platform
> >       commit: 5479618e1e2641dd57352a73b7b7b2f6908fbeee
> > [4/5] powerpc: gamecube_defconfig: Enable the RTC driver
> >       commit: 57bd7d356506b713d0df8d8e42da7810a18864df
> > [5/5] powerpc: wii_defconfig: Enable the RTC driver
> >       commit: 69e8ba80ddda4db31e59facbf2db19773ad3785b
> > 
> > This one didn't apply ceanly but I believe I did the right thing. Can you check?
> 
> I believe you didn’t, at least that commit[1] seems to have one “+” too
> many in the modified line, whereas the previous one[2] doesn’t.
> 

I knew I needed you to check, this is fixed now.

https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?id=c636783d594f6cfc95db51c796761719317ce5eb


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
