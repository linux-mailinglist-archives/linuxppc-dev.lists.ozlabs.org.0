Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3304692545
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:23:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2Cz4XRpz3f5H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:23:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=UERXPbPb;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=bC6MaHMg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=alok.a.tiwari@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=UERXPbPb;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=bC6MaHMg;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2By1zSGz3cHF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:22:16 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31AHwoHP001714;
	Fri, 10 Feb 2023 18:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=tcuTgK1tCDB9NhxvpLaNvcfSJkwG9ma6hY3zbNDegqg=;
 b=UERXPbPbnI91ltvBhXoN+45LmdH1abPQl3IlTpX+pKuMwMNoaxnFRwkDR3f82p438sW9
 K9CZ4EkZK165aY7w7EMROf24brjqW7pZwxS0CtxWgKEmevp+gwnu6MZbJeZ4Az+W6CRA
 /3HQaAJI7DgrvRQXURgT79UAzo0vrKmNkV8fg3U7wgyE3/9xP44r+J/FphS2R/oLs4Cb
 7cgu9hw5Z7lq6tJvEWx/gSaAM9ZkjeM+PHlsRwlGX+qI4iVyC5W6PSVgad6M3z1MYApr
 HwQJNLpKwfM/KvgzPb4hNJ3RklOrgyTSUTiq1Zf3eQtoDBXZIW9GO3yD8R0wsFXCZaju bw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfdcp14h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 18:21:59 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31AHXAu9003037;
	Fri, 10 Feb 2023 18:21:58 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3nhdtb3e7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 18:21:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ov28ZqDEa2Hxo1NETl1/6pOqFlxXCvCLQbV11dPB5qe8tkfw7vD5ed/F+G6NHiH+FXTEDPq8Brvc+qW4S2N4G4C3hMOc8S11r7uBwlSznc/1hOUuVJyirZNoZ/RgWjbfpI30xlBbB/l82Ne9ZIDFJ7fsvKcPFOlYZrynO9PxuG0EbaBDFDfFqBPWBcr/nGhFyZcsbK70EEend102sHt9rI5W8E1i5nY0Ut5Buz/sfXoCHx0D4WVck8Dn+AYQ8HKL5tTQyknX7M5OtgxxVloWyjNIqCRdFAeWMc32Fkj3JWDIu+klTeFBGsZ7ep046O7gljRwYeRj/bxYqkh2FGaBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcuTgK1tCDB9NhxvpLaNvcfSJkwG9ma6hY3zbNDegqg=;
 b=cgNyxBmKcV9m5Q+5MHXRYNwRV8yraxRRrQoCKnltsdcpAP/3ihmsMQGEvLVSJqufRR//5/iAgqL9czmNfWW4gQ9ZwQ5iK7/FrrgJNKathVn1yLXZRpim3Uen9xRIvqbAyaxg3xFYku/uMpup1rLLnN+UtnCVd7sbRhXUBLeNTrA1boMAb5Gqmn/ev/fhCKnJNbmtyPsNigt2x82hD7eG1LUCflDG4SWB2k51SPt6uE6HiKNjy2zbCrKTKdkj/4nMlSpD7ElFIHoajDX6mLwWBpCzrl4Rva/UFYlJTVBLFcV4Kod+wF7Q67b8+GhdvdB76tySvW9sfg01JL4Wdfbl5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcuTgK1tCDB9NhxvpLaNvcfSJkwG9ma6hY3zbNDegqg=;
 b=bC6MaHMghvrPQQ9U/bjq4DboJMZkAkMNtIYRAeNu0sZfT/YtNI3vqTlzjeo02IvX43KQiTfCmgir9ZZbKCcZMerUVUaJ+/52DfAK9aeCoYbANl6qvjFPPyHQoWf1k3Em73BstpgYqblEqsm048MHfLebXq7aNAY4ha4Vtc2PMww=
Received: from PH0PR10MB4581.namprd10.prod.outlook.com (2603:10b6:510:42::16)
 by SN7PR10MB6406.namprd10.prod.outlook.com (2603:10b6:806:26a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Fri, 10 Feb
 2023 18:21:56 +0000
Received: from PH0PR10MB4581.namprd10.prod.outlook.com
 ([fe80::9013:b768:5177:564a]) by PH0PR10MB4581.namprd10.prod.outlook.com
 ([fe80::9013:b768:5177:564a%6]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 18:21:56 +0000
Message-ID: <7ab8bdac-3264-2718-e5c9-53bcaa5db010@oracle.com>
Date: Fri, 10 Feb 2023 23:51:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [External] : [PATCH v3 1/1] PCI: layerscape: Add EP mode support
 for ls1028a
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, helgaas@kernel.org
References: <20230209151050.233973-1-Frank.Li@nxp.com>
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230209151050.233973-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To PH0PR10MB4581.namprd10.prod.outlook.com
 (2603:10b6:510:42::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4581:EE_|SN7PR10MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8e8020-71c9-4d35-bbb6-08db0b93b127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ubCIK5ut3BIYmM1D/H1HDEjrwscUHX00FuZYHPE3mWTQ6RTX3XpckqYFIGz0GtbwUs1zjPnr+4QmpG1POqlIUO+tzTDphW9dDEysSKGptI8aHNqvAFvu6muuApjz73UiCqYPx0KVU4hFXfLUDTakF9qGMFao2nGfsXnl90jNrbgmzJv/C2+W2uYoGRvopJXxqEkmk5ujk0g7hCYSkYZWdbJM6MaUcM8nLPvhp7A4iSE7NGcI8OUlnlAQJIut9M+5RavOo8bb1+FWAZb5xprw9cRQUIO4wdvWnTHThFzUKdPDyT4oi1iHTJdI1KOnY2IoeQNmQBdsSuZJx98IaCJ88OjZTtxxK/3C3LQ6y1qDxIkPUiJ8fByWNru5Ma1Smv4SsLGn91SlTLcMcMyFgpJazQCsAFS8yJ12Oi3m9Txv67Xlozr8dlOgJF5O6DTpF4Siopg7/f75y3wbIPtqheJ8UBUh0WFCnBUWTpuN/3clZJAjdvMhKQH4MeLEcxXYX8Hm0q0CTvRk2gRhVmE0jOygNlURoPvLhztS3Nlt+8sK/rm2gqGONIFeuftsTLOiOBZA4fEMZsqTbEfISx0cizqhdaGfD7hUpiI/kmnjWaqhkjvhPO18Qb0l2RsWzx0yc3eSJqTf45LqgPIMvpLuUoOHwMwpQMRqc1Kx+xpjyZK4btY/Z2XEYAKv1jc8D73tEcjpPQyMctmKi6JBg9Wvu4hadWrxqMGO7rL1kYJsgnpggtmgmR+jWt48Oiys1ijVBsAmdUGDnfwZ7T1CVp5446yX+Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4581.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199018)(6666004)(83380400001)(2616005)(86362001)(66946007)(966005)(8676002)(41300700001)(6486002)(4326008)(66556008)(36916002)(66476007)(478600001)(36756003)(2906002)(316002)(38100700002)(31686004)(53546011)(8936002)(6512007)(26005)(186003)(7416002)(31696002)(5660300002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?N284YmNkZ2llNkNDN202am5XcmFnTjR0c3NjR0hkS3BBaHcwK0FRUmR3elBT?=
 =?utf-8?B?V3lXTlIvbm9vS1lmZm5rMUk1dEZZOVJTOWlCdXQxRzBhTVkzTkswTG1ocG91?=
 =?utf-8?B?K0pTUkhROVBZMVBpQ1pWT09seDIwakNvL0UyVi85bXVsM09iZDd5WmcydjRo?=
 =?utf-8?B?VTN0VW1JSHJBTjBLREYwTTgzbGtLV01BQys1Yy8vTXR3RXBvbGxPRG9pOExJ?=
 =?utf-8?B?bElCQUVKbTBveDBFUmkxK28xd01pMktFYkxKWkNDd0NwMm9hY1BXSU5SWEJG?=
 =?utf-8?B?b294elNoZGRxTDRkYU9EQUJoZTJ2VGZrN2dLekZJcU1tWE1KbUdCY05SWlVz?=
 =?utf-8?B?VkV5RWFuUkswbnBmR2xvTnB6WDY4Mnhtb0RvalNSbEhuMnVEWm0yMHpscDNu?=
 =?utf-8?B?bTlyakRaL3BUdE5jalVPcUh4OXVxYzl3WTVQN0ljQWUrL3hobWVVSHJReUhQ?=
 =?utf-8?B?dHpRaEpXenAzMVp2cWczdmhBaEMrcXlhQmt1WjkwbkMzVDBPd2tnZVprbEwx?=
 =?utf-8?B?elFxblIvQzZYQW1HNk15OHZsZENGV1FDNzV4aFpEV3hzcmJpQ3ozV3JoL0pw?=
 =?utf-8?B?RmlvVHVlVE1aamRUV2JaUkc5S3EraVFwREtMejV5V3AvRFhCeWY1YTRwemZ6?=
 =?utf-8?B?cjBrTEdNVXBGYVVha3dmVmZYWGpDQWFXdWRsTmh0dVRTRWNRaUhGMjA0R24v?=
 =?utf-8?B?WGJZUHVmUnpBYlljd0wxKzVqVmFXTXhBSzV3OXhRbERQUjhIZzJRQWxqeVhR?=
 =?utf-8?B?eGt3Q2pxTkpHaTJLRFMydWRVc2hsVGlYbW9LdEJWd1gvUDZTU0JGVzJVeGxV?=
 =?utf-8?B?K2VkTW5MbUtjclJLZ1k4Nk5kTjNpQjdrQitQU3JvSkE0VDIzZDdUVlFUY21t?=
 =?utf-8?B?U2RobjA3eUtabDltblQ5Q2o4SVRoSEt3VDJlNWFWejFpNWZFbEMweExTL2Np?=
 =?utf-8?B?d1MzMGhSSEpxNkIvZkFlb3lIdTIxV25IQ2dqRVR1ci85REczanphOFhqbGVX?=
 =?utf-8?B?RnpvTFJ5MmFSRkw0NHJ4a2hpNTRXeGNwSk94WW1ldmVyNi9kVCtaT1JYRk1h?=
 =?utf-8?B?dzkrblZtTWIxZ3VSQnM1QlU3NGFpemtUZW5qUERHR0tSbUhzMW9vZHR0YjlT?=
 =?utf-8?B?ZlFleXh1VjZiQ3B1ZUhic1oxR2pHcmNRalF4RDh6b3QwcDZoVWczSHdWQnp3?=
 =?utf-8?B?SjJFVFVLa3A3dFNaZVN3OWVaOFEwN1BlYUR6YkEyL0hSZ0E5UjJCZXpyY1Yz?=
 =?utf-8?B?RHl2ekcvemt1TU9vV2dvNTVmSWlXeWZnSytVaTh3b2lMeUVUaGlOWUoyWklX?=
 =?utf-8?B?MUlFSFBtVlh5ZHZ2TEszeEdwaTVRR2lvdVBMUTIyTXhPeTRPRCtXL1BuMTZs?=
 =?utf-8?B?cTROYnZ6N1pZY2xtVTNsT2wrdlBaWEJzL0MvNFpNbjRrTDVVUThOaVN0cFo0?=
 =?utf-8?B?cXZiZzVjOHVrUXVFV3lXOGUxL1l6Q0YxcU9pcWtwc2dlYVJGNStIMHBWS3lL?=
 =?utf-8?B?Qkl6aW83T0NuVmkyUEhlVnNNcEVFcVNmL1JpU1dtdUlTOTdldVE1czFVUFdL?=
 =?utf-8?B?MEpuQnJkaFhJZktJek1UMEMwZ2ZjYkd1c3ZuemVjeHNJS0JMTEcyclVCMlBD?=
 =?utf-8?B?TXZncHJxcUNUcDd5NU9JTWlvWDN1ckZHa2lybVZhTFd4L3dFOHdVdU4xaDR5?=
 =?utf-8?B?aHhVODYwMTNyNlNDallqQmh6b1oxVHYrZG12RjFiS3JuMEs1czVudDQwV1BK?=
 =?utf-8?B?QkIzb05JQ0oyVHF3QTRiVXFxMFNydFN6aTZYNWdKWm9TS0V4RktxT0xGNEd6?=
 =?utf-8?B?TTN6TFJZcDdTTUd3OUR6anF4cEphdld3VzJRbnRCQjQ1TUNIaXQyMnRnd2wy?=
 =?utf-8?B?ZjZlYVp2WjhHYzFxQlVzQWYvZklUcWowMzJpYW1rcWZPRFo2NzFSMnA4enNs?=
 =?utf-8?B?ZHlYckxxbXlmM2lGcjJmSC8zKzVuWlI4b1E5LzgrRnBOK3J2YVk4ZjJVNEdi?=
 =?utf-8?B?enlteHlOVnRwVjg1R080Ri85WXFBNTZoTFpPVmQzajVaaERrNFFQakNtUGc1?=
 =?utf-8?B?cG00bWE0VE52empzZ3ZpVlUwU3VBU1hzWXlZbUNteDdxZC9aOTdmOERRazk0?=
 =?utf-8?B?YWhmbzJMVGcwRHMxSzJTalFkenhSQ1RsN0tmdkQzbHBnMS9mZHNHR2dZNFJ0?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?VlpVaGdpRjI5Q1JQdUd1MVdvcnYySUFNMHRzeENGdWhqM05qeTI0ZlNRd2NG?=
 =?utf-8?B?TUUrOExmSlplZXIzaGIzODljT3B5QXA3Y2dNSWd1SWJvY09iTjJMSHZDWDN2?=
 =?utf-8?B?Z0ZOTFBKWkhTVzBQejd6TGk5b0J3SzBJaW50L0toSlA4ODlwYk96Y0x6Mk5q?=
 =?utf-8?B?ZVBKTHFqNFJyb0M3R1I3KzkyZTRYWGxlV1crakl1cGd6dlgzdFlGdVBqMlRR?=
 =?utf-8?B?STc0MkNJVXJ2VTVrR0ZLc1FDSkRFK21mNEc5K1ZId2xrcm9VNE1Bb3RmaGlB?=
 =?utf-8?B?TjNTdnN4bENmMTFkb2JZUXJOOXA1dVhvbGFpV0orSm53OVlqTHJBc0s5clpU?=
 =?utf-8?B?R2tRZmYzbGVPOFRaSUxXOExOYjF0eFkvS1Q0ZFNiNmkyMWphY2pnT2kya041?=
 =?utf-8?B?R3dKczdIRkVDdW9nVmZaa01LcHlmcC9hMTU2ekREOGFBdGFFOTlIOXpGZk5D?=
 =?utf-8?B?V1BUdHhac3BkUjkxMnBoN2h2QW8zQmNjOXRXZEQ0a25uT01iakdVeFYxNlJq?=
 =?utf-8?B?R2VPWHAzMllENkNuS1RJb3M0bitoRXpOOXB3aFRQWC9DSjlVdWNHTktEUjcr?=
 =?utf-8?B?dmRUMkcxdDFEQjRNcDZLcUkrcFlHeitVbXdoZDZMVkp5QnUreHUyV0VpZ085?=
 =?utf-8?B?Uzh3MElsQTZmZnp4Uk9oMGtNY0NiRzY3ajArMG81QzJjQzk2eGdUNkVIUzRI?=
 =?utf-8?B?dWxpSllPUjVWZW1EYTU2by9aV1E2Mll0N0txVlpNaE1ZK0MrQzhaNXdOa2xN?=
 =?utf-8?B?cU5zWkdsU09zTStuYTJCb3ozZTM4bVJsd0hNaWlvcjluZnVoTmVZM1Vnd3BR?=
 =?utf-8?B?aXQ5Z2doaEd2Y28xdm50bGdXK0VlWmFOcmRERk0vWUgyeUVXYnp5MGoyWGdM?=
 =?utf-8?B?REJ2a09mTERzRG5mZWZHRG9GTG9wK0JrVGViSFBiMVRoTkNqUjNyQTF1Rk1D?=
 =?utf-8?B?OCt3TjIzandNUkUxOTN0UEVIVGlOV2RLYU9IZ1BxYk5ZazVqZWdHNGVWdUlB?=
 =?utf-8?B?dVliRXlhZGp3Q1MydldhcmZjWWFsNnRoYlZlSHJwTHBZNW9wcElQUW9BajZu?=
 =?utf-8?B?SWtZWVQ1ai9PTWNrTk9yTWt5RjIzMkUyT24zcGxza1VsNXE2d0ZuY3ZmNTJx?=
 =?utf-8?B?TFV5UkU2MDFISkg4QjREU1BMODN0aTJLbitaaU81UmV3Z0RVS3lrYmZiTmkv?=
 =?utf-8?B?czYzN3hKQldGSFIvLzJVc2lOUW50VFE2Nzlqalh6UEtDUVJ6VWVHV1gzMEQw?=
 =?utf-8?B?emFpeUVNTXZjWFBUOS93U0VoOU1rUEd0Skd4QjBVaEN2N294cGVocC8vUE9j?=
 =?utf-8?Q?Dlaf9AH9oDeE1LeuAtSjMoynXOAdrZH0BA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8e8020-71c9-4d35-bbb6-08db0b93b127
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4581.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 18:21:56.6919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnRA/VmAcyEpcSW6A62N124I33gpkkSbXvB1mroN+6opFHw9xB/7xUAaq7G56GgFOr6Me8xvRtNUGljtm451587t1OGbecm7Lx7B1gn6Y+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6406
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_13,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100153
X-Proofpoint-GUID: g17ZJUgeCBcxD0tmqF0OneWMMooS0JJ8
X-Proofpoint-ORIG-GUID: g17ZJUgeCBcxD0tmqF0OneWMMooS0JJ8
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, minghuan.lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LGTM,


Thanks,

Alok

On 2/9/2023 8:40 PM, Frank Li wrote:
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
>
> Add PCIe EP mode support for ls1028a.
>
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp>
> Acked-by:  Roy Zang <Roy.Zang@nxp.com>
> ---
>
> Change from v2 to v3
> order by .compatible
>
> Change from v2 to v2
> Added
> Signed-off-by: Frank Li <Frank.Li@nxp>
> Acked-by:  Roy Zang <Roy.Zang@nxp.com>
>
>
> All other patches were already accepte by maintainer in
> https://urldefense.com/v3/__https://lore.kernel.org/lkml/20211112223457.10599-1-leoyang.li@nxp.com/__;!!ACWV5N9M2RV99hQ!NR9EU4fPDwxdyrb9tdBm9VNIMHSlw6dLgXCAPDSrm7ftWVNrh6JldLGzzrKyiE0xRlP5OdiGBN7PCf9gRaA$
>
> But missed this one.
>
> Re-post
>
>   drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index ad99707b3b99..c640db60edc6 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -110,6 +110,7 @@ static const struct ls_pcie_ep_drvdata lx2_ep_drvdata = {
>   };
>   
>   static const struct of_device_id ls_pcie_ep_of_match[] = {
> +	{ .compatible = "fsl,ls1028a-pcie-ep", .data = &ls1_ep_drvdata },
>   	{ .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
>   	{ .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },
>   	{ .compatible = "fsl,ls2088a-pcie-ep", .data = &ls2_ep_drvdata },
