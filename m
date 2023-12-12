Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0938080E84E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 10:56:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lNPBgXlE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqDXC3qjZz30g7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 20:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lNPBgXlE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqDWL5vQ1z30Yb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 20:55:23 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 248EEFF80E;
	Tue, 12 Dec 2023 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702374917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7Tn5wI5gn7nTh88+WLO90/5fJEgKDZovksmyxdBex+M=;
	b=lNPBgXlEBBxvyLStrOohMkAtT29dJrMtq+lZMOqrhvg69uOtsqRerGTnZNDwynbjT4b9yh
	ZPr+DBtF6O4T85TehwSsXqqaWJH17me2lz3Wp8dcCNvbStqBu43oWeQhKxuCMtCXaSUzUH
	nm7oMFhY2IL9PD8ZIL/nUQUifxsplmO7RIRiJITyIBJ0832xor2ad1tjrXAmE/8b7i1Z61
	62Rx1nzwdxeqEulH5l8FtALNNI7PyO+sMng0RZzMAw5OKUu8JrDgMbnjbeWkB0WZkPB0U3
	FPXf2t34U7+HSVuEZjjGQp/nQM0Zek7+jsTyf7hhmKGGfx9n/ND3bYCCSvdGdg==
Date: Tue, 12 Dec 2023 10:55:14 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: soc <soc@kernel.org>
Subject: [GIT PULL] PowerQUICC QMC and TSA drivers updates for v6.8
Message-ID: <20231212105514.273e8ab0@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:

  Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)

are available in the Git repository at:

  git@github.com:hcodina/linux.git tags/fsl_qmc_tsa_v6.8

for you to fetch changes up to 7a2ee1576dcc6bbe017a8283fba237b05b13fd15:

  soc: fsl: cpm1: qmc: Introduce functions to change timeslots at runtime (2023-12-12 10:29:20 +0100)

----------------------------------------------------------------
PowerQUICC QMC and TSA drivers updates for v6.8

This pull request contains updates to prepare the support for the QMC
HDLC driver.
        - Perform some fixes
        - Add support for child devices
        - Add QMC dynamic timeslot support

Signed-off-by: Herve Codina <herve.codina@bootlin.com>

----------------------------------------------------------------
Herve Codina (17):
      soc: fsl: cpm1: tsa: Fix __iomem addresses declaration
      soc: fsl: cpm1: qmc: Fix __iomem addresses declaration
      soc: fsl: cpm1: qmc: Fix rx channel reset
      soc: fsl: cpm1: qmc: Extend the API to provide Rx status
      soc: fsl: cpm1: qmc: Remove inline function specifiers
      soc: fsl: cpm1: qmc: Add support for child devices
      soc: fsl: cpm1: qmc: Introduce available timeslots masks
      soc: fsl: cpm1: qmc: Rename qmc_setup_tsa* to qmc_init_tsa*
      soc: fsl: cpm1: qmc: Introduce qmc_chan_setup_tsa*
      soc: fsl: cpm1: qmc: Remove no more needed checks from qmc_check_chans()
      soc: fsl: cpm1: qmc: Check available timeslots in qmc_check_chans()
      soc: fsl: cpm1: qmc: Add support for disabling channel TSA entries
      soc: fsl: cpm1: qmc: Split Tx and Rx TSA entries setup
      soc: fsl: cpm1: qmc: Introduce is_tsa_64rxtx flag
      soc: fsl: cpm1: qmc: Handle timeslot entries at channel start() and stop()
      soc: fsl: cpm1: qmc: Remove timeslots handling from setup_chan()
      soc: fsl: cpm1: qmc: Introduce functions to change timeslots at runtime

 drivers/soc/fsl/qe/qmc.c      | 658 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------
 drivers/soc/fsl/qe/tsa.c      |  22 ++--
 include/soc/fsl/qe/qmc.h      |  27 ++++-
 sound/soc/fsl/fsl_qmc_audio.c |   2 +-
 4 files changed, 538 insertions(+), 171 deletions(-)
