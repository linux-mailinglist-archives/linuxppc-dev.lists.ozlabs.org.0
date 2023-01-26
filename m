Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9B467CDF9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 15:24:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2jdP1jKFz3fKD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 01:24:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=UTu8DOrP;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=aSJCz0H6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=UTu8DOrP;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=aSJCz0H6;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2jc74DCyz3fFH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 01:23:18 +1100 (AEDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QDiRoN020378;
	Thu, 26 Jan 2023 14:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=QJfYAKlxaCbWQ/+PwFG2Tdx/pAW+XdvxwGrEKmAVKh8=;
 b=UTu8DOrP0DFrroYZcdPu7QYKzEmlHj6hsyKEE2GokGQHjPczlJTJ6vvGoPWgvz3eBCAy
 Njp6ntU+KDLZLRb3a9YmBajtj7DXAuHhvLN7zuMASx2TLqcMEP2JVm3yG45CnMZLMcYn
 ID+plr0KaWXPR33WX4uy/uqnkp8yxXF0J2BlMZewy6DzwlGkFEr9RYQufKM5Foiymxje
 gCIYnbdgUpZbWgPaaNqKeXutjnJ/sbv+V5hftZRn8y4e5CzuVbHkLZp2iJiobB3/O8dQ
 R3CYHnP/AgmekDO7ivaNbX2mGTWg39mno0cSGOoNN+dATUcDL7AY4QR+9JYSVoR6nNM7 mw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n86ybjbtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jan 2023 14:22:54 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30QDw3sH028403;
	Thu, 26 Jan 2023 14:22:54 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g7e48b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jan 2023 14:22:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8EB//h2NB0NLqaV4Yvht8AujEfS5JIqOuLal/vmRYLb2F+FGsZ7gR7rOzaS1RxTLIMqRMSujUDeEee+02Kv2+M5JgAZQUaHnbyIXjOC5vD44UbFj33izfoywlcv/pkvVs317vjJc0SHlYQ/VycKzTUeXGzg7tJbI8U/E7Qg2yFuARxNPIGFW2S0aaagf9mX4ButInWc9ObnIm/rHfC7+GPMeJIkQDgkUkRP1bOtW4eLP3QZ5Fj/JLpjdkyCFpkzvC6sb78tUEGHMCFc4IFKx11CwcH7MkXTWmxT0rwnc+FvECslMYV7hesokOuUeLsAXFJUHafZLQ8Ydqrmg9whww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJfYAKlxaCbWQ/+PwFG2Tdx/pAW+XdvxwGrEKmAVKh8=;
 b=BiZ2sJhKimPTta0gxD3ng9/tXSCmNmvGldJoOOYtoyzjT3Yh3bItiqQlM5QOFRmVdVDeZxALED8F9mG8+d9GF4Y3CGwD/BkJ5b3Ikzgwa2mEr05ct7eCjrPqb1jLoBxNb5D+1l9EXxGi0cWRwVs0txxJzmuzNbn6U0jOkNIcw+njcnPUThF9LrIKGSwqbAwp2YljUIrDVPYzLEzwaW+uPN8HD3JoDtdlnicPhy+fZsu3XzJ011Xe5sZNooy1XQD0KGt7zELk8i0dqZBB/GIXktgbQIEyZ4AkibDr+jlrKW+5GOHihX2Qj5I8RJUj6vJ3BuAM9ZxO6uvInIv0Qid5Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJfYAKlxaCbWQ/+PwFG2Tdx/pAW+XdvxwGrEKmAVKh8=;
 b=aSJCz0H64kqxK/wBQBvnERAWSK9pjWmOgfjsK2CjPHyLqQLQ9nQgfBp4fGjNgrPqMK6a2quiegCxivdqa1rZIawql3UaUqf9pYKpUNkXKRXYHXhSC7W3VYNIhxAsAds92zbM7ri+tQ9PHoMjyTfxvBDWRbvwf4GGQ+H/7ec9Pls=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DM4PR10MB6909.namprd10.prod.outlook.com (2603:10b6:8:103::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 14:22:51 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 14:22:51 +0000
Message-ID: <573c92d7-3ccd-aca1-49f6-acbb105dbba9@oracle.com>
Date: Thu, 26 Jan 2023 14:22:45 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 11/12] perf jevents: Add model list option
To: Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20230126011854.198243-1-irogers@google.com>
 <20230126011854.198243-12-irogers@google.com>
 <10ae719f-2549-a367-2d2b-48671a00135e@oracle.com>
 <Y9KMGa1jGW3aLVZG@kernel.org>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <Y9KMGa1jGW3aLVZG@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0459.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::14) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DM4PR10MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 5636b95e-6ec8-4522-6292-08daffa8cea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QYPdlq0dAd7fGFOmwDlZRP98EvAvGnqJZ9vBDL71nX+BRca2CCvYP6iqVnObFSI/FAoNjTL+yjBDtlqIwCAm1LjMvN46uGX+M7TsVwi4EtOsE2p1pnUfTnvt5gllTVietrHSQ0HNG6QBOQxxAEXNU2oHem71EiRZrMAuuNCi0ApVQUDSAUItKskiIcVGfmm2M5gtOwoIORevabuHL9vKE/RIYImetJ/8O9bmaIyZBx45CaGbrse2aoBxK9S6kt6TjFFn5oC536/TZfBEgv7hxfEMUag8Y3ihanmo6ka56xLDPhe3h12gCd8t8Lh6KQqFUqAm99oYo4rN9Av4yesLgP6jWTVreqOToVAZ1wuQTC36ncKEHKOYUGcVpPs6qq5cj5Cv2B5vXF9UVN1jEX9SXZ83enQAeIpMYZmeT8jorZi6klX40Uk0rAKc5TQRNLEylRMtFKM3xpYs7WXHWXyweEVUnH9BCY8LYv6MY0qLPcIoSx2PthmPa2XG0l4gxso3hf7lEUgOj3KvacyI5ayjeGS/EdS74swIuJ3gd1Jx2+7SCKtzPH8hmP8fKlRdnNga1Df+pvdYoHa4gHFFB9NmfPugpkK4nq7vr4hcT+kSYUGPBQrOB+FkuOq1k4GLGetAmWx6YkkUNcINW1hG+17xck4G052zs8osPN/xRR20hzg46Dc9Ua/xSL7HqTOBZEi8WlmpVv9vfLsD2P6nVZZNaRCvHSuqg6rEMwcL1Z3mIBM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199018)(38100700002)(86362001)(66556008)(31696002)(66946007)(41300700001)(4326008)(54906003)(8936002)(7406005)(7416002)(36756003)(316002)(66476007)(6916009)(5660300002)(8676002)(2906002)(4744005)(36916002)(2616005)(83380400001)(6486002)(478600001)(53546011)(186003)(26005)(6512007)(6506007)(6666004)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NWdKWmJaaWZ5R3dxMlJ5c0pCYVlhSkpWVWIzZHRDQVQ4eTcxS3ZkZFFMblM4?=
 =?utf-8?B?RTBKeFh0dkdxbkZMTFhpdFpCT250OEpwR1ZlTzhma3pCWC9yTk8vWmY1dkNU?=
 =?utf-8?B?N2RpcFF5UjZjR1RxZkhPUGUzQmFSNkpWejFZcGN0bGREZ2xSR0xDbXVlSTZQ?=
 =?utf-8?B?MHRLek8zSmJiTzRwR2NIeG5OZ1dSdmMrVW1yVWFFRGFUMUl5YXJrZ3pEaGVG?=
 =?utf-8?B?ZnlVM0xwTXU2RThNWVJkNDdGWDMzWjBnRlBPa2E3UmUxRkdmTS9lWENwQ2VS?=
 =?utf-8?B?ZEVPK1VOZHg1QlluRnlGRFBFV1IyckdKWmZmMnFubWQ0bU40UjVMMHhKd1Vk?=
 =?utf-8?B?cTcxY0k5SGVsVTJld2FwRWlaVklQaXBLZ0xBRU9PYmFXMFB5NnJBTWIyNUJB?=
 =?utf-8?B?bkcvNHZUTEoxMjN0TTNBeUxEK1JCdm1YMk5wNDc0OXRzbFRyanowelhBWkFL?=
 =?utf-8?B?QnlUYUN3ZkNSaElscEVNM0Rxbkt5TnNYbWhUNmRKTHY2NnBrREdrY1lmWDRN?=
 =?utf-8?B?akRkak81R3B1c2VPYnZMdFJld0kyZ3pleGtLTG9zV3h1aW9vZ0J2cE9yT3hV?=
 =?utf-8?B?bWlhYzhkb1hXVHdwT25xbU52cERCclZmYkUvVkdwZjErR00xWEkzVmlhd3lG?=
 =?utf-8?B?MDJjL2xPTzhJQUJFL1BXZGsrTFZ5SVVYcjNvQWNrZDQvTXZrL2FlMCtZaGxP?=
 =?utf-8?B?U1lWeHA5SzMrVHNBbVVJOUJlbzNtSmxvc2t0amJ4LzZ6dGhpT2hUdUI4VWZx?=
 =?utf-8?B?cWx5RExOZ2xEUGh5VUlNNVh6dm9NOEpTcE1hV28vUWhCN1d6QXU5aXRCamZW?=
 =?utf-8?B?azFNN1JWUEhzUlVkdVpOS3ZyQWhjVGV4emh3NUxjcjNhLzRmNzdaOXdRdDZz?=
 =?utf-8?B?UXJ4ZHByMHhvc3BrV05hL1dFVUgwY1dkTy8yTkVsZHRjcDVwZ2gyN1NxVWhy?=
 =?utf-8?B?L2ZCOUJGTlN3Uy9RdnZlM2tXQVdrTmZLOWowaVYvNHNYVFRTUTI3WmR0UkEy?=
 =?utf-8?B?clI3YVdFdnJNWUxiaTNRa0pnb3FKQ2xocjFrYWZRc0pRTDZGdm1BTVdXc05x?=
 =?utf-8?B?cGtlenZHVSs2cHBNL0tvbmV4dm9IdXN2bG5VMmdJSEpTQ21QT3lsUWhSaWps?=
 =?utf-8?B?NTBKcFM0RW1hTm1YN3lIeHFpNEh4eE0zNHdvQ2dZRVFwbFpWb2hqZXBXZkRU?=
 =?utf-8?B?ZzhDMUtaVUdZWWhOa3I3Ulk3ek1icU9Td29JZXNPVFB3M0tlZGx4N09iLzJS?=
 =?utf-8?B?VUg1MHJ0VlN5YlBLUG5zb3VFdWVOQU5FdkdSKzJ3aG5PSDE1d1hwb01nbDRa?=
 =?utf-8?B?RmlreWdhZ2JkQ1JTN3ZZdkVVbFdqemtLTUdpVG04V1VRcFZuaEM5dTlsanNT?=
 =?utf-8?B?UTVHancrREdxeENzZ3M4V2dhVUJsQU41Z0hoeDF1cHRHYmZQNXFvcnR1V3hB?=
 =?utf-8?B?WC8wUHUxa0VLbFUzNWJ2dEJ3bUUrWjNBbVRxRitNQ0hFdzdmdTExamFxWHA4?=
 =?utf-8?B?RitoQmt0czVtbWR4Z0hUTzFveUlIVlhSbmNvK2Myb25uRE4xRnRrNGRLMzF6?=
 =?utf-8?B?K1VIYkFkZ3p1bU8yeFB4Q2t6TmZ4VnRTcWpCUlhFT2tndFFUQ2NqSHIvMVdL?=
 =?utf-8?B?VGRkT1lxMXlJdkErWDV5YkxMV3JjRWNSRHlnWml6OExIVHI0TGVTU1hhYWgv?=
 =?utf-8?B?RTZjZ2JqN1hSSGdvayt2MklaWjV2NFhqTnFUWHNsaVoyTG1CNDFmUzJVeFJT?=
 =?utf-8?B?T1JXaHlJTWluRDdLQkh6aGcyUDBQbTVIQnFOS0l0WVZZTDRVZXVpbTlDQjZv?=
 =?utf-8?B?TVViVVhwdmRMSXJPNThCc3dXSXBsbkltckwwWjBHcWFLVXpJT3VVYWlwek9z?=
 =?utf-8?B?dDJGL1ZKdE90SGpGdGJCWkF5U1RpRWh2WlBvWTl0Z2tSV1ZFQTdsVUNyQjRo?=
 =?utf-8?B?ZFJzTU9BRWdGd0xDQlZmRlRUWXpaSCt1QzZxMExwbzFWQnFFYzJvNlhERTBE?=
 =?utf-8?B?NEtjMTZadTNEbDk4VHA2aGFabVlHUWdBTmZmTGt0dDE4b1NxN2NjcnBrMUpP?=
 =?utf-8?B?ZUlFeVdTMzVkbXJJamo0S255SlYxUTRXKzhDTlpqYWsyR3dwTEFNMThodk9x?=
 =?utf-8?B?elZ6MHp4TzY0SkZEbXp1WEFYQ3p3QkRRVzVoa3dxWnVHYWJERXFTR2lRWjhy?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?RU12SisyVm1VVVo5ejZPeHBKQjFvTUNLd1NpWm5hUTFvVEJDcWV4TmNLM2t2?=
 =?utf-8?B?RWg0UXdjU1RTZktGaWVhV3BiNklqaEZEeE10blk0bVVZTnJmTlRIL21KUHhI?=
 =?utf-8?B?czc1N1hmeE5uTlNlQVgyRkpuOWtmWHdjZms4bFVpaWR6TVBZT05NWnVmYXlC?=
 =?utf-8?B?a0c0Y3pTbkYwZGljRGtrT3FOVDhmeG9OTU1IMit6Z0xHdkE1Mm9mOHc0OUZS?=
 =?utf-8?B?bE54WjZqYXowY0ZmZDE3NzBieDZzQlRoL0JNZHpZZ25JWlgzUFM5c05OVDJY?=
 =?utf-8?B?UHFWcXZOWkxkR0NtVW1FaHgrNlpsN0NUNHFTVTREaDI2MFR4bnBkV3RnUEtB?=
 =?utf-8?B?VWZvaVZlYlo2Z1RqaER5Q3lhVER2a3JsV0MySHJ5TW1kMzJvVEdLZkZ2d1FE?=
 =?utf-8?B?QlhDaDJ0TXpVbnBTL0ExMzVYU25oMFRuRnVJUXVTVmJuUkVNaWtTVEFsbERT?=
 =?utf-8?B?aER2NVE0MUhXME5vN0g4Z09raGtmM2hYcFNzMGdoL1BEanBRUC94aTUyVFVE?=
 =?utf-8?B?NTl5eHNSU0NVUHU2TTNPeGUwbjV3N2JiUEhXQjFtcXBQL0pLR3dFa1V4V2xq?=
 =?utf-8?B?cmNoSGgrVEU5RnRiOWR2MnZYN2daNEg2R0pkeE1CTjd0ek9zZnkrWWJXcnpx?=
 =?utf-8?B?ZWo0b0ZvR3hITUh3bE5nME5Idys2RmlRQ3hEdWhMT2Y5MDhLelRMbWZDVmpm?=
 =?utf-8?B?REozMU5SV1Myd3RaVEFGNGhVVHhrT0RkekJjQ0tHNE4wdU9JUWp5QjVhUGN1?=
 =?utf-8?B?NDBPaHNUNE91bVV3UkpmRzdOZUREL20zQ2Z0dU9iQ2Q0cDB6R1FtWGlBcXdo?=
 =?utf-8?B?QkwvQXhnYmd4TnN6RGtNTW5XY3lnczVUV2cxTjc2VFlOUTF3Rkt3RVZGTHdG?=
 =?utf-8?B?c1pGc3dXS3RHMXJaQ1lVN2FPMWk2dHZIT0RLaVlDNHh6cU9zMWwrdzNWYk1x?=
 =?utf-8?B?WW9uNkRPZVdPdUQrN3JZVnAwZXFxOXB6WGtkbUgxZ08wRlQrSGhEVnFMeWJW?=
 =?utf-8?B?MENVdWxXR0gyYUZqYW9HcVhTK3R6bkRzWVB1UzRsRDAwRUhUZmp1WmdPOFNw?=
 =?utf-8?B?OXprdGM0UmpkOGRwKzFjMXBvNlNxWFJpdStmQ2VFc09WQ2ljTkNodjE3MXk3?=
 =?utf-8?B?NkdMRy9ocVByK2IrNzVsZGdWeVU2RzBDR2taU2ttaHcvSnI2b2JBSVk0MW1O?=
 =?utf-8?B?cUNBOEFqT3hubW9mT2x1Vm5sdVVIa1RMWGovZVcxRjlERjdaYkd6Zi9JQ2RU?=
 =?utf-8?B?Y1NITmhyMUF1NWV4KytScFJ4UVh1ZWRUYzd3V3JNbXl5Q1lpUWtGTnBtVjg2?=
 =?utf-8?B?eno0S2ZGTmIzZmIvcEdTWHZiYnY0alk3dnN4Z3ArU3ZrVWd5ME81dFE4SGdm?=
 =?utf-8?B?ZXpTSXl5eXR5REpMT0E5Y3dTdU84M2JTWkI1ajJCWDNlZDVqTUw1RXFLNzM4?=
 =?utf-8?B?ZXlLTDBNWHQzTnN6MUtIU3NzZzFxSW5uaVR2OXRqU1RGb1dWR21zb1ROSFRX?=
 =?utf-8?B?anRUWkZvV0t1STA2amJhMFhTK1ZIK0lUUTd1a0ZScXRJdFFLayswWFdWS1cz?=
 =?utf-8?B?alFhc1lTK1BiUUtYc0N6N0llNldTRFBxSVErQ0R3RjVnZU12a3ZCRkMyQTdG?=
 =?utf-8?B?bkR6OE00ZUM1TDdoeGRFY3EwMWxnMjhPZVFrZC9OZHZqT052Q3RBMmJEK3Vt?=
 =?utf-8?Q?+Kymi1M7nMSO6BTiwoQ5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5636b95e-6ec8-4522-6292-08daffa8cea3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 14:22:51.5248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcx9y8lXDrcOKKkpiMLwiazwtnW09oFXmaIL2wogUC3UO6DntaJ70RifPP7JTLmblG5Ux8GmIcKvhdccyaM8fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6909
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_06,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260138
X-Proofpoint-GUID: NmiScQEQHaeFTa88iM7IbCKbe9idjo_I
X-Proofpoint-ORIG-GUID: NmiScQEQHaeFTa88iM7IbCKbe9idjo_I
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Sandipan Das <sandipan.das@amd.com>, Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Kang Minchul <tegongkang@gmail.com>, Mike Leach <mike.leach@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, linux-arm-kernel@lists.infradead.org, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fischer <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@li
 naro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/01/2023 14:20, Arnaldo Carvalho de Melo wrote:
> Em Thu, Jan 26, 2023 at 01:44:39PM +0000, John Garry escreveu:
>> On 26/01/2023 01:18, Ian Rogers wrote:
>>> This allows the set of generated jevents events and metrics be limited
>>> to a subset of the model names. Appropriate if trying to minimize the
>>> binary size where only a set of models are possible.
>>>
>>> Signed-off-by: Ian Rogers<irogers@google.com>
>> Thanks for this:
>>
>> Reviewed-by: John Garry<john.g.garry@oracle.com>
> Thanks for reviewing the series John, I see there are a few patches for
> which you didn't provide your Reviewed-by, 

Hi Arnaldo,

> are you planning to review
> those as well?
> 

I will do when I get a chance over the next day or so. I am just 
checking the easier ones at the moment :)

Thanks,
John

