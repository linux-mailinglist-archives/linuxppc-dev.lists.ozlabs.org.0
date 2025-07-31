Return-Path: <linuxppc-dev+bounces-10478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9FCB16BC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 07:58:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsz0T3qNWz305v;
	Thu, 31 Jul 2025 15:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.104.207.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753941513;
	cv=none; b=VRtCBjrCsb1e/P8g0ZLzX0ULQtDbLu9uN6rFO2FJZpooQfUYlLFQf4dDT7bIzOAMpi/uq1Mvwxs107seFebiikptGnSoP2A1xA9nNclb9/LHVyIPU9bbLdsZXekJTYKqQkzWdeh90w+GG3jzwzChOComYZRBJqUgK5k3vRGmcT7GLk6eb03RgOo3VT6l8RTXhzGINNg+baXt8DEhQ1AoWMXS1phPtX28ImxaZbmJnkclofSj5xc+oSMxn2XgJZRb5QyKuR22m0BGfVT82Bm64W00rEkFtDjq/FBVqIy2KPu/wxl/nUTlWPhCA5+xLs+h//MdUdntiE4Fdr5qu91emw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753941513; c=relaxed/relaxed;
	bh=98SHBebru6MCJ/QnRQtH2DcDv15Ssbf4Sj22mQlx6D8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cetiq1ps86A5zndaDSxdaqEHnHuWqmwjyWThxtV3rOgIb7oqnEpMvkTzklWBalYwwUfwboqCMBsYZaV7rcSZPqlW51YXXQ9on4gaLvobgYRbjsl6u9paAKlmb1zh8GQBCLBOTnsLmdW451I3uiifRE0+qYej6XO7ghOs+A/3yV2eZ2ETPrUOYewcRbzt1ZQIyTudtsfMHDDY6lJWaKWGnCS8ByhD6BGNGnpLak4OBjPZFmJBA6SH/u/dYzajIII1BBfpcNWR9JCbYWv1WZZ+6SwoSeggty1u4iNKuQE0b5O/zQv/fBgaC/aA3gKho2lrAhGI/M2bscVaubUpl0niKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ivMHBEJx; dkim=fail header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=dkim header.b=fYaC+P1x reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org) smtp.mailfrom=ew.tq-group.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ivMHBEJx;
	dkim=fail reason="key not found in DNS" header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=dkim header.b=fYaC+P1x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsz0P5MSBz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 15:58:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753941510; x=1785477510;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=98SHBebru6MCJ/QnRQtH2DcDv15Ssbf4Sj22mQlx6D8=;
  b=ivMHBEJxe5U5MqUQcNhmsgkKsrfzOUH7Vk/zTUUVNpJB0Ho9EXkg/db/
   Z2zF4W5Wi7VpM+Ogh/lMYc600aeaBSV4mVc7jjcUpB9IYj4XjsNm0Xirc
   ZKB7L6Y/rH/dqd+mhY4d6vvIj9U0cf16okplNJPBCIUSO4mzjQuI+ZDty
   K0dfOmszRDe2/r3vfYMI0Y9l+njNAbPd5h5Hnx7feHxpbCgKvZI+a6OC/
   bpNOt9m4ktO3MVWr1tLTfKTSoFWUCn9qez5miY43s7GH2Z/xTPg5SIXis
   ZIwTq2OQfON5Se6t7D1wALBDAou5PjvboLEzVdDhqfw2dL/b67GYASC5x
   A==;
X-CSE-ConnectionGUID: 42qa7/ZfSFKqzF0ESfeQZw==
X-CSE-MsgGUID: Yx8XBTCYSbecOEUDS8gpeg==
X-IronPort-AV: E=Sophos;i="6.16,353,1744063200"; 
   d="scan'208";a="45509996"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 Jul 2025 07:58:23 +0200
X-CheckPoint: {688B05FF-6-FE216C80-D1ADDD01}
X-MAIL-CPID: 343950EB2E7D3053FAAC216CA983035A_4
X-Control-Analysis: str=0001.0A00210A.688B05FA.005F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66CD616B0A1;
	Thu, 31 Jul 2025 07:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753941498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=98SHBebru6MCJ/QnRQtH2DcDv15Ssbf4Sj22mQlx6D8=;
	b=fYaC+P1xLljM/NdSckBIk110Nhmd1J/Ou3zJkfO2E39fvTHYbPAkTpDurN7pZ5dqN1zv7t
	32gjV002+v6EELCUgr6ThmxHXKVlNMeilROyXBWFtHOrK0mIg6HCLG64oHpx+lPUv3ZyOL
	oicN55gMPoRsRRX1unSIYzfpsGYiaSf0SjHtbNCOw0DDPPsMmIgElei9iCHwFM6qnOwg90
	GUNkwpWN+9KFonU63w42lG+IXMI72z4E4qP/behfKf2Z+uiAUe2y/iFVZVGqM9bgEErckL
	ahkJBbhgEpYYOzgGirYRBYo6Scj5gXbNPfS2Omwhybral1ccJDG2LLXM/Cdz4w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] dt-bindings: fsl: fsl,rcpm: Add #power-domain-cells
Date: Thu, 31 Jul 2025 07:58:04 +0200
Message-ID: <20250731055806.2265628-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

dtbs_check for ls1021.dtsi warns about unsupported property:
 power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'

But if removed the check warns about missing property:
 power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' is a required property

Given commit 8bcf67b8d893b ("ARM: dts: ls1021a: add #power-domain-cells
for power-controller node") explicitly added that property, add it
to the expected property list as well.

Fixes: ad21e3840a88 ("dt-bindings: soc: fsl: Convert rcpm to yaml format")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---

Changes in v2:
* Add the property instead of referencinf power-domain.yaml
* Adjust commit message
* v1: https://lore.kernel.org/all/20250725055835.260930-1-alexander.stein@ew.tq-group.com/

 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
index 03d71ab930d79..2aa8e8a2643ba 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
@@ -49,6 +49,8 @@ properties:
   reg:
     maxItems: 1
 
+  "#power-domain-cells": true
+
   "#fsl,rcpm-wakeup-cells":
     description: |
       The number of IPPDEXPCR register cells in the
-- 
2.43.0


