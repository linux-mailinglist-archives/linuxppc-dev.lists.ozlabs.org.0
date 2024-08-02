Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AAD945669
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 04:58:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZr9n6fffz3fnn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 12:58:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=894475b134=xiaolei.wang@windriver.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1120 seconds by postgrey-1.37 at boromir; Fri, 02 Aug 2024 12:36:18 AEST
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZqhf0Bp4z3cTj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 12:36:16 +1000 (AEST)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4721g43g023012;
	Thu, 1 Aug 2024 19:17:23 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40rjeyg5gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 19:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARTXd5vpS0vCBRTnqkhPeEBXltfypY9fqmNVq+n9vtiJVwSPdYOf5H+DQLugYc3HU1Xxcb/ME7VlNIzaOW45Zi5CVwVs0n6Q90158kBssBM+j705mjmJ6hzETxZl7iQao7Y18FvpmauG3tFhYfNsjBmvP1dmCz138jwp+FHSi/oJL8kiwMXlxWab+kEX8dOb5JQTcgxRnxZnYMCDP1bryi54DLeSlUssYgBpqmUn/ZWbcxpDDf4VGOs7WLq9dA6OnHJRpx3itvyjFNCry5uvIwT2ri3WToOqXQGegQ9C8eyl6kdnxuHLGA1rlsUSpCOvedkIVFg6fhS7DlCGJJGYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8/Dy4Pveo8C/JyW5tIwy1ahKmeGB2QBodsdxjIX/FI=;
 b=BWQx6R74XwDsC6QIspCkqnEdUc6OmN84++0cj17CDIyM6hCpbQrI+AgE4D8lurTVSqqEf0vuIaCeeSNx+FprIrA2WZXJA952/vnwqCJxI27elyG3N7+wcDYM1SFnSBxZxJBy6o+4lYv6xYGf0RzV0jIeJz0psPDBFzYtCbwzmZ4dS+OMlrvr+NaUiuoybbMHkefmeEh3aop1urFEHmq6+gbXgFSdVoyY+NxXNkBp/IWtvV1gIFQXWYBWe2EbyUfA2gncsY+7McD1GOOciTRITsAdxw2YAFY3Kst4DHMFgNOSOVTI+1C2C/59Zea2CEwmsITkUwSZNFx/uM7gsPH8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 02:17:17 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%6]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 02:17:17 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: christophe.leroy@csgroup.eu, robh@kernel.org
Subject: [PATCH] soc: fsl: qbman: Remove redundant warnings
Date: Fri,  2 Aug 2024 10:16:51 +0800
Message-Id: <20240802021651.3854295-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::7) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 23fa54e1-1998-466b-7398-08dcb2993b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?MMTYCh0SPdJuMQdgki+vtY3QrAvl/Go4720wbySKaUXwBVz1dAYzCs7vGd/l?=
 =?us-ascii?Q?2WmC6HAFQbK5GoXu6lyqVzWxwWby2xqsQkxhtvQIKrL04ZZDxoBJzKp9uvGE?=
 =?us-ascii?Q?67VWYv1yZ17OhJuvwv1bqDvgyeR25kdsMjAXiwiB0myEmIxtpDBuT4oq2/Pq?=
 =?us-ascii?Q?79sXuYqZXEYgJfIu3cpMfvQ5nyjjt6/Q4LDZxFU3Utm8gDe8VjsUKXTx0h2v?=
 =?us-ascii?Q?a+tVjY9woobIROrzVCm8hMGBEdDGsMDGJitfxCjMqLzIv170S/X7yGOtqO94?=
 =?us-ascii?Q?c6XuOhSqjKw2pZrUg1jBufkf8vdkJxK05FSwDf6swDkuY1B4NCof35viEoDP?=
 =?us-ascii?Q?KIzdv0fr3M+tPhFbM1tMPWbJBJZi7057IOnd5ZFseckP4otUXI24WQssl6vO?=
 =?us-ascii?Q?KZEe0DS8tjqSIXZGrQpYhg4T3JzTW/SKQJKZzpEP6Q4QBXxqqrxqmOH9UZ+T?=
 =?us-ascii?Q?n8mMe5pNjKSAw8vA3HdtYwb5gCzp6/wWd/RIVTuYRF7x94du9FDUAXmAc8WP?=
 =?us-ascii?Q?QSJpEDdokqgCVNrOSyHA8IEpMEleilh15zAFT5Q6gU8raFaXYBnh7iyysaNu?=
 =?us-ascii?Q?vibks1O7ZGwWt9bxpOlp1OcCO8OdIiqB/5gkqTXY+wE6b+VAR6/AY55Uv8s/?=
 =?us-ascii?Q?eMBev+2KTKwVm22+aDC0CRfpHEsfzqQCGiSocaeoPLTgo5ri8Ac2zb072cX6?=
 =?us-ascii?Q?UfkRlzndaC+yGtK2UNkmPpNuD/hFAewiMRGagxjbzqzCm/Ee0L2JBFMGRq0M?=
 =?us-ascii?Q?uYX3iyeV7fcd4V0P331O0yOdmYMb+duLlapGWbzi3ZSKYsuxdfwbeJXDiNvs?=
 =?us-ascii?Q?OlfVFZWOf8jiMVSAF7YaHbjhjqx27XublINMrHy9BZmxshCduS5fyfT/bafV?=
 =?us-ascii?Q?rXBZKyU7Xk6vEnfERRtVDiU5bjbJivSIHrMD4ZUkLLEIRDAFgAh4TEdNOjrJ?=
 =?us-ascii?Q?cvNdeSOYtn+HGojWxBftfBX8UQm7PbeulE9TULyWI6yCjnwVguRvUmztfnmv?=
 =?us-ascii?Q?CXuz0TSNhx8+Pn5p3PfYNPy5j6IS7UZ34+msaZ3DlDoppg88ACdg2Erp8/h1?=
 =?us-ascii?Q?aX2tIO0KDSJvkQTieag/SQogS8Li8tfdvFG00b84AUWvpOpJgtwF5fc75OjS?=
 =?us-ascii?Q?s7lUbf1naVNIi17u0WYs7mxqEWVkKVqETI/YmNMxBm62b7BBOYfTtguVsFcP?=
 =?us-ascii?Q?p0TRGNlJhpN+kiEbUSdfjmrM57sxfTExdLiIlu39H0Cpyt0sBH2AJ0FufLNY?=
 =?us-ascii?Q?zX2yCvdwri0jld7rSJAVAk1ApseZUS2Ru2jvnVxmGV5y0cSS6XrXD9eCLdQQ?=
 =?us-ascii?Q?QjtgaeuBLzO77662ysEksRYqOb8LB69GHX3z9DAAt/wFMHZl590lf1DN5Yhm?=
 =?us-ascii?Q?mjxth2lj+3Q37xQpg25sFYI6TjpebPgpgXPeWXhO3IhPqEtOIA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?w2xvbqvXISCQk9OIBrWbuQfUGGEmcGiinj8WmuqvynRVESa4Y2ahzVWrNLk5?=
 =?us-ascii?Q?Qdn9BwlMs8c6PdZzzIEBGXvnoomngBFPP2zVCHBpKHcGOXxNt1VF7yauUD0s?=
 =?us-ascii?Q?86fGrZZIcXQJKOdneZGPTbMQZHd8O8l5nXm95fNue9Q4s5DKxI+t9+hllFkr?=
 =?us-ascii?Q?vgmWDuZXANs5PQAGCF/QUKeqfGexWuZf5ALMCyvG1dh2HAwCrjuMuKhZbTko?=
 =?us-ascii?Q?/S4tOEvtLvPA22U3JCHtCGSbozclOdQyhF63FYtBJmfKgIgmzY1KFTzZ9TrO?=
 =?us-ascii?Q?o1Zy4lTd89FgPqykYWEs3rfv8cfITRblZTHv/32oHXJkHOAI9t/nJlGrfCSk?=
 =?us-ascii?Q?XAeB7fI78D8gaEoSQ2Ht1zG2cwuKIan4IsPI281B5/4/k/7IMW8jeZ2cgTQC?=
 =?us-ascii?Q?Wm6W2LbZoxdngaK1bH3eaQaqNHxupyVqCi5+XOJ9uI1llbXj4UGSq511XgMm?=
 =?us-ascii?Q?6lRr97XFPyTXvhxcn1l60REglScwKIodAehxxzRGzelcC6CKw4OfnTH73UE9?=
 =?us-ascii?Q?qM6ZDI+iNjSaoqHKpVS5Q5lP51F9jAVqQWgHi3Cg5qtt2E3xUylNE/0kHzs7?=
 =?us-ascii?Q?rdmlb9Umf1EvlUkc0ANPJMcog0EEMex0VLZ/CkD9iwHvW8pwy7+/eF10LrWI?=
 =?us-ascii?Q?kyw+BpBZzr3GRrAKkFqnXBt7yFb8bi6OBxVGUBSIwofbUgv/KqNBwd+He4tp?=
 =?us-ascii?Q?tsGXd9azTQ3NeXU4E4d9qYKgxGuEj9XvgboaIfTur3ZXlDvKLeQPj59s3MWl?=
 =?us-ascii?Q?//8xGPizflVoUD7NIbId2Z8LT7hPUb4xLs+8shvUEOEn/7T0Bxx1moJ4NJMm?=
 =?us-ascii?Q?yBq7f5+uq0OSLsJmgH9qfwvQxllKXz2cupc/8E2agzMpkzfnZnAqGuYkUIM2?=
 =?us-ascii?Q?2Dj3Xhp+G2WSeCElF7l76JWpGdZvy8f9L4rP7tJeEiTXu1ELQwfQ9kNOJtvK?=
 =?us-ascii?Q?u/h3oVNSzYHuMazLatdGMn2mZ8oZXeYHlGLdDrNg7L/Cu3/9UDYddj1nFPvI?=
 =?us-ascii?Q?++TZ49YzzrZIFmG3XsXfVKcPx58XF+bAqDPvAR8wC5Tefxz+38/zidNxQLIj?=
 =?us-ascii?Q?9vVNcdKW7fe8uZ3pFYGZMiGxuQ55mpS0AHC/fzzcCOCXtUZbb+aNaRE3+v4T?=
 =?us-ascii?Q?3t1jkRte96EO1SFy1kghJ+lP+5bk8Yve+vQm8VOytya3yRMtc8o2Ukj3K0Qi?=
 =?us-ascii?Q?SZiVV3SBM8QsRM0GQPbC226ftzkPDZwfx0o45AaMNhKxCCYDGA9zehx41Tlt?=
 =?us-ascii?Q?NAxQrL6caHX/8SO7llmLcg7XRJwc/4bl5wtkrxNhLVMMdySIlvL5G6wpbjMT?=
 =?us-ascii?Q?3CfDtUmkq++2SoVPfQYOhleU0V0/qHCMTeFLeCTtKwUr+CiCsq+msjzO/6Tx?=
 =?us-ascii?Q?oLrx35ZZur+oqHNlwsYR2167+aWRGuCJToTb+ROlHDmjrsOTH3T2fQMbOXPv?=
 =?us-ascii?Q?F8GnQMQup6E9aCJUjNkvRFeHS72N8rr2n72F9QeJlQLZdbLe/AsmDT7w9GIt?=
 =?us-ascii?Q?FxHZtXlhWnKZRk8nOE6yase0hvMBNcqivCgthBwdBjQFMk8G05/wqF002A7a?=
 =?us-ascii?Q?UNOoN9mPaPCU/CkmasOzK0UsMRR8i/yR9eVihDZOWNpZoXwNheF7x8lvDs0i?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23fa54e1-1998-466b-7398-08dcb2993b5c
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 02:17:17.7550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbJ62MDmFr5e/PZxtkiA0GLK80sUzRhujkmsGd+94L3q4fotU0bbPpeEEWcp5nTMpxlxH3Hinspcd0aaedSgsKFO/7dV0Jev7qFCG0qCn8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
X-Proofpoint-GUID: OT-vTYmvJacmOCLGyCvaLm1tZJ48xx9y
X-Proofpoint-ORIG-GUID: OT-vTYmvJacmOCLGyCvaLm1tZJ48xx9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_23,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxlogscore=886 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2408020014
X-Mailman-Approved-At: Fri, 02 Aug 2024 12:57:45 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RESERVEDMEM_OF_DECLARE usage has been removed. For
non-popwerpc platforms, such as ls1043, this warning
is redundant. ls1043 itself uses shared-dma-mem.

Fixes: 3e62273ac63a ("soc: fsl: qbman: Remove RESERVEDMEM_OF_DECLARE usage")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/soc/fsl/qbman/qman_ccsr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman_ccsr.c b/drivers/soc/fsl/qbman/qman_ccsr.c
index 392e54f14dbe..aa5348f4902f 100644
--- a/drivers/soc/fsl/qbman/qman_ccsr.c
+++ b/drivers/soc/fsl/qbman/qman_ccsr.c
@@ -791,8 +791,6 @@ static int fsl_qman_probe(struct platform_device *pdev)
 	 * FQD memory MUST be zero'd by software
 	 */
 	zero_priv_mem(fqd_a, fqd_sz);
-#else
-	WARN(1, "Unexpected architecture using non shared-dma-mem reservations");
 #endif
 	dev_dbg(dev, "Allocated FQD 0x%llx 0x%zx\n", fqd_a, fqd_sz);
 
-- 
2.25.1

