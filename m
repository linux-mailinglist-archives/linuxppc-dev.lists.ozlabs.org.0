Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 134B872D014
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:03:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=dqQiZO3M;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=uD0xfMyx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2gs6wlsz3cJH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:03:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=dqQiZO3M;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=uD0xfMyx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg0DP4jwyz30BQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:13:24 +1000 (AEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHOHL2004976;
	Mon, 12 Jun 2023 17:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=UQ1EtoSFF6VEAIpCeRGrEoZ14NhzzOwMZTfGYtyD96g=;
 b=dqQiZO3MfgmlJHTe14dIpcLTM7wcBW1/dHHVYOVyodlqdhqz7on/qVvzt1gdxb9x8GNE
 J0L4hfwCXQmdej97wKv3Ib0oIlkDX8vC/pCO/YmNtCkgFhW43mgLn/bh2WU2w0+wYVly
 E465RGASMKOOpZzWSZeF7hUzuKlOAJCpnYHzHBQKWz3PTnk/DKaLB/64kAMRslzxqF7+
 q1PVX+dUGkVN7UJvq1Fca8N2Jpx3De/gCmcL++qFmFpfh8O9nmdaDNWo+CIUTjVGMEdS
 +CsZpFtrFMmdla2yrsDSHigWHyqf5BYS8G9mpGOhp4KJSfIIHwRxZ9uTmhJtS75B92JP 5Q== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4g3bkjny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:41 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CH4Ml1016344;
	Mon, 12 Jun 2023 17:28:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y0u-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcKyi087Ez0PnmCstn0HRSci/0KCjlR+TSBRg17zMWZEUYdZr5panMljrlH3aSfPhactqbwm1CJJLqME/WmSq9aJ+rbSX4pP/T/ZVU795WotQ/ZfGLfcKlypQNq25ugLqkTMDPRId4mwAi1GbuunaoWrHk65DXIy8l4pRwSeGWLs7EUn/OfigFUmAyr9uRh6syDSAjlPtYH0X6E7w7Lje2x/hQKXSZKsung9+y0W9rLrhpdBY9hNd6i/eLT8Zu6gkSdAiT2H4Q90v92an8JDFOSz3sBBBetCBQarlm2Li2hKE3PTkOc/h6IXNYauuUeqkXPvyCacM/qZBYmk+tL/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ1EtoSFF6VEAIpCeRGrEoZ14NhzzOwMZTfGYtyD96g=;
 b=n/06Ii0xez02M41kzGYDHHaiEvOXBWp6QFgMa9PV641VCQ2NJGPlY1Pxpg9MUMyqE7q+QufIF46NQpOYAEU0rjbOiYxtiMA5K5Tq4JrKP5ZMksE0B3LXtP6CfdzNEmDPKgwAtcjr+hkV8rvCBdLDCFwOBuuj4r+RfsDCmHufRqp2/rpQRGykaSlD08HEArtx1MiXgWMHUagHSO07N0B4XBfjixPM4CVms1+h228ia6RCdOTK7oC4nSCo2pxFxpWeHvpFGsIND7rcdvjlqksUq8h/kKPG58pBM3d/lB6iIC/BkHdyrG47CJdIWhUSuU3y2k7+zq21cciFqAcItvuCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ1EtoSFF6VEAIpCeRGrEoZ14NhzzOwMZTfGYtyD96g=;
 b=uD0xfMyxJNayxiT5TzKJGjHHwz1vKQpARcX9jXbbX8bMS4Xr5aAnt8h3g8E8QZnk6E22cUTqXgmBik2f3xNPWaaIKOcvd9oY5MUa+Xc+q4BjtCHshbwgZwHjGRQaWlsCnS3fz5mxilXZFJa028y8cZ72vpBNQ6NskBCfy/oMiqo=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 17:28:15 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:15 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v1 00/21] refactor Kconfig to consolidate KEXEC and CRASH options
Date: Mon, 12 Jun 2023 13:27:52 -0400
Message-Id: <20230612172805.681179-1-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0028.namprd11.prod.outlook.com
 (2603:10b6:806:d3::33) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: 8edb41f7-f1c4-4d3d-479f-08db6b6a6760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6ICJx/j60PsYhcVAbjEvSsvIErXvARMIsdJyI1LiLS9r78yMolqbcPFKREruuF4OYxoSIFBPsy+gZPqks6DEfVVoLd+N6r1Dy9uUXMIFuwk+FQV5sLZGe2zZ3QNiEe6f0kZGclJjJabaK9UT+tOLKru77QoZPzyHEbfAwaVVxToikRYyD46Gz2Mg0Vxp0Bt7Et/1AKS79ZVGvU5q/fgdMqw1ck4jwEYLhFBxfFtmy3HECCWQhB9jj7XBymmvIcrKxyNKkYCIjtSUZ4eSYp6ZKpRPdl5xJ58TLklHhVdzFnHZXaRObt2mtARjkr14njNkiTFxUmnsF6InKAVj+YUPfogLZNB0pnBeG8YRgHBTpyxnk3nG2J7hXlAmu5vDjpn68uUl6wbslra7R74ARI8lmk+9WQabgvdcNsGL4VaVpTHh7ql+dllG7nbBhF4+Aa2amH7jYM0odz1S6XTw+YklSXSPjgYffQH2kpwxUq+Y1N4u6bTr5E3MrcgK60s49figpaUSdeT/4DZThpn/R54UjfXulCwLQ941LJzhHpG2gqz7ZbLz+V9vxNzjTn0JcGcqundZsMumcEbutvDjsanqNN6Kpu06yU0CS+2Xj1GhD8EN+Kyagr1CXNXXnLuRNplf
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(66556008)(66476007)(66946007)(6666004)(966005)(107886003)(316002)(4326008)(478600001)(86362001)(36756003)(6512007)(6506007)(1076003)(26005)(83380400001)(186003)(5660300002)(8936002)(7366002)(7416002)(8676002)(30864003)(2906002)(6486002)(7406005)(921005)(41300700001)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?gP7R+InWkzgQOqGTeSYuGNBiH7iderwHfwrhCSv/bUeRTuREzN26RemUG78x?=
 =?us-ascii?Q?MtMZCL1DfSOcIP3KBtkG1fz1+nAOhXcW+Ph9XpXLPCYbBSThIVJPR2Psq9Zv?=
 =?us-ascii?Q?RPIvKwpngFoJDOKmYQqcTQad+k6bAuMRVI/P5MBLMyTRB9zq4ECTbQYlhChr?=
 =?us-ascii?Q?G8V9zwfllqo8K32a9CdvNOdyTIdjLHnlyT5vQwSm1O0bSC3ju+QJkGzkyg1S?=
 =?us-ascii?Q?XqAhROgFTnEoPSlxh634UkJOo8mEkSsqSyViWro9keYAktS9nUAEHU0Rxc9E?=
 =?us-ascii?Q?/zu51KVr/NOB9JFWjAs1ndmyu44a9tMjyzChbvpOxZSR+xvbM4lrbgVp83wl?=
 =?us-ascii?Q?J7cVd0rlrLLZrmxnASCctXLBZxu4j0dKrU9F5jnqirDuzmc+PPeDucLwwuGg?=
 =?us-ascii?Q?sQDfhxDhtoEqB0tQgTtxGlXx7YzRWFB+L53bbeFLnO3o4ISQPRMFDJc5Pjpx?=
 =?us-ascii?Q?OOhiJr9jF33Ye6XfBctXHhhFxlLZSxN+cgLelFbLu8pvluBADc0Mm/1Hirua?=
 =?us-ascii?Q?3vdnhLC2zAvEiEAffM7I5qriB5ybOUefJW4TT/J8WZwdWchZb/1q67FgXTec?=
 =?us-ascii?Q?cZDos6BMCQ8PBlwyTDUmMoPiEMkZ1bJXbQuZNP+AEQomh5zcOskWVLswa1qx?=
 =?us-ascii?Q?F4eTd4t2NaYeE3MNSoLva2hhkL2DAfzu9WzWq/SCAxaPkquOx24XUOZJY2UK?=
 =?us-ascii?Q?Igm+PuLKYEUGsgEpZyzyKozwA49VwNjns+KPPl5rcHje2Mevv8uTa1zaFkiC?=
 =?us-ascii?Q?FecYwS6NT0rNkoIUjeYk9B+bQ/diXOGZ87tPzahzP6WrCbuYQE36IAhgfRO9?=
 =?us-ascii?Q?ZIs5rCJyL9DZlCq2PvLBkKq2LxTJfqJCmXt4jWnPgh+x9BoO3SPiReKIcYRk?=
 =?us-ascii?Q?RKquaLMU6VVBTo4YRAb4n2qk4L2zbKMbIBspQDW3EYasbUVCc4jQJK/Q61Z7?=
 =?us-ascii?Q?dvIPyMAUGiY4IEZImVcpGDvVsrGmJZfAtbNnnL11zoLFzkYtqZmEHGoQN9+I?=
 =?us-ascii?Q?9npAPQvZtTJggosQTf7IszVBf+AIjzIcGN1n0ExsRMQBrcjs9rKDRdDR9lbg?=
 =?us-ascii?Q?wvasuoZkIdrO4zukrS8Ld0GsmVoLHaOSjg3PRuWHXQ6IpqRrr2CeBDXP4pD3?=
 =?us-ascii?Q?eVvlSs+ZkMSCrBAFY5+o0FN3/HXC+mTEmQExrbtRiz7uLeMhORh0EcPNfAtX?=
 =?us-ascii?Q?XNwVmuumHDCoOQBela7KAvSecxS/AGW4+/KIsGyiwLOSP9Xn0RjDuoAIiQIb?=
 =?us-ascii?Q?kmDrkCRk8wxLlk5vqd/1L/FlkRHrRGcPhaCd91fsajOUwi638qzRTSGS9C/e?=
 =?us-ascii?Q?ZO77qhZIP+r5oabgLYNkhIJ4VUHjuXCIlqGRu4T276a5Ss94/firSN/0YJcH?=
 =?us-ascii?Q?WHMTzNlHaF/7FQUIpdOFezLE/kieinv1IBmOI9gGeLNzkGgoh0FOK36wwz66?=
 =?us-ascii?Q?E9z2IXuWAYUBX9xcMcoMR7SY97ZcadEqV/QB/GdXGRHBBfgmxUzAkvhnQvOk?=
 =?us-ascii?Q?496bS8fi2gdZMG9gORgbgl0K8zoaa4VyT6it0EaTshRulcUNTRZIz59cH8fy?=
 =?us-ascii?Q?xhweLk0cbk9WB6WvIcADbeUfNXEdmUleWXXyY2W8pg9CYmt2Y/SY/1q9Pk6Y?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?NQKEe9oB6j3u2vRAK2LzwK7zh0j+xrHJYP57EUHRqFjEdxfHLcFiN/C82NaW?=
 =?us-ascii?Q?RATI74B4i8q30u8ulW8J9FUn1R3XMUDdCjsRLmAxU/1nnZd9EZG3+dxGLnod?=
 =?us-ascii?Q?0l1N0JBXEng8u10DpmaV93uZsw4IpcljzmxPCfQbjYNc7v2F7+5cVgy8sa0T?=
 =?us-ascii?Q?XGoubJKsUsAn9zz+5xWdkTODtvRXl7xXtIm/VbrUzF4SCGzxWT9K0eBzgMaM?=
 =?us-ascii?Q?yNz2co1oqazE7BM+hfSRMdb6dXyeysohtX2iuce6DhvSdHj8OQj8kX3Ux8Bj?=
 =?us-ascii?Q?AX4dDpGFCYCIfLxu04oCPZGJoUL4QqpNmDcL3zSA6KYTb/N6B1v/RbrIjqSd?=
 =?us-ascii?Q?LUVsp5lNU6KM1YqyiuvEzIEJSfMsLXRPfYqEbcN1NH8pZFc6kwlZpvPXGKho?=
 =?us-ascii?Q?VxJW7+qvcrV1hhRypftQyws66XWH5XdFuANqWiDD3tk2Z4ZBKp6tmyhU5iAY?=
 =?us-ascii?Q?13PrCCOUkG/oTFzRtLfrgYifG1H6FcypkjI8OgsszoN94erChrg+xsrDBI7x?=
 =?us-ascii?Q?u9YzPs7m7wxjFXqGyIDaTn88CjRlCIZMneacwAEXaeoyjyUqlyj2fPRds4yU?=
 =?us-ascii?Q?4F2u+y0MN6p28fKToMwX+jHJ7EQKHjVfEeNCU6/UVwUucPV1O5//bckwNxnN?=
 =?us-ascii?Q?32ocsUPq7E/lNPPFUM4YHztQ9TxWSdAzqbyn8ivyFFYcbwBGsFBIro7wz2Ut?=
 =?us-ascii?Q?w3aTME8u8KcFuW6T25GGghTFxdjmOVO26ACr1MPXKoI6BM+TGQQTBY6Pw5C8?=
 =?us-ascii?Q?rzj1yeVTa2IbNZEpJDoD2JgTRyMTCV/ZmVKILKWI2idmkVr6CHnz5TEErY1V?=
 =?us-ascii?Q?K9fiOvdxZGGXUzdg8SP+ktOT8OKnwdOp7vb8Qjw5v3za1DXW9mRAofc6bKeO?=
 =?us-ascii?Q?hYy1sni042zDwXBN/Cle+rrzUBb0LXY+/ie5jLK+lVUH6Q6dhcbLF1OvAKOt?=
 =?us-ascii?Q?d87S20N9Lw0DCdJMDaELHycCc9g5KFDXHZ0cWUU2Oidf+MfZh4wvIpsOpJqj?=
 =?us-ascii?Q?kLIwIBTo8cK+1+52V7a4Nm1kuSLtLtwEI5KepCa5Rn1q6CK5ggW4yrJrF4Et?=
 =?us-ascii?Q?jiAFGfCW7QfwmWxSmm4cheDPgdy8VK2jiPyMXN6gQg2CMqcpyA3lFS7HcQBI?=
 =?us-ascii?Q?EzkFrMzxtdUOQxc5wW+AO7vzz9HAE43t2Xfds3COYbRt+0/UvlmI+vmoFle+?=
 =?us-ascii?Q?H0LuuT07hjNqsIpGQtyRxMaiIWt5xJwgVYws2SbnoqMcgWqNIHRJTEXNDDDC?=
 =?us-ascii?Q?7h5YZXi40Uy0g+tBLIfvSF1zhAP7uia/Z2Mpq9mvVIRG5m6G23d58zgl2mpt?=
 =?us-ascii?Q?gSRRsSJb3yZtNl0bahXY9LuR83l/x6A7d2OmxBuxZz3FBprLaQ/GexcZo0P+?=
 =?us-ascii?Q?pnJnayW79jv2LsdWgUrXykuh1f7j81uIHQ13uj0FWWcYSfk/7iIkf+ObrPRk?=
 =?us-ascii?Q?Z6rYUyo7IRZIm6PyosY3jd3RXsrYgUoB9+i70jQpeMe//rvUMhCx2ryHY2KU?=
 =?us-ascii?Q?vsfxh+6ixbXadSQqJzBYC6xLq+LQah81dgIzMbTocguw/xownZOm+EXWhIb6?=
 =?us-ascii?Q?mS3zM6bpcUkhPuy5j5Lny8wnozlxyfZUWV2SiXLAy8F4wXeU3spmBKKQOCFW?=
 =?us-ascii?Q?g/hysUu/uVqOshKMfVpJzA6ooxJMIkkX8jh3WRKqTziDU8qCmnSyEWs+FLvW?=
 =?us-ascii?Q?5g3p13koPok5q5q0iOvB+x8pzs1447dnboHgYvLBtB6k5uYpnRZDLwnpAKqD?=
 =?us-ascii?Q?S6V3gwFoQjKvdt1qn2JmGfd/zcPh/Cvly+TwUv6jELCnvvABrd/11dmH4sjQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	SQ0fwUlpOTCNSqrAiODFf3RQCLwuGMfY22iSIW5uirX19/0rfDgKUeJpydxWJ7Yi9v0KudxR1mzew1ooA8z2bnsmwRJI2lzRRaEkP3Yr+pElRTqTl3BqpG5ybnvF1xHpiLfrzjj2HR6AUkMAssO8gnc3Bzmo5WRZkn7O4xQfk/B12HjDO/8eDvCftpsAS5h0ve5FIJn1TJXFdcY7GsRAk+iYZa+dQjMjqQos2m9w8xW5VcdSdLcRJgII41giQ5fhgMTihjIWqJTayrNjbDe5TZAZ9T3akb+4AGg+WXqoQLC1TluimGAdbYP5AYje1aMmSt1NQ6kvold1Ns8QFt9ZHdWOSu3mCQJX4XuB2Ywb16CF6N481n/F6wPGEAlRQN3x8JAjQS1C3BUYNjoxmS/SSkio6Op250RscyRYo1IklmCP5/hjCBu+0HML38w1JxUUVSy8Mv2fALewIg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8edb41f7-f1c4-4d3d-479f-08db6b6a6760
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:14.9727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/v9fb7OcLIQGpABj2lNlTiwOOnkjggrUYXzsEuIGtABMGtnGczWCdHQtYiGaRNpPzateFqmkCP2Dhs7hgF3drqkerGh5/p2D2bpOskJ5+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=923 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-ORIG-GUID: JZylBnPhuTcQ40X3OuS9cpgo1Bpwsxdw
X-Proofpoint-GUID: JZylBnPhuTcQ40X3OuS9cpgo1Bpwsxdw
X-Mailman-Approved-At: Tue, 13 Jun 2023 05:57:01 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, eric.devolder@oracle.com, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Kconfig is refactored to consolidate KEXEC and CRASH options from
various arch/<arch>/Kconfig files into new file kernel/Kconfig.kexec.

The Kconfig.kexec is now a submenu titled "Kexec and crash features"
located under "General Setup".

The following options are impacted:

 - KEXEC
 - KEXEC_FILE
 - KEXEC_SIG
 - KEXEC_SIG_FORCE
 - KEXEC_BZIMAGE_VERIFY_SIG
 - KEXEC_JUMP
 - CRASH_DUMP

Over time, these options have been copied between Kconfig files and
are very similar to one another, but with slight differences.

The following architectures are impacted by the refactor (because of
use of one or more KEXEC/CRASH options):

 - arm
 - arm64
 - ia64
 - loongarch
 - m68k
 - mips
 - parisc
 - powerpc
 - riscv
 - s390
 - sh
 - x86 

More information:

In the patch series "crash: Kernel handling of CPU and memory hot
un/plug"

 https://lore.kernel.org/lkml/20230503224145.7405-1-eric.devolder@oracle.com/

the new kernel feature introduces the config option CRASH_HOTPLUG.

In reviewing, Thomas Gleixner requested that the new config option
not be placed in x86 Kconfig. Rather the option needs a generic/common
home. To Thomas' point, the KEXEC and CRASH options have largely been
duplicated in the various arch/<arch>/Kconfig files, with minor
differences. This kind of proliferation is to be avoid/stopped.

 https://lore.kernel.org/lkml/875y91yv63.ffs@tglx/

To that end, I have refactored the arch Kconfigs so as to consolidate
the various KEXEC and CRASH options. Generally speaking, this work has
the following themes:

- KEXEC and CRASH options are moved into new file kernel/Kconfig.kexec
  - These items from arch/Kconfig:
      CRASH_CORE KEXEC_CORE KEXEC_ELF HAVE_IMA_KEXEC
  - These items from arch/x86/Kconfig form the common options:
      KEXEC KEXEC_FILE KEXEC_SIG KEXEC_SIG_FORCE
      KEXEC_BZIMAGE_VERIFY_SIG KEXEC_JUMP CRASH_DUMP
  - The crash hotplug series appends CRASH_HOTPLUG to Kconfig.kexec
  NOTE: PHYSICAL_START could be argued to be included in this series.
- The Kconfig.kexec is now a submenu titled "Kexec and crash features"
- The Kconfig.kexec is now listed in "General Setup" submenu from
  init/Kconfig
- To control the main common options, new options ARCH_HAS_KEXEC,
  ARCH_HAS_KEXEC_FILE and ARCH_HAS_CRASH_DUMP are introduced.
  NOTE: I went with ARCH_HAS_ due to the existing ARCH_HAS_KEXEC_PURGATORY.
- To account for the slight differences, new options ARCH_SUPPORTS_KEXEC,
  ARCH_SUPPORTS_KEXEC_FILE and ARCH_SUPPORTS_CRASH_DUMP are used to
  elicit the same side effects as the original arch/<arch>/Kconfig
  files for KEXEC and CRASH options.
  NOTE: I'm open to a better name than 'ARCH_SUPPORTS', perhaps
  ARCH_CUSTOMIZE ?

An example, 'make menuconfig' illustrating the submenu:

  > General setup > Kexec and crash features
  [*] Enable kexec system call
  [*] Enable kexec file based system call
  [*]   Verify kernel signature during kexec_file_load() syscall
  [ ]     Require a valid signature in kexec_file_load() syscall
  [ ]     Enable bzImage signature verification support
  [*] kexec jump
  [*] kernel crash dumps
  [*]   Update the crash elfcorehdr on system configuration changes

The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP. In the
process of consolidating these options, I encountered slight differences
in the coding of these options in several of the architectures. As a
result, I settled on the following solution:

- Each of three main options has a 'depends on ARCH_HAS_<option>'
  statement: ARCH_HAS_KEXEC, ARCH_HAS_KEXEC_FILE, ARCH_HAS_CRASH_DUMP.

  For example, the KEXEC_FILE option has a 'depends on
  ARCH_HAS_KEXEC_FILE' statement.

- The boolean ARCH_HAS_<option> in effect allows the arch to determine
  when the feature is allowed.  Archs which don't have the feature
  simply do not provide the corresponding ARCH_HAS_<option>.
  For each arch, where there previously were KEXEC and/or CRASH
  options, these have been replaced with the corresponding boolean
  ARCH_HAS_<option>, and an appropriate def_bool statement.

  For example, if the arch supports KEXEC_FILE, then the
  ARCH_HAS_KEXEC_FILE simply has a 'def_bool y'. This permits the
  KEXEC_FILE option to be available.

  If the arch has a 'depends on' statement in its original coding
  of the option, then that expression becomes part of the def_bool
  expression. For example, arm64 had:

  config KEXEC
    depends on PM_SLEEP_SMP

  and in this solution, this converts to:

  config ARCH_HAS_KEXEC
    def_bool PM_SLEEP_SMP


- In order to account for the differences in the config coding for
  the three common options, the ARCH_SUPPORTS_<option> is used.
  This options has a 'depends on <option>' statement to couple it
  to the main option, and from there can insert the differences
  from the common option and the arch original coding of that option.

  For example, a few archs enable CRYPTO and CRYTPO_SHA256 for
  KEXEC_FILE. These require a ARCH_SUPPORTS_KEXEC_FILE and
  'select CRYPTO' and 'select CRYPTO_SHA256' statements.

Illustrating the option relationships:

For KEXEC:
 ARCH_HAS_KEXEC <- KEXEC <- ARCH_SUPPORTS_KEXEC

 KEXEC                      # in Kconfig.kexec
 ARCH_HAS_KEXEC             # in arch/<arch>/Kconfig, as needed
 ARCH_SUPPORTS_KEXEC        # in arch/<arch>/Kconfig, as needed


For KEXEC_FILE:
 ARCH_HAS_KEXEC_FILE <- KEXEC_FILE <- ARCH_SUPPORTS_KEXEC_FILE

 KEXEC_FILE                 # in Kconfig.kexec
 ARCH_HAS_KEXEC_FILE        # in arch/<arch>/Kconfig, as needed
 ARCH_SUPPORTS_KEXEC_FILE   # in arch/<arch>/Kconfig, as needed


For CRASH:
 ARCH_HAS_CRASH_DUMP <- CRASH_DUMP <- ARCH_SUPPORTS_CRASH_DUMP

 CRASH_DUMP                 # in Kconfig.kexec
 ARCH_HAS_CRASH_DUMP        # in arch/<arch>/Kconfig, as needed
 ARCH_SUPPORTS_CRASH_DUMP   # in arch/<arch>/Kconfig, as needed

To summarize, the ARCH_HAS_<option> permits the <option> to be
enabled, and the ARCH_SUPPORTS_<option> handles side effects (ie.
select statements).

Examples:
A few examples to show the new strategy in action:

===== x86 (minus the help section) =====
Original:
 config KEXEC
    bool "kexec system call"
    select KEXEC_CORE

 config KEXEC_FILE
    bool "kexec file based system call"
    select KEXEC_CORE
    select HAVE_IMA_KEXEC if IMA
    depends on X86_64
    depends on CRYPTO=y
    depends on CRYPTO_SHA256=y

 config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

 config KEXEC_SIG
    bool "Verify kernel signature during kexec_file_load() syscall"
    depends on KEXEC_FILE

 config KEXEC_SIG_FORCE
    bool "Require a valid signature in kexec_file_load() syscall"
    depends on KEXEC_SIG

 config KEXEC_BZIMAGE_VERIFY_SIG
    bool "Enable bzImage signature verification support"
    depends on KEXEC_SIG
    depends on SIGNED_PE_FILE_VERIFICATION
    select SYSTEM_TRUSTED_KEYRING

 config CRASH_DUMP
    bool "kernel crash dumps"
    depends on X86_64 || (X86_32 && HIGHMEM)

 config KEXEC_JUMP
    bool "kexec jump"
    depends on KEXEC && HIBERNATION
    help

becomes...
New:
 config ARCH_HAS_KEXEC
    def_bool y

 config ARCH_HAS_KEXEC_FILE
    def_bool X86_64 && CRYPTO && CRYPTO_SHA256

 config ARCH_SUPPORTS_KEXEC_FILE
    def_bool y
    depends on KEXEC_FILE
    select HAVE_IMA_KEXEC if IMA

 config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

 config ARCH_HAS_KEXEC_JUMP
    def_bool y

 config ARCH_HAS_CRASH_DUMP
    def_bool X86_64 || (X86_32 && HIGHMEM)


===== powerpc (minus the help section) =====
Original:
 config KEXEC
    bool "kexec system call"
    depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
    select KEXEC_CORE

 config KEXEC_FILE
    bool "kexec file based system call"
    select KEXEC_CORE
    select HAVE_IMA_KEXEC if IMA
    select KEXEC_ELF
    depends on PPC64
    depends on CRYPTO=y
    depends on CRYPTO_SHA256=y

 config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

 config CRASH_DUMP
    bool "Build a dump capture kernel"
    depends on PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
    select RELOCATABLE if PPC64 || 44x || PPC_85xx

becomes...
New:
config ARCH_HAS_KEXEC
    def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)

config ARCH_HAS_KEXEC_FILE
    def_bool PPC64 && CRYPTO && CRYPTO_SHA256

config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

config ARCH_SUPPORTS_KEXEC_FILE
    def_bool y
    depends on KEXEC_FILE
    select KEXEC_ELF
    select HAVE_IMA_KEXEC if IMA

config ARCH_HAS_CRASH_DUMP
    def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)

config ARCH_SUPPORTS_CRASH_DUMP
    def_bool y
    depends on CRASH_DUMP
    select RELOCATABLE if PPC64 || 44x || PPC_85xx


Testing Approach and Results

There are 388 config files in the arch/<arch>/configs directories.
For each of these config files, a .config is generated both before and
after this Kconfig series, and checked for equivalence. This approach
allows for a rather rapid check of all architectures and a wide
variety of configs wrt/ KEXEC and CRASH, and avoids requiring
compiling for all architectures and running kernels and run-time
testing.

As such, I developed the following script to compare the before and
after of 'make olddefconfig'. The new symbols introduced by this
series are filtered out, but otherwise the config files are PASS
only if they were equivalent, and FAIL otherwise.

The script performs the test by doing the following:

 # Obtain the "golden" .config output for given config file
 # Reset test sandbox
 git checkout master
 git branch -D test_Kconfig
 git checkout -B test_Kconfig master
 make distclean
 # Write out updated config
 cp -f <config file> .config
 make ARCH=<arch> olddefconfig
 # Track each item in .config, LHSB is "golden"
 scoreboard .config 

 # Obtain the "changed" .config output for given config file
 # Reset test sandbox
 make distclean
 # Apply this Kconfig series
 git am <this Kconfig series>
 # Write out updated config
 cp -f <config file> .config
 make ARCH=<arch> olddefconfig
 # Track each item in .config, RHSB is "changed"
 scoreboard .config 

 # Determine test result
 # Filter-out new symbols introduced by this series
 # Filter-out symbol=n which not in either scoreboard
 # Compare LHSB "golden" and RHSB "changed" scoreboards and issue PASS/FAIL

The script was instrumental during the refactoring of Kconfig as it
continually revealed problems. The end result being that the solution
presented in this series passes all configs as checked by the script.

Regards,
eric


---
v1: 12jun2023
 - Initial
 - Based on 6.4.0-rc6

---
Eric DeVolder (21):
  kexec: consolidate kexec and crash options into kernel/Kconfig.kexec
  x86/kexec: refactor for kernel/Kconfig.kexec
  arm/kexec: refactor for kernel/Kconfig.kexec
  ia64/kexec: refactor for kernel/Kconfig.kexec
  arm64/kexec: refactor for kernel/Kconfig.kexec
  loongarch/kexec: refactor for kernel/Kconfig.kexec
  m68k/kexec: refactor for kernel/Kconfig.kexec
  mips/kexec: refactor for kernel/Kconfig.kexec
  parisc/kexec: refactor for kernel/Kconfig.kexec
  powerpc/kexec: refactor for kernel/Kconfig.kexec
  riscv/kexec: refactor for kernel/Kconfig.kexec
  s390/kexec: refactor for kernel/Kconfig.kexec
  sh/kexec: refactor for kernel/Kconfig.kexec
  crash: move a few code bits to setup support of crash hotplug
  crash: add generic infrastructure for crash hotplug support
  kexec: exclude elfcorehdr from the segment digest
  crash: memory and CPU hotplug sysfs attributes
  x86/crash: add x86 crash hotplug support
  crash: hotplug support for kexec_load()
  crash: change crash_prepare_elf64_headers() to for_each_possible_cpu()
  x86/crash: optimize CPU changes

 .../admin-guide/mm/memory-hotplug.rst         |   8 +
 Documentation/core-api/cpu_hotplug.rst        |  18 +
 arch/Kconfig                                  |  13 -
 arch/arm/Kconfig                              |  29 +-
 arch/arm64/Kconfig                            |  61 +--
 arch/ia64/Kconfig                             |  28 +-
 arch/loongarch/Kconfig                        |  26 +-
 arch/m68k/Kconfig                             |  19 +-
 arch/mips/Kconfig                             |  32 +-
 arch/parisc/Kconfig                           |  34 +-
 arch/powerpc/Kconfig                          |  55 +--
 arch/riscv/Kconfig                            |  48 +--
 arch/s390/Kconfig                             |  65 +---
 arch/sh/Kconfig                               |  46 +--
 arch/x86/Kconfig                              |  90 +----
 arch/x86/include/asm/kexec.h                  |  18 +
 arch/x86/kernel/crash.c                       | 140 ++++++-
 drivers/base/cpu.c                            |  14 +
 drivers/base/memory.c                         |  13 +
 include/linux/crash_core.h                    |   9 +
 include/linux/kexec.h                         |  63 +++-
 include/uapi/linux/kexec.h                    |   1 +
 init/Kconfig                                  |   2 +
 kernel/Kconfig.kexec                          | 134 +++++++
 kernel/crash_core.c                           | 355 ++++++++++++++++++
 kernel/kexec.c                                |   5 +
 kernel/kexec_core.c                           |   6 +
 kernel/kexec_file.c                           | 187 +--------
 kernel/ksysfs.c                               |  15 +
 29 files changed, 900 insertions(+), 634 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

-- 
2.31.1

