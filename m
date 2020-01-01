Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 131A612DE4E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2020 09:22:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47nkgR23D1zDqBj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2020 19:22:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inria.fr (client-ip=192.134.164.83;
 helo=mail2-relais-roc.national.inria.fr; envelope-from=julia.lawall@inria.fr;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inria.fr
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47nkcc1BF5zDq9B
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jan 2020 19:20:13 +1100 (AEDT)
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; d="scan'208";a="429578748"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 01 Jan 2020 09:20:08 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 00/16] constify copied structure
Date: Wed,  1 Jan 2020 08:43:18 +0100
Message-Id: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
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
Cc: linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-nfs@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make const static structures that are just copied into other structures.

The semantic patch that detects the opportunity for this change is as
follows: (http://coccinelle.lip6.fr/)

<smpl>
@r disable optional_qualifier@
identifier i,j;
position p;
@@
static struct i j@p = { ... };

@upd@
position p1;
identifier r.j;
expression e;
@@
e = j@p1

@ref@
position p2 != {r.p,upd.p1};
identifier r.j;
@@
j@p2

@script:ocaml depends on upd && !ref@
i << r.i;
j << r.j;
p << r.p;
@@
if j = (List.hd p).current_element
then Coccilib.print_main i p
</smpl>

---

 arch/powerpc/sysdev/mpic.c                          |    4 ++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c |    2 +-
 drivers/media/i2c/mt9v111.c                         |    2 +-
 drivers/media/platform/davinci/isif.c               |    2 +-
 drivers/media/usb/cx231xx/cx231xx-dvb.c             |    2 +-
 drivers/media/usb/dvb-usb-v2/anysee.c               |    4 ++--
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c           |    2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c            |    2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c             |    2 +-
 drivers/ptp/ptp_clockmatrix.c                       |    2 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c             |    2 +-
 drivers/video/fbdev/sa1100fb.c                      |    2 +-
 net/sunrpc/xdr.c                                    |    2 +-
 sound/isa/ad1816a/ad1816a_lib.c                     |    2 +-
 sound/pci/hda/hda_controller.c                      |    2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                    |    2 +-
 16 files changed, 18 insertions(+), 18 deletions(-)
