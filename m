Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0443C67E660
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 14:16:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3J4c69Vtz3fHX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 00:16:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=BYqNcXS6;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=KgvyxR14;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=BYqNcXS6;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=KgvyxR14;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3J3Z5hNDz3fDD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 00:15:36 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30R9T2sP032016;
	Fri, 27 Jan 2023 13:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=ExfD5fGDIZhK508nUpi9R4sSedyJ6+MNZ9VUVB7wTjU=;
 b=BYqNcXS6upnqvDwqS4rKd3XPCOIcxecsUng+qPrqiXCP/+j5OXse5D35fnJ74d/Hq01T
 /tH0WrWh6OxsYnMTT7mqf2z2cjtEO3Q+YxewThkf778jWDwZ2oxtvW5SkRIIyq8KNWRK
 wLygMszlrVrpULnEpr5ozQo2kLObAaXtepIJJouxXkqzlj4YeeS5adkGDaRRb7oXZvww
 oEt0ojSqgaMxM2cZqb7Dah6GxF6ETG8c1DJaNzXe+1fCqnQQeMQq/8SURFjDbuHXxqxY
 03aPZLWd4pLw0tL6CMMVV/ujFWDK0O+XkSTJmOaRh1lR2jabN60+G6WNReOgfEocvNKc 4w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n86fcmrx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 13:15:00 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30RBt5FW006630;
	Fri, 27 Jan 2023 13:14:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g95wc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 13:14:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3uRzaL+QIaOGSrRGoKvs/fjtvti35z95y9Y+5KfbpWQ9CgEQ58ZE3tSeJ4XnWGdiSnj6bU4W6VjcYdT3b/TASj5e5i+n7CeCyKNDPMZvi3/OZtb5eHAwVz/OYgnxKjHq1WjIFIGEOzaXWybHw6ti1ndoi0COl/qh2MjNWhtXs94iFYw1qvGLd9O+ScwhG2mkYp3tXpLXY0BwBt1drFvqOScXTHwsziE2S78irvHmwd8kRHoV04eWq7kQCoC3fhylNatqbMsL+No/gKSPQQPxisBoCiDmsYkLylzFSxCFy9fCKIRuxw+Efg4xAU+QzIHMGUG0fatiXkO+I8AgyJHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExfD5fGDIZhK508nUpi9R4sSedyJ6+MNZ9VUVB7wTjU=;
 b=HwFz2Sn0k6+JkvEU5DwiqMNEEMnJmVXCn5CeTQV/B4x4ypCtIfS6LuaDINj+jUAPCX9FCdk4FRgdImHsksV2Rgukuym3WObIJmW0LgdESeGsMyGjcLEf0HdVQrDCwdJncLDp5LUJvTOC587DXz8igRSAHRBP7uxBH4cnYzCDygVcLzHv/5q/kCvh3EWzqYDrnfB75/iVCLAKTW8mtZluQuu0VWdI83pLUW8ZpJoxwOoQGS04RHMhpa01Zh4QsGnnLTeCIwdtwteel284MBK2h0DC7p0FtsWMl7Skz0KinQ7YrUm663GydDHeyEsiUaOTmLD8vSzHY4VzknY80V7Yjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExfD5fGDIZhK508nUpi9R4sSedyJ6+MNZ9VUVB7wTjU=;
 b=KgvyxR14rbFBAgnwKDWq+oDDFV9fQ7jCwKLuNlM7pqrUTxHFuOJsZ/h22S5jCGW6cUhIaT69tkmb7v1l0DyO1XIS3h8MG4hTnWTaHsiJZ2G+N57AupkBZz4pT1qQlTJn7ysDhItLY1y4k2UWOY32etjWsz/eH5klzXhy98K4wJA=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by IA1PR10MB6123.namprd10.prod.outlook.com (2603:10b6:208:3a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 13:14:56 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb%6]) with mapi id 15.20.6064.010; Fri, 27 Jan 2023
 13:14:56 +0000
Message-ID: <3d7a7807-e109-4601-ba24-7d3b6579d981@oracle.com>
Date: Fri, 27 Jan 2023 13:14:49 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 11/15] perf jevents: Add model list option
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
References: <20230126233645.200509-1-irogers@google.com>
 <20230126233645.200509-12-irogers@google.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230126233645.200509-12-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0143.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::35) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|IA1PR10MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a55ad8-b235-490d-7020-08db00687bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TCMpcCBRtEQdPKe7/egz2nS+2r54hnvDmypm1YHN2+uHEp6/tEZm0W7df6utEQK4d7JifV3EAQXhqz8lBwz4hlTa2Pfstgn3TP06nmqeaWR6MzYdXGxlGYE4LYOasmwM0H4T649rT+2tbk33AoF976rESFtjk8+KG6sgkukNQiouvclB7aGV5f/7x/wqhjS/esI93aVXtr2NmX/Wa5KC1P0hvsDBtYJq4ocpex/RWIwMa5wEkB4fE9bmq0OBjTjuAx4/w4mMwNQmBSgdMRSVrF30PW5bKH98+6h7DlM0MQ/E0sciTu7JlqnifnvAY26BGIrJXoAlsfyFInVryEYCK2C8nr6CSwsK+xC7p+0CaQcTpxKn8yGGoLuIWNbLZVKI0zikDTQuR6fpzrtbppG8xiufcEJwFsqT4dzLfT9kvP2pJofO+/vASqXcz/CsZgcAilzdntlKYrOSeIP3WwbJYafCE8mtAUhJQiPOhSupoiq9igjMotkyaNwiJsbs0O2+MEdRJCRjKvL7puBk/TlLDutECUGMAlNQH/nKpu1wq302pef3y1pSNHaSphqvLcb7CUMhC0dC7BWAQVjWu/Adq2mikrOZVu7uTk2MoJcEY8dKvxw2NrvscZPILvR4+4s+LP39c64JlAxLXxTUrLJjTpsyjPkKGP9kL2xWT80pjX8nsRHA0qkN7vkvPd5I+KXIgN71X36UpGefnI+tcO/Pa63n5Bvk6lsIchOS4reJ7fGsbOKCLIFYuOl4W63mKH39
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199018)(36916002)(6486002)(186003)(31686004)(26005)(478600001)(6512007)(2616005)(83380400001)(6666004)(316002)(54906003)(41300700001)(8676002)(38100700002)(6506007)(53546011)(110136005)(7406005)(7416002)(921005)(8936002)(4744005)(86362001)(4326008)(5660300002)(66946007)(31696002)(66556008)(66476007)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MjU1ZVNsQVovK1pPWmRGelh4OWJ2d1dBb1dqTjBZVEJIcE9rWmdvb3JqV2Fv?=
 =?utf-8?B?RzZWYVVFK0ZucXNoejBvL3ZpMWluTTFzVFlvN1MxWTBiM1I3c3lHNng3QmRX?=
 =?utf-8?B?MUxNZ2lhSXdjRmpuV0FTZWdWU0NvMDIyMDJSQlhCZHprRDNnWTE3dkNzb1pq?=
 =?utf-8?B?QXQyMTlMK0FKVnpyYmxHZlhiMHh1ajFCQXFPWjNGWE9ROW5MSmV2Vi9GU0c5?=
 =?utf-8?B?VmpQWTQwUTViYllDRUNIMis1NlFTQXU4TnZBdEV2ZEVlSGtMVVBZQTZIUHhh?=
 =?utf-8?B?cHNMME1JMThxQ3lpczJPRDNaSjJRK3FGUTZSVDhzM0RaeVJaMVd1UlBKYUhV?=
 =?utf-8?B?dFlBejY0V1YzOWdaK21aSGl3WmhBdzZQd1hSZ0IwZjhaSnVwVTdVLzNpN0ZI?=
 =?utf-8?B?RkEzRVY5WlBjci9SSUQ4ckFjTnB5RkIwTkI1NzJ3Y1RCOVplZGNiODFUakc2?=
 =?utf-8?B?ZTJYaFFkRkNRcnN2d2hzZTA2bUJHOGgwczdRT21wTEVNalVjb090V2ZHTHY3?=
 =?utf-8?B?ZytrRXptU3o1ZFRxK3dPU0JHNG5laG9RYUZiaGhCZkl6VlR4bTVMWGhQY2ho?=
 =?utf-8?B?S2M0OC90Zy9XeUsxcVc3UDV1Mjk4T1U0V3lCS0o5Q0xTUnFMbGErQ0dEc1Mx?=
 =?utf-8?B?NG9nMmIzZG8yRmdPY2ZwcVduejZXVGFHU0ZEY1V1NzlKYTJuRndieFJ0V2dI?=
 =?utf-8?B?YnQ0cWtKVXdwMDYvMUF4azBicjFxWStCQlExYWNBVCsxa1VkT045YUZ2QVlS?=
 =?utf-8?B?VTZYTGM3dFV6OVEvN3B0dFViMXlKMTQyNzduQ0JLRThkZGFNYkpCM1E3SDdI?=
 =?utf-8?B?cmd2U2dqQjQwcUgzNWNRWkVUT3BmNEJwaHBvK1oyemJ3aTVrYzdlM0pOeFA2?=
 =?utf-8?B?N043QkltOXJpTGpTZjYwbUF4dDhrRHR4VEhNZWpBYnFKSkRKWUV0L2NLVWdy?=
 =?utf-8?B?WTROY1E5YWlTL1o0OFQxdGgvVy9uN2paYTBVb1FiQ21vRnBESXE2ckNZZks3?=
 =?utf-8?B?WmdWd244dm03Y3pWdVNFM0JwMGVKbitiMEhsK2RLU0d6TXNWR1J6VGIwMjky?=
 =?utf-8?B?Y1NWNldaazYvMlQrQzJ1WDg0VVJjdEgwVFJ3cEpJZnR2SXdubDRITzZ4N3NJ?=
 =?utf-8?B?QllwNjdmdVNRclYxZHdWZWxBeEMrSHY3UUxtUkt5a2k5R0VKR3hsRlVyMDBj?=
 =?utf-8?B?Rkg3ZkJJc2QzRHljOFQrZ1pEbG9rcVp6aEU4blI1ZDlvNEJuaEZVbnl3TFlF?=
 =?utf-8?B?TEdEVkJEUWliWGpHY2l0L2RvQURvbDE4dnkraGxKWmVIZ2NJL0pBenRCaGdo?=
 =?utf-8?B?NFdBTkExbVV6U0QyU2JUdHpRWVcvaHZpaVhaTXlUSUNKaHZrN2kxOCs1TFNT?=
 =?utf-8?B?ZWdXNUZoNUhScVJRcjhST0d2SEJGbzA0MnlpRXlIcyt5U3drSTZ2QzMxR3Yw?=
 =?utf-8?B?cTNUNkJvVFltRFZ2Zkx5SEpQS1VzZ3ZCUmZIeHQrVVJ6dUU4czlvaS85WkhH?=
 =?utf-8?B?cHhvU0toR25YWm5JQmp0K3NqNHBET1VtK0NjNVlqUmJIdmZtdHhKQXY5Q3pS?=
 =?utf-8?B?cmdqQUxuajhmR3FWQlpxUm9NMHZkVVN5RmowUlBqQ3NYM2xLa3VPTElCdWVV?=
 =?utf-8?B?cnpNSHdLWitWQkZId1FGTFNhdjFNN25LdXNjOWdXUTFYdDhKdmkzVms3U2oz?=
 =?utf-8?B?dkkrZ245c1BQenhqL2haaE5hcTNQV1RQVFozYXpmbUpCdGdzSmVJOWpNOFJa?=
 =?utf-8?B?Z2FuMFNtQWtBWnZBZ3FoYUVnN3Y5czBqWnRQVW5ueHJtTVprUmFsQzlqcnlI?=
 =?utf-8?B?NERsQVdCNjFtbmh0Rm9jUmZkNUJjUUhGRExWN0FGMVhpbXRkU2dhakcxN3V3?=
 =?utf-8?B?VExPV004RGVmVGE5RDhlQUR3U1FqZ0p4WGY3a0dBTmlqWVl5RTFkSUxFeTBK?=
 =?utf-8?B?eTE5TklTa3doZTdVYzQwT2U3Z05zTGxXS1h6QnRFLzZYYStuQWJlWFJnbGl1?=
 =?utf-8?B?NVBPVGVrSGIyVFd5RGFFNm5IYWRiVjIvaGlaeFUwRnNaSUg4NzVwcCt0ZHRY?=
 =?utf-8?B?blZvZEVUQVF4WkpoY29mYnJnRFBocmQyemtERlFkU1haRitxdVQ1YjhSeERR?=
 =?utf-8?B?NjYzdGxlZnlIWkRlVndjWktCTEtZQUVzT2szMUFid0ZHOEhFV2pTNUZiWndP?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?TFpYZVBScXRGeERHVDJtc3pJVjZTT2Nqc2tJRS9nYU1BaXo0ckQyUFRtSllY?=
 =?utf-8?B?R3FxSi9XWDNXNFRCb2lVREZENVI3K3Z3azFnUWpmeGUyQ3BBelVNaXdtY0Q2?=
 =?utf-8?B?bEdQWnN6SHNoN3VBT1VlVnlJSHltWEhRYXhNVTFHWTc4bjliMEhEU0IwL2RR?=
 =?utf-8?B?TUJpRlFQaEZ4TlBMdi9HSlBrU05NZzNqYThmeTBOOEpFWkx5WjZLYWwxTlp4?=
 =?utf-8?B?SHpGR1JDWUd0angveUxxSDE2a2g0VFE4eU1xaG9aejFsaG1MWWRHMSs4WE1t?=
 =?utf-8?B?aFlnYUx2RDBZOUNVY0FISm5nbTB2NUJBcCs3Smt6djRjajlTZGJFVkhrcU5U?=
 =?utf-8?B?SmxuVzNBdTdlYTJNVGFmc1VLNDU1TExoaUpEdm4rVllDMXVUd04wWXhwRERV?=
 =?utf-8?B?ME4rRERJOWhKclFaQzBlVVh2a2JmWXBDd1J3VHRMWDhtUkE0bFZDd3RFcmpU?=
 =?utf-8?B?b0ljYmZQWk4yMGx5N3EwNXg0V1dOWDJUUHhpSFRreXc2NXlEUnFacHZJWGtJ?=
 =?utf-8?B?cDJMcVNSTjJMalJiYUtPWUxrdENWSS8yc1EwRW56Q3AvNlFJSnZhRkZZeW5a?=
 =?utf-8?B?UFF1U1YwWEFPOGhHb1hTMnNIY0JoUGdNVWFZdHJZWUdZYm80c0Q4N3JZc0I4?=
 =?utf-8?B?eGwza0lxeDZlWFFyU0F4SHBHRitwUGdYR3NLTlRCZjZJcmoyaE5SRVF2UE40?=
 =?utf-8?B?QWhPMVU3c3VhWisrU0t2dEFMcFVQNEdmNnk1eWhvNndSYUZuZFZpaTh5NGlX?=
 =?utf-8?B?SEpLK2t5K0NnUDMwMitCZkdtbFR0cVZHMWx0MmNnQlhid3h6bDBONEZKc3Bq?=
 =?utf-8?B?ai9Dd2xMRFRkemVHdzBId3N2SkZkNmlVaUVha1I5MVFKcFJPZU95Q2Y4bm10?=
 =?utf-8?B?WDFOMjNOaUtNR2NYdWRBNHVpRkVIUTkrU3pHVlJZWFhoWXoyRWFlZ1J4YkpU?=
 =?utf-8?B?VzBscDZwbHlLU1dab2RlMGw1cTdoZjZsVWdiZzhkazBBS05FSDBaOW5RM1Vw?=
 =?utf-8?B?eFVnQVRCNDFRZkM5N3I5NFhYbHZmL3JQVjM3K2pQRVNUYm1yUFVwbFJndjhB?=
 =?utf-8?B?a1VreHl4cTFEWlZPUHU1VXVOYUJMN0lITXVzTHVLZmJQQUtiSURpQ0FBM3pt?=
 =?utf-8?B?QXJnSFdXdzlyOGRDdUJLZkFSWUlRYmtDVmYxYmdsdXpvcUhpMGczSWpXZU1v?=
 =?utf-8?B?M2lnRmNzdDZCTjRRMElIUWhhSDUrZGJQRWVScUNBU3cwbkphVWRaVnNUdEJp?=
 =?utf-8?B?YnRZdUtWVEhpRDhmYWovT2JuVEZKTDR5L21lVjdoRExpNzJ4TWVoRkx1WXdH?=
 =?utf-8?B?SjNPTG1KSVBFYW84SzcvVTc5Ri9yeE9INTI4RElNREpqY3E2YWpQUTRVcmJl?=
 =?utf-8?B?WElzajdTclJLck5KTkR2cG1DWERxZk5vUU9CTVFjRGRUWERFOU5xWTBmVmRk?=
 =?utf-8?B?bHlSZVRROVVrV1c3MHg4U1FGR0w5dnBxQnViMUZEWU1LUGswbzYyQ2FKcjFj?=
 =?utf-8?B?YVJQWmVNYUV4OHA5NWsxOEJEQXpwUS9uZUxHL3h6emtyZ0hBU1J5MXpuMUpx?=
 =?utf-8?B?Q3ZPUWxqclJUYlhFNFZWQVBlU0IvaW5IT3JKaWx5c0RyclBjcWtNVjg1RFdW?=
 =?utf-8?B?cUg2emYvcTVUenRrT0pOSVdFME9DaEx6NG5vajYwZ3I0MTJuV3RhN3dpNTY1?=
 =?utf-8?Q?8LJ7sAzn8nk29tiH9rku?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a55ad8-b235-490d-7020-08db00687bee
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 13:14:56.4191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E97aODBOEjIY1suUnmz+4ALejTjNikExWagBmbOtlPMCLTCKlxUOOD5umuI/fkBQUhkEgDP6CHrMddhTpjPASQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6123
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_08,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270125
X-Proofpoint-GUID: lijfSYIobE2LQdOtJ_a7t2_Qtr5cUgZP
X-Proofpoint-ORIG-GUID: lijfSYIobE2LQdOtJ_a7t2_Qtr5cUgZP
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

On 26/01/2023 23:36, Ian Rogers wrote:
> This allows the set of generated jevents events and metrics be limited
> to a subset of the model names. Appropriate if trying to minimize the
> binary size where only a set of models are possible.

No SoB or RB tags at all.

Thanks,
John

> ---
>   tools/perf/pmu-events/Build      |  3 ++-
>   tools/perf/pmu-events/jevents.py | 14 ++++++++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)

