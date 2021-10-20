Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF87443483D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 11:47:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZ5Q546QFz30RH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 20:47:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=A/wQ6h5z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=40.107.130.132;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=wanjiabing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=A/wQ6h5z; dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300132.outbound.protection.outlook.com [40.107.130.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZ5PD6c6Wz2yLv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:47:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYLYptUtaketm/58abn+E6HMDK5s3PvFuZ8wN2HNDqWagHj+pBYA0UpODYePuhC9sNLQ9sfw7JUx7F5ULZcNinJwUD4KnI/w9PlfwsKfk/x+nwLQjDZF1UrSydxjwFEjGXQhDe47gp2/vx1f75MoeBPq3IlcWFgTVM0K7jl9LxHqanjEu8v/Y18z++e2s56+H4Qh3FxAA/4LNJeQWrLHcFvPcSFyrQpy3YIMUS70fGABJgjA76dscb0Wt3BPGizRpmIZobVXEo91YOPZNMKv/CsxSYuO1PnzSLNkPdj+gu6Hh6D/nyuKzN90yoKk4FXDcJxExjRmIby0qjLFsSBDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yp7+v1Z5fpq+28LU14WutBeNjTzq9AsbOmyoS6FDwVg=;
 b=TKY7xwMDR77Fs7oVnGLwjamugfTKV27uJh3cvtIDwZN9qHMVuTgoS2CQe7btcqa5GQ5eQB4xsrhe3cL7CajyZKTYA4/yYInEuy8WO71o9lJlk0OStftlwA6tu2dGdxSooWC87nZTQmhS44wg/2VNd4Nn1RdxFXxSKVFXi8oepWnixlqoNoXZj6owXtJbem6z/J2NMpE3Fn0Sx1gAEjZdvjESXATwhn2CxewEAi1KIEYOiUho1FNcurrSxDpUGpXsEy4qBSmXdYZWzchc3kClTilmWsUydwUhwOhvcDdLM38cE832DyZ4vJO0HccUx/g6++R0doXPEKtn7rEV6YJtig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yp7+v1Z5fpq+28LU14WutBeNjTzq9AsbOmyoS6FDwVg=;
 b=A/wQ6h5z8g2d/vdfIsyZd64rR1Hy30Ofuc14qUGOtiPg7/iBeALlUPBKejPJqhpNo91JTDjAOs2c8lH3DA50wZmkStkua5GMhluAuHXniFYlinyMDnUAq5uD/6W53PoWUDMVPSsVP18I8SeCTqytLVGGp+5paOm5D9u8A2x9BRs=
Authentication-Results: ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB2858.apcprd06.prod.outlook.com (2603:1096:4:1b::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Wed, 20 Oct 2021 09:46:42 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 09:46:42 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] PCI/hotplug: Remove unneeded of_node_put() in pnv_php
Date: Wed, 20 Oct 2021 05:46:04 -0400
Message-Id: <20211020094604.2106-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:202:16::13) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (203.90.234.87) by
 HK2PR02CA0129.apcprd02.prod.outlook.com (2603:1096:202:16::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Wed, 20 Oct 2021 09:46:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7be830c-042f-4b98-45c2-08d993ae8570
X-MS-TrafficTypeDiagnostic: SG2PR06MB2858:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SG2PR06MB2858897E79643157A0C00C1AABBE9@SG2PR06MB2858.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UVgfnhQ3SwNIXgQAjAqEMR+KaJ7jc9EEfbLOaREhYju9NwcEmpXo8rqjefdt8qS17H0VnMSJlqZDssZP5n8X++NBI6VUWy7lQVo83PGR7X/DpdYQkVp/PKgQonejdUBVFEhZDRXB0aj2MA+5HLOcZXCbGAOBDCzI7HWUqQ0ZVErMy8hlHfEWnQe/sVb2V7tcSl2q/eGBpuX6dPh6iMUCp0kbGsrSXE5KjhTNSrhHH6UjfLvf2xhbDOEdKds3EWv4jOpvP1YfTlZybD7YWVzASXwa1SaeVPE6D8ElXTMoyEWeOJWEJ+Z4wIfzJna7tKTMttt/y01RH/LoZjnGm9PPQgmUYMcL0fHCPo/pCz0vj6g0Tvypg40sJ8aoYyJXNUJ4bEznbW5qQ9vF62Y7npFusuBx40vCGo82JZI8FIkF8WwJ4Bn5msmJgtiUWEb4/78isYC8Ve3WrhCRuv7GNoMg1gCvrGkJUg6qKAUNtk6QnLgGC+ecvm3OBZDyvSb9Nh0+JNNRJXe8bqQ1Tn+3B5UrOtAn6gKS1gdzzbe7oG1NeHuNQe5iqG06WuSjKYNtAmYVizeyLshFYQuYD2XPPpgRE+my3CujnyLDQXxMwBDgMkbUT//uisK0PhONcjbstV4FUwJBfEvEZl7ehGz8J74cb7c9V2hYJJ6n0c+OS3aQvnpxfctbo8aWbbJYfnEoIWBcq5TlcaAD1kvrXzFbSoZDqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(66556008)(66476007)(36756003)(4326008)(26005)(8936002)(1076003)(107886003)(2616005)(508600001)(86362001)(956004)(6512007)(6506007)(83380400001)(52116002)(66946007)(6486002)(316002)(5660300002)(4744005)(6666004)(110136005)(2906002)(186003)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mGiPirVU+UFwHvLM4sKbk0KR1zxvLAHWCKR5LsahkpdVnusmJTiyV6lFu0y9?=
 =?us-ascii?Q?ZgF+aS45xNdqtMutFahyFgxVEQTdr4y9Z2o8ub4Zdr9SoPiJLTFmw5WgYtfH?=
 =?us-ascii?Q?ltDeV76c8m8dL2elWgVRKGnXAY39NUskTKzD9YI7YH3x/5NlBeIzu06heyAJ?=
 =?us-ascii?Q?MlLr46xjb25KGqM2F/kHi2Qd9jSFkMz9odpg6qljA4/iUcingkQKiT4yjTx6?=
 =?us-ascii?Q?uRY5RS4bV9KtMjsCUfEss/6l9jwv0uLNkDaoWB8gyIuGb1A5an7xdWhkQLrw?=
 =?us-ascii?Q?/hT2c2eJVWKQbN2b+4sEnWRaK6+JH/uP7EvzHnb5pgccZbh9rPClCrftQGNf?=
 =?us-ascii?Q?pmaH3SDFbrt1zTSGuLa2mGGpcGm5jQBRTHRyWvrzYi0x4DFFZhTrdIXv1D50?=
 =?us-ascii?Q?VQl4OCGTgUcqEBo5vVhvTqe8rxJW3oxumSZFoqfw/I6ecMqzTjRPYxEvu8EN?=
 =?us-ascii?Q?//GkkQ6RzCteqbhtZwEFHUGmyXhMC2XbkxG7eMOkwLzu/PIQxN7zTE6AZls2?=
 =?us-ascii?Q?o54LDn0MJqIsGv3wFFJhEbR0CGAN97FLHHLv/kUH/J7jhv3WnJt+ElYoIKEi?=
 =?us-ascii?Q?nsEesnxYQdcl/OZcDbWymZjzPi/9symTA8z5CBebMffsjBkccy5F8xn5SaH8?=
 =?us-ascii?Q?aC+kj3jDUdiymR44EibT9P+o3iPP6KBnWKkuYPIrIytnABqdOw1yzrb331Y5?=
 =?us-ascii?Q?yvpM3AkbXIxLYm9yxnUQU0ChyhVvInd+QBbbe3R3fB3Qz0QwM/txZNeOpBge?=
 =?us-ascii?Q?FFx2uUqD8p+54T8/V17OhEEPULMRQCvUAL5WgZcvK2jW7ftqwXk0+N50Vu4C?=
 =?us-ascii?Q?oLT3YS+j0YZuwBIlELPQm83KDReQZVoCtEWhJDW1V7m4dJ+tjPZEDrZzOTS4?=
 =?us-ascii?Q?R0XcSwATlp2aK0IiEnB7W5hd3HSRfE/X9Y5uzM7TVSM4sKBF2g9/VLxRmJ+T?=
 =?us-ascii?Q?dt2rTIm8tzxZiPMff1C7rTVHZcnO/xIwDFSucvQmaCNY0gWp2TKAqUgeD849?=
 =?us-ascii?Q?VedK9sI2bD+BF1Qvtf/lSJgtlyeUyNn2aaRTIKFlo4/mBM1IQ6YGHQTT9Q5q?=
 =?us-ascii?Q?aly3kVtn6IKeicPWi83OaSj6cGyz5qH+DG3kLt8NlTFUZAxyEOqYI98MMTFJ?=
 =?us-ascii?Q?iuGMSx8QivHwI8FUkO+TyeoufwH7k0nKLLBo4N4COzZSR4GgSXQ0C6cMG/o4?=
 =?us-ascii?Q?LfIC0FqaSKOOuIqkd2wy6c0+wRRPsghzZwl3V/NH4mBxIdAHTEPIqHdCeVPJ?=
 =?us-ascii?Q?/dhqKDVgHf0DV4yx88UcQp3041lwDaoMdxbhvBdvuLN38bulBw0rDdPH1S93?=
 =?us-ascii?Q?QYmGO/E617c+JNCV/EDgisWW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7be830c-042f-4b98-45c2-08d993ae8570
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 09:46:42.5124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11126903@vivo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2858
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
Cc: kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix following coccicheck warning:
./drivers/pci/hotplug/pnv_php.c:161:2-13: ERROR: probable double put.

Device node iterators put the previous value of the index variable, so
an explicit put causes a double put.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/pci/hotplug/pnv_php.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index f4c2e6e01be0..f3da4f95d73f 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -158,7 +158,6 @@ static void pnv_php_detach_device_nodes(struct device_node *parent)
 	for_each_child_of_node(parent, dn) {
 		pnv_php_detach_device_nodes(dn);
 
-		of_node_put(dn);
 		of_detach_node(dn);
 	}
 }
-- 
2.20.1

