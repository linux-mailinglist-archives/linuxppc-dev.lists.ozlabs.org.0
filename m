Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F45440D9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 03:02:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJQmG3yR2z3dy3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 11:02:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=krZCYtRp;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=yD4NrIHT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=dongli.zhang@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=krZCYtRp;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=yD4NrIHT;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJQjH169Xz3bXG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 10:59:30 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258LWK4l005800;
	Thu, 9 Jun 2022 00:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=f3aDaHRkXv0/EyEdApnYiM6tML432+yHUf7g7UhEaI4=;
 b=krZCYtRptY/9JXFUuiGNW2ubs398VBe3AyIpDRJm37tR777mNTBpAsR47cqy/q1BGymT
 jvHnamm/n5JE+D/DMFaeX6RU/nzR3grp0d0w2KlM6iPc8oMdeybT0cQDd/bAvm9iHONI
 fNRVzJpIuAvcHxPWzOKfGanmAcW4GTRnPyYj04pdugs1+LudUle0zpi2wmkFlNPx511Y
 LZ4d9QHtcmwxr/ZZS0Y59n3SCz/XNHxxbx/YVI6+IH6+l1pj8KJk94NqnJR2wES2/wp9
 xVe1IlxZqQG/VZmFzdb9Ik+uZdKlSV1Wpy6uJ3LrLRvCk1nl5tg9NTcpO+0OUcLLSyVe dw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyekhsex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:47 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2590ub2x032517;
	Thu, 9 Jun 2022 00:58:46 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gfwu433k8-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jun 2022 00:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl/7qCFk6Zi0YyW1kD9O59E4x+jk8hvLrXYZMFiQbI5NTSATY3uDQyT4RIpsdeAwlh9mYssu/Nkc0gq9mYXeH/2+qCBSwgpdiIxCTVbYr3X+Sc1ycpwgOS51I/ol6wBj2WEw0Koss5ti/GRaeUimbMHZF3LSqxGHgWBRCM3csXz6vOMkKdSYGIsU8iW+lHuQfNwFDntcfSz3JzCvA2c4X6CxS3HagBFRcwiV/4mPo4p/9ijLGGjZnKtLxX+l8HBMZOh/+31Rxe2giRxP5knRBpSFUSzVPP6j58uCIFVWtVous6SycD2npZMCVGZYFTPIPSLEDY7YxxdjUD2N6kTJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3aDaHRkXv0/EyEdApnYiM6tML432+yHUf7g7UhEaI4=;
 b=OsGVVgm2So6jXcub7ie1Np9quv4OUQQZKxQCdN6Eun7aqMDtzDEB0FYI5P8J5tM1sPxg36UX6GxDfZdfvGcgFcKfLfXAXyypOFaRB3PJA4BO2QzlWVNqOfsQ7WS+IfOrwP3snW8FrAnHyqBHNyjE3rnzc9lrLy9qkGUHKqAH3FWXze5DrV6eMKjK4sZgY4+89foglRXqxGjFBsn1F9YCQHqnXT+moUyT15QJ6sS1jCREgjfPfhuzqijkhR5bOB55wnzTjKCY2ZvlN0zwVIUaOmiwgFYALntmAcSe3XxKhPb6Of4+2wUGfIisRzU8bDf7pb1lo794kWWozq3EyI8xJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3aDaHRkXv0/EyEdApnYiM6tML432+yHUf7g7UhEaI4=;
 b=yD4NrIHTaAosLTX0AeFyVcvi2Xc1vPM4bdzr6OdLxGTYQaoMTmPedYD6maoTKkP7buwKeOhH1lJNg7iSURQlIEIsJehZbUO2ONIeDX+TjcMTQ28iJCt1Hs+2DXablEoVaXuzxpK9mHEH/VUW3Tvf4sxRPZ3v15jeyWCDq8phBOQ=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BN0PR10MB5126.namprd10.prod.outlook.com (2603:10b6:408:129::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 00:58:44 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::7081:e264:cc58:37b9%3]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 00:58:44 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH RFC v1 2/7] swiotlb: change the signature of remap function
Date: Wed,  8 Jun 2022 17:55:48 -0700
Message-Id: <20220609005553.30954-3-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220609005553.30954-1-dongli.zhang@oracle.com>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cfee2df-580d-4d88-9a45-08da49b3330f
X-MS-TrafficTypeDiagnostic: BN0PR10MB5126:EE_
X-Microsoft-Antispam-PRVS: 	<BN0PR10MB512603C19E6E2E0980C6A807F0A79@BN0PR10MB5126.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FswaP8XQL8bIWGofFyszNMc6YneHl5NhOP8rWVrcfD3g+lVIqE1VTDuZIwAq0PLXvVBRMD48ZPbLbfG5mJB8ubZI49ESmC8FYYbwnPT2fv7M0ns9BmfRyMTxw7fvfiNTFFIqCeUIwwmJriOniXlSAbx4rO7DpTwDmN8D54i3ZcIjAkhGJqAjml35gQNE3ko2oAla0rz8jJKHMbbLSAE4iXZitGJB8Y4nFVeGJkKD69djAUJBe9MSpKL7A7twttOy63lfoRDIRrquD2uTUAyVwkGAeLrtARZ2Dban1RkdiRrCFRw3uplrJ76AtW/FnjfEg55ksKDcVLrjtXDBdN9TEtzs13Fyd/jxPa5pbiRDyKZ1OJWrSKBgSa/ihl1C39W8xx4zO0V7oPcmZo8KHbMPBLaRueiEOzW1iBLNcqY6mWgnL57wVtl5IkzCvh329Nxd3pWdDqZZOI2xQBmXzoEAf+uJnP1imX/6MY25hnULMV15pUMU5nE300HcEfmLha07ILmBRydU9ngmrDv8oGV6C02DDFGTpyrSQHvCaMwh/j2Iuga6sKpIPm8xzQwgpKc71dGGq6B5sG0Dbm5QosjL62erYyjuilZGTFQyPAqHDS6gPsuKnGUMFsSfqMaQ76VTkNvgPF2v7ahH5RLV8cd6+DGbnHtSIvAJrMpOj9k+OHAtQ8yi1QNliqzK5HDt/UdK/0T4svCHGLTdJ4c3p9tLsw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2663.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(5660300002)(186003)(66556008)(508600001)(4326008)(66946007)(7416002)(66476007)(2616005)(8676002)(107886003)(1076003)(2906002)(38100700002)(38350700002)(26005)(316002)(6512007)(36756003)(83380400001)(86362001)(44832011)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bAQ65IoHBanKWnf96lQ/GtiTzzzbD20JDMAxTFLCSsV0Cberu4AZhhqjv0V/?=
 =?us-ascii?Q?/Xvs9DUhBD6jZcEMrQq+YnnWZZzQgmp1toOFnAY6QtKD4iQeb6gHVsk5eQM6?=
 =?us-ascii?Q?ElXxn52wtsiYN8luWYDE5Ihlxjq9UgqcmSuq5CzX9oKuZE3FXlaXzLDEjiEp?=
 =?us-ascii?Q?YiWtbagRHfta2CI5nWGKcz1Y7NchUp7YhExJcnM+TSU/yXtMaAFEDkr10QSE?=
 =?us-ascii?Q?P/iskNzO6L7vwNdCXijgwzOnwqYtKVbJW6iaIxsrCsPt/UVMAbqWs2yoC8DD?=
 =?us-ascii?Q?b8n04EPZcYcQIrLBcSCM5gNej+gZoRg859a/N/tfm7UbYYFebHGbt6hjTxCe?=
 =?us-ascii?Q?zcdcbJ5ksdLRD8Ge5edlqNVWhiGMES0B2BvIjPyBr1x8wd4CveOzhKOV55lf?=
 =?us-ascii?Q?i1ElyTS+rYm5YtqVRnm8Yx+06JCmB69JlxmdiML/CoK3WptmRLREQiYMP0Is?=
 =?us-ascii?Q?rySmueKlXBTU10hbwk0Bea5XNDyHbsLfLmJV/T7Cxcqm9BOE850t9muvjgzq?=
 =?us-ascii?Q?x+AEjuoYAlL8aK21No+4R+S4Jqi02+k5ZQWDCOpCm0SGKFQAWi8mC6XG50vN?=
 =?us-ascii?Q?z7X3Z64pljZsWte9Dj2w2syIgPgLkJPKCwGgDYLVxBzAz/7f5gl3oS2EEefw?=
 =?us-ascii?Q?oGgRoZS1KT8ordB5mpmtLAjtgzjQwukbnwlZqa78RVcqa3jxeuudjcNvnfKM?=
 =?us-ascii?Q?7h9t3A3jXAacVd+YS0TD53GnQ2M4auDwktwczIxNqG1DWBn6kCVUeSDw+KOX?=
 =?us-ascii?Q?4UJGM3i1PP1n94xi6pq2K2cH71ys+tC4f9RAor2xCirOkT2gIaReVVzXjR6y?=
 =?us-ascii?Q?MsR7jzqvZOTtQHAs0iLAZIJy8XsGtmjt0ScPdRG42XU9I7ABPX3he7xTNN0K?=
 =?us-ascii?Q?PEToFphiXB5dy3DqUDgw/Zgk30KjB4enfribdcmeiMOxhAKF1dfoxGBWtXFj?=
 =?us-ascii?Q?/2lB+OpBJhXVkmbGROZZObMMiNKzC1Lz3VB+bTW3/FLI5qUYCevgpcl6/Wdn?=
 =?us-ascii?Q?rasdNnvl54h+WaiyQUYrPGn0XRhU8foLkNZhSLxDS4XTHU0wJf1I1Tiam9jv?=
 =?us-ascii?Q?kUoX1GWNm8tuuzS0gt5HWnl495QmFv5qLeLagweVpX6u//I7RKzFOVRzpdZJ?=
 =?us-ascii?Q?tlsrC89eq0Acn4m8GKbTJu9cLej99CSkhSK4xjKMo/ncDnU42yF03IiqyOmq?=
 =?us-ascii?Q?GxzAz2Alf5KmNkO7ZOVBvNP5q/RMoQ0w4avFR2xaPrQC7rv0IpC6MvhbZQUB?=
 =?us-ascii?Q?NFngheo+b43C68dOl1I4FtrrwbxnHXZK3mTYNGnSmfPr7++N0SKdMaPlsiTE?=
 =?us-ascii?Q?NUX1+kP/Fhw1umorxsDRPVubNoNsA0wHwsgpg83iq/XLGXK+a1I/rdC2sR9A?=
 =?us-ascii?Q?o7CVA8aI3EF4rm67bUsL32MmAmYDw98ADZxTkPGZmgzlD8Uk3fExPl8k8meB?=
 =?us-ascii?Q?38622evBIJ2djfUH80faWu94Cax29I2h1xzgU1NZ6XiTvquWNEeSwlVzE4uE?=
 =?us-ascii?Q?CxE9uh+h4Tr1+/X/xSlcK5o3alHGr8pgcpSWCpJXOOguBsuFPlhRtJ4bCmCI?=
 =?us-ascii?Q?fsTzG+wUbsArZuTNM0G8I5xGR6Nbf7F8NpLRiCtBz+ppTti/NZRhnEwWRDfA?=
 =?us-ascii?Q?6KOnmVrjf8H/mZJoJjXp5oHiGGTibF+FMVnxPSHxvZBRPL7zsrsui6UKORUh?=
 =?us-ascii?Q?XCY3JqXXhLsqf4LNxd7xJ4srBMlEcWSHkfvcLrCInkIfx9D2T1Fw6Q+KvFoY?=
 =?us-ascii?Q?Uo2GqakYv3YXTWJgKqjf+GlUqw9x6FM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfee2df-580d-4d88-9a45-08da49b3330f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 00:58:43.2074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7XSW3AdSZuwdXzKFG8yrqlLCtdev5kwrWoBl9pljLl63defgaTd41SKif7StP3ocU339+PNitBuNtrsZg40tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5126
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-08_04:2022-06-07,2022-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090001
X-Proofpoint-GUID: jwdl0rZLCrlF0D9S45XOnf0OHrDPWVww
X-Proofpoint-ORIG-GUID: jwdl0rZLCrlF0D9S45XOnf0OHrDPWVww
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
Cc: jgross@suse.com, sstabellini@kernel.org, mst@redhat.com, konrad.wilk@oracle.com, jasowang@redhat.com, dave.hansen@linux.intel.com, joe.jin@oracle.com, linux-kernel@vger.kernel.org, hch@infradead.org, mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add new argument 'high' to remap function, so that it will be able to
remap the swiotlb buffer based on whether the swiotlb is 32-bit or
64-bit.

Currently the only remap function is xen_swiotlb_fixup().

Cc: Konrad Wilk <konrad.wilk@oracle.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 arch/x86/include/asm/xen/swiotlb-xen.h | 2 +-
 drivers/xen/swiotlb-xen.c              | 2 +-
 include/linux/swiotlb.h                | 4 ++--
 kernel/dma/swiotlb.c                   | 8 ++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/xen/swiotlb-xen.h b/arch/x86/include/asm/xen/swiotlb-xen.h
index 77a2d19cc990..a54eae15605e 100644
--- a/arch/x86/include/asm/xen/swiotlb-xen.h
+++ b/arch/x86/include/asm/xen/swiotlb-xen.h
@@ -8,7 +8,7 @@ extern int pci_xen_swiotlb_init_late(void);
 static inline int pci_xen_swiotlb_init_late(void) { return -ENXIO; }
 #endif
 
-int xen_swiotlb_fixup(void *buf, unsigned long nslabs);
+int xen_swiotlb_fixup(void *buf, unsigned long nslabs, bool high);
 int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 				unsigned int address_bits,
 				dma_addr_t *dma_handle);
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 67aa74d20162..339f46e21053 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -104,7 +104,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 }
 
 #ifdef CONFIG_X86
-int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
+int xen_swiotlb_fixup(void *buf, unsigned long nslabs, bool high)
 {
 	int rc;
 	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index e67e605af2dd..e61c074c55eb 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -36,9 +36,9 @@ struct scatterlist;
 
 unsigned long swiotlb_size_or_default(void);
 void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
-	int (*remap)(void *tlb, unsigned long nslabs));
+	int (*remap)(void *tlb, unsigned long nslabs, bool high));
 int swiotlb_init_late(size_t size, gfp_t gfp_mask,
-	int (*remap)(void *tlb, unsigned long nslabs));
+	int (*remap)(void *tlb, unsigned long nslabs, bool high));
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 569bc30e7b7a..7988883ca7f9 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -245,7 +245,7 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
  * structures for the software IO TLB used to implement the DMA API.
  */
 void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
-		int (*remap)(void *tlb, unsigned long nslabs))
+		int (*remap)(void *tlb, unsigned long nslabs, bool high))
 {
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = default_nslabs;
@@ -274,7 +274,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		return;
 	}
 
-	if (remap && remap(tlb, nslabs) < 0) {
+	if (remap && remap(tlb, nslabs, false) < 0) {
 		memblock_free(tlb, PAGE_ALIGN(bytes));
 
 		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
@@ -307,7 +307,7 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
  * This should be just like above, but with some error catching.
  */
 int swiotlb_init_late(size_t size, gfp_t gfp_mask,
-		int (*remap)(void *tlb, unsigned long nslabs))
+		int (*remap)(void *tlb, unsigned long nslabs, bool high))
 {
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
@@ -337,7 +337,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		return -ENOMEM;
 
 	if (remap)
-		rc = remap(vstart, nslabs);
+		rc = remap(vstart, nslabs, false);
 	if (rc) {
 		free_pages((unsigned long)vstart, order);
 
-- 
2.17.1

