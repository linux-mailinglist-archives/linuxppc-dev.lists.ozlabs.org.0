Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 634282A2F9C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 17:21:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPyp66CkczDqNs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 03:21:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.21.77;
 helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=Db/sB/6R;
 dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPylM4zh8zDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 03:18:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+/VsncUlsaIGFPd/96na8iu+5rWBr7pqzF3S6De345nlcw573FKSv5f9XthXRstvxnIzMggQl0mfRfy6dQ/H+HASruD2eIKjbsqb2aWqhwQ3nIU2EcS72bXoNGY9VdOjsfkgzTViYw99eOnAXg6VDxNx5vb4PCPYyaFwgfWzvmZz75gNC+MvNck+AzdJQ+s/oT2NEiWHvQO+MG0IihjjyOpKpkYy8tUSykJBfOUZAmdCoC2+QcJt8uPCD2jhqRF8dSt/8skQ+npoJMveG+Z7VsqwXjzTXNT4n6PARiYW5uZDvbDdrAAivS9Ts6D3hOW779R6qzQH7Jn9IzcstoJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQucECVRfJAiUp25lU24CH6Tl5fSUwJsWHxeid69ixk=;
 b=PMcYKArHds22Mj6lfY3oeK5NInY8+IDxqXsVxVxqKPr28NhNEk8kMzUhQXtYLKuhMq4iV0DPnqiw0UYDRmr/XOvKtHi8A2Yi1sQJg9bht0OeRn4q4RU1sDiZbwJL8tgEu/Y9aE6wJyTtNGzD5fqZ62B/NGPR66myTY/YFCWt+17jjleow2hb2+coCYKSeFy0WSnMbg74BMUcwtqSOdR7vznznSMWfRooz19aNKfVwH0KNumpwQXuVBjGoiFAdvgbSRk5T0OAgONIrhSruIRNq2PJe7lKcgFIrjpxzkHjI1lnyuTmhzhnJVnMWZD2yc7HpO5gxp/VSl5PLz168dqUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQucECVRfJAiUp25lU24CH6Tl5fSUwJsWHxeid69ixk=;
 b=Db/sB/6RU6mDITGxBjrIJ8fO7SKjr++74mmL3tBLdpgkOs26p8KpFQlCUW+CmWRQvb4WG0oh+n34ehRRPFL5fL/oBiH2FLtk79EO1tSGpFKVq4ze6sdcmEVTjR9ECPA9keq7LZ8mIIruphd9BjZ/AdrwkIXmJ/mp8yAsG1Dkyhw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB5517.eurprd04.prod.outlook.com
 (2603:10a6:803:d9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 16:18:30 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 16:18:29 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_xcvr: fix break condition
Date: Mon,  2 Nov 2020 18:18:10 +0200
Message-Id: <20201102161810.902464-1-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [5.12.106.221]
X-ClientProxiedBy: VI1PR02CA0048.eurprd02.prod.outlook.com
 (2603:10a6:802:14::19) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (5.12.106.221) by
 VI1PR02CA0048.eurprd02.prod.outlook.com (2603:10a6:802:14::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.22 via Frontend Transport; Mon, 2 Nov 2020 16:18:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1d589a03-ab26-44a4-9000-08d87f4aef77
X-MS-TrafficTypeDiagnostic: VI1PR04MB5517:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5517A193B9DBF14A27A5C1DFD3100@VI1PR04MB5517.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l3cAyd6fULIaxPeSizHExz2tnDAgbuCCGNRaJdN/pywFuxcwj98wi1hQR5M0rSzOdlYMmLkAFNkOJNMu18PMoGCF+e4h4ynAl5t9RUj9+ZkDRlEf4nZK6aoNJqsNCE9VEmKOMJlkvq+krnfTSkG1ej1X+HG/Y1KsIlth0ohZQXaRhfTDSg/SgGMq/DjdS4PQrfbI4s82VkiCsgobCem+M3Jkl+nSK/jhK/rK+gBb7dMq1i3VavFYMX09CBSEJHvMqyMpMNN4FdpUSZOad058TbMRZO8ZJHlvJZYZz7NXDBSv08Wboqn953O0YmgwVA/phB/hBbuYM+pPyxvULOTSRJUCu5ZY/vIq3vEBm5r1Mpiqdu0GlzfAAGLLXBVdsH0TrgWVTUGQT+YOybDp09yi9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(69590400008)(26005)(956004)(186003)(83380400001)(2616005)(110136005)(66476007)(66946007)(478600001)(66556008)(16526019)(316002)(6506007)(4326008)(52116002)(8676002)(6486002)(6512007)(86362001)(8936002)(4744005)(6666004)(2906002)(5660300002)(7416002)(1076003)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4hweiy+ZCeRCV0hpTv09ywtj+D1NLx9vvNeLMEHfesh1Xw5KNrMwwKrRHI3RnQTK3ywFcAtkjxCJjyBoJWTZwc0244W6R72CPL1tHedzfrymQAHRL8NsvslRIgQHnPrT2ytm9ivoeohGDG2eEwrY3Jv4rlxJyPXQUWm8agVzzFTbVhlmyX5/PUIw/t44x+o0qp/lZX1vGkQxoHlFWevSUophu11oZWrrQNL+lRpU1UB1nsfQyO5jbeZQGEW8ZSv/jTw8gwRKA1PkPzqWhQfzpnop5CZkPsp0kEMTEoc1A5497r0XOzKNF5qO4YJjIR0bARTW8eaNrashuSoZ7BVGSZ/whqxHDXjGYgaRMxZVpILHnSNAslGJ6GmPCiOCG4PP0CIu7zYFuBCWdbJmEyzfLgeKZmEOiErLyJeFL8xXJWS4mC9Q8nDOy08qaj+rt/en2SJhbVHC9Wm0CySRF7WM+Uz92hn9MIhEycHenBNz3zMRiEGf367H3OuVIEk5gT2CibaCJP03CMbr9aW5rGRAx/uJjwbFQQsrMMpKzrIiMQMhu97NsECAN6RyGN56LX/uLVWHF0gnIPEN6T2RJHbEpKmvRO1CbLSAXp49DpR4gZtF+o3yHilgC/8PmO1yISIyiTD/+LIdyYNZxRmVpfnefg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d589a03-ab26-44a4-9000-08d87f4aef77
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 16:18:29.6981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XvervRLink86RRMOrbDVnmPbNWmNZjYNCwKhQoVvETDkxws25wuh8MMO0ddrmaxBts4WfGu41Z/bXjPpnjlRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5517
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
Cc: Viorel Suman <viorel.suman@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Viorel Suman <viorel.suman@nxp.com>

The break condition copied by mistake as same
as loop condition in the previous version, but must
be the opposite. So fix it.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index c055179e6d11..2a28810d0e29 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -247,7 +247,7 @@ static int fsl_xcvr_ai_write(struct fsl_xcvr *xcvr, u8 reg, u32 data, bool phy)
 	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_TOG, idx);
 
 	ret = regmap_read_poll_timeout(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL, val,
-				       (val & idx) != ((val & tidx) >> 1),
+				       (val & idx) == ((val & tidx) >> 1),
 				       10, 10000);
 	if (ret)
 		dev_err(dev, "AI timeout: failed to set %s reg 0x%02x=0x%08x\n",
-- 
2.26.2

