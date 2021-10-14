Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7927A42D454
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 09:58:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVMGS09LSz2xMw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 18:58:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=ZKrSxch7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f400:febc::71f;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=wanjiabing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=ZKrSxch7; dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVMFg1VxGz2yKN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 18:57:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJxLJZKdh5m1ifFljaZu1nY9x0xR44NQioUcoQpBdi3Bda+v1Y1SV363V7LQ2FYH8vHqCzkPBXUfoLDojPFlb7U1JKkNE4Ism7C5F2ItH5pTyo6QxiqhqbwMdxnAqNUf25nQvzv9noD6mD6cVNwOb/IJKV3Jxo3kWYdHvtxXZcrDWD7MWzmCryyih7hhkPc9Bf0HmkgXFpu6l/z1pfaSzdDHYckG7vwlV3Nci5g/sRirtd3D9eWZrg27ENkfQnS+0e7u1vP9WRClNYbje1el9PB4ZRqDAUWZBLAZZeTNNWeq5plpfdIcyrGmmTZ77hH+0oSNyHtQAUh1bWp8rUus+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ph1dcIG2Ik6w8s/djamDtkhK1ekkEJaP+KXPC3z1/Y=;
 b=m7VG3O2K2gdZ4I2RrOK5Gn0uhTfNzuiT34s2spYdckbMXtc+0alDD6iNeqOAi1lqBFbDTrG/nFkELlzRSto6cuWS/YM3O9/4rATWazHr6eByUdHz4a+MwokeTR4+zfz4da0SRBTpoho9+QlDlCBx1Ko8p80Mfl6o6gKQh0CMWTMzXQQp/Z6e8TecpF08arYXsy9HqNj2e3InBMz6p7atRNk99xmtQ39Zg4EVq/VSTFiGjcu4QFazxBEhlaGKPkJwQVAIi9NmRvummJ7lSFkP0UHkb0eAFzS63chtRbQyyHbn4LX8XuPfZjbxRnZV7o5I2S8VMwl90fGjmInFUNrTSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ph1dcIG2Ik6w8s/djamDtkhK1ekkEJaP+KXPC3z1/Y=;
 b=ZKrSxch7IUxSCgCq6ubvgCqnuaU2hhyyJpWIJDnLn4V+giKVM2RIKGzt3ivAmCgVLv+A9d5gWJFIFJRmxfHuWCyq7haRPRL/Rqrzvx5fefO8PFck7mrSMfalsxXqSCHQVBXq4+Q27D0mO9ZvGj4TOgrMhG1wRibY7m00w+qyok8=
Authentication-Results: ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15; Thu, 14 Oct 2021 07:57:09 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 07:57:09 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Wan Jiabing <wanjiabing@vivo.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/pseries/iommu: Add of_node_put() before break
Date: Thu, 14 Oct 2021 03:56:04 -0400
Message-Id: <20211014075624.16344-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0060.apcprd03.prod.outlook.com
 (2603:1096:202:17::30) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (218.213.202.190) by
 HK2PR03CA0060.apcprd03.prod.outlook.com (2603:1096:202:17::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Thu, 14 Oct 2021 07:57:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72188c63-d293-44bf-5fbb-08d98ee838e5
X-MS-TrafficTypeDiagnostic: SG2PR06MB3365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SG2PR06MB3365C8BE44C03A056C03E3A2ABB89@SG2PR06MB3365.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8n83XWPi3N2hsRvMQIwSdFfJVMmpsC8PcW+NKbcPYWGCa9HYx/G7KXXpipS5S7HVLDszRmqPUBCiFqlcdYebXGM7WpXFS91VtAES99SLMy8togrj7austYN5vfHIBakRWsOJkJOZTOZLeWsDaBSsyEoVcbYqNPyC1ey0cSBFIj/qjF7ODK1IePRp/3GCK0/hQqxy2une3w+fxROedrKrR+olyziaiyXPzVovQgY74tsx1ph+Xh6/SxWZ6tC4+yPLZCVgR7E/gmsH7cQWopOvVhp+1R1SMdCGJJY+p3URMSZpsOYpkx1TUuAOmGPAVjNR0c5tVVbxtfhxgEhIZIyDUaXKVi0Ee6zi0RelUNNSe5lgM9pGsfUToIh7ZmXRejDORckl+dY21pkBvNtaceSlE7RBFHtvHZczegtMH3DiSmgjhPVfvk/Mj7JrhnaWVuzCzGS08GPikLKTzs2c0VtQ2xaB91XLN+Xos3M/1QIyHyceEc3HNRVnzitL3oeWUWkGaueZqedodbLN2wdRGjmUBmHRjzoav/VRxCJOm1K9qhLiE7TeE1MYH444bTEwBCLS84tksYPhgUp5w0K9w3fIRvAaXx7k0hQ1EmtJNAuT2qJ9kSzOVmNCLGNyLJPgPaz2hV0j8YE1PIeqhVQbuh020P1YgaLXF+ZMIu1yTN6Jycc3mkwoC7Lkv4v0IurEwYzSB5ABWt6ds3V9Bf3dZ3QZy+pqxeuyf+FTye5eyW2qVrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(66556008)(8936002)(66476007)(66946007)(186003)(8676002)(2906002)(4326008)(6512007)(316002)(110136005)(5660300002)(508600001)(7416002)(36756003)(86362001)(921005)(38350700002)(38100700002)(1076003)(52116002)(2616005)(956004)(6506007)(26005)(6666004)(4744005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hEa0D3FqpeI2kCjKTvU+KVbYcaWZyu848MUuSGihzX7U+eGQVeFtZ0alrFI5?=
 =?us-ascii?Q?yxAQ1MIIHilUe+UMQxCiQp8dijzL0bGOXODPkxo3kvUWhvfEc3Cb6mPZ6V4y?=
 =?us-ascii?Q?RsVuclbybBgQdz7xW5Orbyy2I3XKegIrfpdc1j+iOB07YLkuDacA8ZYwUmgN?=
 =?us-ascii?Q?/A6/WBSz7mSqmsL43pLLm18F1d6rW8GotJ7fzZNXJWG8fBb0p4Y3GnEFWw/p?=
 =?us-ascii?Q?+26ZUE47SJyAryPoTz55mCydVaWRWla5RarlrrviEq0jIw1mBNAPxP202P+9?=
 =?us-ascii?Q?2xAEi+XjSxNPu2J14jOyjeV4NkPBuJx5+IbC9c04fqFsooASe2rDaxdkHVZj?=
 =?us-ascii?Q?5KI0PrVdggJzfOTGTLKvXuAQVOson7f8V8/cX+fqJTMKG5PsBg2lzoH7jmQc?=
 =?us-ascii?Q?TecIAPMGWlgLPGp7g68k9ycxKfbS1itXOTzFFLL7PqZOYOxCmt5ESzt4QA0O?=
 =?us-ascii?Q?/u9k1eN3Y/0+k9cVEFsByZU45+dIlBVyNDbNn/6S7JgRIm/V6WcgtqPFVUY6?=
 =?us-ascii?Q?5cDXvkyVZeyX5AkKZZY7JbjQSa0UZmhxTASeb6zCuchrpnCjUxWAyaMxbt/o?=
 =?us-ascii?Q?RmR02+3G10NGrUYVkML0bfrTUVymRjq+KrPqBg9s8iANC2ZRdmIw3AmFAMRx?=
 =?us-ascii?Q?0a5px9sTffg4lmSB8pBPaavXLvaj186Mg4vdRHbyKlULtAlKF/l/Cm5KTDkN?=
 =?us-ascii?Q?SLK5r+bwncfRfLeuqXiWWq+L5TQqt8DvqCkDKKz6ONvqcQhHEoXRC1/Z3cTn?=
 =?us-ascii?Q?SDAFXm66tCWNiGdisyvEoQrQfzuLVhgKvnZpaAUbtqyR2QtaBGPXk0mLsnnT?=
 =?us-ascii?Q?Bk4/lFSdjNierh33PmKiGjJ9Di4tsLCUcyFAT1Mgdilb4a3noVbucnG3lF8N?=
 =?us-ascii?Q?eosBb5E7qDw6yuVWmg5XKZSqtOaDDTtG8Sy9SjIAI4jq0svw3yDXNzF0KT5r?=
 =?us-ascii?Q?VqDu+LGRtg2sjLzAj6BzyJx5zkimy2rgZYDtGdvaHvtT+L8roPkNDu192L1G?=
 =?us-ascii?Q?fU5IOGC1lvn1DIOGJcdmGrMlhIPoj0tujQBK6rTuh84gPJYtEMTDhdwCVZna?=
 =?us-ascii?Q?rqqaaaww7TRwy3tk5JRUtP/P1eUUwqsRTXsq2R1xTb4bnqR2SHClO71YXQ4/?=
 =?us-ascii?Q?sP1b/+kNHdHd25VQCje3T89q1LbVgyrTryS4pzV2jxEnxOvB1VW5xn91+VBX?=
 =?us-ascii?Q?cqKf3eHGz+hhOQ0rRzRkoL9eaO6L5AGYqLvQzMeJ5i2CMOIfh4ucw3ve95JC?=
 =?us-ascii?Q?h79/u9AI3gXIT8hdVL5HbdoGWvUHKar9+GRX7TyITKMQke/3W5iFhWmgSvvq?=
 =?us-ascii?Q?gw84zWoUi4Lhh9hwebPSGY5i?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72188c63-d293-44bf-5fbb-08d98ee838e5
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 07:57:09.0677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QU/EylE0enkYd5zSS2q0k5hEzTbhEM2OZVFdjczXEiPrQdVNW4WZU1XPaoZG6Llak0AUupBVKP/lNb2BpCB38g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3365
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

./arch/powerpc/platforms/pseries/iommu.c:924:1-28: WARNING: Function
for_each_node_with_property should have of_node_put() before break

Early exits from for_each_node_with_property should decrement the
node reference counter.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 269f61d519c2..c140aa683f66 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -929,8 +929,10 @@ static void find_existing_ddw_windows_named(const char *name)
 		}
 
 		window = ddw_list_new_entry(pdn, dma64);
-		if (!window)
+		if (!window) {
+			of_node_put(pdn);
 			break;
+		}
 
 		spin_lock(&dma_win_list_lock);
 		list_add(&window->list, &dma_win_list);
-- 
2.20.1

