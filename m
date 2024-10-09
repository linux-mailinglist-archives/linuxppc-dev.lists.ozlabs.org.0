Return-Path: <linuxppc-dev+bounces-1873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF5A9961E6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 10:10:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNltV5hb2z2ywq;
	Wed,  9 Oct 2024 19:10:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728461410;
	cv=none; b=a4ps4vWeaRtotIXzcROMIBF1FD/JaES4XTrMNbzxInHcmUFXw5btWjWRStpqNJqVxZjIErvOM/Jo6bSg/XPAvmLT5RjmJfEVnz/ezFY6oet/9TSdvp/vOrfHReheu3RxQKKzctoh0B3gfo93w8HxOJHoGpd9iVGzHGqHdi14R+U4j/y4KGaMRjt4fUDT7hKEI+lIQeXcAyLbLpuDA/rxD45kVGPMeNKv9wYhvxu7opzZSsLGSbXmV9HBr19aXxs5NKupaeA9pj8XIrfC/VCphQtnXe1/GeOoi11Dc/HbzrgTgBorlt8l84HpAyx+pq1xC31PcbfLf+UrvTT/+fQvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728461410; c=relaxed/relaxed;
	bh=HhHjsA8NygWOKooc9/mLe9mcuCkZdT6JzZRHAgrZT9s=;
	h=From:To:Subject:Date:Message-Id; b=Ayr7zhIHSGL3zhFpeKfQHJGOLKGyWfb4wYP2ObUH14md9UJRcihoEQFKPwdOTExf7TvZYtJ0nj3tjxYk/nGEVlF1rAgiQ8dY4AukBlwtWrpRGn1z37kqim5okKmJkSBmszh0uSqaGzWrGq8jtXcy475BBxOfLMI24KE6YCYOWISgMhOQa+AFRxfw390not3ZaUP2QERVFl8CuSPyRUpu3yQBSt7cCXQqkd1q1BeaB0yvClcYm0NtiRJMnJgPm2NsT91PagEv3EaO8uIECMcnonKH3PGo3/bUMRFLv6rwBr78xVz/9L1sX1oTKerJZdFkzJ0v37McMjPCR+uaAkRWSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNltT50bsz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 19:10:08 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EFB6C20142C;
	Wed,  9 Oct 2024 10:10:05 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B65A7200874;
	Wed,  9 Oct 2024 10:10:05 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 00B65183F0C0;
	Wed,  9 Oct 2024 16:10:03 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chancel.liu@nxp.com
Subject: [PATCH 0/2] ASoC: imx-card: add cs42888 codec support
Date: Wed,  9 Oct 2024 15:46:42 +0800
Message-Id: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

add cs42888 codec support

Chancel Liu (2):
  ASoC: imx-card: Set mclk for codec
  ASoC: imx-card: Add CS42888 support

 sound/soc/fsl/imx-card.c | 59 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 7 deletions(-)

-- 
2.34.1


