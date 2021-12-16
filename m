Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CDE476E34
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 10:50:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF6mT3KBWz3cb5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 20:50:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.232;
 helo=relay12.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF6m25vbhz3dfj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 20:49:53 +1100 (AEDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2E19A200009;
 Thu, 16 Dec 2021 09:49:45 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: [PATCH v3 0/5] rtc: nintendo: Add a RTC driver for the GameCube,
 Wii and Wii U
Date: Thu, 16 Dec 2021 10:49:44 +0100
Message-Id: <163964813197.6786.14005810276404182021.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215175501.6761-1-linkmauve@linkmauve.fr>
References: <20211027223516.2031-1-linkmauve@linkmauve.fr>
 <20211215175501.6761-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Ash Logan <ash@heyquark.com>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Dec 2021 18:54:56 +0100, Emmanuel Gil Peyrot wrote:
> These three consoles share a device, the MX23L4005, which contains a
> clock and 64 bytes of SRAM storage, and is exposed on the EXI bus
> (similar to SPI) on channel 0, device 1.  This driver allows it to be
> used as a Linux RTC device, where time can be read and set.
> 
> The hardware also exposes two timers, one which shuts down the console
> and one which powers it on, but these aren’t supported currently.
> 
> [...]

Applied, thanks!

[1/5] rtc: gamecube: Add a RTC driver for the GameCube, Wii and Wii U
      commit: 86559400b3ef9de93ba50523cffe767c35cd531a
[2/5] rtc: gamecube: Report low battery as invalid data
      commit: 322539a014bcd24cbb9281832c09b24e07912237
[3/5] powerpc: wii.dts: Expose HW_SRNPROT on this platform
      commit: 5479618e1e2641dd57352a73b7b7b2f6908fbeee
[4/5] powerpc: gamecube_defconfig: Enable the RTC driver
      commit: 57bd7d356506b713d0df8d8e42da7810a18864df
[5/5] powerpc: wii_defconfig: Enable the RTC driver
      commit: 69e8ba80ddda4db31e59facbf2db19773ad3785b

This one didn't apply ceanly but I believe I did the right thing. Can you check?


Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
