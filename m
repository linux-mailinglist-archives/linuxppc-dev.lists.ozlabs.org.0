Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEB974A767
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:06:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=pVGYUvln;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=SHP5oZZA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsbD3PcMz3dTG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:06:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=pVGYUvln;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=SHP5oZZA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxrbG1VZhz30XV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:13 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366KseVo021191;
	Thu, 6 Jul 2023 22:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=d1CQ5cg+ymWg4de690FM4E+Rdcfq30KZz/XnPiCYHJM=;
 b=pVGYUvlnyF6cPN36GKGtP+bmbJa+KF0itcEVukiLL53zDz7PWcz1bxJmV9iW76qBBcmU
 Rc1HRzGoQwX5gURMeI5p4nRg8Fwh2tQP4R/SPHwa3bJRNzKazUMbfvkApxW+RJxa7woX
 8fBX77K0UO6MZUkdrY9Sv0/krAzuROusJpXhCOUy8rxKMv/dsgPWSLygvAgIEciwCZaQ
 zl6N9LmUuoK60m/O7vTFAYe2MowVSC5yj6F4Ibi47ndreqIZIbJT9C+OT49mJ4pu0xO0
 D6b4uYO1nGpwMBZq4xrV8Q4DeBerb9QpM+0SNJuAoVZnVI6MntPEnr35X8z222qwOBj4 MA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp00srv1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:20:50 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KYvI8013438;
	Thu, 6 Jul 2023 22:20:49 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak7ph6h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:20:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XR2tWXOdNLOt5urNZ0JItIhCAcPS0sr57p+0TfILlIC+iIfnhyFMpQU+c4KhlukQOBh6jpmwe+2NnVW3DpVOeiqCDTiDLbFsXhSIQbwHj8yfjO442SPWEaEyDsdvTFXJXNz+lfmn2z4NbWv32pBEBNAZyYmzO/VYxpD6u47iHG9r+HJPgIfVwd/V8wZbgWMTirazRiaCrk5+5gP6hiX0h7ASJC0SdInO+QQ9y1Cohm6YYHjTT/8W0H3Akk21fkGfp8ImyhqXBE6Ex8ejtbcTDdO/80DNlLEHIT14acaMXdmmlaGbdO5Vhc1tzSD6ur1Cpr3OD+aI5kpRskX8y30c6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1CQ5cg+ymWg4de690FM4E+Rdcfq30KZz/XnPiCYHJM=;
 b=mbjKoMcmPDnznU4msLDQmFmdhMl0dZa4SMp7LPtPsWqWPD3BHmSNW2tLFPwfT9V+dd8bppMPiN0Unp2YVW1EykXPhuaGR5bq/w4j5RQAeaacJezJ15b33q9MltJuwvCidUw5R7us+BjXHQC6ZwrditpkqmR8IE8tH3gpV9VT5zW9TZtl0xtrPw/T07ruSmcay69JPRNwpyBcq4IqjaiXZgNNnk5cnGMwvK0PRpoVRroLl5WlwSkjM6uLeIqyAFHeJ01vGf65IiCYdugDfY8vRDeDG4RM/JS+7xXW4FmFVkuJvQ2mDjG7WvIAww97jwkhoqu3AkkqPU5SIJQ0pB0NIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1CQ5cg+ymWg4de690FM4E+Rdcfq30KZz/XnPiCYHJM=;
 b=SHP5oZZArzeLBCuRmOnVxvUm1G17tn4Qs/0hoCMZW+gseOUSFQN33hUON6rAW1i/yGz2tJN25OqNQJszL/19Ny8YkuNkABUablpHNQkX9fW5iJdymWmvivVWfq8I+Tb5AR5WifBnG1CKkyg0zH0p56ISvlL0F5TMlouDF/4Vg7E=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:20:44 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:20:44 +0000
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
Subject: [PATCH v5 01/13] kexec: consolidate kexec and crash options into kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:15 -0400
Message-Id: <20230706222027.189117-2-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:610:b0::29) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: be1030f0-bef2-4be0-d033-08db7e6f3dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	73tmz3dNbEM/5SmEMpMdnxbowDIObqpYfe6yWisZqQZx3nPcIIpVQ0jEnmkwBjQBc/oxNizIa2SCenA0jIjk1dUCqV3bGd7di1Y1fywNIbGad/6V6DfmJnA0ly5g/o4GgGVy6aKuBePyrXFLqrjGofE8SjXjH46Lq3rZtzdL/clHKXDLxz0GSDNDz+5sJXiPxXmnnSSETpp0glN50Fpz+xvL1R0l2tif2Fq6bwPzprwi1oOyDI3tP5awc5LuUMi6YPgrWvM7j8PxN53MhW+LNFlikcJPimpB0DgkJt4KTgdHWPanfrwWGjWR889cDNh6OlKs1SpjgA1Z/WwtMHT3ux+ML7DhC2DZy5PX/06Oueua5xREQ/zt7RQfxwwhCLyCpAnd7+Dwv7gBulYNjxqLXtRXlSkTJIlkpBqf4Kc6vux16tdPFa5sOvjrOZoEklaUCWct+ngcUmDHOUygMSHDzUKrogxcCAUHfPxtWGXUU3dUXr+ntUBGrtn6pA42sKsUAJn8QIC9jRIpK668NBv7O4bWBY/YGm32Jyq/wdhoS77OFFJ2sBZuS+hUqUSj4SBN+R1mKkOfpdPUFUExcgo+N2aKnYzUYg2PkUc+syR7zaA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?tDtvoqPvuadYzcv2EmJY2SXcDKiL8mJjGqeYXysI2Eq677mN1X3WNpXNh0Mx?=
 =?us-ascii?Q?LtKbe1uwQW0hTxcbSpB8rzJhBhQkjFdvFWtMAtIdSuJX8qnmn709ft4J5EuR?=
 =?us-ascii?Q?S01bDKF0efuv7mN2KG9QKbDJD4qFEXdPYSf+SwcgsQICUf7i7aVu4m8MLjxl?=
 =?us-ascii?Q?bqEbp1WevE1Zvu0eou41Ie3YXzzvGE/b12QQlfGIQs1Cks3RHP063DzrNnWz?=
 =?us-ascii?Q?XriL0c4PyQcYBEccLa/J58E1dt1u/JKwe6cgxlp8IQK7WJcshZ1wUxrqTD6a?=
 =?us-ascii?Q?Iomg1uQUngYyct9IoI90ryuLv0cNF0Ak1MYczT7rOX4eYmtBfUpIRJEbg2+W?=
 =?us-ascii?Q?lN44c2+104zf9f52L81RyFarmnvO8+IrcK2g+nimm+JvndZRm+bC6rIFgH50?=
 =?us-ascii?Q?Teg0R0V1d8QCszAoyDsZg8r+fzkMiNiVVAX1jGMYPrnNmJBoE716uKN1AV30?=
 =?us-ascii?Q?1wfdnMuDavJRrvgDpBbp23RjdExsgVt5JWzUF+itnsxVk7176kuXLeE0W2Mt?=
 =?us-ascii?Q?LBaHV3zB/GM2M2L00iYGnXm0YnjTI5s2XVPW8zWanytkw++BtupFJDmD5LF8?=
 =?us-ascii?Q?o3oeNRWpy3wAosdhfAN7k4mEngL/pSTXSpeF90kGWiAh8HWpnGsEDb24UvXN?=
 =?us-ascii?Q?RHKVviW9xMPtcERVmmV/Cp5370zX9gtIEhKF6MOzRUil/3Lys3JYhoIViGbo?=
 =?us-ascii?Q?K5tJLByDvTR+/cXDx0Pr1wn4OqqjEC5MdeADiGxGKe+Gm0GOClwISrQiEebj?=
 =?us-ascii?Q?IIRCH5WIC9/WSGlwadpUj7WXj7dREVtEh+Sak3mZIoIOqLiMOQ7glIH60j5Z?=
 =?us-ascii?Q?WOsT1D/LscX3wQKZ2KsDBMmmpK8qiF4tnVn8dA5GO9GayMjD3mVUOILfNEmP?=
 =?us-ascii?Q?UCUGWUeT7UtEdWiCaovKVP2m8IEUlSFcb3D9tSfjtpjDB7iMeTVVcGTHbbcr?=
 =?us-ascii?Q?tSyp62V0B3FB6eovzflyDGXuI/ElMIG2RZGJoBkkusAud3L/U0NFZgc3Whav?=
 =?us-ascii?Q?MgIWFJcop3NvrVPTu0ZsSfuMP5lHEAnpwdN0/ZsdnwFcmzikpgB3TGA9HUsB?=
 =?us-ascii?Q?IHY45WU6O5frM74uPMjmTw1Qqayu/sK6lAi513m5aPUnK+XqLdxEGkVkWLEU?=
 =?us-ascii?Q?09NTTP4J4aTiAb7fkidIuWmTIQvYeSWiEl7Iibls4+EWDyrBFefMAtnbxWTh?=
 =?us-ascii?Q?d524d4e/cO0FRkyw40QW/KHb8seCNhnefTe1CW5UVpqd4jcMYdEqh5ovfdsK?=
 =?us-ascii?Q?TcFuKZXAaUvMpxI+5eLbXWPk2WZAGouCRLpWJ6WKqPmi0os3DWuCr6PkiPwg?=
 =?us-ascii?Q?5mmDEs8HnSQzETgXwd7acR20M7O/eKL0hua1FGtoSfAVaPRT8GMPkPGseVzr?=
 =?us-ascii?Q?5WGXbEWEZp2L7mA2JAEC5pa713wp/5cpLrHXxmZPpWKstcfLB9zEneolytBY?=
 =?us-ascii?Q?2NOCXOJo9nRNkhbIwV8zSKhyAPcLTTn7RXogcO0PsYe3EBGxTpDnBKaG+Etq?=
 =?us-ascii?Q?97k2lkQndUqIbbvFlUmrOK/l49MPXx5tD6al50lFAQBNTOsWd394WI1XO5K+?=
 =?us-ascii?Q?GvbzyUPR+d9LtxTjF4zVdex8xHzawc9WKXeHe3DdVjEz9TCo6FALBqfio+WY?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?rRPJRAE0tPq2ci0m3Iand4sod2cfrpOnBARiz330feIIH0sjiAnlqdZOOtED?=
 =?us-ascii?Q?xzBWQN2z+6LnnAaiejTmmCO8oIHte6U9ch2FREvOnB66gxiC3jZ3u1ABEuak?=
 =?us-ascii?Q?x3647Vy5de8VU33+rA6M1bxzM4P1ENqBR1+W0Wr2nZV4tsHXZC4FpzVb17Rx?=
 =?us-ascii?Q?2/9dtL7enPt6ARD34Hmml+vtXMddyTlkpmQvhNT7l7E6OJj9a6aANWI3OwnQ?=
 =?us-ascii?Q?/UfCDmNdpRN7CL2PiqMJK9WJ4XOJBKV+Swt7BSFOghCDESDynURuSHhcw4WB?=
 =?us-ascii?Q?+fhCQC7D0snGRqHra+anb4k5WQz/GJtXfO2cIOO56dxAySvSnsWPFKatfv8o?=
 =?us-ascii?Q?nUq7HR+TkYtQDmiNDoj7zM+yPRBRPFSJYVNX1cf3L1FAnHlGA2gm+1KgBrwq?=
 =?us-ascii?Q?rRwojn3KWcYtLs9DQIvUd8SOb7OA02vrjzBacJ68d5QGPc3hx32or9/xrnf0?=
 =?us-ascii?Q?+4UOc4dKUIZavf0ner+WYTv+1LGOBgC58W6phZ4M5629pj90ErwalpftiIsg?=
 =?us-ascii?Q?4JEm18tdssvqse/XW40n+KSXX+9YhVNCZlw6LwFtJ1Fv5N/5i3DNpbUMlzAI?=
 =?us-ascii?Q?1HrlDJXFRcc+mNzxPw5fwgz1+YxmOgOb6fQZ2WL4kQMY2mtojG5n6/OafYmb?=
 =?us-ascii?Q?xh8AhruJ9odfGUllUXxBJCr+7msRAfqG9j2UkYR3um2LcLGgkt3umklABgIj?=
 =?us-ascii?Q?aVVVa/GeyeVx4e3fhpRTmehbI22VP6K3ORp5q2DG1b4/dnCtK7uOX6AxZax/?=
 =?us-ascii?Q?fGLNxPN2Z1y5nhQEkDpKZthEKtTxoDkWL1ueo1cbuABgnzmqszjez8M6DDSF?=
 =?us-ascii?Q?9NmDa3HVJtHOqWoYkJJ3NNzEY3SMvXjGPNUhGK8Bof76j+ygmaGN2A09heX3?=
 =?us-ascii?Q?v8dXKHzXs2WkVIdbe1iRWsgJ0xqm9tJkgav3eKBgzbxIUKrl31qaMakyRgxN?=
 =?us-ascii?Q?AI3uwnO/CpovC0xYhDMUL1DbHQSXgdonsBpTapfIHEjN8pJT9ebpQqMlM8vX?=
 =?us-ascii?Q?cqG+Suctiu3yweeERXtg08qFQBu7jA3INx3/gVNp6vXayuIICxxCnsNPStsQ?=
 =?us-ascii?Q?tfwSa2sq9QbOcmic3zSPxk4HGTqUGOWaJGqxjHk/2vNXY1mF/x8Xc5S7JiXs?=
 =?us-ascii?Q?UyxloWrN9QkZp6BNmT4zTFL/PWf5g7CJQ5tOWtPWLHeZiF6tUoAFKJq54H2J?=
 =?us-ascii?Q?30bo/vlknyTc4rQG9L8jBZYYXexAcuQwsJItFxc7eKVZNMGTr3RDbtqqNKcg?=
 =?us-ascii?Q?LmzJ5A6vA6qMCukN1JUvt4FiBBZfXN7SnNIt6IrpVDS4INEdRqpOScfIACaz?=
 =?us-ascii?Q?XDEz+yFnKKo+l3KUJ2kjJtm6EKLdLhnPMGSZfZYTjXt17oE4x9xBGUDvkM3o?=
 =?us-ascii?Q?ONVuXGKc0/TQrAEK0CSMB9CtF9eJm2bTzhAk7VNKSFrQ30RxKxkFYhNct9o2?=
 =?us-ascii?Q?KzHH+vAM3vzfQLueH3ZqrJKj3os+SSsfwQFkUP6/MmlCuzbnonqQlaylrd9h?=
 =?us-ascii?Q?jsngVPAqtXLBAypCpw1M5vIn1h3dKp82xQ6DpNsmoTy0Q6+6qe8BRjzPjITR?=
 =?us-ascii?Q?vjUotk2Yv7JzHLq3WkSSD/QXgaO1s69j1Atp7YzA2/AZFhz1gpdO/lpmuegb?=
 =?us-ascii?Q?qLJPUdNfuKAXAcWRi7qZmr1cIRCarYhzcLVAo/TxPQPkMpYQWSuiUdQus77C?=
 =?us-ascii?Q?ghvQXNKVLJiA8NHr8JDVD+3sxJvTOlSyfJoyGip8XsY7oI4722uOegqeexBI?=
 =?us-ascii?Q?Jc6s2O75MjjJsHCm+wlrvLxdICNZXVqHrRUKbGq6PiAIFjRhWBw3g4j0OO23?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	S1kXGko+Kks6a1u+yK7PwsO2f3UsQmX0FQfVPdQNH6EbKZ2Y/BKlrdlqZz3Yh1KqJhEnXaB/VahHqJBBuOutNw1kOdBqQftnRAIuxQnnUZt/VuAoEqY6eSSsfcTMG2AREIj8/o4zRbYr6m5tWFI+tVA/poKjMcohUm25yBWcIv1ox7cygEgJ5vlxWKg5lGKgcc595qAYVovgwZyTfaEkhMsCo52PB4+hhQ3Fa415CleFex/1x167hnf4sTd/S0g8GKINRJSQ0ufdonfy6HM4XPkkuDDGdSmqYzZrqu0EhqLKNbEuUME65zkFI0G/2kspZ7ReGDfHmgWMO3ZcI786c9JRKwC0TGRy408pmujfScLTy/PAnGFSybQhzMsNmjHlhG5NsSpMhvsBSt0/VLtqYq0iAHGb3n0i/9zZ7PCZMWTdxaiBDD7NdcMRSMQ4S89bG9ZGab611AstAQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1030f0-bef2-4be0-d033-08db7e6f3dbb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:20:44.6900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StdwRt/9odpxo3NC9UktsNc9ITzBSnmp8W03t/8g+0nq2ttSWLTcCfbf49DGF0USJJRtFHXIlXEGCN3rRPtHOXduUKFD52qaQpDxFH3thdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060195
X-Proofpoint-ORIG-GUID: btc4PUMwZaRQ3JAIiSgSVmcBoy3Qakfk
X-Proofpoint-GUID: btc4PUMwZaRQ3JAIiSgSVmcBoy3Qakfk
X-Mailman-Approved-At: Fri, 07 Jul 2023 08:57:20 +1000
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

The config options for kexec and crash features are consolidated
into new file kernel/Kconfig.kexec. Under the "General Setup" submenu
is a new submenu "Kexec and crash handling". All the kexec and
crash options that were once in the arch-dependent submenu "Processor
type and features" are now consolidated in the new submenu.

The following options are impacted:

 - KEXEC
 - KEXEC_FILE
 - KEXEC_SIG
 - KEXEC_SIG_FORCE
 - KEXEC_BZIMAGE_VERIFY_SIG
 - KEXEC_JUMP
 - CRASH_DUMP

The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP.

Architectures specify support of certain KEXEC and CRASH features with
similarly named new ARCH_SUPPORTS_<option> config options.

Architectures can utilize the new ARCH_SELECTS_<option> config
options to specify additional components when <option> is enabled.

To summarize, the ARCH_SUPPORTS_<option> permits the <option> to be
enabled, and the ARCH_SELECTS_<option> handles side effects (ie.
select statements).

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/Kconfig         |  13 -----
 init/Kconfig         |   2 +
 kernel/Kconfig.kexec | 116 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+), 13 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

diff --git a/arch/Kconfig b/arch/Kconfig
index aff2746c8af2..b2872e9d3760 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -11,19 +11,6 @@ source "arch/$(SRCARCH)/Kconfig"
 
 menu "General architecture-dependent options"
 
-config CRASH_CORE
-	bool
-
-config KEXEC_CORE
-	select CRASH_CORE
-	bool
-
-config KEXEC_ELF
-	bool
-
-config HAVE_IMA_KEXEC
-	bool
-
 config ARCH_HAS_SUBPAGE_FAULTS
 	bool
 	help
diff --git a/init/Kconfig b/init/Kconfig
index f7f65af4ee12..639e8a3363c3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1927,6 +1927,8 @@ config BINDGEN_VERSION_TEXT
 config TRACEPOINTS
 	bool
 
+source "kernel/Kconfig.kexec"
+
 endmenu		# General setup
 
 source "arch/Kconfig"
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
new file mode 100644
index 000000000000..ff72e45cfaef
--- /dev/null
+++ b/kernel/Kconfig.kexec
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "Kexec and crash features"
+
+config CRASH_CORE
+	bool
+
+config KEXEC_CORE
+	select CRASH_CORE
+	bool
+
+config KEXEC_ELF
+	bool
+
+config HAVE_IMA_KEXEC
+	bool
+
+config KEXEC
+	bool "Enable kexec system call"
+	default ARCH_DEFAULT_KEXEC
+	depends on ARCH_SUPPORTS_KEXEC
+	select KEXEC_CORE
+	help
+	  kexec is a system call that implements the ability to shutdown your
+	  current kernel, and to start another kernel. It is like a reboot
+	  but it is independent of the system firmware. And like a reboot
+	  you can start any kernel with it, not just Linux.
+
+	  The name comes from the similarity to the exec system call.
+
+	  It is an ongoing process to be certain the hardware in a machine
+	  is properly shutdown, so do not be surprised if this code does not
+	  initially work for you. As of this writing the exact hardware
+	  interface is strongly in flux, so no good recommendation can be
+	  made.
+
+config KEXEC_FILE
+	bool "Enable kexec file based system call"
+	depends on ARCH_SUPPORTS_KEXEC_FILE
+	select KEXEC_CORE
+	help
+	  This is new version of kexec system call. This system call is
+	  file based and takes file descriptors as system call argument
+	  for kernel and initramfs as opposed to list of segments as
+	  accepted by kexec system call.
+
+config KEXEC_SIG
+	bool "Verify kernel signature during kexec_file_load() syscall"
+	depends on ARCH_SUPPORTS_KEXEC_SIG
+	depends on KEXEC_FILE
+	help
+	  This option makes the kexec_file_load() syscall check for a valid
+	  signature of the kernel image. The image can still be loaded without
+	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
+	  there's a signature that we can check, then it must be valid.
+
+	  In addition to this option, you need to enable signature
+	  verification for the corresponding kernel image type being
+	  loaded in order for this to work.
+
+config KEXEC_SIG_FORCE
+	bool "Require a valid signature in kexec_file_load() syscall"
+	depends on ARCH_SUPPORTS_KEXEC_SIG_FORCE
+	depends on KEXEC_SIG
+	help
+	  This option makes kernel signature verification mandatory for
+	  the kexec_file_load() syscall.
+
+config KEXEC_IMAGE_VERIFY_SIG
+	bool "Enable Image signature verification support (ARM)"
+	default ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
+	depends on ARCH_SUPPORTS_KEXEC_IMAGE_VERIFY_SIG
+	depends on KEXEC_SIG
+	depends on EFI && SIGNED_PE_FILE_VERIFICATION
+	help
+	  Enable Image signature verification support.
+
+config KEXEC_BZIMAGE_VERIFY_SIG
+	bool "Enable bzImage signature verification support"
+	depends on ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
+	depends on KEXEC_SIG
+	depends on SIGNED_PE_FILE_VERIFICATION
+	select SYSTEM_TRUSTED_KEYRING
+	help
+	  Enable bzImage signature verification support.
+
+config KEXEC_JUMP
+	bool "kexec jump"
+	depends on ARCH_SUPPORTS_KEXEC_JUMP
+	depends on KEXEC && HIBERNATION
+	help
+	  Jump between original kernel and kexeced kernel and invoke
+	  code in physical address mode via KEXEC
+
+config CRASH_DUMP
+	bool "kernel crash dumps"
+	depends on ARCH_SUPPORTS_CRASH_DUMP
+	depends on ARCH_SUPPORTS_KEXEC
+	select CRASH_CORE
+	select KEXEC_CORE
+	select KEXEC
+	help
+	  Generate crash dump after being started by kexec.
+	  This should be normally only set in special crash dump kernels
+	  which are loaded in the main kernel with kexec-tools into
+	  a specially reserved region and then later executed after
+	  a crash by kdump/kexec. The crash dump kernel must be compiled
+	  to a memory address not used by the main kernel or BIOS using
+	  PHYSICAL_START, or it must be built as a relocatable image
+	  (CONFIG_RELOCATABLE=y).
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
+
+	  For s390, this option also enables zfcpdump.
+	  See also <file:Documentation/s390/zfcpdump.rst>
+
+endmenu
-- 
2.31.1

