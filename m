Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DFB2A8086
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 15:14:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRlrF2pd5zDqxd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 01:14:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.52; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=nTACnZD8; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80052.outbound.protection.outlook.com [40.107.8.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRlnS17pPzDqxD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:11:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dn+y+u+2RYZXovE1VgnXAvq0UYleZAWwBI5A4/rUbbrwtek+NW/JYdQSa/P3Bdx+T4/I6BxYs0yrspefnVoFdCL8XjCG7S8v/8fAwD8KVAoV8qrtmWMIYItiEqlJ2H+OiZ0KnBcYJISbknPwv6P/KG2vf6DwJoqmiy4P3c43pPuGahhOxnn4lSdi9sg8+M/KkgJVevR05CkbKtIj53J3hs+/o9kSLgv/iFE8oA126NkPgyQSrUzppAqdpRLqwI83oPwmcgyLEH5TxDp7K7Yd6H+8svzHe9YRlFYwo4ErVI1CEir8+zqDLOTmQ9+95uY0U3ADfHDZweoGwHQekdwJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aan4qCPugIs9uyQoe3iXNY5LscdnEQPrUHQUaD//uis=;
 b=T6i6Um1hXPnN1qi5m0nsFKLYefAiCAoVgFDWKb7m5M6uD7WPzgAWcNK4GuFMcZlrYL9Karav2Aljhq2W6sHNPLAXofUsQ7yv87LkDI+Gk1UEFREbzcJUSVpxdTkJgLT9/An/F9dymvj+NKfDWphPUVxwni60t2jNdBaBYrqqzhenlaKK8ndGG7KcbLyK4C5zhbOV8axNP2ppJfq54qclHiNlTcYS9GgwvR4yb5/526zJFZKEiNwHNuU8IksM/ENxVB5lQw1NX+WylTmqTRm82fwRNnyJ+M+43XPcHtz/Ss50BrcJ6rsNc61EQ+i39Xm2UFBh2ojue3xZH2H/t5vWdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aan4qCPugIs9uyQoe3iXNY5LscdnEQPrUHQUaD//uis=;
 b=nTACnZD8VaC1uDL3kjFV9deQzD2LuPFKt3MVY+1IQYFFw1yZUJjhFs+ZJEp9x2X5DzegE3o1wCu5eolB9iCxr+R+6ZZECb54mg/YjeZnbJN7QFjI2D4wt+IyU+GXES/53/q/WwhRJqcaB+U5OCZLp18jVfIWlK3clWX7PqRs9sc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR0402MB3581.eurprd04.prod.outlook.com (2603:10a6:803:3::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Thu, 5 Nov
 2020 14:11:31 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f557:4dcb:4d4d:57f3]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f557:4dcb:4d4d:57f3%2]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 14:11:30 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: robh+dt@kernel.org, leoyang.li@nxp.com, corbet@lwn.net,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: misc: convert fsl,
 dpaa2-console from txt to YAML
Date: Thu,  5 Nov 2020 16:11:13 +0200
Message-Id: <20201105141114.18161-1-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM0PR01CA0156.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::25) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-101.ea.freescale.net (83.217.231.2) by
 AM0PR01CA0156.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 5 Nov 2020 14:11:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0143a702-3134-4aa9-5bea-08d88194b182
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3581:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3581FBFB38EFB02279F6F609ECEE0@VI1PR0402MB3581.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LdHPrrqMpxVSjtn5oiTfEpJuOx4BHpkzDlIlJiE2vZsG6akY/R8HzgQAcWBu3b10yjiV/IfxeCTv6/9HwwTMu33hLTGOuPzHI4J0v6vfCwglxE3Vs3RsUyYn1VnvBwqOTJwTVBf7+SPl412V6SbhG+yl1Awdyv2jnQwfsrEL8zVmdhwPUV4uJCkjKfXt5z2izJlVSX8VwtR42RAYJfyqBruOEJBr/RgWc5HP3Hs7CmZMIvo8f4klQI2zgwj4JeK+D+aObNWZu9ApduF4IfRhreZMxWFRVyQHg+Eki8lMxLXDySgHFaK15k5Mo9UYirL5K7I/50xqR2sYxCV3SbEPteeEpeViLzQrHa6KHYh0G4A7lQyPPVGHXQg+F+d9Y7TWlDTV9RWC+lB5QneiL29liA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3405.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(52116002)(2616005)(6506007)(16526019)(26005)(8676002)(6486002)(186003)(478600001)(966005)(8936002)(956004)(83380400001)(6512007)(2906002)(4326008)(66556008)(5660300002)(7416002)(44832011)(1076003)(86362001)(54906003)(66476007)(316002)(66946007)(36756003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: N8rQQQe3y/UYhdWN2sdPm4UsFlkVdMKWEw9Pq/nEU2UFqO0yOW1vAOtBKAIF2jYaaMtXkKlcJcK7EvEdmtlSCAEhYxlCIg1ziqIiVqU98MoOpFEwT6ffEgi+LpwDGxDSS1Eh+GVggbzUL1pD38H5N4pmQWGw2JBbeJzScaGiH6EzAg5ZUdrWcHOyLaVaMfvr1kk2wbeUctQmZcfhDn24qkH80J6maPm+7J0pR61u3jq/IOkJeoHb5smsXsU+vOmO8xO0OB8lHvn8m053W68RnePFV+dOMXZK9wsmPFwLCuwJ7dHgV5C/WaGgKIgihHceTW41rIPRDEVNq9y+hXV386wG9+BXtHCKaeT5ar9cDUQWpd9wCzQ1tsaR316I7IAC3q0BFp/x9UoclRmUKi9yTlpTpSj6Sxqmx9xxbpAPB5VInULW23KnPfF9jCe55xZZF7ru+VxPkuodMi0YDE6tb0nZVstByGlb5MKp8tI2hSIboSfiUN1fjA5WS3VKxS+SBB49+TLMyA6CQStw+kxmjPHDD/aNCYmyiisZ9wUNFMKI3FQ48i6+QiSh2LukraoeXeuH3iv2oVkQQkDUemcebt7+m0eS4MLBgdH3PyT86KASzyHf6e4/upuj+qPu5zyW+w7jmJUuh5SXs6Lh/xuFzg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0143a702-3134-4aa9-5bea-08d88194b182
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 14:11:30.8787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uc8z5wtAZLZEYeMle7jLPnBgVNaBlKIXkl5dfjSmL6cEwOn02HcfVL0ZjPZ1SuE6bNc1gaZl+UTf/UhTi4tfAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3581
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
Cc: ioana.ciornei@nxp.com, Ionut-robert Aron <ionut-robert.aron@nxp.com>,
 kuba@kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ionut-robert Aron <ionut-robert.aron@nxp.com>

Convert fsl,dpaa2-console to YAML in order to automate the
verification process of dts files.

Signed-off-by: Ionut-robert Aron <ionut-robert.aron@nxp.com>
Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 .../bindings/misc/fsl,dpaa2-console.txt       | 11 ---------
 .../bindings/misc/fsl,dpaa2-console.yaml      | 23 +++++++++++++++++++
 2 files changed, 23 insertions(+), 11 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
 create mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml

diff --git a/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt b/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
deleted file mode 100644
index 1442ba5d2d98..000000000000
--- a/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-DPAA2 console support
-
-Required properties:
-
-    - compatible
-        Value type: <string>
-        Definition: Must be "fsl,dpaa2-console".
-    - reg
-        Value type: <prop-encoded-array>
-        Definition: A standard property.  Specifies the region where the MCFBA
-                    (MC firmware base address) register can be found.
diff --git a/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml b/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
new file mode 100644
index 000000000000..9ffb864d8b58
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/fsl,dpaa2-console.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DPAA2 console support
+
+maintainers:
+  - Laurentiu Tudor <laurentiu.tudor@nxp.com>
+
+properties:
+  compatible:
+    const: "fsl,dpaa2-console"
+
+  reg:
+    description: A standard property. Specifies the region where the MCFBA
+                (MC firmware base address) register can be found.
+
+required:
+  - compatible
+  - reg
-- 
2.17.1

