Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64867873B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 21:07:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P11N91L29z3cgr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:07:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=ENTK/53c;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Gk+1qAT2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=ENTK/53c;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Gk+1qAT2;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0tzd0hxlz3bbc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 02:18:52 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30NEhr96000850;
	Mon, 23 Jan 2023 15:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=RH61e6RnDCDqTeiybyt+3r5rKroltQiz/m0utGmyd3o=;
 b=ENTK/53c1/DYaSEyOO8x9ghZminpds7G9Efgx4b5k3DqrfVA/ASceaSrPGMQU+G0Dz1D
 ITnlfeBA1oAZPjeEmDiGV0sL8bpm/QLWIZYAsYZI3gqOblJh/yPL9LStRdVCyS4VXcu8
 cZULJj9mHL4kYSfRlQILIJ5R8eqAqiQnCjKpMzc5KXR2g+lFYwO8iUWi2zq271GxOZYO
 xINnCabExYjQFN5mn6HcEyAQzlsOkxrxaahUUjPi+5GBwKQARlVqxCIMCxn2KyCXSFuN
 yeAA7fQZCCqQ2hAF2G7cFG52/pfgIf2gqSmFRotbX6srlm1TxQBsm3bQq3+8SQniJaLo Ew== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n87xa2y59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 15:18:29 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30NErXlS028942;
	Mon, 23 Jan 2023 15:18:27 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g9wvqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 15:18:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DC3QJKaKWlsYM3rhzXDh+KXWOQRl7OhBrnmnQauN86mSjblkZ5cOQxTBX/fe6Q7qdPXoBB8Ya3qfP1js/ieMFTo8p+tmT4y5qZVQpDfX7GF3lnu0z64XEYK2U9AeTCVAsOFDJVihSR2D311fwpj1dEDeyFKKp8GNed/7YZPvcwbV9M63XEC3CBL5xxaSCU5yvZd0uQ2KTznafaAX1lgQwwVnh3rZarAPDXmLd6zvKiJf46GwqU4nsgMHuY8QpE2ANgcg3ow1fcrTR8S2r6xwfEMKu5CJ52evgrFkCuxV1p/BqIGzz1sMxes353quLVR3gXd9KpizDjnOx+GfDi9www==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RH61e6RnDCDqTeiybyt+3r5rKroltQiz/m0utGmyd3o=;
 b=DOg9WtD28y/jMubVJfFasxZ/eOyVmcK0iXGrqgohVITwsygEo7Skwpf0a/6kEVn7TPeWWZNOnoeoEpDGUVuGWKV6s1RQOnN7D7bIE8HfBS8iROzdI88TufCIWEub9e5ldvOvURpyhYUOTdOQLUAwodKamm1h9hEDXFS+PEo55i6vX8rYfsdP6zRnFYDC7bi/aB3vijjW+GOBvDamq5+hnEWYRqtIWRbNk0ci9xh+1NqTQpzhxvJebDog1C4TdBSLXQMyzeSkfSQ6JdcRuFiwlYJAxSUVh1evAudvDtzdt0N5RhRmR+I2W1iyaVDkrgii1VmKBz+VNw3bRXP23SUCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RH61e6RnDCDqTeiybyt+3r5rKroltQiz/m0utGmyd3o=;
 b=Gk+1qAT2ReSGwJWW3Um+Dlnxlx4H/l3De24I5FRYJ3gu5M9Mc4a9TCQnRtbx1Lek38xq5Qv2awdkzuyZctuaDrB+inJ0qhCpcFjo8+3X6VOImE1YhnpoWFuKuRSlEbQe8KFtkaVJ/z7pb+7UV5ww78tzriJysWdien6HGfa0ix0=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by CH0PR10MB5209.namprd10.prod.outlook.com (2603:10b6:610:da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16; Mon, 23 Jan
 2023 15:18:25 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%8]) with mapi id 15.20.6043.009; Mon, 23 Jan 2023
 15:18:25 +0000
Message-ID: <f5d0e9f0-7076-07f5-483b-57eaee26ff3f@oracle.com>
Date: Mon, 23 Jan 2023 15:18:19 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 8/9] perf jevents: Generate metrics and events as
 separate tables
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
 <20221221223420.2157113-9-irogers@google.com>
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20221221223420.2157113-9-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0111.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::11) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|CH0PR10MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c89cd1-9f9d-48ab-e373-08dafd551268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DwR9Ib+vPh1lY1mUiHo+v6LgSryeVE5bhZT66ympgLxekM6bXjjtHLEImm9Bb0mAklnr13dMGouhz8NUmWqUXIUq4HydaPf2B37eXhKUw1/2p8/cuyHltPyYyNlaHhp1JKFlHjjElvJuV4orolY0xttYyJj6x6w2+TWEkS/qjxhkC9Of0QeTzElb/Eah8JyNbC8eVq5m7QgT/7m3LEkbfRY+tWdvz5HJr/eljEiP2b9nTGhTADnEox0P2t8W+OrjKgHnAj/+TctXmT3mnAWrE0kb8XCd/d+yoLI++VfXMM6y2YW3r86X9gJer6WuR8TNqkC04egG2bfk6jIG698iyGeDDZAybTMNvVcmLbzIAg9yqBNpAZHnn72UvScNXilp0CHaUF0YNWQYm36xxJy0DqtSGaXFqTdu7ETaJowbsPB6qr3T2lntYsPbTlS5FZVrzMIOiePwE3x68s5KVPMWzjyhs6/LIaQGVtthy2s4A9H97+qfeDPmht/fyfqE9GOZYybQgljKHpPlQncqG0QPR+rDYU+OYpW8bQLZPuBC5q44S7Su6vPhmKQtZkF8hbWKvcmfPbTQq4mQL/Om8/6dd16EdCll/UH/1UOoqOOtwwqk1TiGLu1Vvjrw0l536HYZJ1R8awpPsPWq6jrObCAM+oTRddyrLTOoX18It0s+yW/dtAc6D7l4wYmN4ra0zScXgf6FrJCZC8Dd5M9Mbcafh3xHDbg0GhWWgbhipOJAHxoqmAr7EPR3F2KWoHgpjrtn
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199015)(38100700002)(36756003)(921005)(31696002)(86362001)(478600001)(316002)(54906003)(110136005)(6486002)(66476007)(4326008)(66946007)(8676002)(66556008)(2616005)(53546011)(31686004)(36916002)(6506007)(2906002)(26005)(6666004)(186003)(41300700001)(7406005)(7416002)(6512007)(5660300002)(4744005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?QWV5bUgxOG1YSStwMVdvU1hObGhZdzBQZmU0bkdCdTk3UVBXKzcyMTg5b2hJ?=
 =?utf-8?B?RTB6VTVvYmg0SGZaSmx3djlQa3FaTENUTkpCc0xNZ0pINjR1S0EvcGpWL0Z1?=
 =?utf-8?B?VTQ4Y2xhTFJKRzhHR0I2MEl5RDV5N3hlNmUvRDhLNm1KcDZDcTZ5QlpQdmxC?=
 =?utf-8?B?NkFydEowT01ZNHB1Tmdwd0xCcm1WcTd1aEtCL1Y2UktMYUZNQ2ZZZTBZVmxH?=
 =?utf-8?B?YytSaG9WaEszeGYwNjRkRDJGb0RHNE5LOFd5YTdqMXMydjArT0JmVGtXREZr?=
 =?utf-8?B?eFFtY3RvdFFjU0JoRjdaR0YrLzhwUXFzQ3RqbFR4TEZBMkNXWXpySkdWWUVz?=
 =?utf-8?B?VjYvMmt4aXRReXhkUnR6TGt0ZU9sU3U2NkUzdnBjUHNjeTk2dCt0SWNiQ3lW?=
 =?utf-8?B?K0xrNDZFVklKYlBpLzNONkFHeExwL0c2Q01kcmVvT201UmpiY0UvQldZRCtU?=
 =?utf-8?B?WEl6cVNXMndWWm0rb2htUjJsSk1oRmFKa0lINmYyUXI4WUlzMjlydUJ0elQ0?=
 =?utf-8?B?N0MvOTdZa2FPUGt4UHJnakJsMFp2UmxOWXBiNkMrV1B2TnBtMkxweWpOSXV3?=
 =?utf-8?B?Qkdtc1g3WWx2dS9ZMFhISFBBZ2FKc3ByTWVLYWtCWS9YdUR6M1JZZjQwNnZh?=
 =?utf-8?B?T3Z2UFlqTUx2MkdZSi9WV29TSUdwQUxneWtrTFJHZUUvTkxKcExiMjh3SGY5?=
 =?utf-8?B?RFFHa253US84a1JnMXY3cjhYS1FqV3gzK1BHZFFmL25OeXhBV0xGckJLUUZ0?=
 =?utf-8?B?eXQvaDBwWU1Cb3J6b25vL0lFMlN2T0ZzS01rRE9jTDBvb0FkMENCYnBJVWlC?=
 =?utf-8?B?aG9nQnFHUlZjaEk4a0w5UzFET2JCMTJDS0FNV3o1djUxajlielc4blh1dUl5?=
 =?utf-8?B?YXB4Q3cwajR1elJDbHB3YnpWRjVvT2RVT1hqT0NydjZuNWYwamxEdzVkMnIz?=
 =?utf-8?B?WTV3VW9vMzZ5dEpUdzNzMWgzRmttSzRwd2RuSDkrT2NlSE1IWGhsejVWRzlP?=
 =?utf-8?B?WE1sYVJtQmVndDFOaU1DT25SdTZyY2tYbEllZlZRRlkvN0Y5dCsyUVo3bmZn?=
 =?utf-8?B?MDdUUnZTeUVEdmV4Ulp0T1BwNmJxZC9PVUdwSVlIYnlzd3hoclpuWGtxMEdP?=
 =?utf-8?B?eGpEMVY3cUJmMEYvenhORGg4OEVTU2M2blhGZ1JEU0RTT01HYkwwOXE1a3g1?=
 =?utf-8?B?MXlwWnh1bUlvaStJRWNSeXdYNGJQakhGWkduT3poQmtmazdTVjFHVFQ2V2Qw?=
 =?utf-8?B?dnNFNmdya2tqVmhxQjBDWXFpbWV5TjhPSFo3RjV2dFo2cTd2ckZlUUhydENs?=
 =?utf-8?B?Mld1bkEyMG1jckdkS2lqVlpnZ3dXcHhhYkdUN202VU9oc2tPazZsQUt3K2t2?=
 =?utf-8?B?R0Y2K215MFppVGxVM1FqbEZnUG5vYmllclpxSkZCTjB1ZzdYaUN0d2VKYU0w?=
 =?utf-8?B?R0tLMjZveFVBcTA1MGRoQ2NJVW1iYWxGaERmc1ROOVp4anZBZzVmNXVwVm5m?=
 =?utf-8?B?Z1JkK00yMDZTSUQwaGlLZXpScTJ5MlRXS0x3elZxVDVjZWpPSGZvNzJNNmZz?=
 =?utf-8?B?Z01aMEx5ODFzTXpUT3NmNXNhZGd2bUFTUHNWZ3paL243WmxIbVY5TmtwMVVr?=
 =?utf-8?B?VllRaHlLU2ZISnRLWm5RWkFCcFozc3dTVVJNcDB4ZFA2bWNBV1ZQNStLUVFM?=
 =?utf-8?B?QVBFVXJsZ0VSZ0xqSVhodk5kTFZFWVFsY1VZd3ZTQ294V28yeW5tbXdFNnVw?=
 =?utf-8?B?TEhnUVpzSmNXQXdMQ2IrQk9sN2Z2NFFHakFlbk1qQnhZNTZlZE9FN2pDNUQv?=
 =?utf-8?B?VStxbFkwd3FYcWFsTTdiNlVDT1k2NDc1UHFuNFhZRk0wVGpVdUtOSC80Mmc3?=
 =?utf-8?B?OHNpRW0wZkdIekwxWlBsYTJRV3N6dUxmSEhac1NvalVIemRyYU5ZN3FWcjlR?=
 =?utf-8?B?MllUcWlOU2J5U0pMSjRPL25rRllxL2dDbjhVbDVlQkphQitscGlUQ1RHQW5j?=
 =?utf-8?B?aHVpMzE2ZTNreHJvdlJreGYrV3M3QVFkSGx1bmMzVUtzbGRlQVg4SWFZdmph?=
 =?utf-8?B?eDZwSkoyK0NkY0VIUmZPRTQyZWRBdmV2TXgzdGl2cGJGQ0V4M3hsNURNekts?=
 =?utf-8?B?aEl6c2pmQU52QWFwYi9LUzZkRUQ1NDdScGUyQUM1TUp0dHFhOVk4VUZoOFJh?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?MU03M2tMK1VzTmFzTHBHVjNhV0pjV2hhVU9oSGhzNFBWZWdsckMrY2w4a1Y0?=
 =?utf-8?B?dVZ1MW9OQ3MxNjdLYnppbk5sbWdQZ3J0UHlCcEZWMXg0UFN0OHpVTU1sUHpF?=
 =?utf-8?B?T2JwbE03d2JRVVV5TDhPTU9uUlltSmQ3NEZGcFNZcTVyWWwzSUs5SkZBTkxO?=
 =?utf-8?B?R3lrK29zT3BGck9Ec04wS2h6bjdITzkvYVhjeWkvd1FIWmpzYzV4VmlYODBC?=
 =?utf-8?B?SS9KdlFJZjlBakZmWEtIaFJMb09iRUV4aldydlBrVnFpNVNhbEsvc1dQUEJC?=
 =?utf-8?B?UU8yeEc3eGZDYnZadVNrUGJmY3JQNjUyNC93N3dQMlRTZTJIUTV6OUFkQmpu?=
 =?utf-8?B?dEx1S1pONlgrTG5HTFcvUzVNcU83cmhURFo4VUptNTB3eDJITGJCN2wySyt0?=
 =?utf-8?B?OW9DdndRNW5WUzJRYkxqSjU2UXFZRXQ3UEtrSTNKZmw2eXlsbG5HWnJsNmZ1?=
 =?utf-8?B?Nmh1TEtOZ0E3VXhvQVhjTmxvb1FKbmRWdURUZTJ3VkZNcy9VV0Fub054NEpu?=
 =?utf-8?B?MzNwVlJLc0xmY01udGU5K25abnhYOFh4MzhjbkRkelBSM0I5dEhBZWlCaDU0?=
 =?utf-8?B?QWo3TEJzeEoxTUxVS1JrYjRzWW1vQjNzVTR2L0pYNXBNZkVtZXNSQm5PUEZG?=
 =?utf-8?B?ZW1weEt4bG1FenU5S2V1NUI4dnJsVzE1VHNSbXFmNkx3T1I3bkp4eUxuMGdT?=
 =?utf-8?B?Nm5wR3VJRlpBYktWK2oybmt5OHdPR2J2bnRkQjNod0tKdS9hUDBjM0g3c2xq?=
 =?utf-8?B?U0hHYWFyclo0b2R5eTUxc3puczc3cmZ5Yko0WkpLcVYwS1RibVFrdklNcUxu?=
 =?utf-8?B?Tm1xcURpR01PWENwSi9iZ0ljNlZCODhoU1VuQ2tKaUFnRXUyVTJjMUtyaUpq?=
 =?utf-8?B?V3RJSGJtaDFKRHNydkRSd2Nha3A3dG9tbjV5b0JkRUk5K2xGS29oYWlDTzJF?=
 =?utf-8?B?L2U5dFNKdWJjOXJNdXpMNm4rNXVVSUJYOHZvRVVuYThhb0lJOG05Nmc1NW5q?=
 =?utf-8?B?bkxxMlJFa1pHenAzS0czUnZwdXVDQ0dkWVVueXlRajQ1UUs1UEIrVEw1eHh2?=
 =?utf-8?B?TXBxSHliSE4rOVdpV1hZZ2pienZkb1lJbkxJbnhOTzN6blVoT0swNVBIbzJj?=
 =?utf-8?B?cWtzVUtRVkw3VkQ0cDJhaUN4MDNhVnRqNFZ2cWw5bVVVQWZoRlY2WlU2eFpT?=
 =?utf-8?B?V29uRVp5bVlCT1diK2VDRFltejJacTBhTVZHamt2cUxoVm5WWWthVTZRaVgv?=
 =?utf-8?B?QStZemlleDNWdjh4U05RNmhNVkx6WVFaWEF3d3R4RUh1eUhtVFhaTFEzU2Y0?=
 =?utf-8?B?OStjMG1IbWpDMkVzSlBqY21OYWVpNlhXcEpOcWl5ejZvNTNYUDBVZXZydVR5?=
 =?utf-8?B?MFRLRERTWTdhYkZVWEdZVUpTNTBRZEJkSWtLVDlYY3ZjY1VFV01Ed1hMNVFr?=
 =?utf-8?B?UUtOa2RUSkwyanNHajNPYW5ZeTR3VEZFWitEUzFKNkg4TnlWUHppSVg5NVND?=
 =?utf-8?B?cmpEbWU2emcwMGtPekk5SWhLS1pLelNhMlp5dmNGZlRITWlvVENaQ0J5dGc4?=
 =?utf-8?B?RU5Dd1dKTE9oNEVVVU9JcXQrdFhOeGhqQTBQbU1RSHkxdXQrTzhUL013N2VZ?=
 =?utf-8?B?WWU3S015M2tyQ2EzSU10WE1FeHJacFNTUktZUkMrdlQraEtvVjFhY0dTVGI0?=
 =?utf-8?Q?DZohd+jS2a3yNzkgockD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c89cd1-9f9d-48ab-e373-08dafd551268
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 15:18:25.2069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fdb+XLn/xk9kZGVs2Zt748qErdcL8yHKBe6NgTEr1k44Ufh1QV2SUKicpa1CLnRCrvR7BkALDwNMBsDuMou0sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5209
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_11,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230146
X-Proofpoint-GUID: C_HR1r4k7RWoXDRdDLL9_jE3XcR0Uc67
X-Proofpoint-ORIG-GUID: C_HR1r4k7RWoXDRdDLL9_jE3XcR0Uc67
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
> Turn a perf json event into an event, metric or both. This reduces the
> number of events needed to scan to find an event or metric. As events
> no longer need the relatively seldom used metric fields, 4 bytes is
> saved per event. This reduces the big C string's size by 335kb (14.8%)
> on x86.
> 
> Signed-off-by: Ian Rogers<irogers@google.com>

It would have been good to show an example of how the output changes. I 
could not apply the series (see cover), and knowing what to expect makes 
reviewing the code easier...

Thanks,
John
