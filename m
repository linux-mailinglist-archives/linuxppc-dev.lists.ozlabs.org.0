Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E604872D030
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:08:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Jsvc7WXA;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=LVgg1acn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2mz5pj8z3c5g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:08:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Jsvc7WXA;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=LVgg1acn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg0w40HN7z30G5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:44:19 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHOCPT001643;
	Mon, 12 Jun 2023 17:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=K6Wl8WFhSi7HkJ9yWjbw3KvBSLd12QHQlHGVwW7zkD0=;
 b=Jsvc7WXA1UZuEH5OZyvF01K8rTNF1XUgRilOFiYSZDjV0lNhoobfXkih7gI+adNbvvUS
 5KX+PxDxhU3GS3pjYe4TnBU+OZf31tMcRAGLzH9QYLXzG79Yza/t9E7oxwTU4YwKrZAW
 t6j4DisGS6cI4HsWT6STmOmxAy45i3nutgbvvE1xka2C0bX2Ck209sSO0dLVAuyTuarf
 hMlzORPuOgMbW1VF3ZRhqa5pG7s3V+cgDtQqud420K2w6eKbd/OOHI/DT1vVp+FtDuwv
 ieOWQmAVgRQPlBPTan7inwqbtroEsvqiKe6mnYowMbI/rLXdpqb688EsQixTv3IjS5yQ gw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4h2akgr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:49 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CH4MlC016344;
	Mon, 12 Jun 2023 17:28:48 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y0u-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmomHf+D6vw2LRh4/thkudSVsnzIGJ5NYPPWYAKBErdACMgoQgUMeNQOsZu+f29qYfJiCIgWeh4wskpaxv6uKZpL+OUZrB9X1hSiN/zHn1Zh8jiiEhtZ10CLJnRYZebBxNhASqMVTBN7YlgiuqhPsLE4gj4cEQjvzjKfwJ+etk52YJdCPXysHOJaLf3VHa/J3pcbv/2hwQBqzIKfqw8AY2YHeaCbMkxCO2kLQ49zYoW7UtIJvcH81HvFaXYC7Xh67sXrCKKPzzZOm5z+9rqWvujWOc/Nj30o8o0IwuPclN+ZRB8jPXONeqRHh648UF5DNsZjnoIuiJrjLheft2wspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6Wl8WFhSi7HkJ9yWjbw3KvBSLd12QHQlHGVwW7zkD0=;
 b=jiMYnQ2bMxoXdB7AE2Jz0vOBqA0eM1CVsiD7rWaXwqik1+RUYKDWbpxQo3KOamE4WOpZteTN3B80RwIcYX2WUEDS8ZT40OI2ssIxk45v1703gNWAXPr13h8oIUGmTml3Ljya9Nty3ByHPh2EsERRlDHc6vD6y+BZPBTEApm0zSm7h63MkGKk0W+XEEjUAQ1ca+m5W3UB+EkfRpjTQmPSEOEB5vfISVtn3L12Eor6S1qU2aIiYi5moIS1Kxm4tVjtHGm8ISQ13vHbRTADBZpN8fM5qcO54aIoR/KO+uIIHX/1h5gtpktBF+woVKpglJ632Q4UGzhXsG+OoJ5WxfBqDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6Wl8WFhSi7HkJ9yWjbw3KvBSLd12QHQlHGVwW7zkD0=;
 b=LVgg1acn3T1Sp6kJdAVczUOu2lfkruNcJ1ZkLeAYKsjS5u9AYjtKyEeVhmS0erqQDw6mu8CXS72FOIiaRv1BHulYkX9mItp3JsiG9hohH1q34qIIOEh50XhVTsgXr2MwNo8+6QSsyX6tpE/4mYAwJ3iSUR8d9rYrVCoZmCJbEYg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 17:28:44 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:44 +0000
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
Subject: [PATCH v1 11/21] riscv/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:28:03 -0400
Message-Id: <20230612172805.681179-12-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: 97333584-713b-4059-d577-08db6b6a7926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AByc0Rhp2Tjq2d/HSGB0hwTuzYLZ+30VABIX9G/lcwOvkwtFXEr/EaT+d/hLLIIzKcNwYlrXTcgtTqIJ/Tdd+YjxViI6kSlaogHCDGiInFYoRBuii0IrKcXr6A9UE4IBQFUSMNaxvgbLUC61QJGz074o/gudTVak5FcaW1fENeGD+lncj49EfwY6yo6+dZZzMmdb+hb2yAAqnjd4nTXu6eqkBb1TQnwS4jEENQrMtyxjECxE16NI6kxCkhaAr5wCQDBhFzMGjA39hBWLXK63JldIrOnM1fZiwQqeqbgroWV+TDb5Sbc0d80abzN36o2WflSBJRKd6vwRxdtFXlETPpfZG4zlO/6ByJbjTrIFNrJynk9B3cupePo7OKywzB8pYpfXlVmN2+Vcwx1WPVSCrTJwGBNu59x38FcmpHrbyz+quSaXbVwW38IF/YTz17UDGL8+xcMPPgf0igRriGANqrpQPTWcPA7i1zD9W9vKMTIbxako5kzqk+DTFG9e5LYW3scWScSLzbwewY03kMTo4a9+qMt+sHZh2ghQuhYXfE12qtf5Xss8FX3fSbbMIywdnZ8VFevJkIBeX/giLQ0FL0eCc5HUpNgZ39lb2E9ka8k=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(66556008)(66476007)(66946007)(6666004)(107886003)(316002)(4326008)(478600001)(86362001)(36756003)(6512007)(6506007)(1076003)(26005)(83380400001)(186003)(5660300002)(8936002)(7366002)(7416002)(8676002)(2906002)(6486002)(7406005)(921005)(41300700001)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?nqLPiXmVdfDlVI0IVugEvO2V9uLzW41/6F34nMXIGBNDQeVSTxI14Hl/C1nF?=
 =?us-ascii?Q?+SEOEmo148KaxjQ4PJZ8gtm7OQWlZLoEc4k3LHEx38rJWYk9dnlQ2wRlZoJ0?=
 =?us-ascii?Q?+SATHKk4tBC4R625fLMbr5YYbn9yvZkbpB0L//U8PtwTcQ6pcFipTaebHhUC?=
 =?us-ascii?Q?qnk8BEaSDWauNKRRh7fU4UyqMI7dc0ANiPYvjaCsQSv3eFKVU7vc2V6QCo+G?=
 =?us-ascii?Q?SaCF/u7gfRFsO5FRmrTne6fR5xqyP3F9WXjAV9o5e/0TuksY/hV9EXYm1Ey7?=
 =?us-ascii?Q?YRUoh61ijiCrDBsF4XJNGo2QvlGNqeKPLTBCwQ8pdiHSWlUxJtIqg4OBtwbI?=
 =?us-ascii?Q?93qj8B23wcmnY4o73Kk7Q/tKlIuiuXbtce+cMc3wEL51Qit+jNxjlW2twWmh?=
 =?us-ascii?Q?2aJPZzi2fvJ+T3RNV99TNXj7oCZ+0LU3U0B5NhGPJwqCCqooYOLSdCiA+cBx?=
 =?us-ascii?Q?oMnXJSIAkZNUo9kx3LCqbzlj+tGPyA4mhPR4178LkV5tL8xIrdTJKi69TJ9l?=
 =?us-ascii?Q?lRx8XIr1eouUbYbIIm1bKmiLWwnmDkFVSxZsV0zphgT3OVjTNMcQfMnaQRmQ?=
 =?us-ascii?Q?OnHCWyfi4TB5GVFsEh5E0iq7KFWRmDY32YtORBc61mhVwUujY0FzlgIrpAjz?=
 =?us-ascii?Q?rvn5kJrpT/wZKwlW+Xd84CUloF8SmRfHPcGkt0d5jayMnO9WnnRx5CDUWWRJ?=
 =?us-ascii?Q?954LHIC3zWsbW3zUGzR3ixV5O8sXZvbQOTdELZ3FTn3Z6fFNEnFKTeM+F+gs?=
 =?us-ascii?Q?94v5o5venfJdLdBrXxalk/6OBYqo8dKaAgW+a4V+51r6799Gg74m7YQK4h5s?=
 =?us-ascii?Q?BATHB0abBROk4m0rGer7uqEFlp8HP07RHSU7ZtIamyExzBVRzCKBkEN/7Rcg?=
 =?us-ascii?Q?x5Znla692VDb0rpv9OEFGCkI18jibsGru6lJrHU6dTvarPeR2dsJ0fhA54XN?=
 =?us-ascii?Q?x4gbI1RIDFJklPaSFsp7645gTQ76qgbxUnVB0zlcx6+OTtpGeN8DcguInAEX?=
 =?us-ascii?Q?WDJX4W4zj+NeMO+XRGPlbOrHJyxmmOsmPyKEzKavfqgDNDadq4Qwz8UUn/5X?=
 =?us-ascii?Q?8COEBC5HETwL3MnDpCnbwaBmDuCRaLcw/ATbh89J7FKKXXiqrpVabb2ls526?=
 =?us-ascii?Q?vOOmRBuJy5Y26cp6dcGXnk/3kehDxRRNW+6zfiCQ94VdEWV5rK+x8C0xNPAW?=
 =?us-ascii?Q?uGz9cORvnWqvLCPPraS27lHCHn6w0OzqmoRK0/I44LBSvDuYSEMYDIV0MQaF?=
 =?us-ascii?Q?MZCk3b864c2zhcyWc4NlkKlemRb1EpwNiqxGzu+IuAzVQaY5+Qn+HgYhiO8U?=
 =?us-ascii?Q?aItkhihH187HeDqVwQyAIG2BTh9U4Wt3C67SbcAU9ucy0sKjvj4eoHTAfjLB?=
 =?us-ascii?Q?ru592sefHIh/XE9usl/Rp3bbUN47Xecb9humK1RiRRtsUdX/uvD6u0FkxMwH?=
 =?us-ascii?Q?g1oNVg/e+gL2slIS1s/Pfd75PxOkQCPo5WHTaOXmx8QIi+4v/gwT0Ev6Qoc/?=
 =?us-ascii?Q?wdp1tW18aa7MKJI/+wAb0YAZCEb2Y0UoF69NTi8icanbIKbpsa0nHERhKGEk?=
 =?us-ascii?Q?jH0439zIejkdTISoMm861ibArLe76p3owK/x6qgD213wTSiNx3f14Ult6XN6?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?2kT3RFizbGqNH+/aAod6zHfdsHk1rrfOx9bV18aab5S+uP8PZWi1ix3ROnRK?=
 =?us-ascii?Q?ufuP/lU5d+6JyYzH9YeTRNxAYX1T+b2IGbxnuwjJ9/YMrYh1Rxs9n/EjQra2?=
 =?us-ascii?Q?iAYPWvEUi57R5fi3XkF5UkGFstjjyLqWeAdEXD4reRe00fgroQylCaqEYvoM?=
 =?us-ascii?Q?jhDB7tvzD3TJLSmUAEfPOqZxn+9qG01g4Fdfrx2cUAlMjaOO9KLooqfmibSc?=
 =?us-ascii?Q?eZzew4PsIWtLz6+GemKNSnf8EY/NWjOOKhQDp9pV7GpZY5HV4s7/56pDgwU/?=
 =?us-ascii?Q?d2YQp5jbsuexZRZuUhvBsnXd+9t2huK9y+0UKrhdpp9jxRzmGSBnmuHT4q09?=
 =?us-ascii?Q?xmMq73rPW53Lg1wbomLk7OOhMGKY80bb3YG5hc0F+hZBtD97PpGGke027sN9?=
 =?us-ascii?Q?ulmHJpMpP5BLyWlS6FKZ4lMuGTaoJznvpOeNZV8x67hzHijXfNp2gJvlBaPn?=
 =?us-ascii?Q?vI8AEzbLbdxihKVTSq9YK3hjEqSSgbsoPp2Wk0ZNEueNxFwYKGh3IG1MtMHP?=
 =?us-ascii?Q?AFqf6qNAgbc4eKyMTvCKQhhM2D+aST76hVC5hiH7TIp88GEbxqZJXAaaHFLx?=
 =?us-ascii?Q?VnEGb+45tbabDAGYkGSLMZnDl4KTAlloaZnKzFkUCKutDLOKBVf3kOjK7y8T?=
 =?us-ascii?Q?wPMYfCiiMrwQr6ofIebTASCy6SsmwpY/ZR5iltJja4Ah9SwWJnuG4D1riHo8?=
 =?us-ascii?Q?tjVkSuCoxh1R1OjWvmQwjTYUytD31MxtELxadZbinKyjDYOVtBB/0X1QtZKE?=
 =?us-ascii?Q?NqvnbBeR8ztO6HGXCW01JYEwcnJPI1g2MjVQtj+tHaFsRGG4gPzkEmCU+qQk?=
 =?us-ascii?Q?TY/sJd5FTKPxZVyWaSNF+vXqlIIdcpO2MUxNuBuUCwpNO0w4zYIp6Zc/tb7Z?=
 =?us-ascii?Q?BByBLm/vMdkKrRiCvXqRgSuDFIpuMdVZF7G7lMJ5iNxWDVI10F0ldZ28CTDY?=
 =?us-ascii?Q?0dO1znUoPnt7U2lGHRSZcoOHenbuvRMdEEczonkEd5nfu9Qw8gaxaSeKHwmJ?=
 =?us-ascii?Q?5sTTm5OJGoh/8ojOKAG8F3MpMKmA+8WEGDs/+wRMSVa4vLZmbOCfA5JZKXkF?=
 =?us-ascii?Q?wJjXKB9Je6ZbSm3OP0hsSiv/pZPKNnF9I8/PswxE8XLI4HH+9bsucdK/d1mb?=
 =?us-ascii?Q?soY97HBf3ojCDQGDyA9wPHyVIau6vR+09gtJK99G6OGDl2tui7K1mJPDjhjL?=
 =?us-ascii?Q?2A1FDCBJPTr3EekVDedLqKhI6e16ljogH7Kc2Yi64NwbdjZOgITwxYTyGOC5?=
 =?us-ascii?Q?wCNHT90VryJd2zB2RvOAg+eVnRrnctsZhlig4oDV+mmJvLky72nnZ751cEFu?=
 =?us-ascii?Q?xWxVPZ2F0cXeuUSnWLi9myF1GYbrLNweZaX8br5mJhxvzBdb7Pk6OyuAIgN9?=
 =?us-ascii?Q?K2jFgAgBbXxLuriLilU1U/ngekbo6QSlqQx60nPL6TEb1LBj9HoszXeFsUW1?=
 =?us-ascii?Q?08JSrLhfS3rd8A69wDNgFlFWUl7niIHBG07/MSBwYA8m3ZcSvV1iHAOKMtAL?=
 =?us-ascii?Q?CaxTKg9j0oLBm8E5FC/v8eEZbHa6SBnQVXldxEMzxJY6Z8NHNVA9UmKBiq6a?=
 =?us-ascii?Q?ln1LVAIDpAt/W7VWBK9gJZj4JSe+ij6+3r4ErIHVCCABYTld7J7gGGlSe0gH?=
 =?us-ascii?Q?mGcEUBkoLqhEnLtyWjeu9OHh6CbZCRuFr2D9TvHfdiNEIXqf9KX7MbX6PqzY?=
 =?us-ascii?Q?4aqzKCsr5LRJWh2AwGHdAZJFFzh5SETwYsSJTgo64JRJI7Ul6SAYVIoNfq13?=
 =?us-ascii?Q?nnSos+MrY9NoG8xxwTTtwpBwyCm9tlS0dfc/jX5cq4bJK01dRM/0P01dKloc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	JQXmBKu3ceR4kGzS/xt3s4rYQkTjasmUjFG4TYym6UK3MBerJKbjHqgu9sIXYH0azuIwlIuBLHJ3Wn9RW4mIJ1iamoXlwgPMqLaQfhMF58S7V0khS9F9LxeLxgYOMOH08rld3bgfm99VcU8YIiWBju6M2q1Ifni6eOiDWXo3fnr92voAujQaPXPdq25YRg+UgCc4nyaDuEvkLOmpx7ZNobjSgKH791a1WMbBdBux4Lv0iGnEqHxarndn5TZMfkjbdC7xpw88GCg86Vd84HnlknkfiQ85vnJR7VVlXv4lugEt6IGaaLHcZC6l/k4PGnzWF1c6Spfta1bq234VaU1M9PCEKTo9Fc8VHqdHIa9kpv4dAQYfCLCv4oAbi+dOG2BOGjyE3/Wj88cK3KlvK1IcQcRUgjeEFS8EIJQDiwAFUdUodhalf68yGu3MVBdtEmvUm/LcUTKAXFiPQg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97333584-713b-4059-d577-08db6b6a7926
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:44.7491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTvX7Zy3tHVNCr8/uzPA9ZQ3JS1fsvxHN2xWhUjAYJK7zOAEwE1tJ3JN47vUt+ToJ9PiMHNFSgu+w7bXHW31vGS6SKt7dsbXR1xaR0XW9Ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-ORIG-GUID: 8tbfFcKUB1tUEFr1Ez9tM5mBGFvsn4Wi
X-Proofpoint-GUID: 8tbfFcKUB1tUEFr1Ez9tM5mBGFvsn4Wi
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

The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/riscv/Kconfig | 48 ++++++++++++++--------------------------------
 1 file changed, 14 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5966ad97c30c..bcaf49007237 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -585,48 +585,28 @@ config RISCV_BOOT_SPINWAIT
 
 	  If unsure what to do here, say N.
 
-config KEXEC
-	bool "Kexec system call"
-	depends on MMU
+config ARCH_HAS_KEXEC
+	def_bool MMU
+
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+	depends on KEXEC
 	select HOTPLUG_CPU if SMP
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel. It is like a reboot
-	  but it is independent of the system firmware. And like a reboot
-	  you can start any kernel with it, not just Linux.
 
-	  The name comes from the similarity to the exec system call.
+config ARCH_HAS_KEXEC_FILE
+	def_bool 64BIT && MMU && CRYPTO && CRYPTO_SHA256
 
-config KEXEC_FILE
-	bool "kexec file based systmem call"
-	depends on 64BIT && MMU
-	select HAVE_IMA_KEXEC if IMA
-	select KEXEC_CORE
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
 	select KEXEC_ELF
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
-	  If you don't know what to do here, say Y.
+	select HAVE_IMA_KEXEC if IMA
 
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_HAS_CRASH_DUMP
+	def_bool y
 
 config COMPAT
 	bool "Kernel support for 32-bit U-mode"
-- 
2.31.1

