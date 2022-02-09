Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0AC4AEC8A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 09:36:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JttWs41fHz3bcn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 19:36:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=po7RzDwI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f400:feae::72c;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=wangqing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=po7RzDwI; dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JttW21rbXz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 19:35:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeVmF4hMYkEiroPQL94EHYnxQwdhXVzxdaDs5/v9knOg04itgwgFkFVk+CsibimbWOqAUgkU4JB5JPpaK5PRiMHIexV5VR323MtDbNDUEBXU6KOVszU9SGxy4JGLimgfRJlQTa5iQkQD1z/y0OT++Z/rlKV2Ke4075G2qC3Y7xvfKu8RzFzDkuNdFzo8yEb+uV3e2TisUd5WCReECafKMWYABbgFdEPxO5k+aAOXE4f8vEo4LSKV22B8WyFAUOU3VFKqcjFqcEp/4rTA/I+2DjyBJSlOLxMKqd/t6rdCaX+6mDCOcMUmnhFMqqFcbxHG7xX+AYMv4Vg5LWFqIF7QzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EMeIToNUcDG98+WDxBUEUpyIpe0q47jndIFve+3ivE=;
 b=EyoM8dsEo2HGO5Mt3t8+2lGiBJkslyWewbjbWKtwTn9UEekf7pg/JCy+MUH8YLWIQyWg3q/mTs87V+8ZyyEvQBZhx9JnjWHP8kwSumvCpTYRDFgmpmfA3XRBglK5RA1QF1hVQt73OUEPbTfyNJqd2osWKrDJT0J6Rn+v60v9pOgXODNeeZa2vf4szHW6Ys/22K2aWoWfi+PQJVjj8W/6p0TZtIkC/b/5KU2ynuIZ8yxKanu+kSWGQuH6lpne8mjGE4AqQ6axB8CXTCRBBOOL4jFtNKPbQ0/bzN1iv/cfFb//iGE3WdlgWK9osfnA63k7XGmTqp5uPdh7g500/u+1DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EMeIToNUcDG98+WDxBUEUpyIpe0q47jndIFve+3ivE=;
 b=po7RzDwIsHTUpeFL5GVkTfhwZMMT/7melL4jmfZNpPQeT2vbrBsNL+tmBdUlBYHOqUYu+A5ohvIp/5mG4keYACRooJMSwlBb2E5+siTnwhBE49yl7ijCC2AI7ZkaHAegFJ0R3efbLpEYtUyEEFIaBBk1ngfQG9hW75Xxf94E2rg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by KL1PR0601MB4068.apcprd06.prod.outlook.com (2603:1096:820:2a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 08:35:05 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 08:35:05 +0000
From: Qing Wang <wangqing@vivo.com>
To: Anatolij Gustschin <agust@denx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: delete redundant conversion
Date: Wed,  9 Feb 2022 00:34:55 -0800
Message-Id: <1644395696-3545-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0048.apcprd03.prod.outlook.com
 (2603:1096:202:17::18) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9abae3bc-77b2-4208-397c-08d9eba71245
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4068:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB406850F2A36B1CCA65480DCDBD2E9@KL1PR0601MB4068.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBYWf444cxAiUJTaR4tzFYIJXSgBiM3J09qkTWzE0GCAiKiIJ94DaqJAV1ec3ZDfeB7CTJ1wiFwWFKHtcLdC0IInTa8uOhYUNT2AomfGBiovgEMvmIHh/dFfN7+Kfw508WP/fWXaLGmvwip7rhvhmz58/Io2cvdYrIGNExbt+uuMcxWXnrt9/B9NCHGUy7zpePzy2rWU46/2pBvcOOb9V/zrNCDJfcK9yC8uQrtz1qinmOs/dB784RRRurc2A+gUKZu9bWsO70kRbRhjhMhOdtW2T/FHWyfun6muTnPy3Ujvu47Be3DCGgQCKvg3fzZAg3btzz1J/UiqronaZgMjaQxCWDjoPsi6uBp1YffEJFeiP2hoDNP567N3BJRfACAed04z53RZwET6H5xOsT6d6i1sZ3EvSoeWGN096YO94ZSfKdYkgsP2drce1HGDLv5YgwwLoZpX6xWYjNPGjg/J087J3JwXIBb+RnnJtzVKT/le2LI3TcRcA4uyh7Q9KQF6nQFucpQojbv9LswycHsLFP5IWzHfWpBEI/KNRfYc/i12o8A0tqHHD1nkSmifcjqpxpNV6xK26MqzuIXZAfpwsQ+xQqowNmFQXcex+fNLoZlGix75EJ4R9Fy8rrnZH+TvcsNWACCIU9HqJI3zNK+eLzk44qzS9dhOuvHu3EfaxhCAJUfhfETVDi5ZxuizV1IHKsMV/V/D7U5zE3grwhwZww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(38100700002)(186003)(38350700002)(6486002)(83380400001)(508600001)(4744005)(2906002)(8936002)(316002)(107886003)(36756003)(110136005)(2616005)(26005)(4326008)(5660300002)(6666004)(6512007)(66476007)(66946007)(66556008)(8676002)(52116002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gaZW8FiVYjObH/rQC6IaKpISZkZRGjX/ZavBtIvnW0DkZFjdxdRmklepclq0?=
 =?us-ascii?Q?wO9+hboL066+xHIcsWFnpijlddqA2MJ8W2XGiy54EgBGPBQOBkaMqL9ZBTvB?=
 =?us-ascii?Q?8RYQszaw953VRjOga7D0H6y7fjNNNpf/SxGfzWidHq/2f4ANAn3aAqqMdPk8?=
 =?us-ascii?Q?FhUFO2z76rn4zx4yOnIB9YOFmtyjcRWBS2Ben9qAm/52QBrIR27VJ5yjfpYI?=
 =?us-ascii?Q?SsZzQhvuSea8fd0EqJUaTMwSPeR6HrG4Zfh/naKEmMM57FhM4DItGHxGlKG7?=
 =?us-ascii?Q?xquGkBJrGSlBq3LP/Ham5Ch0THE0Q86KpR5kJxhv+dsGKoqPymu70G3Z6lM/?=
 =?us-ascii?Q?GLmKgZLSc6QSpCdYOQgnbEpMIk91Js1VVS8uGcVTFse3ROHniu0oS/FRcUiU?=
 =?us-ascii?Q?Ph9Suoh+DDF9wnUjfVUl8G9exWPB6qhbZMlK2AAu5604jkkXoFO3IqsDmItx?=
 =?us-ascii?Q?39BeAAPW10jJYkixV7PyFAxDiZEwJ2M6imU4iD77HvO8STi0HUj/0MRvh95q?=
 =?us-ascii?Q?1rBvhGPpmMYcr6aNtC1VlmQZyFbmLsQiaSXaucKOKrSPXBEpA+dJHzFjDtV1?=
 =?us-ascii?Q?frDwVYX7W4tf4MmEI5IyiqF7kXNdtqhkWdHbVA5II34R6v060oiq1cedH88o?=
 =?us-ascii?Q?/cQcZ5eKK/EJIiRtV+RRvGG3q7fokwLJzf3mDSE8J/X4EWeA2WphxtfuYsDC?=
 =?us-ascii?Q?nrRkJUXfZdUEckMWWspuWxbAdDSGJogEIJBR2VbhpVc9nzJfh0bP2htM7QnQ?=
 =?us-ascii?Q?W6H0JKkBUOzfrFap4Pvl7ubMdwikzw3ZSJO+J6Yk9uiTsOWb4yCsKyJQt47c?=
 =?us-ascii?Q?83mQT03No7dctODdEg8IbN5tWubg/QmL9fgdeT01MGHZ//j3BT7Kihe2i14q?=
 =?us-ascii?Q?p8PmssCWAzndKfbi2MDl5vOGjaDZ6HDcqiqMblSB/Bkjg5QbpjfDgPkWksE0?=
 =?us-ascii?Q?TKsH31Ocpf4YXaWhrObTsqVpO7m2nFUzbALwG/9B/NWhGJLIARdACQFG02tu?=
 =?us-ascii?Q?gdQZAjLaEjiFQQLofgKD2dCgVgoPzg20hlk6/Vn7AdQSzfh9JxoLszMXmqeL?=
 =?us-ascii?Q?X//3uNJVp1uchDdm5iRCi2T8nMB6UuA8EJISxwzUsgtz+6DiwzXpWUR7qrZH?=
 =?us-ascii?Q?269MVryI6ZSDbx4YyH2cH5rE6awpB8eCLOqDsSD3RPr3Qzg8fbai41ntCmI/?=
 =?us-ascii?Q?CKyfTmLWJtgB0m7VpKXgJN2S8PhJU9LNctkfxx/uxlx35rjWeQ/TNA1YlSin?=
 =?us-ascii?Q?7nPOoJE44FTsPTyB9U5CGp6QFZGPuFz5uwjoCIzf5KAmB7CSMfs1naetso4i?=
 =?us-ascii?Q?KT12Xor5NEMtnEjtzweEpYICj5Ot3u0aLr88KGrLJdITT3cfEQurQPAA5Ps0?=
 =?us-ascii?Q?sYqrUkkgNOtAwdJpSay5X6tfwXhfokkh/vWIm2qq6nwhUszDx2JW6PZpU8fy?=
 =?us-ascii?Q?PBapBFOCY1b/gVAUZv4nnd9RI44CbdZRbBVVUevsentp3LluDSiuc+fDsULd?=
 =?us-ascii?Q?qBrqANjwJwQE6/fgKQ7M+lozZCgaNLkmvPJqjFXxn13rliBzNi9q1kXorE/O?=
 =?us-ascii?Q?bNSghYhRw2mcLmU7xsWgMKpLmT0UbFa2pUP8sUOFjcLwTBLx64HniUW3by4B?=
 =?us-ascii?Q?mrvDDdMksGDp6za67Kazd6M=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abae3bc-77b2-4208-397c-08d9eba71245
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 08:35:05.2290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckUbdtBxnjJknpamgceBubVs4jSzDAZStKFZrzBiE2qjFjpkJuviXtDqTNhD2+WwY03q0krjiSvAWakB3CnaGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4068
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

do_div() does a 64-by-32 division
No need to transform gpt->ipb_freq to u64

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index f862b48..0cb2482
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -502,7 +502,7 @@ u64 mpc52xx_gpt_timer_period(struct mpc52xx_gpt_priv *gpt)
 	if (prescale == 0)
 		prescale = 0x10000;
 	period = period * prescale * 1000000000ULL;
-	do_div(period, (u64)gpt->ipb_freq);
+	do_div(period, gpt->ipb_freq);
 	return period;
 }
 EXPORT_SYMBOL(mpc52xx_gpt_timer_period);
-- 
2.7.4

