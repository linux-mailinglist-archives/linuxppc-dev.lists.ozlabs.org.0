Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A3067B786
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 17:57:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P294V6hmGz3fB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 03:57:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=rF5RgeLG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=G7JvGS1s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=rF5RgeLG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=G7JvGS1s;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P293X4kfkz2xrW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 03:56:38 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PFNm6L019573;
	Wed, 25 Jan 2023 16:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=IEhUBcJ8Hdb2OacxeuhP9WbVQ8Ubd0F8cmbUQNAzAV0=;
 b=rF5RgeLGSX0rYVQWl1ZCiZPD1GWvovbpE66BBC6KiMbWFQ2lm9vw5i9gxdwzN8FrfVDt
 WUSkE0ThJq/W1F20/XySwJ5QE+Iw6aYjFwJwZohnpQkG1VVOzS045+gknIRbFWb/6avj
 Hyn95HA93LR+ge3WKZoJ/5Kd3XUuD5HZgCAdwxbPc1MI2As4E66b+J9UqzoJz+f9p23t
 Ia1+KCwCH9CtGXeosPtEFmqVJGZ+Rr6ynG/lp2869byCytUWScPL1w9kfvCEcRDlrETw
 8T8AMplAcjY9JGUw6p3K8uLOkYoMuEBEby5A/TGQvwc6rC4liulY8tN+GAVfUb0fzhcK vw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n87nt8g63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 16:56:03 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30PGHI1X034185;
	Wed, 25 Jan 2023 16:56:02 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g6t8cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 16:56:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XN1iWNB7tIlXfKwieaFsRc2McJXIsgFMjarB1htsmneJD69yb4hNQ2XD/Z6DXVEIUaP0Ld2fU0+6RYGZR3XsW3yExVToVr9ONZjOTX9bzMS9EwM/JWap/iQ5IMopCBeSn7IOrFmOlSDnUltIsa3zLtOIsc+Qr5oFVz06PADF52RRarF93QC5Xu0NR1S56jfscXWEJxuEA3Z9iYzhfh4wLcj/upwoSbg1fzbOPB+8B7QN4pHyhY/KouB84hri6VlBR2zisCr7WWNY5ReC5zr/XWqYkyfn61eiN/XfUxlblfpXSD0i4uAS319JTYA/r/NjnyBLfqLsigShYy2pvbFZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEhUBcJ8Hdb2OacxeuhP9WbVQ8Ubd0F8cmbUQNAzAV0=;
 b=nAuQLnQve8QRTn9XDMX/XODVrzq2SpXSKDaZr1TGUmBzmm7+OMUMQn+tp81O8rUTaZ5hm1fkpK54pKzLVmgYM+VHqdSo5QqnyQ8p5kT33NHGYXrWDJj2XasIsBHvUYLxHzO2QdcFJlu0ChrraR6iIoPQmoe4cv35OT/xRfHBUNrMSqM1k3kH235g3GGzV/SWUZVLM+ZCQFd2tPrhIol2eB6DSiqvgVsYQWaJ882eGqcex0w5gzxBmk0HjKG2W+ffPrbKATsU37VlNWWP+HeSAySFVFbK3D+hc5NrGhVRFLUXkceAkGhzbthrpeLoYs+X9Vgwwru3LByTrGzgu7qrPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEhUBcJ8Hdb2OacxeuhP9WbVQ8Ubd0F8cmbUQNAzAV0=;
 b=G7JvGS1sWfG82kYa4eFTWJFHlCkjT4pw27fOoP06q01SMAb2BLR506j83PiWWTMh0QPKSgt2BsV3Wa1ozc1Cb0rTyws33GWS1KgXrnRssN/KFvzpZv9jOBOWnNbusVsEP+7hPq+56aF1ppEJyb9e0v6L0j63nqanAl0ZVpZv7+0=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by BL3PR10MB6138.namprd10.prod.outlook.com (2603:10b6:208:3b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20; Wed, 25 Jan
 2023 16:56:00 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%8]) with mapi id 15.20.6043.009; Wed, 25 Jan 2023
 16:56:00 +0000
Message-ID: <560cac2d-ab47-9846-e641-503060b4596c@oracle.com>
Date: Wed, 25 Jan 2023 16:55:52 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 06/11] perf pmu-events: Remove now unused event and
 metric variables
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
 <20230124063320.668917-7-irogers@google.com>
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230124063320.668917-7-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::33) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|BL3PR10MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c51e42c-e245-4781-a2b8-08dafef5090c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tae0kNXS+liWrXzXIHCdH0Gy4PEpEEsoIZbKrSOqBNPE5hVUbGmi37uYKJkfwFYvKc3tvJC1VpBhTUre8gDfjUF9qcLKeSAnk9U2yAIZe77hVwX/A5HeW8mHoio1B1TdFLi0btpaaUb6PAn+xAsusvCB2hlEjAxSmH8t8FYavfSMFm+tvIN2G6lpD7Vepctvc6kqiDcFwWYuEI5+0GWLiBlSBwspLcJxhLAssWE9FvWsgIjcdsZ30swV620UUqVR1Izl4sY5wpF/H/6KyJ0BHDeDu0QI/INOVjj/l3yL1l8rdc35bPl/G2bDZlAt552tgyQoyfzVG+j8+2NOeAjCKVYBZAHz5dMyxZavG6xD5Jf5aky/4MZsA8rlU3pArrOfcFj1jC/ScOleNRFuFDo0jWTlzIEr0mTGX6egC4V5QP1fW+E1sTmpRRllfp9zmF6rrTEUdAV75jCRiz+8pKTyh5uV3qkzvkWsKuU+KxoGg1anrHDX3Ls7AYjIm3weZ5IVjdpAwb6sJQPhx5N1jJ6HPIAWxKAv+JjICGBNL10LwsUho92LLedCBBkY/tS97ZGrmFBU0Pykd/39d/irV7g+5BWYfhFwrTypBTC1YRzcDeJVKhpe+sPaW3sWjtk+EvHvvmOXYK0AD6t8UgiVRnMp/0TZrtsaADOpgCh6bVY8gfXwSYeyGijFkF8hYcJaLpMbZFR9+lkPT7FkMlT9iKVadTNqZJjm5kEBj10BQmbKbBo0ILsv/HQkHaVVlvKeOxhk
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199018)(31696002)(31686004)(6506007)(53546011)(86362001)(186003)(26005)(36916002)(6512007)(54906003)(110136005)(316002)(66946007)(8676002)(4326008)(66556008)(66476007)(2616005)(2906002)(921005)(41300700001)(36756003)(6486002)(478600001)(6666004)(8936002)(5660300002)(7416002)(7406005)(4744005)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MnUwbHZ2ZDRYSzJ6Wkl5WkNTNWxyc2Z3azZRVDJ5YXRlWWVjd2lhcTZJQ0dt?=
 =?utf-8?B?Z1NxT09jMEFpTDVhdk1aTGtLME95ZlRGZFg5RXJ3WXJieW9pT1REdVJCLzI3?=
 =?utf-8?B?TFprUHBTQVA2NjNxT3dvMk45N0RyaXhnV3dRNWRaRXpSUkozRS9kTjFMS1Yv?=
 =?utf-8?B?MXpxc0d2QmtaendSeDRxNkc1TFFFTVFSUmdCSjFDZFBXZDI0YXMzTEVIN3ky?=
 =?utf-8?B?MnN0NXphaFZuQkJPT3ZLdkhjekV6ZXZSRWxqbGYrLzZ4RU9iQzlYcndGNjFO?=
 =?utf-8?B?VmtEN2JLY3l5dXpVL3hOKzJnVkxPa2ROZXNBQXI1UXA2ellZUlRDNWJzditE?=
 =?utf-8?B?VnI1a2RMV3BVbW5xRFhOUS83OGJ1RStPaWdrdXdVRkV4bkNQam9DanFxRTdx?=
 =?utf-8?B?blc5RXlvZTZmS2RTNlVBbmNVSlNQV1ZQWkFWcjl6S3BJWUpJb3kxNkJxcUxt?=
 =?utf-8?B?MHh6U1NpdnlYNzlIaWpBemNaZXpZUWg2RzlzRlkzZm9kc1JXTDgzRkFuNTBn?=
 =?utf-8?B?cDV3Q2hLTmI5aTduM0FvVTErcmZSOEVOUWgrbkVWS3pHbk5wckF5a0hOQUNj?=
 =?utf-8?B?TFlQc2N4TEljRG0xWkxuUFFmaVRNLzdXOTI3d09OYU9wcnJwc0p6bDdpNlBD?=
 =?utf-8?B?d2VuVEF0VmdmZmNXT3dzRk1FcUZlbHFXcGl3alltY1pzcktrb3lnaUVQRVZC?=
 =?utf-8?B?WEs3TDlsYTQ3TXpWQjRpN3EyMnJvT09TeGZJTy8yRDB2ZW1qWWtxdlNqenZK?=
 =?utf-8?B?YXVkek9SMVUrem83SFNQVHdaMTFtNkR3YzF1V3hZUVJPdVc2M0MxVVdvVlM2?=
 =?utf-8?B?R0o0bWk0cFVrWGx4ZzMzMUdZRlhZOExLcEVpZjNlSG1zWTV5Y1BTMEJDbHpp?=
 =?utf-8?B?UXBpZE9Bay9MREIveXZNSjJOdkdGZngwVWlRYTJGWjFRTlhrMUNKQ0tDU3Z2?=
 =?utf-8?B?a3pwNGY0TzJiWDBLV3Y1OEdCL0dldGxYWG5MOUMwK2xVcUhsbHJWWjlpQ0ln?=
 =?utf-8?B?MDJUdzhWa0VKaUdnZmwwNU1YV2dnWGhFWEhtak1nL1IvZ25YNHZXdnZQSTRJ?=
 =?utf-8?B?eHJ2dVJSUWpNWjl6VmhyZEJ5ZWZ5Mnd5NzJHdEFuT0plenUvczlFaW1tNWpv?=
 =?utf-8?B?dU1xbzBhT2pNTlM1aUxMdSs0dWxrL0daVWVPNElzZGY5YUpGK2RUUStGY3c1?=
 =?utf-8?B?T1RHZmVxcFhxMHV3dlhNeEZyekg1Z2RwbGV3a3A3ekdRVkJsMTRLQU1ZcHRT?=
 =?utf-8?B?NzlYR2pmcC8zcUt6WU12TVB6Sm4zbjVDSUlJU1pROEhjdEc2ZGpGblFXVmVK?=
 =?utf-8?B?ODBJVHpSNmkxUTZYR043QXU3Wm91bFQvaG1FRFpNY1JTNEJMeXRuSGdPckhl?=
 =?utf-8?B?U0RITmRWd3MzMytPcU5uRTlSN3hVY0dZR0ZJVjF6ODczZnZUYmY3enRIQzRH?=
 =?utf-8?B?bGNBbFgwNmRSeGM1QUp5Z2tRZGE3UHRKNFc2VklKRmd1NzMycnJvcWJOYzNu?=
 =?utf-8?B?bHI3TlAreHoxUXlsS2o0SjBMOHZHZE1PME96bHpiOVQwTzhEdDl1MUp1aTlm?=
 =?utf-8?B?MzBRK2h0RTF1amFKZWNpQzZLK25ubG1obDh6Qi9NaHV1b3ltVUdISWJPcCtY?=
 =?utf-8?B?N1d3dnlGWnNRWERUbXNBL2NXSGcxclZCK0JjRmdlUzF1NVFkUVFJZmtkZkRK?=
 =?utf-8?B?MlJqaTBENGZyVVdoVE9FK3hSRjVhOXVNbDcrRG0xelh3eUlxSUxrd0U4VHg4?=
 =?utf-8?B?Q1NlMVVXR2hCZURvSVJjcks4TlU1eGxuQjJOVmt2WVg4RXZpYmNXbFUzcFlB?=
 =?utf-8?B?MUFlZzFYVC84NzhxbTFZWmZqNGdURHFsd2ZDaURkOFFjRlVhd0xCTmxFa2lX?=
 =?utf-8?B?U3dSdmRCRWFoSlkwWkpzdjZweFBZL3Y5eWRCeFcrMXAwRENDdHArZlJFMVJS?=
 =?utf-8?B?NVRCMzZScnVHenRLakJpOWZ3UkFHbjNTaS9MS2tuazRNM2VTcjVWSGlaMGlM?=
 =?utf-8?B?dzNJcFNSckdiTmRDdjVUZmZKeFVJSk04VS90cHZFRzI4T0c3aVBOTkZkR3N3?=
 =?utf-8?B?RWdETWlSZXI4ekl3SndENWwvK1kyZjJCcDllOXdZdExJeUU4ZkhwdFcwSlZv?=
 =?utf-8?B?ZGkzUVZkM1kvcDFYRE1uYjQxWlg3aUxIQmxSdktiYXJCdk5rbUtlRXdMZnZV?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?NFVQZ3FWeXdtOUpFa2dFUlo5NXVjODJWNFY2ek13ckp0N3JPTnY5djc5RU1Y?=
 =?utf-8?B?R0w2TlZZWWVZeUdOcTNVTWljYVVkeitmYlArOWhZeGd2ZzFKVFNldHpRVm5U?=
 =?utf-8?B?TS9EaFR1OGtNeVJpMDk1NUdqeS9XbWFXMDdaelUvS1JsWjNtTXMrSVF5N0Ix?=
 =?utf-8?B?SEpkR1RqanFVQ2E0QmdIU2FNMGhPbWZiLyszSnlrNHB4YVliUFFDeFg1TklP?=
 =?utf-8?B?a1ZGeitRUDJwV3p4NTdPV0VnelJOT1VXL3lHTm1ZV2N1Q2tmcFhXY093SEtM?=
 =?utf-8?B?L3kzVWRqdGRaQmRGbUt1bi9KVDZqdzlES0xFK0xvL2kxVFdFck9FZWlGWTQ2?=
 =?utf-8?B?aTMvaVdEazVRZG8zT3Avb0hEL3FwY0Jsd3Jadko1em5zS1QzOTZydUEyamI1?=
 =?utf-8?B?Vk4rZU8zOFJRYVlndXNzTHNZNGx0dFVRRndIdHFxM1RlVGRrOFNqcUdwbkQ5?=
 =?utf-8?B?QXlWckhBZ0RVSXVRaktrdFBHQzh5WlF6bVZTSDhBR0JLYUdVM2s3M0NDSUxl?=
 =?utf-8?B?V1czcjRwTFhjbHk4OXdmWjNXQU0rWTNaa0l6My9kdlg1ZjZ1a2pNSXNQcFV1?=
 =?utf-8?B?Q0dXU0puenpqTEZEUXZmWVdMQU5qRFBTbDFXTHNpdXByVHc0bkhWSUkxZW9Z?=
 =?utf-8?B?QnRpdFprUUZ1UlhEMjR3VVBad3FlL3dYWlF4Z2QwYjdCVHBGSWZib2V3MGsx?=
 =?utf-8?B?Nm16ZUlQeHhMdGorUkNtczZiRVVEU1dheEhISFlUWVU1Q3NlbzZ2Zm5pNGhk?=
 =?utf-8?B?REVneFZnUnhiZzArV2hSd3UvdDczUVJMdlkxbVRVNldwakUyOXFjV0k3ZzBu?=
 =?utf-8?B?OG1MbW1CSmxsUTR2NnV5TWpwTWZhS1hONittUnJoSE9OTHFnNTlWS2Z2T3NO?=
 =?utf-8?B?TVBLaW9MRWMyaDVFeTRoSGFHRjlXcjNRNU9EK3JPZktwSmsyZ2p6QVNEaUF4?=
 =?utf-8?B?N25ZNFZPZDRVSzlDditpckJOSWpaNW9FQTJjMkdpTWFad2dhUHozU24rbk53?=
 =?utf-8?B?WDdERGN3Yy8rYWxiTTNLRllTcnZYajR3MFpLY1dFbVFhY01aN0tDSk1iV0xu?=
 =?utf-8?B?V3lLOG9QU0l2TkF0OG9mQ2cvbitYU09aNTZFMWR5QnIxbHV6YWMvNU1NRWs0?=
 =?utf-8?B?TlIrL0xuRUNCMUQ1SHlCR3hua2Z6a1c5M2ZOMXlsWDk4VUg0MmZva051OC9m?=
 =?utf-8?B?VFh2eFhIdTZDeUJQNHM1RlNmL1RrclRzN1F1dkNMcVJMaGs0cDMxOWdTeWx3?=
 =?utf-8?B?Y05LZ2pCOWdmeWZwNzA1Z1EwZ1ZsVEN4YmFpRGxPZ1B1cjNjelJrRG5kVjhD?=
 =?utf-8?B?Qkpkd2ZWcGREbUtzcnVDbmFEeWI1Z1hBYjRualc1RkxFMGFjUVdNK2ZneXNM?=
 =?utf-8?B?YjdveGZkYlAvZE5GanphOUtZcVdmM1lRSW5tc3NjcTloZDZmZlU4N1pQaHRI?=
 =?utf-8?B?ZlFMQlhTdWIyQWZnOWhjb2Z5Q1FVTjlNc3d2cml6SEgrQmJRSkxPcm1UL2ph?=
 =?utf-8?B?UmgrTGV4ZG02Q0ZRODRsL0paUlRHSkpLb0RKcWJNd0dtZEhZQjY5blZzRnJM?=
 =?utf-8?B?S0Z5WlhlcmlySWVTYWlOYWhWMkZteFRDazZjL2w2cnJ6NnQ1cHJaWnVuOEwy?=
 =?utf-8?B?YVFuR2pjSmlIdXhQL3BsVlh5TGxHOW84OURoQzNPaER4WnlsdklZN2FUNmsx?=
 =?utf-8?Q?kbk12emFUUrW+L3CVRyc?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c51e42c-e245-4781-a2b8-08dafef5090c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 16:56:00.1594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSAupMYZl5l45DbAFzyXJvzet/hIjV8j1d5eAkKswlsKBbkZXYFgNxoVQImxpPFd19dDrrut3DXg7E3C5WuzzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6138
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_11,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250151
X-Proofpoint-ORIG-GUID: XKzyLQFfdjNi7ya18NweW0HQfCDYs-VA
X-Proofpoint-GUID: XKzyLQFfdjNi7ya18NweW0HQfCDYs-VA
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
> Previous changes separated the uses of pmu_event and pmu_metric,
> however, both structures contained all the variables of event and
> metric. This change removes the event variables from metric and the
> metric variables from event.
> 
> Note, this change removes the setting of evsel's metric_name/expr as
> these fields are no longer part of struct pmu_event. The metric
> remains but is no longer implicitly requested when the event is. This
> impacts a few Intel uncore events, however, as the ScaleUnit is shared
> by the event and the metric this utility is questionable. Also the
> MetricNames look broken (contain spaces) in some cases and when trying
> to use the functionality with '-e' the metrics fail but regular
> metrics with '-M' work. For example, on SkylakeX '-M' works:


Reviewed-by: John Garry <john.g.garry@oracle.com>
