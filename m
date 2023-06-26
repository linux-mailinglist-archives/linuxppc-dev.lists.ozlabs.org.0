Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 308F673EF6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:45:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=ur8EzlZE;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=TbKZb+cS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqkx61qj7z3c4q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:45:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=ur8EzlZE;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=TbKZb+cS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwb4vWRz30fL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:23 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QCoXMb022694;
	Mon, 26 Jun 2023 16:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=KYtU6Il15CL3Ctw3ntIsTV4KFnUo2JVIqnGKOO5dxVI=;
 b=ur8EzlZEsvVpbR4WZ9ZVW5Wc73oJ51vznVUg0UQXNCCYWRfmwtrK5TmPwIy0iwVZVrPV
 TzlzocW3TI/vhtJs7g/2TSnWK4ouPEiogBPrdWSiSbqi/peLmsq/4cGA+sdj3t/yt9+y
 SkQO+9RP3AOIhODwO6mflLeLIqvXiHcZV1opmbyhxx5AF+Kr9Q+aLcNCX4khLXHDnwu/
 8JSBwWAQZUlkY/CjKxuFv3ZiGeYiduxb+bEB7wLwiSPbLawjiNpPVX/X+lEVYOau0jBN
 1801Zc077E++ub2W36R/qCMtKb36i+83TQXDfgeWagjTjEXGLKpWHrpU9sBCGslUFcXR xg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdq9331wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:13:59 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QFGIIZ005121;
	Mon, 26 Jun 2023 16:13:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx9a8sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:13:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVaz2EG/7EO8exZoUHqc0xa4Thsgogbk+Mz68w531Pk9vqKnEe+WrhXh52j0V+qaFK/XYKowSwDmlgSLSuJEzZiPnoROF4rb6sBS7zLI3X5lyCLcBfIjTc9oBPBL2iwaJEAhASCTi4N0V7YVd6kUxJJkpTpLZ3qBnOHjM7NrMCJPYVjGbz+revnHvttFZOqKMG3xJQHiQ56kB2ON808FgpEhq34XhlNP0cXcsZ0fk+Xgr+4lxhTs2rbCLTsKXkcwKklfUqziVl0/va6SAU288E7XCsjxCkQHqrEC+6M+8avFf0gZobVarc6g4TRV+Wek7MdxRstXNnbvFxVZH14Fnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYtU6Il15CL3Ctw3ntIsTV4KFnUo2JVIqnGKOO5dxVI=;
 b=K7prlgu1jOkvr981u3uca1m9Aso2GutgtwMDq8SY0CgqEOyFzIGGILysQc6KhQH1zuzs2Eh1uzAsve3zjb1aYMVMa1mU0IgIRYL78s02qyM/eIBrStj/YNMI1bK7+xVzhuinK8Iw+Fmqr9JXBR+UfYbjKtE5Chd3+WXqNWb88W6y3I5gSxMs+lbr7a4EZoT74C767DyzmzqRiyjcGMru66Tp0AW8ExRWCa65YPpuFbNVY7YV12G0+lQ8gdP0lfX01c5b4b/dYjXaqo5pPT0Yao/b1+Ozxo0NeUmDnOiujToEt+Z9cIsPS24vPtkIpfhJ1+/UR/enbng9O7MzgQL/wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYtU6Il15CL3Ctw3ntIsTV4KFnUo2JVIqnGKOO5dxVI=;
 b=TbKZb+cSmf/clji5mJNeHFf1zKZNCdTkSvnC5/cyamSAida0prgbgcN8I3lMB9Aq/38cnkr8WUSkP1boVPM7Knku6ch9Vnb0asn6lx+FEFcYPr5aGZoqy1htllimof4/++5E5Go0wAdtG550fxdAfAMc8upRHZS82Fzh6a9kDpE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS7PR10MB7178.namprd10.prod.outlook.com (2603:10b6:8:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:13:42 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:13:42 +0000
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
Subject: [PATCH v3 00/13] refactor Kconfig to consolidate KEXEC and CRASH options
Date: Mon, 26 Jun 2023 12:13:19 -0400
Message-Id: <20230626161332.183214-1-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0160.namprd04.prod.outlook.com
 (2603:10b6:806:125::15) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS7PR10MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: c8896451-50cf-474c-a050-08db76604f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SKMFTsz/kpb6rdRREt/q6Ms6aW2hqPpL8ADXfNG9xY+dEC/vWb21Fu+NSMRGEgeMwqH2IVmL61vrOSYzFfMxXn64BvQloiWI3tDhX2Nq8u7r1bgqyxMcWlqs5rymqi9HcKJI+YIfuya+nPsSP0cz57aSAyheRfW2Y6a+fJ9dImlkPaqUZGwf2vTqoC6C30vtaRSw6is0caehmG2QxFcrEJJMfROtiunvZ5h/AMOAz7FI1wliyd2/JnbvBVsmUFBBn1ebQRH4cePbq7HShqe5vDa/x44OPxMMTLNkQgEvZHFNdtQrbxxyOvB4i5S2X/eRDs4u7J50upJTv8UGWyanEyaAwDa2NoHVzTHDhTmzxJlDHMybRk9vBBYmrjEMssfa1vX5+MUGLebeccTfr7iWY2gvUm3rfxR4EWEbhCRCLd39y3sgEdmj9EzWyOhi2+NGoQoeb+lZopIfFf2+96cffajjQyHxuO6I1F9VXlT+532eU95ggH5TcuegyCLEVgFCQ4bh0agKIjt4iIFHC11pntANaMpGJegthXmVHYhBlJgS7/L1asjpBAu8RIw+ieBtFuaoKp6mwfeKbf8MrmCl9tJ6RbLEfRA0Sj3jPjSxUKFpO7rCSQrh48ZoPZCkMbw1
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199021)(966005)(107886003)(6486002)(478600001)(2616005)(83380400001)(6666004)(26005)(6512007)(1076003)(6506007)(186003)(2906002)(30864003)(5660300002)(7406005)(7366002)(7416002)(36756003)(921005)(38100700002)(4326008)(66946007)(316002)(8936002)(8676002)(41300700001)(86362001)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?eNlWcqV3OxeoBKua7CLXgcgLU14pCAEs9MYGbzm4We2TZ/e2OUJpz6QwozNc?=
 =?us-ascii?Q?avtTw29REGRZ38q6HuC7aEM5FV+uPb2rSCwALexTsIwi5FLO69xtnHRRSqgp?=
 =?us-ascii?Q?gxTD+NjaS7qVyplcR4sr9KRZKSWBR8IF77v1ZUFDeeLkfinWMHqfTHsqmiAd?=
 =?us-ascii?Q?8JvnsBcwJOhKOohUA33LfNvYfX6AdUQcvccQ51uBj6SDQSxOY82QFJ1WS9LH?=
 =?us-ascii?Q?pZciolpya6+Y/C1wfqicwpEvigqW/AmY/B3f5uHNR+8wJrEDhz/iIEieqxjN?=
 =?us-ascii?Q?wQZdaCDZ21dvi9uQl7oO3ztYj3h0aa35UG2cR+GLttRCc8mqXFfYkcFl9yvo?=
 =?us-ascii?Q?A2FSRlpedAMGxqFeO1eJaxcoPhftAv3PFXgHO1rsfBXzdCAyI8+dHRAm4qiC?=
 =?us-ascii?Q?vlIngXWnC7BPVl3d6W7ExXPJmgdnUFpaQQbXEuycEbmcsODVgr3JLBXbMTWi?=
 =?us-ascii?Q?lSxg5n+nhDdeGEzuLeFkeBqe+o9L5cUH6nUku09SI4YkiMlyDaXyofz861xx?=
 =?us-ascii?Q?wlbedKvss0k2LWscA50zPvvpxDEs/Zpc5d1aO+SzyPkTKC0GR28cCanlcEId?=
 =?us-ascii?Q?9/mkI2vX4e6Kp+Bk6ZpnmgLMLxmZXpwPwH/8/zGaMxeIeVOhtMji+/owtPR0?=
 =?us-ascii?Q?YaRWz1ZVGzMembQ/C0CN2CCF87ftN9Lgrxfy/0TwuL9qIOqLGVIpaYfTCKfd?=
 =?us-ascii?Q?AEdNj5YUR232lTWC6YESCN1Ei5g0nC3RW8DaPYfJeax0pB7KssPfrdAXoloD?=
 =?us-ascii?Q?UgNl4J6o9isf6uHHkjef/2EDEn1U5iT/arX6ddSbAWjbtKkd9VgI4XUV9hT+?=
 =?us-ascii?Q?rZuDuitS+uRanKah3UxdKiJfQo0zSinA+Rif7dDqYfd5719GjYvfwAGZw1cH?=
 =?us-ascii?Q?yNivguRiCholPJ9Jx4nis065v71rnYP6hIAHhw0eDO/5olVgGV/VFjr06Eyc?=
 =?us-ascii?Q?53lBLfnf8v3xT7Bhwk5mjwdtTol0JFwWl6RUErv/bUMKwZFAiDrolTHWuCN+?=
 =?us-ascii?Q?HdkaJMiGy16xjkiKUEY1zwXpzauvXekueCfjw8+NgLFHjQqhhD9xgstWwvaG?=
 =?us-ascii?Q?G09uDz+fgIvkm01qe5ViU+ljnN/Qn7Q/4CeuzCrHBoFwfGtiy7hjQny2Fmdd?=
 =?us-ascii?Q?ACZezaHAZeomgHtXUIKjTlsnGgP3WdtY3v+OtV5imgcWJiNgvbQaD63HXyKz?=
 =?us-ascii?Q?3/aOC9x34g1RIhhuOPeiqDv6ffqVM5Yf3M63s8v10w8w3RGrAqwhCvSFNuOt?=
 =?us-ascii?Q?XKzYZjgqesO/gfuS/BaksWaabulanjdWk7E3NWzf6yRHLpuT+FsIv3fLnm8M?=
 =?us-ascii?Q?TQ63zyFHjtPJBdlri/mzKCcbUEQgKN5ciG8xXjpqU2ICpwJJtOOKq5/DnCyT?=
 =?us-ascii?Q?uVzwpeB6doyEzzVvNucykNkDE/pIfMf76hX3lBw/Ei7pZFQjeOv7JVPwVeET?=
 =?us-ascii?Q?fdWR1DO73JzYQC6zwzC24Evb2ukriiGRl3PTdjiUDANd5G0LVfr0mSPx8Yc7?=
 =?us-ascii?Q?xRNg/0meycCTDhMpspj42/AlJZ5zZMYJV1/Y5eNPzImylmQhNX2Opvit8FIU?=
 =?us-ascii?Q?6y+H8QKygO2ltntGO2S3u3tS9pLQNVL4azpO8L6nAg25ZefbqkSSpiEJsqhq?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?zJshn9QMdHiz4+n7tK8VTRcMCOu6NPViKyVKSnHNuZ6Qk4AMxWoxbWeOknqa?=
 =?us-ascii?Q?tfiPQbSvn2iytWvVzwEHd26+LR4yoXcfSeRgby0KHB3MCWylzaCXj07TxlUS?=
 =?us-ascii?Q?CSIXgFY0WJhqQAaIRSUgN3DpZQEwjBeM4fHOAE5S6qNw2chjWe45RKmhkVsH?=
 =?us-ascii?Q?QAILg/BGWoYaEr3NguzH90vBpORmk0cbYn2wWxxI876wLnLY7s/v3FAodGqc?=
 =?us-ascii?Q?iYuFxYgAJGWtU65XeiJtvcrNJD5M10qlQfH6hpnRYG5ZPUSKzXL+v+70sCDj?=
 =?us-ascii?Q?OsqviJIufZSZOhQDV0LDxl1GXHUvhtEo9T70TBQKt0zBDMp/lC9+tcccPqTO?=
 =?us-ascii?Q?RmnmafzdVqbp/iNJmh/a4o3z66kGaBSAF+cuKIsCfpbcOTS4/l7D8Snnt0sc?=
 =?us-ascii?Q?MeNVvUnSGWPa4JLBuTx9ZYav8qWzBnXiS+7JOSSB6iV4m1KiPdMAacC0pAoV?=
 =?us-ascii?Q?XzZVwqTm/6C6Yzt4LMe5Fp7UW+y/mjiMfu+nZ+jPereYMX51qIOvnu3vznp5?=
 =?us-ascii?Q?bbppMnkTOzmsHT2ke3r9QJXNMnH7upMm8sl+dExfnaxVNLlqHn/pVU2AtItF?=
 =?us-ascii?Q?QpPlB9VTCB5j6w5l/n+IGhBSAW1OD8SCTN0FGg2IYBdctUlwr6jTILeVnPy7?=
 =?us-ascii?Q?88VMZBoBMu2JdBcd1reIzJvP9rZo8lP2eO+yl+SpFKR3lXQskSJva4NLyHC+?=
 =?us-ascii?Q?LMh5L1SCGsS3ctqUm+uWuddDjR4QKHn1TOuRnGaVMzEClBlJBY3+9N1OObJ5?=
 =?us-ascii?Q?fhcQGKh5Rp1/f55kcKczqor8vLRE8vNX26isivYKg2r8AZVSJOqW0GrnZU9T?=
 =?us-ascii?Q?s5A+LbTwX2G9F9urikaJjhcbbLoOBbAX7azPHAeRsCzQszKZPIhvroiwbYuh?=
 =?us-ascii?Q?pE/5nt3HYEkgN0kWSBbnIInDo4VulCWrUmzcrwyd6FhS5j9uXqYost1Lf6M/?=
 =?us-ascii?Q?xJTadfJcQG/64bU6Rm0sUgfSnaBZqoBK1VOPy1jjvePtvW5AZK7d2L+wKbTz?=
 =?us-ascii?Q?DyCRo0YZALJVLmCV15aBccWfvkizhX942WdWv84/Zv9TpTzygKP1EeQ/63h4?=
 =?us-ascii?Q?VI+f5tZznw4Xv1vj9bD+ID6SvHUPm22Tuo2G9VQKTt2eAuEOfAxovUaJE5fo?=
 =?us-ascii?Q?RdJ1+TXnu5NaOjmF4mW4t/VwYcXJp/wDQQoO18hQvyDAdRawYyfnHZloEK7c?=
 =?us-ascii?Q?J1B27bHqHOwEwWyGZqkEK0oPcgT1hAx+rJWcLxyc6M6HhW5AQMs9Fubm5oPF?=
 =?us-ascii?Q?tDbATQnMMIO7MkHCcsMUb+ZdEegbI9VzD4qnX3kqTPj1rMSqHRKnOQuzHbWC?=
 =?us-ascii?Q?tL8/OEkTWByYulc8/fpwNUmdJpXvUw446LlqqIkOTciRb16vImnkWR/hrh+d?=
 =?us-ascii?Q?LJkJ/FY8li0pFuPw4afU1FPFYzxe9vN1uSF/7pQ4zocifeS7iI43TnK4qKg2?=
 =?us-ascii?Q?Jo3sch3JTpNRaDUZaRiwEyT3YgMIARf4E3owP8jaQ+dy1nXHYFXcrGaEldYT?=
 =?us-ascii?Q?pB+DhXqAeN7SWR5uW5JWZUWgiZODOLtGwNz8h9Cwzxl1SdCYEFnfLJcy62OB?=
 =?us-ascii?Q?+R63KESM8gLCMKyvMn0TD/uJunIker2xAfUdRXGy/78UWHusq7cC18SiLOg1?=
 =?us-ascii?Q?jYhOtlD9Q+WnCcdf/gG1SgfrqYjGZnpmFfw160dq2BVtDUiq0gBbtOhxzWem?=
 =?us-ascii?Q?Ay7Q7xSOEdkhw7y066ka9CXQYL9pIanHfhrTL/5tl819Q+68EguKc38Wkv1W?=
 =?us-ascii?Q?AaaB1lDd/tA3vZohGepUQnMjvKV4eUOM5mVIbe4SI9Xil60XliZkthsNh5Iy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	VIThY7IchRvOERhBfaMewz0PxWvSDAqS4aH8K6SHHJDoH0gJUPsQl7VZ/QRsnsjF4B17Dqc5HuHwyG6AEIn28VZ1wsqpXewZo01tYNvlbImIRaxSQk0fGHAyfDNEDGB1YDVskDYzmdnKMcMUvkeknLVR4f/Mm34i96AcdRb/rkKmaZSS35OpFtInmq9eGtb9C9qgKjvP+MhJBV0u+6aGPJIpiOD3l7yjoeMOpxQr67SDHNhuwAEsz7zjUpEbwkfYyuq4S4luLqZEwZwWCuyPwG3CJGX7U/p6E4EpM3LNS65/WJGM+9+Q9cKohZEkFu4I7UVStufLZs/we/dQIN/+4e6/JXrGMZCtMqm1m4fFUAD7BGKoKNzhU2Rteds2VLcF2q4AR3X4sdFr5VvxHVrF+v62yO2+JzrAk2inXeghDC6mtNmLueNbL53yzopcBGvfo1+fKJCxOYUmDg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8896451-50cf-474c-a050-08db76604f2a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:13:42.2094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQAqwqXMttPdEoXtpuOJ4taKRIOFMzTyucpyMWnTtBGB10pUhyyVEeIPN02fkjxWY/UIP9Q/f/Qt+6s4PrjXH08LmsZoap5xMeZNXk9d0nM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306260148
X-Proofpoint-ORIG-GUID: zZAi0D9iU83bJGaTsNXhXKR1_ajJTh1E
X-Proofpoint-GUID: zZAi0D9iU83bJGaTsNXhXKR1_ajJTh1E
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
- To control the main common options, new options ARCH_SUPPORTS_KEXEC,
  ARCH_SUPPORTS_KEXEC_FILE and ARCH_SUPPORTS_CRASH_DUMP are introduced.
  NOTE: The existing ARCH_HAS_KEXEC_PURGATORY remains unchanged.
- To account for the slight differences, new options ARCH_SELECTS_KEXEC,
  ARCH_SELECTS_KEXEC_FILE and ARCH_SELECTS_CRASH_DUMP are used to
  elicit the same side effects as the original arch/<arch>/Kconfig
  files for KEXEC and CRASH options.

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

- Each of three main options has a 'depends on ARCH_SUPPORTS_<option>'
  statement: ARCH_SUPPORTS_KEXEC, ARCH_SUPPORTS_KEXEC_FILE,
  ARCH_SUPPORTS_CRASH_DUMP.

  For example, the KEXEC_FILE option has a 'depends on
  ARCH_SUPPORTS_KEXEC_FILE' statement.

- The boolean ARCH_SUPPORTS_<option> in effect allows the arch to
  determine when the feature is allowed.  Archs which don't have the
  feature simply do not provide the corresponding ARCH_SUPPORTS_<option>.
  For each arch, where there previously were KEXEC and/or CRASH
  options, these have been replaced with the corresponding boolean
  ARCH_SUPPORTS_<option>, and an appropriate def_bool statement.

  For example, if the arch supports KEXEC_FILE, then the
  ARCH_SUPPORTS_KEXEC_FILE simply has a 'def_bool y'. This permits the
  KEXEC_FILE option to be available.

  If the arch has a 'depends on' statement in its original coding
  of the option, then that expression becomes part of the def_bool
  expression. For example, arm64 had:

  config KEXEC
    depends on PM_SLEEP_SMP

  and in this solution, this converts to:

  config ARCH_SUPPORTS_KEXEC
    def_bool PM_SLEEP_SMP


- In order to account for the differences in the config coding for
  the three common options, the ARCH_SELECTS_<option> is used.
  This options has a 'depends on <option>' statement to couple it
  to the main option, and from there can insert the differences
  from the common option and the arch original coding of that option.

  For example, a few archs enable CRYPTO and CRYTPO_SHA256 for
  KEXEC_FILE. These require a ARCH_SELECTS_KEXEC_FILE and
  'select CRYPTO' and 'select CRYPTO_SHA256' statements.

Illustrating the option relationships:

For KEXEC:
 ARCH_SUPPORTS_KEXEC <- KEXEC <- ARCH_SELECTS_KEXEC

 KEXEC                      # in Kconfig.kexec
 ARCH_SUPPORTS_KEXEC        # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_KEXEC         # in arch/<arch>/Kconfig, as needed


For KEXEC_FILE:
 ARCH_SUPPORTS_KEXEC_FILE <- KEXEC_FILE <- ARCH_SELECTS_KEXEC_FILE

 KEXEC_FILE                 # in Kconfig.kexec
 ARCH_SUPPORTS_KEXEC_FILE   # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_KEXEC_FILE    # in arch/<arch>/Kconfig, as needed


For CRASH:
 ARCH_SUPPORTS_CRASH_DUMP <- CRASH_DUMP <- ARCH_SELECTS_CRASH_DUMP

 CRASH_DUMP                 # in Kconfig.kexec
 ARCH_SUPPORTS_CRASH_DUMP   # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_CRASH_DUMP    # in arch/<arch>/Kconfig, as needed

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

 config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

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

config ARCH_HAS_KEXEC_PURGATORY
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
presented in this series passes all configs as checked by the script.

Regards,
eric

---
v3: 26jun2023
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

Eric DeVolder (13):
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

 arch/Kconfig           |  13 -----
 arch/arm/Kconfig       |  29 ++---------
 arch/arm64/Kconfig     |  62 +++++------------------
 arch/ia64/Kconfig      |  28 ++---------
 arch/loongarch/Kconfig |  26 +++-------
 arch/m68k/Kconfig      |  19 +------
 arch/mips/Kconfig      |  32 ++----------
 arch/parisc/Kconfig    |  34 +++++--------
 arch/powerpc/Kconfig   |  55 +++++++--------------
 arch/riscv/Kconfig     |  48 ++++++------------
 arch/s390/Kconfig      |  65 +++++++-----------------
 arch/sh/Kconfig        |  46 +++--------------
 arch/x86/Kconfig       |  89 +++++----------------------------
 init/Kconfig           |   2 +
 kernel/Kconfig.kexec   | 110 +++++++++++++++++++++++++++++++++++++++++
 15 files changed, 229 insertions(+), 429 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

-- 
2.31.1

