Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8645693F870
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:41:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=m4MueV+6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgz93Qbxz30Tp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:41:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=m4MueV+6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgXP40rgz3cZ0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:41 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 530CE24000F;
	Mon, 29 Jul 2024 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FvEzUuiCOfnh2DPlfnjuHlcRxA+Sue8P0D/mhBqQDnk=;
	b=m4MueV+62neQQ+6i2Jf3Co/fNl8epSTFK7rLSK+raxG95/As948+ozAVoaKxlbk/QKEiZA
	XS3eHzvo3CL7EbDjnxX2+XhmxfbNJQsdZlj/RYZd7/4VI/FUjAS1em9C5CntcDv9tIXl9a
	qJmEKi3SIV4gFl8WqT4DaWVJ/JIN8+ITFhK/YomaPRS1+FMKlAXGJZmpnThAmtPmA82xHT
	0lOJE7+IlhMlncYakTgl9sXM26swCUcB9XMPTptQI81ossum/L03QQ32X2gIE+6TGEYg+3
	qOgu3UFY8W+aPl/R0GPkQa95izoP5GBI32HpwYGnQ3t8huEA5NCVITHNTIH1zw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 33/36] soc: fsl: qe: Add missing PUSHSCHED command
Date: Mon, 29 Jul 2024 16:21:02 +0200
Message-ID: <20240729142107.104574-34-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240729142107.104574-1-herve.codina@bootlin.com>
References: <20240729142107.104574-1-herve.codina@bootlin.com>
MIME-Version: 1.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PUSHSCHED command is missing in the QE header file.

This command is supported on MPC8321 and is used to modify the start
address for the task running on a given peripheral. It is needed for the
QMC in order to perform the re-initialization procedure and so, ensure
the correct UCC setup in that case.

Simply add the missing command in the commands list available in the QE
header file.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 include/soc/fsl/qe/qe.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index 629835b6c71d..8f967d15e479 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -469,6 +469,7 @@ enum comm_dir {
 #define QE_QMC_STOP_TX			0x0000000c
 #define QE_QMC_STOP_RX			0x0000000d
 #define QE_SS7_SU_FIL_RESET		0x0000000e
+#define QE_PUSHSCHED			0x0000000f
 /* jonathbr added from here down for 83xx */
 #define QE_RESET_BCS			0x0000000a
 #define QE_MCC_INIT_TX_RX_16		0x00000003
-- 
2.45.0

