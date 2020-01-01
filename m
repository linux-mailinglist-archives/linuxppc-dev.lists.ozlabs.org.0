Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9302912E012
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2020 19:28:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47p06g70YczDq8v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2020 05:28:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inria.fr (client-ip=192.134.164.104;
 helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inria.fr
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47p0483nrgzDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2020 05:26:29 +1100 (AEDT)
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; d="scan'208";a="334542271"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 01 Jan 2020 19:26:23 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 00/10] use resource_size
Date: Wed,  1 Jan 2020 18:49:40 +0100
Message-Id: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
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
Cc: linux-fbdev@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 alsa-devel@alsa-project.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@
struct resource ptr;
@@

- ((ptr.end) - (ptr.start) + 1)
+ resource_size(&ptr)

@@
struct resource *ptr;
@@

- ((ptr->end) - (ptr->start) + 1)
+ resource_size(ptr)

@@
struct resource ptr;
@@

- ((ptr.end) + 1 - (ptr.start))
+ resource_size(&ptr)

@@
struct resource *ptr;
@@

- ((ptr->end) + 1 - (ptr->start))
+ resource_size(ptr)
</smpl>

---

 arch/mips/kernel/setup.c                  |    6 ++----
 arch/powerpc/platforms/83xx/km83xx.c      |    2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c |    4 ++--
 arch/x86/kernel/crash.c                   |    2 +-
 drivers/net/ethernet/freescale/fman/mac.c |    4 ++--
 drivers/usb/gadget/udc/omap_udc.c         |    6 +++---
 drivers/video/fbdev/cg14.c                |    3 +--
 drivers/video/fbdev/s1d13xxxfb.c          |   16 ++++++++--------
 sound/drivers/ml403-ac97cr.c              |    4 +---
 sound/soc/sof/imx/imx8.c                  |    3 +--
 10 files changed, 22 insertions(+), 28 deletions(-)
