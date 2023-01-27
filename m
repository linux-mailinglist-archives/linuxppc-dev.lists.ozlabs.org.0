Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2767E676
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 14:20:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3J8w3Vmkz3fDf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 00:20:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=TLE3gHzL;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FEgH+/zr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=TLE3gHzL;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FEgH+/zr;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3J7y4tcsz3fJS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 00:19:25 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30R9TTEX021008;
	Fri, 27 Jan 2023 13:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=2wfOaHtdnWOuR0ApiR1VFNOZjs36Mk/0GjH/YdOz6/0=;
 b=TLE3gHzLitpJIpNmoPfyR2o46CjvcFxD7JZ/hq2NRnDsUnKx6xJQMEZ6sEZ5KZjs95Yp
 bTrGdPq4BHuT6X1Xg7cJYJvz1394e3fgi82rcsjiv3NL58aRk36PGEMFDWDQDZ3YCg5H
 MnF+myXkFPcKqg//ELfFpDxuvvNoFAXLYr/ixTui7deprw0R5obtRj1Qfl9L40O+BFgV
 Zpxt94iyT1cb4HWR1nAHJXeCf7h3MCHuz0fiq1srGChRpk+tGBCo/CgvW2kz5u97wZKh
 +HLGdr3QPq6mZEa4ABdsAInprjMqaA5BHdwDEAKzWLLjyA4codkG7g1Rd26aGXHdDMiS 3g== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n87xacpmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 13:18:55 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30RBXkmG024239;
	Fri, 27 Jan 2023 13:18:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n86gfjfs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 13:18:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVaRgnCJlGIMVNyooFgQbhAnToShTaRlpSVfMFwhDC7GCpBWfxc/euO4e2BgqXo4DfUFa4lCGluKKTH/0HRUtW0abqD0687unzVu6TDrbu2o+Dj6+GcoGIj4XLV4o872ZOjQ6/mo4Bohi4Zu/hx77a8Eh6EK4JEqbop/dXzi5dU2ajJq6ZfYUFet4bxQuiqm4f3/ktj1WGAjAOlzv2Y0ou5UCbVvWia91A2Rmdpjo4ePD8wZX9o/jr1GYnF+MjWWKLBg3apAArZuOeoqZQZIxxleOncoFXJH2IX+gfJzYWu1OGGcWlooVkM20+RgQvZJu8TspTfQf34fCjXYo2lS1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wfOaHtdnWOuR0ApiR1VFNOZjs36Mk/0GjH/YdOz6/0=;
 b=B9VbWKGO/p0mUI5OFr+5famB/D2ZhuhFlOFV44RcoG+nIoleHNyN17IZM1cp/R04MEB3/3SP4BzwBWfI7X1XOzwX4mFAwHVMYHwBmIp2tvvo9bILr89/ycq0MGfTlHKpoOcQH42KmVfMPCNfpx0ahfj9NK1jistmfXslEqGaspDG7W6XoktJs9AwiKe4uYGFDyvcClU/gSSlS539HfcnvZYq6VZoNviqvdV9c6R3l8mU6YoJAObZXCULEATYDInygo202iKkcbdXhoBjTPaGOve39x/ICpFJr8Vs3siqSXxR+Pgn1U3hISGUcorhp+H/yDURP1KFOo2nF9gDfxPpcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wfOaHtdnWOuR0ApiR1VFNOZjs36Mk/0GjH/YdOz6/0=;
 b=FEgH+/zrmL1dHf8CIRTNACJNuG6vauENb5lLYfr4mu6i/P2uoTD3A5j4qTZh8wxFNHRXJ4bDTzToiPtE2OVnsTVuU4nzBCJsJUSVfsjcPbBDsyhs/G4YKfRbUlYMsWA8fYpdU26plePxlzDDyhyY4ZU/xFwxM6AHfreON3S65T0=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by PH7PR10MB5724.namprd10.prod.outlook.com (2603:10b6:510:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 13:18:50 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb%6]) with mapi id 15.20.6064.010; Fri, 27 Jan 2023
 13:18:50 +0000
Message-ID: <0fe85fad-f9a3-3295-865a-7d8872276bcb@oracle.com>
Date: Fri, 27 Jan 2023 13:18:32 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 12/15] perf pmu-events: Fix testing with
 JEVENTS_ARCH=all
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
References: <20230126233645.200509-1-irogers@google.com>
 <20230126233645.200509-13-irogers@google.com>
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230126233645.200509-13-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0079.apcprd02.prod.outlook.com
 (2603:1096:4:90::19) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|PH7PR10MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: bddacd53-9f2a-459b-31cb-08db00690797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	sVbsTMZR+oC4ROKjk3FPzLvHJB/aI67ZjiC0sk2FiGop79a3Gl9jUN0LUjgyP/hC9Da5VgxzlUu5stBB3qcM3tf2YoTZ6mzVONgUa3jp9eX8L/s1ztXFhlc4mDbqDTqzge3Hv7XqMApqjafcmVnh2Zo60hpbFovHNVnHoiWl3MYy0eFU4tLm+Q4JjKeFFax3fUrbx+RIUfhOvPRDvCckHxDTZ7ZocBRC0dNuxALQRd35HvyHC4W1sVEUWxcKv4NaxxoXsZypsGZUo13YjjSTJ7MK8wqlmXVNri7yPtVbO14si7seMDDsFyT9KgEtOdf2rRC869mRirH4/sj6dOroZIaPJNLvACacnF/S8wVKJFu78JzCqjIeQL7SdlP1lhJGsZ1JOSD9iQs5ePjOOl5P9dP1JUi6bNUSHo/M49EwsS/MVisiS4i9zpYjioWUMW0Szyo5pcxcSV/P8/dCbqyDeVH2Sb5YDngfPds4/tnbR/ErsTnJ+3dzwwVQI5fK7VyRNSAEW/BZW30SPZk+PqeL+2vWyOM2oKrHq4l0pibg0DsBbhD1aQsg9/Rd52RX3+hThhLLPDPHuAZmhCB5WpC0fHmMArOOkp7QB+OWU+96EaC5T01J8Wi5Q9Tog54isOZaGQUfoBMVzkad28FZrp73HrbpTSv7TfjhjvZD1gBXIDuVFK8IrQ3KtipGJgREIP0nosxXiIYTCwz35ZIxHHIikiyUVXrRGvDb75qr4SiJiv1aqvajgYMhzAHCfZiNeH8u
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199018)(2906002)(8936002)(7416002)(5660300002)(7406005)(41300700001)(4744005)(4326008)(8676002)(316002)(6666004)(54906003)(110136005)(6506007)(36916002)(6486002)(478600001)(31686004)(31696002)(83380400001)(53546011)(6512007)(2616005)(186003)(26005)(66946007)(66476007)(66556008)(86362001)(38100700002)(36756003)(921005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?YUtEbzdYNk9WdmdlQ05LczZnYVo2ckx5bDJEME5HeU92NDJKWjViRmN4a1p4?=
 =?utf-8?B?dEw5a1JvTkYxc2ZzMUVQQkY2R0w4WDMwNEFNTTVjSTNSVzhnaElNZGs0MElR?=
 =?utf-8?B?SnE2ZkhEdkg3VmhlMG5lbGp1SDM0RVFvTVdxTC81LzdZYkk4U1pIK3hIZFlk?=
 =?utf-8?B?TWkyUWVRejI1Q1JyRDZKRlFiUGRRVTlSeVMzaUdtTGkyaU9EaGJVZll6Uy9P?=
 =?utf-8?B?SXo2UVk2dWlpY29ybTA5WEI5dlhxVGIyR1RQU0pyVGM5SUIyNVpJV0lBN1c0?=
 =?utf-8?B?aStBMm8vVWRqUktzbDM5dkt6THNjdm1rQ0R4MGJHZWRGWTlDODZPSytKUE9o?=
 =?utf-8?B?Rkl0b3NHcTdXZkU1N01ZaVZWaGR4emhUREJ5ZWtvcW0rTExiQjk5dEcrcGN0?=
 =?utf-8?B?MmQ2RkVEQUZjcnV0ZUEzeUVicE00QkNueEF1Nmk5Ym9UYmVGMGkraHQzYkRP?=
 =?utf-8?B?M3FiZi9hSmdrMmlzTWZvSmRhWndiZ0FrUXBsYVhJMGY4TEl5M3ZSNHJVUDNW?=
 =?utf-8?B?K0Y0QXJPL1dVb011NUxsQzZSNzhxbndSa2crTVd3OWIrb1pPVUxxbndxQ2xk?=
 =?utf-8?B?ZUJPTEJ2bzc1WGNrNVF6bEduV1RzS1ZMZzYxek4zeTRMV0ZTYk4rTk1EdlRK?=
 =?utf-8?B?bjJIY09zS3pGNGZNVUVNekgwTE9vNzZJVkZaT0wzNDZoZEZMc1htNkpMZU90?=
 =?utf-8?B?a0tCeW8rZ3BlcUhPTmJPUGkwb2VCejJVdTI1M05uTVhRUVV0MGY5ZUNwc01G?=
 =?utf-8?B?V2NqTGw4cnFHbFRVTlhiNXZzOXB1SVhMMG9JQ0NYd1dmeWhFY05kNmhkSEox?=
 =?utf-8?B?c3Nybng2QjEyNVhuOEFYRWFOeDFGWG9WMnJPNWJwVTgzVmg4TmtUNnhSQmMw?=
 =?utf-8?B?bzVHZ0p6YVdSc0pqUGlwZklPM3B2TzYzZWpSY3pVY2JIK2pvVVJOYnVTQVlR?=
 =?utf-8?B?KzFkbnRQN1cvQWRiZ01DbUJKQzRTdDZMaEVUWk05UmY1RUQ3dStOcUduUm1s?=
 =?utf-8?B?QUVSMi8xUEd4bHprOEtKbGZ6Yng0cGhtUU5xSFB3Z3kzZDJncUpqbkw3TnlN?=
 =?utf-8?B?Qk41OGtpMEhhcEhVaFRMUWVITVBYMXRrY1NiaVo2V1l2YXdYWE9kVHdaZVBS?=
 =?utf-8?B?WWkvd1dEejRGZmMxb1RlVkRkcVB6ZTBoSlBoZ0FVK1B5R2RmOEJhQVRGd1dy?=
 =?utf-8?B?WE9BbDVTZGkwUHQrLzFodjFnN2VtcGsrdTdsem1XWHExaitHS05jTEhPNDBu?=
 =?utf-8?B?NCtKV0NQUkoxTU9pZUVKTWJQcTcrcmJnWk5UamZ4blVYdUlHNE9OVTB6b25M?=
 =?utf-8?B?MDgrbGNsRm5RbTkya3VQRGxKckZVdXcxSFdGYkp1VU1SQ1VvSUROcnQ4MU1Y?=
 =?utf-8?B?by80TFZlV0d5c1lra21MOVFjY3lKRUo2R3RMQWNpTGpOaWJKR251aU5PbnhJ?=
 =?utf-8?B?UE03bk0rNEtOdTVEN3ZobDZSdEhocTU4WWRCa2c4THUwTXRSV0pGblFlanlv?=
 =?utf-8?B?ZFM5Q0MzTzcvc2RtUVNpNEdPVU9sNEJSMFpkNzMxUi9iOFpObU5RY0lvNnM1?=
 =?utf-8?B?OU43d21DcldnVE9mRzNaZnZPMitiaE9JR051a1B1YStLbGhwdnYvMEw1STFC?=
 =?utf-8?B?TkZMSjZCU0t1djVDQnYrSU1RckRNSFp5VTZUcmZUTkpGNnQ5RU5JcVNkZ0kw?=
 =?utf-8?B?aHBWa3ZkSU8rQVFyRzRpZzBYUzYrZ2MzTGV5RnJpNjd1Vjk1QmhUM1JDL1dB?=
 =?utf-8?B?c1VwZEtSQ3h1OFNaV1pwYnZ4NUljY1l3citOeTEwRGZQa1pjS21wVmtsTTlY?=
 =?utf-8?B?K3F3NXYwamJ1bklVMVNVNE41N2ZScTBVNWRzOXIrUmUyUHE2dlErb0FZLzd4?=
 =?utf-8?B?N3dsMjlLdzg3a28xYVRDcjR4QzQ3ZTdQTWxTaHdBSnB2S3FQVzJwYlVuMFNO?=
 =?utf-8?B?b3hMLzBjaWt5TzhVNHhEWDhpZEdpTE5HYksrWjJGZUMvTFZTd0gyWjRYYVBv?=
 =?utf-8?B?R0lUNnRCV0FhQ2locW1CVFkwdnVIRDNhN0FaNmlqTUIwRHNXN2JzWm1BaWli?=
 =?utf-8?B?L3h0L1QvRDVkV0J6Qno0bjEvdzZFVXF5cGMzYXZmVjh0YUVYM2JtRkVKSkJC?=
 =?utf-8?B?Ti9POFBtbUk0Uzd6Zkt4MjA4Qm1nL3VsMXNJUzlBZ1hCYTNiQ1RaTkxGZW1T?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?WGtndzFjbGxQdDhwYjF1Q2k5WjFWL2kxSUFpcWNhVVlrN0g0VDcwb0hhblJz?=
 =?utf-8?B?MUphVUpnVGprZ2o3UmJsTlVsa1EvSU1yS0VsM2VaNi9NbmZSSFZqd09GWEkz?=
 =?utf-8?B?V0VXL09Ncm9sNGRrNlNSWHhFbXJGUU5uU3NJNHY5eWtDSVhXZHNMQ2s3aHlu?=
 =?utf-8?B?bU5USWM0cDVzc3ZXRnllUXJMMm11Rk1DL3pkWEtvSHc3emlxdTdTeXN0U29K?=
 =?utf-8?B?OS9CZEZKWHNzS0g2Y3hxSHAraS9aWFNQR0NNTG9lNHZQSkVjb2ppVmZWR3hO?=
 =?utf-8?B?bVl1ZHZ2dFVKZmNGMWlDNXIwdnVScVpOQjBuU296U0lseFk2eFJMY2kyWmNP?=
 =?utf-8?B?Z1dDUXBET2NrOGNZUTBJWjlJSllMb3BCN09BQlVreXRNYVMxL3gwek9Uc3BR?=
 =?utf-8?B?WnVFWVpCQWY1aWhVRDNRZm1lZjBBVkloWnNINTFmYzU5bno3eUtWdFBmeURL?=
 =?utf-8?B?M3JwUDh6VVBKUWJqS3hTT0pwMW5HTXcyQVc2ZnJxVnlMU1NDVjR6Z3JvV0Jo?=
 =?utf-8?B?UUFGeHdETDdhcTc0WHhJQTdVRXRKRkZmK2M4NXlzdFUzbDBRTkxVRVRyQUxt?=
 =?utf-8?B?MVVxRnUwT2pkQ05OeTFaWi9HaU5ZUjZQYTB5bG94RTI1K2FhazViK0NETmpQ?=
 =?utf-8?B?Mm9rOVVGNDNPcjRVV3NHaVgvQnN3eFF4Yzdjd0ZuTktYUXBydW9GN0dFOHd4?=
 =?utf-8?B?TDRCY3pZY2lrTkRXOEhienJUeTVDWm5mNGZWQ0dLbVU5dER2Wk1WeVNQc1p4?=
 =?utf-8?B?S1pUdUYrN2IwdTNCSVlhM2NDek05WDlWUU4ydTEzYnhqYkhYcWZXV1lOQmlX?=
 =?utf-8?B?eGxFaVN5MlJJRHpiMjRDeDJFWlRwRmg4N3ZaSlV2TjdLb0pwUkRlV3dlR2pD?=
 =?utf-8?B?NXd4aGdpTHcxZzIyMFo3K0JyUnd3WTh1dFNSeGxJMTdxUWFGemw4RkRJVEpP?=
 =?utf-8?B?Yzd3V1lDOFJPZjJkSnB6QXRUeUdGajEwKzNYeHJvNVE4eWdEWU50QVI4Zi9I?=
 =?utf-8?B?eFM4RXVtRHFaVW5UcThVOHoweXVSWFdRR0xhNjRuV0FqNktZZklKRHVQd29W?=
 =?utf-8?B?VGRaUEdiT0wxcXBRSDFWSnIrZmdXeFduVWJnQTB5L3haUjNiV0syZUJjcmJV?=
 =?utf-8?B?VEh0RWxETTJDSjBEM29aZzdLaGlWaHVkUVFsS1dvOFdIQVkrZFlUeXRlYkRj?=
 =?utf-8?B?eEYyNDVBb21TeC9wNXJSYUUzUzNmOHVaRUxoc00xSEpqcUg0T1k3T2g5S1hU?=
 =?utf-8?B?SzVWSThmVXpHWkxZWUFZeHRQWUNpYzBUV3NaZVVVNjFGYzdoY0JBcmJwWTA3?=
 =?utf-8?B?UlZYWHpLN2lzZWk3aEwrNW02Q01tM2JCckNHeUFCMmpwSkFJT0hqNkJDUCsz?=
 =?utf-8?B?YjZtL0FxZGd6MEFVK1M1NHVpaGs5d3NjV05HUDIzanpGamhMS2JiUG5FbnJu?=
 =?utf-8?B?blpaUWRXUE1XMXlUU0t4VDRPR3gyeG15V2JBWnhDa2dXb29QR1B2VWZjVnhr?=
 =?utf-8?B?ZzFDd2diMWpRNkxHMVY5S21meUxiMUY0eTFHTXNDbnRTc2R5elF5N2xGZlRs?=
 =?utf-8?B?SVhDK1ZNL3doUHJPMko1Z0VRNkxSRm1vbitWTFZzblZmTTkyZ1J1YkpCRjd6?=
 =?utf-8?B?OEVaeE5kVEdra05Iam1MdnZ0Q2RzMWEvNExnVEREWTlyY0hWa1VWODhtYUF6?=
 =?utf-8?Q?vyjtVclS5jEXzk8T8uYc?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddacd53-9f2a-459b-31cb-08db00690797
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 13:18:50.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKz6CloGCCeJcC5BBLLuKxqRJh64+gpcAoBU5DXa6/m3BnehSbuVNnAU7KGE1wzMtBlpEYA8443CcEcqeJQ3gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5724
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_08,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270126
X-Proofpoint-GUID: ntsqyddLpT0wVAwg6RGpulDW8oYf2jd1
X-Proofpoint-ORIG-GUID: ntsqyddLpT0wVAwg6RGpulDW8oYf2jd1
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
> The #slots literal will return NAN when not on ARM64 which causes a
> perf test failure when not on an ARM64 for a JEVENTS_ARCH=all build:
> ..
>   10.4: Parsing of PMU event table metrics with fake PMUs             : FAILED!
> ..
> Add an is_test boolean so that the failure can be avoided when running
> as a test.
> 
> Fixes: acef233b7ca7 ("perf pmu: Add #slots literal support for arm64")
> ---

Again, no SoB here.

For me, though:

Reviewed-by: John Garry <john.g.garry@oracle.com>
