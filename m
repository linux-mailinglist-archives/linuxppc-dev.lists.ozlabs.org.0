Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A7A73EF72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:47:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=uR2YSjOq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=p6n9YqvZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqkz62hw8z3bmb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:47:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=uR2YSjOq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=p6n9YqvZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwp51tTz30fp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:34 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QBO232012817;
	Mon, 26 Jun 2023 16:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=MPkfeFAKDwMPV4ZFrgKlXRutuX09usuRabIfA+n7RpM=;
 b=uR2YSjOqPqbJPKoZ+Rjg/QIa4DMcSmBImzdZD/GsvJ4MMhDyD93yAq282QWMTtq5nPCG
 qazY0yP6hMwIjsJI2nzOkkzsTFGgery10ofQ2K6IekbLll4xktDyVwmGxHLqMRnKqh34
 XjiTvi6M7CC4d9SeVT8YYmw5pQQ3IFOizVwJsITUWjAKFo9ST2UN9nO4Ky8btZPsFW/S
 z7l8VjUizpDy9qULHNZA1Ing1nGo3iXrhYoKOAsApAL1Kvb0KncgFZ7jj50g3tFA0pKC
 cgsfn3HIT7wztH+sXakPxmGgsqLAgCHRr2MKJLOPTr47ieF9ouP3o4eCwzbEM6+0kQtK sg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdpwdb2xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:11 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QFkohq018965;
	Mon, 26 Jun 2023 16:14:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx3hqjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD0V2kl5u/kpdk6AQmxqxIvVKZ/YyaC2VRga8yNEm1QIy0FoTIBp73r5lIQgm1qbSWlD7mJYyJv0Sb3YgcyUOrKkakpYY18v2ZxgRtqFh0BPrKtxqq6De5T/XF+hVMkSW0OmpZXW2OuTtDrmR/S0xQSSkRqf6TtF3FVZutifXjUqbrDnZO/PdJU/xBwGPJd4Z2JD/hJvrADExNzEp4QzlFfr91K2aBnvmUwXWEIhuum1NAp2XWyZ7PMxYd4kBC0eyHhPG9j262OZWmKwu8JE/HSJUoWLZFwBw6vJwnAMEWFeNt0nFRMGkn7knSg0CHBODVcxSePBHH6tWe8kBWy9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPkfeFAKDwMPV4ZFrgKlXRutuX09usuRabIfA+n7RpM=;
 b=RZwojk/WYvLabmR4LOiQfNR/KGK1XFP5d57qDtYn2+D11cdZSTQN8w6AYER8Ro/UU57O0aEiECYmPtGlXOnoL1sEdH0wS06SvHhdiFtRqh/edio610eCccAystRYZ7kREFEVuaErIuQjiHAaRL1x9rTbmVBZNth2/YdEZ9/tMVtT8zbScd6wnYl9/azv1p0Pgxy0sHYFbE8is5limTDU9VCV1LDLpIE9cV8e/WJIs1Hq86js7XIuxKDxYkUFg1vHOB/Z0KajCfPM5CPLF3Whk/CHm8ZBE1znqtCv7jXpMOywrEtEM5Gu456QJW9wlG8PfduBn6h6VnMh+7sJWDx0TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPkfeFAKDwMPV4ZFrgKlXRutuX09usuRabIfA+n7RpM=;
 b=p6n9YqvZ2JSnGEW7KUVoiJ/KKWFyiLfZ4upIqm86thml/Hr3SN3h8QBcDirrOw7tbD+F6GVBm4ni9T6c+ghoUMiwTe+/CCdlbQ6AKYTuM4E70twDHD44My3rUs8Dv/FmUc9c2+ZubG75OUXfbxEFSt6RODa4ae9Z64iOQlRmnfA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5585.namprd10.prod.outlook.com (2603:10b6:303:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:14:05 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:14:05 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v3 08/13] mips/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:27 -0400
Message-Id: <20230626161332.183214-9-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:806:23::15) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO6PR10MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bae35c3-6878-47ec-ee4c-08db76605d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	D6kxhUg6DIwQKu12X4Grh5rpFm5vp7zYZElA8E3i3vQ9Zm2TpC6eQB8Z4ukOA/v0xId0M4EwvPpZBOdYgQfKlieCVep0XhpY0kecxRn4SKVYuR9CyW557qUP7gy9QtYre3D5yEaMz7TTsFuGVoH6h3M5vux8BDmfrcZUfzeBr1HuAIHDa+cla2LFnSlrL+Bwv1No9ioP1mCUwzO63C//4npPqMZK9e3UMgfCtzuUvM7vXhbrKPDZsZ2KgqQlEalW4XfdyEWpAdPGE7DFV3h2p4kxCPR7nISBo+KZy6WiAc0O7sL1yY9/S0gCyPZtTQEBqUh1F2OycDZ8HffBzv6nAOwOhUjusMHT6Qnq1EgoAc205faLVQakTzWOGrM8ygHAdQgl+Y1WD2iJqQYFXbmq7KLwqY7AOoguS6Gy6bQAgvGcwyVlxv2bLw8Hun5fMU7wmG3zkn3qb2UTlhPpQljkTlSofWK1U0+2wzSqwKwDkpl4cuf30zi7w5AxXWDAYybcxq5+LsK7Ojchuo7XGEbL/w5nfLZcnq4ww0LMavMgFWtKTQmog2OQfNV26y4yfi10fqrswP+ta2BoNY/m3MOCCRkw0FPcCMtYRQUM0s5K+rk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(2906002)(6486002)(107886003)(38100700002)(6666004)(921005)(2616005)(83380400001)(6512007)(6506007)(1076003)(26005)(186003)(41300700001)(86362001)(478600001)(316002)(36756003)(66946007)(4326008)(66476007)(66556008)(7406005)(7366002)(7416002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Av5gHOe1zbZLzv54kKgqybeuHxiY9UP/2F5cmHttswnpFDcAcaEtmhGVQfI1?=
 =?us-ascii?Q?XSsRriI0DMJelfdZ1AINSJyuFWJAvoy/M8eBykSs3gmmUsz/GnMWG7UCRWpu?=
 =?us-ascii?Q?NZ7VIKIv5sYVn0JycT2mam2TIXfcEaI3sDJ47vi1VjJOPFCfBJD6c7rq5DPP?=
 =?us-ascii?Q?P3rM+30ppuY0dJp4MHRHSlmz7v2EnDBB8Hda0Qg7hl2SFj3+KmTuUu2jwpq+?=
 =?us-ascii?Q?+5LdBQ9yXSAxyivLeW7Hriz3nuCnqtVp8U8dY7w/+G+HhebwrK7fpfAGwcvQ?=
 =?us-ascii?Q?Yj3IkQbofJYNUgnbUjwr2Q6b4AFEjSZWeejYksC/Uw8Xpq3pO4REGwawK9XC?=
 =?us-ascii?Q?sS2/qcBz9qis2/cM8dO95aJm4W8F3H+Y3q2Rfl2YNUyUlVF3pS5cgjis32zp?=
 =?us-ascii?Q?SbtvSGu7tTVTiG8I7z17LhfBS5lwMRHZaM74NLj3mmHJDy/5hq1GfjHlh3dy?=
 =?us-ascii?Q?JqZIYK44zCUWUaJ/GmO9BdcgNZ0iuv1AZk2e43TtoJ44Cv0yEdY/8lVQAC7+?=
 =?us-ascii?Q?P2f7nHU0ojhau+Z9StEz7d0Ts8cahQ1JgnK9r/w8dPP8LjlicXdzQ745wmvg?=
 =?us-ascii?Q?8IWvo33XK1CHzbfjnNt+t9cXry746sRg2Dp6iSs/RNHJgFvUZMJ5/nZhaEAr?=
 =?us-ascii?Q?Zh/yBsszhkVUidu1w/g2I9QzZov7IZSoISi143iwpkrXPCZ6UV+kceHVxYlz?=
 =?us-ascii?Q?J4O4vNhiVWEdh7MYBMUtqoDdku6cbLx6C9TfUJ74Rke3+4HEBbepaw9l7r3J?=
 =?us-ascii?Q?DIdyvzpLc1RRBM2ufBJiy0O7j+JOYfQFaf55F+8FBVfwd6fbnzjw205Jfwm8?=
 =?us-ascii?Q?hO0iAxy/z1SPUb/j9r32x5KDiIwS0adguVuRK2F879Lb5JKh18ms6qO+cF8r?=
 =?us-ascii?Q?4YROUp1Zog64QiChcfpBpX7wP0FvDFQ8HD2C1rLEZcHISajsBH7ossCU/0jB?=
 =?us-ascii?Q?tyf+3Nt2qxReVt3GnC6ESE9hJI2XCb/+KLiOVml3Z9eqepKErbrpwDyNvqi9?=
 =?us-ascii?Q?8I/upYf+qI5Mr+xLuz3agd8x1I8ED6kwJ/zRubIQNTW9BIPXCS0Uz2+Ruz81?=
 =?us-ascii?Q?wLhpCKkjCE3pxA77ZG0DLqeELHwJIy9WGJIA8JeirJo4coS3Ygjrm4wRmb4M?=
 =?us-ascii?Q?cPjzxM53yXJe7mRzaInPkoUsM3i3VAJDn8OWjvX4sLIsPmry7gFeXhOT67bP?=
 =?us-ascii?Q?27S3/OFXPa8eD0hTe4BMTjozkoAbw7L8II5eGl3yjf+LYCoWgaKdp5jKtEIt?=
 =?us-ascii?Q?xRqO1A8Ps30hLdzC505HCLYnoFAIk79EvnwtzkF0MgPiT1RAKJEVhLnQ7XQN?=
 =?us-ascii?Q?N6Z22pcy6tu8uDHJJmBuZykDBCESZdnH285qD7mTcR+NIAeGp/5nATfxrmqx?=
 =?us-ascii?Q?EGxJPGoCshtWR6ltVCBGIkD3Kh3YqLibxD283/GnrPKyqgJlE+NZTRmFxKBB?=
 =?us-ascii?Q?tVdZ46xGD/bfgz2ZYkgRkKn1pyQy1lzmuTH4upgcjAYbURfTiZmQ6INrsT+g?=
 =?us-ascii?Q?jWLXhzKvRq5VG52WEIQbsg514v0+BTvCwzM2OUGdiEIfyVMgM4M1HjQma+p2?=
 =?us-ascii?Q?U9OMcc5CQXIMnBcs0gn0IKUbxFnqoibDGYw7b02FQN/Yvg7CNjyQOS/pFLUZ?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?ahVuF0nrIZPnsB36KUbZiTP9WCmbgAhKO37JL6b7wJEEbeCmAeQCtXNxBodR?=
 =?us-ascii?Q?xO5/0pKVql0qtDWC7D/tFpH5Tfdib9lG7lQPHCaZXMdPTWN9Q3x+uYnpKxVW?=
 =?us-ascii?Q?LVWlBmO/7L1zcqaRJLOMdnnC3WxjYhTIl3G14nlpqoiQLlLKKuaCTuyoGSRH?=
 =?us-ascii?Q?zwxza1abMhGsoL0Ey+aFm7tCOvLy8AqMuM9/OvTlLEpBXy5+2hP6mTNb4BjS?=
 =?us-ascii?Q?4IdEfJ7EyQQ2A2+jrHdZujYRIYK/O3l8ft3rvUXAZLOZ7pL5StYt+4UDB6RL?=
 =?us-ascii?Q?zjjS2zvDQee13R3b2yrvo4w61P9brY8s6bXJwa6sf8yyyjfCl/0r0cP8W0Qy?=
 =?us-ascii?Q?NAUQVJhHkbEAXiDPs1Y8ypx3wKZVMZoTlesSfXDQvrrJCF9FGxblPcL/ZkC1?=
 =?us-ascii?Q?JbPmqux2lYm9Zl58ZFEMYF8IfZCdPjL3tLpjEpelhCcSS38gK2NvSZz6Nlfx?=
 =?us-ascii?Q?Rzn04p5E92f4aY/6PHYJ4zRMZqMzl6xARnXEf2A9O26YMLRZSkaCPKuRykHt?=
 =?us-ascii?Q?KTVeGqEUn6AoeMRQQzpICIV9iKCFix0gaDv+YOsqZlt2J6if+erWdZ4T7Nnd?=
 =?us-ascii?Q?I3bqiEEEaEFN1TtBhcB8WwLt7aQtu2r8h+DQRdJVIPr0hrxFC4iJxxfnbhtC?=
 =?us-ascii?Q?LqtewaaaOrMGZjeKtJA91zMIWJ6q0tW5ejAdkR8oztivIhCZ+E0ci9iE6fhD?=
 =?us-ascii?Q?6leuoXTezCwy84NQ2qB1j0nb8P86f0V/mHRjhG+MROihEPa4Jg/0CdbFzmfI?=
 =?us-ascii?Q?yN5ASIhpb2yV9e6oiCeKlVgHtz1xYi/uyxU3h7w6MM2VRDzNNBGBsbCXiv89?=
 =?us-ascii?Q?MAatuOGChtIUjMpq2cBDyM/3hZqxgme2oYKGLxJjAySXpjMN4PwY1K0jDpXv?=
 =?us-ascii?Q?VX2LqTq7gVGjwcm7ON/nMgKt3LU94yHx2Z/zxDp26fGEu0NrH1XD+L82XwGq?=
 =?us-ascii?Q?f73VKeny6kqpoGqUiMHh+tWZwGhXtwa3i6IFeZKMezT6qzPFNUJYqIRliouM?=
 =?us-ascii?Q?0xyo22WW+DvrE1ouUlxonloTFtsh+81mfCVOH8eIFFnQAX87S8Mqb4IEjcmw?=
 =?us-ascii?Q?pldLyE7Bl9026CmSwpKUIQ1K3SudwV90GuIfijhZyg7G8st3V7EaRUZJFmPF?=
 =?us-ascii?Q?WOOWsekd70OC9IezUK003Kp38qTO8TZVMYV6rfZeq93ePct+9j209JFS5Tze?=
 =?us-ascii?Q?utP1nFRjvdFSCA3R7Y6F2O43Nwd4vVcnjie3C121ag4SLEKXs6fQnhOf/oN3?=
 =?us-ascii?Q?wi7iQtxpHjL2CCzZjJgB/aZd82Oj3t1o4xDqtCztWEJSz91ebjjd0jZ1TUhC?=
 =?us-ascii?Q?VxBtdWQdnhEqcrdy2JulEk6XMqFh+sCJtsaVVHya5qd/H5RrMOvXRA7aBVWY?=
 =?us-ascii?Q?qoPjhY6ZY36WPlFVUBhTsyi3S9R3BdRq3ddEmFOWTJOV5pVM4QEmeW84IZjz?=
 =?us-ascii?Q?+7hXmy8SN7cQrbFFyPNZIoO4ccMFZUnO0ik3RpSN/BVkoxZYRCddsG1u1/32?=
 =?us-ascii?Q?fOHOf+Xj4iMxoeFGsjhXk0SXQczS+BImxc4IrPeulvkOEpBUahAyBLngXv12?=
 =?us-ascii?Q?CZleHPnVc7oMWX9LjF6UXPpKIrIhSlv3M1rDHu0lduK7zI/1pI6kZyaeFNWc?=
 =?us-ascii?Q?eFMlmslOvmZPyeg6/Qjw9KM22KRO5B04ysti63O/gWuplEQ6oCStHxJC4dLA?=
 =?us-ascii?Q?Hp+0rbMPrFH9zXMXmc7iGJ1uiPve5nXjPywvC8k6pNPgRhhkzN1A4+UkZdTb?=
 =?us-ascii?Q?5s6sh6kTD4B+MJWLJaPrSPFhetCN2hSTOgUPkcj8OLoIznyygt1MgNNLZGMF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	Nt2w6qQMYyJgG7VPAtOxXP1wHT5AFEtj5nFr7eQ9BDKpCM2xhXpmCk81+qmiVKDX+8BPfnyZ3mmQJK5lQ7F7ERxhfyNFvtoKWneQqmX51nbx/cTpo3zvUKfaP4xSy9+TKz8hxEkHD+cJzH3L22anFHMsMTSMPEtHDVoU9O1EJb08H2nWz831nyxfGjEse/qGGbdhsXZxtjecIsU3+KVkqCTTdU0PsuxiN8YjhuzbejJ39Qjy30hKLiLEmaUSO6t4ZBLgUyRiSUz7Vxh2YtufvKODLH3UidTqplpEcblmaBfMhGwlEhlXFcXyPCW48fClSgW/tP99VMpEbbK9jM0rgem38HSj0jawHqAtrlrWZkRvG5qtuA6ZEdYpDEkKj9Vz4DdW9CTnUb7+p5ajgwW/fMM34tVRtjB5isbsiiHPNMXi2Cz+wUm6BfSnqqJUqubVIXjW2efieq9SgA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bae35c3-6878-47ec-ee4c-08db76605d13
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:14:05.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRtWjyadBGj+XyFWuK2Vj/Hp+zA55ZkW/u0oM4ok1OY6pucvMIcwe4JPOFXq0+fLXfzt3YcSRqtYsLvjsWFQz+PJSz7eGdLx+6+4PMTo4NI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5585
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306260148
X-Proofpoint-GUID: l5H2bLmumQnqmTnsi46CkCzGQIODps-5
X-Proofpoint-ORIG-GUID: l5H2bLmumQnqmTnsi46CkCzGQIODps-5
X-Mailman-Approved-At: Tue, 27 Jun 2023 09:38:37 +1000
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

The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 675a8660cb85..3d9960942cbd 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2873,33 +2873,11 @@ config HZ
 config SCHED_HRTICK
 	def_bool HIGH_RES_TIMERS
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  The name comes from the similarity to the exec system call.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.  As of this writing the exact hardware
-	  interface is strongly in flux, so no good recommendation can be
-	  made.
-
-config CRASH_DUMP
-	bool "Kernel crash dumps"
-	help
-	  Generate crash dump after being started by kexec.
-	  This should be normally only set in special crash dump kernels
-	  which are loaded in the main kernel with kexec-tools into
-	  a specially reserved region and then later executed after
-	  a crash by kdump/kexec. The crash dump kernel must be compiled
-	  to a memory address not used by the main kernel or firmware using
-	  PHYSICAL_START.
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded"
-- 
2.31.1

