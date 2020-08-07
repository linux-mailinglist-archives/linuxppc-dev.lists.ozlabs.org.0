Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A50823F5A6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:53:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNkH14MWMzDqvW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:53:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.14.41;
 helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=andrei.botila@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=TS+e9r5R;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140041.outbound.protection.outlook.com [40.107.14.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVxz6N2GzDqfJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:22:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jh9qgscdqncpn79ITzpR3BoDnDKfl7OAH3J3Rk3SrTwoxEHCDsxYW+Jbx5jvuDMROK/ZINKgKufnmgBZgm0BbZx8xsGyE7ptLeNys57+wMY/RDGDSgt6zOXcN0LlK7JdtsM+zlSoavalr1tunthhgDdr3HCz35KYbEakaLspPU/u7VW0at23/2/H/RzRMQxKaW1IvKHEulDidSqRNK5gXVa2CxCqvrt9MGiNHCFH/WFtVlLA4H9YUdpvKiKlrzpZdFGd7hC6awDu3ZefUmq6IxVYV3ZYJe1C+oMhNh2IUS8ryRKlcV12Dy9FU3WQQJSoB1QgddMZiW85Serobkd8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAYKh++vF4KpuHhTQZhWSaZQIOj6T+WI/Kqium2hgI8=;
 b=M0/aoE85XR/o0obJzKAOx+TV3jVdCjtJ5W6jBMhTnpNvLk5qleIzpY/0fFdXh7Iwnxxa+pfMH42i7BKCHx8Vu1XAu3Q0aPaMXuyYvX+HTCsx8vRCqQ5vtTazyaoEOOVK2gCQJhetR2w7qSPBsjDue0mt3MgYCNYzcWu9aLPl3Vs9wJa3CRMtu8umHZuOjqitC9L7KBOKEGIk1hnQqVQ46nA2AtT1cs8/280EohUOoBNObjtdd/mfxOMoqXI1Ca7XlPCjsDKu4k7LJVFQCxxm/trxV6QXy4fXnlfKUC/zIdkIpcljbZ5OFcNlFlMUrrwwv5kQby2xzzuD/OQqFaAPfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAYKh++vF4KpuHhTQZhWSaZQIOj6T+WI/Kqium2hgI8=;
 b=TS+e9r5RkchV+RoXdpnpRSfdbMgOhyZ1tPX6/dV/nkowoDemPCvYOF1/gTT5TZog9AfMIBvZiLrkL/p570B5OyssbW0pA7CNXpCZTQKQkXmsKhWr46uH9ayu8CVDkCuCVgY3zjn92dHvCQiQYLFD68Rl/pUGzKu5GniZANIhHOE=
Authentication-Results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com (2603:10a6:803:125::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 16:22:26 +0000
Received: from VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d]) by VE1PR04MB6608.eurprd04.prod.outlook.com
 ([fe80::a856:c104:11c7:258d%6]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 16:22:26 +0000
From: Andrei Botila <andrei.botila@oss.nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 22/22] crypto: vmx - add check for xts input length equal to
 zero
Date: Fri,  7 Aug 2020 19:20:10 +0300
Message-Id: <20200807162010.18979-23-andrei.botila@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807162010.18979-1-andrei.botila@oss.nxp.com>
References: <20200807162010.18979-1-andrei.botila@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:208:be::16) To VE1PR04MB6608.eurprd04.prod.outlook.com
 (2603:10a6:803:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv15007.swis.ro-buh01.nxp.com (83.217.231.2) by
 AM0PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:208:be::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 16:22:24 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: db6d582e-f312-4347-9a5e-08d83aee126e
X-MS-TrafficTypeDiagnostic: VE1PR04MB7359:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7359471A5569A61EA9CF0A07B4490@VE1PR04MB7359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SBvn7lOuFex1vjZwY6ydgy4jyzzZtHO/gIs0aX6QgEcPdzCCSf1BTS75NQCyVYdJhxSP0I7YP776icGqlcA72y4redHK7GrbO341CIUxvUqfvn7fG/27E5cEyBKZRZZ7Igs078iuPcSgbSVlRAlHv4tFAq9c0GyjtQHqLUdiSus8AGCNKaXb4PKRDlG7VyyMVa18vMVDqcfnV4O+U9UobRt5T293UwoAyu6KPelqjozk/XjKgdr6k6wqqjSPYVYE1DJRjFyxrnZWgGZCzRceXXiP3QgZxY+5rwYF5GxN/1Idw7fFmLzy++Q7l8axzmdotDZRXaa4U7mYbp0+0EBMhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6608.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(44832011)(66556008)(66476007)(110136005)(7416002)(66574015)(54906003)(1076003)(6506007)(4326008)(66946007)(83380400001)(8936002)(316002)(26005)(956004)(186003)(16526019)(478600001)(4744005)(86362001)(5660300002)(6666004)(6512007)(2906002)(8676002)(2616005)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: KTItpbhXeOfEP8zVq7C1jZ3rUJg/Axwj1GIaJ6oh6r8O79WA9TeK3NEH3jNgm7iibzK8UrQGc7liMJ0hYADZMa9o8IqZkylaUfMiOi+O0I4p2UMEkD5zZcNIbv7DszcUs9Od5BVL4KHguOzJi+6qV+zbjW36w/mfya7AEMUieWbSs8Tn9ssQ/DAfznckJT5GQ/oGPXPqYvK1HvrtkXzPonErlpUmE+c4Npkyquz9pBAX0wHAKPJ2UbFoPgfCeWB13YgkKF+i6BWg024sPw7XucHGNvRe75lSAz9CoTz3kmCsmSOd7lUqwwXDu+i7IAoV8JgFG+BxNDBQ7lZ+eEul0MIerbT/K/Y21Eu5fTonGTe2hQ9Hh12ztBjt8FVTzdmSvtMgTZW7gIpYcoILTh+TVpjCzO8HduG2n93f47hG8N+1vG5SrxDCuIBFBDeUncLqMI8ZJQz6rqJa0NnDHBYMkcXXdWvpQy4vxwlWSZUeIdtyHmVDdGqU6C0pSfLeehH06/zdLxPiulPavV1/sB2W2Aij77bymNpacXCBcDcQSOtEBeUPZszevu3gVJTNnRCDWQSE9I4K0gSqPypnPpKe6foB3GFKITow3HJ3QevxDhACjjTuP3It9weM/mpqLA7yuOJ9fxINIHEgO8X2Nf/xeA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6d582e-f312-4347-9a5e-08d83aee126e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6608.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 16:22:26.0819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NL63hu0oDLC6Gd5K5C0q+EsW26/jq1TLUW9PHxLBY/jvSFuqGNyGLihFO0MIN9gakneY2u+S56Wo04AVePo9EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7359
X-Mailman-Approved-At: Sat, 08 Aug 2020 10:06:31 +1000
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
 Nayna Jain <nayna@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 linux-crypto@vger.kernel.org,
 =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrei Botila <andrei.botila@nxp.com>

Standardize the way input lengths equal to 0 are handled in all skcipher
algorithms. All the algorithms return 0 for input lengths equal to zero.

Cc: "Breno Leitão" <leitao@debian.org>
Cc: Nayna Jain <nayna@linux.ibm.com>
Cc: Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
---
 drivers/crypto/vmx/aes_xts.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/vmx/aes_xts.c b/drivers/crypto/vmx/aes_xts.c
index 9fee1b1532a4..33107c9e2656 100644
--- a/drivers/crypto/vmx/aes_xts.c
+++ b/drivers/crypto/vmx/aes_xts.c
@@ -84,6 +84,9 @@ static int p8_aes_xts_crypt(struct skcipher_request *req, int enc)
 	u8 tweak[AES_BLOCK_SIZE];
 	int ret;
 
+	if (!req->cryptlen)
+		return 0;
+
 	if (req->cryptlen < AES_BLOCK_SIZE)
 		return -EINVAL;
 
-- 
2.17.1

