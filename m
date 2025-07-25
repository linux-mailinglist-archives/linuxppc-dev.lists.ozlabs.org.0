Return-Path: <linuxppc-dev+bounces-10399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0244B1182F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 08:00:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpHJy73sMz3bV6;
	Fri, 25 Jul 2025 16:00:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.104.207.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753423202;
	cv=none; b=g1il+mwDO63qRb3lhtL+YuH7lz3FOtB/ioR04+YQnePB/RimcD1iINYoow/kLFrMPiMLu6PRcHTAevSVJP/Pvr3qa+L3Xom8T3dFO5It2fkO1Jv+7PszPUAh67QaMDNf6inJkpFd8lniQXd9OaDcqV/eicE3LMQQ6NNKnebIkkALFtMudOb0kJ0t5HXFNV3A+cyCmQDY6RyF+2Nxfxa0oGYZ2IXL5umI1uCFdmE0Kt/EQgChJ1wQGWPq1/kIVICI1kpgnxDkWlcq1GNPa1HwODLJRoaxofAWU+nhrjua/Rrk5K4TS6/Kkb/ZFbecExgmDUeSw6QbqyId9cchdvcEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753423202; c=relaxed/relaxed;
	bh=V4QdjaSb9cXI8p01nmDA+/A+YYF9fy6Z2O8CYR9WSVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+PRzJPQjbsdTwnrNhv6uO+zCyE0QjcyzXuyBEqK0LnzlfW6fRNx7yFR+pwdigar2aqJEW8vNFc8oltEmCgXd9+w9WCuJAKKE+GeM+MSCtVVcQgInM0vudl3b/3MuPn31gJ9R0OQNs+hd4GYShodYudfPLqZP80Pjt6bsmPr4XiC74tvstVQqvH4+TULs3a+AlN1CRgjHKT2R+nfuqvJticBqk3UMVpCyYyp4mvjqghdCI+0+nFnwph/Gp8UBunFN5ph3yugbpVqUoiXsOpfJNJ4qSkOyFtCXqQr4TPPXh+uqS+RS8uEyjU2+m/HJHFPFnrRjO8D4g2FZqUQZm9EeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=pDXHVQRD; dkim=fail header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=dkim header.b=VcJKFj3J reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org) smtp.mailfrom=ew.tq-group.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=pDXHVQRD;
	dkim=fail reason="key not found in DNS" header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=dkim header.b=VcJKFj3J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Fri, 25 Jul 2025 15:59:58 AEST
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bpHJt3s1bz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jul 2025 15:59:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753423198; x=1784959198;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V4QdjaSb9cXI8p01nmDA+/A+YYF9fy6Z2O8CYR9WSVM=;
  b=pDXHVQRDuP4byfQmW2fstsewp3+pe73BwxHUjr2imXjmxjTu4cEhCnwc
   pVrK/olUPP1IZA95A2LObJ+sCGaOJehse7jB9VCgFH7MPKvRiIKv9A+N6
   n6MCrUzTzZw7ETwgr2Xe9NOvka24Tl29CjJlM6tb//LMenCHBeHLGmDcO
   o1Og0jCQtmAHt8qGyGv8OSPgD8hGgyJKdDHV8n+Z4xDtQClFjaNyOwszK
   XT3PB88/OgCk4UnrznyTUCgKl3V0EQoHEYUJQSaPjIshonI3GysOGk4MK
   ZpEnTTUNQQa9c2sYeDyed6XTJ6E4CEHleIHoX2JKhbc4gScAh5iUw+IHC
   Q==;
X-CSE-ConnectionGUID: tgE28l+3ShaV1TiRICoAlA==
X-CSE-MsgGUID: /HnVzqXOSEqWo7EWgSOZ1A==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45412596"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 07:58:43 +0200
X-CheckPoint: {68831D13-65-BB1FFBB0-EB2CC75E}
X-MAIL-CPID: D84144F887B9A33A50C0C2DD131BC566_2
X-Control-Analysis: str=0001.0A002106.68831D1B.0056,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F258B173583;
	Fri, 25 Jul 2025 07:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753423119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V4QdjaSb9cXI8p01nmDA+/A+YYF9fy6Z2O8CYR9WSVM=;
	b=VcJKFj3JkwShCaE0hIBZ0CmU43T7HFnPTHYwbM0zUpZDWX2UJ3ADKUHTO9eefxIfAhm2H0
	oNqo9NnM5PJE+eHA71PJFrVoU+qiUCHQ8lcPovRU58mw+RjI5MOaBndnfeS4OEVL3eYYoO
	qIWAqNj935NKJ7RFBQYtzz6YTIqDatPi+aN6S3HxVsvXhCOaOXEPvwYsmg53XFnAHIPBtG
	yaOXH904wNfesQQbKSa8QicQ26VY4Ao6y+ygYAJBz4Zsq6iykreT/w0Tg8FDZ5P/T+lFh4
	tMvr+wYKMqvkquNODQBMz0sGNTE6chb2bEg7Tx9R5lCTAREhhji0yAfLQE5kag==
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
Subject: [PATCH 1/1] dt-bindings: fsl: fsl,rcpm: reference power-domains.yaml
Date: Fri, 25 Jul 2025 07:58:34 +0200
Message-ID: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
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
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

dtbs_check for ls1021.dtsi warns about unsupported property:
 power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'

But if removed the check warns about missing property:
 power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' is a required property

Given commit 8bcf67b8d893b ("ARM: dts: ls1021a: add #power-domain-cells
for power-controller node") explicitly added that property, add a
reference to the common bindings to fix the warning.

Fixes: ad21e3840a88 ("dt-bindings: soc: fsl: Convert rcpm to yaml format")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
index 03d71ab930d79..5b7c0a1905545 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
@@ -13,6 +13,9 @@ description:
 maintainers:
   - Frank Li <Frank.Li@nxp.com>
 
+allOf:
+  - $ref: /schemas/power/power-domain.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -75,7 +78,7 @@ properties:
       RCPM register block is Little Endian. Without it RCPM
       will be Big Endian (default case).
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.43.0


