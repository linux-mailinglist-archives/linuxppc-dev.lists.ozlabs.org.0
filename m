Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFAC75138B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:30:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=RunnQbr2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dwxxILvE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XWM2Nypz3bcP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:30:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=RunnQbr2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dwxxILvE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NCc3Y5Tz30fl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:27 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEivGE032760;
	Wed, 12 Jul 2023 16:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=nfEDrZd7EQXm6NM1e/l1VGGqAZu6A0rCB1qepLkeU9M=;
 b=RunnQbr2eCyvE2xhTtP5MowYmrTlEyWu5ZX08z7iTydhwQWkER8BOPSpqJg/h6z2it4d
 r5bTEPs2GLKZR/w44cXSGUd20HuvymC0+6L2P9errU2MiyFSh8sQ2S6wVHEpWZ4XG1hP
 GXZIuI4yeoyVvHI8Zlua0GErVpVjL9sD4/spJCssRq3u4hIh9YBe0z571GX02cfk7Inc
 oY/MoNPMnNP71Yr1gJ+H0AnK8cLyIzzxbd+PUvxNrvdYdY33xGguaTgCEnYYhUMRuGfq
 RoMhW/6+MUE/1pHsEe69f9UQ0exC1I0QJaCAX7KXo8OiExux/FjFM6W3Suy6qJOBRVaz XQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rr5h169sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:01 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEp36J008307;
	Wed, 12 Jul 2023 16:16:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx8d3qhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:15:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNPDtk4cFouxKLVc4u2d0WWBU6MFtISi9RZblsgBLwBG7bVWZCIuPD4ZD6lg0cOCJMv+obcAhrIjevQ/nPCyG4WB0ppZT4JwfDpPrspHM0WPyYO5ZVeF7w4JOMR7tP0Gx5ZmsnAH5MixhhaqKYMKcp74Jn+OEe6Ove6BY4zHFtexHAnio7hI096+h24Kc9HIXehyM99R0qg8D5t0DFYY34BaZYQ+ILd5A2oL7iskMauL0NAnbT5kQSSD1GhkGED3BQ8LDZldFY9iyIomJJHsABG+JwmAY1ZPYtFw5lcT2OFOpAA2CypMhgOi5LwII+X7oOmHWI5KBD1AA7qFC4iBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfEDrZd7EQXm6NM1e/l1VGGqAZu6A0rCB1qepLkeU9M=;
 b=Mr5XziMIIFFtHPR5NcfDWYRcVQRYYeZUFLnVEsKpXZyPKMp2aOykoYiaY4SDjonkQ0v2+XsTlyBAxP0USTdG9BiTbxmRskxMirGVJyHlv0l0BKocSi2B+3onEhHx8edCZbHOTBsV41vchpM1ARgzi4Ev5tbH+dyC69xNDOmVb+sawnYieCVnfvHd01Fp03bDg1RERTvczYCxRZI6PtnsEym7+JYzNLFof8TLgxU2bVCc/OzV609tY90xN/fvV1Lh48ncUT++U5n/DfpTqGCJe6G/0CmLzoLfno17if/kWism3FNxV8HwcYLJpG7HHmz+jPGo6+xPvhXrfXuzMFXQ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfEDrZd7EQXm6NM1e/l1VGGqAZu6A0rCB1qepLkeU9M=;
 b=dwxxILvEo+Qe3klm4ZAhL6sz4Nko3Af438Roa5XZw8Vd7XI+KSD5Jb6esfj6HEROuJWGB41NwpVGwycHGunDwgXSHbFdnfdaNDpRSvEctXQ3B9RHzXPTTaZ51uTlJ11/YrwbEmYsZWkHgdmXJk4UD3SQxUrRlOqyaIFZk6GP/Cg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:15:54 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:15:54 +0000
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
Subject: [PATCH v6 00/14] refactor Kconfig to consolidate KEXEC and CRASH options
Date: Wed, 12 Jul 2023 12:15:31 -0400
Message-Id: <20230712161545.87870-1-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR07CA0058.namprd07.prod.outlook.com
 (2603:10b6:4:ad::23) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 866146b6-5123-4d64-ee5b-08db82f3444e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4QDiPSRWW3AnM6OICTt36L82qfM9IURoNpc0Qy6ttDc6acNsV/4h9u/mcjuDUHQmnZiJ/f8zFN/7w8Z/2XAfyGI4FVNCmXXAtcZ1D/IyNqd3BGToHeaXIZ9oJOYeok+itqoMd1xqDeiUtfno8su5G49luCsaGGNTyr/X4aosY6YhOMGw35JHVZXJwa//QBXcsDNIXCuUq+c8Ua2WJyHk+0zc0GX38U/AJS2aeKVT3tUKyIS58Q52NLlvGDpj3p8O7gG2c/NnfXFW69WWzxfXlNdrB2bX9RwMnrqSbf4J0z3q3rBuoGGLwyRVtbJ6B5X/H2yQzoLwlH35SOh3GfZ6q0ENeh2yEsmV+5csHqInpeBJR6qOEmRa/6nOaWHO8h8N1ZGHdstk6I/zG35lmlz5MvoOk3p/aXPW5W5/jMyNHlvMz6TEQGPzdqCKAlGmYrKkUrRk6Vo97qDeh8NLG3YNaOpxzziYXleWdLsxByrPTb26++3yfmRZWDiLqJuONpqA0TpZQiX9FD607IehpfOezQW2mZlRiLt93P2r9AkZCa3yE9cB4LJXjUp7f/prFsMrYN4kVtAcIX0nrK67ufjndERl9q3IScBUdkdvw7ehLB6dctIAQbUOGpKvATc7+w+D
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(38100700002)(478600001)(921005)(4326008)(86362001)(6666004)(66476007)(66556008)(66946007)(6486002)(6512007)(966005)(316002)(41300700001)(186003)(83380400001)(30864003)(2616005)(2906002)(36756003)(8936002)(107886003)(8676002)(7406005)(7366002)(7416002)(5660300002)(26005)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?wQcPLy+zAcwor2mbl20I/Wx/Bd+auL/xqao4AUGP7H1b0DVOh05zmoiTHV1N?=
 =?us-ascii?Q?lHgzIzyejwjH5sm74NL3lGIyXMqkPJKEqk/rVrtJM/pEIEpVHJnH4I0a0/uh?=
 =?us-ascii?Q?Dcs0btIH044/SaUAO8ZCXAHObr8n6m+AebFwldNQHCgw/57K46E9EDzYbfZa?=
 =?us-ascii?Q?EOiXkHhJaoyRR2EvA3CmymqbrowgVM3sZU6rmwtrsuVNU40Ngy/kCRj5vaaB?=
 =?us-ascii?Q?MlmL1gnxTiJZYg88PMJPUG6GQpVbYLKkeUuSdYq5ln1NroBlxnwpdGQpxyMg?=
 =?us-ascii?Q?UPyxTodZBLiGV+VfNH7bG99tv2Ek5DcPMXXwHs2rxwsfHuHjZ6XOEcTorRQi?=
 =?us-ascii?Q?tFXsNBLsWiuzpLysJJTXRLhpSM1kyLaaFLz9RrmTomBS36eldv96X+oIS1ll?=
 =?us-ascii?Q?eAfJ0H2aSt/VUBBpis4yezgDsIK5vYSeaMD3t73jayW+AhWEYH4xe0BsWyjJ?=
 =?us-ascii?Q?RyFPpB9i+ajZXk1QDzWfCgVrIf1lvPOjqd7E8m5d4n1iTozCZI05MJ4ODg37?=
 =?us-ascii?Q?+mrA70eWfe+K/lXE1fJEWJ1QPEKttECfDNfjW+ccUCphk41N6KzBbymMRArx?=
 =?us-ascii?Q?pNmoLrDDtWenaGR+8EArMGzXvCtvm4S5gNZGq9MByvGn6y5BHx80WiQBBlsL?=
 =?us-ascii?Q?dlBaM2ycnbe0kPviMEEJxTd8J73k5VGIlTev40+oS3YDFwolE05ujpj4PhUg?=
 =?us-ascii?Q?wJ/phvDPY88dYZI9L0nCsYT+DgnMhTpJnTnE/bQ31tJCeYvH59IsQngM/f/I?=
 =?us-ascii?Q?liXBhVQCiLi7GgI+dhUoHxA5Lj8JhP1n2ox9gkNG+dig9nXyA48gDdRvpbsG?=
 =?us-ascii?Q?Mq9qx/sWF9HsB48YHraNHoDflnYhOHi05QEBspJg592jAk166c4Xl7GuWuTM?=
 =?us-ascii?Q?1vKQOStDpbANnObtVnNVt7XRJ0BOnyWyTWdUnQBP9S5FvTNJ7ixWA1cylETz?=
 =?us-ascii?Q?WQbnE9wBugaQwYfOnnQfccTSk5pJlBk9l2Y9QiAIEBjfLKCsp+sMHj7Op2Ha?=
 =?us-ascii?Q?ZUDC6vL2NWgiG3OKlnCDlS7r+T8WmR16F5V6cna69t6eWd6Gndapkp4fF19L?=
 =?us-ascii?Q?k4FgTVFucMFxdEuRpCcmL08G+7k/oXUH36gQ5C3BvgWwxkOrGclEmi1nFXh2?=
 =?us-ascii?Q?APbaS9jroxJmS5mZzLzyxKynZODi+2iFwbnjt5GCpkyYWFj2Hav2eP+kYCLi?=
 =?us-ascii?Q?ZfuNR55LnivinBmDL9yUql+lFb5d3ZLH85WXqbzjS4StB7gaLWQ8ptc7aFLd?=
 =?us-ascii?Q?mHs8z1an41+xVCm8JIAVoNFf59YBZJL7cyQWzUeL11ZvFpcXYM8wZ+Jjoaqf?=
 =?us-ascii?Q?iR1+rXUFEYrNABhQp2GLAUE4tObCc2cOZKbvnGOrdPufatao2b8DvoDba/rn?=
 =?us-ascii?Q?xdDYIFucZ58ug7lvSwvbSb0iBDPh59Kl8V3VwDIwlEX3fzEYhs6IAOAtgYdb?=
 =?us-ascii?Q?KN/AhROhDHLeo1Peaj2bAaSMaYhA4QCxopteDJlQ2OPBvxn5NGQAaIHY8xQm?=
 =?us-ascii?Q?8Ilp9Q7KsBchrC/TJ/Kbj52SqkSNd1pvjxJ1cfgiCPDFko5kKxiwJAyxgvxH?=
 =?us-ascii?Q?alPSgmUFtPwVhXQ9qkiBze8bHN631J47Xd86ZTTHUhIxJC14KZzS3l8r6UGi?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?C7gvJsPBpF+98kvf8NVLrEJdjZ2F7KWg9EQCp2MgDLsg8Hq6PEL9nHX8967g?=
 =?us-ascii?Q?arTKwb0VsoKmNTQPvda4eBEDfD5Lw+2tTYdRCElKVYdda7xlOFfL4YHtNJ+3?=
 =?us-ascii?Q?dyxytxAi2fZFJIl5cLbAZA1MRZ31FN7ELvbireNzwQuK/4LEeTOfNhqv4xn+?=
 =?us-ascii?Q?DOqp2TeoyByUoAv7PtV7LYJocVzAYzwf10eDmtH7HIJ1TxwH6sdrvvSLsC14?=
 =?us-ascii?Q?5ZolVneGEoiw34uU9ZSbrT05rL0OOSjnJQajg67IW3OtrfGccJm9Kt+vKN5Y?=
 =?us-ascii?Q?ewTUBSLxdT6OhEP1GfvK5l8097rin+uFNF1G68tAu+ghQups48cBzy5BwDJD?=
 =?us-ascii?Q?WcTZio1usWfQJLjB0yVaWUCpPa/mSBSJqjqjfBBp8wK7kwoLOZ++vHt69n4I?=
 =?us-ascii?Q?e98wbbGkn2XYYESyHRG3rmP9IUvDqjBsOO51xVHmO7OQtwNKJRQCwGKK+55G?=
 =?us-ascii?Q?+7lqGy/a+9nmIj/Va1PRaeBKBB+FSCCRm56Hp2qu8BBQMpZhmH6sbwZ56juj?=
 =?us-ascii?Q?dHH18zVflJHhclcMsD4LYNpfEQlx9RN0SB1qYAH5HXZy3HAAK/jkP3Fn6Lmr?=
 =?us-ascii?Q?ZGx9nW9eg3EF0Bjo0A9FjrY67Tbez4y7a0jzDKfa0euIPJg6ai6XnzFk3iMd?=
 =?us-ascii?Q?JINaaQGEcNzTTW2eGtfulxCILZtrU6Jv2oItcEAEmMKfQ75Q+JybCg06o4hG?=
 =?us-ascii?Q?KfOXzUkOHbxwl4hpT3aoW0FvvbqiEg7mSPqYsje2KSltotbbDSIcWFKegcuU?=
 =?us-ascii?Q?2xu2UHzTktmVuRXSw1nkXmji2f7/l5VMDUv8dt0sJOM6pv4il8mrIkmke82o?=
 =?us-ascii?Q?FanHB+yDTK3y6GhedGYHfILgmjBIThUCCpB/ueWoMvOmerD0quMH2pXK6SF0?=
 =?us-ascii?Q?PoXBWvCcsBXFJC4j4EFlGy/WhouZxgelT4H3tJtJ6iOb3YsTUEFigfc/SBg8?=
 =?us-ascii?Q?QQLfLiW/AtR3oenfPnLodAIB0D58TvntHUJUs0tjflDExaxyQ4MG4eLnZHS4?=
 =?us-ascii?Q?407FSIAt8Nb68/JbpdLimFFkaez1lYKjDiEic0+fDtqQb+7lp8Hh0woUT00D?=
 =?us-ascii?Q?4cYj03uuclSrySnMtwv8dGynRBLT7uf8Z4/SqwGgydJ2kyify4qfmJ6WUVLM?=
 =?us-ascii?Q?vZlOcB2wQLpMdjAecq9biG/T3YZWo6i4ezPXqyRzU5KbjMzcYOAki+qap6kV?=
 =?us-ascii?Q?ufiWX6drGrabVEQKWniHK/xatdqAzGQw5OdEB+xkFUBuFdmyzxSE2D1BDwMq?=
 =?us-ascii?Q?93g1U9cDUGDUO0T8e3KXuSWDIhhk/wsjw73EFjWTmyl56G0ic6qodY99Pw9w?=
 =?us-ascii?Q?LrADTYFM7N7VGOYUBr8VHWibf6mKKHlIZlRHp96RuJ0ui8/vP/LpEvTEb5q0?=
 =?us-ascii?Q?/EDmpL/YXP8yi11tM8HaY81x5PnDSmWk4gAGTMvfMMFiyzjiS1MwUM+Dx9Z5?=
 =?us-ascii?Q?zsYvtwpiO1sjH0azCCHRaUA4PkivU5sqX29EQlwifnirv0oMAuvrg/yaUHm6?=
 =?us-ascii?Q?WBx57nVTT+ltcK9d6r0sFmpYrVjaHj+/ShWfAizp0n3WP9iYDfBCUkcnSzEH?=
 =?us-ascii?Q?xb80o0fcG6Lt1EOiG1Bur+TjJNkLY18v1/P2+PX96UU/jNkrhmyueMAs3yXo?=
 =?us-ascii?Q?iUDeELWdJrzk0NGkqLCiJQKqvUR1dnCsGMNpHNXiO/Ea4uPhyPZARFicU2Io?=
 =?us-ascii?Q?lbCBAj/REg7hTmwFhDj4pw9p6VFKrCdahS2gHZvp3bKQaUDi2cTyxlwUrrDx?=
 =?us-ascii?Q?Oc132VgEsBmL/nxTtpojYvNx582J4Dr6BGa7H1MFpdbdACEtI1J2AhTSRxBo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	uwpchrdXDW9bVDqeJ8fBgVkJ9iPX/Z8OT2LxzUG0NKHFVWfqQ1KeHuPM0ZY5Id3tPIrVx0g6U9E+/fUTvMoLYHK7MaWksujlq++2y7Bm105oWBNPxeorUyeYnDQ13q21sgl8e4udNyMPzcw5rgBAKq6e3SVRtEfqgIKhausbqcqB+cbshJNhkWkHO2Y126ejMZZYsJDUAbnnOl2ot0XzrhBlH0YYyhCUUo2h45/XQH1ZUmIE0hNOSAdpaB6xoEkqG6TB5kIp0NEVoyeNp2BNpBL8sHLjoh+4rRxbi/2sA82M1Szlnyheb5sZxoQQ1NAXfBBnHaYHbKslGIM0N4J2JKoWDeMEIdjThcXGdC6pXOAyK6k4DyIuGOUv2W+dZ+s98pVwFKN5Lft2koF1Y42qF3/2t6RV/qGvvvBny1cjapoFbxMmNyysId33aD42LFSlrvCSdMF65LC1wg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866146b6-5123-4d64-ee5b-08db82f3444e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:15:54.0293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKUQFBTRgDKvR14/RttD8pqPL9zBv8sAKDBeQHT8z6Mg5+RPP9pQTyif1co0gq6dyfTx8Y4qtTC8ShC83CGtEQA5321RE/Y33YYSl/4wMOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120146
X-Proofpoint-ORIG-GUID: suJCNGFK1iTqoq_FJW2ZPFpSYmNmhYxF
X-Proofpoint-GUID: suJCNGFK1iTqoq_FJW2ZPFpSYmNmhYxF
X-Mailman-Approved-At: Thu, 13 Jul 2023 08:26:22 +1000
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
 - KEXEC_IMAGE_VERIFY_SIG
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
  - These items from arch/arm64/Kconfig form the common options:
      KEXEC_IMAGE_VERIFY_SIG
  - The crash hotplug series appends CRASH_HOTPLUG to Kconfig.kexec
- The Kconfig.kexec is now a submenu titled "Kexec and crash features"
  and is now listed in "General Setup" submenu from init/Kconfig.
- To control the common options, each has a new ARCH_SUPPORTS_<option>
  option. These gateway options determine whether the common options
  options are valid for the architecture.
- To account for the slight differences in the original architecture
  coding of the common options, each now has a corresponding
  ARCH_SELECTS_<option> which are used to elicit the same side effects
  as the original arch/<arch>/Kconfig files for KEXEC and CRASH options.

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

In the process of consolidating the common options, I encountered
slight differences in the coding of these options in several of the
architectures. As a result, I settled on the following solution:

- Each of the common options has a 'depends on ARCH_SUPPORTS_<option>'
  statement. For example, the KEXEC_FILE option has a 'depends on
  ARCH_SUPPORTS_KEXEC_FILE' statement.

  This approach is needed on all common options so as to prevent
  options from appearing for architectures which previously did
  not allow/enable them. For example, arm supports KEXEC but not
  KEXEC_FILE. The arch/arm/Kconfig does not provide
  ARCH_SUPPORTS_KEXEC_FILE and so KEXEC_FILE and related options
  are not available to arm.

- The boolean ARCH_SUPPORTS_<option> in effect allows the arch to
  determine when the feature is allowed.  Archs which don't have the
  feature simply do not provide the corresponding ARCH_SUPPORTS_<option>.
  For each arch, where there previously were KEXEC and/or CRASH
  options, these have been replaced with the corresponding boolean
  ARCH_SUPPORTS_<option>, and an appropriate def_bool statement.

  For example, if the arch supports KEXEC_FILE, then the
  ARCH_SUPPORTS_KEXEC_FILE simply has a 'def_bool y'. This permits
  the KEXEC_FILE option to be available.

  If the arch has a 'depends on' statement in its original coding
  of the option, then that expression becomes part of the def_bool
  expression. For example, arm64 had:

  config KEXEC
    depends on PM_SLEEP_SMP

  and in this solution, this converts to:

  config ARCH_SUPPORTS_KEXEC
    def_bool PM_SLEEP_SMP


- In order to account for the architecture differences in the
  coding for the common options, the ARCH_SELECTS_<option> in the
  arch/<arch>/Kconfig is used. This option has a 'depends on
  <option>' statement to couple it to the main option, and from
  there can insert the differences from the common option and the
  arch original coding of that option.

  For example, a few archs enable CRYPTO and CRYTPO_SHA256 for
  KEXEC_FILE. These require a ARCH_SELECTS_KEXEC_FILE and
  'select CRYPTO' and 'select CRYPTO_SHA256' statements.

Illustrating the option relationships:

For each of the common KEXEC and CRASH options:
 ARCH_SUPPORTS_<option> <- <option> <- ARCH_SELECTS_<option>

 <option>                   # in Kconfig.kexec
 ARCH_SUPPORTS_<option>     # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_<option>      # in arch/<arch>/Kconfig, as needed


For example, KEXEC:
 ARCH_SUPPORTS_KEXEC <- KEXEC <- ARCH_SELECTS_KEXEC

 KEXEC                      # in Kconfig.kexec
 ARCH_SUPPORTS_KEXEC        # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_KEXEC         # in arch/<arch>/Kconfig, as needed


To summarize, the ARCH_SUPPORTS_<option> permits the <option> to be
enabled, and the ARCH_SELECTS_<option> handles side effects (ie.
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
config ARCH_SUPPORTS_KEXEC
    def_bool y

config ARCH_SUPPORTS_KEXEC_FILE
    def_bool X86_64 && CRYPTO && CRYPTO_SHA256

config ARCH_SELECTS_KEXEC_FILE
    def_bool y
    depends on KEXEC_FILE
    select HAVE_IMA_KEXEC if IMA

config ARCH_SUPPORTS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

config ARCH_SUPPORTS_KEXEC_SIG
    def_bool y

config ARCH_SUPPORTS_KEXEC_SIG_FORCE
    def_bool y

config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
    def_bool y

config ARCH_SUPPORTS_KEXEC_JUMP
    def_bool y

config ARCH_SUPPORTS_CRASH_DUMP
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
config ARCH_SUPPORTS_KEXEC
    def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)

config ARCH_SUPPORTS_KEXEC_FILE
    def_bool PPC64 && CRYPTO=y && CRYPTO_SHA256=y

config ARCH_SUPPORTS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

config ARCH_SELECTS_KEXEC_FILE
    def_bool y
    depends on KEXEC_FILE
    select KEXEC_ELF
    select HAVE_IMA_KEXEC if IMA

config ARCH_SUPPORTS_CRASH_DUMP
    def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)

config ARCH_SELECTS_CRASH_DUMP
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

For each config file, the olddefconfig, allnoconfig and allyesconfig
targets are utilized. In testing the randconfig has revealed problems
as well, but is not used in the before and after equivalence check
since one can not generate the "same" .config for before and after,
even if using the same KCONFIG_SEED since the option list is
different.

As such, the following script steps compare the before and after
of 'make olddefconfig'. The new symbols introduced by this series
are filtered out, but otherwise the config files are PASS only if
they were equivalent, and FAIL otherwise.

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
presented in this series passes all configs as checked by the script,
with the following exceptions:

- arch/ia64/configs/zx1_config with olddefconfig
  This config file has:
  # CONFIG_KEXEC is not set
  CONFIG_CRASH_DUMP=y
  and this refactor now couples KEXEC to CRASH_DUMP, so it is not
  possible to enable CRASH_DUMP without KEXEC.

- arch/sh/configs/* with allyesconfig
  The arch/sh/Kconfig codes CRASH_DUMP as dependent upon BROKEN_ON_MMU
  (which clearly is not meant to be set). This symbol is not provided
  but with the allyesconfig it is set to yes which enables CRASH_DUMP.
  But KEXEC is coded as dependent upon MMU, and is set to no in
  arch/sh/mm/Kconfig, so KEXEC is not enabled.
  This refactor now couples KEXEC to CRASH_DUMP, so it is not
  possible to enable CRASH_DUMP without KEXEC.

While the above exceptions are not equivalent to their original,
the config file produced is valid (and in fact better wrt/ CRASH_DUMP
handling).

Regards,
eric

---
v6: 12jul2023
 - More cycles with randconfig has revealed problems relating to
   MODULE_SIG_FORMAT/SYSTEM_DATA_VERIFICATION on s390. This version
   solves the problem by placing MODULE_SIG_FORMAT on the
   ARCH_SUPPORTS_KEXEC_SIG def_bool statement, similar to original.
 - Added patch to rename ARCH_HAS_KEXEC_PURGATORY to
   ARCH_SUPPORTS_KEXEC_PURGATORY to follow convention agreed upon
   since v2.
 - Re-run regressions locally including failing randconfig config
   files reported.

v5: 6jul2023
 https://lore.kernel.org/lkml/20230706222027.189117-1-eric.devolder@oracle.com/
 - Filled out all common options with a 'depends on ARCH_SUPPORTS_
   <option>' and provided it in the needed archs. Result of testing
   with allnoconfig and allyesconfig.
 - Added 'depends on ARCH_SUPPORTS_KEXEC' to CRASH_DUMP, per Arnd
   Bergmann.
 - Investigated fails revealed by Andrew Morton's machinery, and
   spot tested with this solution.

v4: 5jul2023
 https://lore.kernel.org/lkml/20230705142004.3605799-1-eric.devolder@oracle.com/
 - Corrected conversion issue with riscv, per Conor Dooley.
 - Andrew Mortons's akpm test machinery found a problem with config
   files generated by randconfig. The problem existed prior to this
   series and manifests because most arch/<arch>/Kconfig CRASH_DUMP
   does not have any dependencies on KEXEC. As a result, randconfig
   produces a config file enabling CRASH_DUMP but not KEXEC, which
   leads to compile/link-time problems. Andrew requested closing
   this hole. To that end 'select KEXEC' has been added to CRASH_DUMP.
   This behavior pre-existed for arm arm64 ia64 loongarch mips powerpc
   riscv sh and x86.
 - Applied Acked-by's from:
   s390: Alexander Gordeev <agordeev@linux.ibm.com>

v3: 26jun2023
 https://lore.kernel.org/lkml/20230626161332.183214-1-eric.devolder@oracle.com/
 - Rebased onto 6.4.0
 - Reworded s390 commit message to clarify MODULE_SIG_FORMAT,
   per Alexander Gordeev
 - Applied Acked-by's from:
   m68k: Geert Uytterhoeven <geert@linux-m68k.org>
   mips: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
   sh: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

v2: 19jun2023
 https://lore.kernel.org/lkml/20230619145801.1064716-1-eric.devolder@oracle.com/
 - The ARCH_HAS_ and ARCH_SUPPORTS_ combination was found to be
   too similar/confusing. Renamed these two new options as such:
   ARCH_HAS_<option> ---> ARCH_SUPPORTS_<option>
   ARCH_SUPPORTS_<option> ---> ARCH_SELECTS_<option>
   Per Kees Cook, Michael Ellerman
   NOTE: ARCH_HAS_KEXEC_PURGATORY was left as-is, as that is what
   it is prior to this series.
   Updated this cover letter to reflect the same.
 - Some minor cleaning up of the help sections, per Zhen Lei and
   Alexander Gordeev.
 - Removed the MODULE_SIG_FORMAT dependency from KEXEC_SIG in
   kernel/Kconfig.kexec. Only s390 had it prior to this series.
   See also commit message in
   "s390/kexec: refactor for kernel/Kconfig.kexec"
 - Added to Kconfig.kexec the KEXEC_IMAGE_VERIFY_SIG from arm64,
   per Zhen Lei.
 - Fixed the powerpc ARCH_SUPPORTS_KEXEC_FILE conversion, per
   Michael Ellerman.
   
v1: 12jun2023
 https://lore.kernel.org/lkml/20230612172805.681179-1-eric.devolder@oracle.com/
 - Initial
 - Based on 6.4.0-rc6

---

Eric DeVolder (14):
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
  kexec: rename ARCH_HAS_KEXEC_PURGATORY

 arch/Kconfig                  |  13 ----
 arch/arm/Kconfig              |  29 ++-------
 arch/arm64/Kconfig            |  64 +++++--------------
 arch/ia64/Kconfig             |  28 ++------
 arch/loongarch/Kconfig        |  26 ++------
 arch/m68k/Kconfig             |  19 +-----
 arch/mips/Kconfig             |  32 ++--------
 arch/parisc/Kconfig           |  34 ++++------
 arch/powerpc/Kconfig          |  57 ++++++-----------
 arch/riscv/Kbuild             |   2 +-
 arch/riscv/Kconfig            |  46 ++++----------
 arch/riscv/kernel/elf_kexec.c |   4 +-
 arch/s390/Kbuild              |   2 +-
 arch/s390/Kconfig             |  69 +++++++-------------
 arch/sh/Kconfig               |  46 +++-----------
 arch/x86/Kconfig              |  92 ++++++---------------------
 init/Kconfig                  |   2 +
 kernel/Kconfig.kexec          | 116 ++++++++++++++++++++++++++++++++++
 kernel/kexec_file.c           |   6 +-
 19 files changed, 257 insertions(+), 430 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

-- 
2.31.1

