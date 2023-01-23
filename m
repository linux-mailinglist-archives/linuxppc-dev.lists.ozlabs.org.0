Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7F67873D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 21:08:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P11PF1vTKz3cgr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:08:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=SOveEFi4;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VbVrFz13;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=SOveEFi4;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VbVrFz13;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0vN25jVxz3bZh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 02:36:33 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30NEhtK1024568;
	Mon, 23 Jan 2023 15:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=XTzIABcnpFkEeLJyE+pEBkdUQriLKPijQod/lMmCog8=;
 b=SOveEFi4+3px7DyvltpafecR/pR7JMPY5CgZ+6b6nShRVYC1gGxNpRJD07eIawaLGl/k
 /DRyQdBedhfQyZb+4YW12AEIllgFuRF1fsSoCRvvtmFrf5NMvpwSeuG5gCFkERIh9kX+
 BnSNrww/aRqBVzf9CkFcUkIfEth5Cw63wUT2vyR85HbGAG6IeADtXws3zpLjvXhPr25X
 0xBTzDbJAZulhzS0uyjPKw9hSX68DLtHnju7hRczC4tEHxDarrI+g6JMSH5N3LNbQRYN
 aeH6c9Uiv8+d6GBx0rjwPOTKLlAl2parhhCx8QEW5L9DDDn5ThGNaAOPYKr9DsRS6/83 Uw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n86n0u3bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 15:36:05 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30NFZxKJ012101;
	Mon, 23 Jan 2023 15:36:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g9xn0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 15:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIhfTZtcNp0ASLNRqgC89+kuC+VAOALV/B5N/pUO7Yb0vpg5CeLOfsGrqcCddXpmhEKr/3gtVr1UXHedUiPuiSzFrb2y725FxNj3fEfEYz80S1yHUNqpZx1oC+sFvJ2kx5IJPWOtyNlTlSgTW5Np6d82HFwo+LdZfTbaVLkVaYl9MlB3V/wya0DG4Z8vdBnCIwZOVUStr5VUnNASHhyf0Jf2FMZ021krGe9Mr5SP2dobjVlz1xd7W0BOywZLunf2FTNiA4yHlHZqufuagbG7bVzgWJPOjnvEvueHCmRku4n4qXdHXCJDlXCdM7Fy+nrl+GlnCWckl0mrKhVKEa+wEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTzIABcnpFkEeLJyE+pEBkdUQriLKPijQod/lMmCog8=;
 b=ZwHsPo+c5vThYjTFaHXLnYadBM9pBukMOALwTSeowjmRCIsUkdXDGbA97vZHTaQOUZNvz0bv0gcUidzoDLSJrrKqsmfSDPqUxF4qWUo1OAbAx8vd4coDhu8bjbSoNQHztr98+njRSVNbsXBkCp/tx7ECahDgmBk8QEVr5Vyb6eTormErU3wrhpLLiQjQCh/M8IuJ5LI1WT4rVsscVgNGeTpKSv4d8h5QrPipbWbSEkibA3oXGLhbyxr/d5gEYyQOpxVhJnYcOexXtB6MSyk3tqqMQ2/wUs01nJy139b0Y4B2Dgtson9GTBw7UbYKkUj4+AccSiNWr9As808cp7ST7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTzIABcnpFkEeLJyE+pEBkdUQriLKPijQod/lMmCog8=;
 b=VbVrFz13KDFo6jXM05lvlelKRklGQnqtUx7Mne6sg+VzV02r/0Z0bIJ9KcRYiI7LxkuUDzo+svno4DzJWOn454Zu7fJO4wDSOrIEdEpYIA9XmRTw180ebmCw3LmF4iPRDHnjLYtkhJAyeq80vXWpgvjkl0qzFKJWcHRx8gDJnU0=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DS7PR10MB4990.namprd10.prod.outlook.com (2603:10b6:5:3a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16; Mon, 23 Jan
 2023 15:35:57 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%8]) with mapi id 15.20.6043.009; Mon, 23 Jan 2023
 15:35:57 +0000
Message-ID: <dd5070a7-254d-4763-439f-a5bfa8240fe1@oracle.com>
Date: Mon, 23 Jan 2023 15:35:52 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 7/9] perf pmu-events: Introduce pmu_metrics_table
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
 <20221221223420.2157113-8-irogers@google.com>
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20221221223420.2157113-8-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P251CA0021.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::26) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DS7PR10MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba1d6ae-782d-4987-075a-08dafd5785d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	b4ailPh/LKl06EK8a9gZTvOxNgCHoneFQvxdS/oxzY3IMR5f56Q47biE+MBS4Q8lm/gwxOVG72AaU2bTkS2yKraecgt0rZS6gHZYY1Rw3/sHtUgwLEeSF76xGxKAjXVlZ7AZrLXB40cNlGe/Axd3XZhPdfLeW8uh4AJ+hfo0ZAakuFsmByWoDJpwDDVyxdTJ6aB8rqi7XzYWCydKtN4Kw9p71xaE2rwFCuNcKrFllimYGfAaQaPV1WgLvmtg4hVofWU3h/TWCRIpMrqf2KKBQ69zq6UAgwhgmgwW7RCMRdoA9H/ILxReFIsQvKL2ccbSccTmrVfyKNqYmzgwi1StJbZ8DqeRzYhU1c3av3MDwpi3Y5vGDexRUugOT8bpx/xLgElyOknzH7jCf62gYZpT37bzFY9gegUwn0bKYBdOzwD+7Kj8Fwcj96NbSiItpATzKtuWyqGvD38P4O0fwiVtGp0mjlU0VUuJarzjOKWxYmOL4a3mVzJr++ONgRjpH+IQpNO691+gxMTM1sPI2Xvtqk2HdxcBHHvVllad2CRL0AbCGDpFZ4mLRER0U1Uk45uo4IlSobaYDvClNVF05jv4Xs22p39usp8cuB72GORSuvzD8GgNXfCNunPKx6QmJLaVmE7iAXkSZQ+TmExUvBgQX9Sdj0vza6vTdcjL2S2AYFqo1HGf9biJpKZdxP9FCrKtul97H6xl1yf1x4coYYdV9Myg2J9UBJ3tKdzoudHgnbuMWoaRj4X1s3vddpEvzS5j
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199015)(2906002)(41300700001)(8936002)(66946007)(66476007)(66556008)(7416002)(5660300002)(7406005)(54906003)(36916002)(316002)(110136005)(6486002)(6666004)(6512007)(6506007)(478600001)(26005)(53546011)(186003)(2616005)(31696002)(83380400001)(36756003)(38100700002)(921005)(8676002)(31686004)(4326008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MUc2VXZyL3dQdEdUaFVtenhnWUpmTHQzQkxDaGNOdjV6NlhUSFJiNldBRkI5?=
 =?utf-8?B?U0VwVXgvcVBvT3BRRTF6NDI4ZERXMExuRk1tZ1B4emJYTGN6U2pORHcwSUFu?=
 =?utf-8?B?WS91RnBxOE9SMHUvMWo1ZzEwbW82bnZpVDdOVlluUERBMGdxellKelo4VlE5?=
 =?utf-8?B?M1JUcXhZRTNhcDR5U0R1eGNTdTVOck1pSlZUeUNEb1B3bHJzRmFUTk9XZ0xv?=
 =?utf-8?B?TE5obFc5ZzErVzlTUWV0Y0dHWXB0SzVSTVRHbjFQcS9nM0VQN0xSL05pOW5Q?=
 =?utf-8?B?cjJBM05pZy9EOG5lYjNVcmsyUlV0TkN0Um1ralgxOXNsblZOSVVab2Jqckgw?=
 =?utf-8?B?Z1VhUDBjYSt4Z0dhK0MvbkxHT0NkVjAzR05kMU9PTHNmck8vRFBCZ3VsaW5D?=
 =?utf-8?B?ek1qL0xOK2sxR1I0YS9pdVJWTzdoQkhNcmJncWwvem1ueGVPbWM0N2kxaEZL?=
 =?utf-8?B?ZFFObW1DMURqNUdWWWlNeWk0SXFYNDAyQms3cWhiNDZhOWp3VFEwb2NNdWpP?=
 =?utf-8?B?aTMrY3Vzd2Nhc3BnU01iS1RqVG9oS3JMU01yS1hGUmlSdkRMN3ZZTzBVSCty?=
 =?utf-8?B?bmlXV0FhbFRkSnUvVmNiY0dFdkZyQktoZG1DY0dvZ3QxYjNPakY3ellZanYv?=
 =?utf-8?B?ZzBGMVphY1g1eGk3TTkzRGlrSWdmQndVZkN1elZqUTRONWtUV0NpMDF2ejIv?=
 =?utf-8?B?TkxIWllQdW12UExpVmlEanptTU1GZi9ld0JHT0tzTWN3aS9lcGVlaktUcXJW?=
 =?utf-8?B?N2NKMjNPQ01Ldm41ZndTdmh5dDlZeU5xSDBnVklvdFVIR1ZmRnFjTytXUmZa?=
 =?utf-8?B?NVRMMVdNWFM1UXNLZTM1SEVOT3RqeWhLbmUxRnBQMkZFSXEvWmx6MTJLNEcr?=
 =?utf-8?B?aVhjQWI5Q2RYWTEyWWNxVUowWHZYakoyLzA1dDQ1Vnc4TXprTmY0VHRERmt6?=
 =?utf-8?B?aGhYWnljUnM3QWQvN1ZRMzl3T256M1lwVDYxMFdySklwZXkrajhSb3VNc2Zr?=
 =?utf-8?B?TDFFTkJGbXNwdmc3VXZhNDF2ek9kZEtTZ3M2MDJZR2pWUXh1SHZPSXlhTVg1?=
 =?utf-8?B?bW5VbnZRNlpZR2NNLzdEQ1hQQmNIeVR2aHBzeU9rQ2pQMVdra0trRUJtRmJq?=
 =?utf-8?B?RkVtSnZhN2VyVlVaRC9BY1hVSEdKczZhSVlwb25HNDkwM2RCTnRKU01EUWFD?=
 =?utf-8?B?dWdmY080MThoOEdiYzhxRUluWmtaZ0FjazlPTk9NVzRMTElmOGZtNGJ2SkFG?=
 =?utf-8?B?Z2lON3A1czR0U3gxdmFrUmU0VkZ6OXhKWU9QWVdxNDJpZGFHOFZYUS8xM1RL?=
 =?utf-8?B?Z1JlTlU3ZEJLNVZXYmR2eVd6ZkN6QlZJZTh2aS9ac1lTVnJwcmNrQ0lkd1h4?=
 =?utf-8?B?VmJxK0U1UkE5c25HMUVYbnlHYTZ4dmpvWTJHa2kwVFlzaFR0ZEVyOThFVm1o?=
 =?utf-8?B?UFFiNFU2YVhiTVhLaEFoNTlUdFQ4YmJ0QzJIdGpNejNTS0lzMjFEZ2lOL1RM?=
 =?utf-8?B?d2lscEM0WGEvM3krYXBrMThZYjBlV0lqNTdDMTZWVWs5SE8yT0dNKzE1S3cv?=
 =?utf-8?B?eVJpTmdsUHlBRmcyWW1SMGtpUVlCTmlmUUFWY2pYVkR6N09GckVuVm9aOW9n?=
 =?utf-8?B?dFdZNFJtdTczdkcvcWhSMzdNQTFaekRpV1VRMDN2aTlSYjBLam1Ud2ZNaUVr?=
 =?utf-8?B?NzJuOFlCa3pqVW5xUU5TNlppb3RGM0VicVloRlg2RGRYZ1lhNHVqaUZxcXVk?=
 =?utf-8?B?b1ZFNHp0c09XMVB1c0F6RS9ZQk0wb0VpQUx5eVB5bWl2TVRaTUFkaDROakI1?=
 =?utf-8?B?eS9GZEk4NWlrd3UvZ0lDNk1FZXZRMjRhWmwrRGUwUVJteDNmY0thY0kzR3Rn?=
 =?utf-8?B?OGxxWFp2cnM1NFAvRGIvUUk0Nm8zeGJkdmEzaUxOVUNCaEx6YjBxZmNRU2Q0?=
 =?utf-8?B?cDhhSWgzMnRkcUhLRFluTzgzbmRTQVJGMWZaUVdDZFh1R2NCZXVsWXJpMjNs?=
 =?utf-8?B?ZjV3NUtrT2ZyejZWb2hGUkl5ZWVWLzBtRERQa1pabjlDRGU1WkJlZ3V4TzRz?=
 =?utf-8?B?NEU5K0ZkV2hSd0NlOUlMbnd5VVoxKytOY0tzbDdWbW43VmNqTWVBNFpzWVNj?=
 =?utf-8?B?b1diMG1QMnhVM28zSnZpTGVTNXhjRUd0UjNRdVFOQTlHbmd6bThNRmlFZlBn?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?K29vNktTd0VrZ3E1WDQ2WTgyUHlseTRaZ2pmK05jR0FKcFNLM2tIaFVHUlZL?=
 =?utf-8?B?ZG9VTTIwend1QTRFZmplcHhqbmcwc3g1dXp3aVNZWEx4RVpMeWhtZHZIZkts?=
 =?utf-8?B?aVFmU3BlTlVIMlpiTUhITkx5RVNMOHZVNm5CQUk5SGRVdnNPcTgvYVpKTFRh?=
 =?utf-8?B?blJ1bnpKWHIvcURxcDVoU1VHOXV3bFVQdzNISmNKcW5lR3R5dXlqVTUwT3BO?=
 =?utf-8?B?T3g2MlIvVW1ZNzlaT3ExazBFMU1MM2NWeDB2M2JRSVFiWFBNckV0amZHRHRs?=
 =?utf-8?B?NGh2UVZmZGxDRk4zbzNHdzRIQmpYNW9LaDdPdzhnYXZQdmU0UDRncmlwZXY1?=
 =?utf-8?B?cUdWYVY0N2I3UmJTUmRaVVdiQzFhcmpTQ0RNblZWREhybm5uY3dWNlhpZHR3?=
 =?utf-8?B?d1VrMkIxTGVDNlJIbVJscnozOGtQY29lNlA2UGVGQjkxMGRHdG1aMnBGVGxi?=
 =?utf-8?B?clVrZVA4ZWFnZ0M5MElNS1RIWEpzQTRNZXNvRy9peGx6TU55OXVyZ1JiL3lQ?=
 =?utf-8?B?VFBUd2RxL3lnMnRKVE5vMHU0MEJ1RWI3dmtGMEZzQkN3OUxOWDVjVWxCVjlF?=
 =?utf-8?B?Z0UxUVVlNjQ0NkUwaHN2aHRYMFMrTjFNS1ZqYkhQeStyL0krTGxhdzU4QUdS?=
 =?utf-8?B?U1dwcW00Vlc3Q2dFMXQ3bFA3MlNXaHpBd0F2SExIVFJwT2tPTjgzdVBQUUZK?=
 =?utf-8?B?L0pLR0xTZlJLODh2UTlYN05TeUhDc3kxVEZKQ1Z6M0htZFcweDVkeXE4TzVl?=
 =?utf-8?B?TGcwWE80aENaOEg4VEdjWlZwNW8rYTQ4T0I5NTkxY1pYd0xYN2U3S096U0Uz?=
 =?utf-8?B?SGMwa1U3eXVrbTNRaDBzbk5rbWJQTzFjNkswbkVBL2xOTnVvbjZ2QlpITlo4?=
 =?utf-8?B?TWZOYll6YmV4UlA0WnJ6QUxRTFkzTVhkalpvNk5ZZnVwTHg3VnhlSHBveXRF?=
 =?utf-8?B?R0NzWUtvMnY1Y1RYSDFlYko5eXU5MmdQRjNKU2FiM2VQUS81S3JTZmpLVVFK?=
 =?utf-8?B?LzZWWFVVZUJrVEJwOWU5ald0RlhxUGQ5VWhHeXNCb1VKUk1hZDVaNndsRTdG?=
 =?utf-8?B?SCtSY0FEc1dKOENSeFZ4M0tJNk93WElqVm1OOTVFd21CMGdjT1E2MnluTHcr?=
 =?utf-8?B?R09QN0hjbHVYWTRTZXhkZnNuOWdaeDNibW4zeTV6VUZrS0NTY1JJaThwTXZ1?=
 =?utf-8?B?RDNNakhVWE03ZGV0MVEvd2hnRnpRRWx0NCtpVnR1b09LbDZXdW42R29JUVVP?=
 =?utf-8?B?aUIwVWswNkt6RkJrdDQ2bDR0ZGI0d0RqUkNSc2RNcWxvaWw3L2pTdXM5TGI2?=
 =?utf-8?B?ZFJLWmVVWDd0VEZrSGgvYkhHRlVMTUxkYkpBK09rVk5jUCtIYU9aTGpNQ2x6?=
 =?utf-8?B?NFM0WVZhL2xobVpaOE9SVFpSQVIwd25jV2prTy9vZjNwR0FYdE5KRklCejFm?=
 =?utf-8?B?cjNTck1jSTZEYmlqSnMwMm1BQXRRWnBhY1RxMXZoNFYvRHdLQ0ZQOFJZMFNR?=
 =?utf-8?B?ZmwvYzE2US84TnljMW15MGZQRlQwczFaK2NBb1Z4c001dHY4a0UzTSszWHVU?=
 =?utf-8?B?Q2lhV2IwbHRnanFkbFNPWFhaR0YzV3lMUjZqQU1Za3VJbHZCK1prZmxCVTl5?=
 =?utf-8?B?eTB6Q3A4dTQ4QUFuYmNEM1htS0FiTzVLRXE5WGVLR3pyZXo0KzR5eGRkQml0?=
 =?utf-8?Q?RH6RT+1dYylytJo4zOk4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba1d6ae-782d-4987-075a-08dafd5785d9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 15:35:57.8577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0fnHMhAb5lnN+cZvaZOicPFMV2KY/3dvxTekR9/XnkrAGvDp918wKqFQDkR25cd37VxsCFzlUI2kyLHVPXGTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_11,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230149
X-Proofpoint-GUID: Toiu-1G6VGE33IftKy5hb-Rd4vCwGMnl
X-Proofpoint-ORIG-GUID: Toiu-1G6VGE33IftKy5hb-Rd4vCwGMnl
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
> Add a metrics table that is just a cast from pmu_events_table. This
> changes the APIs so that event and metric usage of the underlying
> table is different. Later changes will separate the tables.
> 
> This introduction fixes a NO_JEVENTS=1 regression on:
>   68: Parse and process metrics                                       : Ok
>   70: Event expansion for cgroups                                     : Ok
> caused by the necessary test metrics not being found.
> 

I have just checked some of this code so far...

> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/perf/arch/arm64/util/pmu.c         | 23 ++++++++++-
>   tools/perf/pmu-events/empty-pmu-events.c | 52 ++++++++++++++++++++----
>   tools/perf/pmu-events/jevents.py         | 24 ++++++++---
>   tools/perf/pmu-events/pmu-events.h       | 10 +++--
>   tools/perf/tests/expand-cgroup.c         |  4 +-
>   tools/perf/tests/parse-metric.c          |  4 +-
>   tools/perf/tests/pmu-events.c            |  5 ++-
>   tools/perf/util/metricgroup.c            | 50 +++++++++++------------
>   tools/perf/util/metricgroup.h            |  2 +-
>   tools/perf/util/pmu.c                    |  9 +++-
>   tools/perf/util/pmu.h                    |  1 +
>   11 files changed, 133 insertions(+), 51 deletions(-)
> 
> diff --git a/tools/perf/arch/arm64/util/pmu.c b/tools/perf/arch/arm64/util/pmu.c
> index 477e513972a4..f8ae479a06db 100644
> --- a/tools/perf/arch/arm64/util/pmu.c
> +++ b/tools/perf/arch/arm64/util/pmu.c
> @@ -19,7 +19,28 @@ const struct pmu_events_table *pmu_events_table__find(void)
>   		if (pmu->cpus->nr != cpu__max_cpu().cpu)
>   			return NULL;
>   
> -		return perf_pmu__find_table(pmu);
> +		return perf_pmu__find_events_table(pmu);
> +	}
> +
> +	return NULL;
> +}
> +
> +const struct pmu_metrics_table *pmu_metrics_table__find(void)
> +{
> +	struct perf_pmu *pmu = NULL;
> +
> +	while ((pmu = perf_pmu__scan(pmu))) {
> +		if (!is_pmu_core(pmu->name))
> +			continue;
> +
> +		/*
> +		 * The cpumap should cover all CPUs. Otherwise, some CPUs may
> +		 * not support some events or have different event IDs.
> +		 */
> +		if (pmu->cpus->nr != cpu__max_cpu().cpu)
> +			return NULL;
> +
> +		return perf_pmu__find_metrics_table(pmu);

I think that this code will be conflicting with the recent arm64 metric 
support. And now it seems even more scope for factoring out code.

>   	}
>   
>   	return NULL;
> diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
> index 5572a4d1eddb..d50f60a571dd 100644
> --- a/tools/perf/pmu-events/empty-pmu-events.c
> +++ b/tools/perf/pmu-events/empty-pmu-events.c
> @@ -278,14 +278,12 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table, pmu_ev
>   	return 0;
>   }
>   
> -int pmu_events_table_for_each_metric(const struct pmu_events_table *etable, pmu_metric_iter_fn fn,
> -				     void *data)
> +int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *table, pmu_metric_iter_fn fn,
> +				      void *data)
>   {
> -	struct pmu_metrics_table *table = (struct pmu_metrics_table *)etable;
> -
>   	for (const struct pmu_metric *pm = &table->entries[0]

nit on coding style: do we normally declare local variables like this? 
It condenses the code but makes a bit less readable, IMHO

> ; pm->metric_group || pm->metric_name;
>   	     pm++) {
> -		int ret = fn(pm, etable, data);
> +		int ret = fn(pm, table, data);
>   
>   		if (ret)
>   			return ret;
> @@ -293,7 +291,7 @@ int pmu_events_table_for_each_metric(const struct pmu_events_table *etable, pmu_
>   	return 0;
>   }
>   
> -const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
> +const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
>   {
>   	const struct pmu_events_table *table = NULL;
>   	char *cpuid = perf_pmu__getcpuid(pmu);
> @@ -321,6 +319,34 @@ const struct pmu_events_table *perf_pmu__find_table(struct perf_pmu *pmu)
>   	return table;
>   }
>   
> +const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
> +{
> +	const struct pmu_metrics_table *table = NULL;
> +	char *cpuid = perf_pmu__getcpuid(pmu);
> +	int i;
> +
> +	/* on some platforms which uses cpus map, cpuid can be NULL for
> +	 * PMUs other than CORE PMUs.
> +	 */
> +	if (!cpuid)
> +		return NULL;
> +
> +	i = 0;
> +	for (;;) {
> +		const struct pmu_events_map *map = &pmu_events_map[i++];

To me, this is all strange code. Again this is a comment on the current 
code: Consider pmu_for_each_sys_event() as an example, we have a while 
loop for each member of pmu_sys_event_tables[]. But pmu_sys_event_tables 
is hardcoded for a single member, so why loop? It seems the same for all 
these "for each" helper in the "empty" events c file.

> +
> +		if (!map->cpuid)
> +			break;
> +
> +		if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
> +			table = &map->metric_table;
> +			break;
> +		}
> +	}
> +	free(cpuid);
> +	return table;
> +}
> +
>   const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
>   {
>   	for (const struct pmu_events_map *tables = &pmu_events_map[0];
> @@ -332,6 +358,17 @@ const struct pmu_events_table *find_core_events_table(const char *arch, const ch
>   	return NULL;
>   }
>   
> +const struct pmu_metrics_table *find_core_metrics_table(const char *arch, const char *cpuid)
> +{
> +	for (const struct pmu_events_map *tables = &pmu_events_map[0];
> +	     tables->arch;
> +	     tables++) {

combine with previous line?

> +		if (!strcmp(tables->arch, arch) && !strcmp_cpuid_str(tables->cpuid, cpuid))
> +			return &tables->metric_table;
> +	}
> +	return NULL;
> +}
> +
>   int pmu_for_each_core_event(pmu_event_iter_fn fn, void *data)
>   {
>   	for (const struct pmu_events_map *tables = &pmu_events_map[0];
> @@ -350,8 +387,7 @@ int pmu_for_each_core_metric(pmu_metric_iter_fn fn, void *data)
>   	for (const struct pmu_events_map *tables = &pmu_events_map[0];
>   	     tables->arch;
>   	     tables++) {
> -		int ret = pmu_events_table_for_each_metric(
> -			(const struct pmu_events_table *)&tables->metric_table, fn, data);
> +		int ret = pmu_metrics_table_for_each_metric(&tables->metric_table, fn, data);
>   
>   		if (ret)
>   			return ret;
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
> index 7b9714b25d0a..be2cf8a8779c 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -609,17 +609,19 @@ int pmu_events_table_for_each_event(const struct pmu_events_table *table,
>           return 0;
>   }
>   
> -int pmu_events_table_for_each_metric(const struct pmu_events_table *table,
> +int pmu_metrics_table_for_each_metric(const struct pmu_metrics_table *mtable,
>                                        pmu_metric_iter_fn fn,
>                                        void *data)
>   {
> +        struct pmu_events_table *table = (struct pmu_events_table *)mtable;

As I may have hinted before, can we avoid casts like this, even if 
transient?

> +
>           for (size_t i = 0; i < table->length; i++) {
>                   struct pmu_metric pm;
>                   int ret;
>   
>                   decompress_metric(table->entries[i].offset, &pm);
>                   if (pm.metric_name) {
> -                        ret = fn(&pm, table, data);
> +                        ret = fn(&pm, mtable, data);
>                           if (ret)
>                                   return ret;
>                   }



