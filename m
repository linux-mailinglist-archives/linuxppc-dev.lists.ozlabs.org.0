Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A567E794
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 14:59:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3K2M0WxFz3fHw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 00:59:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=L5RjlaRL;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HAIF7WMB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=L5RjlaRL;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HAIF7WMB;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3K1P1Kv0z3fFR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 00:58:47 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30R9SsBq028636;
	Fri, 27 Jan 2023 13:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Ujlv72MavLx7Dzc7tsQVnVoRJ+5Iz868vjHoKo3mFAI=;
 b=L5RjlaRLCWtgkx/nGwX82lzDn06MQnv2Mnc3dcZdYY5tMVMbkOVkumg1767wCi67teGD
 0UafsNS9HGJrMga8gifYPoXBHl4OCdHIvaSjlnW1dXsYuR+iR9zxhaR4k4ZUOz3soe9K
 /Gl4fI+ObKWB/Sc2s5GOsa9CKQHy4t2mas0jA9mSsdRgaM+cQgAYLWDH0nH4HWOOXSJL
 MClXoZfaTq0hNN6F/DfBnb0gWFL0NNYZpBBMIKuUZsFJAyisxdAeEgbyXxmXjdN4K4BH
 X3kZdbW6Ab3VHjqdFZkh/L/KnMB1veiU8Yf/U+t4QydNDS76JdDSRdJWA5JcGe/DOPaI jg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n86u34t97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 13:58:25 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30RBqoMO010575;
	Fri, 27 Jan 2023 13:58:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g97vtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 13:58:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLu9IqqtY4T2JqHFPnF1cOy5ju6Vf+luMBzqik4lx2TReY7/+VdFMSb4OxqeD5Pb7vuq2AK3A+WzzN3f2gV2tGTMh8au9YwGrhw70xb4U0fjrWlG8bsApu5Nf0E7St57j1gNa5NSLdfkJlBln1K7G6SB7N+h+hHD72wFLT+ugwRvQ9ITrva1OsO7lTkdbSW6JbuRKKOIELifnz6RT8pkrSzgNP2rtqlyO+Y86rw4JDtAJTAFvAazVaM5rUJduUBjEW5QmE18LMzU/0YrX+fFwN49fBIVHvYB+1E+4RCs3b6s1hGNUZng0/j+SVznmoDAMBjJ9ntMOZDmDOnhglI9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ujlv72MavLx7Dzc7tsQVnVoRJ+5Iz868vjHoKo3mFAI=;
 b=NvANL16YfzpBRzWy/ancqgtFGUv1JKZrNyR6XCLYN6hajcc6wSrHeV1ZlLDBAzgha6YhX0cJe+qp0nmhrN5HkD4VbxymnmY2k59+CuUKvoDuApVxRV/8YDx28+rR9XMD2PogoDySDJoS1v+rkFufHCBe/svpPjUvgHrp+1nQ0JRqr9HO7bvg81ko4gazcQ3wEE676kZceexZe7Sa/Sgp8GK/TCB9fX0nWM7yffFpcEMMnx4O8YKRjfLMQ2kOc8cBrfzhNhaqgnVmtiHLx8tM7Y9VBpMQgFZDHF3RgcsypYAcarsW4RbF8GUe8cEhoy3PPLzp8mP/7fbwDZSl5nA40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ujlv72MavLx7Dzc7tsQVnVoRJ+5Iz868vjHoKo3mFAI=;
 b=HAIF7WMBA0PVKt0MQBH1gZULZc9NWlwsMsTpvX6Ts6Vdbe5sfRtJfRFm0XmDhyn10GwnidAMZosZ4XNVv9WYfxX3C0PgiDUB4+xk2F00BfIqzdMRwuSWAiBINz/r/4QROII9RGO1JpKus1/VLfj89CmQZUyB231hVueb1oHmm9o=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by PH0PR10MB5872.namprd10.prod.outlook.com (2603:10b6:510:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 13:58:21 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb%6]) with mapi id 15.20.6064.010; Fri, 27 Jan 2023
 13:58:21 +0000
Message-ID: <48488a46-1633-aec8-d9b7-d880ec808798@oracle.com>
Date: Fri, 27 Jan 2023 13:58:14 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 00/15] jevents/pmu-events improvements
Content-Language: en-US
To: Ian Rogers <irogers@google.com>
References: <20230126233645.200509-1-irogers@google.com>
 <56f1ed31-886d-358d-cfcc-0ab9fe7a76d8@oracle.com>
 <CAP-5=fWc1UcjZT-8YcqHaiSEUGJCMNd4Syx3-MVhnk5PGUDPMQ@mail.gmail.com>
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAP-5=fWc1UcjZT-8YcqHaiSEUGJCMNd4Syx3-MVhnk5PGUDPMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0138.eurprd05.prod.outlook.com
 (2603:10a6:207:3::16) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|PH0PR10MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 849d31cb-00d1-4a94-3df2-08db006e8cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hQ3s71MFgNBl5npTptZmjC+FEM18SxnHbP0lnZTo5S3l/9SDzCVtw2XQ+1JQ6SSKbxLZ6TJcT4Gy7XL0rOGmJ5Tb3XtyBs8A3Bi+sJiWQFpy8Dqg0h4Yk0cQLDsXXPLcNUu0nUozyOvn+RsBmTeQ5X90HJ0AsFdMbbHBt6+SjyNujFlCbfCHftK8ru6q/yx6iZt7KcW5IHIsRSURbocaPi6m4KKA3P/INrZdPIr5HuJJaa02IuvAqNm/i/0gnc0vMyN0zldXkXZFz/Ho/yejsqvBRo7a0/eaisM0yLZyzjV6Pm1A7Ra8sZfynwpNPmIXKoEYSQkS8KBGWqKch8hk4c7pa0x7KmviQ19tTp0vkVWstnZ4l+m/NO6TXnJdEuXexr4M/ZT/F23UZS/8Ah7x8a2gMuJGRadpdOiqHwNOJCxRwo43wJUvPUPGO3k4uqUzopy6Pa/2Iod1dOYvr9F0PO7r1hHe3DYDgEaNqGtiALBDHMg+7kfIlTVtngsK22PitD18bQFnTN6FSx7u2JStmq+8i2kFFL0P3d0Ep8iuSbdcrEYlOgJWjEq5Gs0NPjlflDIPXB4Homzw4slEsKOXosg6q9ZpFXUE0hZ/hTm0GAjn20C6r+BrlgHNLUGjePUaLAlwJHMMpSIrEf97rVJ+HzXtHNimKM29N7uoOjJ2K07lrSvJWTFuKl6oX3GUqJS6RZefOYHmbpy+Az2yYMvj0P0WJMciy6LCajU+LRu6b40=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199018)(5660300002)(31686004)(7406005)(7416002)(2906002)(8936002)(4326008)(38100700002)(6506007)(6666004)(316002)(41300700001)(66946007)(66476007)(8676002)(6916009)(66556008)(4744005)(31696002)(6486002)(86362001)(36756003)(36916002)(186003)(26005)(53546011)(2616005)(6512007)(54906003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?OUl5UjFZSGE5bTZkZEVvQnJwRkpwK2VBbTNOK3lnY3dtZXhvRmhEajhLWGZz?=
 =?utf-8?B?aDMyZG4rb3RZaC9DbkhjNU5SanlMVnJTNkNUMjNvbTFDUHhPMjAyNldyT3oy?=
 =?utf-8?B?Rm1BK2VJblorOHZlSGRQTzFjMENHTlhoK24vYkhkTEpud0ZyS3EyNGIxYk9M?=
 =?utf-8?B?cTc2QzIxMlFyKzZOU1Q0cnpTRWRSMWt6VTF0YXdhclA2YXoreHUzQUpoMEZm?=
 =?utf-8?B?UFlHUUNQZUxLc0VJSk5Kd05xcGxXY25NcmZRT1pwRFBoNkxrK2lOM3dQRmI3?=
 =?utf-8?B?Nk1xQ0ZNNFBmak1rbTZ6cnJhS1ZJSEtKZ05LbXgrc05pb2JYcHFMZkRlSUl3?=
 =?utf-8?B?VDVyRUNqMis5UEtHdmgzbld6ZndPTUtzSlk5VlBlOG1rRTYxQk5FNDVkandK?=
 =?utf-8?B?Z05aNkpvNTdWUkZzUUx1aUx6b0ZDSVJjNVhpczNlZzVtaXI2bzk5aEJzcHd4?=
 =?utf-8?B?bWtldTk2RU1KSnRrV05BNXYrVkd6bWsvdEhTY29WN3JJMWtWMUZwSmV4b2Vr?=
 =?utf-8?B?Y2hsVmxLTXZsZHJXd200WGhnWkxsY0YvdjY2N0lYQ1dXOElWdjlPQkU5QTRV?=
 =?utf-8?B?UmF1Nkh6bUJUajR6NWsxd0dwYnJqTFdqeGJoMVQwc1d3ak4yZmhaQUZjYUZ2?=
 =?utf-8?B?dFZGUVNxSVpZSjRoL1hhREQ4bGpIR3RXZ0hpd21YNDhZcVZlNEtMYlF5ZGxK?=
 =?utf-8?B?RHRFYWs3eEtVSU5ZMm4zZHFMd3I1aEp5NmtOQlNpMWNVSUlrRGdSVXpEc1E2?=
 =?utf-8?B?RkdZeTY4aWpENHU0eUp4UExrOWIxZGpKTDR6eElpUEQrZWFzSzJvZFJmWmwy?=
 =?utf-8?B?UThFbklEY1paTFJ1cHNreVh6VWh3L0NVMVZTdDVvcmtmNTRUNE1LcEtFVE5z?=
 =?utf-8?B?Z2xQKzBOc3lVZ2hPSkZFK0REM3hwYU1CNnZrcS9QbTRJN0lCNDhVR3o2QlZy?=
 =?utf-8?B?Y2xBYVl1SjRYVVBNTWswZmxwWUtmZE9aQ2Z1K0tlUWF2MWZNazZZOU42elBV?=
 =?utf-8?B?Y1J3L2hsVEY1MytVSUFhR2JiVzB0WjkzekFTVmw4cnFjSlBMQUtpTXFRd25E?=
 =?utf-8?B?V2JnaDZkRGZBTkFIVDduaWJXRDlIZ1prejlVRVYvSWp0U1gvT1ozSEhiYVNG?=
 =?utf-8?B?UEtSeWFRaERwbGt0S25QZkNjT2J6NXJwY0REOFU3VTNMSVJwWmcyYXVkRzBR?=
 =?utf-8?B?UWdtNm5rUm1NTEhGeEFrejMxUERtejhSUXczRnFSNFJXVXd6L0tSdTA4RERK?=
 =?utf-8?B?dFBncGp4d1BwZEgvcU9Fc2JuOTcvQ0ZpWkNidHZPU1hQWXluOHoxR0NOWGJy?=
 =?utf-8?B?enVuRWJWZEF4M1dsai9BQ3pUNXAzNjlRaTlDcVdlRW5nditTQTRKSU56MXZH?=
 =?utf-8?B?Z2IyZ3JFdXlGV1RiY0Y1bFkzZUQ1eDBwWTBqYWJWRFVZNEphV24zYWZQcVp6?=
 =?utf-8?B?RzRJNkhhd2NmZWNBZzFldERua2laVFR4b1lXMnU4UFhtd3FqWXN2a1B4aXdV?=
 =?utf-8?B?MTN4WHFjRmJyZmExN21SbUR0djdCTFI2NmN0eDN3dEpjUytxbkhOdGo2S1lq?=
 =?utf-8?B?anlBbTA5SFprTXdlaXJrY25LSUg3SlUzVGdqckRDTVI1cXBxMmtCSG0xMlQw?=
 =?utf-8?B?S1RaUXNnWkVsVi9pc0Z6VzBIQTlzcVhnVGZLdnBIcG54YVozMFJmb0ZYcHQy?=
 =?utf-8?B?WC9pUTNoVC9PY24vK2Q4RVdOOVd5RGoxczBjU1ZIQnREOXdCdnp5QjMydGdN?=
 =?utf-8?B?L0wxbFAwMzcydEhnc0hzV3VER3lTNWowWW5OdFdaaUd5cDQ0SkpmY2d3QUI3?=
 =?utf-8?B?ZDZpVW9nZWQ3K0JqVk5YSXduTTVuV0lnQUErckJ4cDM3cHR1T2dLNEludzFN?=
 =?utf-8?B?SEtsT201TEkvU21PTTRMTjVPOEpmTUdsMnhRblNDK0I2VUpaOG4wZk1SalJ0?=
 =?utf-8?B?bk9HamEvNlRBSURVaFFYNHc5SllPMjlUU3g4TXR3emhNS0FZbGNiM3BIMnYy?=
 =?utf-8?B?aWVacmIwSVMzYm05SHdiQWluQWRjbDRWSWdSODkrcHJyb3MyQUZjaGNXQTND?=
 =?utf-8?B?eVRMTkFyTC9sWWE5ZG9hZjhFU3d1Rng1ektZZTA0QzM3WTh3YXIzR1U3SUM3?=
 =?utf-8?B?MDVsS1Q0anY1Tk5jKzVpR0RaU0JHN0VnNDIrbGdPVzNlUlB1TDd3UEUzU2RC?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?amhFem9XSkFPNzFrd2gza2FoVXV5d2FLeHBsSU5vSjZyMHNRK1RtbGNRRUtC?=
 =?utf-8?B?emF6Yjh1VFBwMXNtNFFWQmt3TWRTSWw3aEVsNndRZFkzMXl5STArYVc4NjBW?=
 =?utf-8?B?STgraHc2QnhkRmViUE9Fd1V3UVFuT3JpYUNKMTlWRTdZWnJOMFo0WXhzeVZE?=
 =?utf-8?B?eXZHOElQdDdUY2svbzkrWlh4dzRtZGg5aEVWbHRxQ25KOHdXQlV0bVlHTEQ1?=
 =?utf-8?B?YnIzWkp5VnQ0OVByMGZzNERYSmlmME1Wak4yRUhMbnNSOHFtNkRjVlc1U3Va?=
 =?utf-8?B?bksrbWw3NG0zekpqK3V4M0lzRHg5ckVhYUVTOXZ3M3Y3ODY1YVQ0VUwxQUtn?=
 =?utf-8?B?SEU1cE8xUWd0cE9RR2Z3TjRHK2lwVExxeFlWWCtQTXdYSGgxa09pN2ZnZjhy?=
 =?utf-8?B?SFJRVzhOUy9saE1XckZneHpPajRVWXFVSUI2SFdJcFFUbWljaFZsUm84aDFa?=
 =?utf-8?B?eTEzZVZVN3NoKzFVeWM2dHpDMjV5c2Rnc1dTV2tQN01aUk4xQzd0ZXNYUzUz?=
 =?utf-8?B?UWMzdkdNMEoreXN2UnllRVh5UjdSRmNhSUJHbm9WV2tCVDJsMW8yTTFaNkFl?=
 =?utf-8?B?a0lnakJ5YTYxd0lXYkJsN1NPaVJqdGpBWXlxVXl6KzRDUERJcC91VmQrd3li?=
 =?utf-8?B?c0Fnam56RHlic3Z3OGRFQXJWK3NQbnBRUmp2cFJEWlhONmY0SkZIRy80VDg0?=
 =?utf-8?B?U3JHVmppbjlielZHM0ptbFFGaXJlOFFyS2g1WG1ZU0g1SlJTS3FJVFNSSGZo?=
 =?utf-8?B?OXJpc3kwNVhGUHE2UldldER2TmloWHM5ZkwvSk54VVVxQ3JnNFZ6dTFFczE0?=
 =?utf-8?B?YjB2Q2dKaGV1QTZ6VVhXL2RyMmtYTXVUdlhkMWFMaUpGS2MwUHBHZEYzTzRu?=
 =?utf-8?B?Qmp4blMzdWNiMHZFUnhuR3hGWkZ3eWRQTHlLT1RFUXpjRGRKQ2huOUc4eHFL?=
 =?utf-8?B?NUFHMjZmZ1JiVjdqZDIyYmRvcHl3MmcyUkpFTm15dnR6L3hSTmxDdW1uamY5?=
 =?utf-8?B?YitDWXVEdlFxVnpMMFhTNUhzU0ZIUUg5OVl3QlVtQjFyWkhyZTVzTkdPalRh?=
 =?utf-8?B?MVVCWHZTODJwb3RiZXJsSzdpNGRlcUlqeGJJUEVBZlh2Y2o5V2F5NmhkV0pS?=
 =?utf-8?B?RjIvaGhjVFB6QnZKdjAxVFpYa2lkeUJHZ2Z3cnhkKzQrS0ZuczBDbVJmSjZz?=
 =?utf-8?B?MGV0d1MyZkpMZDRCSU90cGNOWWlnYkNPNkx1MnUyRGF4VjFneU5oVnJDWG1L?=
 =?utf-8?B?OHpmWklqdDk5SEI1TDVES3ladkVxQmRTMCtUYjdGZWMrZHYrZE1OZDJNMmNI?=
 =?utf-8?B?WE5rRXZZSVpzVms4TVNCQStMMWRBQ2lmVEhzMTFYWXJ0K1NPN3Qvb3F6YkdG?=
 =?utf-8?B?aG1rdGNmTFRjZ0FnYkZHaTljMUVDQ0pzZ25SQXlQT0dDNlJJZWxaK2x6UUpY?=
 =?utf-8?B?Tm5VdkUyeVd4Vkk1eFNPOHF0Y2lhYkxWeUdOV0ZRSkIyLzFVd1dneXRXaHRI?=
 =?utf-8?B?RGFvNGNyd2kwNnNVUnp3NXFKUzRLaDF1QWE4blY5T1VvZ044YjV6MUxURWdp?=
 =?utf-8?B?NEQ0NE12R3FwdTN3M3QzdTdpVytpaW14L3dGWUtVRmhDVExkNDRxcVFqZkVw?=
 =?utf-8?B?NkJmajl2V3grSTRBd0hoam1NdHVsemJlMkhITE5JNU9FQk82RFlrd3BOTWZs?=
 =?utf-8?Q?gaQaXGR93dA4kPPbzYqJ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849d31cb-00d1-4a94-3df2-08db006e8cd4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 13:58:21.4679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zse70fm/AYuGHEZnoNiajtPnj6OO6/VtTbXdYeC65DDt060qi5Uf/AE/8RNm+L7FAybFquZAQPpuoJ8Kjr0WOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5872
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_08,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270132
X-Proofpoint-GUID: 5rkMKygLdAuDBDCzP5iy7KOwPB1lBwnN
X-Proofpoint-ORIG-GUID: 5rkMKygLdAuDBDCzP5iy7KOwPB1lBwnN
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kang Minchul <tegongkang@gmail.com>, Sandipan Das <sandipan.das@amd.com>, Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, LKML <linux-kernel@vger.kernel.org>, James Clark <james.clark@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fischer <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, 
 Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@linaro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/01/2023 13:48, Ian Rogers wrote:
> On Fri, Jan 27, 2023, 5:20 AM John Garry <john.g.garry@oracle.com 
> <mailto:john.g.garry@oracle.com>> wrote:
> 
>     On 26/01/2023 23:36, Ian Rogers wrote:
> 
>     Hi Ian,
> 
>     At a glance, none of this series has your Signed-off-by tag..
> 
>     Thanks,
>     John
> 
> 
> 
> Thanks John, will fix. Is there anything else?

Not yet, but I am just trying to get through it - there's a lot here...

Thanks,
John
