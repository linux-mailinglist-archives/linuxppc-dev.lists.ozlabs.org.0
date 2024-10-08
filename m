Return-Path: <linuxppc-dev+bounces-1814-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790D7993EE7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 08:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN69n06XNz2xYw;
	Tue,  8 Oct 2024 17:51:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728370268;
	cv=none; b=jPAAXKE554vAd8ysY69qYUQuUc/qdWq+KFc5vtais0o4yRhP8j89Tq46or+VjWvAm/vS/sNYNqcUprr60FZxJqh2Ihe2VW0qRI8jQ6Q08ygRruBHKobkZklyceAYwAkSE3lG2y1Z1bMH0qfp6i3U/0Jw2QHRroMxmf8hShl2ZzO5hkF0gUaW5TM5U5dPMYibQd3AaI+Vz8bPBQzQUkDJYJ89Ln6lDed4N6G+w1f0kUY+2m2opF26Og4zAW1KrxtWNNxyZxdsjd2IgpMMFViKYGtuMMA+6IR6OHvYp9u+ZgdGxx/iC1LmKaifjsvfM3utKG5Rz6BQ6XgefQBhLNO6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728370268; c=relaxed/relaxed;
	bh=zJiEGuIgVaHpeFic9qudpI7y0cjUEkDPo94cHH0d1kg=;
	h=From:To:Subject:Date:Message-Id; b=BwMk+dqlSTYw2EzGdqXPJ8g/ADP9mwpt4IerM17QVPJltIkcx/k1SerrorkJdPsFdh9oKv/W1oV0QI7Fp+QBsBJjZPkx6mEmQcyC2V+l2hUxZEKQ/QWcFRAqC6A9dlfXbcbFhdHwJF2jytrbm4KjliP8+gCfTTEYeTs1z21HCLdlVMK4saa2ue3wojM6hmCTLcFGbhY1Zqyh3OXbtrw38no9IUWgDAQBP1sqmETRLeLH/S4vK1FprdlE3X95DLc5E/viBOzqGSxU9QSvJ76JEYyjucQ1mDoVnZz/hewrcM6BYbAXBScoJ5fxdBrVBLo6bgU8NhP8FVYD5BcgDMJAmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN69m0ntSz2xWT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 17:51:06 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 122451A245B;
	Tue,  8 Oct 2024 08:51:04 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CD7DF1A2466;
	Tue,  8 Oct 2024 08:51:03 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2EF8E183B720;
	Tue,  8 Oct 2024 14:51:02 +0800 (+08)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl_xcvr: enable some interrupts
Date: Tue,  8 Oct 2024 14:27:51 +0800
Message-Id: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
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

Enable interrupt of cmdc status update and the interrupts for
wrong preamble received.

Shengjiu Wang (2):
  ASoC: fsl_xcvr: enable interrupt of cmdc status update
  ASoC: fsl_xcvr: reset RX dpath after wrong preamble

 sound/soc/fsl/fsl_xcvr.c | 94 ++++++++++++++++++++++++++++++++++------
 sound/soc/fsl/fsl_xcvr.h |  5 +++
 2 files changed, 86 insertions(+), 13 deletions(-)

-- 
2.34.1


