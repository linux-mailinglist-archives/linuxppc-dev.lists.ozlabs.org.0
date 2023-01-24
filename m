Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7E679E7C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:22:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1XLM42tpz3cGR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 03:22:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=LETDsJRX;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VJktXLln;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=LETDsJRX;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VJktXLln;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1XJy1GSlz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 03:21:04 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OGEuGk015360;
	Tue, 24 Jan 2023 16:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=3y5i7Kc3+PPY4A6wg2bRLDAbc2+wz/baPZLYv0RF4CQ=;
 b=LETDsJRX+jKhndNIXCTQ6K//hRAb+RaH/awJKqu0bTZ7Q9h49OB5Hs5s9YC7Us9gWWFu
 phfZCJEWlwUPstd5uUXJY7rxKjiHNAmIkL99CZT+ycHxAgYvaAp6+LAhwPi/hToK68xl
 TdLiClQa4nW+l5fkkj6VXr+vC8KYJ9qnmtNKA2+CdYeT/OY5rQ7e9TFlyiWX83HHnR7m
 sKGiWC+yNQFAsZiouKm+EhPrYRjG7PrD4MDkJxQiJfmGvmhOFrolMxWNgCzBprGGpMFT
 KeomaMgas8IX85ywq7L+NchhbC9CGa13+N/ndW25XjnuZZKyk1oSBiwEV0hYVBzL4syD Bg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n88ktwncu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 16:20:27 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30OFk2fL005887;
	Tue, 24 Jan 2023 16:20:27 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g54mn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 16:20:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dH3P54Ige/hqWaJJPCk0qRl98RkxaMiiidDuRbC/Qy5aL7vsuxt30Bz5UNFA2pS5yb7B2Bakno2PgEs5GqkVdLiStlgeF0snRkx9PqgrwFHMO/LX4D7tdlrreZSy/7CgSNRcxIwInKSu/65Md91yVL/9kFfL9sgS1C12KngqxOzg30NL/aUDzMjV/W4cw+aOKjdTlY7I+joOohZ8FuKWzDM3A789Tk8rCRCAgyfPRS7vGRs56XbkbsBwUozKGeFtha5PPsOc0eX9l4JuRwTnGeV7dtTaFcxFN/v3zWU2U1cqaNVkac7TbC0r606yEDVEXwG+H8qxeUNgp4vow3I3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y5i7Kc3+PPY4A6wg2bRLDAbc2+wz/baPZLYv0RF4CQ=;
 b=e5K5WPzjX54mdmpLY0yWcQijuJeWd7Ws6uYy3QmTsLB+x2ZFZhEcYiU5PB0lxtuPUb5jDealIMckqHPQaajI/r0vmWxhYIl/28cxXBoKHz4AYWnGiqilpHB+fR4bFBBQYVWvhp3t4oGJwme784RF34AeAWVAl57jsrO95yariD83R2sblYDxTfjqYqvcRKDyW5LbVVbyDgw5QF3LO3k9KmK7MK1XymHZziOZPYijxnBpFG/lkEexIW51PTvE3U6mhXhva+vliuwtbEE0vUrCSA2i1v1t8IUJ3JpZuATrmklzaADBzUG8XTTj8OwIN9dJYETmnpmSRNzfVSbB76RJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y5i7Kc3+PPY4A6wg2bRLDAbc2+wz/baPZLYv0RF4CQ=;
 b=VJktXLlnw/KQBHSvLON+/88U4oUN6LNLDa0YQEE/RXtNRwS4A1Nhat+mxX2lWnHjKEBxCZKgQr0NRhbheAV4MzqGCAHGyPOs5V2DsGltCf9M82X99/BxkqUQjNXFb2RlzmJTiXNRZ2EkSZfvztSCnrkKnlNg7yUA5UXZZwiFuU8=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by PH0PR10MB7005.namprd10.prod.outlook.com (2603:10b6:510:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16; Tue, 24 Jan
 2023 16:20:24 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%8]) with mapi id 15.20.6043.009; Tue, 24 Jan 2023
 16:20:24 +0000
Message-ID: <8c84eaef-175b-f8ac-d126-e1a80c1ed240@oracle.com>
Date: Tue, 24 Jan 2023 16:20:16 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 04/11] perf pmu-events: Add separate metric from
 pmu_event
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
 <20230124063320.668917-5-irogers@google.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230124063320.668917-5-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0280.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::17) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|PH0PR10MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: f2676828-aa7f-4f08-738b-08dafe26e5c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wEr1sFDuWRwG90ByTBM7c3EF/m09V0s8bg3Mtg00yCc1dnsONVoh2cqz7f4MBJy6RuzRwz+9cnU5gOfBEMeaKK1s8B7YQop9Jj9hcSoxIKHvs/F6Z4HJxKVcMk5PRb8knTp4yVCpj3cYOZ8CtoyJC42UForIqdCpnnP/TD69pLrsomvC2Blwl8YSi5FgpUFLOCkVQp3zKWw3M8wpYaoWr604l6G2w5V8LiuD49Aw1KfpJ5i1uFjao9HS7OrZmi2Kozn6hHRpUlv84z+1n14DwI0Pj5LLWt4vowVwdyOLJSN7eXaJUzkl8pOA/+0Zw9Y1CmW8hxboxFSv3ONj2bziMsGzR5WzSwneRUkPNZ/kbczzjAo3y/0UCLm/dMU8qwCGrCIXAOGBTJKg9i8pa4SvBP8ou/1bRAJ57SezE4e2X08ZH3ISqdQjvaaq7Zoy351iL9g57EDdwOXkIq9aXjUfCLhn6SqC8anufkqW9inC5y59rlrV4vz3LoOYj59ZLEIWPyuPV7i4NGX4TxLcf7bLZ54c+5ByNiyasQrpJvsAU2iJCL5iqA1d1zu6kG3tCRTj9tK0fdjwK+3H3MACNvLui1mjb9ymkrRbEzoopt5RKuSTPA0i96/HN24ea/oHWYYT4ipKnRd1Y+rsvvvzgW31herTqidsfy2+CewmJ32AUjC/YjLZeqhubAHdf5oMyruysiwCpIPb8U6uBYExYlEQuWiMpPv3x7rvdrM1b60Uv9riqqRbkffC1emgpiErEV7o
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199015)(6666004)(36916002)(53546011)(6506007)(66476007)(66556008)(66946007)(478600001)(6486002)(6512007)(186003)(26005)(2906002)(41300700001)(7406005)(4744005)(7416002)(8936002)(5660300002)(4326008)(8676002)(38100700002)(921005)(316002)(31686004)(110136005)(2616005)(54906003)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cFhoQ2hRaFBqMWxKWmZmWHVybkJmN1BzQVEzMTBoT1ZjOUZRVVdJK2gwNkFR?=
 =?utf-8?B?TWhocVRzR2lKNExrZS9sdjlXUjVXa2FCUXhXU2dhazlrQ3dCeGtjM0ZqbnpY?=
 =?utf-8?B?RlFjT3BRTDZLc0lZa0g5S0NKSENjck4vZ25XcUowdll4VnlSQ2FUQ0tNR2Qr?=
 =?utf-8?B?bDFvbWdCNGFVdFJyQjhhREg1cGU3dTVEL01iV3EyTUl4RjhnbmYwTklzckY4?=
 =?utf-8?B?dU41ZWJ4anQ0MWpIM2pBYlNVMFN2bm5KbW5zbVBWcWlPUStzNUdOWlNNZEFE?=
 =?utf-8?B?YnE0eHF2bHl6dmsvanZ1bjVDQjB5citnSHRnMVZYdEJiUEdFMnhZMVE2bVJ5?=
 =?utf-8?B?NkhNbkRzNGwvUXZYY0phVklvNnN3NFVVMHJlRW1Vbkg0TVFUVllrWmJHTVNh?=
 =?utf-8?B?cVpGNXNMMjRyMjlkbzVPeVh3UktVQjBEZ2tnZHlYQWxtUTM1SmNQZ2dVMzVp?=
 =?utf-8?B?NjJRSHdFeW5Gbk5ndDN3ZzNqczFmZEl0bnVVRDF1Uy9vR1djN084MnBHRGFx?=
 =?utf-8?B?algvRkpFb3hZQThqTzFTMXFkcXBFL3NmUWdTQWNJeER0OElncHFUTHlLVFZM?=
 =?utf-8?B?aEN0NGp3cHV3bmI5ZzhZVXVpSXc5VFB0am9XNTJFOC96QlM1em1pOEtlekpT?=
 =?utf-8?B?UDBWMVJ3cnFBaXBIS05Gais2U2JtellQRlArTUE3SjFrRllCV1VwVEdqbGx1?=
 =?utf-8?B?eTcyYi9kNjlHOXB2aVVoOWdpR3NERU1yMks4VERJbXI5cytPeVJOL0JCeVd4?=
 =?utf-8?B?K3h0Z0ZRU3YvT2QxRUFyQ2ZZSUFranRITFpVWm90RkhncFBBTHVVcThrUzZN?=
 =?utf-8?B?ZEt6YnRod29Cam5LQnQxM01ibzhOc1V5U1A4dUhyczQyMXF1YmVGSW90NkxJ?=
 =?utf-8?B?U09TVVpBYVVKb0c2YXVZT1ZKKzV0UGhGRFRJMnI5SkhMdFAvYUN3SHpnU1BK?=
 =?utf-8?B?S2FxMkdZL1BGZVBrTGtMU2tSQStaNEVKZDAxbnVtT3JWVXdLYVIyeWpQWUxD?=
 =?utf-8?B?OXJJbG9GR0xrRzh6NElpYmd0bmlSc1d5aU83SDFTeDdadmFTWG5kNDB6Slcr?=
 =?utf-8?B?NFJmVEVXc0E5UTdWczNCeXZWZUltWFpNUEhHcnhNSmdZeXpSQ1p0UkFZRjRY?=
 =?utf-8?B?YlZCL0ZTcDRmZ1dReE93eENrU29qell5K2poYXZNUUVvaWxGdVVrSm42UEpM?=
 =?utf-8?B?dVk2YjZESGJHRkd3WWV5YUh4UHRrR1FWZGhuNHJkeDJGS2VMZ05LWTZmeGdJ?=
 =?utf-8?B?TkFRa3F1U01aanJVa0VzT0MwZkVJcW9ZSGJ5Nk16Z0ZzczVlaTMwV24ydncv?=
 =?utf-8?B?NTR2ZHB0cmcxalNKOEh1bnJFNmNlc1ArV3JnYmtDN0ZrVThrK3RWTk1DMHdB?=
 =?utf-8?B?R0NvVVpKQ0xXeENmUk1naHR4MG11cTlONFk2Qm5sWkpkK2pFQzBaZG5EaXBT?=
 =?utf-8?B?L3UyK0duQjVhcmQ5V2RyZzVrR2FaTDZaRVFjNk1EQlpES0Q2dzEzOHdzZXJB?=
 =?utf-8?B?VHdtQU5GRVp1cmpTQ0MzcER6U3BqakhIcjZDaytkajNVTldPdU9PK3A3R0hR?=
 =?utf-8?B?SHF5SUhJRGVLSHQwemFXV2lXUno5eWxZSzI5bk94OHo1UEVqOHZub21oMlRi?=
 =?utf-8?B?cmxtblRpVlF6UFlKaW1YWjF6bFArWEFvZER2R1YzclBuZnkzbXhSd1VsRCty?=
 =?utf-8?B?YmxVc1d4cjFXakExOWFqZ2tqd1Q0cnRZaUdGQTZXTUQ3aGNuSzdhZXlWNXpV?=
 =?utf-8?B?WHFuZFRHY2VmTWtIbmRPNjlqdUNlRW5DeXlzSXdTNWNaWmRwTHZxQ1NLMlUy?=
 =?utf-8?B?b2tjQUh6WTRvdzNPWDE2czBHTUpaWFMxNjZ4Yy9aamdaVzI5OUtHQU5wN0FS?=
 =?utf-8?B?OHFRazVEZkc4QW01SGxZM2VrVnI4M0UxS0lPbGorZGRuNjJxQXI4VEdlQkdu?=
 =?utf-8?B?VHBQVzVaRGk1NGF3UXE3ZmFOMWMvenVrN1dnYkR6MVVXQ1pUVmpMNUY2Unhh?=
 =?utf-8?B?TmhOSnZvVEUrMnhVYXVnbVBOdlFWRjVjTzdiQjl2YTRpVWZPZTNId1YwakhL?=
 =?utf-8?B?RHhONjZyWXhqM252aFlkMGllSU9lNjhmajd4dlZlZzQ5U2g2NzlZU1hkcWlB?=
 =?utf-8?B?bEdhNXBSV2JIQ0FHbDhoa2ZJaGcwMzlxWGd5MW1ydUVDSE9DZ21vMjJZdHpm?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?eFNNbFQ5Z0FqcnA3QXpyb0R4QzFWelJXdUFFazFEcFlwQkd6OWk5bnhEQTYy?=
 =?utf-8?B?RC9BUldGRkpmeFlNY1JVUFVIcVFWdi9meDYzVmtqejR2d2ZlcWdlMFBDWVc4?=
 =?utf-8?B?NkxsVjVWeXhINXRCSXpEQzBncXgvemFNMzBDb2svODdOSEZmTE1HV3Z0dVVG?=
 =?utf-8?B?OFp2Tk4zWDRidTF5YTFTaXptUFE3eG9CY0dTbXVBTVpwRHJKOUF4T05mMjZ6?=
 =?utf-8?B?N2NWV1dtUmZXSG1qWmplUFkvTUpSdnNZQ2dWai9rV29QbE81TFZ6Y21WUVRI?=
 =?utf-8?B?bnJ0NjQrOXdhVlNlRFVEV1h1c1FWUFlQeUdsUnZvbU1YaWdqRDMyTUpEV3hF?=
 =?utf-8?B?SmUrQ0RIRmw0aFZjY0ZjMWswRkZZZmlZbWJISkZSZ2hjNHV5eDZZUk11TmJV?=
 =?utf-8?B?b3RYVXhiZ1lyY2xJOGVhYnhqcDFhK3FJa3JPQkFQenc1aU1xQTNleDV5anY2?=
 =?utf-8?B?TDhLZXEybHl0ZlVZQWM5UmZOaTRDU2ZZY0dGbU1DelAxZGJTK2lPS1RRVG1t?=
 =?utf-8?B?MTl5UHRCUkZZMVVxYTVKR0V2YlBNb2hSQ25JWUNYa0dJVVJqK1hjUFg2UmVJ?=
 =?utf-8?B?V2lzVXFpKzIrb3VUK1F3ZVBiakFZMHU5eWNpdC82bDEvMTZJcUNrd3JnbHZB?=
 =?utf-8?B?QXM0N3ZBV1crVzFQbER5RDBJOHRoaG90bWwvRndlQUNpNmhDUTVKOWJIVFJO?=
 =?utf-8?B?UUM4OXorZ0VoYlAyRWhBUkV6em1LNTZPdWFhZ0hhVnR0cSs2OS9CdW5WNCs0?=
 =?utf-8?B?WThMbEowTW50U1JqTkZYelZOanNUbWUwOE1RSHVhamlmeDRMWThvUFd6L0dx?=
 =?utf-8?B?ZFowN2p6aWNBZHJRSi9NZkNpSDRFdFBjZ1FtaWlRdDNobzlscHIxekp4a0J3?=
 =?utf-8?B?N045MGxMUUZKWGZaZW90NjZzRGJEMjdlTmEyRVJKVjRDYkhQNFpBcEM5dTUz?=
 =?utf-8?B?ckVybTBZeVFhbW9KNk5TYmpTd2diUjJtaTRGVGc2c0x1UU94RzdvRlZ6bG5m?=
 =?utf-8?B?Zmx5Nyt2cTIweis2RmQwZGdQMnMyUHBOcmRjZ0FxbzFoclRJbDhMYTRGWHph?=
 =?utf-8?B?dlBGdWd5SmdrMG9kb3hqdnFibms0RStWTGh1ZVlTQW9SZlRFNjJSb25RMFNO?=
 =?utf-8?B?cVFGVjZKV3JqcVUwcUw2cG5UYytNQ0U2S1JjSDRGSTk3aEl0MVJ5SEFNZWVH?=
 =?utf-8?B?VDRsbmpnbDVXT2I3TmFFRTVodlJWS2lyQXBlRHY5aGgwU0QyaSt2REQ1cWlz?=
 =?utf-8?B?ME1IQUFhZ3BraUFYRmhSdHY2NVhQaDdseHo4S0RoQmpneDVIVEd6RnFwcXcw?=
 =?utf-8?B?THR5djB1MmY0d0JXOEp4UVV5bkJ6R2hSUWZURUVSNkJmUUVqOG8wSUE0VEFh?=
 =?utf-8?B?bVlQaVY1V3RXS09DalNRZXVWVDZTUU1mcmRvZUtDMFArQ1ZUQjFYSDJOU3lE?=
 =?utf-8?B?SStrRkdLKzdZV01QRTRwaFVtK2dkdWJLM1Fta000TjBtSDRHVFMzYmZTYzVp?=
 =?utf-8?B?T3hPR1V0N0dLcyswT1F6YTYwQjlVWVo1ZktIODVvbStQMGZCRFlBZGxUSzBQ?=
 =?utf-8?B?d2IxQ01uL1RDY2RRRXNNOG9lYThvWDFwb0hWT2pDRW93dUVUanNlRGUxSkdo?=
 =?utf-8?B?elJadnhDTUhvam5uZzZKYWZSZTd5c2FyMVNGK0c3V1ZMRDlaRWl3M1duczhU?=
 =?utf-8?Q?ERl0MAN62yzAEwY8lSNK?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2676828-aa7f-4f08-738b-08dafe26e5c4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 16:20:24.6227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CV5wMMLfHiL304ORr4s8wnfuaQ+yh5KumxyIGa04obj67SRHLvObq2MaqJiPESqL/Tfme9pizYWWbkiaKCDWUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7005
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_13,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240148
X-Proofpoint-GUID: 7L5R99y1sIRxMflQQ3rBWZG8k8ORbM1n
X-Proofpoint-ORIG-GUID: 7L5R99y1sIRxMflQQ3rBWZG8k8ORbM1n
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
> Create a new pmu_metric for the metric related variables from
> pmu_event but that is initially just a clone of pmu_event. Add
> iterators for pmu_metric and use in places that metrics are desired
> rather than events. Make the event iterator skip metric only events,
> and the metric iterator skip event only events.
> 
> Signed-off-by: Ian Rogers<irogers@google.com>

Reviewed-by: John Garry <john.g.garry@oracle.com>
