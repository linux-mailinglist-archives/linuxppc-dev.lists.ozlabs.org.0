Return-Path: <linuxppc-dev+bounces-1034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC296D04C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 09:22:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzrRT14KDz2yZd;
	Thu,  5 Sep 2024 17:22:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.199
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725520965;
	cv=none; b=MFf2jRBnEfB+rUIPUttpf40VG4+fOrUe2IRhUBiMj7R1CzJPnnG3M9BMViNnv2TtMjY6WJCP2vV3HyfpIDcNG4OgSntnkJTI6rWMEx8cA5POzsVB0SaxCapmLkTRs2z7nyKB0nEbPyUMcbI34csdV6QdEcGGir9bthbLcQj8Iv4NxTSMHDOs2w8LvnK4nhjdOTf5y2DSCawkWEnc/mxL0oNDWPNoYZgEjLIWUm4JBZA4ZF6r5isMuK5U6Wt2NtiSegEVZgf/dmfqSTjk6kNlLGyS9j5lT3UkkBl72CrZocTeS4wg7L5JOCQv/ed8rjDUWimcPmjt86xS92AFZUN/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725520965; c=relaxed/relaxed;
	bh=ebeTHJJbb+PLFbrG1rBx4pw6eea7SBZUAwaWEbHB2HQ=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=DVsyITxJZ83CZ5hcpYUCnuaPBCoANGSznAV4v8dl1QnvggT8hZfBtr3fep3/0e8RrUGh5kCVe1zagQODYjsIwyWpyqxUnxRgZCsUGJGUIlBb0ISoUIVyUcIkJtJSn+9hu7Dc5hBZGE72h4QdeRwosEGToXbuq8CptaV+z0fCt7LBNlIIJW6ppXuz3zFFZ98/w3F5vbVBNlPq6eIAFZ/wG0TNDa9ewoUT56ndkL7tnEMbuKzXmVTs9sQANQIXxNyAgKEXn9+Y5xuMlHJ48/lbLImYcniAKpnarP+wb1FMKo0P72THHv5rP2wGA3PljGKNzRQu8EOdRnjBKFOwmDGLSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=isGlYCcr; dkim-atps=neutral; spf=pass (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=isGlYCcr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzrRS38hlz2xSM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 17:22:40 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 480FCFF80A;
	Thu,  5 Sep 2024 07:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725520955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ebeTHJJbb+PLFbrG1rBx4pw6eea7SBZUAwaWEbHB2HQ=;
	b=isGlYCcrZxvgK8RrZaiIvw31/xfwNgJLYqlKFCWf60JSLeaiFGQuQurGe2W7uEnfvR5yyM
	kJ3QDmdWJmvb9PWxmW8xS2Rf2evzyF5ry8OSKrVzxu2Sj0QvTfAhEG4CPqVZl70DIl2DgV
	+cVzIPjxRYelptNTg1GEvTO0IGXH/T8wjIbts45+YzGo0dAKO4adWMbbslgXczh0G3WYKq
	zmaHOPPw2OSbiNFU6oumOyaAO/sjFVS5d4qbvnO2gzw5YflN/Ewi5DdxeH8QNzh2D7qRyN
	911xIrhrFkMMfZUM+92JTYYbQcsvc7CFrg5Zl4bon1t0IQR4Z2FICnT0fkLaKA==
From: Herve Codina <herve.codina@bootlin.com>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] soc: fsl: qe: ucc: Export ucc_mux_set_grant_tsa_bkpt
Date: Thu,  5 Sep 2024 09:22:15 +0200
Message-ID: <20240905072215.337010-1-herve.codina@bootlin.com>
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

When TSA is compiled as module the following error is reported:
  "ucc_mux_set_grant_tsa_bkpt" [drivers/soc/fsl/qe/tsa.ko] undefined!

Indeed, the ucc_mux_set_grant_tsa_bkpt symbol is not exported.

Simply export ucc_mux_set_grant_tsa_bkpt.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409051409.fszn8rEo-lkp@intel.com/
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/ucc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/fsl/qe/ucc.c b/drivers/soc/fsl/qe/ucc.c
index 21dbcd787cd5..892aa5931d5b 100644
--- a/drivers/soc/fsl/qe/ucc.c
+++ b/drivers/soc/fsl/qe/ucc.c
@@ -114,6 +114,7 @@ int ucc_mux_set_grant_tsa_bkpt(unsigned int ucc_num, int set, u32 mask)
 
 	return 0;
 }
+EXPORT_SYMBOL(ucc_mux_set_grant_tsa_bkpt);
 
 int ucc_set_qe_mux_rxtx(unsigned int ucc_num, enum qe_clock clock,
 	enum comm_dir mode)
-- 
2.46.0


