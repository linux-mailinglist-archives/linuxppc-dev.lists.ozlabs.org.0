Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D2B679E96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:25:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1XQ42Bphz3cCD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 03:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=Q82qVJZG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HLkOv2hN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=Q82qVJZG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HLkOv2hN;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1XP6697Xz2xVY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 03:24:41 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OGNl66027857;
	Tue, 24 Jan 2023 16:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=CdFnjCGYF4mpFhq4u0bKZc2ypTbg/1PC9CXC/cOgGRM=;
 b=Q82qVJZGotIkjVG4WDjpPmVoP66IknMg6uuLS9Ib6bxtOo8cjY6gOkuW2nbhDRHKMHGX
 79edxpE7TQLz8E71hR9sfsX7MxArfv6dkL765MnNOkfiekXsuJ3/v3N8HqqfuiR2JNCC
 NNpzjsjSkhfkJQj/NL3Mt8TOY9uwS27fETO4wJ48X0p+KL0xkfmxbxPNl/5pZcTGqL3r
 VpYsbom58U6kkKnSkvijVUpJvuOkVI2HM+2EL3MN3L8F5xzL2KHJUX8bGZuTiolYHZm8
 E/hPzbAlLoH1i8ftF4jnH9XuKkJUwfAySOKqmatW+JSzw7WuQe0DV+WerPllM9cTU/dY WA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n883c5u09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 16:24:16 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30OFb5Hf029370;
	Tue, 24 Jan 2023 16:24:15 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n86gbf0vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 16:24:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYdKHHAh2MgQs5B3lbVFf32wZR/RtO3sqlD0+V/n4kBGyC+pZWhYPDmoeoyJNYb/1GwxUOyWdqUNXHSwAFxWRWg/Qa8g7P6Fey84GQ7sWOfQqYOiuqL2Fh/qborQ5YEmDH0y/bVHKwN4GDJpbXZbkwmab0WHmVFtiI0kBjLkbSsXrJRgxNbdtOMpDqIPoj0WwgyxErUagDT1DAKoCfakUT6IoCV1WxkRVdQjIOa9Gb1Uy2miRgKXGkBZAOOc16XQXCTsK5HNpXsBxCX7+UM9U9DyHXeghOPMiorIQAeohkJtKCvCs2WZXmzmsA28JgpiLGCQLxQGKNohQ9JwbR5E0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdFnjCGYF4mpFhq4u0bKZc2ypTbg/1PC9CXC/cOgGRM=;
 b=ogSWpZAdEuiI6Rd2Xw9T3h4EF7yIChkqkA2yfyMKnoazsTZZyxV+MjydlcxV8U/+VjTRCfXA8E+yhNTVEDdSQr/fsoiZFNo3IhIw5ywdu+tkzCK9DXKrVlUyFJScRUeC/FBFwcTNNZP+/TeMa0GCouwq02R0MArpGlWVQHnbJTEUnvOFmUN6TohCgbIVEkT3HIY1Y4grP9mKI17cPRNLzkKiGezHwpo+mHmgTPOZFhRmUIII+UH0xr179rf2MYPqnrPeaXvy9RVsa5HfJpWyYSFwhVc4cVHkVmg/QRUUV8hFHIRFj6qD5q9Ia/1FL2fEvNlFgvKN0q/+CuLUZiPDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdFnjCGYF4mpFhq4u0bKZc2ypTbg/1PC9CXC/cOgGRM=;
 b=HLkOv2hNsAU8Y6OBX5VzvMvB5KbowcQBnxUdKBHwaASmvnTSiaUEoAwFDrEXD4fQUQSMWhlXoAd2FxMgDuB+vDsZEdlG1dUHO8VWn8BkfrOW7FJul4U+b9SmwVVj2GNCK47vvbfzBY21vEintP0ttoAc9dyAHT8Q42F60Th0vSI=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17; Tue, 24 Jan
 2023 16:24:13 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%8]) with mapi id 15.20.6043.009; Tue, 24 Jan 2023
 16:24:13 +0000
Message-ID: <4dec78b9-2cf2-4983-c697-4951054733d3@oracle.com>
Date: Tue, 24 Jan 2023 16:24:07 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 05/11] perf pmu-events: Separate the metrics from
 events for no jevents
Content-Language: en-US
To: Ian Rogers <irogers@google.com>, Will Deacon <will@kernel.org>,
        James Clark <james.clark@arm.com>, Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        Kim Phillips <kim.phillips@amd.com>,
        Florian Fischer <florian.fischer@muhq.space>,
        Ravi Bangoria <ravi.bangoria@amd.com>,
        Xing Zhengjun <zhengjun.xing@linux.intel.com>,
        Rob Herring
 <robh@kernel.org>, Kang Minchul <tegongkang@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sandipan Das <sandipan.das@amd.com>,
        Jing Zhang <renyu.zj@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
        Kajol Jain <kjain@linux.ibm.com>
References: <20230124063320.668917-1-irogers@google.com>
 <20230124063320.668917-6-irogers@google.com>
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230124063320.668917-6-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0627.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::15) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c03559-1cba-4f00-2e34-08dafe276e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9/lvehbKeOzoIJeeYdTd8jJSf1G9U9MiDh7K4fNpREKXsUds/QCJBTLzEFwAGXBOVvXXFCQkiGQP5/9hjCBbzCneDI9KemhjFNA8c6OuctX7bSywEG/J5IeaE5Gr6TJgAeaQAgvu26Qb/dhMAuiNc1JepkWgWl34eT983zMZKPPgRqEY3D7B+DIPrYW5up+5I/upM1kVIqbYi5CaEUPLPAEnZGfuCeaae+2j0rhtUSSUFiLbzhAGT5xVJGv8pM5Y1HHgNAH+2CQWCgHbd46m4HSEG59MBstcrUt2f8JeK8kAu/fmmCJkVxfft35ryWwdoLvybeIsIw25ZvuBTLOogFs7DkdBDSl2+MOujO3L48//FJQbKxPxK71gUtYB/A3iLVdwYhaa7y6j2RMg5y8XSE0//aYWa2+IuD+Ht1KgCchmmdgkq2b3G1HdOLKF1G6gmAxoBirUv4QmE51q7d0V4qqtoBllaZtIy7zSF2nEiCZP3GoxRLMnMGPMdmPlacZSWx+d5LKT/XQw2OIkRMvZ3KIZ0aNODh3cfWO2kCK4777O4/+2HBWqwFDvest5eFdWQ9LN9L96qyo9+PM7+pGsA9Oh4W2wRSFOQsTmDY1CuX/t3CEaoY21iRC5ntQBPbOtEc0O9iEvbcCRhpZaG8lmMFTe8McQjnXEXTDE7lVS1uSTtiSkM1JMZvAn+m3y1Fsd+xC8/dI/A/AmXDCOFPup9hrd44NEfL8zOdEf0FbaySTj6Xybu8kUBecTaGDWFp75
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199015)(6486002)(7406005)(4744005)(5660300002)(2906002)(7416002)(6666004)(36916002)(921005)(26005)(478600001)(186003)(6506007)(31686004)(6512007)(53546011)(2616005)(110136005)(54906003)(316002)(66476007)(4326008)(8676002)(66556008)(66946007)(36756003)(8936002)(86362001)(41300700001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?a2paS2xVSmFXV1RaSVN0VzQwRUxrRW8vdGdtSTNYVVRqNjl6SzZMYUp5MWZE?=
 =?utf-8?B?aDcySnN1UXdjblQ5c281UXluZ3hLMGM2R2tKMHp1aVM0QlZYOG9nbWIzTC9a?=
 =?utf-8?B?MmZkZG9wUGVZMWVzaWdnK1VtclhkaTFRa1NVaDRTbFVZNDBkT1RFY2ZoMGpJ?=
 =?utf-8?B?Qk1NM3pDWlM2UEF4MWg3cnQ5L1JQQWNPTG53N1hTS3N2dmVCSTE0ZnRHTnRT?=
 =?utf-8?B?ODdISWp2OVMra2VVL0xiYTZjSlJ3K0dWU0F4RDBvQVg3Rmd6emlBTksrdHVL?=
 =?utf-8?B?Mmk4dHd3UGQzN2V2SExkMC9GaVFrSE9NQjVPQ1dpeHRlTzZRb1dDTk1GbUN1?=
 =?utf-8?B?MzQ4bFN3TENWTlRLNUNXTmNYM1QweWp6ZU1xRExUZ3NlWjZLNGZqMThFQ2pw?=
 =?utf-8?B?dlRObmVMTGd4RzNLM3p5WkF4TEN5bmlycEFoZEpMdkE0LzAwZ3VPWFRFY3Ax?=
 =?utf-8?B?NEZQeWFMTjNkcTIvdzFpTk5OdVcwcHJGS0dTdlNUZGdMQi9tZHRjUTFPV3Va?=
 =?utf-8?B?MWJORlViYlVaSVBkQnNoNjdNajBWcWZJMUpzUVdyQUY3cWhqWDVHR1Ewc211?=
 =?utf-8?B?YUlGK01jODZxWHhldWRKRUNUbUNYVXcySkxlbHhtbEJZUC9pOVM5SVlmS1N0?=
 =?utf-8?B?cjdINWhMY3NrZmM1bXAzbENoM3cydGE5dGpIbU9sVHQzZDVFMm1XTmo1b0Fv?=
 =?utf-8?B?VzJsYmEwSERGR25sbTZRU1dDNlNDeWlOZitXYyt5N2NXUDZLQkE2akdrOUtT?=
 =?utf-8?B?c0cxMnE5aExXaVZEVlNFRWZ4MEdUbklCZ1BiS0RQNlc3dzcxZEtubTZQUGp3?=
 =?utf-8?B?bDJmbkI3S2w5SWhVNlZ2bzdic1lXTURMbE5KN1JqRHJwUEI5K3VXOG00b3R6?=
 =?utf-8?B?bkJFTkttYWFRUzRtZHJCV3FXMWFvZWtCTkpNMnhrWUFjS2FKbGdwYy9lQm51?=
 =?utf-8?B?S1NYZ05qR0ZJdnVya3F0OTZ2dHNnNnhkTElhOW5YWEp6ODh5R2ZpRDVPRkhT?=
 =?utf-8?B?ZkZyZTQ1VDZ2Y0hyK1loSWk1SGZ3Vm1IMTQ4RFZrOUlQN25nemV2V3pvQmZN?=
 =?utf-8?B?cWIwdndmSW5MR0tUcjd1WFZSQzRtQ1BpTHd1MVJWTlhETXNwZll3M3FGNE53?=
 =?utf-8?B?eUVMcjBON0V4VjNXY01jWTAwejRoWll5eGxOcEJGQWphTTBtZzV1YkJZVmIx?=
 =?utf-8?B?YndmcTlLbzZHTXNnb2FGazNyQkZON0NXc2U5c0grSUZoWXVGY29adCtYaElm?=
 =?utf-8?B?bDJoelRsb0NzYUhuWXZEbTBMZzlOK0tzOG1YU0Y5QTFpQ0FSdHlYM2xjQnU1?=
 =?utf-8?B?UFBlaFZLWTBrVmd0MG1hS2dCR1FyOFZqK2I5WG5YUzRUbDYxaXhGN29rcWxi?=
 =?utf-8?B?K1FFMmcvNU5zbTR1cHNWa1QzckNBWEJWSGVvbHNYY2MvdWdKQndORGRJZlZy?=
 =?utf-8?B?a0tZN0doaGVpT2picXBDLzJJeHJ2d3pHaElzZ2h1enBlejN3UXZxcnE1Tndu?=
 =?utf-8?B?TU5IUmJrTmRxL1dJUVo1UExkZnp0WGhycHEzaGd3cGIzN1A2WjJNYjdJNzVp?=
 =?utf-8?B?Vm5hMHBVVnlYeFF3UU9jZVJPM3BmVjB0QW02dXZtYVB6SGxGMTUxTHpmNGtr?=
 =?utf-8?B?M3ZBQXJzbWdpUTJOenlBdGNtQXhQMElTWEN2NUZtN0szc0piNUJQZkhBSFFP?=
 =?utf-8?B?ZVVBYit4QkdVWXFnQSs1aXRhcjhCMll1Uks5amZhZkJVaFdyVUZRWTNKRHkw?=
 =?utf-8?B?UkVtdVIzMDhwMW1vdVh0UW9xeHV5RlBoYjdyeWd5dm1WUVBPTlhQNW1MblZt?=
 =?utf-8?B?eGlRQ2F2YU9kL014a0tRUWRuVVVYbEFKT2xVWlhrdC80aTl5azJqTlFMdlJo?=
 =?utf-8?B?ZC9zeHdRVVh4VEJyM3BvYXJrTFVTaGxJREk2L0dnWjN5R29ycTcwSUlDMzls?=
 =?utf-8?B?TVpUMGpiczh4cEtLcnp4TGtXM1Rwa2tEOUFNVkZOZktDN3MzUm9mZnVydjlz?=
 =?utf-8?B?aVdCaW5Md1dZMUVqSXlQdVlvZ3JGWGRzZ29UZDNYMk4xeTJyVUZ6Yk5vQVZ0?=
 =?utf-8?B?M2FkNnQvaTloZk9EQXVLR2ZZQytpMHZibXd0MVp1UWQxbUJKWG5SWEVWVTNo?=
 =?utf-8?B?NXd4TXp5TXJ2b3VXU0lJK0pORllxMzNPY1EwT3lyUk53eGJUdTVwSHM1MTlX?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?OXpKUUZGeUxXODQ5ZVE2UDVEYVJIMEJYK1NCb0U5endGaTVuZ21ZZUh3OEVl?=
 =?utf-8?B?eWRJS25YSVRxOFhRc1RqWkxwcjBWT1ZmeXdXOFcvZ0lEaVVDUWVkQnRJaXF1?=
 =?utf-8?B?YVZQTHVIM04vYTh2bzZnQWdjSjYwMkVPTUNreHNnSE5INDFLR09kc3FuSDN2?=
 =?utf-8?B?akQ0OXFoQ2xhZFpCaGdOekRzSU5wcVQvVFBhYklhcWRLSmM0eHhZL29MSGpI?=
 =?utf-8?B?T2ZBY0RtMytlMy9nd2pRdld6UGV1eXY2ZlY5N2xER2Y3VmJLVk9nZ3pWRk84?=
 =?utf-8?B?ZGgveVVFWFpseWdaR0dYRndrY3RVakZqdnRoSUpZUVZCMDlPQ0VqOWg2bVA1?=
 =?utf-8?B?RFNHTENKbGdoTERRMUVrT2RjM0MzTVNrYkttMDl2eXR6VDFBVmYwdjI5UERw?=
 =?utf-8?B?V3QyaWVCLzQ3dlFTL0VLelFRS01ab2FuVXpyYUZzR3lFckZsVFI0Z2pPZGRD?=
 =?utf-8?B?bW5LN1JJNmVRUXVqcDloZlczS09WZElmUTQ3dUF1c0lGazNOMnRqN3pBVVBm?=
 =?utf-8?B?bmtpc2dPcyt6aEEwV2JNWXlGVW5GQkMrNW5VYzhJY2ZsUEkra0FQZmFuMDNP?=
 =?utf-8?B?OEw0dGs5Q1VrNXNQM0t4cUNnME5TM213bnpQa01KNE95dUZUbGMwYVZWK2tP?=
 =?utf-8?B?cmttMWE5cWwzcGNMQkM4UDhNa2RwQnU0RUNTQmRudkpOam43NWlFYnBsVjNs?=
 =?utf-8?B?blowNmEzNjExcHZDOGFUb2xHKzFoZTl3N1RFMWdGWUVISGZuZXFMOCt6bjZZ?=
 =?utf-8?B?UXovRDF1MXhobVhiKzB2bUxzUS9SdVYzRU0rZDhZYW8xQ2xpZ245eDVXL1lm?=
 =?utf-8?B?VlZLaW85Wjl3dm80UW0wd3g2QnEvSnNad1UyT1ZPN0crbFN1cFdtSHpkSE9h?=
 =?utf-8?B?Zm1TVTBWSTI3Ynl3b1QzRTVuUCt0SEMyRThCeGtFTzhYaHUvbjdxNmZHTVFk?=
 =?utf-8?B?QTJSQmc0L3FQVHRVL2IwSGErZTFNa3JmbnUyYlBSaG5zaU9laWM1VjNKblJ4?=
 =?utf-8?B?RlA1azVXdXU2MnJFVm1WZVhZOTRheG9nRlRwMXZWK0JnUzFJaTBseWVLK2J1?=
 =?utf-8?B?eHRUUG5Gc2s2N1JNOWJaY3dOWS9ScW9tMjV6eGxBMkoxbXczYjE0d3VZd0g2?=
 =?utf-8?B?bXlMeXA1dUlMbGlzazcxWVQ2SGYwK01FOGlhRzFqTG82azA5dEZGWXJDUysx?=
 =?utf-8?B?M1l5dVFvQVBxQXZ1QThXZjA3Zit0OHVsOEE2bkFmOE1VaWhoOEFxR3VUd1Ri?=
 =?utf-8?B?YytCTUdSbGxNNWlyY0duVUNaQWdMQmUzaDk4MFV0cC9YNnBmTWlHaDhGcU9r?=
 =?utf-8?B?TUFsUU5KOE9peUVQZXNYMnZRbXhtcllFUDEyZWtoaEZ5UDk0TW4vM3JpRGxC?=
 =?utf-8?B?STM5YmxSVnIzK3p5cEZHS3lXRHdXODRudndTTkwvTm4zNU1wMU5pQmZaNXU2?=
 =?utf-8?B?b255RHhaU3AvL3c3UXdtMjJXRy85ajFxQ3dRZytCNnQzMXJzWjY2aVI5ODdk?=
 =?utf-8?B?Q1dXU2NoUmZ4ZTdRaHA5Z0N4RnBpRGc5NkdzT2Z4ZE8vdmRydzVtTXZjcGlE?=
 =?utf-8?B?RlQzYzc4a1VVVjB5dVRwZkgycW9PWTNUcHZHRzN1VSt5Q3lJWi9ZTGZZT1Nj?=
 =?utf-8?B?enVrbHFHS1cxc2xYeHNtMmxaY1ZyNTl1MnNxQ0xYbFgwYWxlWXFmOUpNcjIz?=
 =?utf-8?Q?oob1oJUUeCqhegY+rU6Q?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c03559-1cba-4f00-2e34-08dafe276e28
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 16:24:13.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ytL++hPnUSSkL4otPuuULnezNwYrIwKRvXl6wyzjvkJVRPUcCRLX+dZ0P1f3Nd9tz1s3wRsNJqj6psHwRFO/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_13,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240149
X-Proofpoint-ORIG-GUID: AAnqxb59ao-FyvBkdXfdSKhjjTdT6XXf
X-Proofpoint-GUID: AAnqxb59ao-FyvBkdXfdSKhjjTdT6XXf
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
Cc: Perry Taylor <perry.taylor@intel.com>, Caleb Biggers <caleb.biggers@intel.com>, Stephane Eranian <eranian@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/01/2023 06:33, Ian Rogers wrote:
> Separate the event and metric table when building without jevents. Add
> find_core_metrics_table and perf_pmu__find_metrics_table while
> renaming existing utilities to be event specific, so that users can
> find the right table for their need.
> 
> Signed-off-by: Ian Rogers<irogers@google.com>

Reviewed-by: John Garry <john.g.garry@oracle.com>
