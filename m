Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C617490EC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:20:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=fYmeSP+F;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=tDEdd5/y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDcc3bvLz3dWb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:20:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=fYmeSP+F;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=tDEdd5/y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx4kd33nDz3bVf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 02:24:55 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365FbGoV011945;
	Wed, 5 Jul 2023 16:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=WZzWKcmaiYEe4DdQfMW/zmodB8acCUgb4mK8duqza08=;
 b=fYmeSP+F8NRjCA4O3bmmhyekljhJ6Z4u95eGxSuNqMogemf/N/310uRrpuO2f7iDDfLZ
 b7G9qL6QGM8SWYZtxXFqAVegHdteq34lG4tRDXevYou8Vj9zxzkvi3hZsRbOzvKU8w4M
 JrXyEihuCNG4HaBE+ePgdQZ3cClq5NtvFX/LkvbeCukNuQUVlrA/fnJx2YwWPQEyvdyi
 yWTT+/yi5exPYhWXNK/ZtbF0SDShZcV2yT161OS4WmL0jhUNxIfbjeNC5HU5AdMwPDsd
 0WnJnQbZqW5MUpHuFTzCaecCHfyrM5CKetjDTWat/DKwxWPPYhRDTxKRWqzcf4kGrcN+ wg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjcpuetae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 16:24:22 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365F49cc013442;
	Wed, 5 Jul 2023 16:24:09 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5um42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 16:24:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ya+bQt+4ygG4/PC/siyjRjEqpzDFvPWDsmpjQ2JmnYefNE63YQzQey5SK3uf1ZGhSikjFGPbQrZ2567omGpD5Am3FCq3P/ti4Z87a1yP/1mZzlytT5vrKAqMokg68a+NwQ22NRfidUE1Fu6mKpAcIybtXHsLHD+gDNCle3Nwjt/BcAcAO9CYajuSYpd0z4T2oEQs7DP1h9OsmRrSof5nvCNv67jIpacRhLz7AWiSKr6P5+8cBrtQCKn8rpBqTJotP5jHrsqvn7UVAlSE10myeqeBrf/KyYyuhaA0b9yEkibMkiciKMyuU1W9EkmZkDjtH5WNNkebA3LnoWZ8l+39Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZzWKcmaiYEe4DdQfMW/zmodB8acCUgb4mK8duqza08=;
 b=I64wEcv8eNjlOvt3QmpYQq6GA0uYIe3x4YUjluiJB7O70GdT01XFtPb+nEPij+4IaV2XwunU0zIGYZAMpkMWHWdMdJ4DE2qiYRmBwTBuZXogmL1W0EZDX4aRrg3Y0FM/bsPYDIuXOty/euKjcB8pKfFQWPc+1oTb26PN9d5GPLFv9dBa8KWhArBWZDHLvPqyWyInra6xFEORoGbEqvSR9yIVomsXy0msmiH/wS8N3qrqNmq/BQUuB+Jgunu6DIxEhvUAsoc5bkTEdMD5Ezur4NfBCvGxzZAgPbLPzY/snzJiVWjpJlLvBj1GII/P3ZlHyUIPtoErJjb5py2HLtahaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZzWKcmaiYEe4DdQfMW/zmodB8acCUgb4mK8duqza08=;
 b=tDEdd5/y1ChEAfsRo6Pn46u8S0+5QOFyxC2DHnqLVkUeHM9FXMyiPcsFl8uY988+f/CscN9zy7VjVO/1NOB5a2ZULw/zPtUSEjLaMLMRBYWO4eaQqMVA6B7n2k6OXSH01IPWzQ6+CnnrW9AvOCG4oQ0pRJhDsx4IKaGRpqBMnNA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS7PR10MB5928.namprd10.prod.outlook.com (2603:10b6:8:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 16:24:04 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 16:24:04 +0000
Message-ID: <891d6836-b331-13e0-20da-6a0a4d98293c@oracle.com>
Date: Wed, 5 Jul 2023 11:23:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
 <20230705142004.3605799-13-eric.devolder@oracle.com>
 <20230705154958.GA3643511@dev-arch.thelio-3990X>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230705154958.GA3643511@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:806:130::23) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS7PR10MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: fe585618-3889-4c7c-1058-08db7d743fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UFaIndtnG5ovR3jyYjZAsYEXi/ag6OdRnk0M5go+vFaUbJOcQiSytXRezgW8Wt5/DYAzSfwUBbnFwAnrLBGd7/3PZT24sHtWfcsoySg4v8hjgV1kEWcNqIGpU72YLrFN3wokDA1oqXIXIQlV1RCXF6RgH1vWZm9iS5I6OB8gMKQHOes58xacH0DvlcMJDiRAAwEnu12+vjaLA56husAyZ6CzfA012+kuswbfk4F5H00mUi3e/TFS/kuOEmEm2nPqP3Jl1l5aXn0KLytrVFZ74vN9RqFmgXfClXz7xPDVmhBZutb2VIIfmAvnwlmHa9+FM0XSAWTjaPJyzw/r48IUZXQfh9qQnqfVdJ7DjkO+nez4zuNyimUALEZ/KNCgKJQQA+o1kJaAceidiIdo2du/XWS9honS+zOOv0PdnDiRYMs+Pq/YzPI4seGudEePjYZFffUb1KBFrWI0uDYaK+gJcGCMnRd6ZP4R19g81p9U9mUQMSCbQ2nNft8leGRog2ltTT2Cgfqcvfo17z5obHxTyn4cvG5fiJzxG1Fvkd340cFj69PncXgWRTNc7IyVyfnzjgzp3pQvDpdd3dyX/Zxwumg+uT1hr8hxCmdiZwVvpIEs9zuH7afskMgoKPBVDTfBIiYiw2DE+hLxmnNNNrxClw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199021)(107886003)(26005)(6506007)(31686004)(478600001)(6666004)(6512007)(86362001)(2616005)(31696002)(186003)(6486002)(66556008)(38100700002)(66476007)(53546011)(4326008)(6916009)(66946007)(83380400001)(316002)(8676002)(8936002)(7416002)(7366002)(7406005)(30864003)(41300700001)(2906002)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UkVsdUY5ck5iVXEzTUs4MjlKSTVXU0ladW1Uc3FNL2w1ejQ5NC95VVJIcC9r?=
 =?utf-8?B?MjFpcUZFZ1dLS0pBNG4wMW5md0p2TkloazRGbEhocHgwMTVVbzY4a09DNndZ?=
 =?utf-8?B?U0ZOMXpuL1R1NUhITDFUS0RDNHpjbFZGRUFld0NGZTUyQUliNTZxMWE4bUF5?=
 =?utf-8?B?a0Vqem9KRFgvYjdoYlBpSEc3UmtCYWhIQ1FYdDV6MmhLcTV4TUc1UkF0Z0RE?=
 =?utf-8?B?eEpLN1p0bE1YbjRTUDJNcWFMUyt4aVZJaDdXUjNOalJxdmFZM3JlemdHYTh1?=
 =?utf-8?B?ZnlTUzRmeFkxNGlrUTAzbjVmR3NZTzl0bkRIa0VaY3FZRHF5ZTZjQmxvdkho?=
 =?utf-8?B?RjJNTncxZ09Jb0g4QStNOWxhU0d1K0QxTlNsRUN5WlZDbkxpRGZFSDVXNkVt?=
 =?utf-8?B?N1ovUVUrQjloRjNESGd3ODE2QXo1SlRWTmxiMGY1TXdWTFVrRk9wdXZrUWMy?=
 =?utf-8?B?ZS9pYlBzd0hvOEhtWFg5TWdwazZCMFp0a1B3UVdpdXFPV0tsek5CMUVONUVH?=
 =?utf-8?B?N2t1dm5HL3FQN0NzVXdHRzE5cVEwb2YrWGJJM0Zpa2h0V2tFUXNnWStNbms4?=
 =?utf-8?B?WDRqamZKRE9RcWlWcUNrT3BJQm9jck1WazJrTlVZUnQreU5DVytGSER6SFFV?=
 =?utf-8?B?b3l4cmR4cFozRmsreWF2d3JZRzJyRjFzbjU0VW5QQVM2cDh1bmNOWXVPTldH?=
 =?utf-8?B?SHpNQTNPWjdBUnBJay9nRHBWTGxiOXZqOTZsNHVpT1phTDNwSUdaNiswOHZZ?=
 =?utf-8?B?Ny9kUEVXdG9lYVgxNU91MnN5dzlTcjZOOXp3eDdGNFVXK1JVcG1JUkM5eUgy?=
 =?utf-8?B?YjR0b3dxSC9OUTU3TTgvS2J5UWwwNnY4MEtHNjdTbnRQTEJ6NEwrN2xMTHp4?=
 =?utf-8?B?ZVRQbWdEOXlvT0ZDeVE4UnlYOWdHU1hLalJDS2lCMmVpb1JWM0EzcnhMOXho?=
 =?utf-8?B?MEliMytDREJJb2tXSmRMRzBLRVEyd3hlVGlpNDVTcHVSQm1nTndBR1VkNms0?=
 =?utf-8?B?TXVYaXhuOHNQK0VRYk4rVm14dDk0NzNTb3JnUnpqNEduM1RFREU0VTNrQkJ2?=
 =?utf-8?B?dHJyRlY4VERyeXhyVmZKZitjelZsRFR4WTA5UWRCV1JsTHJPalhzazlhVTZT?=
 =?utf-8?B?ZlJFSlpWVTRwejNrYldieWhNV1lPMWlvMHhvOUlPa0l3MDhwMDZXOC9GZEk2?=
 =?utf-8?B?YWFIc01GRUNGM0pNR2EzK1ZxdE5aZXBCTDVNbitlVGViZUY1cTdDdDBiZklQ?=
 =?utf-8?B?d0tMZDNIUlp3KzZhUm5GbnFuYWQ2K2tibTBobTNUbzR4SDd6UzNDUW8zNHd5?=
 =?utf-8?B?NGZUSHB0aGg1eEZZdS9taW1HSGFvOVRjRWVNdXpFMWdoQmYvb2FnTEdOR1kx?=
 =?utf-8?B?Z1hOT0dab052WEJ2ZHdMREYydGZKUWl5eGNSdFB2bjkxcm96SXp2YlV4OTZh?=
 =?utf-8?B?WkNqNmFqYnFiQU5WTG16VXFnZDNIUUZEZUFjT1RidzRYREtmdDhBY1VTVGJq?=
 =?utf-8?B?aE9iaXFpMGJiTEo1VlR0Vm45WThoQUFSbzAvYlk5ZFkzM2dMa3JDUEpXT3Fw?=
 =?utf-8?B?bjUydzRRQ0htUEVPdysrZ0VNOFAzd1FhZ3JyRy9oR2RpOCsycUlELzFoNlY5?=
 =?utf-8?B?R3lodEJYRlE1c200aXVQSWNQTGN6NEtNbzFsY1l2dHNvSWo3ZWl2S3FOV3E0?=
 =?utf-8?B?YjBFZDRYRkViWjNsMXBaVFJLUHlnWitrOWFqUDl5M3QyWkhHWURNcjBvT0o1?=
 =?utf-8?B?dnZXYUNJa0hsR2l2OFFmRjN6VE1ld1pUdFpMdE8wbXVORzhTMWpScDhsSWdE?=
 =?utf-8?B?MUxwVmlpeXdMME5GNGJhaXFzU2pkZmZtR1V1ZjdMYmEvNCttSTIzSmM2M0pj?=
 =?utf-8?B?YkFlMGxZQ0htZ3FhTUpRb25uRlEvUzdyb1RHSldoWENrVE5Qa2VZN21GNG9Z?=
 =?utf-8?B?bjNrYjNtdlhtZWlMbnVMM1RUWDlSbDA3RjVyNmJmRVJqMW9RMkFqek1oM2E3?=
 =?utf-8?B?WG42a1puMDZrSjhqTVRhYzd5cEVkSHVsTitYQy9wZFJDZ2RzeTZlY3B2ZFUv?=
 =?utf-8?B?V3Zubm4wMDN1UlFYU2dma0JuQU9MZmpPQ1ZIME9ia0FqY1JoNWY4MFFzRTRz?=
 =?utf-8?B?RW1sY3lCN2pGWERITi9RZ3RkNy91Vi9pUTQwM2VxOS94MGMxVjYwWElYZnp3?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?cjNtMkIyY3hFRDhRNlRnUXhIWmZHc3VPSHlKb0IwcWFIbjJ6MUY1aWh1ODE5?=
 =?utf-8?B?YVozREdzT0w3ekFFU3pZclMzN0NlR0xlVjBheDZFWUl6OG85SzZhb2d4OVVo?=
 =?utf-8?B?dE1sZEtZa3oyQVdkYklDRy9PUEgxdlE2T0FYQkh2ZXJsTDBRRGVmQ2NkelFt?=
 =?utf-8?B?QWZzbkJxNjlDemtrajMzQTJmUHk5R2pFY1h6QWhaN24wSzZEdnRHNDdwVFBN?=
 =?utf-8?B?NktYK09rNUFhTVpNdHY1ZW9YNi9HOTN1UFdkWDRXTWUvTlltdW9aS0praGk0?=
 =?utf-8?B?dTA2VDMydXBJbmZaUURHcjU4VVNnT3VtdEE0V010ZUwwdGVaa2NHbzJLMWxM?=
 =?utf-8?B?bUlCNWo4ckxhdkpLYVo2OFlReFFBQWsxdVk2QUl0Smh3SnkxTFZjNWFsMnMy?=
 =?utf-8?B?Wlhkcks5ekg1UWdXNVgvWWh3cFlVSndPVSt5OXVwc2t3WEZic1NqVkZEZGRH?=
 =?utf-8?B?d3N4WXF0YTdRd2lLQnV2eElaZWpDemNlUlVHc1dKN1IyVjBERStEMWNPUy85?=
 =?utf-8?B?cU9qN2d1c1hITnF5aS9TV2tOT2E1bzNMY0NYSjZJT2poVDZSOUZRZVQzWE1X?=
 =?utf-8?B?UDJ0KzQ0YnhyOGw0TVlLb2Z3M0gvME1YbTBQRUp0NXoySmZxczUzNXBSL0s1?=
 =?utf-8?B?MHBLZTdkQjEvR3F4QWx1Y0o2Yi9Vb0ZyK0F5aFpYZzJoa05TVUVERjRmWnF2?=
 =?utf-8?B?M0M2dzNMMTdTaTNFQUpmOGx6Z2dubjhQMTZpZ0pBL2c4TnZtWUYrRFlianI1?=
 =?utf-8?B?VnpsbFhnQ2RWd2t5WjZZSkloMXpEUEZUZTRQQlgrQmFaQlh2TW9laHQwYjBz?=
 =?utf-8?B?Vmcrc3E2TWxIMXk5L2c2TTdiQlFhOXhOY21YbGlZQ21adjExbGs3RDVvUDNq?=
 =?utf-8?B?V3pDUEUzb3h1UCtpQ1NmeFdyNnFsemIwTXBpY2VrN000OFF0Rk1Ma1JvWFNm?=
 =?utf-8?B?Q0lQUzY1VVpZUHVEWUNidEF1SGRISWU3SDVBQzd4TTg0WFlWL1JkaDlhQnFk?=
 =?utf-8?B?RWVxRVhpNlV2REdvVjhxZUJHcy8vbHowVFNzWTJXZktPeGdiMW52T2lLdUs2?=
 =?utf-8?B?ZjRPakF3L2VHYW9NOWxEQjNlT1JWcWZlNGhHVHlXMUx6OXNKUTBVWnFCMU5r?=
 =?utf-8?B?Qk9SZlVuZVQ0L1VZb2xidlgzWGVqTmFjdlllSjZkdHFOQ0FHVEo1SnlJSGxT?=
 =?utf-8?B?bUJYVUZvam1La0sxWXdCWXVsdkNRRnRFT3lhNVp5S1pzTE10UzY1ZkcrNW5K?=
 =?utf-8?B?a1dzV1dvMEJLNWtLQnF6SGxDSnBFTXBieDVHK21GZml6NXlvNU9QakE2YXFX?=
 =?utf-8?B?SXVPUUFOS2NiL2VLbWxwMjVZenBOVDV6VElsTzVsZVpmM1F2eGt3VnRLLzFU?=
 =?utf-8?B?NEFxeURVZkk1cC9peU53UDNIZHlHdDg3UVd1NCtDVFV6WWZKZXh2UG9ueGxL?=
 =?utf-8?B?QlVSNUV4eU0vTEFZM1ZsdWx0RGp5RnZNSTNCTDNoNXpwbmR4VG1iNFU5dUNv?=
 =?utf-8?B?cWdGUEJxVy9qN2V0L0xrN3RRL0JrN2VGZ0pQdFRKa2ZUOFZwa0VHTVd3Nm5Y?=
 =?utf-8?B?Y1RabkJXbjE5WE1PcTFFNldkdWxveHExSForYWZuWVJmdFBVamFQSEg3ZTBx?=
 =?utf-8?B?NGkvTGREelQrczAvSlRDbjJSMytwdk1lTWpRTnVHbFhQV2xtbTlqM2xQZjF5?=
 =?utf-8?B?YTdOWjdnZzVKSXFTOTB2YU9TVXNHczFUSjlBMU5lTm5hN2pzMW1tQ3RHakFo?=
 =?utf-8?B?TllJZVZreEpYYjlBUTNWcWFIbkNCWkpHVlhsK0F5RUk4WGxqZitlUVlQYTY0?=
 =?utf-8?B?clhjbTNMRFRQYlVnSmducXRKdDRIeTdHNFhGWUtTMDh6WjB1eHhWZkNuM2t6?=
 =?utf-8?B?blVrUUxkV2FaM2hvVmhwdnRnS3pOek9HVmNMc2dpWHM0KzI3K3dNOVZZdnJx?=
 =?utf-8?B?Q0ZpRzRna2FwU2tMU0t4cHB2bHowRlR4S1JmdkxhZGtwV2JnWGI0RzNiVjBq?=
 =?utf-8?B?a3VMYXN0bnFBdW90ZDh5a0ZFUEFwbi9VRDZwVmRBeHlMYWRhYnhkaWRTM3pU?=
 =?utf-8?B?MDJtSXRGMUR3MXpCL0xDVm9EWWJteUQ5LzhzbjgrRWdNVmV5QU1WNkFJeXNq?=
 =?utf-8?B?bEs3N0Zma2RkYXJYd2RqcUVJL0l0T0xvVmdidFV4anh6SkVCTU9od3BIK29i?=
 =?utf-8?B?QWgyMjNYREM5QW1NVjBEbTVXSzl1ZmtSUVQvLytPVFNUL2s0ckM4TDF1UlhY?=
 =?utf-8?B?WVk5UGxMTVJxY3ZDek9uUStES2pWKzNoUE10SExRUFAwQjV2VjJCN2ZadFFP?=
 =?utf-8?B?NlBQRkdpTVR4ZGJzdnBkVCtWT1NNTi9RLzZFemQvRndaRlNUWkF4YlVZSzg1?=
 =?utf-8?Q?vHAqUKht+Xysf3fwOSkfuj6FjzBVH1cAZzFau4b0VKRfB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	dPsdyMJIbRFL+xWtb1VMfBk+B2OkvmmLOBmJj0m0TDDvJjgVLMnW/CCFKMYjr0N/2kJBB8s8YHy/COkE+1e+6dTdwAdIWuuvyR+I8+sb1FJ9OYch4btzJOV2lH1G0l4ThTo0+btKcLrZly7Cozxb+jrVU63WOKT39zCu1JcnVpXVbx2VF4IiNKEb1Gox2IJAvUKUjc7emAXOgBR95SspXnN4CwyUuSL/H75SNFYWItH8Qj8rMqCEhgK+r+SLVvrfJ+qdtxeDaGqY7OfVP/Xi1rLpeDsLg0R/6WmPYRofxE0YogivSS7QFMFzbmQRRXZSKaTrBr4dEyRKvtS+QwW/CFGuhxpVOHEYJWYVb63baWpm1Et5QQgq4FpcnaxOnZWWpnsCjcpAviOQM/lt/5jzL3ziWGg3yNpo67YAhyMfwAk1/zZNri1p98y9NjMSsOjqhQSulpvWVyVZ0w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe585618-3889-4c7c-1058-08db7d743fac
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 16:24:04.3123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szwktP1HDqfwe6jKy7sWXCNvO5Bj+WIR5pY6I4HdIH/zHh02Ts6S2MA6+moQwvqK5ikHSlJWwcA4nryZLaemDnZTdmj4rP9m/ftuWtOqkbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5928
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_07,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050149
X-Proofpoint-ORIG-GUID: lF4ACudWf1FflmW_0gNYEXP4K2oi_dNX
X-Proofpoint-GUID: lF4ACudWf1FflmW_0gNYEXP4K2oi_dNX
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:04:02 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.
 wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/5/23 10:49, Nathan Chancellor wrote:
> Hi Eric,
> 
> On Wed, Jul 05, 2023 at 10:20:03AM -0400, Eric DeVolder wrote:
>> The kexec and crash kernel options are provided in the common
>> kernel/Kconfig.kexec. Utilize the common options and provide
>> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
>> equivalent set of KEXEC and CRASH options.
>>
>> NOTE: The original Kconfig has a KEXEC_SIG which depends on
>> MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
>> dependency (using the strategy outlined in this series, and other
>> techniques) results in 'error: recursive dependency detected'
>> on CRYPTO.
>>
>> Per Alexander Gordeev <agordeev@linux.ibm.com>: "the MODULE_SIG_FORMAT
>> dependency was introduced with [git commit below] and in fact was not
>> necessary, since s390 did/does not use mod_check_sig() anyway.
>>
>>   commit c8424e776b09 ("MODSIGN: Export module signature definitions")
>>
>> MODULE_SIG_FORMAT is needed to select SYSTEM_DATA_VERIFICATION. But
>> SYSTEM_DATA_VERIFICATION is also selected by FS_VERITY*, so dropping
>> MODULE_SIG_FORMAT does not hurt."
>>
>> Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
>> from KEXEC_SIG. Still results in equivalent .config files for s390.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
>> ---
>>   arch/s390/Kconfig | 65 ++++++++++++++---------------------------------
>>   1 file changed, 19 insertions(+), 46 deletions(-)
>>
>> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
>> index 5b39918b7042..5d4fbbfdd1cd 100644
>> --- a/arch/s390/Kconfig
>> +++ b/arch/s390/Kconfig
>> @@ -244,6 +244,25 @@ config PGTABLE_LEVELS
>>   
>>   source "kernel/livepatch/Kconfig"
>>   
>> +config ARCH_DEFAULT_KEXEC
>> +	def_bool y
>> +
>> +config ARCH_SUPPORTS_KEXEC
>> +	def_bool y
>> +
>> +config ARCH_SUPPORTS_KEXEC_FILE
>> +	def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
>> +
>> +config ARCH_HAS_KEXEC_PURGATORY
>> +	def_bool KEXEC_FILE
>> +
>> +config ARCH_SUPPORTS_CRASH_DUMP
>> +	def_bool y
>> +	help
>> +	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
>> +	  This option also enables s390 zfcpdump.
>> +	  See also <file:Documentation/s390/zfcpdump.rst>
>> +
>>   menu "Processor type and features"
>>   
>>   config HAVE_MARCH_Z10_FEATURES
>> @@ -482,36 +501,6 @@ config SCHED_TOPOLOGY
>>   
>>   source "kernel/Kconfig.hz"
>>   
>> -config KEXEC
>> -	def_bool y
>> -	select KEXEC_CORE
>> -
>> -config KEXEC_FILE
>> -	bool "kexec file based system call"
>> -	select KEXEC_CORE
>> -	depends on CRYPTO
>> -	depends on CRYPTO_SHA256
>> -	depends on CRYPTO_SHA256_S390
>> -	help
>> -	  Enable the kexec file based system call. In contrast to the normal
>> -	  kexec system call this system call takes file descriptors for the
>> -	  kernel and initramfs as arguments.
>> -
>> -config ARCH_HAS_KEXEC_PURGATORY
>> -	def_bool y
>> -	depends on KEXEC_FILE
>> -
>> -config KEXEC_SIG
>> -	bool "Verify kernel signature during kexec_file_load() syscall"
>> -	depends on KEXEC_FILE && MODULE_SIG_FORMAT
>> -	help
>> -	  This option makes kernel signature verification mandatory for
>> -	  the kexec_file_load() syscall.
>> -
>> -	  In addition to that option, you need to enable signature
>> -	  verification for the corresponding kernel image type being
>> -	  loaded in order for this to work.
>> -
>>   config KERNEL_NOBP
>>   	def_bool n
>>   	prompt "Enable modified branch prediction for the kernel by default"
>> @@ -733,22 +722,6 @@ config VFIO_AP
>>   
>>   endmenu
>>   
>> -menu "Dump support"
>> -
>> -config CRASH_DUMP
>> -	bool "kernel crash dumps"
>> -	select KEXEC
>> -	help
>> -	  Generate crash dump after being started by kexec.
>> -	  Crash dump kernels are loaded in the main kernel with kexec-tools
>> -	  into a specially reserved region and then later executed after
>> -	  a crash by kdump/kexec.
>> -	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
>> -	  This option also enables s390 zfcpdump.
>> -	  See also <file:Documentation/s390/zfcpdump.rst>
>> -
>> -endmenu
>> -
>>   config CCW
>>   	def_bool y
>>   
>> -- 
>> 2.31.1
>>
> 
> I just bisected the following build failure visible with 'ARCH=s390
> allnoconfig' to this change as commit 842ce0e1dafa ("s390/kexec:
> refactor for kernel/Kconfig.kexec") in -next.
> 
>    arch/s390/kernel/machine_kexec.c:120:37: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>      120 | static bool kdump_csum_valid(struct kimage *image)
>          |                                     ^~~~~~
>    arch/s390/kernel/machine_kexec.c:188:34: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>      188 | int machine_kexec_prepare(struct kimage *image)
>          |                                  ^~~~~~
>    arch/s390/kernel/machine_kexec.c: In function 'machine_kexec_prepare':
>    arch/s390/kernel/machine_kexec.c:192:18: error: invalid use of undefined type 'struct kimage'
>      192 |         if (image->type == KEXEC_TYPE_CRASH)
>          |                  ^~
>    arch/s390/kernel/machine_kexec.c:192:28: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
>      192 |         if (image->type == KEXEC_TYPE_CRASH)
>          |                            ^~~~~~~~~~~~~~~~
>          |                            KEXEC_ON_CRASH
>    arch/s390/kernel/machine_kexec.c:192:28: note: each undeclared identifier is reported only once for each function it appears in
>    arch/s390/kernel/machine_kexec.c:196:18: error: invalid use of undefined type 'struct kimage'
>      196 |         if (image->type != KEXEC_TYPE_DEFAULT)
>          |                  ^~
>    arch/s390/kernel/machine_kexec.c:196:28: error: 'KEXEC_TYPE_DEFAULT' undeclared (first use in this function); did you mean 'KEXEC_ARCH_DEFAULT'?
>      196 |         if (image->type != KEXEC_TYPE_DEFAULT)
>          |                            ^~~~~~~~~~~~~~~~~~
>          |                            KEXEC_ARCH_DEFAULT
>    In file included from arch/s390/include/asm/thread_info.h:31,
>                     from include/linux/thread_info.h:60,
>                     from arch/s390/include/asm/preempt.h:6,
>                     from include/linux/preempt.h:79,
>                     from arch/s390/include/asm/percpu.h:5,
>                     from include/linux/irqflags.h:18,
>                     from include/linux/rcupdate.h:26,
>                     from include/linux/rculist.h:11,
>                     from include/linux/pid.h:5,
>                     from include/linux/sched.h:14,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from include/linux/device.h:15,
>                     from arch/s390/kernel/machine_kexec.c:9:
>    arch/s390/kernel/machine_kexec.c:200:48: error: invalid use of undefined type 'struct kimage'
>      200 |         reboot_code_buffer = page_to_virt(image->control_code_page);
>          |                                                ^~
>    arch/s390/include/asm/page.h:186:58: note: in definition of macro '__va'
>      186 | #define __va(x)                 ((void *)(unsigned long)(x))
>          |                                                          ^
>    arch/s390/include/asm/page.h:194:38: note: in expansion of macro 'pfn_to_phys'
>      194 | #define pfn_to_virt(pfn)        __va(pfn_to_phys(pfn))
>          |                                      ^~~~~~~~~~~
>    arch/s390/include/asm/page.h:199:33: note: in expansion of macro 'pfn_to_virt'
>      199 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
>          |                                 ^~~~~~~~~~~
>    include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
>       64 | #define page_to_pfn __page_to_pfn
>          |                     ^~~~~~~~~~~~~
>    arch/s390/kernel/machine_kexec.c:200:30: note: in expansion of macro 'page_to_virt'
>      200 |         reboot_code_buffer = page_to_virt(image->control_code_page);
>          |                              ^~~~~~~~~~~~
>    arch/s390/kernel/machine_kexec.c: At top level:
>    arch/s390/kernel/machine_kexec.c:207:35: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>      207 | void machine_kexec_cleanup(struct kimage *image)
>          |                                   ^~~~~~
>    arch/s390/kernel/machine_kexec.c: In function '__do_machine_kexec':
>    arch/s390/kernel/machine_kexec.c:243:40: error: invalid use of undefined type 'struct kimage'
>      243 |         data_mover = page_to_phys(image->control_code_page);
>          |                                        ^~
>    arch/s390/include/asm/page.h:189:35: note: in definition of macro 'pfn_to_phys'
>      189 | #define pfn_to_phys(pfn)        ((pfn) << PAGE_SHIFT)
>          |                                   ^~~
>    include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
>       64 | #define page_to_pfn __page_to_pfn
>          |                     ^~~~~~~~~~~~~
>    arch/s390/kernel/machine_kexec.c:243:22: note: in expansion of macro 'page_to_phys'
>      243 |         data_mover = page_to_phys(image->control_code_page);
>          |                      ^~~~~~~~~~~~
>    arch/s390/kernel/machine_kexec.c:244:36: error: invalid use of undefined type 'struct kimage'
>      244 |         entry = virt_to_phys(&image->head);
>          |                                    ^~
>    In file included from arch/s390/kernel/machine_kexec.c:27:
>    arch/s390/kernel/machine_kexec.c:252:40: error: invalid use of undefined type 'struct kimage'
>      252 |                    unsigned long, image->start,
>          |                                        ^~
>    arch/s390/include/asm/stacktrace.h:101:32: note: in definition of macro 'CALL_LARGS_2'
>      101 |         long arg2 = (long)(t2)(a2)
>          |                                ^~
>    arch/s390/include/asm/stacktrace.h:216:9: note: in expansion of macro 'CALL_LARGS_3'
>      216 |         CALL_LARGS_##nr(__VA_ARGS__);                                   \
>          |         ^~~~~~~~~~~
>    arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>      250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>          |         ^~~~~~~~~~
>    In file included from include/linux/irqflags.h:15:
>    arch/s390/kernel/machine_kexec.c:252:40: error: invalid use of undefined type 'struct kimage'
>      252 |                    unsigned long, image->start,
>          |                                        ^~
>    include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
>       11 |         typeof(x) __dummy2; \
>          |                ^
>    arch/s390/include/asm/stacktrace.h:136:9: note: in expansion of macro 'CALL_TYPECHECK_2'
>      136 |         CALL_TYPECHECK_2(__VA_ARGS__);                                  \
>          |         ^~~~~~~~~~~~~~~~
>    arch/s390/include/asm/stacktrace.h:219:9: note: in expansion of macro 'CALL_TYPECHECK_3'
>      219 |         CALL_TYPECHECK_##nr(__VA_ARGS__);                               \
>          |         ^~~~~~~~~~~~~~~
>    arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>      250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>          |         ^~~~~~~~~~
>    include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
>       12 |         (void)(&__dummy == &__dummy2); \
>          |                         ^~
>    arch/s390/include/asm/stacktrace.h:134:9: note: in expansion of macro 'typecheck'
>      134 |         typecheck(t, a)
>          |         ^~~~~~~~~
>    arch/s390/include/asm/stacktrace.h:136:9: note: in expansion of macro 'CALL_TYPECHECK_2'
>      136 |         CALL_TYPECHECK_2(__VA_ARGS__);                                  \
>          |         ^~~~~~~~~~~~~~~~
>    arch/s390/include/asm/stacktrace.h:219:9: note: in expansion of macro 'CALL_TYPECHECK_3'
>      219 |         CALL_TYPECHECK_##nr(__VA_ARGS__);                               \
>          |         ^~~~~~~~~~~~~~~
>    arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>      250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>          |         ^~~~~~~~~~
>    arch/s390/kernel/machine_kexec.c: At top level:
>    arch/s390/kernel/machine_kexec.c:278:27: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>      278 | void machine_kexec(struct kimage *image)
>          |                           ^~~~~~
>    arch/s390/kernel/machine_kexec.c: In function 'machine_kexec':
>    arch/s390/kernel/machine_kexec.c:280:18: error: invalid use of undefined type 'struct kimage'
>      280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>          |                  ^~
>    arch/s390/kernel/machine_kexec.c:280:28: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
>      280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>          |                            ^~~~~~~~~~~~~~~~
>          |                            KEXEC_ON_CRASH
>    arch/s390/kernel/machine_kexec.c:280:66: error: passing argument 1 of 'kdump_csum_valid' from incompatible pointer type [-Werror=incompatible-pointer-types]
>      280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>          |                                                                  ^~~~~
>          |                                                                  |
>          |                                                                  struct kimage *
>    arch/s390/kernel/machine_kexec.c:120:45: note: expected 'struct kimage *' but argument is of type 'struct kimage *'
>      120 | static bool kdump_csum_valid(struct kimage *image)
>          |                              ~~~~~~~~~~~~~~~^~~~~
>    cc1: some warnings being treated as errors
> 
> I don't think this change is equivalent for s390, which had
> 
>    config KEXEC
>        def_bool y
>        select KEXEC_CORE
> 
> but it is now the equivalent of
> 
>    config KEXEC
>        bool "Enable kexec system call"
>        default y
> 
> which enables KEXEC by default but it also allows KEXEC to be disabled
> for s390 now, because it is a user-visible symbol, not one that is
> unconditionally enabled no matter what. If s390 can tolerate KEXEC being
> user selectable, then I assume the fix is just adjusting
> arch/s390/kernel/Makefile to only build the machine_kexec files when
> CONFIG_KEXEC_CORE is set:
> 
> diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
> index 6b2a051e1f8a..a06b39da95f0 100644
> --- a/arch/s390/kernel/Makefile
> +++ b/arch/s390/kernel/Makefile
> @@ -37,10 +37,10 @@ CFLAGS_unwind_bc.o	+= -fno-optimize-sibling-calls
>   obj-y	:= head64.o traps.o time.o process.o earlypgm.o early.o setup.o idle.o vtime.o
>   obj-y	+= processor.o syscall.o ptrace.o signal.o cpcmd.o ebcdic.o nmi.o
>   obj-y	+= debug.o irq.o ipl.o dis.o diag.o vdso.o cpufeature.o
> -obj-y	+= sysinfo.o lgr.o os_info.o machine_kexec.o
> +obj-y	+= sysinfo.o lgr.o os_info.o
>   obj-y	+= runtime_instr.o cache.o fpu.o dumpstack.o guarded_storage.o sthyi.o
>   obj-y	+= entry.o reipl.o relocate_kernel.o kdebugfs.o alternative.o
> -obj-y	+= nospec-branch.o ipl_vmparm.o machine_kexec_reloc.o unwind_bc.o
> +obj-y	+= nospec-branch.o ipl_vmparm.o unwind_bc.o
>   obj-y	+= smp.o text_amode31.o stacktrace.o abs_lowcore.o
>   
>   extra-y				+= vmlinux.lds
> @@ -66,6 +66,7 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
>   obj-$(CONFIG_UPROBES)		+= uprobes.o
>   obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>   
> +obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec.o machine_kexec_reloc.o
>   obj-$(CONFIG_KEXEC_FILE)	+= machine_kexec_file.o kexec_image.o
>   obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o
>   
> 
> Otherwise, the prompt for KEXEC could be made conditional on some ARCH
> symbol so that architectures can opt out of it.

Nathan,
Thanks for looking at this! I've been receiving broken build info from Andrew's
machinery. I've investigated and learned that CRASH_DUMP can be specified without
KEXEC. I also realized that s390 originally had this right, but in the conversion
I did, I got it wrong.

This v4 series corrects that by having CRASH_DUMP select KEXEC.

The new KEXEC looks like:

config KEXEC
     bool "Enable kexec system call"
     default ARCH_DEFAULT_KEXEC
     depends on ARCH_SUPPORTS_KEXEC
     select KEXEC_CORE

which appears to be equivalent, I think the CRASH_DUMP issue is the root problem.

In a separate thread with Arnd Bergmann wrt/ arm build issues, he identifies
similar problems&solutions as you did, but points out that CRASH_DUMP might still
need some refinement; I'm looking into that.

The goal really is to make this series to result in equivalent configs as before,
but there are small problems in the conversion that are showing up that I'm working.


> 
> As an aside, is this intended for the 6.5 merge window? If not, it
> shouldn't be in -next at this point, I was surprised to see new broken
> builds.
> 
> Cheers,
> Nathan
I'm not going to pretend I know when this will make it...
eric
