Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A705827FF7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 09:00:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=rtEKg2rp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8NdZ0LjBz3dRH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 19:00:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=rtEKg2rp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260d::600; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8NZ14mm1z30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 18:57:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GICPR0veMtfMwymAq6vwin7zjCMO7wjxclKwPH5s2SmGk+HH7MqowMw64w+Qg/Pa4qab6hxOWb83bsAyyOIiHSbVOnJgatjYJYJAu6eNkEcG8Q2a/eELHM0XxwCF6cJ2aQaDTvMjE4SsSfBjziLjhA3RVi3a/dZpG5cUONf2h8FRbqgQ3QuvDCRBkrRnQFga3qOVmGsMFELpDLAGc6zQt4AAr+ko4xqpFwGhbm9VwPU7JLkfB/1e7bivQVGkinopen8Z/9utwqUIwIvDwcVTAo/M9S656Z2Um6smFLMoT0O+8OQ3B0gvRyYMMx9ozttw1uY+7FOPQ7EnDqM4f7/0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiTuNLnAMYxl8wl1gM2TmXTvurPxCZe6EOS5AQuW3MU=;
 b=J2M+aoH5x+04qu3ebYOBgHI9M0U8TvJnAQuDrsOTLXiTr0D6pSagLt2OU6PrL4clJ7DHMWZr9Qh83EO+6D1CLjgY0EYy/uUe+jvHhHpf1uO+5JgaWDQJqiJs1gQLkHLkAcwOt7v8wujUS3LSygeQG8tsFrIzqk7od60ouIEpHVKecPoTRBEMz4tP7QYK5PREThPGbZlOw2rKvfC4KPd3BVMTZFtXfERwrdPVdgT+0pDp6DBjpAjk0bAkCY6I7EznzxGR142ismhg3xn1eCVOeMdafRp6YHNEUijUgCDu9fiAJKAxPT/JozPKV5zovVFECJ0J1d4QI9RqoSGCwoa51w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiTuNLnAMYxl8wl1gM2TmXTvurPxCZe6EOS5AQuW3MU=;
 b=rtEKg2rp6Omre1a/6WLGGJtFf60Mxrjp4/r4gFj5C6fBtSAVkWBAKhoJzd2hDQf3szGdEv+YkR9aH8xZOp80f5s3wBNqJ4JctGdsiUiW6n8jb4noaR230NSXNFyCqZKNQnj1Kn0WTwr0wIhsilis3zsQUqAJGHypxtwVJOZNKfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by GVXPR04MB9994.eurprd04.prod.outlook.com (2603:10a6:150:11a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 07:57:06 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 07:57:05 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX95 platform
Date: Tue,  9 Jan 2024 16:55:51 +0900
Message-ID: <20240109075551.870001-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240109075551.870001-1-chancel.liu@nxp.com>
References: <20240109075551.870001-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|GVXPR04MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: e304fa24-db19-459c-568b-08dc10e89278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vkofNcWdj+O+up2GLZ5np4eu5s3HNaVEh7IbRhMJg/cp3evx9IoNHNC+zpeyc8zvqejIHRZksnJPUpgC90BFKptxube0+k5LD4Kos0cCrjdaG/aCRpxYtza0bhuIQMveqwjaMukV3sgkxOWFG9mTy4fEKZ+wIjErjnvInBlaqcglngV7Qhs/GC+BrvGJS43TFiK6qPx9q+w8oPn8Pk03xooEGnx4NPJf5G3KMeHjCH2cMP3mya/zT2IuGE95uXXmM6k0eCbKKcwe/GqrBMFpO7Y+ktSwggxlTBfPVjPeBmiTLVMDEjrFDXNJoJlyDGaqwDmtqPgnV7jSsaa4icYqtZMipBn+0hj/3e4E3HqBy1f+dNcaNQKXTElHBHyoTw4MvNwwFhCGfNt4xyoJ2u2XXQJj2zA9KMrc0sEgPejlzVwpDNA6MAThdvgfRHv+IupPEfCFYB9fIX1Dxfl9FkGIhLc0bLIkzxRe8XUsZYsRilesavjC46jfGrmztnCE90PSIGUp/Rx07VNXxFejkes5r3fWrhof4U5a5jziA7a5CNvaLb/kKV+tbuUPRvb0Jots81UO4HmAtwnJMVBa4iK4gAQfqYTca0EdHCHzL9XlDkpIPTHL2JczdXsPsNFpVQf7pxPAyqmOBlJIhneXxxnAqg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(1076003)(2616005)(26005)(52116002)(478600001)(6506007)(6666004)(6512007)(6486002)(38100700002)(921011)(36756003)(86362001)(38350700005)(4744005)(2906002)(7416002)(41300700001)(5660300002)(83380400001)(66556008)(4326008)(66946007)(316002)(44832011)(8936002)(8676002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/00SZLcw10Lw6EpW6HMENymzw1v1PcQNr4cZEABtD9wISjD+g6dFMvURM5En?=
 =?us-ascii?Q?/5T9hFFOjDel28czExp0DpAwDVhoUUd69gPjwLM2Qf5t+bSW8uo/tiesi4U5?=
 =?us-ascii?Q?vxoPUyy2CGpsRnAdV9sf/feetzr+tKLlO6M3cIw6C3IdqzZj8tw/u8euXEki?=
 =?us-ascii?Q?mh1lO0uWHEO/8BcRnudlRukVx5TTzo9kVPO6ZSnB8kaASyxSHcTcdtIbgoet?=
 =?us-ascii?Q?mCyJJXhmXd/3NQIu0xgCDU1lMjg4gdZRZaSauC2hFWcXf1XoWESPbACSjDQq?=
 =?us-ascii?Q?Whvnlyqs9GT+NCq+Ho2f4Qtg6/Z/xqBAqtg2THliQR+lx/XjUPsAqOQYL75H?=
 =?us-ascii?Q?gSUp2EmsO8Q/lfd2vFEnf/VgrXStOvOykPawgPPp9hecpDhAhI+dRkc6xyXr?=
 =?us-ascii?Q?ngcvyF88BKPIysbHeMXS2RPfRe6Ja+3OMbwz7I5QP1GctRntvTYWosBrAAat?=
 =?us-ascii?Q?iBpaKX+j0FGKXUZ7mJou1l/j8Pe4IbnQV64v1SfhSi9dIvKK/TGjNHPi6/WT?=
 =?us-ascii?Q?gpWOdnCGyyl1Smc24otcoCAI+MP4Fkjanxg8IGsvrRiQv613ujs2DT+t3qhd?=
 =?us-ascii?Q?5/2dX8JlrSZKtAAWmVskjDE2limYXuOKniueSpSqejxbSvcQLiQFHfZidDnL?=
 =?us-ascii?Q?vrv3vSrSbTjGdgiZyqdTJznpcLQ35+kBMpD+1fjbaX7XBTvMBKe8YFoAkI1C?=
 =?us-ascii?Q?ghM0j4SUzuFLCFwsOLyfs7uz41q9hcHxXcpGYbhcRMkKPLVaWoc2NIZSCVpW?=
 =?us-ascii?Q?Kmu4qA9z4Ndi9vxI8sTeInEa4vPMRAufywX0W9FASbx9k4VK1fO9AOiJhKlf?=
 =?us-ascii?Q?zV3Ml2wkaKJ0H5y2ufI5NQiju7l8usfAa+ltiLZE8tiJi7DpuXuR/b1Vsmq3?=
 =?us-ascii?Q?J4rn4I7cxvtUF+gauoBDk+UOkRCJNevzTiODzRoLE0aMGH3kJg9w0/rEaUZu?=
 =?us-ascii?Q?hF1E0wcbOiYSm4mILXzNEwLGZXYgVQAgkaL4Xu9pK5SAbzMU0OUQLA/83jGH?=
 =?us-ascii?Q?/hnRjYZpP+gpzrp3UJlU1NxzQPOMh3I8GYOAR1LoZzLa672AOLkWBx2RQJPb?=
 =?us-ascii?Q?cwgfL5vzWfLqclkCqPKs3aGLD82mi3C583tUBE1dkfU9g0dqzwifz3l6RbZ3?=
 =?us-ascii?Q?p0s3php3m5OEeI1ZcrFMqvSt30uzZ3wjkylfwdpAqO/TpgUcA6qrjPMME6Pm?=
 =?us-ascii?Q?0agm0mKBvHaEujHg49xyOgy36XFr6PwwYmZ1JE8fjlgpN1n6Ey+UdsxLvIku?=
 =?us-ascii?Q?aAOmX6NRA6sRnzkBjtZapByM4uuPSW/Ue3Rh1UHEEOooPdU26VZlFdEZzIHI?=
 =?us-ascii?Q?isdlSGxVjobHncy0hmefM0IjoBVqhWJV/le+bXFJ8qMkV6cXGH8Z3GnyN3qa?=
 =?us-ascii?Q?RRjl1ohH01tjoUEXb92nJ1+Zd2PbaQH8VbjnTD0FqNq0GgdaMLoR+id+gk2f?=
 =?us-ascii?Q?wNfnrT1WndG6lJA1pC47arOVudFsAjH01br9MYUjr8lVFqvi41qJrZy6ZybC?=
 =?us-ascii?Q?ExDQVYfYLJJ16nzS6y6Fbo9a1OM8xGT/Er0ukF+eyjjPeX6fjlqh2VmHOBUS?=
 =?us-ascii?Q?YBFV8D8BiuQ3C8f+R1rY2aLv02i9/ndnsj0JFyJg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e304fa24-db19-459c-568b-08dc10e89278
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:57:05.8891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFtHNvQDkHh9LbfS7lue38jPtso6K//iqpaoeqslOQS54TorVQb886JAe8WwKAD+1FQED+0BizWpJuQ2TbtveQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9994
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
Cc: Chancel Liu <chancel.liu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add compatible string "fsl,imx95-micfil" for i.MX95 platform.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../devicetree/bindings/sound/fsl,micfil.yaml     | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
index b7e605835639..f0d3d11d07d2 100644
--- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
@@ -15,10 +15,17 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mm-micfil
-      - fsl,imx8mp-micfil
-      - fsl,imx93-micfil
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx95-micfil
+          - const: fsl,imx93-micfil
+
+      - items:
+          - enum:
+              - fsl,imx8mm-micfil
+              - fsl,imx8mp-micfil
+              - fsl,imx93-micfil
 
   reg:
     maxItems: 1
-- 
2.42.0

