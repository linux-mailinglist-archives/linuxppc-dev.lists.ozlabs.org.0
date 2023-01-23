Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05735678740
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 21:08:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P11QJ5kdLz3fG3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:08:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=chC30kwm;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=fNE42+21;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=chC30kwm;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=fNE42+21;
	dkim-atps=neutral
X-Greylist: delayed 3075 seconds by postgrey-1.36 at boromir; Tue, 24 Jan 2023 03:08:00 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0w4J5YQTz2xKj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 03:07:59 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30NEhZ5x006296;
	Mon, 23 Jan 2023 15:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=ymBxTGM2UtkBypgD3WFy7J4fIBoUKpDVomIJ2Mzt0Kk=;
 b=chC30kwmpwo12VfwKxIg+vnp5VJosIrO0CCbBNMr/uzHJdrBJb/NMif+8X6GwB19812Y
 RKq9+0xiMHiaz6EnvgAGrEuXHbPAol8Sy/FBEBbP0mqzxcHFXekN/fNaj6Pn8PFVHzDb
 in3s/6wk/k9MrChAf5iTK+yAIvdyjzVFXOOrPkoJ8Cs32EkOUCMUWh4OVczRFsCD4Dx4
 Y8CtGNFmIqEKidlF+KacHUb9YnA+V+JxxG8V8pilpenj/RR9pUyhIjwMCz/WaFBy7etv
 F8Qci7FpaEXK7DF8IvQi/v+R7wZLjDND5UWTQIwUnHGb3nWlPkd9Unia7ivSZ/1axrVg AQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n883c304b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 15:15:59 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30NErchM028618;
	Mon, 23 Jan 2023 15:15:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g3n3dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 15:15:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBJCsAMopluLiyFGm9g6ObzJJ6jtcFi/ZMYOHcebevV0Na/k0eoIVQpDuE49NkJRYFIEV+W+BRHHtdpH3ImHblN3kx2Z0xcfnh/GSSfa6VeOfqnfLCOvpXx8GIuwg7wCmbYpPm7dflpILtWVuxPJvgsU5IlzSIWN+jWvjJZQtujxTob/xiwgcv+AgctN9Rt8QjL3VFabOCX3XfC6FseDT98xOvMdCw+pdBr4e9gkadPk9m2UmtaVu7+udFfWBTV5koFcPgitz95QPqQ+1RAP7ln1O6A4OVVWXYaUIkhY5aRXhJpQZLJMg+edhjEsLfcbo6CWRq/mvbfhzZviTw/5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymBxTGM2UtkBypgD3WFy7J4fIBoUKpDVomIJ2Mzt0Kk=;
 b=Kmy3kHS48P8dRGSJpOa2CreO3dFZNb0KKF3Wwtm8jQKspCWlefHU9Mvn60kxCB5OsuRks/7J5WtjzJpxIYN4e2FUDmykRXcQfpp/b37ztJtpP3SDSBn4ZGrjTJ5UHT1znuCR+mtpZOZWwNOSmOlEebDRXGiSJucPWTkPsscMx1JB6GH3OCULOxsi/zj6NucDduHRCKwAj7XcmhkKoHCGDBTaRLCjwv37uRh19FQWP8FtRi0w4KTyEDDw2Q4v0pJOa5bslHnLCxq4Uf74CaS4YGLCNO12Zj6L9rswglINLgoBvn1mrDVzNMy4YW6eXdM9bFjH2g7dwITPchwaMHi1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymBxTGM2UtkBypgD3WFy7J4fIBoUKpDVomIJ2Mzt0Kk=;
 b=fNE42+21Asp0nZYUrFx5qRyBXrwPjlpr+ELD2U+MJujIfBAWzfMSvol3zZ5uip5UoQ9ZDaKHO7DUZ2U/K0eqBAF5zL3EwtOnDA/aqASktnW6xA5moMzHn+E76hFyKEJc7oe+c8Y58S2Hp2DnCRntMx29f0RnOJKmov17+cTBTVE=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by CY8PR10MB6756.namprd10.prod.outlook.com (2603:10b6:930:97::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16; Mon, 23 Jan
 2023 15:15:54 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%8]) with mapi id 15.20.6043.009; Mon, 23 Jan 2023
 15:15:54 +0000
Message-ID: <a61e0df9-00d2-72d8-e99f-a10c47f170e6@oracle.com>
Date: Mon, 23 Jan 2023 15:15:48 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/9] perf pmu-events: Separate metric out of pmu_event
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
References: <20221221223420.2157113-1-irogers@google.com>
 <20221221223420.2157113-5-irogers@google.com>
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20221221223420.2157113-5-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::6) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|CY8PR10MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: d10bcb96-dc05-49ce-0cdb-08dafd54b8c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bc6k9gob6LWd9IZWmKgZMM2pdIaHUFvcE31qG9N0kKgK1m7DpOe+UeXrmU9oQJDXLlOMl8M4uiIMXYrITka92dmrGOB+xB+Pg4/li4pOzLLVBUr/y+Bk9pr55PeXDmpObj1M7s/DMtiBQ0slVBEbS6/s2XtB47AkoX6Bm1iEPgJSjRN5GWGJNVhKAD6GJ4bGdUXJNTx/aFVBkalH7+PPFmrDhL7mLAuiTbGxqMzh9waqua9PS0ITnk1QXf+MZlEIJjDqtRmKDZ/NsURZ7xykQ78d+0P4C0vMNclvOerJzFaTVzAsLJuemnO2rLEYkzPFK5AFY60DYuslm4Ts4rUi+oNjkFiAadeeGtGh02KafyrhIKBl2lAi5Yme19ANthVsLRZpzqHvlVz15brQcECfehscwA/BOoZas2eG62uqN2I7Kdh6YyUqlbBtsSloxhlypWhdmttL8wvtIWetwlEvZsnaSFCAMZxwqv9gBG0rMI1NLjiglCqGqLleVDPmVWwtSR0JO0zg3VJlZsmn/OS1TayK9c8sd+sNpxMcoridfFtcVJBmhmCOVIABRdXl8RiVW0fBZ5D70LmsTQxm6/qPoYbClvfGlYf3DpS3M4ZDcGr5HYWJqzE5MgwPmX9TosexoBis4MeJ7XS9xyJKxH8pkbZOE9Fm6gVmfRJJD54eitlJxiAPDVztRq54uUa5iZD22bpuqbLJTlLAk5bSqJgB566IYP98ys6bHPZAOXnixQJ/MwJ7EEtila/YPMamR00lBkAfuHQU7Th+EN+V1HXrR6j1M5iJyBH9E9XCpNKHDBRZeRF1T/CPy2SJ6TVX8R+T
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199015)(966005)(6666004)(6506007)(66946007)(36916002)(66556008)(66476007)(478600001)(6512007)(6486002)(53546011)(186003)(26005)(83380400001)(2906002)(41300700001)(8936002)(5660300002)(7406005)(7416002)(30864003)(4326008)(8676002)(38100700002)(921005)(36756003)(316002)(86362001)(31696002)(2616005)(54906003)(31686004)(110136005)(43740500002)(45980500001)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dWgxcmpBS0tDbWRwa3YvbElxMjRUQmZEVHFYN1FPZ3RvNndwZTVlRVNwa2VS?=
 =?utf-8?B?S0dvb0F2Uk5jUnp2dUlhdW5EOEFRMjFSaWNyWlRqWmtKTzBWVVE5NE02REFZ?=
 =?utf-8?B?aXZOQkFIMHByNDRuNUgzVzhHOFBsNUxNcHFxcGlTQTJvTXd6R3BaY2tOU09u?=
 =?utf-8?B?cEFGdTdIWDg1eXNsNUl5M01IQkNEbUo0V3JrSFp1ekFuZm5Pa29mSVFoRDFy?=
 =?utf-8?B?VFY0ak5ncnFqYVpBNit2RXBTZy94dWV0U0VPNEVYbEYwTmdKZUYyMCtab0xO?=
 =?utf-8?B?KzFRT1FPWjlTMlBWRkpkNGpIK2FTZld1RnBFaFpXaUp2aTczYlp4cWNGSVFr?=
 =?utf-8?B?UmFsV2lkS25hekZkc0FtQTBLQzYvK3hKYmxDTFcyVXBKdHdvdWEwUytQYURT?=
 =?utf-8?B?eitsR1ZwSUVVclFKcWVnMm1UeitmOUhUdTgyUjhjaTBSUCtBZFJDTWtJNC9G?=
 =?utf-8?B?VVQzVFYrbnlyWkNtdW5oZTd1bk1wMWJIbVRYZk1ubno1TFRxM3VCOVZvRzZa?=
 =?utf-8?B?RWdCRjMrYllzUmEzTSs1MmZCUWRjbjdxanlHNTNEREloVlZZays3T21VSkZk?=
 =?utf-8?B?QitmL0h5MzEydHhidC9PL3dpZUVuNFFadmJxS25OVUdQcG52blpnWDV4NUZL?=
 =?utf-8?B?b1dQbkhVeUoxUVdYRG05TDgrdXg1VmFxVmExWU8yYkVqbWt6SEtMZ0J0Rzl1?=
 =?utf-8?B?MTJLUmdZQjJQSXArc2JHN2RsdWMzdWVKU0U3YUp6R3JISnhiNjUyUSs0ZXFy?=
 =?utf-8?B?RjNJamxKRGlHVkNDd3h6V0Q2K0MvbFI4T05RbFVNU1IzV2hpK1N3VWtrWGxN?=
 =?utf-8?B?S01WM1NBZW44SDRtdlZHMjN2NmpXMHp2VTB2aVdQMTc0bW8yZmFIZ2hKNCsr?=
 =?utf-8?B?TWxRVkZsL3dURTVadStQbG1CeklFcWRIdk90dFhPOEFhOGNJYVVadGZERG9T?=
 =?utf-8?B?ckVRZEo2YWtTcDEzRXdMMjlFTTNTbXpoOWFpMHlhVHZ6OHJxQVRJamlaWDlm?=
 =?utf-8?B?Q3p1cWlVMFhESHZHdGRFa3JOdk10UEZvRDZEZzkxQldMUWVOTkJBNkhmdE9T?=
 =?utf-8?B?SkxJRC9IUjFIR0pKMzRmYWhlVzJVVk9lRFIyUytjTldaWFpzZzJqc0lCQTFO?=
 =?utf-8?B?Qy95MktkbkRPVHFuV2w0WVR5TTRKL1praE8yQlhLNUpzTll2Y3k0WFJPZHZB?=
 =?utf-8?B?L3Bma2V0SGQzYU0wR0M2QW92dVppdHVzU1Y1dk1ENGxlbVRNeEZjbnZ2a2dQ?=
 =?utf-8?B?OXlmN3AxUW1YY0tCQzcxZWYwUnBxWlJ2c1owNVp5Rk94MElRUnFsWGZRNm56?=
 =?utf-8?B?clVBamU1a2xhd2xENWtTYjFhYzF0ZkYyMDVyTy8vOGRlMHNHNWhGcjA4MGls?=
 =?utf-8?B?NlJaRVFpKzZEU2FYbWZQYVAxL085QlE4aTFnNjVrU25KY0tkaTZob0krSTYw?=
 =?utf-8?B?S1dkdEp6ZDlCOFFieHJncDI1bFNPTk5nZHhyeVIzbjdoWlRmdTNxWnRscXRi?=
 =?utf-8?B?aW5TSGUxd1VDMjVHWUhsbmNFLzhVcnJXRUV2SVN4d2ZDcXBiRE1iODNXRHhm?=
 =?utf-8?B?eE9mZnhwbzRtcUhFR04xM0lCdVlNVjV1ektNRzZNWkI0K0s1NG1wdXZxLzdF?=
 =?utf-8?B?U2Y3TCtUWWpLQkFGekpOZER5c205bmJKMVVOM3RUN2dBL2x1dVQ1Yjg4TUt2?=
 =?utf-8?B?dCtVcWtmT2k0dmtLNm9XcVZuOUwwQVc0UG1leVFScFZGQkRYYlZOc0cxR2VE?=
 =?utf-8?B?MzRrYzBYZ3Zwa2ZsK2dUTWlhSXhXN3NLcDkrODBtL0UrMW5EMmNCVVJZM2Qx?=
 =?utf-8?B?Q2tJK1Q4YmljQ3RlNEcrM2lNa3BRWW5VZDR4MUJQUmZBVjA0ZDVqRjRIL0Fk?=
 =?utf-8?B?cERRU3ZLR3I0TCtzMDdhSFdzRFJkZUQ3ZXZCL3EwTzJKczUyUEx6SzJuUkhu?=
 =?utf-8?B?VDE0Z1FsdytlckcwWng4L0YyL24xaTQxUG5sWUR1V09FUWtEdTFuN0RTa0s3?=
 =?utf-8?B?MXRBSDZNQmEvbnQ1bW4xRHcxS0t5MkhXL3cya1Vyc2tVdE42UTU5akhTSnd5?=
 =?utf-8?B?aWNoUElDZEpyL3JGUkRHZ0xyb3J3TUVoVjV0OU1XRVdwNHphMkFTWENjNG05?=
 =?utf-8?B?NjI0L0FsY2xWbTR6NytGY2trN3NzSzV4T2Z5d0t3RWpFVkltaVhSc25JMmFl?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?dUUydWJsTWpISVBZQ0pJcklZeUE5UlRQekJ4a20xdkNIZmtHcXpLd0FZUURT?=
 =?utf-8?B?ZmNJZUlaL0NWbzdQQWtDcDBDUUpFaFJ5ZHdRYW9QM2RIU3g2dzVUTnlvMFpS?=
 =?utf-8?B?QkszRG16M0RxbWVjaGVocGo4SjJvcThqR1M1R2NpeWxNbWkxeFgzS0ZTM0pN?=
 =?utf-8?B?UTc3b1RCc3NCRnQ2VGxNb1FKelJjWGJOT3BuL3ZIb1U4aGs2R3FHbnl3MWt6?=
 =?utf-8?B?MVJsWnArM2FCU3FkSm9uYlFGdGN4VlV4cWdyQzcvYm5NZlV3SlVyc1Z6dGxk?=
 =?utf-8?B?WjQzLzB5VDNwK2lUM3pNL0JIcGpOTUVzZ0NoVWlGeXN6b2tnTVFBU29TNHZx?=
 =?utf-8?B?UWhvNnNRVVVENmZMb3hFOXBmZXBLalhqUFZzaVE4TkVhY2c1RytpcmlpN1J3?=
 =?utf-8?B?OWpRcCtCbDFiL0NDZ2ozS2wyQ2tEVjllOWxxam9IWDZXemZybWErL1A0T0Jx?=
 =?utf-8?B?VEtPOXB1OWlBdWIxZ1ZnbWVBRStEUDg5Yjl4U0UyMEdXOWNsQ2NXZ1dVbytl?=
 =?utf-8?B?UE53ZVU5aEJQUStZL0F2dk9HYlkxYWlVR09nUllSSDdCSTVPSXZOUG5rbGpN?=
 =?utf-8?B?dmdvc3k3TFkrOXpQWGZQMXo3alNqck1KRnFvNWltYnlrZ3NFUy9rS3ZIN1VK?=
 =?utf-8?B?Z29ONk9KRWNzaGQ5Qll1eEtlOTZqTGtsSXR0S2xiWngxa1k5RVE4MTZyVlA5?=
 =?utf-8?B?dE9zeGVjNmFFcm91UytPU2NsS1BIL1J4RFA2MjI4dGFNYVpUcWhpRmFwTkN5?=
 =?utf-8?B?L20xdU1OcjZLTFBIZUxZWTluTGRISFlZWmczWXk1NldQUlA4enAvR05HTTJa?=
 =?utf-8?B?THd2dHFHSWpLa3NydUc2S3dKaVdta0VmNWdtN3YzOXpPYUlnYitrTWc5N1di?=
 =?utf-8?B?VmlzWlNJeDZYYzhMbWRaOWdXbGhhR1kxUHJOT3NoRjVJcmJ1RlNucUUwUUtZ?=
 =?utf-8?B?SGVxTGVHdjRsYVdkUEtRZHVpbjUwbFh3TTFzWDM4aXg2NG5sa1UzWVFvOSt2?=
 =?utf-8?B?cGZXVkxWenRmS3lDMCsxb0VpNURlN25pb0JMaFR2RUFxRWJ3ZkQxNWU0eDZ5?=
 =?utf-8?B?eURmaXJKTjZJS0pFMVUyN2RHL1ZqN2N6L09vbk1zUldmckNadXhhWW01N05E?=
 =?utf-8?B?dWdFNzVsazVwejZhbXdheEt5aEZvL081NzBld2hSNGQ5aHo1eWdUQWUwaGRV?=
 =?utf-8?B?SktzRmZRY0Q5MmJnbVFyZTJhNFZSSXBMR2ZWcnN6TWphT3I1WkhMV3N4Mmdp?=
 =?utf-8?B?emNCb2xjODFmZW40bXpQVlg5ZDhrRjhTVkpFSVB5TEpaUlNyM0VFc1VrcDE2?=
 =?utf-8?B?dVBORXZsRWRpdVR5bktneWdYTUJuVkllWDhmTTB1eE5RaUtwMWFhRFU5TDVQ?=
 =?utf-8?B?WDcxVmxSZHZiOXpkbFAvNDJXUEF2L0s0TGxtVmtCM2dFL21FS0ZucC96MnRE?=
 =?utf-8?B?TFA4cStBQU4wMlgrR2RzY3pMWkkwUVZnSEd2NkRDbzNzSnBQeWlBbm93RDkz?=
 =?utf-8?B?N29rcjhUc25WcmUxcEc4QlgzdmtDWnJnY3ZHTGFMOTBHOURzUmxtYldnT2FM?=
 =?utf-8?B?UEE5dUE5ZXdObXRKV0JQN0VKWHVaRjczMExoQVdjd0lFQTV2K1R2RTBVYmFo?=
 =?utf-8?B?VDlRREZFbUNKM2J3a1R2SEVyQWZ4SDBhcFFjNWZFaTUva01JZ3g2ZUh5VU0z?=
 =?utf-8?Q?hInw4y9gX/d2RpqyQbK0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10bcb96-dc05-49ce-0cdb-08dafd54b8c7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 15:15:54.8291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5jKkMnt3hEKUV5MyYQQFvmIjKIIQUHHQLV5qJfUo62largfGTUWd2YeGGbeYi3AC1xdLKvsrEC9sOfygeYBbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6756
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_11,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230146
X-Proofpoint-ORIG-GUID: tk1AukRnyxdlt1RpAnKXfIFD3UaBZMrd
X-Proofpoint-GUID: tk1AukRnyxdlt1RpAnKXfIFD3UaBZMrd
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
> Previously both events and metrics were encoded in struct
> pmu_event. Create a new pmu_metric that has the metric related
> variables and remove these from pmu_event. Add iterators for
> pmu_metric and use in places that metrics are desired rather than
> events.
> 
> Note, this change removes the setting of evsel's metric_name/expr as
> these fields are no longer part of struct pmu_event. The metric
> remains but is no longer implicitly requested when the event is. This
> impacts a few Intel uncore events, however, as the ScaleUnit is shared
> by the event and the metric this utility is questionable. Also the
> MetricNames look broken (contain spaces) in some cases and when trying
> to use the functionality with '-e' the metrics fail but regular
> metrics with '-M' work. For example, on SkylakeX '-M' works:
> 

I like this change. It's quite large for a single patch. Just some 
sparse comments below.

BTW, it there a better name for metric struct variable than "pm"? To me 
and many other people, pm is power management.

> ```
> $ perf stat -M LLC_MISSES.PCIE_WRITE -a sleep 1
> 
>   Performance counter stats for 'system wide':
> 
>                   0      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 #  57896.0 Bytes  LLC_MISSES.PCIE_WRITE  (49.84%)
>               7,174      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1                                        (49.85%)
>                   0      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3                                        (50.16%)
>                  63      UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0                                        (50.15%)
> 
>         1.004576381 seconds time elapsed
> ```
> 
> whilst the event '-e' version is broken even with --group/-g (fwiw, we should also remove -g [1]):
> 
> ```
> $ perf stat -g -e LLC_MISSES.PCIE_WRITE -g -a sleep 1
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART2 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART1 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART3 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> Add UNC_IIO_DATA_REQ_OF_CPU.MEM_WRITE.PART0 event to groups to get metric expression for LLC_MISSES.PCIE_WRITE
> 
>   Performance counter stats for 'system wide':
> 
>              27,316 Bytes LLC_MISSES.PCIE_WRITE
> 
>         1.004505469 seconds time elapsed
> ```
> 
> The code also carries warnings where the user is supposed to select
> events for metrics [2] but given the lack of use of such a feature,
> let's clean the code and just remove.
> 
> With NO_JEVENTS=1 the empty-pmu-events.c is used and the separation to
> use metrics causes "Parse and process metrics" and "Event expansion
> for cgroups" to fail as they fail to find necessary metrics. This is
> fixed in a later change.
> 
> [1] https://urldefense.com/v3/__https://lore.kernel.org/lkml/20220707195610.303254-1-irogers@google.com/__;!!ACWV5N9M2RV99hQ!MTNgf7sIIl2VCxBzo-biSeul-ZQkuU73pT6gBbsb6y0AqsVlgGCcmuigDyevtrgmpHDN1QkEJwbJYvREu3Q$
> [2] https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/util/stat-shadow.c?id=01b8957b738f42f96a130079bc951b3cc78c5b8a*n425__;Iw!!ACWV5N9M2RV99hQ!MTNgf7sIIl2VCxBzo-biSeul-ZQkuU73pT6gBbsb6y0AqsVlgGCcmuigDyevtrgmpHDN1QkEJwbJ8H0tppQ$
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/perf/arch/powerpc/util/header.c    |   4 +-
>   tools/perf/builtin-list.c                |  20 +--
>   tools/perf/pmu-events/empty-pmu-events.c |  73 ++++++++--
>   tools/perf/pmu-events/jevents.py         |  82 +++++++++++-
>   tools/perf/pmu-events/pmu-events.h       |  20 ++-
>   tools/perf/tests/pmu-events.c            |  62 +++------
>   tools/perf/util/metricgroup.c            | 161 +++++++++++------------
>   tools/perf/util/metricgroup.h            |   2 +-
>   tools/perf/util/parse-events.c           |   2 -
>   tools/perf/util/pmu.c                    |  35 +----
>   tools/perf/util/pmu.h                    |   9 --
>   tools/perf/util/print-events.c           |  32 ++---
>   tools/perf/util/print-events.h           |   3 +-
>   13 files changed, 266 insertions(+), 239 deletions(-)
> 
> diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
> index e8fe36b10d20..78eef77d8a8d 100644
> --- a/tools/perf/arch/powerpc/util/header.c
> +++ b/tools/perf/arch/powerpc/util/header.c
> @@ -40,11 +40,11 @@ get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
>   	return bufp;
>   }
>   
> -int arch_get_runtimeparam(const struct pmu_event *pe)
> +int arch_get_runtimeparam(const struct pmu_metric *pm)
>   {
>   	int count;
>   	char path[PATH_MAX] = "/devices/hv_24x7/interface/";
>   
> -	atoi(pe->aggr_mode) == PerChip ? strcat(path, "sockets") : strcat(path, "coresperchip");
> +	atoi(pm->aggr_mode) == PerChip ? strcat(path, "sockets") : strcat(path, "coresperchip");
>   	return sysfs__read_int(path, &count) < 0 ? 1 : count;
>   }
> diff --git a/tools/perf/builtin-list.c b/tools/perf/builtin-list.c
> index 137d73edb541..791f513ae5b4 100644
> --- a/tools/perf/builtin-list.c
> +++ b/tools/perf/builtin-list.c
> @@ -99,8 +99,7 @@ static void default_print_event(void *ps, const char *pmu_name, const char *topi
>   				const char *scale_unit __maybe_unused,
>   				bool deprecated, const char *event_type_desc,
>   				const char *desc, const char *long_desc,
> -				const char *encoding_desc,
> -				const char *metric_name, const char *metric_expr)
> +				const char *encoding_desc)
>   {
>   	struct print_state *print_state = ps;
>   	int pos;
> @@ -159,10 +158,6 @@ static void default_print_event(void *ps, const char *pmu_name, const char *topi
>   	if (print_state->detailed && encoding_desc) {
>   		printf("%*s", 8, "");
>   		wordwrap(encoding_desc, 8, pager_get_columns(), 0);
> -		if (metric_name)
> -			printf(" MetricName: %s", metric_name);
> -		if (metric_expr)
> -			printf(" MetricExpr: %s", metric_expr);
>   		putchar('\n');
>   	}
>   }
> @@ -308,8 +303,7 @@ static void json_print_event(void *ps, const char *pmu_name, const char *topic,
>   			     const char *scale_unit,
>   			     bool deprecated, const char *event_type_desc,
>   			     const char *desc, const char *long_desc,
> -			     const char *encoding_desc,
> -			     const char *metric_name, const char *metric_expr)
> +			     const char *encoding_desc)
>   {
>   	struct json_print_state *print_state = ps;
>   	bool need_sep = false;
> @@ -366,16 +360,6 @@ static void json_print_event(void *ps, const char *pmu_name, const char *topic,
>   				  encoding_desc);
>   		need_sep = true;
>   	}
> -	if (metric_name) {
> -		fix_escape_printf(&buf, "%s\t\"MetricName\": \"%S\"", need_sep ? ",\n" : "",
> -				  metric_name);
> -		need_sep = true;
> -	}
> -	if (metric_expr) {
> -		fix_escape_printf(&buf, "%s\t\"MetricExpr\": \"%S\"", need_sep ? ",\n" : "",
> -				  metric_expr);
> -		need_sep = true;
> -	}
>   	printf("%s}", need_sep ? "\n" : "");
>   	strbuf_release(&buf);
>   }
> diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
> index 480e8f0d30c8..5572a4d1eddb 100644
> --- a/tools/perf/pmu-events/empty-pmu-events.c
> +++ b/tools/perf/pmu-events/empty-pmu-events.c
> @@ -11,7 +11,7 @@
>   #include <string.h>
>   #include <stddef.h>
>   
> -static const struct pmu_event pme_test_soc_cpu[] = {
> +static const struct pmu_event pmu_events__test_soc_cpu[] = {
>   	{
>   		.name = "l3_cache_rd",
>   		.event = "event=0x40",
> @@ -105,6 +105,14 @@ static const struct pmu_event pme_test_soc_cpu[] = {
>   		.desc = "L2 BTB Correction",
>   		.topic = "branch",
>   	},
> +	{
> +		.name = 0,
> +		.event = 0,
> +		.desc = 0,
> +	},
> +};
> +
> +static const struct pmu_metric pmu_metrics__test_soc_cpu[] = {
>   	{
>   		.metric_expr	= "1 / IPC",
>   		.metric_name	= "CPI",
> @@ -170,9 +178,8 @@ static const struct pmu_event pme_test_soc_cpu[] = {
>   		.metric_name	= "L1D_Cache_Fill_BW",
>   	},
>   	{
> -		.name = 0,
> -		.event = 0,
> -		.desc = 0,
> +		.metric_expr = 0,
> +		.metric_name = 0,
>   	},
>   };
>   
> @@ -181,6 +188,11 @@ struct pmu_events_table {
>   	const struct pmu_event *entries;
>   };
>   
> +/* Struct used to make the PMU metric table implementation opaque to callers. */
> +struct pmu_metrics_table {
> +	const struct pmu_metric *entries;
> +};
> +
>   /*
>    * Map a CPU to its table of PMU events. The CPU is identified by the
>    * cpuid field, which is an arch-specific identifier for the CPU.
> @@ -192,7 +204,8 @@ struct pmu_events_table {
>   struct pmu_events_map {
>   	const char *arch;
>   	const char *cpuid;
> -	const struct pmu_events_table table;
> +	const struct pmu_events_table event_table;
> +	const struct pmu_metrics_table metric_table;
>   };
>   
>   /*
> @@ -203,12 +216,14 @@ static const struct pmu_events_map pmu_events_map[] = {
>   	{
>   		.arch = "testarch",
>   		.cpuid = "testcpu",
> -		.table = { pme_test_soc_cpu },
> +		.event_table = { pmu_events__test_soc_cpu },
> +		.metric_table = { pmu_metrics__test_soc_cpu },
>   	},
>   	{
>   		.arch = 0,
>   		.cpuid = 0,
> -		.table = { 0 },
> +		.event_table = { 0 },
> +		.metric_table = { 0 },
>   	},
>   };
>   
> @@ -254,9 +269,7 @@ static const struct pmu_sys_events pmu_sys_event_tables[] = {
>   int pmu_events_table_for_each_event(const struct pmu_events_table *table, pmu_event_iter_fn fn,
>   				    void *data)
>   {
> -	for (const struct pmu_event *pe = &table->entries[0];
> -	     pe->name || pe->metric_group || pe->metric_name;
> -	     pe++) {
> +	for (const struct pmu_event *pe = &table->entries[0]; pe->name; pe++) {
>   		int ret = fn(pe, table, data);
>   
>   		if (ret)
> @@ -265,6 +278,21 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table, pmu_ev
>   	return 0;
>   }
>   
> +int pmu_events_table_for_each_metric(const struct pmu_events_table *etable, pmu_metric_iter_fn fn,
> +				     void *data)
> +{
> +	struct pmu_metrics_table *table = (struct pmu_metrics_table *)etable;

This is odd. Would the change be too big if we combined patches to avoid 
casting like this? I assume that this is going away later...

> +
> +	for (const struct pmu_metric *pm = &table->entries[0]; pm->metric_group || pm->metric_name;

Is it valid to only have metric_group or metric_name set?

> +	     pm++) {
> +		int ret = fn(pm, etable, data);
> +
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
>   const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
>   {
>   	const struct pmu_events_table *table = NULL;
> @@ -285,7 +313,7 @@ const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
>   			break;
>   
>   		if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
> -			table = &map->table;
> +			table = &map->event_table;
>   			break;
>   		}
>   	}
> @@ -299,7 +327,7 @@ const struct pmu_events_table *find_core_events_table(const char *arch, const ch
>   	     tables->arch;
>   	     tables++) {
>   		if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
> -			return &tables->table;
> +			return &tables->event_table;
>   	}
>   	return NULL;
>   }
> @@ -309,7 +337,21 @@ int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
>   	for (const struct pmu_events_map *tables = &pmu_events_map[0];
>   	     tables->arch;
>   	     tables++) {
> -		int ret = pmu_events_table_for_each_event(&tables->table, fn, data);
> +		int ret = pmu_events_table_for_each_event(&tables->event_table, fn, data);
> +
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
> +{
> +	for (const struct pmu_events_map *tables = &pmu_events_map[0];
> +	     tables->arch;
> +	     tables++) {

again, you can combine here

> +		int ret = pmu_events_table_for_each_metric(
> +			(const struct pmu_events_table *)&tables->metric_table, fn, data);
>   
>   		if (ret)
>   			return ret;
> @@ -340,3 +382,8 @@ int pmu_for_each_sys_event(pmu_event_iter_fn fn, void *data)
>   	}
>   	return 0;
>   }
> +
> +int pmu_for_each_sys_metric(pmu_metric_iter_fn fn __maybe_unused, void *data __maybe_unused)
> +{
> +	return 0;
> +}
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
> index 229402565425..ee3d4cdf01be 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -37,6 +37,11 @@ _json_event_attributes = [
>       'metric_constraint', 'metric_expr', 'long_desc'
>   ]
>   
> +# Attributes that are in pmu_metric rather than pmu_event.
> +_json_metric_attributes = [
> +    'metric_name', 'metric_group', 'metric_constraint', 'metric_expr', 'desc',
> +    'long_desc', 'unit', 'compat', 'aggr_mode'
> +]
>   
>   def removesuffix(s: str, suffix: str) -> str:
>     """Remove the suffix from a string
> @@ -562,12 +567,15 @@ static const struct pmu_sys_events pmu_sys_event_tables[] = {
>   \t},
>   };
>   
> -static void decompress(int offset, struct pmu_event *pe)
> +static void decompress_event(int offset, struct pmu_event *pe)
>   {
>   \tconst char *p = &big_c_string[offset];
>   """)
>     for attr in _json_event_attributes:
> -    _args.output_file.write(f"""
> +    if attr in _json_metric_attributes and 'metric_' in attr:
> +      _args.output_file.write(f'\n\t/* Skip {attr} */\n')
> +    else:
> +      _args.output_file.write(f"""
>   \tpe->{attr} = (*p == '\\0' ? NULL : p);
>   """)
>       if attr == _json_event_attributes[-1]:
> @@ -575,6 +583,22 @@ static void decompress(int offset, struct pmu_event *pe)
>       _args.output_file.write('\twhile (*p++);')
>     _args.output_file.write("""}
>   
> +static void decompress_metric(int offset, struct pmu_metric *pm)
> +{
> +\tconst char *p = &big_c_string[offset];
> +""")
> +  for attr in _json_event_attributes:
> +    if attr in _json_metric_attributes:
> +      _args.output_file.write(f"""
> +\tpm->{attr} = (*p == '\\0' ? NULL : p);
> +""")
> +    else:
> +      _args.output_file.write(f'\n\t/* Skip {attr} */\n')
> +    if attr == _json_event_attributes[-1]:
> +      continue
> +    _args.output_file.write('\twhile (*p++);')
> +  _args.output_file.write("""}
> +
>   int pmu_events_table_for_each_event(const struct pmu_events_table *table,
>                                       pmu_event_iter_fn fn,
>                                       void *data)
> @@ -583,10 +607,30 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table,
>                   struct pmu_event pe;
>                   int ret;
>   
> -                decompress(table->entries[i].offset, &pe);
> -                ret = fn(&pe, table, data);
> -                if (ret)
> -                        return ret;
> +                decompress_event(table->entries[i].offset, &pe);
> +                if (pe.name) {
> +                        ret = fn(&pe, table, data);
> +                        if (ret)
> +                                return ret;
> +                }
> +        }
> +        return 0;
> +}
> +
> +int pmu_events_table_for_each_metric(const struct pmu_events_table *table,
> +                                     pmu_metric_iter_fn fn,
> +                                     void *data)
> +{
> +        for (size_t i = 0; i < table->length; i++) {
> +                struct pmu_metric pm;
> +                int ret;
> +
> +                decompress_metric(table->entries[i].offset, &pm);
> +                if (pm.metric_name) {
> +                        ret = fn(&pm, table, data);
> +                        if (ret)
> +                                return ret;
> +                }
>           }
>           return 0;
>   }
> @@ -642,6 +686,19 @@ int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
>           return 0;
>   }
>   
> +int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
> +{
> +        for (const struct pmu_events_map *tables = &pmu_events_map[0];
> +             tables->arch;
> +             tables++) {
> +                int ret = pmu_events_table_for_each_metric(&tables->table, fn, data);
> +
> +                if (ret)
> +                        return ret;
> +        }
> +        return 0;
> +}
> +
>   const struct pmu_events_table *find_sys_events_table(const char *name)
>   {
>           for (const struct pmu_sys_events *tables = &pmu_sys_event_tables[0];
> @@ -665,6 +722,19 @@ int pmu_for_each_sys_event(pmu_event_iter_fn fn, void *data)
>           }
>           return 0;
>   }
> +
> +int pmu_for_each_sys_metric(pmu_metric_iter_fn fn, void *data)
> +{
> +        for (const struct pmu_sys_events *tables = &pmu_sys_event_tables[0];
> +             tables->name;
> +             tables++) {
> +                int ret = pmu_events_table_for_each_metric(&tables->table, fn, data);
> +
> +                if (ret)
> +                        return ret;
> +        }
> +        return 0;
> +}
>   """)
>   
>   
> diff --git a/tools/perf/pmu-events/pmu-events.h b/tools/perf/pmu-events/pmu-events.h
> index fe343c4d8016..e137f3857c03 100644
> --- a/tools/perf/pmu-events/pmu-events.h
> +++ b/tools/perf/pmu-events/pmu-events.h
> @@ -23,11 +23,19 @@ struct pmu_event {
>   	const char *unit;
>   	const char *perpkg;
>   	const char *aggr_mode;
> -	const char *metric_expr;
> +	const char *deprecated;
> +};
> +
> +struct pmu_metric {

In terms of formatting patches, it could have been better to first 
introdue struct pmu_metric being same as struct pmu_event, and make the 
changes of /s/struct pmu_event pe;/struct pmu_event pm;/, and then 
secondly the meaningful change to get rid of the inappropiate members in 
struct pmu_metric and struct pmu_event. It's just harder to review it 
all together.

>   	const char *metric_name;
>   	const char *metric_group;
> -	const char *deprecated;
> +	const char *metric_expr;

I would prefer the shorter name "expr" (as opposed to "metric_expr") as 
we know it's a metric struct already. But that does not seem to be 
coding style, so ...

> +	const char *unit;
> +	const char *compat;
> +	const char *aggr_mode;
>   	const char *metric_constraint;
> +	const char *desc;
> +	const char *long_desc;
>   };
>   
>   struct pmu_events_table;
> @@ -36,14 +44,22 @@ typedef int (*pmu_event_iter_fn)(const struct pmu_event *pe,
>   				 const struct pmu_events_table *table,
>   				 void *data);
>   
> +typedef int (*pmu_metric_iter_fn)(const struct pmu_metric *pm,
> +				  const struct pmu_events_table *table,
> +				  void *data);
> +
>   int pmu_events_table_for_each_event(const struct pmu_events_table *table, pmu_event_iter_fn fn,
>   				    void *data);
> +int pmu_events_table_for_each_metric(const struct pmu_events_table *table, pmu_metric_iter_fn fn,
> +				     void *data);
>   
>   const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu);
>   const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid);
>   int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data);
> +int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data);
>   
>   const struct pmu_events_table *find_sys_events_table(const char *name);
>   int pmu_for_each_sys_event(pmu_event_iter_fn fn, void *data);
> +int pmu_for_each_sys_metric(pmu_metric_iter_fn fn, void *data);
>   
>   #endif
> diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
> index a9f2330f6257..c2b3ada57cbc 100644
> --- a/tools/perf/tests/pmu-events.c
> +++ b/tools/perf/tests/pmu-events.c
> @@ -337,36 +337,12 @@ static int compare_pmu_events(const struct pmu_event *e1, const struct pmu_event
>   		return -1;
>   	}
>   
> -	if (!is_same(e1->metric_expr, e2->metric_expr)) {
> -		pr_debug2("testing event e1 %s: mismatched metric_expr, %s vs %s\n",
> -			  e1->name, e1->metric_expr, e2->metric_expr);
> -		return -1;

is there something new to replace this (I didn't check)?

> -	}
> -
> -	if (!is_same(e1->metric_name, e2->metric_name)) {
> -		pr_debug2("testing event e1 %s: mismatched metric_name, %s vs %s\n",
> -			  e1->name,	e1->metric_name, e2->metric_name);
> -		return -1;
> -	}
> -
> -	if (!is_same(e1->metric_group, e2->metric_group)) {
> -		pr_debug2("testing event e1 %s: mismatched metric_group, %s vs %s\n",
> -			  e1->name, e1->metric_group, e2->metric_group);
> -		return -1;
> -	}
> -
>   	if (!is_same(e1->deprecated, e2->deprecated)) {
>   		pr_debug2("testing event e1 %s: mismatched deprecated, %s vs %s\n",
>   			  e1->name, e1->deprecated, e2->deprecated);
>   		return -1;
>   	}
>   
> -	if (!is_same(e1->metric_constraint, e2->metric_constraint)) {
> -		pr_debug2("testing event e1 %s: mismatched metric_constant, %s vs %s\n",
> -			  e1->name, e1->metric_constraint, e2->metric_constraint);
> -		return -1;
> -	}
> -
>   	return 0;
>   }
>   
> @@ -432,9 +408,6 @@ static int test__pmu_event_table_core_callback(const struct pmu_event *pe,
>   	struct perf_pmu_test_event const **test_event_table;
>   	bool found = false;
>   
> -	if (!pe->name)
> -		return 0;
> -
>   	if (pe->pmu)
>   		test_event_table = &uncore_events[0];
>   	else
> @@ -840,7 +813,7 @@ struct metric {
>   	struct metric_ref metric_ref;
>   };
>   
> -static int test__parsing_callback(const struct pmu_event *pe, const struct pmu_events_table *table,
> +static int test__parsing_callback(const struct pmu_metric *pm, const struct pmu_events_table *table,
>   				  void *data)
>   {
>   	int *failures = data;
> @@ -854,10 +827,10 @@ static int test__parsing_callback(const struct pmu_event *pe, const struct pmu_e
>   	};
>   	int err = 0;
>   
> -	if (!pe->metric_expr)
> +	if (!pm->metric_expr)
>   		return 0;
>   
> -	pr_debug("Found metric '%s'\n", pe->metric_name);
> +	pr_debug("Found metric '%s'\n", pm->metric_name);
>   	(*failures)++;
>   
>   	/*
> @@ -877,14 +850,14 @@ static int test__parsing_callback(const struct pmu_event *pe, const struct pmu_e
>   	perf_evlist__set_maps(&evlist->core, cpus, NULL);
>   	runtime_stat__init(&st);
>   
> -	err = metricgroup__parse_groups_test(evlist, table, pe->metric_name,
> +	err = metricgroup__parse_groups_test(evlist, table, pm->metric_name,
>   					     false, false,
>   					     &metric_events);
>   	if (err) {
> -		if (!strcmp(pe->metric_name, "M1") || !strcmp(pe->metric_name, "M2") ||
> -		    !strcmp(pe->metric_name, "M3")) {
> +		if (!strcmp(pm->metric_name, "M1") || !strcmp(pm->metric_name, "M2") ||
> +		    !strcmp(pm->metric_name, "M3")) {
>   			(*failures)--;
> -			pr_debug("Expected broken metric %s skipping\n", pe->metric_name);
> +			pr_debug("Expected broken metric %s skipping\n", pm->metric_name);
>   			err = 0;
>   		}
>   		goto out_err;
> @@ -912,7 +885,7 @@ static int test__parsing_callback(const struct pmu_event *pe, const struct pmu_e
>   			struct metric_expr *mexp;
>   
>   			list_for_each_entry (mexp, &me->head, nd) {
> -				if (strcmp(mexp->metric_name, pe->metric_name))
> +				if (strcmp(mexp->metric_name, pm->metric_name))
>   					continue;
>   				pr_debug("Result %f\n", test_generic_metric(mexp, 0, &st));
>   				err = 0;
> @@ -921,11 +894,11 @@ static int test__parsing_callback(const struct pmu_event *pe, const struct pmu_e
>   			}
>   		}
>   	}
> -	pr_debug("Didn't find parsed metric %s", pe->metric_name);
> +	pr_debug("Didn't find parsed metric %s", pm->metric_name);
>   	err = 1;
>   out_err:
>   	if (err)
> -		pr_debug("Broken metric %s\n", pe->metric_name);
> +		pr_debug("Broken metric %s\n", pm->metric_name);
>   
>   	/* ... cleanup. */
>   	metricgroup__rblist_exit(&metric_events);
> @@ -941,8 +914,8 @@ static int test__parsing(struct test_suite *test __maybe_unused,
>   {
>   	int failures = 0;
>   
> -	pmu_for_each_core_event(test__parsing_callback, &failures);
> -	pmu_for_each_sys_event(test__parsing_callback, &failures);
> +	pmu_for_each_core_metric(test__parsing_callback, &failures);
> +	pmu_for_each_sys_metric(test__parsing_callback, &failures);
>   
>   	return failures == 0 ? TEST_OK : TEST_FAIL;
>   }
> @@ -1021,14 +994,11 @@ static int metric_parse_fake(const char *metric_name, const char *str)
>   	return ret;
>   }
>   
> -static int test__parsing_fake_callback(const struct pmu_event *pe,
> +static int test__parsing_fake_callback(const struct pmu_metric *pm,
>   				       const struct pmu_events_table *table __maybe_unused,
>   				       void *data __maybe_unused)
>   {
> -	if (!pe->metric_expr)
> -		return 0;
> -
> -	return metric_parse_fake(pe->metric_name, pe->metric_expr);
> +	return metric_parse_fake(pm->metric_name, pm->metric_expr);
>   }
>   
>   /*
> @@ -1047,11 +1017,11 @@ static int test__parsing_fake(struct test_suite *test __maybe_unused,
>   			return err;
>   	}
>   
> -	err = pmu_for_each_core_event(test__parsing_fake_callback, NULL);
> +	err = pmu_for_each_core_metric(test__parsing_fake_callback, NULL);
>   	if (err)
>   		return err;
>   
> -	return pmu_for_each_sys_event(test__parsing_fake_callback, NULL);
> +	return pmu_for_each_sys_metric(test__parsing_fake_callback, NULL);
>   }
>   
>   static struct test_case pmu_events_tests[] = {
> diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
> index b9c273ed080a..47fd02af66f1 100644
> --- a/tools/perf/util/metricgroup.c
> +++ b/tools/perf/util/metricgroup.c
> @@ -167,14 +167,14 @@ static void metricgroup___watchdog_constraint_hint(const char *name, bool foot)
>   		   "    echo 1 > /proc/sys/kernel/nmi_watchdog\n");
>   }
>   
> -static bool metricgroup__has_constraint(const struct pmu_event *pe)
> +static bool metricgroup__has_constraint(const struct pmu_metric *pm)
>   {
> -	if (!pe->metric_constraint)
> +	if (!pm->metric_constraint)
>   		return false;
>   
> -	if (!strcmp(pe->metric_constraint, "NO_NMI_WATCHDOG") &&
> +	if (!strcmp(pm->metric_constraint, "NO_NMI_WATCHDOG") &&
>   	    sysctl__nmi_watchdog_enabled()) {
> -		metricgroup___watchdog_constraint_hint(pe->metric_name, false);
> +		metricgroup___watchdog_constraint_hint(pm->metric_name, false);
>   		return true;
>   	}
>   
> @@ -193,7 +193,7 @@ static void metric__free(struct metric *m)
>   	free(m);
>   }
>   
> -static struct metric *metric__new(const struct pmu_event *pe,
> +static struct metric *metric__new(const struct pmu_metric *pm,
>   				  const char *modifier,
>   				  bool metric_no_group,
>   				  int runtime,
> @@ -210,15 +210,15 @@ static struct metric *metric__new(const struct pmu_event *pe,
>   	if (!m->pctx)
>   		goto out_err;
>   
> -	m->metric_name = pe->metric_name;
> +	m->metric_name = pm->metric_name;
>   	m->modifier = NULL;
>   	if (modifier) {
>   		m->modifier = strdup(modifier);
>   		if (!m->modifier)
>   			goto out_err;
>   	}
> -	m->metric_expr = pe->metric_expr;
> -	m->metric_unit = pe->unit;
> +	m->metric_expr = pm->metric_expr;
> +	m->metric_unit = pm->unit;
>   	m->pctx->sctx.user_requested_cpu_list = NULL;
>   	if (user_requested_cpu_list) {
>   		m->pctx->sctx.user_requested_cpu_list = strdup(user_requested_cpu_list);
> @@ -227,7 +227,7 @@ static struct metric *metric__new(const struct pmu_event *pe,
>   	}
>   	m->pctx->sctx.runtime = runtime;
>   	m->pctx->sctx.system_wide = system_wide;
> -	m->has_constraint = metric_no_group || metricgroup__has_constraint(pe);
> +	m->has_constraint = metric_no_group || metricgroup__has_constraint(pm);
>   	m->metric_refs = NULL;
>   	m->evlist = NULL;
>   
> @@ -348,10 +348,10 @@ static bool match_metric(const char *n, const char *list)
>   	return false;
>   }
>   
> -static bool match_pe_metric(const struct pmu_event *pe, const char *metric)
> +static bool match_pm_metric(const struct pmu_metric *pm, const char *metric)
>   {
> -	return match_metric(pe->metric_group, metric) ||
> -	       match_metric(pe->metric_name, metric);
> +	return match_metric(pm->metric_group, metric) ||
> +	       match_metric(pm->metric_name, metric);
>   }
>   
>   /** struct mep - RB-tree node for building printing information. */
> @@ -420,13 +420,13 @@ static struct mep *mep_lookup(struct rblist *groups, const char *metric_group,
>   	return NULL;
>   }
>   
> -static int metricgroup__add_to_mep_groups(const struct pmu_event *pe,
> +static int metricgroup__add_to_mep_groups(const struct pmu_metric *pm,
>   					struct rblist *groups)
>   {
>   	const char *g;
>   	char *omg, *mg;
>   
> -	mg = strdup(pe->metric_group ?: "No_group");
> +	mg = strdup(pm->metric_group ?: "No_group");
>   	if (!mg)
>   		return -ENOMEM;
>   	omg = mg;
> @@ -435,15 +435,15 @@ static int metricgroup__add_to_mep_groups(const struct pmu_event *pe,
>   
>   		g = skip_spaces(g);
>   		if (strlen(g))
> -			me = mep_lookup(groups, g, pe->metric_name);
> +			me = mep_lookup(groups, g, pm->metric_name);
>   		else
> -			me = mep_lookup(groups, "No_group", pe->metric_name);
> +			me = mep_lookup(groups, "No_group", pm->metric_name);
>   
>   		if (me) {
> -			me->metric_desc = pe->desc;
> -			me->metric_long_desc = pe->long_desc;
> -			me->metric_expr = pe->metric_expr;
> -			me->metric_unit = pe->unit;
> +			me->metric_desc = pm->desc;
> +			me->metric_long_desc = pm->long_desc;
> +			me->metric_expr = pm->metric_expr;

could struct pmu_metric be a sub-struct in struct mep?

> +			me->metric_unit = pm->unit;
>   		}
>   	}
>   	free(omg);
> @@ -452,40 +452,37 @@ static int metricgroup__add_to_mep_groups(const struct pmu_event *pe,
>   }
>   
>   struct metricgroup_iter_data {
> -	pmu_event_iter_fn fn;
> +	pmu_metric_iter_fn fn;
>   	void *data;
>   };
>   
> -static int metricgroup__sys_event_iter(const struct pmu_event *pe,
> +static int metricgroup__sys_event_iter(const struct pmu_metric *pm,
>   				       const struct pmu_events_table *table,
>   				       void *data)
>   {
>   	struct metricgroup_iter_data *d = data;
>   	struct perf_pmu *pmu = NULL;
>   
> -	if (!pe->metric_expr || !pe->compat)
> +	if (!pm->metric_expr || !pm->compat)
>   		return 0;
>   
>   	while ((pmu = perf_pmu__scan(pmu))) {
>   
> -		if (!pmu->id || strcmp(pmu->id, pe->compat))
> +		if (!pmu->id || strcmp(pmu->id, pm->compat))
>   			continue;
>   
> -		return d->fn(pe, table, d->data);
> +		return d->fn(pm, table, d->data);
>   	}
>   	return 0;
>   }
>   
> -static int metricgroup__add_to_mep_groups_callback(const struct pmu_event *pe,
> +static int metricgroup__add_to_mep_groups_callback(const struct pmu_metric *pm,
>   						const struct pmu_events_table *table __maybe_unused,
>   						void *vdata)
>   {
>   	struct rblist *groups = vdata;
>   
> -	if (!pe->metric_name)
> -		return 0;
> -
> -	return metricgroup__add_to_mep_groups(pe, groups);
> +	return metricgroup__add_to_mep_groups(pm, groups);
>   }
>   
>   void metricgroup__print(const struct print_callbacks *print_cb, void *print_state)
> @@ -500,16 +497,16 @@ void metricgroup__print(const struct print_callbacks *print_cb, void *print_stat
>   	groups.node_delete = mep_delete;
>   	table = pmu_events_table__find();
>   	if (table) {
> -		pmu_events_table_for_each_event(table,
> -						metricgroup__add_to_mep_groups_callback,
> -						&groups);
> +		pmu_events_table_for_each_metric(table,
> +						 metricgroup__add_to_mep_groups_callback,
> +						 &groups);
>   	}
>   	{
>   		struct metricgroup_iter_data data = {
>   			.fn = metricgroup__add_to_mep_groups_callback,
>   			.data = &groups,
>   		};
> -		pmu_for_each_sys_event(metricgroup__sys_event_iter, &data);
> +		pmu_for_each_sys_metric(metricgroup__sys_event_iter, &data);
>   	}
>   
>   	for (node = rb_first_cached(&groups.entries); node; node = next) {
> @@ -743,7 +740,7 @@ static int metricgroup__build_event_string(struct strbuf *events,
>   #undef RETURN_IF_NON_ZERO
>   }
>   
> -int __weak arch_get_runtimeparam(const struct pmu_event *pe __maybe_unused)
> +int __weak arch_get_runtimeparam(const struct pmu_metric *pm __maybe_unused)
>   {
>   	return 1;
>   }
> @@ -773,10 +770,10 @@ struct metricgroup_add_iter_data {
>   
>   static bool metricgroup__find_metric(const char *metric,
>   				     const struct pmu_events_table *table,
> -				     struct pmu_event *pe);
> +				     struct pmu_metric *pm);
>   
>   static int add_metric(struct list_head *metric_list,
> -		      const struct pmu_event *pe,
> +		      const struct pmu_metric *pm,
>   		      const char *modifier,
>   		      bool metric_no_group,
>   		      const char *user_requested_cpu_list,
> @@ -816,10 +813,10 @@ static int resolve_metric(struct list_head *metric_list,
>   	size_t bkt;
>   	struct to_resolve {
>   		/* The metric to resolve. */
> -		struct pmu_event pe;
> +		struct pmu_metric pm;
>   		/*
>   		 * The key in the IDs map, this may differ from in case,
> -		 * etc. from pe->metric_name.
> +		 * etc. from pm->metric_name.
>   		 */
>   		const char *key;
>   	} *pending = NULL;
> @@ -830,15 +827,15 @@ static int resolve_metric(struct list_head *metric_list,
>   	 * the pending array.
>   	 */
>   	hashmap__for_each_entry(root_metric->pctx->ids, cur, bkt) {
> -		struct pmu_event pe;
> +		struct pmu_metric pm;
>   
> -		if (metricgroup__find_metric(cur->pkey, table, &pe)) {
> +		if (metricgroup__find_metric(cur->pkey, table, &pm)) {
>   			pending = realloc(pending,
>   					(pending_cnt + 1) * sizeof(struct to_resolve));
>   			if (!pending)
>   				return -ENOMEM;
>   
> -			memcpy(&pending[pending_cnt].pe, &pe, sizeof(pe));
> +			memcpy(&pending[pending_cnt].pm, &pm, sizeof(pm));
>   			pending[pending_cnt].key = cur->pkey;
>   			pending_cnt++;
>   		}
> @@ -853,7 +850,7 @@ static int resolve_metric(struct list_head *metric_list,
>   	 * context.
>   	 */
>   	for (i = 0; i < pending_cnt; i++) {
> -		ret = add_metric(metric_list, &pending[i].pe, modifier, metric_no_group,
> +		ret = add_metric(metric_list, &pending[i].pm, modifier, metric_no_group,
>   				 user_requested_cpu_list, system_wide, root_metric, visited,
>   				 table);
>   		if (ret)
> @@ -867,7 +864,7 @@ static int resolve_metric(struct list_head *metric_list,
>   /**
>    * __add_metric - Add a metric to metric_list.
>    * @metric_list: The list the metric is added to.
> - * @pe: The pmu_event containing the metric to be added.
> + * @pm: The pmu_metric containing the metric to be added.
>    * @modifier: if non-null event modifiers like "u".
>    * @metric_no_group: Should events written to events be grouped "{}" or
>    *                   global. Grouping is the default but due to multiplexing the
> @@ -884,7 +881,7 @@ static int resolve_metric(struct list_head *metric_list,
>    *       architecture perf is running upon.
>    */
>   static int __add_metric(struct list_head *metric_list,
> -			const struct pmu_event *pe,
> +			const struct pmu_metric *pm,
>   			const char *modifier,
>   			bool metric_no_group,
>   			int runtime,
> @@ -898,13 +895,13 @@ static int __add_metric(struct list_head *metric_list,
>   	int ret;
>   	bool is_root = !root_metric;
>   	struct visited_metric visited_node = {
> -		.name = pe->metric_name,
> +		.name = pm->metric_name,
>   		.parent = visited,
>   	};
>   
>   	for (vm = visited; vm; vm = vm->parent) {
> -		if (!strcmp(pe->metric_name, vm->name)) {
> -			pr_err("failed: recursion detected for %s\n", pe->metric_name);
> +		if (!strcmp(pm->metric_name, vm->name)) {
> +			pr_err("failed: recursion detected for %s\n", pm->metric_name);
>   			return -1;
>   		}
>   	}
> @@ -914,7 +911,7 @@ static int __add_metric(struct list_head *metric_list,
>   		 * This metric is the root of a tree and may reference other
>   		 * metrics that are added recursively.
>   		 */
> -		root_metric = metric__new(pe, modifier, metric_no_group, runtime,
> +		root_metric = metric__new(pm, modifier, metric_no_group, runtime,
>   					  user_requested_cpu_list, system_wide);
>   		if (!root_metric)
>   			return -ENOMEM;
> @@ -929,7 +926,7 @@ static int __add_metric(struct list_head *metric_list,
>   		 */
>   		if (root_metric->metric_refs) {
>   			for (; root_metric->metric_refs[cnt].metric_name; cnt++) {
> -				if (!strcmp(pe->metric_name,
> +				if (!strcmp(pm->metric_name,
>   					    root_metric->metric_refs[cnt].metric_name))
>   					return 0;
>   			}
> @@ -947,8 +944,8 @@ static int __add_metric(struct list_head *metric_list,
>   		 * need to change them, so there's no need to create
>   		 * our own copy.
>   		 */
> -		root_metric->metric_refs[cnt].metric_name = pe->metric_name;
> -		root_metric->metric_refs[cnt].metric_expr = pe->metric_expr;
> +		root_metric->metric_refs[cnt].metric_name = pm->metric_name;
> +		root_metric->metric_refs[cnt].metric_expr = pm->metric_expr;
>   
>   		/* Null terminate array. */
>   		root_metric->metric_refs[cnt+1].metric_name = NULL;
> @@ -959,7 +956,7 @@ static int __add_metric(struct list_head *metric_list,
>   	 * For both the parent and referenced metrics, we parse
>   	 * all the metric's IDs and add it to the root context.
>   	 */
> -	if (expr__find_ids(pe->metric_expr, NULL, root_metric->pctx) < 0) {
> +	if (expr__find_ids(pm->metric_expr, NULL, root_metric->pctx) < 0) {
>   		/* Broken metric. */
>   		ret = -EINVAL;
>   	} else {
> @@ -981,37 +978,37 @@ static int __add_metric(struct list_head *metric_list,
>   
>   struct metricgroup__find_metric_data {
>   	const char *metric;
> -	struct pmu_event *pe;
> +	struct pmu_metric *pm;
>   };
>   
> -static int metricgroup__find_metric_callback(const struct pmu_event *pe,
> +static int metricgroup__find_metric_callback(const struct pmu_metric *pm,
>   					     const struct pmu_events_table *table  __maybe_unused,
>   					     void *vdata)
>   {
>   	struct metricgroup__find_metric_data *data = vdata;
>   
> -	if (!match_metric(pe->metric_name, data->metric))
> +	if (!match_metric(pm->metric_name, data->metric))
>   		return 0;
>   
> -	memcpy(data->pe, pe, sizeof(*pe));
> +	memcpy(data->pm, pm, sizeof(*pm));
>   	return 1;
>   }
>   
>   static bool metricgroup__find_metric(const char *metric,
>   				     const struct pmu_events_table *table,
> -				     struct pmu_event *pe)
> +				     struct pmu_metric *pm)
>   {
>   	struct metricgroup__find_metric_data data = {
>   		.metric = metric,
> -		.pe = pe,
> +		.pm = pm,
>   	};
>   
> -	return pmu_events_table_for_each_event(table, metricgroup__find_metric_callback, &data)
> +	return pmu_events_table_for_each_metric(table, metricgroup__find_metric_callback, &data)
>   		? true : false;

comment on pre-existing code: since it returns bool, I don't think the 
ternary operator is required at all. There are many instances of this.

>   }
>   
>   static int add_metric(struct list_head *metric_list,
> -		      const struct pmu_event *pe,
> +		      const struct pmu_metric *pm,
>   		      const char *modifier,
>   		      bool metric_no_group,
>   		      const char *user_requested_cpu_list,
> @@ -1022,16 +1019,16 @@ static int add_metric(struct list_head *metric_list,
>   {
>   	int ret = 0;
>   
> -	pr_debug("metric expr %s for %s\n", pe->metric_expr, pe->metric_name);
> +	pr_debug("metric expr %s for %s\n", pm->metric_expr, pm->metric_name);
>   
> -	if (!strstr(pe->metric_expr, "?")) {
> -		ret = __add_metric(metric_list, pe, modifier, metric_no_group, 0,
> +	if (!strstr(pm->metric_expr, "?")) {
> +		ret = __add_metric(metric_list, pm, modifier, metric_no_group, 0,
>   				   user_requested_cpu_list, system_wide, root_metric,
>   				   visited, table);
>   	} else {
>   		int j, count;
>   
> -		count = arch_get_runtimeparam(pe);
> +		count = arch_get_runtimeparam(pm);
>   
>   		/* This loop is added to create multiple
>   		 * events depend on count value and add
> @@ -1039,7 +1036,7 @@ static int add_metric(struct list_head *metric_list,
>   		 */
>   
>   		for (j = 0; j < count && !ret; j++)
> -			ret = __add_metric(metric_list, pe, modifier, metric_no_group, j,
> +			ret = __add_metric(metric_list, pm, modifier, metric_no_group, j,
>   					   user_requested_cpu_list, system_wide,
>   					   root_metric, visited, table);
>   	}
> @@ -1047,17 +1044,17 @@ static int add_metric(struct list_head *metric_list,
>   	return ret;
>   }
>   
> -static int metricgroup__add_metric_sys_event_iter(const struct pmu_event *pe,
> +static int metricgroup__add_metric_sys_event_iter(const struct pmu_metric *pm,
>   						const struct pmu_events_table *table __maybe_unused,
>   						void *data)
>   {
>   	struct metricgroup_add_iter_data *d = data;
>   	int ret;
>   
> -	if (!match_pe_metric(pe, d->metric_name))
> +	if (!match_pm_metric(pm, d->metric_name))
>   		return 0;
>   
> -	ret = add_metric(d->metric_list, pe, d->modifier, d->metric_no_group,
> +	ret = add_metric(d->metric_list, pm, d->modifier, d->metric_no_group,
>   			 d->user_requested_cpu_list, d->system_wide,
>   			 d->root_metric, d->visited, d->table);
>   	if (ret)
> @@ -1107,19 +1104,19 @@ struct metricgroup__add_metric_data {
>   	bool has_match;
>   };
>   
> -static int metricgroup__add_metric_callback(const struct pmu_event *pe,
> +static int metricgroup__add_metric_callback(const struct pmu_metric *pm,
>   					    const struct pmu_events_table *table,
>   					    void *vdata)
>   {
>   	struct metricgroup__add_metric_data *data = vdata;
>   	int ret = 0;
>   
> -	if (pe->metric_expr &&
> -		(match_metric(pe->metric_group, data->metric_name) ||
> -		 match_metric(pe->metric_name, data->metric_name))) {
> +	if (pm->metric_expr &&
> +		(match_metric(pm->metric_group, data->metric_name) ||
> +		 match_metric(pm->metric_name, data->metric_name))) {
>   
>   		data->has_match = true;
> -		ret = add_metric(data->list, pe, data->modifier, data->metric_no_group,
> +		ret = add_metric(data->list, pm, data->modifier, data->metric_no_group,
>   				 data->user_requested_cpu_list, data->system_wide,
>   				 /*root_metric=*/NULL, /*visited_metrics=*/NULL, table);
>   	}
> @@ -1166,8 +1163,8 @@ static int metricgroup__add_metric(const char *metric_name, const char *modifier
>   		 * Iterate over all metrics seeing if metric matches either the
>   		 * name or group. When it does add the metric to the list.
>   		 */
> -		ret = pmu_events_table_for_each_event(table, metricgroup__add_metric_callback,
> -						      &data);
> +		ret = pmu_events_table_for_each_metric(table, metricgroup__add_metric_callback,
> +						       &data);
>   		if (ret)
>   			goto out;
>   
> @@ -1189,7 +1186,7 @@ static int metricgroup__add_metric(const char *metric_name, const char *modifier
>   			},
>   		};
>   
> -		pmu_for_each_sys_event(metricgroup__sys_event_iter, &data);
> +		pmu_for_each_sys_metric(metricgroup__sys_event_iter, &data);
>   	}
>   	/* End of pmu events. */
>   	if (!has_match)
> @@ -1603,16 +1600,16 @@ int metricgroup__parse_groups_test(struct evlist *evlist,
>   			    &perf_pmu__fake, metric_events, table);
>   }
>   
> -static int metricgroup__has_metric_callback(const struct pmu_event *pe,
> +static int metricgroup__has_metric_callback(const struct pmu_metric *pm,
>   					    const struct pmu_events_table *table __maybe_unused,
>   					    void *vdata)
>   {
>   	const char *metric = vdata;
>   
> -	if (!pe->metric_expr)
> +	if (!pm->metric_expr)
>   		return 0;
>   
> -	if (match_metric(pe->metric_name, metric))
> +	if (match_metric(pm->metric_name, metric))
>   		return 1;
>   
>   	return 0;
> @@ -1625,8 +1622,8 @@ bool metricgroup__has_metric(const char *metric)
>   	if (!table)
>   		return false;
>   
> -	return pmu_events_table_for_each_event(table, metricgroup__has_metric_callback,
> -					       (void *)metric) ? true : false;
> +	return pmu_events_table_for_each_metric(table, metricgroup__has_metric_callback,
> +						(void *)metric) ? true : false;
>   }
>   
>   int metricgroup__copy_metric_events(struct evlist *evlist, struct cgroup *cgrp,
> diff --git a/tools/perf/util/metricgroup.h b/tools/perf/util/metricgroup.h
> index 0013cf582173..b1f186d0f514 100644
> --- a/tools/perf/util/metricgroup.h
> +++ b/tools/perf/util/metricgroup.h
> @@ -81,7 +81,7 @@ int metricgroup__parse_groups_test(struct evlist *evlist,
>   
>   void metricgroup__print(const struct print_callbacks *print_cb, void *print_state);
>   bool metricgroup__has_metric(const char *metric);
> -int arch_get_runtimeparam(const struct pmu_event *pe __maybe_unused);
> +int arch_get_runtimeparam(const struct pmu_metric *pm);
>   void metricgroup__rblist_exit(struct rblist *metric_events);
>   
>   int metricgroup__copy_metric_events(struct evlist *evlist, struct cgroup *cgrp,
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
> index 21cce83462b3..0336ff27c15f 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -1570,8 +1570,6 @@ int parse_events_add_pmu(struct parse_events_state *parse_state,
>   	evsel->scale = info.scale;
>   	evsel->per_pkg = info.per_pkg;
>   	evsel->snapshot = info.snapshot;
> -	evsel->metric_expr = info.metric_expr;
> -	evsel->metric_name = info.metric_name;
>   	return 0;
>   }
>   
> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> index 2bdeb89352e7..d627f99b5a63 100644
> --- a/tools/perf/util/pmu.c
> +++ b/tools/perf/util/pmu.c
> @@ -283,10 +283,6 @@ static void perf_pmu_update_alias(struct perf_pmu_alias *old,
>   	perf_pmu_assign_str(old->name, "long_desc", &old->long_desc,
>   			    &newalias->long_desc);
>   	perf_pmu_assign_str(old->name, "topic", &old->topic, &newalias->topic);
> -	perf_pmu_assign_str(old->name, "metric_expr", &old->metric_expr,
> -			    &newalias->metric_expr);
> -	perf_pmu_assign_str(old->name, "metric_name", &old->metric_name,
> -			    &newalias->metric_name);
>   	perf_pmu_assign_str(old->name, "value", &old->str, &newalias->str);
>   	old->scale = newalias->scale;
>   	old->per_pkg = newalias->per_pkg;
> @@ -302,8 +298,6 @@ void perf_pmu_free_alias(struct perf_pmu_alias *newalias)
>   	zfree(&newalias->long_desc);
>   	zfree(&newalias->topic);
>   	zfree(&newalias->str);
> -	zfree(&newalias->metric_expr);
> -	zfree(&newalias->metric_name);
>   	zfree(&newalias->pmu_name);
>   	parse_events_terms__purge(&newalias->terms);
>   	free(newalias);
> @@ -340,16 +334,13 @@ static int __perf_pmu__new_alias(struct list_head *list, char *dir, char *name,
>   	int num;
>   	char newval[256];
>   	char *long_desc = NULL, *topic = NULL, *unit = NULL, *perpkg = NULL,
> -	     *metric_expr = NULL, *metric_name = NULL, *deprecated = NULL,
> -	     *pmu_name = NULL;
> +	     *deprecated = NULL, *pmu_name = NULL;
>   
>   	if (pe) {
>   		long_desc = (char *)pe->long_desc;
>   		topic = (char *)pe->topic;
>   		unit = (char *)pe->unit;
>   		perpkg = (char *)pe->perpkg;
> -		metric_expr = (char *)pe->metric_expr;
> -		metric_name = (char *)pe->metric_name;
>   		deprecated = (char *)pe->deprecated;
>   		pmu_name = (char *)pe->pmu;
>   	}
> @@ -404,8 +395,6 @@ static int __perf_pmu__new_alias(struct list_head *list, char *dir, char *name,
>   		perf_pmu__parse_snapshot(alias, dir, name);
>   	}
>   
> -	alias->metric_expr = metric_expr ? strdup(metric_expr) : NULL;
> -	alias->metric_name = metric_name ? strdup(metric_name): NULL;
>   	alias->desc = desc ? strdup(desc) : NULL;
>   	alias->long_desc = long_desc ? strdup(long_desc) :
>   				desc ? strdup(desc) : NULL;
> @@ -822,9 +811,6 @@ static int pmu_add_cpu_aliases_map_callback(const struct pmu_event *pe,
>   	struct pmu_add_cpu_aliases_map_data *data = vdata;
>   	const char *pname = pe->pmu ? pe->pmu : data->cpu_name;
>   
> -	if (!pe->name)
> -		return 0;
> -
>   	if (data->pmu->is_uncore && pmu_uncore_alias_match(pname, data->name))
>   		goto new_alias;
>   
> @@ -879,12 +865,6 @@ static int pmu_add_sys_aliases_iter_fn(const struct pmu_event *pe,
>   	struct pmu_sys_event_iter_data *idata = data;
>   	struct perf_pmu *pmu = idata->pmu;
>   
> -	if (!pe->name) {
> -		if (pe->metric_group || pe->metric_name)
> -			return 0;
> -		return -EINVAL;
> -	}
> -
>   	if (!pe->compat || !pe->pmu)
>   		return 0;
>   
> @@ -1469,8 +1449,6 @@ int perf_pmu__check_alias(struct perf_pmu *pmu, struct list_head *head_terms,
>   	info->unit     = NULL;
>   	info->scale    = 0.0;
>   	info->snapshot = false;
> -	info->metric_expr = NULL;
> -	info->metric_name = NULL;
>   
>   	list_for_each_entry_safe(term, h, head_terms, list) {
>   		alias = pmu_find_alias(pmu, term);
> @@ -1486,8 +1464,6 @@ int perf_pmu__check_alias(struct perf_pmu *pmu, struct list_head *head_terms,
>   
>   		if (alias->per_pkg)
>   			info->per_pkg = true;
> -		info->metric_expr = alias->metric_expr;
> -		info->metric_name = alias->metric_name;
>   
>   		list_del_init(&term->list);
>   		parse_events_term__delete(term);
> @@ -1703,8 +1679,7 @@ void print_pmu_events(const struct print_callbacks *print_cb, void *print_state)
>   	for (j = 0; j < len; j++) {
>   		const char *name, *alias = NULL, *scale_unit = NULL,
>   			*desc = NULL, *long_desc = NULL,
> -			*encoding_desc = NULL, *topic = NULL,
> -			*metric_name = NULL, *metric_expr = NULL;
> +			*encoding_desc = NULL, *topic = NULL;
>   		bool deprecated = false;
>   		size_t buf_used;
>   
> @@ -1742,8 +1717,6 @@ void print_pmu_events(const struct print_callbacks *print_cb, void *print_state)
>   			buf_used += snprintf(buf + buf_used, sizeof(buf) - buf_used,
>   					"%s/%s/", aliases[j].pmu->name,
>   					aliases[j].event->str) + 1;
> -			metric_name = aliases[j].event->metric_name;
> -			metric_expr = aliases[j].event->metric_expr;
>   			deprecated = aliases[j].event->deprecated;
>   		}
>   		print_cb->print_event(print_state,
> @@ -1756,9 +1729,7 @@ void print_pmu_events(const struct print_callbacks *print_cb, void *print_state)
>   				"Kernel PMU event",
>   				desc,
>   				long_desc,
> -				encoding_desc,
> -				metric_name,
> -				metric_expr);
> +				encoding_desc);
>   	}
>   	if (printed && pager_in_use())
>   		printf("\n");
> diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
> index 69ca0004f94f..4d8d64209b4b 100644
> --- a/tools/perf/util/pmu.h
> +++ b/tools/perf/util/pmu.h
> @@ -133,8 +133,6 @@ extern struct perf_pmu perf_pmu__fake;
>   
>   struct perf_pmu_info {
>   	const char *unit;
> -	const char *metric_expr;
> -	const char *metric_name;
>   	double scale;
>   	bool per_pkg;
>   	bool snapshot;
> @@ -188,13 +186,6 @@ struct perf_pmu_alias {
>   	 * default.
>   	 */
>   	bool deprecated;
> -	/**
> -	 * @metric_expr: A metric expression associated with an event. Doing
> -	 * this makes little sense due to scale and unit applying to both.
> -	 */
> -	char *metric_expr;
> -	/** @metric_name: A name for the metric. unit applying to both. */
> -	char *metric_name;
>   	/** @pmu_name: The name copied from struct perf_pmu. */
>   	char *pmu_name;
>   };
> diff --git a/tools/perf/util/print-events.c b/tools/perf/util/print-events.c
> index 2646ae18d9f9..62e9ea7dcf40 100644
> --- a/tools/perf/util/print-events.c
> +++ b/tools/perf/util/print-events.c
> @@ -101,9 +101,7 @@ void print_tracepoint_events(const struct print_callbacks *print_cb, void *print
>   					"Tracepoint event",
>   					/*desc=*/NULL,
>   					/*long_desc=*/NULL,
> -					/*encoding_desc=*/NULL,
> -					/*metric_name=*/NULL,
> -					/*metric_expr=*/NULL);
> +					/*encoding_desc=*/NULL);
>   		}
>   		free(dir_path);
>   		free(evt_namelist);
> @@ -195,9 +193,7 @@ void print_sdt_events(const struct print_callbacks *print_cb, void *print_state)
>   				"SDT event",
>   				/*desc=*/NULL,
>   				/*long_desc=*/NULL,
> -				/*encoding_desc=*/NULL,
> -				/*metric_name=*/NULL,
> -				/*metric_expr=*/NULL);
> +				/*encoding_desc=*/NULL);
>   
>   		free(evt_name);
>   	}
> @@ -255,9 +251,7 @@ int print_hwcache_events(const struct print_callbacks *print_cb, void *print_sta
>   				event_type_descriptors[PERF_TYPE_HW_CACHE],
>   				/*desc=*/NULL,
>   				/*long_desc=*/NULL,
> -				/*encoding_desc=*/NULL,
> -				/*metric_name=*/NULL,
> -				/*metric_expr=*/NULL);
> +				/*encoding_desc=*/NULL);
>   	}
>   	strlist__delete(evt_name_list);
>   	return 0;
> @@ -277,9 +271,7 @@ void print_tool_events(const struct print_callbacks *print_cb, void *print_state
>   				"Tool event",
>   				/*desc=*/NULL,
>   				/*long_desc=*/NULL,
> -				/*encoding_desc=*/NULL,
> -				/*metric_name=*/NULL,
> -				/*metric_expr=*/NULL);
> +				/*encoding_desc=*/NULL);
>   	}
>   }
>   
> @@ -331,9 +323,7 @@ void print_symbol_events(const struct print_callbacks *print_cb, void *print_sta
>   				event_type_descriptors[type],
>   				/*desc=*/NULL,
>   				/*long_desc=*/NULL,
> -				/*encoding_desc=*/NULL,
> -				/*metric_name=*/NULL,
> -				/*metric_expr=*/NULL);
> +				/*encoding_desc=*/NULL);
>   	}
>   	strlist__delete(evt_name_list);
>   }
> @@ -364,9 +354,7 @@ void print_events(const struct print_callbacks *print_cb, void *print_state)
>   			event_type_descriptors[PERF_TYPE_RAW],
>   			/*desc=*/NULL,
>   			/*long_desc=*/NULL,
> -			/*encoding_desc=*/NULL,
> -			/*metric_name=*/NULL,
> -			/*metric_expr=*/NULL);
> +			/*encoding_desc=*/NULL);
>   
>   	print_cb->print_event(print_state,
>   			/*topic=*/NULL,
> @@ -378,9 +366,7 @@ void print_events(const struct print_callbacks *print_cb, void *print_state)
>   			event_type_descriptors[PERF_TYPE_RAW],
>   			"(see 'man perf-list' on how to encode it)",
>   			/*long_desc=*/NULL,
> -			/*encoding_desc=*/NULL,
> -			/*metric_name=*/NULL,
> -			/*metric_expr=*/NULL);
> +			/*encoding_desc=*/NULL);
>   
>   	print_cb->print_event(print_state,
>   			/*topic=*/NULL,
> @@ -392,9 +378,7 @@ void print_events(const struct print_callbacks *print_cb, void *print_state)
>   			event_type_descriptors[PERF_TYPE_BREAKPOINT],
>   			/*desc=*/NULL,
>   			/*long_desc=*/NULL,
> -			/*encoding_desc=*/NULL,
> -			/*metric_name=*/NULL,
> -			/*metric_expr=*/NULL);
> +			/*encoding_desc=*/NULL);
>   
>   	print_tracepoint_events(print_cb, print_state);
>   
> diff --git a/tools/perf/util/print-events.h b/tools/perf/util/print-events.h
> index c237e53c4487..716dcf4b4859 100644
> --- a/tools/perf/util/print-events.h
> +++ b/tools/perf/util/print-events.h
> @@ -16,8 +16,7 @@ struct print_callbacks {
>   			const char *scale_unit,
>   			bool deprecated, const char *event_type_desc,
>   			const char *desc, const char *long_desc,
> -			const char *encoding_desc,
> -			const char *metric_name, const char *metric_expr);
> +			const char *encoding_desc);
>   	void (*print_metric)(void *print_state,
>   			const char *group,
>   			const char *name,

