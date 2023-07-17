Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085B756279
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 14:07:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=d2BmIUtY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4LSP23r6z2yxK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 22:07:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=d2BmIUtY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f400:feae::723; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=duminjie@vivo.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20723.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4GvG00qwz2yF4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 19:27:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHv/uiSCuQb/ArDBC6e8GuXV64TpJmDWWG0MHwW7aw+WLS7mozZl4RPbbfNhEf570We7g9AZsOAr8hWlvooo5g3Ya4Wf5eOcSl4mR5pTvDSTEhbF1ZFcTgWKGQ3n8LQ6SjMvwtiMz/l7vY0+W4jipuApvwKyVgEhdbpaY0Ce4d2W6uMXbAXnDa6WQR23YVL3XsWbTKvvbFNgcf04Z4m4qEcouoUzTGGU01Odp/M54VIpRNVKqiZ4W4ah4a+XwN6yacn7QB31vtvbceiYyyiOArHzDR+9HN0fMyXC4JdorgLLKjnbbKQVmutCIM5i6jqmErAMj1VxVaKBOAfJrlG8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1vYn3t40360j4swAEotClg5FLDecqq1MG22BVS7oaE=;
 b=AFePu9LOcbYQDY2XpQQFUn8ssqmwLuQHqW9slRDuNLPIJUHzKbK/qMolvNTf/vUOKS3ACUTwklK29Ris3JzJel1KARWtJ2gSuLNRY0bHr1wKtkpvFod/OjbaCvvtby5OxhdfLWbB4egX+fKicz/05PMC65wClxkrqaInk7Loc9jAsYt/L4gCeJOWevSgHE9JP5W3WPwOyVMaO2CbMTGJipxXbZOT1vJN47ndHourKDhaQEkDJTmVA+wJQDY3RI7q8TTtknEbH1xK1f+AbAMZlAM9o+B5C7Th/zgbiNqlMAcvXJVOXrT4gV5d8MXlapfrl/z3nA0jRuhYOajaR+ICqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1vYn3t40360j4swAEotClg5FLDecqq1MG22BVS7oaE=;
 b=d2BmIUtYsuTDXbXUOprq/i8EhdlnqdCAOZd8MEMefGttO/cKjvFcGGpyOAavCX1nTz2irrKYVNwZ4loIAS5Jnbljh+Af779Q8T5+/lQoi7/Q7xigwsl2K6adNRIfK/rPeuyajeQcDW4HAtTIBAIR8aEZqm2KzQoXRWw+qoLEg15Y7Uspr7HpSDuQA6j0TxMcrdSBm6iciIgzk6U2lpWz1KwV3wkvAfG8S6N8xpZ9JPk92R68WR+uN6ZZhsN7fIz+0YBiDU8yrCSFeF4vp+F5F+PbpuUW0X4hGIKUD2RTwB8wEdkhlLGXBVfhPWzNZOJOwa1WQu5HtL7hGNWKwNjShg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 KL1PR06MB6273.apcprd06.prod.outlook.com (2603:1096:820:ec::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Mon, 17 Jul 2023 09:26:58 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a%6]) with mapi id 15.20.6565.037; Mon, 17 Jul 2023
 09:26:58 +0000
From: Minjie Du <duminjie@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Minjie Du <duminjie@vivo.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] powerpc/pseries: use kfree_sensitive() in plpks_gen_password()
Date: Mon, 17 Jul 2023 17:26:48 +0800
Message-Id: <20230717092648.9752-1-duminjie@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB5288:EE_|KL1PR06MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 306dd2b7-a052-4862-3263-08db86a7f830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qv0DiIrSDZDEDS004KY52gklhli1N7eRaK1ctkiS+4s8+UIDfD9tqMyYK4tMRz9xf/pmd+dnmelBxmu+Mx760B8Oyx7eXQxz3F+SHFXI5EbJr9KfpHaRp47Ley0vKu0mhgm0E/S16u8wwlMynhE1+ni9L/Frd32VVLj/J5376tTTIWsXgTyQlcE7NVXE2fPNWg2PLpr50+7QigkpgrzPLwhBlh59JHjjYUKW+Xclp1vWcCey7BEsJMOox6godMfkWD3CyiJZT/6O2Iam3BRT4M8GqtuPLjfCfiiRDn/fYDwr+LGjme3CfdXuxIpV2H6MI4aZekXnrqr4womMgiuJsAvliyp9M/FqNSHN170XFC/INO6Us/QJiTVkLpe/ia9+z9J/uPSbmRr5SaDelC+9omAxpQgUfBLXqzm8p1hpHjutiPuL8YjYfXrGICKIpajhSfa93VptOyDTRVGOCCSbOTSUoIBzur5sRYGQ8w3uwDPYWhTIcgbj2zIW0ZI3txibv5drgBJwpIbnzKqDMSxlomSwtaxB/1F0C2dKuDcqAZ9AlcDV37c8yRJm675zbzLwzRGZlBP4NMab/mArNcrDFzFyBnDoLG9X3De03MKvihgJRBLvXCY1hJi66eVuRZk7
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB5288.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199021)(83380400001)(52116002)(478600001)(4744005)(186003)(2616005)(86362001)(6486002)(26005)(1076003)(6506007)(6512007)(107886003)(66556008)(66946007)(38350700002)(38100700002)(110136005)(41300700001)(2906002)(36756003)(6666004)(4326008)(8676002)(316002)(5660300002)(8936002)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WwYJhoL+o59mBmxu7n4YI3PleGMjiyf/vWaiduZGX5pPTNJfdcX5pJpftW3b?=
 =?us-ascii?Q?6Idt3lVuUJZNs6i7EcQKr5rOXm50yH3vJgVGWS8SFT2RHHosG8eOt1sd8S6X?=
 =?us-ascii?Q?WAXbGucUqFHehRHbarn6jXIAgZPw1oQLysrKdYdN7WosPtSBm6Wc2LXari3y?=
 =?us-ascii?Q?1R+ot2nhWlHFCDCGdzVbenIIgrh9AkBEfzR4QdZ6jEAHmqCGPYGnmjoQM2lT?=
 =?us-ascii?Q?XnK+sX9fx8Q0CfJgFzxvG7hCYeo4tWB/ypTU3PZfJ5fbn4YIeODsDUxd/VVM?=
 =?us-ascii?Q?GUj3LXzRcl2Dqf3uTYBEH+nWjGxjBlbVNfRx0btJJVX7eiDcUsP0AR7yyz/A?=
 =?us-ascii?Q?OrNX5WlfbpC9aWNp8Q8XvKGL16ykXPMRGtrb+07laJBYLxtScnD+l0e/YMAN?=
 =?us-ascii?Q?VZoqepKewjrKuDJUVXl1xH1OQbmSr708JXRZ9o+VlpTP4DcMGSxMIRd9LYuO?=
 =?us-ascii?Q?HVE6hO3wZ0KGoV4jzH2g70FZbuNFeqVSTwfPnqEu80Kx04k2h74XY5TXDeoz?=
 =?us-ascii?Q?DWghXnFpPq25KdSVhNnF2f/XOXjWJ3paCAag4iZiO1E5pneBiTg2roTYuUN9?=
 =?us-ascii?Q?WvxzN2oew5orSV7BdN7GMe4Xgcac6rCDaINkIGJqsIrlG69Mlj0BpbuwMOOU?=
 =?us-ascii?Q?q3XwxHGhKX6dokw+fKGfn1j/w68wQYpI/Ey4Pna9y7+3nmw1VCyv4R8lCl41?=
 =?us-ascii?Q?ngcIG3ljliWoGIvC0dXqQTlHAfFAukdQwvKzMDQk1shDhGo/fpcH/ClHqkgi?=
 =?us-ascii?Q?veikX0yhn7nDPKuN4DwsXJhrwetLL5hsQkp4CbuvMYCsjfzlgVH4RHtZuGBH?=
 =?us-ascii?Q?//xEDB35jTkesv0iR/jf8VIS93o1tUc1PGg10EGd5jpAWmA4ZBfgLGXEBzKT?=
 =?us-ascii?Q?yPu9S1fK8A/hWlfcSApBKnCthsPzJ7GAMWDFdgWEZ0LJ6+8foBpyiDgdKf4I?=
 =?us-ascii?Q?WF7btxiL1bU7Aq1cgPBcsr3hWjhavSE7hW9cA4E+T7BHFVmo+QCpdc5XqtBB?=
 =?us-ascii?Q?hNUoYkkPUpLjXDhQlcNBsSW0EwT0sQICNLZbsD8aLNV44BI8l0M07dulBVrV?=
 =?us-ascii?Q?KdtvHIiDVtf0q6aIhsAk3Dbqb0eNGfpqjkVmt6Q2qsOQpT/PCGmKI1p+Ee41?=
 =?us-ascii?Q?ItJNL0n7FmVS1hlGyegs3xjP3yzFprerI/Tpr9nVGE3oPmEVVJt+Uq9ftxsG?=
 =?us-ascii?Q?motCjLrdlDOY7fACeT/XCvXV9zCQSwwTpDU1DYEESqTF1Imys4gnAlu5H3EA?=
 =?us-ascii?Q?b4wDnxRMbrdVlcvzxsdvdPR22ghIngottv1EcehPKwmFNQN9lnfQhWqq0l3V?=
 =?us-ascii?Q?J1qY9fFfu4FALhjzkzpFZr+gGHmHqkKlA4d0Rw7rAh32uNpDEAbEuNtdCrn4?=
 =?us-ascii?Q?XMT4YCfpdiRtWN0lk5gLehPBr3LprZmN1cfrHeqnjNIsNWVRf6d6fRnY9v5b?=
 =?us-ascii?Q?n2V3ysVcukCiOu32Y1BWK1EaVpV6e0TSbpu8XoBqbFxerPmooyxJ6kDzxbai?=
 =?us-ascii?Q?xYCPdrDZfXu9e0njDzcmHIow3oDYHTYB3cm50YfsA0/ypT7y/u2zDR6VHFlm?=
 =?us-ascii?Q?TAlngjC3zsuuXLGU4fbDpOgf7jKJ28zczSsAFuC4?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 306dd2b7-a052-4862-3263-08db86a7f830
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 09:26:58.6032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89Mp2nr11ycyIv7lvqLiqxY2NZ2pDx/drjGrI+HwKLy/dLUMnfxhG/N0QAhnKmGpPboog5IlPFyGtSv2GITwlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6273
X-Mailman-Approved-At: Mon, 17 Jul 2023 22:06:13 +1000
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
Cc: opensource.kernel@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

password might contain private information, so better use
kfree_sensitive to free it.
In plpks_gen_password() use kfree_sensitive().

Signed-off-by: Minjie Du <duminjie@vivo.com>
---
 arch/powerpc/platforms/pseries/plpks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index b0658ea3e..3441e616e 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -150,7 +150,7 @@ static int plpks_gen_password(void)
 		ospasswordlength = maxpwsize;
 		ospassword = kzalloc(maxpwsize, GFP_KERNEL);
 		if (!ospassword) {
-			kfree(password);
+			kfree_sensitive(password);
 			return -ENOMEM;
 		}
 		memcpy(ospassword, password, ospasswordlength);
@@ -163,7 +163,7 @@ static int plpks_gen_password(void)
 		}
 	}
 out:
-	kfree(password);
+	kfree_sensitive(password);
 
 	return pseries_status_to_err(rc);
 }
-- 
2.39.0

