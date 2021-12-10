Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B15046FC7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 09:13:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9NvP6g37z3cDr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 19:13:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=kMcKp3vk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=40.107.255.107;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=wangqing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=kMcKp3vk; dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2107.outbound.protection.outlook.com [40.107.255.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9Ntg5ynpz305J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 19:12:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeIJPcxusXu8jXp0NP+9R11fhf7vzZiVwPGuLwp7j73rMmlxiwKICvEBzU+424pjOYf2pzxgGSMBvGjqGOCIiKtzEnMv1Go+QHsufiWmynL+zKHlWnqiIzNtvW0E8supoZ+q18+9cv7d7M2z50eUAu9KTNI+5egwpgJ4uvlxIxFI9HnasbzSsbcZWT1QfGN36gXXvaaBpBFMjDJCXDyPsUYyC+RW6wyegDzeBY4Ba7BJLzD7TpS+2kCxdahfbpbRMOBy99BmsvbW8jv5XSm9CjJRHG8V5jWc8SWKXvWuOAoUDx5FRZDvJG8MfqmAW3iYo1n0ODuil1wQkv1KyVvM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRfj/08Z/+sHVMJs6y3DCcs/iNehE7cY6dekcJu6KRA=;
 b=TWpT1l4jehYWCD8FA6VXzuDllt9AMTXep8mTiduqMY9TK1/827mMlcCPzaJXVEN1XPIVDZKuNdL1wt7mGSDO1EKjBNxfrIsWO8LUTyFp5kEM9LOnI/Emsk/CzXOD2i3yclxXgrRiNf1p/WVpMaHTKIf5NTxylsq+nYvaZ61skVamFGRLQB/XP1YXcdIGrBt47Ug+yF9yT+jHCLLayXEoP2TV3+8VDjhvL6K5DCot/4qW56EwaH1LhzSIDl6GbBdsZgXDKxwN99Eeu9xLw743qzupvIWUjrOCakeQoRq/pBwWV+L6mnTBQzzMWLoPl3Ugp+Xl/iioOrAGX5reTr0lmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRfj/08Z/+sHVMJs6y3DCcs/iNehE7cY6dekcJu6KRA=;
 b=kMcKp3vkmk/+Mv+hVEpW6WyZNFUBmB9TvAZvozUgEXwuxHf75uWwj2ghk0duPzOuMTFvoUbO35A6UhQHYQoY3YvA07jwst7mQcbrWoyg2R+p9KqKEFfNgfkR5BiXkoOUC0duKmEgPPgQzowkbxiWicmZxuaBuTYWLQug3vd0fkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3033.apcprd06.prod.outlook.com (2603:1096:100:36::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Fri, 10 Dec
 2021 08:12:12 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396%4]) with mapi id 15.20.4778.014; Fri, 10 Dec 2021
 08:12:12 +0000
From: Qing Wang <wangqing@vivo.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powermac: low_i2c: Add missing of_node_put for loop iteration
Date: Fri, 10 Dec 2021 00:11:51 -0800
Message-Id: <1639123911-31736-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::12) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55017e37-ad22-4937-e3a0-08d9bbb4c501
X-MS-TrafficTypeDiagnostic: SL2PR06MB3033:EE_
X-Microsoft-Antispam-PRVS: <SL2PR06MB3033C08C3075A4A80D1283C7BD719@SL2PR06MB3033.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HhoCedNLanEqL89s9Ihu3Siyvg1da6y563dz6Z7KQuVBPi2rX+bvV1EK9BzxXYwGKw0WQfm+Sqj30X5ksPq3QZs5uFeEX+2FpxlFOCZU03Xbv6CCPe1rS35+vq8xFVQuZbeSrL+7vnOJDiJiqGIeoN+I6k25mEd1sCR4UzGyaY743HqKXRTqb5c+r7dBIXebQkBTnLvaK0GC+U5/7SZ/Ld7BebvwQN/pTqAc97ROSufTx/koN2k2rm+r0d56GTIu3rq2Ixk5kQ5p1ipqJTga4PWgrFJZmzOJWYdvSk7yeqXa/YZ10W08p4S1yZU8vO65hxXdYoNSuioqqNOhyrfQslvxtN/3OdmnWy/OjFI7eZkAdJNP4YYdjvFdk9PNOqttumkXNadPLe9KoA0Ye1vCChrexVElT8A9dQoYey1C2OZn8xz/xOr6vX9MrR40LnWTLceXREfUJQiWKKUGP7V2aQJQHpvYs9vwY22g4o/fbMlfZkLBXcs9sW6/X4mlUAZ47BVDnzSn1sWTDFMxSe3tMvVQI3NH/23T+ti+N+fQkhKZTyNdcf5rP0u7wH/sdltRLaGtFTpmqJUb1sGMBw04lw9M06EZndiXuQxR9JeAFfpcjw//vxhxLX+xjq8xfhh0/G1iEhfDCHVZibm8rREWs6TJ676nTqNm58GgFttEUAyxuf/88eE+dxJa6OAZChJx6q9vkKK8wBllUsPYTekJlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(186003)(66946007)(66556008)(66476007)(508600001)(4326008)(2906002)(5660300002)(36756003)(110136005)(52116002)(6666004)(83380400001)(6512007)(6486002)(6506007)(38100700002)(38350700002)(4744005)(107886003)(2616005)(8676002)(316002)(26005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6dFExIfx8JtFl6uawMHJO4dHm4Utjz8E11yc9lAbCKb5iFR1VlCzk2ojmEk3?=
 =?us-ascii?Q?kPW10D2T4pXEUqBSxLcaugbFJ83cKm8aVTUNsGlwiovyAHAaS+kTKP2W37PG?=
 =?us-ascii?Q?CJQi/rKM49cJq+ylqT85rrdEoeQfTyTMy8ytijdjInblBH+OlYPc1mLwtpdo?=
 =?us-ascii?Q?bmHpj6nos73G1TylZ9WLZTzwnqqWn94/ImYyK6wsr3WRcIadfR2aZI8QswOh?=
 =?us-ascii?Q?iNuroi3JUqxC5H3/aq0Fyh6tLx6u6zG+6EUurnhovIztkkD+gGIYYKUkXIRg?=
 =?us-ascii?Q?hGTox2HhXv6bQhHaw7u6euFOeFbFv1Vy/6Yi9wq54yW0fBZs87tblxZWWobr?=
 =?us-ascii?Q?A3oV3a2QXW4lsz/vqben0ApKCJ7MoSHkXhy88oPPzhl2zTx3DRw708T2REJm?=
 =?us-ascii?Q?va0rEOj5in3To2aFhE90EiLucv1eS9Sygl6x8YQHuOXPyNfXIZnMdWxokge7?=
 =?us-ascii?Q?gA9n2OFzzSGexGPjlLK1zKXFtx+3Zmh8XD69YVR5FrGzVx2Kb+2OqK628J1H?=
 =?us-ascii?Q?koO+sret7j19gpK98p/fiAWnitvd7tnIm/xUnNRbt8pu5ZBLAQ3uaQiIjdqF?=
 =?us-ascii?Q?CHQL/hziohX6ERsSSlmg79JPCtAQnyHHifcNjafys+oL5Ui2oYeGVWPuJZMs?=
 =?us-ascii?Q?JStch/oP/Z9ZuseNlMGTdSLAfoxnE7XUYKWMrSEVgJkBgkX51TiU2YQpsSaJ?=
 =?us-ascii?Q?KJlSk78hSwfPWLC+z/FoAdxVhwRX7ZK6IbrWX5k+sPJ3frigVGokcr1LDkkv?=
 =?us-ascii?Q?rfTp5Knt5CER4vRVWu0ow1pA0FuBuYq3PZSAS+8nxjdw1uOChTsd6cWfumOn?=
 =?us-ascii?Q?LR/sZ3XxxorL7I5bSwbVvwOMs5Rhjzouk+yjIm/vTv60d6BcjhMB9blDhSIc?=
 =?us-ascii?Q?DNBEON8VsqAUSq2ziPBaqHZSc3exXKMQHAq1nK7AB+NjGDblVwQ29EvtIL68?=
 =?us-ascii?Q?WM445tXNPZuFCzABff9Uz+aBL+0Eex58k2VLW+FVwUyz6nMVQRd6ZU3kuSMy?=
 =?us-ascii?Q?XszSzQXUs7C2dkYRfANqEGOiqFRWUWR44d4dAD+NCHZAbnAayr+Rg+rjp8pn?=
 =?us-ascii?Q?KUoDsM8WLKhvVEYDunXCazS9UIUUdxjl/q7TSNfS4rxm4nFwRfVMvxPtGgya?=
 =?us-ascii?Q?5rbCm5eBEnWntOF34HFDhVLMYqdOiaV0I7tZ6K4SYWkjNJfBMq1vqXhbi/7b?=
 =?us-ascii?Q?TkOjBAuWfZQa8DGNhh5PUZyEk7tRxxow9B+tLN7vus7sDhbYgqeu1ccUf2vN?=
 =?us-ascii?Q?sTYxk7N9jWl05zF4NlmDKi8WfH2sDvw/T+3Y6D2F4HEi7qavhKMDfoAMXIuN?=
 =?us-ascii?Q?UNU88/ssTE0ljmJP6UJhDlZ41uUYfqni3iyovSjKq3uUwLiqS/2OEIoIdkTb?=
 =?us-ascii?Q?O2eoQBgxSjmAs7puA378wVYMMVktH2FkdPJI4BWQnPAKe/1XFc3lYWh8bUuj?=
 =?us-ascii?Q?BgltsLQA6n1z3JkDo2Kk4Zl5GfWGzFMtzvZkPhO+dwcyr8fufAcBm6SKbssr?=
 =?us-ascii?Q?cqaEeF/q5H7IdbYCtvIE2D6svYfJFsuDHmZvICOx1k/7E3P92oyDWDziRtGA?=
 =?us-ascii?Q?Are1FAkYmd2LYG97R3L+0jaXxIeK/39kYv5RnhndK7VMtLpddRa4HgoAnd6T?=
 =?us-ascii?Q?BUbiF/bjAOpg3Lm+AEGOkJA=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55017e37-ad22-4937-e3a0-08d9bbb4c501
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 08:12:12.5677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xl+HfWgVM7T0HpkAgWEPFv4d/WPtj60z2Lp+IBWHqcuZBVz86DFAn+cIF8rAG2gJZFKbJVJxi+PHOGaZmqfcjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3033
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wang Qing <wangqing@vivo.com>

for_each_available_child_of_node() should decrement the
node reference counter.  Reported by Coccinelle:

arch/powerpc/platforms/powermac/low_i2c.c:916:1-23: WARNING: Function 
"for_each_child_of_node" should have of_node_put() before return.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index f77a59b..5a8c306
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -922,8 +922,10 @@ static void __init smu_i2c_probe(void)
 
 		sz = sizeof(struct pmac_i2c_bus) + sizeof(struct smu_i2c_cmd);
 		bus = kzalloc(sz, GFP_KERNEL);
-		if (bus == NULL)
+		if (bus == NULL) {
+			of_node_put(busnode);
 			return;
+		}
 
 		bus->controller = controller;
 		bus->busnode = of_node_get(busnode);
-- 
2.7.4

