Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A123F569
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:17:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNjVJ6RKJzDqCX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:17:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.14.48;
 helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=andrei.botila@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=JVzmN+Ku;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxB3502zDqsD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:21:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itJZ/ayVxDV6b0vUH63pYmh4iJfhNZuqmgU+AAaJPgYRWFg/XUNO76BsvI7N328LOoc6NV/VJetT/wVsYwRedBf/Y9S5s6a/PN3DfxOQSU99Z310c2WOVsrNmeSbInIFDQoMfuSLRrh944EuCuDQYdK7ODcRqlu4yKpddhYSyE6vUoKhL/dV+hSqrNodFRLhE/E88RYo53/zKl8stxBLofJ32CnZFcyWqWwlaWBBLIB2bG2KarqW3jK/ic0Rqria2C01Ckgqdhbuwr5fuIqeqZHpI8ZKpfl4DhtlgZpmzCMqscwc/r/vR16P6Ln2JnNERYqsMhIzXqa0AsGPApDbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mSyozIYxpTr4iLhAEcKEO/usjLA+Nbis/QrBJkUzJc=;
 b=RKI6st3zHQ+LJHzSpdPT2RyrCgZ72iWh8vVPBwJA4xs9fF7MMIoefAxXn1ZkxuZD7VeSufgFAPVWUzUmaROrJ06VGk7iSh4SXX1Xt8ZcLxv1/1EETEPQjHhZsa5W2GP7YnLWYQmCJT7MJm3+XeZ0ngpll4ogE67LbkeN2H9boTCYA7BtJZBiuVI8LUqQ8i9g6DIdOxIr2Jo67aKa5P1JzbNPjoyxf8oW816VB2tJuFPgAIp1yTM7ZGD9IxU1EfVtsMQDm9IszrKlYF5sg1ndG8X8goaA/41xOWvxoirsnoydWJNci2MlhXDgVc/5M7GZR21BTaKKQByqHaWwHuA4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mSyozIYxpTr4iLhAEcKEO/usjLA+Nbis/QrBJkUzJc=;
 b=JVzmN+KuaXg1wi5gcOSHs/Q8UNgz+BroBm4uTgpDk3fl4G50lIOloTrLPv4aF1435dsIKfNgDkbPuNj4SAjHxgxJYtjyLm+/Qk8PLQzvwe3fiDpmfrCvT8GWZpS80LEfcJVBCdCB8N3dlrSYVI9Y6b3o9lmlMuru5nlg3W1nGCQ=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:21:46 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:21:46 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 04/22] crypto: arm64/aes-neonbs - add check for xts input
 length equal to zero
Date: Fri,  7 Aug 2020 19:19:52 +0300
Message-Id: <20200807162010.18979-5-andrei.botila@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807162010.18979-1-andrei.botila@oss.nxp.com>
References: <20200807162010.18979-1-andrei.botila@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:208:be::16) To VE1PR04MB6608.eurprd04.prod.outlook.com
 (2603:10a6:803:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv15007.swis.ro-buh01.nxp.com (83.217.231.2) by
 AM0PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:208:be::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:21:45 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa1fcf7b-bd37-486d-5677-08d83aedfac5
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7359C6FFE25EE1A6E8141654B4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnOkP+mtiuyFK3Ar4lYwASTBLMs5VIovTWz+3PriHcxpSmWHnYmjkw6CneDNFX2qWuUM/6CTVFpATtxHVfF7vHIeVzB0jaEx+IXGQY+k0W/eYmOP2o9I1wuunV5Onl2LBA7krqsAMTondwJUeR6QC6e1ddZ1O4Xz3oaBGsy0lib/htjI99Lp2tgoetGWPgjJPxYd5n3bBdwRlX3bsLSYk36PDwXfBsKul9vj0ii8liJtz8Hg+oBPVJDj0PBv5IQQ7kNbPp/kMaO9tvJZBNiTL0aRQaG43y9WkhLoc/DWSiWqDwC/tSaN6IUZt7FpuQYzu7ilZGji3sJa6CsqGg+HLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(4744005)(86362001)(5660300002)(6666004)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 0kJfl4HgZ/fOh3bkuF6n+i5JVN05X1PbW9wkNExix42d1CJLrThZh7xn7BlRdTLvtAnAqGrgFqKBcXHvwsRR9wMyhcs3keQcz2Mi9rPlrw7fjyWtKVQvU9nh9bMHiCTrntUgDfZjhB0kp4KBYfzC+B4vZss7BduM1Mf2nZezRj9MZPYuhggZYC8mAG+5hPDvkw1BYSdNTjC4TnEdQ1ZhpffMqcJxRR+yZdQa1B25nR1qx2YZKIiXQ7Q5GVH94jZZ+9U34JuwfosB9BIuoBDxa/ofsRwLA3HC4DJAGNecCej1XI5fnglnwo5AujTOw2RPFg1p6QDkOFckJaAT3G0gTcOS8RM46+PR092oxR+2CtL8q2KE+8A09cyTu1QP1gUmGuZzbFnU0fUD7VPzNf7jR+MYveRK/PMejgypvFlLtArlaEYA6DGDYp/SKmd9KsVYId4VKUI1kC8Osrp6ycMAGyENIoM1LUVLZ0z4PlhhOv6kjZ4CQnQB9Qef09RRI811x9kEsijMRdaUhHYpnHyOJxkkDdQeTIB0CpYkaFIPWB6MUefqicJwRduRn4koHaWwICbg/hCISvuAkXU/d0WmOvQvu4fgA2ZlQYaRNVDFKMffgyhbq0LG0Nm4vfU5BL6RMrIkJSNRFYPKYsw4QKSOAg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1fcf7b-bd37-486d-5677-08d83aedfac5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:21:46.3750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpyozUUlEUH2XUmrXhZJcC0qK7Z1gwrmvrsVWyovdENAx2OKCZ5pBgP68zjcWYf5grSidsL4U0XW+8o6Dm0tkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7359
X-Mailman-Approved-At: Sat, 08 Aug 2020 10:06:29 +1000
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
Cc: linux-s390@vger.kernel.org, Andrei Botila <andrei.botila@nxp.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 arch/arm64/crypto/aes-neonbs-glue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/crypto/aes-neonbs-glue.c b/arch/arm64/crypto/aes-neonbs-glue.c
index fb507d569922..197bf24e7dae 100644
--- a/arch/arm64/crypto/aes-neonbs-glue.c
+++ b/arch/arm64/crypto/aes-neonbs-glue.c
@@ -330,6 +330,9 @@ static int __xts_crypt(struct skcipher_request *req, bool encrypt,
 	int first = 1;
 	u8 *out, *in;
 
+	if (!req->cryptlen)
+		return 0;
+
 	if (req->cryptlen < AES_BLOCK_SIZE)
 		return -EINVAL;
 
-- 
2.17.1

