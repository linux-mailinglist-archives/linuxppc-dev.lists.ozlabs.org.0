Return-Path: <linuxppc-dev+bounces-3160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C160E9C7E77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 23:56:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xpdv407mPz2yNf;
	Thu, 14 Nov 2024 09:56:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731538591;
	cv=none; b=QCCsftbMnzcuhHdQ7rhFBCZpfoiipZzGVY6zqlULfmnMPcFJzrw5tTDdVX3JpBI8/mlLTSA6j9TbXSQyNEG1id/mWftcVO9ZZ3qfaPQlbHFCQPDABJtBXmY+A4+lKE/Do1fb+y9BJ5caiJjy0QafQa8O41FwLSSv6kWBK+SPsWn3G+Nmu18+HcoErshfjDlso9yZ1RJMpg0eugbwMPg1dFfH5jKpQhnPEOgp7pGio+T9BySX/ZN+fZDIZvBb+r3DVYkCJ8QbcLnrtXywvMU+dKZGCGK9qPR8YFRCORAWRkfuFyJr1/++nRPzQVvGhZKUBY5kGB6SeyXbg05ImzSx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731538591; c=relaxed/relaxed;
	bh=xvTxlL4AVd1adTLjJKCTQxmhveAf7ghrK9pGb+92sCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HOtAKDuWYOBDtmhpWG1r4s4JWxw/1s52lYo9zts7Sb1T6j6x7L0fx4NUDVRwro7d0iJkD5d2cuqCtOl0w6F0LPRGW82fgjdEfcpJYUBlQk8e8eKPyGA8YrgJjYEXkp1m9Ucxi5sj3HIaHKjcgdlwRBTeW7h6UkBqdXScgVnOidiU75FgP3vJ+5U9YVzavnSZAG5tl+0n1WJcgyMzJnAaqfGtGmFUlMKhSk7PILuqqJY6G2rTDHrAZSIXEbi966fB0/8uIIsJtV93OiRpW4HOwK/MdR5kaA95419k8FY16Oy4WK1pa8rApfAZ2dPi9c6RPcjU3SOHcX2aTsSjhXIgQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nyNmEpTj; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nyNmEpTj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xpdv262Mxz2y8F
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 09:56:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0319A5C5B02;
	Wed, 13 Nov 2024 22:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD47C4CEC3;
	Wed, 13 Nov 2024 22:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731538588;
	bh=ppARoxV/BKuqM26l7GbAb1n0J5UopQIlgnjP2VYDPIc=;
	h=From:To:Cc:Subject:Date:From;
	b=nyNmEpTj99rigb0YjXknMOHR8svcWnsRjs1FchKtnDLUt6QDByAdr85hMX6/0npKq
	 HdVtlOxC211m6YH3DbKs888Vqt2bd39uSqkG8Kai1NdMMYbDXGSHzcrPOEKM3bs3eE
	 3n7UPexzl3tFD6lJBH2EK9Z7UyqSt0Qc7504Jd3aUWsCJsSILSOVHEeChrUp7WV4pv
	 +jO45a0vJ2q2pDXynL0BaJhaHrMoiDcAvmRhZt7NefwnZi+hqDBBWt+n8en4Yxi2eu
	 TyoCmNo3EdFVy7g7mz1nmZU762ku2DsIF69s3uHm6dJyRYkmYptg4U+NFSRpHoJDKL
	 +3cKBbPlJc2mw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: Unify "fsl,liodn" type definitions
Date: Wed, 13 Nov 2024 16:56:13 -0600
Message-ID: <20241113225614.1782862-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The type definition of "fsl,liodn" is defined as uint32 in
crypto/fsl,sec-v4.0.yaml and uint32-array in soc/fsl/fsl,bman.yaml,
soc/fsl/fsl,qman-portal.yaml, and soc/fsl/fsl,qman.yaml. Unify the type to
be uint32-array and constraint the single entry cases.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/crypto/fsl,sec-v4.0.yaml       | 10 ++++++----
 .../devicetree/bindings/soc/fsl/fsl,qman-portal.yaml   |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
index 9c8c9991f29a..f0c4a7c83568 100644
--- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
+++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
@@ -114,8 +114,9 @@ patternProperties:
           table that specifies the PPID to LIODN mapping. Needed if the PAMU is
           used.  Value is a 12 bit value where value is a LIODN ID for this JR.
           This property is normally set by boot firmware.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        maximum: 0xfff
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - maximum: 0xfff
 
   '^rtic@[0-9a-f]+$':
     type: object
@@ -186,8 +187,9 @@ patternProperties:
               Needed if the PAMU is used.  Value is a 12 bit value where value
               is a LIODN ID for this JR. This property is normally set by boot
               firmware.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            maximum: 0xfff
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            items:
+              - maximum: 0xfff
 
           fsl,rtic-region:
             description:
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
index 17016184143f..e459fec02ba8 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
@@ -35,6 +35,7 @@ properties:
 
   fsl,liodn:
     $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 2
     description: See pamu.txt. Two LIODN(s). DQRR LIODN (DLIODN) and Frame LIODN
       (FLIODN)
 
@@ -69,6 +70,7 @@ patternProperties:
     type: object
     properties:
       fsl,liodn:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
         description: See pamu.txt, PAMU property used for static LIODN assignment
 
       fsl,iommu-parent:
-- 
2.45.2


