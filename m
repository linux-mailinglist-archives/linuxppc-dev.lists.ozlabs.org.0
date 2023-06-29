Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 887EB741E18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 04:17:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qs2CJ3PhTz3bnw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 12:17:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qs2Bm568cz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 12:16:47 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 75EE61A0D8D;
	Thu, 29 Jun 2023 04:10:32 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3E24D1A0D8C;
	Thu, 29 Jun 2023 04:10:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7BE20181D0E5;
	Thu, 29 Jun 2023 10:10:30 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] Add audio support in v4l2 framework
Date: Thu, 29 Jun 2023 09:37:47 +0800
Message-Id: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Audio signal processing has the requirement for memory to
memory similar as Video.

This patch is to add this support in v4l2 framework, defined
new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
for audio case usage.

The created audio device is named "/dev/audioX".

And add memory to memory support for two kinds of i.MX ASRC
module


Shengjiu Wang (6):
  media: v4l2: Add audio capture and output support
  ASoC: fsl_asrc: define functions for memory to memory usage
  ASoC: fsl_easrc: define functions for memory to memory usage
  ASoC: fsl_asrc: Add memory to memory driver
  ASoC: fsl_asrc: enable memory to memory function
  ASoC: fsl_easrc: enable memory to memory function

 .../media/common/videobuf2/videobuf2-v4l2.c   |   4 +
 drivers/media/v4l2-core/v4l2-dev.c            |  17 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  52 ++
 include/media/v4l2-dev.h                      |   2 +
 include/media/v4l2-ioctl.h                    |  34 +
 include/uapi/linux/videodev2.h                |  19 +
 sound/soc/fsl/Kconfig                         |  13 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/fsl_asrc.c                      | 175 +++-
 sound/soc/fsl/fsl_asrc.h                      |   2 +
 sound/soc/fsl/fsl_asrc_common.h               |  54 ++
 sound/soc/fsl/fsl_asrc_m2m.c                  | 878 ++++++++++++++++++
 sound/soc/fsl/fsl_asrc_m2m.h                  |  48 +
 sound/soc/fsl/fsl_easrc.c                     | 255 ++++-
 sound/soc/fsl/fsl_easrc.h                     |   6 +
 15 files changed, 1557 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.h

-- 
2.34.1

