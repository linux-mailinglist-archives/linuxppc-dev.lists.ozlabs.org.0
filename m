Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB608FE2F8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 11:35:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=e3yzBN1O;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Do9o0dqw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvzh93xHCz3dDJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 19:35:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=e3yzBN1O;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Do9o0dqw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 4351 seconds by postgrey-1.37 at boromir; Thu, 06 Jun 2024 19:34:24 AEST
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvzgN1jt6z3cXy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 19:34:22 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455IwZ3r005217;
	Thu, 6 Jun 2024 08:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=LE63SH1E8EoSRpuw1L1WTQKWGaPC/kbYl096JH9GvME=;
 b=e3yzBN1OA774TllxbI8jBEgRFuUoIov5ZBKAF07nsG0stJOfju3j3bMUg98Zvc/Jtv3X
 j4tTpg4A0RrZtpVGhG2IU0IIaOPaSUOnC8ATfvuLs2A6ZGXtW7QElx4/GWNZ70XkCz/K
 Qa/y5Q7vBq5lQvTk+fDMJKirgY66ecwLxjCD8RXM4oTOr4raZFhdeTk6qm2lnDxZsMRM
 aoalp0r3gW+JwtQ4KMrZtQPgrGhyu8gVH5kcNWNjlLPCRj70XyUgcmj74LxA8FzO+RfD
 0jdoQK8+02Bpo4yUnQ4MMe6o4kN4Yh9hGa3wKoDqpC4xO/Mi4JFQkPf5BVrFnlWiakfG QA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbrsaxym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jun 2024 08:21:21 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4567Hbvt005485;
	Thu, 6 Jun 2024 08:21:20 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrmg5kby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jun 2024 08:21:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1mlVgGUzujaEtwUOKqB3gMn4F6ArgkwYdCGJ023zgYWxAWKyCEbYZsbbEFTfXRmUdQwd/sSByOmbTRI/2o1PxZRrqbvgmd72kdVfg6WMrJ9MOPGItNQr3WBoBNGp6t+BvkKQJiJOr1q1aQI4fl7SeWWkpF1Kr5+4+AfWb7YsZ7A3X6mVmC1jeRkKtyVYz9JUl75qGZ5hdwjAxPNdTMUMRjnaW4zMf5svJilgnuZ/eEsP9xUIVqOVqRuOkTAbsUWEgov7LQFz9ApZJ4yQs/NIYACzhENbNKpVlky6hs8VRWvqYk2wqUGopQn+Yh/FZSLkOtPBu4SInM0VmfsI647qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE63SH1E8EoSRpuw1L1WTQKWGaPC/kbYl096JH9GvME=;
 b=TolzJuIX5zRxx4aogyAQ7mq4qWgh9N3tpSvkFeNGWeUbxcsac8s73scygEaKXp9m7XwJ9SJieWf1R8YATTzMOV9RZbNRyfoK67aZ6A9KMqI1tuc/O/Q+/2n3g8T+V8eLO7AVIDLGQdL6DAUUfE0rY9iai2PtG8Okl5jU150pQPEE/iZ1VbE3ncO3cCLpz5VTVlNLiJHHju6UaMoFfF1RLRqrG41G8dVar2gUJRxufGGrkVUKmaaY90q/D8OCFn6dMtyEPu87h0OcPwf4mi2QCJZ8LW46pyZmk7xd5TZw9KRXr/+domiqCv/Eqd0BNfAczWk5ZyqXZjG3Vvb28Aff4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE63SH1E8EoSRpuw1L1WTQKWGaPC/kbYl096JH9GvME=;
 b=Do9o0dqwOWDrm6U87RyLJOYQ/qMBxYYowgh2+FdnE2vjScGiVbZWjhoou5WOrrWwG27FhGSn9WEtQlanKALm9gGB3leEUD+JIyVmEMzzsEnLN0txOYoxgMblZ7oCVJA62ogSiZbdrMOc2ywf/5uexj1wmveWxSO8UTzrCOO8j8Q=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by SJ0PR10MB7690.namprd10.prod.outlook.com (2603:10b6:a03:51a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 6 Jun
 2024 08:21:18 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7633.032; Thu, 6 Jun 2024
 08:21:18 +0000
Message-ID: <0512b259-f803-4feb-a5bf-0feb7f7b44da@oracle.com>
Date: Thu, 6 Jun 2024 09:21:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] scsi: initialize scsi midlayer limits before
 allocating the queue
To: Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@lst.de>
References: <20240520151536.GA32532@lst.de>
 <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info>
 <8734pz4gdh.fsf@mail.lhotse> <87wmnb2x2y.fsf@mail.lhotse>
 <20240531060827.GA17723@lst.de> <87sexy2yny.fsf@mail.lhotse>
 <87wmn3pntq.fsf@mail.lhotse>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <87wmn3pntq.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0020.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::10) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|SJ0PR10MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ef0cd4-4869-48a3-1e80-08dc8601a3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?eWVYRk9NLzFMcXAwZmtBZW13ZlZXMEJJeTRhNWdKK3UwRm9CTkh4eGtQanNu?=
 =?utf-8?B?aUlYajR0WDRFUTMwZC8rTU55UkxTdU8zYWcwWklpekNDLzhBOWRGOFpIY2dq?=
 =?utf-8?B?eXBSc1IwbVhoU0FnT3YybDIrUUpCYkNmWVdvYmloay80eWE4ZFhrVmQ1V2Zw?=
 =?utf-8?B?M0RURitxS3hEbkZEVDZQQnpxWVMwN1BRRnhGNm1mdzlNQVdqWkIwV0FYVGdl?=
 =?utf-8?B?Q2hJM0Z0dEFhNW9WMWlMeGFoL0c0aTMyeHN4ZktoUDBvMWlBODBla254a3p1?=
 =?utf-8?B?SHg0eW42ZVBhUk9uWFdPU2J5R3NNd0ZPSndSbFZBTGRuenovck00ZVUzdThy?=
 =?utf-8?B?NFVLRCtJN0Y3bDRLSTRQdm5HUmpxNnFmUyt5eFA3SW04ZWd1bU1EWUNReThG?=
 =?utf-8?B?YTBubWVwcXJCbFdyWU9Mbk9YRTZCRFc1WmRmZ0pyREhvb2d3cWpYcTQ0bnVM?=
 =?utf-8?B?OXRVQTJVcW0weWFId2ZySVZzUUhBakxsWUU1cys0UWlEbGJUcjlhb21xZVN1?=
 =?utf-8?B?cWpoZzFBalRkczBCTW1UYyttR3pWb1hLUTd1MmREaGJiM0QxMnhuRUFNTTJz?=
 =?utf-8?B?RWpkVzhtOHNPTGVKRXpvZmpHcVJpcDdsdUlHVTArQmJ0TXlaVDUyejBUOFAz?=
 =?utf-8?B?c0lHQ3Q1RXNHRXVjRFNwYWp5cTV6V2xJbXFDS3Vrb3hWVW1DRVlGejRDdXh2?=
 =?utf-8?B?OGp6Yzh0WjN2Yi9ickZoc0N6N0tsd292d1o3bzEwaE5QVWRkSDZWL1FoSXN6?=
 =?utf-8?B?MEtxWUVxUWxBTGt5WU1GVU1OMTlMcXAwdnhBNHdCUFUyb0FZeThyMDlSc3FS?=
 =?utf-8?B?ZmdlYUhUdG9QOGpQTEpESEQ0eUliYUJiOWNNM2hDRWNXZjE3c2FNRk1DeE1o?=
 =?utf-8?B?N0tzU1V6V1FzMGhkd2U2b2ZRMEM0YVJSSG5qOVYxZUtJTXVMWjRTdmdmZC9W?=
 =?utf-8?B?aFY1ZWhyd01sMGJRbHJ0djhYMkdJa2x6TDRFZFNEL3lOandYV3FnMWUwRU9v?=
 =?utf-8?B?bksrSTJFZXZOT0R4b2pqbzY0ZHlYc3UxdEZPUXJGMFlqWnIvMk9rVkc3Z0pN?=
 =?utf-8?B?dE5JWU1QbFdlMmtqbVpLL28raXk0aFVwcEtSUmI1MUkrOVNNZ2ZkNVBPaVZp?=
 =?utf-8?B?MjdNUHQzbjRBdHg0cFVacVBweEpVaUYvVGU5SW5DOTN6Tyt2MVZVNmxRcWE0?=
 =?utf-8?B?aXZDWGJOQUxFclJreTVBMS81MUNmVkhLdHhWNE9ucWU1WUFiMHF1R2lwamVT?=
 =?utf-8?B?MFF2b21ZZnM2cEJYaG4vSUhIZ25zR1E2alhGemlsM0hlWnJFQlJ2TGJnT01M?=
 =?utf-8?B?VGRueXRHcjVHSGhtSCt4R01MRDcxdHgreGhuYTJVUnROM3dkZnhRZWhpWk1r?=
 =?utf-8?B?dzRncFhjRWJrY1FrM3NjcGJjdnlVb0JPUWRHTUllRWdLRGxOVjEvWXdIS0ND?=
 =?utf-8?B?YlVyYys0dWdPb05XRWJ1T2c4eHF4V3Fsb29xMHlXSHBuQWgxUEdBSkJuUEFD?=
 =?utf-8?B?L29Xb0I5cjI3VEhFWHVTTEJnRUVkWWhPR2NMYjBzY284MDRoNWRXblh5a1U5?=
 =?utf-8?B?U1Ztb2JRLzBXSDVHSklZRWNDUFhVTUNEa3FZOEpQb1JRbnVYc1pZMEV1VTh0?=
 =?utf-8?B?UmJmUVJtclNueVh0a0tlM0tpNCtxUk9ZTk0wbGllMktWV25Ra2p5UDZuRFI5?=
 =?utf-8?B?VU5JWk84ekFJZm9PNW9YbE05TmZLbVRtWXA0aG9XTXF0NHk2MTVNM1l2R25q?=
 =?utf-8?Q?TshKxf5WhyxGN7PJvBVlSl51HGFcKyo7YdddsYq?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?VlJFMmtaTUR4aW5SdFhrektiVDRhcTFSbkp0MElVaDlVZ1hpUGdpdzhvck9C?=
 =?utf-8?B?UW5Ic2xEeDhTb1hPaDhsd2REV1BKQW9iUU9Vc2R5UTYraWJ4WWVSb0swRUts?=
 =?utf-8?B?UFBSSEw3dzdXQVY2SWpmTGhVVVhCQ0dzRjFkcHI2cFRkaWFwcElubXpOYzkr?=
 =?utf-8?B?NGRlL2RDWDJjbWc3cUhLR0dNYnlPaEtuTUhzVkpVR1RTU3Z2TW4vQmdZN0hI?=
 =?utf-8?B?YjBUd1NxY2pOd0RtMjFCS1lsTXZzRjNVemx1a2pZMEk4bzkwRGx4Y1ZUbXor?=
 =?utf-8?B?MGVSRDExVEdDWGx0MTFMTC9SVUtxV0lRQjNlUHVOd3NDdXdvODM1dXlDd0xY?=
 =?utf-8?B?SldzK0FLVG1Da3FicEUrUFdoOGJZYTQyZVpjM3I5RzZXbzJtMC91ZVhVRjBI?=
 =?utf-8?B?U3hqOXBsa1JabWFhOE9PRG5TcDAyVTBPOG0vSlVNZHdsNTJQUWF6M0JxZVNF?=
 =?utf-8?B?aVAvMjJ2QkxhNVJxUCthTURtTVZ1NDVQSUc5dmVrK0MzNU90YlhvelkxZm5S?=
 =?utf-8?B?NmxicUFtNEt4MWJCZThCN0h1QW5YR1ZIdm9UU3NlMkRSYXU3WUo1SmcxSXJv?=
 =?utf-8?B?Zklxd2VnbTJESDFSenI1VEpiUFBtanY1djVXMzBMU3dEUlJDUUVFN0lEMDVH?=
 =?utf-8?B?UWNHVGZxSWxZNE53NWFGQVVVWmRyNkhnZUNLSk1CU2dNbHJDZG1panVqVGk1?=
 =?utf-8?B?Z2JSVFhrRCtIT2ZzM2hURlB4bVlFMnVvUFI2S09Jc0xyNk04Z3dYS21kcU1n?=
 =?utf-8?B?NXpKKzdTY0xlaTh0M2lBS0ZtQUtGTTV4bnFNZTFvZ2ppVWdoMWNXeVlWK1dE?=
 =?utf-8?B?K1h1NUtrYjRDcC9KRkMyNjNJZEN0OUkrZVd2MGxiY2QxdzMxand2NFVHcTBt?=
 =?utf-8?B?UnFHNENmeE9aOTZaWGxqajlrY3FYd3RDMHRTQ0MrY3F4Z24yeGVWa0lna0pL?=
 =?utf-8?B?dkVQcCthVGpwbTdUTGlHRTlCNTFRZ2dwUU5wd1pScXNMbG5ZM3hURzlaaXpD?=
 =?utf-8?B?NWEraDIzZGpmM2dBbEZ1SDZuZlUxSTJJMW94ZmM1TnhPczhpdlF4R1BmRkgz?=
 =?utf-8?B?UWZTcGJPQWRRRndqYjVTcmVjeG5IWkhraW9NRC9kYmtzTFJZNDFPTXpUWUlP?=
 =?utf-8?B?VHBCcjd6elh0OW5HdFlSWGtLcUtLZ1RxM1RGaGNuaGpCRTNmRFNVTUpNMmhY?=
 =?utf-8?B?dnlvdDltditWN1M2UXFjd0QwYlJCbnQ0SHdoKzF5TWpVSjJ6VklDR2RPV0xK?=
 =?utf-8?B?amJTeklHYzVmYmlPaEJmSHMrdUdSa3ZPQXFKb1h5bXIyWVkwdHFVMXZUUG9D?=
 =?utf-8?B?ZmVoTjhCYmc1TmdhYjVMWkxFKzU5SHFxeTY5c1ZRUkZMdkJNcEpqQlhqTUE4?=
 =?utf-8?B?c3FhekRSN2xTM1RlWE9mbnAxMlB3eVFYVTRZZFp5WldRR1IvSnVsd2wzdlpz?=
 =?utf-8?B?cmc0S1N5akJVcFpORmFzMHdaLzJJVnlMcElLSUtHNGxMU0djZ2gyK0tyTDN2?=
 =?utf-8?B?aURFWmRJQ3pMNGV4b3MvOUh5dHJQWnl2TjhoM0pta1JkRS8wQjQzTE80Szlv?=
 =?utf-8?B?TElzZUJDWWZ6UFFsZXVwd2J4MDhmR2V3dkNCZ2NNQ0lQY0ZvbndSWHR2aGtG?=
 =?utf-8?B?QWNwbTVUVTczcllEN2QwZmFHMnI3N3A0UXRxUytXWWp6S3FEQTJhYjVqVnZz?=
 =?utf-8?B?Uy9oakNSMWk2ZkdXZ3hBY3ppUndaaDFqYVM0bGdxNGxRU3E4OU9nd2xXbFVG?=
 =?utf-8?B?dDA3eXhOckJrbEZKN0U1dURtVE9YSWF0bkt0RmdjQmlOeFdyWlN1NjhaeXlj?=
 =?utf-8?B?YTVORlNEV2JPMnJFUTkxNE5IZy9vbUYvbWVtaG44Yko3TGZGMDhlUmFOR1Na?=
 =?utf-8?B?aUZ5MUMwMlhqaUVHU1ZLQUFac3VFdTdmazh2dDFTTFFyaDRCdjFaQ2VHWmty?=
 =?utf-8?B?ZFU1NTlJT2dyTEZPUVVvbVliR1ZlNG5Semg1c3JHNFhLVFVPWkdNb2RnQ1cr?=
 =?utf-8?B?TTJKZnhINTBSKzl3TVoxTXNzTWdVTHZmWW1ZaFdpNVVMa00xUlE1Z2M0VEtw?=
 =?utf-8?B?dG0ybEpDa25COWFUSWRYNUdQeFpIYVhGVjBkSDJIbU04Q2FkNG1FUitheWcx?=
 =?utf-8?Q?YqKzBlSUWxiaOHoN+lBbScLAY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	rl3lgC4qhkgD4VvSWfJP3I75T679GSU+NQ+XQSLSfzXW0YeqNlvah/YdDRd0sZnFHKH8YhxqjJdBJEhxBMYq/jIhIPJYIc1q2SiFpF0rNjWwTXxKf1Wgsl3TERgcy/kxw01J6tYbj1RoN8nZVxjaTaMflcqG2KpdxbRzjA+5qaljGvQ5GquSVOi0quZEnAgol8eAyKlck1JN8LbB9I1GLj24cQq/PQ9sNoL8Fe80s01748z0dnifS/vDc3NyDIheoL4LDne9cKwAPi+oYSZere9jmjJtNFPll9dHho1MhRMnjXpaahrnlsL82Fmk3KBsQFKYOUGZMzDk1dPj0SPxGa7Yq/WwDMweogqjWm0Pr0eeA3Jm0mKd2fOF643NwUp1ajWtLE0l8zbHEcJhA4sR8Gk2EhdYS0L7uKiZGGPlNZcB/dKvqWX0Z4yKwz4YkfFirC/cgB/FuUbBrjaw+31WdOX5ppqTZlDQ6OWzttyUkaj76QTNe7nDqofvtDMgvirKJrXPpfJvxjc0EOjLgk6hLX/cKS2O5vqjh8Ka3x+UOEJwwMFDodc+q09NenticCDvfGSNU+tz0Mwonq4UP/tQFex/kb4hE3qkgMdgjlHRAtk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ef0cd4-4869-48a3-1e80-08dc8601a3cb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 08:21:18.3447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODdSBrrXRd/FyAlyEjO4GrNeEocdhJqNYxwySpu/07WvgRqPaBiua6wCy+k7fgfiUD5GJ+ayiIxRsnJu/Yr1RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB7690
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406060060
X-Proofpoint-ORIG-GUID: ZY5Q98-gcx_46MvcbeChMJWKefN8_sT-
X-Proofpoint-GUID: ZY5Q98-gcx_46MvcbeChMJWKefN8_sT-
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
Cc: Jens Axboe <axboe@kernel.dk>, doru.iorgulescu1@gmail.com, "Martin K. Petersen" <martin.petersen@oracle.com>, "Linux regression tracking \(Thorsten Leemhuis\)" <regressions@leemhuis.info>, linux-ide@vger.kernel.org, linux-block@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, bvanassche@acm.org, Guenter Roeck <linux@roeck-us.net>, Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> 
> diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
> index 817838e2f70e..3cb455a32d92 100644
> --- a/drivers/ata/pata_macio.c
> +++ b/drivers/ata/pata_macio.c
> @@ -915,10 +915,13 @@ static const struct scsi_host_template pata_macio_sht = {
>   	.sg_tablesize		= MAX_DCMDS,
>   	/* We may not need that strict one */
>   	.dma_boundary		= ATA_DMA_BOUNDARY,
> -	/* Not sure what the real max is but we know it's less than 64K, let's
> -	 * use 64K minus 256
> +	/*
> +	 * The SCSI core requires the segment size to cover at least a page, so
> +	 * for 64K page size kernels this must be at least 64K. However the
> +	 * hardware can't handle 64K, so pata_macio_qc_prep() will split large
> +	 * requests.
>   	 */
> -	.max_segment_size	= MAX_DBDMA_SEG,
> +	.max_segment_size	= SZ_64K,
>   	.device_configure	= pata_macio_device_configure,
>   	.sdev_groups		= ata_common_sdev_groups,
>   	.can_queue		= ATA_DEF_QUEUE,


Feel free to add:
Reviewed-by: John Garry <john.g.garry@oracle.com>
