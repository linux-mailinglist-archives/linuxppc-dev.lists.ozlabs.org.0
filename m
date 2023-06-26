Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422473EF6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:44:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=cVeWDyo3;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=MZ4gfQdx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqkw51Dw5z3cPh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:44:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=cVeWDyo3;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=MZ4gfQdx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwZ1Qb5z30f0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:21 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QG3SMQ026860;
	Mon, 26 Jun 2023 16:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=u2NI100u2alkXMbO4/NzkFor0ha3sl13nz89+TbUZD8=;
 b=cVeWDyo3LioAVOkRpx/ZZBXfQivm/ficjMPFI2tPR2WDEAJR1FQRgu+aoP6cKedRvTB2
 5xPxeVbZuUmDC46Hgvc0AQ88Eopo1PtzqVF/+vjXIWpnILDfGRnnSKrP9G4ntkcAQtkM
 P/iNOMGQNUvzxyqIdoubpwpgEJG29tR2hv27K4c+X9bUSplvogq3+xCvoAEKucIq5qVo
 QDgl/t7DGo2Gz8bB9Gu80C1cu8e+eX+ddk3tL9tQRx7wmFGERJ5ywMqSYrSPdv/z53PL
 J+AbrnfGjMZKv9xN68quPOwQm9MElJCTzapJzewmKSjAu0HJq9GJvhCljWEJZhXQEbv4 8g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdq30u6jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:13:55 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QFGssg026410;
	Mon, 26 Jun 2023 16:13:54 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx9syk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:13:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTgyjniIs2F6CqtERrXT2nOYMtb0DXLSYGRu0XXy2hz0JMonjQiq7wnZAtxkmoGPF1EwHtN38fW6cDHw0J6OCIL3eJek4bFvSwAJ3C6aR6TnGC5qFCDfNXo/03raScKSeuJDeD3yiDa26Til/rdwzQnBwbu+HFjNiTt36GZ5gdW5akt/H94QpENSVIPDKzrwDd4jMvN2SPLWS86boWyUKOxfFsEFTixnHzgXrr1lt3NIhxnJu0ws5PSAV/d6mas+C7UN9vwba+6fl9NOJj8RxxR1O5W031z+ARudoohiHu2swrM1co1Bg4M1ErdFsuZsWKQtanmjxpPB9fTwKXLMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2NI100u2alkXMbO4/NzkFor0ha3sl13nz89+TbUZD8=;
 b=EflSttGy3ld+kdugb4GSGABlbpfsx5QHadg/KQqG1EAcxZJlXbOgTTkXojXcS81mGSk2rVPA6SQroNTdxeY0Fs1gCkKp0w+0wwBzlZY8XVLlrL3rp4aSe3PD9aVsV57l36opv1YF57ddlz1V83IKvlTLUtm5Ynb61U5TPijxddEbI4T1KFz3zQQ4Uv0yNvMv3EUoRQlUDEKpyX1ZRI1ZfefgfEbkbINtY/qoguAQHvQ0+1Ror3OYokw2G9/Pw9NeAlOuOrGjy8YvKLpPJgXjSewvzt/Z3G2TfPYEHkognDExiNBacwUL+atniJsYXlF3oYA98UvRVi52sWejPRY4Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2NI100u2alkXMbO4/NzkFor0ha3sl13nz89+TbUZD8=;
 b=MZ4gfQdx6C1LhWEHxJBfnvrlcoP8mThEvweE8CWG0D2Ps8MTuAwEbIcNosZ/J7tHBz9PIgB37IEdh5FKuscgV9joY9IwvTKyQawTa2U1vRaXPqO1JKlx4VoMX6Q+bJGI4odytPahB+sX4ufh6dwL9TSrdmIWnx4j4b+HFufaxts=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS7PR10MB7178.namprd10.prod.outlook.com (2603:10b6:8:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:13:50 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:13:50 +0000
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
Subject: [PATCH v3 03/13] arm/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:22 -0400
Message-Id: <20230626161332.183214-4-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:806:125::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS7PR10MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: d82f2b86-ecc5-424b-13ed-08db7660542d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	F0xhov10BuCerRy8kIoJOw9Tksfa4lxS4pTdQhHtAIwBblpYfYsGcCx3L+R3u9pFB6m5H4CSBwIHEkGMZFzFwlICKaeg+Ql+5BqAP6gxSiZfS2Zzoh04rZAp5HG1TtvzxIDfDioDSGThFWD7NafUWbaW0y1ygXegvKbdtbbWZC9zfn3A+QOm0U8FV13ocYhWQVCyNoGHOOXhfixRrxcU3+hQW14WvNQ3tX4/xTIu5cRTWvGPr2JggEBBDZ+XTZukyfFCLzqEsTCLr07uS3B8Ohn0STuBePxbn8GCKoof+L4+QrmW8LPzDSGiXQYo2mla9mVwfQN1PLccEPI8axPjoCatIzwfKYFxfT3qFkl0wZsahzCPKbSMRHaVw/rlBSd4Kt2qpEZrSFEayrJbuBuigTGFRVQyY67n1a+c9rE+9wF8lMi81AbrTwyzdDdbBq7V/yokr6bmU6b2dxOTrecY9SjHynLUbZZguGulUev60/H+GPiQQt2YJDzyrCI+lCz3twgoZLF/T3lT1k6BXBz5SGNa9KjZu2K7GAbp5PDzcEMo6p2ag9NoM785vaNyXLnddpKtq0IsN8E8gkk9TABbpUa1r/9x6ZqJgmDYzJJGRXg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199021)(107886003)(6486002)(478600001)(2616005)(83380400001)(6666004)(26005)(6512007)(1076003)(6506007)(186003)(2906002)(5660300002)(7406005)(7366002)(7416002)(36756003)(921005)(38100700002)(4326008)(66946007)(316002)(8936002)(8676002)(41300700001)(86362001)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?eeR3cBcTR10yB+fQzdu+3m8uhK7sVE6glp3dFVIZSGGsNQxtx4WopN1BpDRF?=
 =?us-ascii?Q?id6rCI/a4PdOUwcKMz2gshiLNCgQIWvWxY3LgkYSS13oDUq8eGNrWDEg8jwF?=
 =?us-ascii?Q?YNjIlfroK3pketmDvwNiWvG+lAY+QwBPBIHJ9SiH01M5FMJ5RAaw4nppeLmJ?=
 =?us-ascii?Q?JAd987lx6lVQ8CuiVrj88tYx2c0NIEAJE3GBXWqEWJirQtiVY96oT9NO8qH6?=
 =?us-ascii?Q?wrcE/KmIt+DXJrTJxKfLw0ydRfuUWWEULo0seSK8NFJ4G59bTQRr+pDXAS9t?=
 =?us-ascii?Q?YTGV2fdeKdAtnH2u8o6LkncrvJzP+X/8HEadT+tVhyMp7IdNKtSwnK50nAwX?=
 =?us-ascii?Q?tNvBqQrQyFbz2F+BgPwermGW2XxUxaev/T0i5Gsan/9ajz55baA7TfOXIZ9O?=
 =?us-ascii?Q?iOSUxg25HWjGrpr2+AxC/FJH6cY2OilaCohEUn+UlOK6HmWUyIMG588y2wkd?=
 =?us-ascii?Q?N9024E8czYK6ipbcw2+23yPaLFGO5scEHvs2rh11z0RT6Div5l1KugYDgFNK?=
 =?us-ascii?Q?77sVLWWypdkz6FA9eylfRb53E5c9yVxnR4xpRoGrjkh/pBZP6N1mtkoh7p7I?=
 =?us-ascii?Q?LxpGHx0Vv48Mj3ulXae1jMgmcycWwXWvbzYKEumXJ/wAMGrm76AxcPVzHd/2?=
 =?us-ascii?Q?kk82X3MXiZzGlcXpLDISJyYQKwVPQyqh4TNN8m2qMNDppe/SefrwzGgxIhNP?=
 =?us-ascii?Q?+VRUZixMPz97mxu3RmVK1fiVXXu3DkewOvd5POSIg65bmkOOP84tPIha9TC9?=
 =?us-ascii?Q?MxInvZTCepPkN7NOCjWbkeOdvuuNwvzkfkF2Ol9QR486vRxnzXUFJW98Cvbs?=
 =?us-ascii?Q?ussQ6K2SLdvBqalOIuxS/D73GHKZnXiI3ejXTg0TbVCVJBmANJqbBMs7tC1V?=
 =?us-ascii?Q?Os0CGhXyndc2/RKATD6A8He5OHhsBoWHyyfrG9uPw/qJJQcKG6++HaT81BvH?=
 =?us-ascii?Q?ngDl5zlG9ZJZmO7zy5Uc8klTPutfsnCB7QWvryI6DkvY1BkuFNdGtBDD7C81?=
 =?us-ascii?Q?dy9bCHYSonPxBzc+ynZPwNZyQMfGwK0/VMBMmA0nzY/fV3ZwJyKURXOO9A0m?=
 =?us-ascii?Q?YflvDCX3lWoQREuNmXv5Tnzr2DVmHwuhGaNOPWxhQEJo1NTRzeYyVRj++wwk?=
 =?us-ascii?Q?Z1TPs748Er4Qft12u7tRZER5eS4225H+c2UFAibuCjJLOUXiXtXrYsnCBOAv?=
 =?us-ascii?Q?fpHhCuu2nagHHsCE21owRRKIP7xW9hwUXGO56QYdIrh99j560wN8YVjmxhRj?=
 =?us-ascii?Q?uqJGxi+Au/+yX4xNBClXKXJw9BcEkybX+D4wsi1k5S8IdQepbP2caxB84wqu?=
 =?us-ascii?Q?vaCZuItTnDqUPwzDOUsvNVSggndzQQqninzgt4OHeqYEf0GLLR0DnuzN1u4m?=
 =?us-ascii?Q?t9PjCVNa5sbWMiyPRDc/lAI0KZPDO5kPCWGUN5Wq2Oa11181dWtsm4sW2W4x?=
 =?us-ascii?Q?afrqCDioXChZr0AJUknD/+EpYTBTZ5klrpyh8a4TP/9VLbvP4phCewwKNprk?=
 =?us-ascii?Q?q7WX1LW9HDL0Q+iF5ZpxaYUssthSw9POIU/+pChv9kx1WUpy4MIoGyuUzCsL?=
 =?us-ascii?Q?yCVTDWSLA7HcheogVnCPbw3aYN2oSEhheGX/8U1SOFa6Mo2xxBPeSiDimpeP?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?dUPTR8BCh2VHeVKRpQ0cgWK0JKLVebM/pI0V2VTIDQXYpbgv0JBNiC/UjIez?=
 =?us-ascii?Q?qPjEYfa+aGab572E9Zi5Ulr79Xzf/8AloPJTx9UO7a8WUFt88OnRlXydjvqc?=
 =?us-ascii?Q?Q06uuHr2XLm4XJSaEe0pdVLWSaDUKWxayhX4cWCVda+ZVmr2DPlZFn6f+uqc?=
 =?us-ascii?Q?dt0UOI4OW83H6ajV0C3az9OyfC0mB0IDoZNcAYVvG8CQhnuXbM+ZcoQzy99P?=
 =?us-ascii?Q?SsqjMgycttW+eHvKo4EVVqHVARvgm75m20FJ1ru1MTUd0J/6y8SsYi7YCKXJ?=
 =?us-ascii?Q?R6WFyUmCW6F1bQCMgwtHbVjWPGRSoTvPI5zk7bebh/4b1SWrxsfkqovpuhh6?=
 =?us-ascii?Q?mqnZGXUjHgpdmRWXo4Up9aPcIDmBZWAAWSjj7xcQvCQjj8x62AVM5UlNNv4q?=
 =?us-ascii?Q?JjFoOeFS9W8F/aRY8GT+8ReiepuWm8RlFCZiRkPTaWiBc1GOLgTNo4Txwr5s?=
 =?us-ascii?Q?kKLwFeZQmDh8StRU71NiNVHGm3rzwGqsqfNNAjCo7tBj79oCcwwxk6DD3isd?=
 =?us-ascii?Q?o6CGhzvBz3//n0IdMspSFW6nkw/xWkz3kZ6ASrIdx9uo9RjzY/nCAbC+TocS?=
 =?us-ascii?Q?ErfMtvl/0TStpvL5fnJfsC98JJqlC/laARlcfs73SErILNMFiS3klgXq4YF0?=
 =?us-ascii?Q?PtbdaQAz77UzzjdDPKEdhrPZpGSfQx3o2eqsBJAY7j/Bk9wR78WpvNiVmotu?=
 =?us-ascii?Q?EJ+NyQNd8PsBC8ABly3rkk9f4y9+fq4Ju9WzKZJ38Izr9oA8HEH5quP+jDCQ?=
 =?us-ascii?Q?N4Js4FZen7iqPa1JeqtbrFX29MkwBOIwcK1i99k4AZZ1MoEK3jFuet7iX0gO?=
 =?us-ascii?Q?F8u53dVv5fi82CkOQXFqDWFiWmEZZOLrJcOErzQQQFGQx+23VKmwwMq6WHKv?=
 =?us-ascii?Q?sXzA0J+iJ2rsrCVzFfSSZD8X3iijx+lU/WH93whVASNeVN6re5QjRC/0+Mlu?=
 =?us-ascii?Q?fId3T5SOEMKJhtoFmtb/D7Kpm5z/2OFgpW2wtLsXJHBbdHMkh4dTOKjyp1ZS?=
 =?us-ascii?Q?soYAhY/B4dTPZFDTRFJJ+ZT4hIDr746I3gS0viyKE0YEEpkpqy/NfhrZGEXo?=
 =?us-ascii?Q?JwViwacNbOFVyVt+a1mdsY2bie2OhHrOUgAUguMkeFBUAyCzfdIx6hfOK7UC?=
 =?us-ascii?Q?4R33yYdwp4DixdiuiZmvGNIDzPEB2wwVqSY1hXNnePWsNrxSu5dAaYFS/Gtp?=
 =?us-ascii?Q?qI8Bwf67dCe4IDuEaievi2jUvK3PlYcxSCU5HJ/UJwRwbz6/kQISSv3D0Cze?=
 =?us-ascii?Q?wbHv4UiLA29W2aCGy2VsGYMWBfSouE+Bt0qHfmYhbKFXFaVMg8LCX112SXXX?=
 =?us-ascii?Q?zHAPoTybJHHYmN45eUSuYydgh7Hc/7ojvgBgQNNw894xVNQZuVvZnxKabZf1?=
 =?us-ascii?Q?OqS68x8mPYStb3iNuoAILkHmXvz11Ux3C7yyunyZk8aqybNDaClb0IvqEQnJ?=
 =?us-ascii?Q?HDRoaX7HkNlf4g3R11MBZhQBvIKq6vA/D/aOHMUtIUEcTpncMXXFwec/b+7h?=
 =?us-ascii?Q?XD3hCdLZRWHGOc5ym1cMBcUxpHq+K/1axge2u/eNFkjCuOVlp2SVwk1jg/Fa?=
 =?us-ascii?Q?AQR0U4eSna2E+yaBUV6mdtxCzfWNFlTwcQb960WRGx5Lphafh9e4WjQhBuTU?=
 =?us-ascii?Q?dpO43EsL+X8FrUFCbxCNRNMWOMqhyYGOKXj/515GrDcY/DhANOkn6A/8oWvR?=
 =?us-ascii?Q?a50lv1qZDHb1ZvTelL9PNf35MWclckYK2JDvsB3EfVCvbiwt9W9wIsaZyezB?=
 =?us-ascii?Q?HRPZeSbVJhqd9RtQvw8rQEwgWUqBdEH3/vGX/g73NVpGlintCTAaGw3aX61c?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	I7tyXjhffxeaUX9pMvbsyK3JYmroLogvVX+IYl1uJrNQlBy7UgqUq2yN6kh2/JBcyWWaPlh/sWiOnACOhjzxEH0QQGz8QJDbRhLV7sL38M2izmPICqRaLxxAwFVtqz4Mz1j7ui+8VXRvkcfoQ16hjADJuBcMlmj5u9t7fbh1fbNU3sEkOAoCgf9BbMn24fAHYKJoIhAZ+S9wyyfdtw+SC5AOwnRhWgJhD7Oz6gyAo+1B2LkA6lNnZ8uxsHLv1ZTbqWZm8eDVJAhEkfLE7XNvrzJpvagVSLYqMs8hK8GAXgl4tF2zQA5EgHpM1a9pOFK+UDEjWuqItHTQe2U7rakRi5iIru78EFlr9f+VJscaU5WgyGfcdo/an2+D6Nl8ZRlithttXXk3LXwxMkj5i0Hlb2R3T33K+gOq1JWXddM6yEzIcJ6wLhPvBc7+dXzS976NqGsubfEzyDp1vw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82f2b86-ecc5-424b-13ed-08db7660542d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:13:50.5742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trT4luSzpmYHZYGOGiZ0AHCYT5a9r3zoxCedjCwc5LXPoLYNGROfnkYJw1E2qdVu/hMlQ34TaTx0S4Mys2dGap2VaCPlG51hQQxYz5N2Gzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260148
X-Proofpoint-ORIG-GUID: -h6Vep_wazF_Ub1sN5PKqk0xK4324DwG
X-Proofpoint-GUID: -h6Vep_wazF_Ub1sN5PKqk0xK4324DwG
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
---
 arch/arm/Kconfig | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0fb4b218f665..6af0105407af 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1639,20 +1639,8 @@ config XIP_DEFLATED_DATA
 	  copied, saving some precious ROM space. A possible drawback is a
 	  slightly longer boot delay.
 
-config KEXEC
-	bool "Kexec system call (EXPERIMENTAL)"
-	depends on (!SMP || PM_SLEEP_SMP)
-	depends on MMU
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.
+config ARCH_SUPPORTS_KEXEC
+	def_bool (!SMP || PM_SLEEP_SMP) && MMU
 
 config ATAGS_PROC
 	bool "Export atags in procfs"
@@ -1662,17 +1650,8 @@ config ATAGS_PROC
 	  Should the atags used to boot the kernel be exported in an "atags"
 	  file in procfs. Useful with kexec.
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel (EXPERIMENTAL)"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec. The crash dump kernel must be compiled to a
-	  memory address not used by the main kernel
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config AUTO_ZRELADDR
 	bool "Auto calculation of the decompressed kernel image address" if !ARCH_MULTIPLATFORM
-- 
2.31.1

