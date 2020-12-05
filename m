Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7B22CFE74
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 20:35:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpKY415jjzDqGG
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 06:35:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=prevas.dk (client-ip=40.107.22.125;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.dk header.i=@prevas.dk header.a=rsa-sha256
 header.s=selector1 header.b=OcUUy2W3; 
 dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2125.outbound.protection.outlook.com [40.107.22.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpK9j04KWzDqBZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 06:18:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Py0RdWxu21rr5NbcRVJrRwt2BrqRlAa+V4prWoiTXL2I6heaKjE6E+0HDLPSYv8RpGEHJ3i8UdRmv8ZBkJ00nK5suFBeG6kW0G/OwcVcbK2S0ZipyZ2YN8NUyMIJTaXkaMwk/AtgnuqS+VgG1n5VkFO62ph+yj6yLru2H8YiDp49lnxcYkgR+xBzxBO4pcyRsgaC4SQugyX6SXfgeiURCpT7gLQ+LmkeJ9azGEJ9MVFllhg2i5LIkIpH1q0sm9OEDZxicYdpzzWumGihSg91f938Qrv5zGcljY+RYWi6KnHTvIkHygrEU9WpV+0iySjaTX9R40R6I7G9QCyKOZ3y/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9pAQ+YkqD8NXspjdVpOzcZ8lBwEd3OxgZUpUgEUfGk=;
 b=RCqNTPpTt8/c7knjsBmzL0LgzxuWQbQiZjdNtDuQ51KVB1i7hfzlNgGW5LyIvSopuPQgO6u6Ej0Bogvn4QAXjh5MhXgbhV5159I9Dfl0XFLUx08eTTaeLkNOfjdkDMzhRn6bhiyNOzIYABr07vJx64Ij2lvl7XjELyK4hfAPhkMea25SXThsI1ZcSvqGHWqciwOp1LlGhJw91oylUqtkpMYVB82PhLAtrLrIrSjzf+nd3w3lrDIjHB2PBkZUKERT25rz43CipeQv5Z1PAhvVMwJfT3M3yy0CEFYvBN1cpRZZQbbN4+WHalNPeuRV9pHhhsXb/0V9TI3fMXP95BPSEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9pAQ+YkqD8NXspjdVpOzcZ8lBwEd3OxgZUpUgEUfGk=;
 b=OcUUy2W3N22zLQV8ykKz68dNVC4zBJQbkpOYmj/YEAJVFqCpALBNkHXTKZWZzV3qzgkEXvzcsE3gbXOSs1XrZ0ldMbEq7ZCdpCsTFAoDG+cIxoteRoR3iS0bO0p4cN/VM8PYnH+q5dsNTJPb3v4IIXc1FWNi2x9Fyc2uRHn4NXc=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM4PR1001MB1363.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Sat, 5 Dec
 2020 19:18:20 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3632.021; Sat, 5 Dec 2020
 19:18:20 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 04/20] soc: fsl: qe: make cpm_muram_offset take a const void*
 argument
Date: Sat,  5 Dec 2020 20:17:27 +0100
Message-Id: <20201205191744.7847-5-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM5PR0701CA0063.eurprd07.prod.outlook.com
 (2603:10a6:203:2::25) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by
 AM5PR0701CA0063.eurprd07.prod.outlook.com (2603:10a6:203:2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.5 via Frontend
 Transport; Sat, 5 Dec 2020 19:18:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ac33b1c-c87a-495a-976c-08d8995286de
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1363:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR1001MB136322143F9F2EB76F882A9F93F00@AM4PR1001MB1363.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYQDumrQnT+OF5o9JB47+9HZQRBZfE0kXx4BucBXfm9ZT1ln/lhxa3R1wuaJ3qIhnd1nJYkQVv+icg1JK0abUSHT5/TLyXOaRCcY8EM8yG7FnwMHbEOosiK+fBir9jArk1ay4RujMFAiNIUHfD9/cu99ZHG5lqXbHymBk9bKQS/9F0ELBNVM23otukNgFUPXZJ5TuUTKZxhmy07C7RZkyIC2nEPEdTVDsgeI5c+uHzZdhcjRSMEoqOpUHxNJPHpIevlJHgSHsLeZ5UOyoSEXvjcrXGC3KmXH7d84osKuGP/34WcfANdE5N7omeRFLeu88WVz2FXlgJLRN51PTAhzzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(39840400004)(346002)(136003)(366004)(376002)(2616005)(2906002)(8676002)(8936002)(83380400001)(52116002)(36756003)(66476007)(66946007)(66556008)(4326008)(8976002)(5660300002)(1076003)(6486002)(44832011)(6512007)(186003)(26005)(110136005)(316002)(86362001)(478600001)(16526019)(54906003)(956004)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?a84jwIJNlLFA2sQTN5pqEAcPLSCkuM0eBjvlXZ9Uz7zYbEUF9EZ12SfmPzaZ?=
 =?us-ascii?Q?9qqpAcUtRXBqlLtBVWA5Jm94H5sBxFNGabfAQtHIQLNdVLqecJPIccLQ//Yl?=
 =?us-ascii?Q?v9PCsorImlayQnY4Y+EuTNVrbO557pWba4xV2wl5OdW+hClzlPzqGdPXkkmY?=
 =?us-ascii?Q?hOfHZc/6bIHiFr2JsVLcGGI3XrjKp8Vh1ZGZXzcBk9ZyMkN1tItKUqj4T5Xr?=
 =?us-ascii?Q?fGsJW8qFPGGMWlmHtogQuzdUsxQOy3cyJ70uDjrPC72zpPj8q+4FovKpeR5h?=
 =?us-ascii?Q?5UZo3wroIpNCARUfuhpPVjrO21TF9vEEnxIgeBCgJ2Dh3UcN2HlO1m9n0mt8?=
 =?us-ascii?Q?q0XKCCNluanKtE+yEj6Rt8OAu1lV0EHFw3rxh+AWei7SVC4kE3BGa/AkK1Me?=
 =?us-ascii?Q?7kqrVckLqgS6qBt3vWTnSJIfpSNvfdew/NGSUUlXEIIrCdZLD9X3NzsmjQkt?=
 =?us-ascii?Q?SbR4zU1UFmRdpET4oMYtPBUAeFxdPVLZosQWwiGK1gRoUdbCD73g1SM2wGwR?=
 =?us-ascii?Q?S65yt2T0phQc+loJ3vKMfMj0J5o5H45aWwMdEeASgurANh9G1s+5uqVSMtnr?=
 =?us-ascii?Q?OW7eLkA+9lmFFUvESRuzFN3fCLLRtuxJh9TseTf0XxovpH6taxLZ5tmTZzyl?=
 =?us-ascii?Q?KdM3+AOIVqQRwkoxzTkuiZMvW+CHeV5vh6IbAnuVXpLD7noT/phD3ueviylE?=
 =?us-ascii?Q?K5W00Kb9Sh+xUdAQgW3qsMdy7hB7bRZHcvGvWar4wX76yadCFe9fQyrmhank?=
 =?us-ascii?Q?psqzhyNKOKfTh6kGT59Co+PNopjcGNdeJVoYhSoKotSAipmzXArAgEb1jEv9?=
 =?us-ascii?Q?qTn2vhtTFkGWe/JGdIF/1yR58+ErlKJMZjZN7WRWsCAjwTp7W2+XuZrVOjdP?=
 =?us-ascii?Q?uoV9KRBbuwu1CcKBN3GO+H6DCIihMqv+YdXHb2ahmxgxRAYEZfrFoWEzFyOi?=
 =?us-ascii?Q?mXVYb4wNppROAoetS1Bh/azfPEMcejiYzRUW7LPKZ/XXUidTRDXz+9lA5z47?=
 =?us-ascii?Q?7TAU?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac33b1c-c87a-495a-976c-08d8995286de
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2020 19:18:20.3457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFOV25s5V8wGIlmsFgcgnE5fViDG5SXa8O8wI3MbkwaeJVpC5k2o5bEsC1kmlP5mykIW0v306lBL8Kra1H+gVsWtyO5rKlVBG4K1rTBeklw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1363
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow passing const-qualified pointers without requiring a cast in the
caller.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 drivers/soc/fsl/qe/qe_common.c | 2 +-
 include/soc/fsl/qe/qe.h        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index 75075591f630..0fbdc965c4cb 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -223,7 +223,7 @@ void __iomem *cpm_muram_addr(unsigned long offset)
 }
 EXPORT_SYMBOL(cpm_muram_addr);
 
-unsigned long cpm_muram_offset(void __iomem *addr)
+unsigned long cpm_muram_offset(const void __iomem *addr)
 {
 	return addr - (void __iomem *)muram_vbase;
 }
diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index 3feddfec9f87..8ee3747433c0 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -102,7 +102,7 @@ s32 cpm_muram_alloc(unsigned long size, unsigned long align);
 void cpm_muram_free(s32 offset);
 s32 cpm_muram_alloc_fixed(unsigned long offset, unsigned long size);
 void __iomem *cpm_muram_addr(unsigned long offset);
-unsigned long cpm_muram_offset(void __iomem *addr);
+unsigned long cpm_muram_offset(const void __iomem *addr);
 dma_addr_t cpm_muram_dma(void __iomem *addr);
 #else
 static inline s32 cpm_muram_alloc(unsigned long size,
@@ -126,7 +126,7 @@ static inline void __iomem *cpm_muram_addr(unsigned long offset)
 	return NULL;
 }
 
-static inline unsigned long cpm_muram_offset(void __iomem *addr)
+static inline unsigned long cpm_muram_offset(const void __iomem *addr)
 {
 	return -ENOSYS;
 }
-- 
2.23.0

