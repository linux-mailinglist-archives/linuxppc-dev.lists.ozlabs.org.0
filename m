Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE5430DB7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 03:55:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXg2J50ljz3086
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 12:55:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=L2Qek9K8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=40.107.130.121;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=wanjiabing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=L2Qek9K8; dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300121.outbound.protection.outlook.com [40.107.130.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXg1T28Ykz2xvc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 12:55:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLjPZ8I8Z4nrKbNonswa92lct3iHFoM/sblj3FwsVjv6J84ttr4ywGDN/NenClm3AWbGwDm3JuZjH1BmhBm9qtyu6xv6dd/r5FP9Sy01pbfvnuedHzU7OUVkPsCRk5M+CXXYh8ufA+S827GONRnXCVQ424AMjGm26M0uaxbEl5srS5mQdnFkcbuzIrpX3JfxQh9yEgFb4Pz1XF20Iu9VHkpUozXXXhrtpy+RNBZGTLoGJuCv94IV1q7Ex5s0KH73cgFaIEWgVm7CMbrnws65mNCdIBdTj6WwoEK+RWQt8cBsaTAsVbkvhHob2IDdfY/6lsj88vrO8B/M+lATwStBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiPAQx7Yalo3+yW+TtllXznNci2N4E3p3top9m/iFrQ=;
 b=lrumNDD6dpJN3DYWAPT4URmlyskhGHtqH+hVR2GWseGPzMMvipgh/WoIytntGBA5ueV2iEahfDRhpc9sjC7iLO4G7z5k4PkQRnRhBplNwvEhIj/Lz0cWjNFTkY5KrXrl9pgIBrPISWX++ThSqby+bXe2l2OAtDTWduRCqnsfKHZfKW0FfvytRM3JUS2PjZjhkZZDgZq87K9Ncm7dFe/H0rssMl5jsuNlefCjzF9UwDmwZ4HVzq4u6+MqmTQGH5snADLO4CracftP5PRq5Zd3QVXqDN/x/Prhhxv2HBlVH4VfHSeg5AblZmU08T/8YcQlIy6nHNIHn8Pd8kySTyu4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiPAQx7Yalo3+yW+TtllXznNci2N4E3p3top9m/iFrQ=;
 b=L2Qek9K8fs9cS7kPBVxpOyzddoPEuV0b6Tw/+9FiHFRKt4zHCZlnaPQQWY4nytoHriLVhdfcTK2dbU3xxcR5Arhl+ehRvx5vAAOtBRpeUZ6/lNvjHD041vqC5nyA7JX5p5LAUn2aHSvhcQ5b1Q8qZ/ew59ilDYxkpr+pBiHDxCw=
Authentication-Results: ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB3079.apcprd06.prod.outlook.com (2603:1096:4:75::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Mon, 18 Oct 2021 01:54:37 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 01:54:36 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Wan Jiabing <wanjiabing@vivo.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/kexec_file: Add of_node_put() before goto
Date: Sun, 17 Oct 2021 21:54:16 -0400
Message-Id: <20211018015418.10182-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0168.apcprd02.prod.outlook.com
 (2603:1096:201:1f::28) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (203.90.234.87) by
 HK2PR02CA0168.apcprd02.prod.outlook.com (2603:1096:201:1f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 01:54:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f344563-17a9-4a59-4259-08d991da3d25
X-MS-TrafficTypeDiagnostic: SG2PR06MB3079:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SG2PR06MB3079E015DD52ADC2EFAEE29DABBC9@SG2PR06MB3079.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WwjLaSMtJTCmgQMUKI9oaFezfKYYP9wJIU5lH9MikreMvUjedyfRoyEZM+IoOOLb1dd70DgPh1zxJeFVIa2Y6PPBB5vE/r8TPMWETNHQaAamUFE5xoaizo7jqPY/Lr1nR30rRn77CT8oaGyh1FH07nX0UkClsJfs0VUY70B+OGHmrDdkbF6dqMMJYnicvjUZ37ocdDv5VHA37P0kQqx03dC5K9veZjUCq3iMu/ILR4l1JVtfxfz8pHtAHywddK4hlpofOnbkj2falIqhJN8jyNiIw2XSbCn9WbmFhAHP2wNZEC7nuqsLskbAQolJzrjCmy+/6B0t4pZ6N3sJQgiNyDnZuIXXRmvFDeD79uVf8I+9Pe8CSXGOWoU19Mt8x8mXyQQbpHAb68aWFtD0n/9316+XIpibYpx2sqzJqp8xsUYVDpXG8KaDMa6NNkOGyeVZ25frjzmAkvrm15CQ0Zu+mei5vA8uLn0n3Q9wIM5JmQGjx/faSuBoilyVpi8vMQCN1HvMAxo4mvivu3fVxOVEj5tWkIYY838Nz7qg8Q847BqcD8Z4Mfc/gRqjZ5bYFysiAmg2Y88WgP5ZGgifkRPzdklXAApbAKO5jvoD/seDlBmeJnR6U8Xu4y0mU2hcIF3MevlNcOksgdtUtR71TFDPukoHyz7K9+292gc+/214VZZTFIEprA/uCI+Nw0a6cb26exIrP8QIIP2CVY3SAH8HDAhCHKbS9ROk4WrJjLPh5NU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(8936002)(38350700002)(36756003)(66556008)(5660300002)(83380400001)(7416002)(66946007)(38100700002)(2616005)(52116002)(110136005)(316002)(6506007)(508600001)(6512007)(921005)(26005)(2906002)(4326008)(186003)(1076003)(4744005)(6486002)(6666004)(956004)(8676002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vBQQ/EpQLSzT+OqZs/Q5C5mY6AOMTBGe9lWm9be2233IxgIUx4s/yKemMAyz?=
 =?us-ascii?Q?jTO0FEcow/o76y6v2brXDcKtpUNdsBgxJo8sK9Pm2//75yh/T9Cr5vGHO4GH?=
 =?us-ascii?Q?XkbG09a5Jt/IwDKDbV1cXZunpO7+9w1I7zbbEYjTUZ2Gk5zZ6fXyp/yNTf0C?=
 =?us-ascii?Q?ThNNRGxPUAj3audyoRg3tcsR66Rx+YGYne8DucscH0jSB+sSJi1UkZetrKNv?=
 =?us-ascii?Q?y3/zcd/jyitYGxeT/pq4E52X7NtTyhPWcoJ5Mdy5C2chP+qDlgrWpp8OtlXS?=
 =?us-ascii?Q?+y3nyJNSe4LBxKLim7FzQ4vvMROp0M1sHrrtzw27I61+Kd82vIWc4CvNMrHD?=
 =?us-ascii?Q?7T2i6hyKFCowaUb5D1o6vWQz6MfotHpV1Tq9OyAs5RiIMml7qKxlNxRiryMl?=
 =?us-ascii?Q?NWPGkDzzlXBpPbVHrhzF7vH2EMNY95Wt2/TUHW3yMD4vnXv0mKYMRjEa9MXd?=
 =?us-ascii?Q?+1el+vvnMx6KtQnObHhsy6YjoN8W+9/kUF3M6fuNI182IbG/FWsn4L5fUXpL?=
 =?us-ascii?Q?x3h6IPLcDZZiQqO28DXk5WoVtAa216ZP6aiNsTEFbvAHxle0d6tc6WVUeGs4?=
 =?us-ascii?Q?FjqVSY9ciuhMiOY+rTc0idPv3KR/tjkhSw1ufzM680aSI5DNboFiu3xRU3Yc?=
 =?us-ascii?Q?Ioj5/D91rgrzcP8KhTYRu9m4ZeazqymqvTgIaQKGLmiyQ60d4pyZjdyqWy6n?=
 =?us-ascii?Q?wzFgMic6DntQUhZfRW1l5BVDPV4VULTukGSGhNOzDuuOdkeWRKEVk0xjOxLf?=
 =?us-ascii?Q?udlMitnSz15xZFPfMdZ8kKTKEKZSrVsUyTdXyZtrXFcsPdJ858up2Wzh2+CH?=
 =?us-ascii?Q?pbOtbc3YcDXLxuZHsyGPyirXIDLfMy/MqXAXOryiOtlmLdDinQyRh7ojqm9y?=
 =?us-ascii?Q?WPSO6TWEdAuWLM45b0rkW5sGdBIzZOymQbdrV1nYUIhC9a8mIW2KQWhF6woO?=
 =?us-ascii?Q?B3+99PSjdH1H57/2Ok9P/3buYcCbGTb9s3J2TsUaWzK5NXrBo8SgbWHtBK9w?=
 =?us-ascii?Q?CqVTHoRIwW/1pdoe0BD1mAjntrt1cKUT2qrw8yu7h/OCKLRMxXmPpNF/h/ku?=
 =?us-ascii?Q?ffkXn/mW0o/7q5PlOnWuuir/AV5vHIem6MNRser4baVE0OxY6aKsGxun/M+q?=
 =?us-ascii?Q?jC9Pv+Vy0484hlLu+HhmB+ayh1BeyhjYQb3xWjn42+D072U4O+KunNK4AUb8?=
 =?us-ascii?Q?plqe0aZ3iVJdpiXeZWnkPMrh5ihkRAbOH+yJyX49Fn1qIE61q4eJ14JsihKA?=
 =?us-ascii?Q?t3iI8fHeYths+kSvABBt8OI6Hp2XhmD/MADWUodOBB1CxP+eBE0YnfUN4FWj?=
 =?us-ascii?Q?CIYj9L1w47EQxLUVYfYy0/jf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f344563-17a9-4a59-4259-08d991da3d25
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 01:54:36.6684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3tSK59OIIqTELYev5HwcOwUS81KBPJQhovCMZmfSbiXXDV6Uom6g20ksOIoEAN2gZZDQuCHiNZoqLLyF0eS2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3079
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix following coccicheck warning:
./arch/powerpc/kexec/file_load_64.c:698:1-22: WARNING: Function
for_each_node_by_type should have of_node_put() before goto

Early exits from for_each_node_by_type should decrement the
node reference counter.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 arch/powerpc/kexec/file_load_64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 5056e175ca2c..b4981b651d9a 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -700,6 +700,7 @@ static int update_usable_mem_fdt(void *fdt, struct crash_mem *usable_mem)
 		if (ret) {
 			pr_err("Failed to set linux,usable-memory property for %s node",
 			       dn->full_name);
+			of_node_put(dn);
 			goto out;
 		}
 	}
-- 
2.20.1

