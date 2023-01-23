Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826F678723
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 21:05:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P11L21Xvtz3cdG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:05:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=L+PUpllT;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=JKtX8KAB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=L+PUpllT;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=JKtX8KAB;
	dkim-atps=neutral
X-Greylist: delayed 4633 seconds by postgrey-1.36 at boromir; Tue, 24 Jan 2023 01:43:42 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0tC21Jyjz3bP0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 01:43:40 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30NEZdu2005391;
	Mon, 23 Jan 2023 14:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Gy9XtQkh82kCNUpWE1elmOFDlNfw+Jazh+gK+tq7J40=;
 b=L+PUpllTJ7oiLBgamYjJVPGr+NczbtbSdgyQw4j1vEl36qzrVMSbWkqjzEXqmJsxUiJw
 2GY8tuOMoLlr3CGK+WB4VYzdh7kB9yVFz2RyO4D/wpR79yFWm6wqlnW16G1+Zzji58Iq
 NLvbiisk8USvDIYuVJQ5xX+ppL2W4m3NFGlejNGvMAWbZgEZy6LAaQUAF54x9yhLJ7TW
 6jfTZFA4V5Y1fMZUKN8VNMfrCJcbFEjTP3G8evcYFVNR3iRjv+FL+rjX0TT0SzVDyLGD
 hQBghyuA7JZsEUJwZj7SCQVqi28rEBbnDuzvCqlTJQGE+iW36anONmT+741z+Bxo4hq9 Og== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n86n0tx3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 14:42:56 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30NDalLb034751;
	Mon, 23 Jan 2023 14:42:54 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g3vdej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 14:42:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epadlBk471LjBIZPMbK5JAMTBMOnxidAOm7mOyAu9Z17fvLKO5twVPSHSq7WZaIV/qhrgeqJiKTyceHeR/pcp6D2anSheERlPy6ihV7OqxvKtSFERBF+0e9zBDpLF0Kf35ZHT4zO+RnB6C2T3GOSyPmrbi5fyOaBaJ/aLOKs4oIHr3umfyJKnHSQ2DDi01KzabWGhG0KjGQXPYPyt77IBvAbMsmYn4lc6nzWfqrK4g9IJS/omHmlhfJ7qXzE5ss4r31O5O4qQHbLTxq5dAItr1XrJUh0NsPTcXoVpI0bCHvLtmAvGlQXIYye0N2IAc+IkSRoFqrUQa+8DP88BJZ7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy9XtQkh82kCNUpWE1elmOFDlNfw+Jazh+gK+tq7J40=;
 b=jyKDN8etHQyW5c8QCpxVmmon4AfCLLvBir7AqfHZclLmkRyE+k7eZ7cje3se0u7TQQOjL+FfeeqcOBWKYkVMpJCsujaCZpnrPe5N8Z0APQ3XXyhi1Kp+659poFnzMUlXS9jbbR9VCFSCYUPpobDlUj8U+z4pxGwFzOm1pmcJ71ngGuZsDgeIjU0Z1DMKIL/318CjACuB97Hi452WBGtydMsuHpDtaWhrq+BcTagtC1OvMLUXJXlip8RE61iz7Hxr+/zqh+k7nmvfQ+ckhDt0XU4392mTaTKvoee3OBHre0w6OqtzWMId0zAqcZCafcwUiChK5JT5Dmj4Bf/uBJ0Jzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy9XtQkh82kCNUpWE1elmOFDlNfw+Jazh+gK+tq7J40=;
 b=JKtX8KABEG5W8e1bxqcxFzpU3Uchq8doKYdGmqxKz/RtS9WNAL9qOuF7fbvqSetaCQjwi8wQMElfPAKXmy8CqjdOzj1N7usu7jG5QaU1VkmNiFr5+Qej7X5QbZtHQdaqSDnB3BLJg9bgSmKrJcX84tBlY7VD//wm0gJY3b9ydiA=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by MN2PR10MB4285.namprd10.prod.outlook.com (2603:10b6:208:198::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.14; Mon, 23 Jan
 2023 14:42:52 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%8]) with mapi id 15.20.6043.009; Mon, 23 Jan 2023
 14:42:52 +0000
Message-ID: <9106ffc8-6374-2af3-8997-dad789e4387a@oracle.com>
Date: Mon, 23 Jan 2023 14:42:45 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/9] perf stat: Remove evsel metric_name/expr
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
References: <20221221223420.2157113-1-irogers@google.com>
 <20221221223420.2157113-6-irogers@google.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20221221223420.2157113-6-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::27) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|MN2PR10MB4285:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d3be86-11ca-45bd-340c-08dafd501b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	POn0UwVqWahPUu7Bv6S1hPS49N096rR2tZjZwLQZGfhthbcAnPAF67+fmhSPxkm1L0RbgQdsW772Od+qLkyIacHVgd12SQEjNrd6561kfQXnkvA09xoJ8GQ3k5b8r1hk8HPtR5/aM92RKJ11IAlEDTspho+ZQDBaVl4jPEsawt23kexQkDLMzOftDs+8rrh39JY9x1o+A0ImMlk9hqBSwrFoQzmBBuVi0Kl1LI6u5FsnpLwhkYyVFSvImsIvN7bwuYn0NoLPJGH6XPlwwzpAN24Wr5VBDQ65Yl+Eqzl6UT4i4cbRuE4xuFxGvjjk23hbhMpKM7Io55YudE8a1851PEYg91W2dj2qDA2hce4HnWLjAf6M2gXGhWHsVzZfNkSO7qf60bqhKmTnw+IPgbxsmT9qyEUAeXPIwEFWf7SpIz+hoHJZXegE9NtUrgVKHwh/FRSUlrpnxcmGmn4VUna6/18ReVWtnDYuKQ4U6twyqv2pF7CvoxcSb7bR1UaDwZ/X/fRkpr0+kgqIYrsHc4gnqLywNHyjexYTCc6QikGm/b5Nh9n4mToyjc1TXXS/wanASuZiQq10H5l1gSiMeH4EV6fGUxwQ8UdwC/ReQDD9KxSN6lTEw6MNxvHHeD9LQr88KWi+sFBXbWSZK3puiiFFrNq0X+afHXvDgyV//Em6rKBu6tWxJO8/xdKkS0on/hQNW8HU5VjJ/jtznw1gLXkdbIvPZ7c6Si2ogDNiH7iHMfUht850uiTgsPvq7MnFEdHR
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199015)(558084003)(86362001)(31696002)(38100700002)(5660300002)(7416002)(36916002)(921005)(2906002)(41300700001)(8936002)(7406005)(4326008)(186003)(6506007)(26005)(6512007)(53546011)(8676002)(316002)(66556008)(6666004)(66946007)(2616005)(54906003)(110136005)(478600001)(6486002)(31686004)(66476007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dmNBYVBKQ0l3alVEUStzdzI5dDRmY3lOK3dYQzdIbE1BcVRQSWFYSy9DUzND?=
 =?utf-8?B?cWZocWxsUys4c3ZEdVVodnhpQlFKT2dhaThPNW01U1V0dm53b3poTGZFd05I?=
 =?utf-8?B?WlkvMVpqUkdsL1NDT3VTdHd1TXR0cmZwRWlzaXlYRjI0WHRJSGhzbURrZlQ4?=
 =?utf-8?B?U0RjU2h0UVY0ZEJVUm9pZmM2dWpicWRlTXdERWsxOElsb3Z4SDQyTERPREpZ?=
 =?utf-8?B?aXJGVmxQVU9VUGJiTWJ4a2lHb3pUc3p3WmJGcENKd0FwWFRuSEx4T09MYzJJ?=
 =?utf-8?B?b2d6dktQc0hKUWNIbG11bVVkRVpkbWRUM2pqMUV3SU1WUU9vL0didGpKR1Rt?=
 =?utf-8?B?ZzZ1RUNDaVU1bitSTUhZSFlLbXZ5Y3BlVTlGSTFCTGl5bzZpcFlKNmJQaTIv?=
 =?utf-8?B?eUtqZkl1UE5hVS9yV1FoTndHN0dqRmliRGkwTEJibGs0WXduTmJOaXdkRk94?=
 =?utf-8?B?VmRtZHdORS9HT1ZIQy8rYWJkUTJjYWVNV292NmVZQVJUZkxzNkY2bk80My9G?=
 =?utf-8?B?S1dtekJGSzNVdFJmNjFwYzhkZXRLcEduZEdTc2d1OTVqazNHQWVQSy9TWGpm?=
 =?utf-8?B?WDJDckxMZjBNQmltM3BHdG15TnppcktFakoweXpnRUt4ZzV1Y2NtTnF0U2lN?=
 =?utf-8?B?eDdMMm5jUzVRTDAwcVFhdi9sSVRxNkRqemFmQVpvc0Q0RERYR3IwUHZ5N2Jy?=
 =?utf-8?B?aVBVQzN5b3JnRGJ0dU1SREMwOXRraXkwZW5GbmgvVGFIRnlLRUM3bjJIRGNR?=
 =?utf-8?B?cjFXYWdQcll2Y1ltZll3RGVYMFdJWHMyTkl0QlRIRFFuajBadkw2UTdzYXNQ?=
 =?utf-8?B?Q3liVXkzSHB1ZTkxeHJ6UFptY3UxdUVuenFkZ0R1T2JKdkFTay9NK0oyR0pG?=
 =?utf-8?B?QTY0OXN2cG4rbmNsemhCTlA4RWQ3M3JCUFBITExkMHgveURPQzU1QlpmMzV0?=
 =?utf-8?B?ZGY2RmhWbzlnbVlybDVjRlRoZ2RUeWIwTTZucHh6Z3ovVEVIcnN5T3drZ25x?=
 =?utf-8?B?bEtCUTBkNHpmMW1iTlluQjZTSzZNckNVUGh6eUVqcGYzTHA1Y01PQ21DcFQ3?=
 =?utf-8?B?MGxpeHFXVDdUWnVzNERNeDFlcFloZDVYRjVGdUFzMk53YnNTL0ViVlI0OEtY?=
 =?utf-8?B?aDVnQ2ZYRUYrY0FzVUhIK1BCWG1VMzI0bCtjOHFPQzhsamw3YlNScTNVbGRF?=
 =?utf-8?B?d2NndXV5Q1FGaVhaYzMzeUNoYUxPZkNwWEtFMDJPNSs4d0xwd3VqRGM2bk1G?=
 =?utf-8?B?Mng0Z2lXTGM1T3h2bEhMTWlrTmJPK0Y1bFc3a3Y4d2RzaGFZakZFTURFSCtP?=
 =?utf-8?B?dVNpOVVSMkFsSDBFY005VTJRL25wczlISUhCK0Rvak9lemJxT3dlbjhxRURi?=
 =?utf-8?B?TzBtcUlHODVSVkU0T2IvYmM4R0VwUGlQaTkwNm5UVmFQbEoyYkhJQU5tSWlC?=
 =?utf-8?B?cm9NeUFNSXR1NmJIZnliSzRRUWZ4RnUwSVVlbnpSY202R3QxUk9aWG55L2Rj?=
 =?utf-8?B?UGxLUjkrNE1NM2hISkpHditPU3NBTDJQcUFTZGtBdHY3ZGdScVRCeDJzUWRi?=
 =?utf-8?B?WDRsVVRxNjFjY1RlbDNjbnpNeVBoTmh5R29KcmJjaUNSMElpSkwrUzUvRWdw?=
 =?utf-8?B?SWhyVmV6OEdMUG9HWXRFc09FNHhwbjZpUUptNVFuTDA1REJRZDVJcmt2SnYv?=
 =?utf-8?B?WHQyY05uajR4aVRXckpBa0JVY290MDMzSm1ERXZZL09zMVNxQVozdXZtZ2dQ?=
 =?utf-8?B?Q0R0eEV3bkpZTVV6d1lGdjN6d3ErL2RMVUd6bWwwSXN1QXYvTSttUXVyTGd4?=
 =?utf-8?B?R21vUXBndXNyaEtlODVuOVRrVlZFNGNGbG80ZXhOZm1CU2ZuQ052NTUybE5P?=
 =?utf-8?B?WFFVbFVwa1IvSXFMUVIxUk9WdkRndU9ZTzFJYXNDWWttZ0hPenEwc0UrTEN5?=
 =?utf-8?B?MzZSOGxiS0tZcGhQOVJraG5IMU10UC90R1RQWlJCaTloMncwcnFpKzNtd1pj?=
 =?utf-8?B?SVBKVnFQaXZQdlNUV3JESk56WnlPL29zL2tPTjZJdmRWaDNKSVVUdmc0NEJ4?=
 =?utf-8?B?RlFqUUErNDhmeFI1L3ptOU9mU2VuMkd0V1NSaHRLTEYvck0rT0ppNFY0SGJ3?=
 =?utf-8?B?cW5tL3ZLOUV2T21VODN6MDhkT0huVUNxVlM0UGQ2QVNYcWcycXBEeFJNYkJv?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?cGtocC80ejVwYVc0R1pIOHFMZVZSNlVtWHAvdEN2M2huejloeDd5NXA4bmtP?=
 =?utf-8?B?U2Y2ODJqKzVCcUY5SjZoRmYyck5LV2dOMFhrN2R0Q1BhaEtDT0E3ZHQvMkJ1?=
 =?utf-8?B?aXgyOUxUUkdMMmhmdERkOENpeWkyeU5udklaTklqVXN5Y0hHeTJzbmhTSGI1?=
 =?utf-8?B?QkdDcHB1UkExbnFsNXdoUFFEQldqSVluV3Y4Z2hLQWxtV2RDd0N1TmhsT1k4?=
 =?utf-8?B?dWdJVk5WMGxjSHVud2M3bkFnWmgySitTd21BU2dMSEY4cnBqbC85dE9jVk5D?=
 =?utf-8?B?ZC9LYm8rcEg5QWpDTk1ZNHBrYlQ1TFZOckV0a1dUWnNYeUgzcDI3b2hHWmlF?=
 =?utf-8?B?ZEpDMnhHUGpQd09UdTQ2MklzZ2pRUEl0NDhnWk9PaFJxdXhscTdXdmc3YTVH?=
 =?utf-8?B?WHJVenlpTzlSWkRQV1Q3MGMvRzNSVWQ1eHA4dG1OdktoemZaVk9rUTJXRzZa?=
 =?utf-8?B?ek4rMktRZzAyR2RiYitZL2lxT0w2V1RqUWJoZDJkZlRraFpLSjA0eW5jLzg5?=
 =?utf-8?B?TTBlbTJiWXNWOUo2S0E4TXNJbDhidEwvVVJqaXdEaHVIZzlMa2dGTFhDbEhk?=
 =?utf-8?B?NWk1QVVLSDhFd2ltcW1TWnAxVGpPNTBCcXQ0dEIyalBmV2pqdU9XRVVJYXpq?=
 =?utf-8?B?bHJFQVRpR29tK2ZQZ0FBa1M0ZGVVcXE2eHl0OWxiWTFhNEZZamFsckNuUkpD?=
 =?utf-8?B?NTdWbisvNURPelA5cGJDT21hOEpRMEhBMm10NVZ5OXFDcTBiRm4zVytXVkhN?=
 =?utf-8?B?b081cW91YUgrWlZ6eDdsUmZiQUdVZFVGT0JoWnFGNXRvOTVnWXo3VDlpdFg2?=
 =?utf-8?B?UUNKTVJXVS9uRnFHWUFTVU9pWTI3K1pFS2o3VHdkV2lCUVNXa0kyVDlFVVVl?=
 =?utf-8?B?M3VnbGFKdmFQMHhOclQzY2s1Y092YUxNcjZvRWZmdmNWUjBicTJ5ekRuR0VJ?=
 =?utf-8?B?QXRteVNUakNvbllCR0ZqbGdybUY2bG00dFduS1Y1U2d0cW1pUjVVaUFjYTh3?=
 =?utf-8?B?bTBmQ3Z2YjZUenZXbjl4UEErU0ZqNGRXWkNRYnBlTnE5Smd3N0VoQlVpRWJk?=
 =?utf-8?B?dUVwZlFVVEhKeThhYmY0Tm1DLzh0dW9zWDhGY1NGVE5oTWgrYnNlKzd5QUJz?=
 =?utf-8?B?WWlpUEhsSEVETi9RNFlYVVZkKzlkWTc4R0diL3ZUN2RhRGZ4MGpVZ1Y5Qmhu?=
 =?utf-8?B?VWZLck8wQVhVSVhtb0hoMVlwRE85NzhWQm1uQWVDWWZBdFo2RVUyS2xPNmJP?=
 =?utf-8?B?aWZ1TWFzUzdiRGMxQTJ5SmZESGc1ajRTVUJTaHhjOUtWWjlxY1FVZ1BPWXVO?=
 =?utf-8?B?ME95bEtWeDJ2U21vOGZBZU5Eck45MUZoYTcxYnRVZ2ZkVVpsVEM5aXhvWXo4?=
 =?utf-8?B?ZTV0bTZSMUtzbzI3cWE5QTNQZG1ONEhsYkVaa2RmQTAxekRvdVZYQWppRVJX?=
 =?utf-8?B?NDRGelI5RlIvaTd0SUJQaFZZYndqU21ZTHFWb1I1RUh2UnpWWEZWdUdCM2lV?=
 =?utf-8?B?bnFvRjNjSzBadUdsQmxpUlBGRFEwQnNuMm1xenE3cXo3RGwxUXdFTmJzazFn?=
 =?utf-8?B?Q0ZaejBkM1h2QzJqMVRWRjUybE1Id2dmR2VSMXFHa3lJMnRLZlhXMDRrUFFj?=
 =?utf-8?B?Wmp3MncyS3U2T09OVHZQUG1WKzdsbXh6UmtKRGFrcmpVeXhCRFhnU1hSWDR1?=
 =?utf-8?Q?9BK/lq7cn0CYZ++Cp7WT?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d3be86-11ca-45bd-340c-08dafd501b15
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:42:52.3369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hep96c+kaGUypy/+ya6ZoO+AJo7ONZPz8tSYOAQzbzHxuzIaxkD1I2RNnU3DEO6CneRU0t7jKB7Z8e4LEHln6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4285
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_10,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301230140
X-Proofpoint-GUID: SM0S1awB5jeogYaU6rYmfv7GOA6aXfL-
X-Proofpoint-ORIG-GUID: SM0S1awB5jeogYaU6rYmfv7GOA6aXfL-
X-Mailman-Approved-At: Tue, 24 Jan 2023 07:04:25 +1100
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

On 21/12/2022 22:34, Ian Rogers wrote:
> Metrics are their own unit and these variables held broken metrics
> previously and now just hold the value NULL. Remove code that used
> these variables.
> 
> Signed-off-by: Ian Rogers<irogers@google.com>

Reviewed-by: John Garry <john.g.garry@oracle.com>
