Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E502C634327
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 18:59:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGsTW5cMNz3cct
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 04:59:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=V/BH6Njs;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Hk1jd7Yv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGsSS0Ttyz3cGT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 04:58:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=V/BH6Njs;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Hk1jd7Yv;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NGsSQ3Vcnz4wgr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 04:58:30 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NGsSQ3SGNz4xN4; Wed, 23 Nov 2022 04:58:30 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=V/BH6Njs;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Hk1jd7Yv;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NGsSQ0RcCz4wgr
	for <linuxppc-dev@ozlabs.org>; Wed, 23 Nov 2022 04:58:29 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMHhd7b016369;
	Tue, 22 Nov 2022 17:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=k7MRHePzpX8U9a/FqX2jz98hXMcYwn41rbcROhZSp9w=;
 b=V/BH6NjsvxDU/3wyJxe8xOgqBbBOTIFiPUG7qE2KWuOdLhFK4JUfBlV8FR9qkAsyn1BP
 0rjjFqHJVuS/QWINZtYim8Gv+chnlMNq/Zdc5q/E1kaeqR5M726msBov4WE213+hCb31
 D4VbVRtzzBxaQHkCCm4BdHXredaNQJchu5/cRXNZq2g9HictEpxxAtdKrAO23pj8pkBF
 w3C2clTBM7UiSOxQA639BRT2wl+icRSQghgzIKQ77qjcG0XAfUQfMNZAt6G3sHAfWGjy
 G37zc5yPqnzESO6OIS2xjabNMRYHog5hOpfuvgpyYc3/Rt0v7wUlvF+9YpXZJDiH1cdX Gg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kxrd80smb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 17:58:14 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2AMGRwLo038827;
	Tue, 22 Nov 2022 17:58:13 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3kxnk5q7dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 17:58:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsSl4Ien1+1rSw5dAleyVyLH4dHMFrJtv3dbOJN/VpB970ErKZy6eJ9r19O1+9M2n5kuGVe18wx2a+b8LP0mamJsBRv6AgYSJEZQkkvz8V5V33CCQEPIgasVVPcHbrPZeNnbcXNVsIaUgmA7LtC1NWKR0JLCr0QgsxQfUTVO3F+RLv80QJiq1OOT72xAQwDF7DqFxMtb0R2VZtXUF9p9RmmVZ+0BeYmov4ldm2YHvfmkuHn/fXvUzXtxZupXNcOKSWcZ89msEgW+Im6YPNdDRUtPe+sEAsilsrrGE+PRK3vXRJY0HdBdDC+2g+wBSxlAdGm0NIn2SG+E9yK1sfYjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7MRHePzpX8U9a/FqX2jz98hXMcYwn41rbcROhZSp9w=;
 b=gJpB/4wkOAlhi9QkkRtfFV4io9PsrZk1rF0NlBkj66rHc/RgXMv0e0mJuDUmkJHCe0FqabSdqyC4am/lUESfcH9umhvfzxjd3cx2Yc9PzHNXmqdWjtv9fWwEyY/sYBdDSIv2vmTxQd67oH5vBEzPX/8tsGGlbEiaswdf+AOAsoPdb2NuXOPcz98jEe76GwC/0mz0UHcGiTz/EZAdgWA7fvSZyjvihwe8wAQDXm9weIyD1bTtmrh+XtgnaiJczMWN4fEWd5K60FAfPhYpRiBCOK2U/MrGsMZBHRhPlo7cWZ5zCqnR0w7PnlxvH8H3Nd5tAkOHtMDhKjV2bv+HgC2G/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7MRHePzpX8U9a/FqX2jz98hXMcYwn41rbcROhZSp9w=;
 b=Hk1jd7YvPdDyPWxGegZwH7qaDRiFQ81UCGYaeBh+fyQPM6Rxcfo0UyUle7Im7gGF+NswqQbTPgEs8Mc/H5haMGlHq/kNDdZi0beh+BQgE8bLpRKogof62YINHTUvplYZE2xkDz8DahPbqV9pSo61cBGNNTZK+bBQyJWt76LLzew=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by IA0PR10MB6913.namprd10.prod.outlook.com (2603:10b6:208:433::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 17:58:06 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::f7b2:af85:fe37:31a7]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::f7b2:af85:fe37:31a7%8]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 17:58:05 +0000
Message-ID: <0af5f619-3b39-7118-66c6-ba5b0c85c3dd@oracle.com>
Date: Tue, 22 Nov 2022 11:58:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v5 3/6] crash: add phdr for possible CPUs in elfcorehdr
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20221120232508.327554-1-sourabhjain@linux.ibm.com>
 <20221120232508.327554-4-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20221120232508.327554-4-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0161.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::16) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|IA0PR10MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: a0df21ff-c19d-4aba-1f9f-08daccb31a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zJmuYrY2R8eIcRVSE8pYsnal1ohKpDdm/n/KzTEPEuk7yY1ipgN103/RVSnEGOIEOi+6w1RORKI/d/mQegOOuFvMHCjoTyVD6TD4stbDcoskBTlayssvFwDnN+qQqHNTzaV2dULZ1hsGLHrOIHcviFMcKrxVxVoEQO8FcHrhv4FG6eB6Ese7raRSvCkGaS8S+BuMRytCYN0/uZm13WmT66uemlFGT5hCqxTGWRgZdVZsDi6uNba/2v7PIEKN7DPLFivLYZ6QbWPugmq66ChZY7poE/JPeT3czRQL8kGMjG0d4/G5RY244B42kCEZ5FwgrWlA9IgLI8ksUNWivOkp42lEuV+T6LGDgMUQIBmsFHbWeLhvL9L93A/XhcqXtj2dtjSN4UkMG21jz+JwuWajj3xzJvpcZ/BS3zDEaawaY0kYFW7xpw3ieOHML4F5Xvl5uta3rBJ1Z+v3bVAaKvXmwYrmRYP/+OFfEj2Jhg8TsnK31UHa5DAm/3WKiLUB/ULKlHQ+ABbDoMpV1MmdVOARS4KaVIkVr90c8//pljETF63t2ZZQ7KlHYW6fGm2m9sqwgzLkRJodbpLDzLbqk18Fct9Mm5hpsgsJ6VHc+5DEP6zfbgiNT3GK0wFKVpFH+AzbcDdjQuF9ZxhqG+yauNpPq9MRH1xUBCcMFjNvmojl0al2f8PrQVQgSFLZoxx2F91MANOsHX1ctFtc/6QdoWhQ7hnWf2wN9spBl2GFuGNX/58=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199015)(38100700002)(6486002)(31696002)(41300700001)(478600001)(86362001)(66556008)(4326008)(5660300002)(8676002)(8936002)(66476007)(36756003)(186003)(316002)(2616005)(66946007)(31686004)(83380400001)(6666004)(6512007)(53546011)(6506007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?S05jNXlHcXVRY2NCS2RYN2liN0l3Rkc0UDZEYjhHQ0xtZnJmb0xUNWpGTCtD?=
 =?utf-8?B?Zlg5c3ZzZ1pEZm9PcmxVNHVuU21QSG1RSVoyak1RVWxBcUgrTmpjQWt0TFRi?=
 =?utf-8?B?ZU5lRHNYRmxpVmt2SjQyV0p3V1d3YTlKQXIrVTluMHV2VmpqV0hzbU5QZFdH?=
 =?utf-8?B?TDFhUVN4dG04dU1ZRGpncjFJeGtST0Ezc3FuUkpvR0RNV3JCdldxenpqYjdi?=
 =?utf-8?B?bzRPTGVGZ3hyT1FzL0gwaUNjQW9jMnVXT2tTbFNCY0lkMXJJM1JtOTFZVGth?=
 =?utf-8?B?ZVRxbmt5Q2tCTVMrbkxYbTVxTUJUQUgyYVlsY1Y1N0U0ZURBeVZ5Yko3OWtQ?=
 =?utf-8?B?M1UxN1JxUjBPeDk4ZzNEbnkwMlRFSU4rRlNjbm1sbSt1WHdHSS9GSDhqZm43?=
 =?utf-8?B?RlNFNWhuUk14QU16YVh2aHR1Vkx1cC8vbGQvU0tyZ0dlUEVFM3RJUEtrV3p5?=
 =?utf-8?B?RnIzOHBEUm1CWWI5bVRPWFNVMFpESjNYbWNUczg2ZDJiKzFKM0wxYjA1Z2dM?=
 =?utf-8?B?UWJNazBob3RXY2dqeTVRUUU5UFFjZTE0OVl6YVp5L0wrZmhlY3pTTnJrNC9L?=
 =?utf-8?B?djdTaFk0S3lydDlWTzI4NlIzMGlvaFB3NjBSRzZuZUIrM2lqTDd5OVJXeVlU?=
 =?utf-8?B?S2NOOE5JcVNtNTVUU0dHOE0yZnREZ0l5NndlUitmSyszK0U5Ymh4U1E3dWVV?=
 =?utf-8?B?V3JiN1VyQ0dQaUhJVWtkWkJVT3dUaWl0NWxBc0xtbVFiTG16c0VsakVBa1pF?=
 =?utf-8?B?OUkzK0hVaWFidUJ6RWJmRVR0VW5IdVBJRDRSRkd3TGNZREMzUkowdGZGM1hz?=
 =?utf-8?B?TjVzSExGYStJc2RjUzRBYVV0L2dPckRqMmdFaHQ5bFVRNUdhdlcveGNhZFVI?=
 =?utf-8?B?b2ZqU0pKWGdUTmVVL1dNTHd4U29FOUZCZmF6QmtkV1ZMcGsrc2R1eUQ3eC92?=
 =?utf-8?B?WVU1NVBNV25GdEpuV2JXM0wvaStGMStnUUsvSzFLQXpQek9XeEczc1pJTER2?=
 =?utf-8?B?MFdKa1VCWCt5Z29jbW4yNURtRUZsMjNZUkkwMktaYmtnUFdRSkVUNWNNTGgz?=
 =?utf-8?B?a1N1cTBadGEyRW1EQmxFWC9XWjh0MWhMdXlNY1poamk1WHdJS1JHcWM4NU9r?=
 =?utf-8?B?M2tvT05oV0I0QzBKQXZWTVZmMk9Ma0Uzcy9UV0ZGRlc3R0ZmOWc0cWZKczR3?=
 =?utf-8?B?cXA1aFNLRFpOeThtTHpPcktQbzhIS0VvWDZySzhsMEgwZG5pMENFNFJKRk56?=
 =?utf-8?B?YWJyOUd4WXlhd3JSZkgyOUMzM09aNFpMaEhPN3Q4NGQ0QVNKZEkxUnVzVWhj?=
 =?utf-8?B?ejk1b1dtYmNXQlljZDcvbVJlQ0JablZiQjNVZFZJUEQzTVZ6U3oyVlkrVTdy?=
 =?utf-8?B?WlVtZ3RSQVBUS3BPQ1lRUjVkZDNid2pQZ3pPSFUvMVdLSThBc1VWTzVrenlD?=
 =?utf-8?B?NUF1cXFPUk5SVGlHRHIyczF4U1ZwRGJqSlZObWxkeDlYTkgxVXY4R2xvZlZs?=
 =?utf-8?B?YzhRZVJ4YWpzNXhpWnB2ZHRxaGh2K1JtSWszRlJ6UmcvOUtlL1psQTc1eEI1?=
 =?utf-8?B?L1NvVkNRVk1sUmFzK2swT050QzU0eWhrVmxDaGlGNmV2QzNsaWFaUVU5eHdl?=
 =?utf-8?B?d0JPaVlKR1JVRm9xVlQ5a2ZSOWZ0cy9HbnBSd3ZUcXhJRGEyZHl5Nm5sSTBr?=
 =?utf-8?B?VkNtUWV5MFRwbjlVNFBRczRsOGtDWkl1bXJDZTBvTGRwQUFxVzlOOUhOcTRG?=
 =?utf-8?B?VFRVamtTdWozMzMrNXVlcnJ1eFVmcWR1YmlPSzBuem5naDFOaFBXY1FTd05B?=
 =?utf-8?B?TE0xcjVQMUFNT1NWOVQ1cEdlUWZCaEVSYlI0bXNIWUlwYTEreUVPdVNURlc2?=
 =?utf-8?B?SVF2V1BoZTFOeTJycnN0bHc3dzdmQkg3ZUdYN20xZnd5R2VXUW0xK1BFekJa?=
 =?utf-8?B?SnEyZUR1MlcwQTIzN1JNYlNyTlJVYXJCaXBVQ3NDaktOaEJJZkM0SXExWWcr?=
 =?utf-8?B?Z1d6WDdkK2ZlalM3T2NjME5MUDhaOWxDamIzM2VLQmo5T3kzQURuNWNQZ091?=
 =?utf-8?B?VkpHaThCVWw5VG1NK2g3WjQ5MXJreWptb1pheGNxUFhzdzU3TE5hMmsrR2Na?=
 =?utf-8?B?b1ZpazFJVmlwem8vSE5EMkU1NitxbmVxVnp1MUpMaE1lNThSRXBmYXpJbnBB?=
 =?utf-8?Q?IfxsoEh4C2VR5OPFOYBhhOY=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?Yjk2NW5LT1lhbXZ2bE9aZUJFVW9jdGJrU1drVGtwSm0wNEVlRjBlTHkvMXd2?=
 =?utf-8?B?dVY4dy9JNlFiQXRNQUpYQm40OFN5WWxta1V1NkJTVTl5MEczOU4zR3g3YWN4?=
 =?utf-8?B?VUNiMkNMa1MveW9VZ3FKRStwUGEzRURvcVFUZTUvbjBFQ2lBYkp4d1BTZmlS?=
 =?utf-8?B?clZzb3g2bk1vRGFXS3N5eE5zV0tIdnkxZ2NsRVZMclZJOFplKzFqSlJ3SytJ?=
 =?utf-8?B?S0dOejR6U3IxY1VielFjbDZRTHQ2YUJoa2N2MUdYN0VtdWtZK2VjNkRYRTJT?=
 =?utf-8?B?akFJOGczR1BrNnMwQVBGbjY3SHcyODY1K0F3SWF4ejVPWnlLZTZxK2M4Y2h5?=
 =?utf-8?B?bDVjUkplaHdlOXhuak5aK2lZNTZ4cm1ZS1c1a210M0UyWWVjd2hsL1NwMU5I?=
 =?utf-8?B?QzZYL0M5MlJ4RmRJV2NYUzNwOWFIQmpQSmN2N3VINlluMjRQeWc2bUJXRXhE?=
 =?utf-8?B?bC96c0llZm9yWDRkTWpVam5UVnZhMWhQbEREQTlTMXBRUDBuRndXcVNOT2tR?=
 =?utf-8?B?MmNQbXBndllZVjgzMG5Jck9jK1FHQXd6amFyVmZZbG85M04wQzRxOHJZNGEw?=
 =?utf-8?B?a0VaVTZMY2JLTlhYVzNwVksxdTY1QURGTzZybWp1OVJaRmdXNW9WaGZpSkRw?=
 =?utf-8?B?YlErNU9DMG1Db3ZoMDZpSHJTWUxjOUxQalEvQ2NuS1ZQL1o3bk5KT0tEQjVz?=
 =?utf-8?B?cTU0SlF3bFp0SkZwZzZpN0R1WENNSkdRVzJTSWlWTFpOTXpPMDMrWmdmMW0w?=
 =?utf-8?B?L0N2YUZCSGZtemgrU05nRjN3Y1NXalBZTXg0cEVGUmkyNlkvY3E3YjltWFZl?=
 =?utf-8?B?cSthbFY4Zm1PSFRqUThyT0pOcElHT3ZXSThwVUFUbGRMVjlyOGI4bHRsNitZ?=
 =?utf-8?B?eE1CTjIzOFVSVEFFb2VQQUhCRFhzRU85djlobVVRK2Nqd1I4NnlHYWc4VWFU?=
 =?utf-8?B?Z0JuSU9FOFN1aG5SeW4xUnhCQVBwdFpaWWszSWdGT0ZyQ0RtOVhDRGZ3dDZZ?=
 =?utf-8?B?cXZKTkpCZC9CeElXK2NCUExxdU9BbXZwSDFzUXhpeW84NkNVZm9JRXZjU1lX?=
 =?utf-8?B?Q1NDbXRGMGhhcGhhOTBSd2JnVkhlS3pwTnJQRkM5c2hKWUxJRkNQOTA4MXZm?=
 =?utf-8?B?SjdVeEY1ZThZSmVWRXRUbmlPbk1vUlBPNHRkR0VjM2kxYWppOUhmb0xQb05j?=
 =?utf-8?B?K0lHRkhlQWpPcGQyOXdhc0RuR0JuMzd2ZzRwRGcxLzhKcFJiVEdyN2pVemsz?=
 =?utf-8?B?T2Z6RnY3TExiVm8xQUdpam9ZdWVhZEVWZ0N3Z2xtY1IxZllRdkhkamFoTmpK?=
 =?utf-8?Q?YbDsNZXYjsU4BPje7H+H7PR5HcQrP6zCAc?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0df21ff-c19d-4aba-1f9f-08daccb31a95
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 17:58:05.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Blh5YDCNYrpdFltW1aTWgpvMKBgTvdn4LahUzungODE2QQdKPS62qkfcmYvcflsfX8iFHl4dRy6mSLnvyQUq/+zycLyzspyvzjGmJX44sSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6913
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_11,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211220138
X-Proofpoint-GUID: K00_pE3uECd0mlDaDdYtJ-noE1VXmelE
X-Proofpoint-ORIG-GUID: K00_pE3uECd0mlDaDdYtJ-noE1VXmelE
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
Cc: mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/20/22 17:25, Sourabh Jain wrote:
> On architectures like PowerPC the crash notes are available for all
> possible CPUs. So let's populate the elfcorehdr for all possible
> CPUs having crash notes to avoid updating elfcorehdr during in-kernel
> crash update on CPU hotplug events.
> 
> The similar technique was used in kexec-tool for kexec_load case.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   kernel/crash_core.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index bca1b198d9e55..f6cccdcadc9f3 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -364,16 +364,19 @@ int crash_prepare_elf64_headers(struct kimage *image, struct crash_mem *mem,
>   	ehdr->e_ehsize = sizeof(Elf64_Ehdr);
>   	ehdr->e_phentsize = sizeof(Elf64_Phdr);
>   
> -	/* Prepare one phdr of type PT_NOTE for each present CPU */
> -	for_each_present_cpu(cpu) {
> +	/* Prepare one phdr of type PT_NOTE for possible CPU with crash note. */
> +	for_each_possible_cpu(cpu) {
>   		if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
>   			/* Skip the soon-to-be offlined cpu */
>   			if (image->hotplug_event && (cpu == image->offlinecpu))
>   				continue;
>   		}
>   
> -		phdr->p_type = PT_NOTE;
>   		notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
> +		if (!notes_addr)
> +			continue;
> +
> +		phdr->p_type = PT_NOTE;
>   		phdr->p_offset = phdr->p_paddr = notes_addr;
>   		phdr->p_filesz = phdr->p_memsz = sizeof(note_buf_t);
>   		(ehdr->e_phnum)++;
> 

I did a quick test of this for x86_64 and it works.

Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
