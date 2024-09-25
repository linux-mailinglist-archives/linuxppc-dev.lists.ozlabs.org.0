Return-Path: <linuxppc-dev+bounces-1574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C81798538D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 09:17:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XD7Nd6wpLz2yD8;
	Wed, 25 Sep 2024 17:17:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727248673;
	cv=none; b=Fydtgr26Oz0bxwN0T2kC1bvMmVjv4CTchQrKp4TUlQlUF9mbkAqz3POPbGML3sprB5S+aDdJkrdFTRM5kU/v39Aq49KlkX+cC8AbbLuT2plMlJgxPdrDejhv5kwVXtc+dj5pmvbyaGFT91FTego4Df7LHVKx9+FuhtMPQg6lASYjAfQgqZz6aCp83MYdRUqt2tBBFlKUJB1IuKtInAqjPYmQfE9xuxakBjtLGd0NjLVcZkYaQNTOYOgYSqnjPiV3BdKkpC3XW9Y1JiFDRiLK+Rz9pEFAv9JBOtnMg6OlF3baqi7xs7uimioWlP4ENW7HS7sddoBL2J/04Sa+SEch5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727248673; c=relaxed/relaxed;
	bh=f2eozYQxeV1Vlhy883MANgD4rwPRnYAn6KgCpPoBRjI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ng29JBCSgsJftEJi/UZtuMq3WqxqbIAz8etQLgErp/cQ9nk8YTWEh6Js9YHLVic448VzQeJjjoxDkAL281fpuP8rtZJ4uOEiSIWIxRBJK/Jn3nG8Tw+uObdaAXKjBJodA0kgLsWMnjY5yBM8VmZJ+IROXMB4IhVsbl48/oSPDLhVQrBxnVPUqyd8t2z5iMQzNNdwF6kUfr3SZISjEhZypeOeKaAqI8JfFhSQNbg3HY9JHygxKn1DIfUoICvypbyPOpeHgW5zGX9YHidkCaVbrP5Pdgj9MNBGsJV9JfJ+Vbae4/rKC2qFAdQVmYP96VuEZHEcNHDqnl+fB3G4WxLumA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XD7Nd2v3Lz2y8B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 17:17:52 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0FA491A038D;
	Wed, 25 Sep 2024 09:17:49 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CB8DC1A0056;
	Wed, 25 Sep 2024 09:17:48 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2B8AF183AD44;
	Wed, 25 Sep 2024 15:17:47 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/7] ASoC: fsl: add memory to memory function for ASRC
Date: Wed, 25 Sep 2024 14:55:09 +0800
Message-Id: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

This function is base on the accelerator implementation
for compress API:
https://patchwork.kernel.org/project/alsa-devel/patch/20240731083843.59911-1-perex@perex.cz/
Add it to this patch set.

Audio signal processing also has the requirement for memory to
memory similar as Video.

This asrc memory to memory (memory ->asrc->memory) case is a non
real time use case.

User fills the input buffer to the asrc module, after conversion, then asrc
sends back the output buffer to user. So it is not a traditional ALSA playback
and capture case.

Because we had implemented the "memory -> asrc ->i2s device-> codec"
use case in ALSA.  Now the "memory->asrc->memory" needs
to reuse the code in asrc driver, so the patch 1 and patch 2 is for refining
the code to make it can be shared by the "memory->asrc->memory"
driver.

Other change is to add memory to memory support for two kinds of i.MX ASRC
modules.

changes in v4:
- remove the RFC tag, no comments receive in v3
- Add Jaroslav Kysela's patch in this patch set. because it may be
  better for reviewing in a full patch set.
- Fix the list_for_each_entry_reverse to list_for_each_entry_safe_reverse
- Fix some coding style issues in Jaroslav Kysela's patch

changes in v3:
- use Jaroslav's suggestion for header file compress_params.h (PATCH 01)
- remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
- remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
  Will wait Jaroslav's update or other better method in the future.
- Address some comments from Pierre.

changes in v2:
- Remove the changes in compress API
- drop the SNDRV_COMPRESS_SRC_RATIO_MOD
- drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
- define private metadata key value
  ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD

Jaroslav Kysela (1):
  ALSA: compress_offload: introduce accel operation mode

Shengjiu Wang (6):
  ALSA: compress: Add output rate and output format support
  ASoC: fsl_asrc: define functions for memory to memory usage
  ASoC: fsl_easrc: define functions for memory to memory usage
  ASoC: fsl_asrc_m2m: Add memory to memory function
  ASoC: fsl_asrc: register m2m platform device
  ASoC: fsl_easrc: register m2m platform device

 .../sound/designs/compress-accel.rst          | 136 ++++
 include/sound/compress_driver.h               |  46 ++
 include/uapi/sound/compress_offload.h         |  63 +-
 include/uapi/sound/compress_params.h          |  23 +-
 sound/core/Kconfig                            |   3 +
 sound/core/compress_offload.c                 | 351 ++++++++-
 sound/soc/fsl/Kconfig                         |   1 +
 sound/soc/fsl/Makefile                        |   2 +-
 sound/soc/fsl/fsl_asrc.c                      | 179 ++++-
 sound/soc/fsl/fsl_asrc.h                      |   2 +
 sound/soc/fsl/fsl_asrc_common.h               |  70 ++
 sound/soc/fsl/fsl_asrc_m2m.c                  | 727 ++++++++++++++++++
 sound/soc/fsl/fsl_easrc.c                     | 261 ++++++-
 sound/soc/fsl/fsl_easrc.h                     |   4 +
 14 files changed, 1851 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/sound/designs/compress-accel.rst
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c

-- 
2.34.1


