Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB12678731
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 21:06:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P11M60X8Cz3cCm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:06:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=tvCSNJ2c;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=DIA0OctB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=tvCSNJ2c;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=DIA0OctB;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0tGL3fQPz3bNg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 01:46:33 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30N9QlH0008883;
	Mon, 23 Jan 2023 13:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=q5sQ7F7y3oqVxmhsM77aYE5YMDJmMiUFn67QHZbMQMY=;
 b=tvCSNJ2cSfHqxf1S7EEu8Hn8gHI/m6kkBPN0x8K/8M/b1RYvnGB8ITiwbJfqtpwyth0U
 JUccCNfg7H78MCsm+thTg2CwpNFrOZrv1imhiAeOM9tnS8LyxctGKadFTei3AQg+Qmdr
 LjZMYzVRJ1kkVEbxrAcd+uP9xc9VIJVcdcY2eNrkxaUALQTNj9YjO4mKc9zfpOKR+6ni
 Lr8hSIwBvJgEsuKVVchtqjOYpew3nX/6ZWW5sR6rp9SvN9oBaS2ITycYzoSpF9oAitJD
 Klof7P+iy4e4bDdqXT+D3X8hF31b0UfassgU1YwIgl1AEWjWlozOUMu5o5wMFC5lhPqA pA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n88kttm2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 13:25:57 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30NBOTQo004087;
	Mon, 23 Jan 2023 13:25:56 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g9s5q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 13:25:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfwUYGTVQPgs+nJE4ahAC7lEEBClFt6DDsb0fONowur0S1ILwHHFoYY1ciVGljdfVQbUljEvRnismr5AkjXx5q/KSi2TI9QxlcBle5lViHA+YLLwxwYiz6uPFez52FVoDdmB67byqbkGLK78ijQNYGpFUCiEC2JzjwJhTejZKsRKsdvScFfvCVx5Y7HRz96VwwZkjACUQqT6+z+4KECHC804rR4UPY3yUbPVfv1nFYGdbpNN95qefGHR3GkJh0pF8crhLfEDhKt3U7HddqdTHYa4wYgvn5CM7t+XHBzcagDTDvxL6677on2/JMFanYTdEs3KjI+Ku8ncXXgworgckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5sQ7F7y3oqVxmhsM77aYE5YMDJmMiUFn67QHZbMQMY=;
 b=hmN7tfmVFAZr72rrTlvbKMeWwkRrygIHstb36gBOfuEZ/P+y2IMiXlAZHs858iSjaKJ2+goxyVQ9uU327kmLAMFkHY7MdNcpQNLl1SfhSJsDxaS6hWnL7Rn+UwOlBW9uW8nqsnFQmlGxoKcAcTYe4hCAeQaL++IYuYGJmMVK+hKzM0xeP2dyP9TAAdg4AOgtVjgNJ82WSEQJcBHM0rtTAIFQHqbfEZaQ3o41AZEHRKEJ6oPlUdpIQdN9oc2ZDb+swJwE6Z+/kMpB3N/cJ3gUVLF1K+5YyegUs8sxdQ+/sV5zq2pYj58w1h//Wf91Nwfo2Yjq3x6fWMWZ3J5EXZGltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5sQ7F7y3oqVxmhsM77aYE5YMDJmMiUFn67QHZbMQMY=;
 b=DIA0OctBadRL30WBStubzMWXC2iHEpCSTN59rR/XmuwgMMZY+6m8y4taAhw7TdB+jPfMCldnv/PQzCGQVhaz9HklbRrnqPSgrWZx5JLh3P/ezbkNVoWo11Gwj1BDsWsKz+7fON3xgnRr2b/Rq8ghhH3sNpgy7i8KT+p9WTSI9F4=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by SA1PR10MB5687.namprd10.prod.outlook.com (2603:10b6:806:23f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Mon, 23 Jan
 2023 13:25:53 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%8]) with mapi id 15.20.6043.009; Mon, 23 Jan 2023
 13:25:53 +0000
Message-ID: <791915a9-0c2b-796a-b788-f026e071859b@oracle.com>
Date: Mon, 23 Jan 2023 13:25:46 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/9] jevents/pmu-events improvements
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
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20221221223420.2157113-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::18) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|SA1PR10MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a1b8d5-5221-4a9a-c07b-08dafd455a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oYpS+mBBBt446nNCVsBBWYsn+WNcq2GfSatfPCPmDz4qpU/54sDV6PjVXZgqY1RS7Mtm7qQKWOUVUeekvX/pdjjeq5ec47oHG0HN8qSPfpstxbFWSMfYySFH2MfQlN3G9aqs4NFNcLZR8O0HhnDOjbTlLSqoM22/rtizOsXXcz+pjTmtXabwCEqkeOtejkcOuej+qO0cDLq+HDt1LcFUulhhQyMZ3nEnHv98G2Zden6rqHTl58Irxp7BkjwNs6SkJxmrjWOmTZAbjfASjz6i4mwsCMQuS17i3b49ZaIe3fzwZcvrdWC850If/aAxZyuNzC2Qy/Is9Y4cn4xnKJ8sX3KDWTXA4AwPBOMeL/gXlAtuLOyN/0KWn/zTrCA6J6ya1/CUAE/d1RhseX3adJxv+50h0QEMA4sf3ccTg2YM5yO2I9ah5551wYwdtgRN//WXtMgi6CWX5PiKG7t7bXoOhNF5DmfxtOYEm5SMV1q5NZpI7PpOleSbXdZV6llDose1vL5rDtwCsoQzUIVGFkDtZAuHLxZX8HcQg9hTyu0TFuAPXFu7oMAeN4ORXEpw0Vm2UgEuc//pRaZQqwzvW3yioDhWg6ovERXl5V1f/OzrhGpl7+7c/KnSzInDGw857fWI7WYF4I1cDw7NXZYdh3Wmh3Mu/3XN8Oo+vuigYiksWah3zHAFGN/FR2Cb8VmhbNOjvjtT5Nmz8ZOEV6OtBRmvyvvKLbxsWaIWYz7OJtu3KncJo9D3ZGD6MsC+VPExPBAi
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199015)(2906002)(86362001)(31696002)(6486002)(478600001)(66476007)(4326008)(41300700001)(26005)(186003)(53546011)(8676002)(66556008)(2616005)(36916002)(66946007)(316002)(110136005)(6666004)(921005)(54906003)(7416002)(38100700002)(5660300002)(7406005)(83380400001)(8936002)(6506007)(31686004)(6512007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?clc1NDNUakxXM013bFV4eVBPZGl0MkxKdWFhNkg4OURTMk4wVEdmT3ZjeHhW?=
 =?utf-8?B?emd4R3lkeUYrRTFONy9RbS9WQXVKMVpjZ2RaY080UU1Xb1oweGVjVHRtRjRG?=
 =?utf-8?B?UnNSZm9jdkM3QU92TEY3SHBJbXJGQ3M2a3MzNUdJRWxTVEhrRFNoTHJjajQ0?=
 =?utf-8?B?bDgzMW5HZjVvRFZKM3FKdGJSZmlnUW1YYUhiUWlEOWJ5S3BON2Mxdm9NdTZF?=
 =?utf-8?B?UU4zdzMyQi9wRENVSjU3Y3hUT2RYNGc3NnNDVDc0TXlJUFQxWWEvZm95Umpq?=
 =?utf-8?B?dlZLaGNUSGJnc0Z0RmxncHNQUDBMOUEwY2luaGwrcjdVSm9vRFR2Nm00YnhW?=
 =?utf-8?B?YStBZzBuZ2pKVjRXOUhqekgralZrdGlxM3FGclppcklPMlhRMzNkVzgvbWsy?=
 =?utf-8?B?Y0hRUTZmNldJTXQ4VUh5cU15bEFtYWZhMllaV3lxay92cFNVVVltSFkzZjNy?=
 =?utf-8?B?WnJPRVBDdlE2UDVoOEdEeUdrQ2Y1Ym5aekNiZlB6U2xueXRJcTB4ZEM2MC8x?=
 =?utf-8?B?YjJJSFVHZ3JSR0FLZXJKUkpSd0VJUXZoSWxiL2theS9yWkVQaXQ0bk5PTGRw?=
 =?utf-8?B?bU5mZEhhU3JnSnN1d3kzREJNOFp0L0tjV2ZvWm1uNE9iekkvYStOZy9tcU5u?=
 =?utf-8?B?V29mS20zbURGditpU0J6Vlh4cE9VL2x5MlVENXZlYlhNbjFrN3BiVlAvYUNx?=
 =?utf-8?B?YzdHSHU2enJ4eWhuV3prT3VZTmRMbWFPVzBaR0pIa1R0QzloTjhQR1MxSi8v?=
 =?utf-8?B?aytGR0tEWVdkclFabTdzdUpuZnBUbGYrd1BsZ00vM0IxcFd1c0JuOGFST2Zn?=
 =?utf-8?B?dTZPNjRSOHN6cS83N1NlMWJHUmFHVDhLb2R5U285alRyck9ReEdqeXN3ZElh?=
 =?utf-8?B?dTlIdTMyYkg1aFZ2ZEZhSy9aUE4rN3hqVm9RVVMvWjFNWU9BMW5wMytXK3h2?=
 =?utf-8?B?V1I1Vm9YdXo5Q1BqT3ZvREc0RDByVlRWbnQwcDZOMU9Scm9Ubmg1ZXVaTkZ1?=
 =?utf-8?B?dDZqclUvL3F1RkRVTlIzSGFJNEdOMHYzS3lhS0oyQUFTNkFUVnJuNnpPVTJO?=
 =?utf-8?B?RURLUVhxZ2ExdlcreXpCZnJPQjJIWWJPZEpHcVNEUmJxVk1tckY3ci9KTG1s?=
 =?utf-8?B?ZkRvTDVLYStnVlhESHkwMVFDZTJPbFk0MUU1YjRWRnRiNWZaY2F2aFk0R3BL?=
 =?utf-8?B?cGwzV0pEYW4ySTg5c1RoMU1kQ1RYKzBWVkc0UjJhQU4vSlo4QlIyYkt4TWUw?=
 =?utf-8?B?QktqMDBEMnZRUGJ6NGFnci9kcFpMUHNpcnZJdFRkQ2J5dGpWa0hLZklxSDcx?=
 =?utf-8?B?S3lQZVlOdkpCdDB4ZmRIb1ZLWE5RYmdpb1o2RVpma2VpNEp4VlZGTnVYSytR?=
 =?utf-8?B?VnppUS94TU1LQ3p6cy9wUzNHd2pKZllyWmNqT2xzYldCZGVvQy9QRWRzVDJR?=
 =?utf-8?B?dW1pQ0ZLTW1FU2puQUM1QlUyZ3NmZ2g0dTFSMUZ1VytpZWlleXZ5eUFWc3d3?=
 =?utf-8?B?QnJEazVnSWF6QVVUZGNYL1hGUThHc3h0cnlHNmhLelUyUFpZODZ2c05aV0JM?=
 =?utf-8?B?MWhVTDF6b0ZJbDFYc09yb0JWSTlLajdmK0hoZlY4d21acCtwQVp2aXhVVjdK?=
 =?utf-8?B?VGY0TW1XSVdPUXJUQTY4aDBPOVJ2cTc3MVN5ZUk5cTJBU3NPc0hidXN6QWQ5?=
 =?utf-8?B?cVUvU00ydk42b0VsaVBMaTR1VTI1R2hDQXlpYUt2VkNUblhKNHlwVURseEdM?=
 =?utf-8?B?UlNzcWZzeXhnakducUlqZVRrK3dhR3FlRzE3aks3VG9ZSWxSUWdYdEZHR2h4?=
 =?utf-8?B?c3VJM3F2WGtFU2dzYmNhbVlGR3RjMDVadVl5VlJuNDZSWW1xOUxVMWtVOUVZ?=
 =?utf-8?B?dGdmKzBrU1hkSDJYWjRBZEhXOTRnNHcrR3FJdGJ0enFESUJzbDJoUkdhem1Y?=
 =?utf-8?B?bzkxZDl1NGlvRHVVZ3V2T3pqalJFeGsrVzRVQW9PZjVYY0tKYkR0T0M3dnhu?=
 =?utf-8?B?OFNSRnk1dzNIeFdlVmtMMVlTMU11dWRwNTJoODRDM2VSK04rbW5WN2t1TkJE?=
 =?utf-8?B?VytPeXN4Z3BDeUYwTGxmRkk3TmtOSEVZeEhLUEo2bUsxNGcvQ1IwaHBRNWlC?=
 =?utf-8?B?VDl4NWFzeVBVN0hLc1lIUXkwYUhEU3BlZVN2TUNQSm9OamE4bEtDdUJOVDZE?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?a1p3QjNzK0JyNHdqUTdUOWxtL1VvMkVQaXdOSmU5dlZ5dkJwMi9FdVhDMS9y?=
 =?utf-8?B?cUEyV3pweE5IRUZVd1d5UTRMYmt1M1hkajdnU1A3QUtxVFFablVtMVBvQktD?=
 =?utf-8?B?TFpuWXdBeHNsOVFiRk1keU1rTEY0QVpHM245RVRNM2FVUW4ycVRnQjkxaGd4?=
 =?utf-8?B?OW93cVpEc2hiWFFOS0NYVURjMGFmcUhNSS8xVGI0ODMvMjBtc05EYXlkLzRP?=
 =?utf-8?B?UEJZcHkwK25qZm9BUVRzbks4S1A4SzVYRjFiNW9NQ3FFYTlQZDhEOFF4c25i?=
 =?utf-8?B?bzBCZW5tcVFXSDE3Y2ZtNW9jZDI5WTY3RXZheGRXTjRKckxObHBycjdkQytC?=
 =?utf-8?B?V29BNHRoeHVEaUs5eHRuV0traGh4SU5xVkNaMElpNU9RKzNiRTJYV0Z3U2pz?=
 =?utf-8?B?b2xMNzd5ODZGS1ZpaGxHQ2t1bzNzeGRub3JwZmRhdENoRjgwVmpBckVjVWFk?=
 =?utf-8?B?RVhzWUZHQTZ4R2w2TFFHRmVXT3g1THFIZHZ4cmhNcEx0Y3VJM3lOWkxzSXFj?=
 =?utf-8?B?Z2VObVFYaGJOY1RjZTMxVk9sVTVIWTZGSnQyMjNjYTJhdEd5eUFGYWY0UHVP?=
 =?utf-8?B?OUVtV3VjWWRVNVRlTXN4b2w0d3pBcSt0RmUrL2x1dEtSZ3UyeE81dEdnL1lm?=
 =?utf-8?B?QzA1SkdnU0F2MVorZTZ5aHFmSWhhUzl1UmkwY3hNRTJkZURIaWRqekY0U1ZQ?=
 =?utf-8?B?Sk1DVnJraHF6ZDFlR2tHVHY4WGNXK3BoZ1dnL2hiKzFPQlJ5eStqRWZnNnBp?=
 =?utf-8?B?aHR4UTZTdlV4a2pRWFJ2ZzNiTmx5c0tXS2NmallTRG44SU1OeENDZ0diUzlt?=
 =?utf-8?B?V2FiZ1FtcldkcHkwUExhTk54RGVZNTJ1TDFTSXQzTk9NVVRaalVRUVJGVVNa?=
 =?utf-8?B?bDl5ODhXeFpodE50Mjh6NHY0eTlNSE1CYUJyVzZ4VjN1WUNxWk9hcHk1bDFr?=
 =?utf-8?B?Mkx3d2ZnZlcydFZHYXpGSmVCMytXOUFXM28wTys5dXZpVXlxb0VhampwendS?=
 =?utf-8?B?bG4vMUE3dWFBczk0M1RsbUs4Sks2UVZNcWVvOFZHbHcwMzFuNjNmUXVITVlt?=
 =?utf-8?B?eVlQRmwxS2pxN3d0RCswS1RFM0JBWmF2MTU2ckZWNHhlTHdFSlVnS0c5Rkkr?=
 =?utf-8?B?V21jdkNEd1VRcWlOZXJETVNNS2YyUDRYKzExL0hhb2QrbkZCRXlYSVBvYjA4?=
 =?utf-8?B?cm1zZlNxVm9uQStyL291V3JMS0NYQlJwT3JVVFV4NHlFa3lacHRkVStVOGtN?=
 =?utf-8?B?d2hMYXgzTW9WbVFrRkdCS1FDMW9CbTlPVXliODRSRjVsMkZjTEtvRjlTcjcy?=
 =?utf-8?B?MC9lZWJpcGI2a3B1M0J6S2N0S3RXdmZ0dE8rSm43MUVOOEEvdmw5eFJUNE56?=
 =?utf-8?B?bDloKzQzWWE1dUo5N3pJSVpKVVlBSFpHZFZhVDhDMzBsN3VJUjRINjhLTWhH?=
 =?utf-8?B?OFNpK21ZeGp1V1d3cUhCTStJYnBNTDlkSEw3TVV5b0I2Z3Z0UWx6TlpzYXRV?=
 =?utf-8?B?R3YxVGlGei9MejlRTmFHWWFSUFg1cENtaGZxQUJxOG1mSnlYVjN5MWVBTzhu?=
 =?utf-8?B?bXc2QzNZalRiSC9xaGo0dEJ6ZmZnTFNNbUx5RVFpSzBTMllGVHdLRGVFQzds?=
 =?utf-8?B?VC80MjRhWnB3bVZGcGNCTEw5YzFaUGV4dkFhdVFqSmZQZS8rNVJsMFNBTHht?=
 =?utf-8?Q?Ej+slPMkLivu2foWL+0t?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a1b8d5-5221-4a9a-c07b-08dafd455a0f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 13:25:53.4241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nyAYkXHeeYL7aZ3k/rq5oN1scQUlFi1VtnvSxz9KetftkN6mZrXB4x9etsBq1q2Z8VAm8m2qJzbW+ABMS7xqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5687
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_10,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230127
X-Proofpoint-GUID: I7ouWE1ZRdJiHsP0jN5uTGnAjDtxWNoX
X-Proofpoint-ORIG-GUID: I7ouWE1ZRdJiHsP0jN5uTGnAjDtxWNoX
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
> Add an optimization to jevents using the metric code, rewrite metrics
> in terms of each other in order to minimize size and improve
> readability. For example, on Power8
> other_stall_cpi is rewritten from:
> "PM_CMPLU_STALL / PM_RUN_INST_CMPL - PM_CMPLU_STALL_BRU_CRU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_FXU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_VSU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_LSU / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NTCG_FLUSH / PM_RUN_INST_CMPL - PM_CMPLU_STALL_NO_NTF / PM_RUN_INST_CMPL"
> to:
> "stall_cpi - bru_cru_stall_cpi - fxu_stall_cpi - vsu_stall_cpi - lsu_stall_cpi - ntcg_flush_cpi - no_ntf_stall_cpi"
> Which more closely matches the definition on Power9.
> 
> A limitation of the substitutions are that they depend on strict
> equality and the shape of the tree. This means that for "a + b + c"
> then a substitution of "a + b" will succeed while "b + c" will fail
> (the LHS for "+ c" is "a + b" not just "b").
> 
> Separate out the events and metrics in the pmu-events tables saving
> 14.8% in the table size while making it that metrics no longer need to
> iterate over all events and vice versa. These changes remove evsel's
> direct metric support as the pmu_event no longer has a metric to
> populate it. This is a minor issue as the code wasn't working
> properly, metrics for this are rare and can still be properly ran
> using '-M'.
> 
> Add an ability to just build certain models into the jevents generated
> pmu-metrics.c code. This functionality is appropriate for operating
> systems like ChromeOS, that aim to minimize binary size and know all
> the target CPU models.

 From a glance, this does not look like it would work for arm64. As I 
see in the code, we check the model in the arch folder for the test to 
see if built. For arm64, as it uses arch/implementator/model folder org, 
and not just arch/model (like x86)

So on the assumption that it does not work for arm64 (or just any arch 
which uses arch/implementator/model folder org), it would be nice to 
have that feature also. Or maybe also support not just specifying model 
but also implementator.

> 
> v2. Rebase. Modify the code that skips rewriting a metric with the
>      same name with itself, to make the name check case insensitive.
> 


Unfortunately you might need another rebase as this does not apply to 
acme perf/core (if that is what you want), now for me at:

5670ebf54bd2 (HEAD, origin/tmp.perf/core, origin/perf/core, perf/core)
perf cs-etm: Ensure that Coresight timestamps don't go backwards

> Ian Rogers (9):
>    perf jevents metric: Correct Function equality
>    perf jevents metric: Add ability to rewrite metrics in terms of others
>    perf jevents: Rewrite metrics in the same file with each other
>    perf pmu-events: Separate metric out of pmu_event
>    perf stat: Remove evsel metric_name/expr
>    perf jevents: Combine table prefix and suffix writing
>    perf pmu-events: Introduce pmu_metrics_table
>    perf jevents: Generate metrics and events as separate tables
>    perf jevents: Add model list option

Thanks,
John
