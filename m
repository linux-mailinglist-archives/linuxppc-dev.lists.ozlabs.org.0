Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3642373214D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 23:06:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=JDxsUM3e;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=yrqQ5n5N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhvw90XyXz3c1g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 07:06:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=JDxsUM3e;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=yrqQ5n5N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhnY75b9mz2yjj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 02:19:07 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FENtdD027075;
	Thu, 15 Jun 2023 16:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=jGwMFKnnV6C1NIzvIxAxka4Zj7yialHzT7lxZFOD3NQ=;
 b=JDxsUM3eQ/DynV6Lzs33EFg1/3AZnqIDZF7DxSe7Hsb2GQuzmsP9wO1faLdK6zU+q4zw
 Bn6iq2mIUv4c8jAajADXLKHBAa7lIuAkXOenulir4R8SByUbKWyJzRCvDKFqwRmLhZGu
 mjBDfn4zFQbFZk+Hdglio6H9I1nMHbZhQvJw8wd1BtShxZFz78FdzTq3tdThs0OWV+kA
 5+JCXerTwLUbf8D7JRlxt+xE2/dHP2uH2v3rIej45kvgS2I0k7j+gdIMT/PS7yDetQ9T
 mB3sT3ZP3xLZOpZXDspBnIDebP3fh/7KydwvU6XzigmUpVgp4ulcWKy6gPFxKL5QaKXG 5w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fy3jenw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 16:18:39 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35FF0TxQ012461;
	Thu, 15 Jun 2023 16:18:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fmddyp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 16:18:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+R6k83+RKvlVomZi9Aw3HPCCQTX409mZtCpA4BOOJdD/a0LVxrg/HvueTinu/CdEk0R585OZ1zopVohEKdgC7zmsW93IEgC3CU3aN6YXaatWT9S5mq3kZ4DYeQvWVTOcZaEKG8aMmRJOfKabn4Yq9EUfCZ5iAtVnJyFToVef3uyerzIkR+QAJIRaDB0uND5dvQs2sgDNVgJAWGpM4jaAyARalssqtbK2MUCpz1w9NPRPKLrS64LvtrLAAPld0puA4v3Ot2nTjPwOUGEirdS81Ke174sqFzZ1fFQ7oQu7RkrNqBlioR/m/4g2mfZ0H0Z9IYfLt2j9y2Ci29TybcMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGwMFKnnV6C1NIzvIxAxka4Zj7yialHzT7lxZFOD3NQ=;
 b=i0QZuhbcoiDwFfWLmQCGOabxiFrBha9ibirAhmvCTKWdhPFuyxpbYWQ8Xm46hItMtKs8zNDAT0dTlJPhvza/ZS3jB29fDeqGzdu4ssiX5dTQqR0B5SLtrOq17G10G7cbLzOwNP2rnVzCvEVRV7jv//J06w4q31hzIV9TYN+ZwknmAiuvMKN1jXiQZD1PtAwtqGfoLgA9o4pKDNoL20Cgba+DFEupABS1FuB0jX/0Bq+svBRyKLSA62xVwLLgag5yhj4yOiDTpcKvAvKy+AEup7guemqoLWcWx86DVJ9NGBp6hRw6gdDx0OjuhoqfrNL/aQcYijvvRET3oiuzG0Cu4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGwMFKnnV6C1NIzvIxAxka4Zj7yialHzT7lxZFOD3NQ=;
 b=yrqQ5n5N0OsA9bBNJcCglYfgRidqMqmB0iVmS5UcqrFwQ4JkKrc66xt/xAS8ZMJazjC4840M68wlr35ARynKFGdvl+1ehiYIHq/rUxdz8CTcR/PR2YmEabH5eST8xLq5xm3+LtafRcPYEvdVslNcHYnCWOmQxxHKbU5J8VO4lfI=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SJ0PR10MB4527.namprd10.prod.outlook.com (2603:10b6:a03:2d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 16:18:34 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.025; Thu, 15 Jun 2023
 16:18:34 +0000
Message-ID: <910353c4-c93d-8a97-eb0f-943b24480994@oracle.com>
Date: Thu, 15 Jun 2023 11:18:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 00/21] refactor Kconfig to consolidate KEXEC and CRASH
 options
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Kees Cook <keescook@chromium.org>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <202306131314.EFA558B7@keescook>
 <8a97f096-2bdc-0298-a1c5-8d48dbf94179@oracle.com>
 <87ilbpflsk.fsf@mail.lhotse>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <87ilbpflsk.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0484.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::9) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SJ0PR10MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: f1115413-e200-4d9d-5e7d-08db6dbc2ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/NactguzKpQBWlUqURyrC9Dk6HBVd+JUg5Iy9xjxddM6nSvaUUs4GfPlev+loExI9mUGvMME6eElkxbbvMj7OlpzOv25iE2jHnmowy9G5CayeS/p4Fb4YeEBgTgDiVJaY+3weOy8eO1sLhFYDcdtCPGHCoJEQ4KQMq1dqGaniV+QTUmH6WObYoru+GyVuql/Njee+uBWGatV7mS+SOcEvDJCHCJ7kFi9Q5Rq+90iawB9vVPaPJU3qsepDc4ryyGzze8k/HF3cM17BN+EizlieV43NieKeY3eJN6fs+BJ/2IoxiyunquBzLQZYPL7jgiN8fpNzmz/qdHnIF0hfSZCNyIwT9sZYuPisWOTSc1BKgpAtaRPF15FuvHxi7vmi5T9qjBtNkkFjSqWua6rhISuYnMrOATXFjqzBIn6UcBMY5VP+ofNbzT6fKRkh/qYvoNVR1XOtHI4QxutZd9CVZLhmDsaaDnjTqdmWdW+QUB8zcIqT8orDyT2zesJQb7dsYr9xBvm4jnxOFDDkkZ16hwCYP1gFZVRA5QuRQCNZFG0ocDkKXKHbSlmh6puUTKRuAKNMcoY7hsDkDxK16SE5dZvxYbgFcZbG1q87qxFvoaiTtZArM5WSGdQfnlXnD1zA/OqMly9Isz0R28SMRBnu1Nd6g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199021)(5660300002)(83380400001)(186003)(6506007)(2906002)(31686004)(7406005)(7366002)(7416002)(2616005)(107886003)(6512007)(41300700001)(8936002)(26005)(8676002)(6486002)(31696002)(110136005)(316002)(53546011)(6666004)(36756003)(478600001)(66556008)(4326008)(86362001)(66946007)(66476007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SWU1TUxvUHJYdW5OYVJVVzlFUGNUQUhGakMzaGYvQW1sUUd0dGJKZ2tIdVRM?=
 =?utf-8?B?eWJsVTFZK21JdXUxZzQ3T3ArUG9xTnh1b214T2ZBZ0xHQlkvQlkrV3pKSjBu?=
 =?utf-8?B?aUFkamZHWmx0aFVDY0E0aEUraXRxNnNMRWJRaDhQZmowVmszczdSclFVNjc3?=
 =?utf-8?B?ZE1uaWtVQi9zd29ENVFwVTIxN2RrTFU0OVYyV2E4VjZHVUt4L1ZSU21EUE9P?=
 =?utf-8?B?NGx3YWQwNTdRWjlkc29Hb09XQmdRQXUrejJxcy85TXkzT0RRNG1NZDVkZC9l?=
 =?utf-8?B?ZVpENFhNenA1OStuQ0xDS21VZ2xoNHo1RzhNSFlTUXgwcm1kVEJvSWZNUVVa?=
 =?utf-8?B?Vm44M2RxeG9GdVVCMDJGRXpPVzBSNExrM0VBZjRacVRhZWxxYUxESGNpZ0RZ?=
 =?utf-8?B?VWpQYnNsRWJPblNzajlpWExQL0pIa1dqd3ZGbGFESE1JMDIrU1Fkb21oVlJo?=
 =?utf-8?B?dHZoTDU2R0Q0YnR5MVR1VVRVOVlTNTFWQWxzM2hWUUhjblRZUE9pYU5KZDM0?=
 =?utf-8?B?T01HaW1pendwUy9mREVQTlRsMVlaL2Raa2VBU3B6cDdXTHhkNDJDazU3TGJw?=
 =?utf-8?B?cWJrT1ZLQmRxeHNxUUo4ZVJ1TTUvWUlYL2REeExQV2FMNW9Ha3NHR3IyU2dt?=
 =?utf-8?B?VlBFZzdaYklVK0ZMb0tSbFAwQ1dsdDZtMWgraE1lTGxsdmxaZk1Ya0hkR2ZD?=
 =?utf-8?B?eGhDWnF5NnBibk1hZE9mVHVseVNOYTNUbHR3TmNRcEF3ZTk4RjNpOTZHdHBs?=
 =?utf-8?B?MDd6cEJLTzR1NzVlZzhrTGhvKytmeS9ZL3VMNjNWNWRLeEU5RUxUYzltT2RI?=
 =?utf-8?B?R3JkNkRLWjQ4TmxUQnpUQmdQa0dhU1NQTGtKeHdXbE5UMGRmVjRkQW81YU1O?=
 =?utf-8?B?US9QL1ZsMVFtZWxlM0JGOUdDVVM0WjVWcndaWXBnOTdPbkRDVEw2Q0lFSmR0?=
 =?utf-8?B?TkM5aStJb0JOWEsyQW9sNlFKOVl1RUZEWVdzTy8xdFhkNjZMZzBHdDN3aHRJ?=
 =?utf-8?B?K0w0MjBnSXVwTmR1YUkvVTRwTkovWE05YzN5QVFKbjZzbzQ4aVZuczNNK0sz?=
 =?utf-8?B?NFVLUmxhVGxVMWRsYkNSOVFkRk0zbnB5TXowMFhKWWZheWVialM5TlU3OU5O?=
 =?utf-8?B?d0FFN091WVd1dGxUTmczdm5OWFN5cEVjYmZvak0yOEtMNktreHFyTlRIanRs?=
 =?utf-8?B?UTNtOVZ2TTBzZy8yRDB5bHNMcWtlOXhlUEJaMExDVUNXV0JDM25TankrNVJI?=
 =?utf-8?B?K1BKTUdEYkJTNjV1YkJTSG91VVcwNGVaRmFsZDRkdDA4djlRY1Joblk5MVZC?=
 =?utf-8?B?Nlo0MEplTDE4TjdoMTA0a3lPZWxkVzFuemJrUVpWbGsyaUtmT0JSTjIvZ0d1?=
 =?utf-8?B?b1VPTlJISjVuVnpZcTZCcVlZbk84cEF0UEFsUVprd3Z2RzJERjFoSXhUOU4x?=
 =?utf-8?B?cW9yellWa3U2blczREoyQU1yQkNVL0pmNFpUUGVTRlBaVStTclFlazQyaTcx?=
 =?utf-8?B?NWx2eWFXMTI1Vmc4cFZHR3UycUFSV1ZKeTNjeW05OVpXbEF4N3RuQ0hsMWZK?=
 =?utf-8?B?VUI0Q0RoV3BzSGVHRWJ4VlF6YWtLTW9yaG5RS3VDNFMzeHBVVHJuQlRTVmRN?=
 =?utf-8?B?UVdzZStMcVZyU0tNb3pYZHVNV3VsSEd2c1g3enk2bG5yRFU1U2xwYk40NFhQ?=
 =?utf-8?B?MzVOdnZyTHl3U1BuRHQyQW1pdEVrR20xUTR2WDhSWEJNVEx1QXkzK2xITCts?=
 =?utf-8?B?c0ZyRDdLcXZQU1dzU3dSN3ZBM285WHQrY25XY0ZqdVg2SFl0RnA3S2dPK2lv?=
 =?utf-8?B?MStwUVNmbU1Oc2czVGhZdVZlL3BhemtFVkFKUmJHSlYrZWUwWU80UXFHdGgy?=
 =?utf-8?B?M0NIMiticnVmRXE0dm5LQ3V1dHFpZERnejJ4b3gvbm5tdFVzbGZnUGwrN0t0?=
 =?utf-8?B?Nm5UZ3JZaW5jOEV6VS91SmNpK0tRcjN4TWhmcSsrOUlFeWZrTFFKbEc4VkRN?=
 =?utf-8?B?UUxaNHpwTzYvTU5Ca1A5ZWgrZ3RZTDRpUzVmRHZzMmZEMW5mSnFhN3FuSEhI?=
 =?utf-8?B?TVdPLzZia2tzTjQ5NXQ5UmFZU291eGgwdks3STBPYlVoOHFHM3F3cDZhVFpy?=
 =?utf-8?B?M0FRRjcvZTltYzJHMUxnMjJ1RmlRUldET2pGeHRTUEZRRzlncGtFNXYyYXY2?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?MzIwamdSMEZCcTgra0FLQk5CTWd5TURlN1NrQVM0aFZselBlTHArK2h5T3Zs?=
 =?utf-8?B?a3lncVRDdGY3eW1QbUkzMFp3VGxkbm45VkNRQ1ZNaFliNE13VzBVanRhSk5t?=
 =?utf-8?B?UGhwcmV5V1ZRdHFIa0oyTS9COVJuaDBKWi9JcDIra0EwWi8xdlNaSUJpRFVk?=
 =?utf-8?B?b251U0xFZ1ZhVWE5d1RVMU40M0tCLzVGWldoZnRvSWhEN3k2VjhuZFhCUWdD?=
 =?utf-8?B?U3F1SzErVHFUMzR3anU5Tis1ckVqcVdEUmpFNHpFQkp5aVRKVnVwTGU1RkU4?=
 =?utf-8?B?RGRZMldQK0VUUDNVUE1udTI4WTVPSUhWRzFqK1dQeUU3Z3U2eTdKNXZHL1NJ?=
 =?utf-8?B?Y28xKy8zZEhFNnZsSmd2Q1FoMklkOHpJVkVqWFcva3ZuNm5TSU5RRDhldWts?=
 =?utf-8?B?UGNTVmRzc2E5ZmhoK1lzUG9LOFU1WGw4SE1aVW9qb3NOU0pDUEZRYXMzWC9Q?=
 =?utf-8?B?QnFrYkFsTXplNGJjSjd3TDg0VFRaSnU0UlV0dWcxVDhxTVVtY1BpaTZCeEsz?=
 =?utf-8?B?Y2VocHVzTkRnR1ZQWkFnTnphdjBoTUtiWEdQQjU4amdWckNjbkNTTzdjQkxo?=
 =?utf-8?B?MDdTU0xqa3ZDZ2thdllpOWZjUGx6em0wbUlLL2FvUUZHT1dlTy9lKzZBYkhH?=
 =?utf-8?B?WlVWOTZXOStKYTBWOEpUc0pVUW9tdjlrWm0zMW5MUUpDbVRTcDgxeUVrbXpm?=
 =?utf-8?B?eisvNmxPSVVOUjhxQkQzRVFaalIyZGtWdklsMm5MWEp2MHM1czI2R2pXNVlw?=
 =?utf-8?B?RUtzTldXTUxVbWtIOTZnVGRDUTZKakpoYjFSMWFnSXdsVE1yQW5EbXUvQmo0?=
 =?utf-8?B?OTlCeHdDcXR5TXBUWFJlMUYyaGhoZGpSOXFmOTdiREtNMk9hVEVRcGJmKytX?=
 =?utf-8?B?Z1hBSWlSRFl2Sms5cHl6b1dIVFFXSGRtZjh2QnFpbDJna3BETnJBdXByV1pa?=
 =?utf-8?B?eE92L25lejUzUFU1dzRuMk8vcHhlMi9zd3BxbHJsT09MWWRqVEh6L3NRZklO?=
 =?utf-8?B?WTdVRjJUcU80UWs5SE91SmhSQ3VzZUFyc2I0YWt3L0NjTkNWa3dTdnNvYUlG?=
 =?utf-8?B?UjNnV280c3IxS21sTmRYZ1pQV0d4MWFZV05QeTQ4WElrRERTWjh0TE5Vbzgr?=
 =?utf-8?B?VnJlVVJSbkZXeHVYd0pER2pqa0FIeUJhQ0tFZ21kYkc3UkVIMzJLTWxXRDdn?=
 =?utf-8?B?Y2NLOEc1cCtHaFFubHBpNVFMZ2JtZjZTQ2RxQjd0MTVIdzBwRmlVT1RSZDdk?=
 =?utf-8?B?c0pKU1RTTDBSQWJmYldmbldIcDkyb2xxeXNSbmprcmhZOVlReTFyOXVISVZX?=
 =?utf-8?B?ZlZOUHRNWEQvZk9IaGQyWWVzVlFIbjkvbjRtalFxeHZWc3B2blpoSG9YSTN6?=
 =?utf-8?B?L1V4Mm1SdUFXQmo4ZVRPTG8yalBkc3FINFRQckk0bTVaK09VZ2hoaWd5b3Uz?=
 =?utf-8?B?MzRFeFFnenlUQisyalBkM3QwSHllOHJsUEszTDB0bEdyMVRMSnpYVjVQN2Nm?=
 =?utf-8?B?ZmRTSk1XdEJLeFp2cmVWUXVWSk1LeWQrd3JLenQyMW4rQzVSN21hUUxvZG5M?=
 =?utf-8?B?UitLOVpxYVA5bVFqZHB0Wk1QVHJocE9BcjJaVWNIS1F0LzZ4RkEwL1daV05p?=
 =?utf-8?B?ZC9XZTltaHpjZDdCWU1pYklNWS9vZXI4VGFKVFVnSXFQOGxKVmtVS0FtdUUz?=
 =?utf-8?B?d3VObVJTSzdlWFdRcFdZSFVxU1hHTXRmWU9odzB6TEw3T01OMlJTbzk2cThY?=
 =?utf-8?B?dlNQdk1rWlY0cE5zOHoyRXBTRXk0OHJpTlNxdUNzeUdUbklXem1LT2JHR1cw?=
 =?utf-8?B?dEgvTkdETmdqL2twS2pXakZOQWt6a2ExYldPY3BncG5VemNhcUlyajIxcElv?=
 =?utf-8?B?MVZxcVA4K2pLR3BFZWNtN0ZrWCtBRW5TUThldEZXRTNaK3U5dmlSSlBDOGNv?=
 =?utf-8?B?dXE2M2RuSkk3Q3BscXQrQjZVb1VaVFZJRVhSV0prZ2h0dkxoMDlYdVoyOEZP?=
 =?utf-8?B?bVE0ZGpVanE0UnRSOG1uK2I3MXdYb2xQNUpldEZpRVoyeGY3WjlVUnpRZkpv?=
 =?utf-8?B?TzJYSlV0cHVuTzN5R2VIblB3RUE0b1VOTWNjZ1FIbUkyWmVGQk1tWjJOTVVw?=
 =?utf-8?B?NjhQT1RKWmdIdTR1Z0JLcnBDNCt0cFpacXR6Q2RCUDN3VUNqYkcwaVQvL0NO?=
 =?utf-8?B?T2kreTZZQkNqZUp6T3Q1cFZ3cHFKQlRmZXAva0tFMVIzaGUrNW9vN3RWekJv?=
 =?utf-8?B?dHV2ZzR6MkdWSnFNTHhFWEpQVTFCRS84YlVPUTRHQk1RZkltTTZwQUErWmxa?=
 =?utf-8?B?NHBOMlVMY3hRMy9weWZwNFZ6ZkN4WHdNSG1qbG1NdFRQT0NWN1ROeEdFaHFW?=
 =?utf-8?Q?nLpFS1sAtN2DgFCLlujYQfo6PVWDBK5tA7fV3TtKTzjSp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	/6dmyMLQAjVao804NfXLoh0T5Dve+LcDIBAp8j3DrQo81Mki1hRPFV8zGLuKSEtzfyfePGubtc6BX3ndRj6CXVwgQZG8F5Cp8DY3Al+x8YcZpMC2FPiCBnWh0x+Yxqu9xCJGzK/bV/Sp5EEglQQrEDFI8jgvOu/ZbAiU2ZqmguAtjTLzb9JLgFa/C8wQHaIoijqZUHwvRKKWTG9WwfTKeE75hFKfPUJfPm6dfTwy4WvN95HgjxQtoDFfiIB8HQcCufhnSAtMeKTgHwrahsw9vpg4ytO5NDKesyIY4lhcP23acXcYlGHsUulkERxhmFwDuyrSj7AdBD8yMNt53HrEjPaPHdzYOHhfDaOjdRAalmul1RIkDsg76D3DydlbmG3l5PPQN3l0uIKRUTHJhqfYFCvU+yqBrY8g+Rgfa2WnJhDFU37TcxgLYUIgM6p8RimFffbNirt4vdd5Iw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1115413-e200-4d9d-5e7d-08db6dbc2ae7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 16:18:34.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkrIhy8EyGGd9YFJnog7nu7jUxCHa9NklGJbls6lzdF5nXcXEuNFe1g6gdVFFD/+2TNyh2Rv03AkYK+rvOPyQm/dYP4e8Tb3MuOJJLUytVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4527
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_13,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150143
X-Proofpoint-GUID: PM4XOxdWs_K8kE2KpkkhXJIBYpBHjENy
X-Proofpoint-ORIG-GUID: PM4XOxdWs_K8kE2KpkkhXJIBYpBHjENy
X-Mailman-Approved-At: Fri, 16 Jun 2023 05:50:10 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, chenhuacai@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, ziy@nvidia.com, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/14/23 22:26, Michael Ellerman wrote:
> Eric DeVolder <eric.devolder@oracle.com> writes:
>> On 6/13/23 15:21, Kees Cook wrote:
>>> On Mon, Jun 12, 2023 at 01:27:52PM -0400, Eric DeVolder wrote:
>>>> The Kconfig is refactored to consolidate KEXEC and CRASH options from
>>>> various arch/<arch>/Kconfig files into new file kernel/Kconfig.kexec.
>>>
>>> This looks very nice!
>>>
>> Thank you Kees!
>>
>>>> [...]
>>>> - The boolean ARCH_HAS_<option> in effect allows the arch to determine
>>>>     when the feature is allowed.  Archs which don't have the feature
>>>>     simply do not provide the corresponding ARCH_HAS_<option>.
>>>>     For each arch, where there previously were KEXEC and/or CRASH
>>>>     options, these have been replaced with the corresponding boolean
>>>>     ARCH_HAS_<option>, and an appropriate def_bool statement.
>>>>
>>>>     For example, if the arch supports KEXEC_FILE, then the
>>>>     ARCH_HAS_KEXEC_FILE simply has a 'def_bool y'. This permits the
>>>>     KEXEC_FILE option to be available.
>>>>
>>>>     If the arch has a 'depends on' statement in its original coding
>>>>     of the option, then that expression becomes part of the def_bool
>>>>     expression. For example, arm64 had:
>>>>
>>>>     config KEXEC
>>>>       depends on PM_SLEEP_SMP
>>>>
>>>>     and in this solution, this converts to:
>>>>
>>>>     config ARCH_HAS_KEXEC
>>>>       def_bool PM_SLEEP_SMP
>>>>
>>>>
>>>> - In order to account for the differences in the config coding for
>>>>     the three common options, the ARCH_SUPPORTS_<option> is used.
>>>>     This options has a 'depends on <option>' statement to couple it
>>>>     to the main option, and from there can insert the differences
>>>>     from the common option and the arch original coding of that option.
>>>>
>>>>     For example, a few archs enable CRYPTO and CRYTPO_SHA256 for
>>>>     KEXEC_FILE. These require a ARCH_SUPPORTS_KEXEC_FILE and
>>>>     'select CRYPTO' and 'select CRYPTO_SHA256' statements.
>>>
>>> Naming nit: "HAS" and "SUPPORTS" feel very similar, and looking at
>>> existing configs, "ARCH_SUPPORTS_..." is already used for doing this
>>> kind of bare "bool" management. e.g. see ARCH_SUPPORTS_INT128
>>>
>>> It looks like you need to split "depends" and "select" so the options
>>> can be chosen separately from the "selectable" configs.
>>>
>>> How about naming this ARCH_SELECTS_<option>, since that's what it's
>>> there for?
>>>
>> I'm OK with this. Let's see if others agree?
> 
> Yeah please rename one or both of them. At a glance the difference
> between HAS and SUPPORTS is very non-obvious.
> 
> I like Kees' suggestion to use ARCH_SUPPORTS and ARCH_SELECTS.
> 
> cheers
Michael, ok thanks!
eric
