Return-Path: <linuxppc-dev+bounces-1178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7410E9718FF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 14:12:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2QgL4nG2z2xxt;
	Mon,  9 Sep 2024 22:11:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725883918;
	cv=none; b=QOPCDDyBNkny42cYXHdEgLrUMHKIOUYEI3pmj454ZbBm0DJ7vft90v2YYxSSfoWshNKz0+0oDzlgG6qoElSFwNwdTQoR+0wnnXEXJjDxFd9276PXi5oQt294z3SZWcFWgJxjHRjRj6Y/+nKmjr7ABCbJFvfhoayr2k9Jzedqx+yfVkse+4JmHARSX/WI76ZJgvENWugz08mGhbN1w2fV+bv4V3Bj9po49q0QfrUVHGB4HN+mMyPRqbLG8SXXJO1xSdLMfAcPuoCo8XxD3WCwsAwSgSe84GrFiaKBmKm+bgSW/OdCiqozbzRWbDzq7OvBbzOqhuy5ZCg5UuAU4JvIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725883918; c=relaxed/relaxed;
	bh=afjW2HbfOkKhSUvBb1KpugqYFb+VlNLEMmHfBzTMbUc=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=LVjI97pEAU75eWygOZdtVJUnzDOY7tjjw0g1u5/m4iyeGyLuFp0m8GyK9ccTCSONHy2A9D1B+tbKx5cEmwZI0S8rmjxXSq/OQqJ5r/IDOX24Zaj680lck7fB7+eR4Da2cRVY1EHoIRrelTA2R0HqAaA/0HnU1wT+vFCGnUsXV+Sdti0IelkUbXtORlkj7qzN3x9d0ryYnytFhgMJBT/BIuzCoCJOqgQtWqjjv9SsxEiUjmXD0WzNwvMNrCVJ+Q05L5iT9f9I67zzA8H3F/U8txVOdfSUYKud9R/EWOwe/O5PzB38Zyr3Hur9dJitxy3baP1pLabF9SHUmRZf7UNL4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=F8eAawXj; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=F8eAawXj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2QgK0LjNz2xYq
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 22:11:53 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 72AA81BF204;
	Mon,  9 Sep 2024 12:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725883902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=afjW2HbfOkKhSUvBb1KpugqYFb+VlNLEMmHfBzTMbUc=;
	b=F8eAawXjVdvdQglkIS1te66pz6gB4LnLU6IVQ7BflkBY8Sywmw90NfiQrJQsf5x6Apeyfv
	iP9OPhLI6eB+kS4EwyLIih814oi+98l5SL1XegBNbmzDxCJqxGUzh42Ioi9oPg695+aroL
	tlr5COqF68sniaFyQDGmzHKHpEbO4sK0U/foqB7ZpP1V9auuBY3Bos/Oif2PTSqBjdFxY8
	iJr/g7X1xsOOAM3uQqY9iv4Nn0urhotGwsZvcrka8xg9Tz+Q1EZ8myVeytOJbUoD/SrGlM
	8J9KDv18ChOOZdxBNMBbMbJE8pRUwIN1X7xSVW246FIOwnyldvU+aDLKf0GCwg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] soc: fsl: cpm1: qmc: Fix unused data compilation warning
Date: Mon,  9 Sep 2024 14:11:29 +0200
Message-ID: <20240909121129.57067-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

In some configuration, compilation raises warnings related to unused
data. Indeed, depending on configuration, those data can be unused.

mark those data as __maybe_unused to avoid compilation warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409071707.ou2KFNKO-lkp@intel.com/
Fixes: eb680d563089 ("soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) implementation")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 3dffebb48b0d..5e38be6530f9 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -2056,7 +2056,7 @@ static void qmc_remove(struct platform_device *pdev)
 	qmc_exit_xcc(qmc);
 }
 
-static const struct qmc_data qmc_data_cpm1 = {
+static const struct qmc_data qmc_data_cpm1 __maybe_unused = {
 	.version = QMC_CPM1,
 	.tstate = 0x30000000,
 	.rstate = 0x31000000,
@@ -2066,7 +2066,7 @@ static const struct qmc_data qmc_data_cpm1 = {
 	.rpack = 0x00000000,
 };
 
-static const struct qmc_data qmc_data_qe = {
+static const struct qmc_data qmc_data_qe __maybe_unused = {
 	.version = QMC_QE,
 	.tstate = 0x30000000,
 	.rstate = 0x30000000,
-- 
2.46.0


