Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70943878077
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 14:23:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NPUF5zwl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ttct11wn9z3vjT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 00:23:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NPUF5zwl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ttcpx2r19z3bX9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 00:20:57 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42BCu6ti001855;
	Mon, 11 Mar 2024 13:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PDOWkT1/qUN1RbHLq4ddY3Ay1sVFnWbuFxkQ3Hny/jw=;
 b=NPUF5zwlgkOiCovnJzMsrQx991/40mEZDNRB8ylzZqvO5GpBc8mSAPLulk4ZdCFYRIsJ
 emmsH4Tby06EUf8rgdGI2VbkkcKdYsxQswkPyyuSP9WfI4EQ1HxUbx6CvpBUOxQeKCnw
 XWIidxxGIP5dsuYy1Cdoe9CZsaN2Og8qzg/UdC3mAn2nDFy7q4k45CPiX0a5rzTXupYX
 cc2+hD5RZF3w4zkwHdKP+BEGihPICuYzVAcxDB/UGamQz6XfGrnJbF09Z3XCJCNeE9DW
 IAEg9bEC+lKqOMxtT///nGC116vhsirQJkYHEiWXi9bjdfEUImLuroiETFUotZuCmujR 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wt1yk958t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:47 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42BCudFf004062;
	Mon, 11 Mar 2024 13:20:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wt1yk957w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:47 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42BBqP4a018581;
	Mon, 11 Mar 2024 13:20:46 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws4t1r7d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:20:46 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42BDKhSC7865002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Mar 2024 13:20:45 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A80C58068;
	Mon, 11 Mar 2024 13:20:43 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 759C058056;
	Mon, 11 Mar 2024 13:20:42 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 Mar 2024 13:20:42 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: mpe@ellerman.id.au, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 2/3] dt-bindings: tpm: Add linux,sml-log to ibm,vtpm.yaml
Date: Mon, 11 Mar 2024 09:20:29 -0400
Message-ID: <20240311132030.1103122-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311132030.1103122-1-stefanb@linux.ibm.com>
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 20ubOuGWMGmMN66zt-m4ZQr-JWVw_EUh
X-Proofpoint-GUID: yCzjiifoKb6BvxyBu9ESDz0GX__e7vvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403110100
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
Cc: devicetree@vger.kernel.org, rnsastry@linux.ibm.com, Nayna Jain <nayna@linux.ibm.com>, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, Lukas Wunner <lukas@wunner.de>, peterhuewe@gmx.de, viparash@in.ibm.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add linux,sml-log, which carries the firmware TPM log in a uint8-array, to
the properties. Either this property is required or both linux,sml-base and
linux,sml-size are required. Add a test case for verification.

Fixes: 82003e0487fb ("Documentation: tpm: add the IBM Virtual TPM device tree binding documentation")
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Nayna Jain <nayna@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 .../devicetree/bindings/tpm/ibm,vtpm.yaml     | 20 +++++++++++++++++--
 .../devicetree/bindings/tpm/tpm-common.yaml   | 14 ++++++++++++-
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
index 50a3fd31241c..8885ef3b7638 100644
--- a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
+++ b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
@@ -74,8 +74,6 @@ required:
   - ibm,my-dma-window
   - ibm,my-drc-index
   - ibm,loc-code
-  - linux,sml-base
-  - linux,sml-size
 
 allOf:
   - $ref: tpm-common.yaml#
@@ -102,3 +100,21 @@ examples:
             linux,sml-size = <0xbce10200>;
         };
     };
+  - |
+    soc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tpm@30000003 {
+            compatible = "IBM,vtpm20";
+            device_type = "IBM,vtpm";
+            reg = <0x30000003>;
+            interrupts = <0xa0003 0x0>;
+            ibm,#dma-address-cells = <0x2>;
+            ibm,#dma-size-cells = <0x2>;
+            ibm,my-dma-window = <0x10000003 0x0 0x0 0x0 0x10000000>;
+            ibm,my-drc-index = <0x30000003>;
+            ibm,loc-code = "U9080.HEX.134CA08-V7-C3";
+            linux,sml-log = <00 00 00 00 03 00 00>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/tpm/tpm-common.yaml b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
index 3c1241b2a43f..f6f0b551268c 100644
--- a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
+++ b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
@@ -30,6 +30,11 @@ properties:
       size of reserved memory allocated for firmware event log
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  linux,sml-log:
+    description:
+      Content of firmware event log
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+
   memory-region:
     description: reserved memory allocated for firmware event log
     maxItems: 1
@@ -53,15 +58,22 @@ dependentRequired:
   linux,sml-base: ['linux,sml-size']
   linux,sml-size: ['linux,sml-base']
 
-# must only have either memory-region or linux,sml-base
+# must only have either memory-region or linux,sml-base/size or linux,sml-log
 # as well as either resets or reset-gpios
 dependentSchemas:
   memory-region:
     properties:
       linux,sml-base: false
+      linux,sml-log: false
   linux,sml-base:
     properties:
       memory-region: false
+      linux,sml-log: false
+  linux,sml-log:
+    properties:
+      memory-region: false
+      linux,sml-base: false
+      linux,sml-size: false
   resets:
     properties:
       reset-gpios: false
-- 
2.43.0

