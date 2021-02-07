Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6A31238F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 11:39:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYQcj19JqzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 21:39:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYQXk1c78zDvYH
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 21:35:32 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3E9212019B4;
 Sun,  7 Feb 2021 11:35:28 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2E7C3200E28;
 Sun,  7 Feb 2021 11:35:23 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A65414029B;
 Sun,  7 Feb 2021 11:35:16 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] Add audio driver base on rpmsg on i.MX platform
Date: Sun,  7 Feb 2021 18:23:48 +0800
Message-Id: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Asymmetric multiprocessor, there is Cortex-A core and Cortex-M core,
Linux is running on A core, RTOS is running on M core.
The audio hardware device can be controlled by Cortex-M device,
So audio playback/capture can be handled by M core.

Rpmsg is the interface for sending and receiving msg to and from M
core, that we can create a virtual sound on Cortex-A core side.

A core will tell the Cortex-M core sound format/rate/channel,
where is the data buffer, what is the period size, when to start,
when to stop and when suspend or resume happen, each of this behavior
there is defined rpmsg command.

Especially we designed the low power audio case, that is to
allocate a large buffer and fill the data, then Cortex-A core can go
to sleep mode, Cortex-M core continue to play the sound, when the
buffer is consumed, Cortex-M core will trigger the Cortex-A core to
wakeup to fill data.

changes in v2:
- update codes and comments according to Mark's comments

Shengjiu Wang (7):
  ASoC: soc-component: Add snd_soc_pcm_component_ack
  ASoC: fsl_rpmsg: Add CPU DAI driver for audio base on rpmsg
  ASoC: dt-bindings: fsl_rpmsg: Add binding doc for rpmsg cpu dai driver
  ASoC: imx-audio-rpmsg: Add rpmsg_driver for audio channel
  ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg
  ASoC: imx-rpmsg: Add machine driver for audio base on rpmsg
  ASoC: dt-bindings: imx-rpmsg: Add binding doc for rpmsg machine driver

 .../devicetree/bindings/sound/fsl,rpmsg.yaml  |  80 ++
 .../bindings/sound/imx-audio-rpmsg.yaml       |  48 +
 include/sound/soc-component.h                 |   3 +
 sound/soc/fsl/Kconfig                         |  28 +
 sound/soc/fsl/Makefile                        |   6 +
 sound/soc/fsl/fsl_rpmsg.c                     | 252 +++++
 sound/soc/fsl/fsl_rpmsg.h                     |  38 +
 sound/soc/fsl/imx-audio-rpmsg.c               | 151 +++
 sound/soc/fsl/imx-pcm-rpmsg.c                 | 919 ++++++++++++++++++
 sound/soc/fsl/imx-pcm-rpmsg.h                 | 512 ++++++++++
 sound/soc/fsl/imx-rpmsg.c                     | 148 +++
 sound/soc/soc-component.c                     |  14 +
 sound/soc/soc-pcm.c                           |   2 +
 13 files changed, 2201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
 create mode 100644 sound/soc/fsl/fsl_rpmsg.c
 create mode 100644 sound/soc/fsl/fsl_rpmsg.h
 create mode 100644 sound/soc/fsl/imx-audio-rpmsg.c
 create mode 100644 sound/soc/fsl/imx-pcm-rpmsg.c
 create mode 100644 sound/soc/fsl/imx-pcm-rpmsg.h
 create mode 100644 sound/soc/fsl/imx-rpmsg.c

-- 
2.27.0

