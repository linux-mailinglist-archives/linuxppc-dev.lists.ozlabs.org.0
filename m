Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E3F4E5A01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 21:44:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KP0hd6j13z300B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 07:44:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=wlfutau6;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=IiHmEbu3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNxmz1BRQz2ymw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 05:33:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=wlfutau6; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=IiHmEbu3; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KNxmz0xhNz4xv2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 05:33:07 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KNxmz0tXQz4xvG; Thu, 24 Mar 2022 05:33:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=wlfutau6; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=IiHmEbu3; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KNxmy51M3z4xv2
 for <linuxppc-dev@ozlabs.org>; Thu, 24 Mar 2022 05:33:06 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NHr6rF004114; 
 Wed, 23 Mar 2022 18:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=QoiduJe7ZXQB5BJdSmj8l1KXF2k5KLS4hiSNI7DUpNg=;
 b=wlfutau6yxFvp4BEfbFzLLH1GSObh4949QvC0ZNTNGk43t4FlitwMEjfqjq2vEA4VgLZ
 15hWHmps9TMQwD7o1j3sMr4FY7MQYA0lrXQa8dJKAHZRX9bmdPC5OhEB1Tl8Sro2PNU+
 LMhs7w5EI7/++MwxWhM+jgkL31Xgu+dvStO64aOhmfFHRZ4I/dZfKeDiTJkh2KpkWZEq
 YsZBHwZFdCkRhNcwopL4+C3txFAsJpucZ9Q0RywmJCOXeqI4s+UA3poUgdC7/A9k9wM1
 Oq3dkrD8s0chvfT818D0YCXkrbdP3SDIugQg2BXEUnPF+itSmoadPiHekThYeGwqIVYQ DA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5y22edk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 18:32:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22NIURJE170833;
 Wed, 23 Mar 2022 18:32:50 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by aserp3020.oracle.com with ESMTP id 3ew701pvdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 18:32:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdL4pJ7rFcEKXW8ErhJD4/z+3mZlmKWCg1xbLYc+7W43Mxvb9wiL3hblpFChaaTT8B86vFO8pfjFkEK0+LrSvnJjDuelY9NTyUAND8mbaIYoYhS9vLa+ev314OtZ99hlF0wMFtoeiCJxWyr5PfqZW6qqWF2y0dEWJOHaRB/GGms6QRuHtIhMTtrwC66VGlTLLl29AvkYPPFNOUG5Hmbh9ZB+fG6NTJE8j8SHediH6HwWX/+Mykl5f1iPGrTwukhNs6TvbfFteU89xm0GLr06X1jOuwCCXP6LebPbTvPOWjoByFLIrZoY1EV5FxLs2sbeRBc6Vs2UANMgP1ZOhL5veA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoiduJe7ZXQB5BJdSmj8l1KXF2k5KLS4hiSNI7DUpNg=;
 b=Hd2CSYkxtWxv0205MDLCvQ8Y49nnWVs/fkv0OEJc8UWcV1mrwUkselN3lI5S3LdiXUK94LpkSoCOsu+W86gE+ElWMUzGw9yLO2maX4GnlmCva2BuR3P3tqnXqRs30G9B5oTSOObi83RbzPRYJDjz5YHXJWxWtArbH/vkwagA+nIcvSHFsttf5rFTduAToUBY+8xPWPS5mQh7RFzMMN7jDrFYtAh6PYXAV8FSo0gHZmY5+n8tWLhNoYRZX7n1L4vqNFJNEVnGFWPQIzS4UCW9llA4SXB/CWXUPWbUKF4Nab/+QLRA2AYfSGrp2UNwMheR2KjEAVGDpF2xwgSRmGMmTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoiduJe7ZXQB5BJdSmj8l1KXF2k5KLS4hiSNI7DUpNg=;
 b=IiHmEbu32pfTYKDGelzMa1+UBZIEVwMCEAaTWPgllWXdDJJMIh20B0gawDAokPOMtPNPY3SfFvNKPSmHEaTSdne0aHwlxw926Whn/BZA9MO220+CXqXMRJJ4T6t3v2VlDpnGstuCNS4POnEQQfdZVDCDUYqyXFbRrp0WiH08Oes=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB5823.namprd10.prod.outlook.com (2603:10b6:806:235::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 18:32:48 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::3188:fe86:1d6f:53ac]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::3188:fe86:1d6f:53ac%9]) with mapi id 15.20.5102.017; Wed, 23 Mar 2022
 18:32:48 +0000
Message-ID: <477e4fe7-0d82-fe5d-0502-7829feea1a95@oracle.com>
Date: Wed, 23 Mar 2022 13:32:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC v3 PATCH 2/5] powerpc/crash hp: introduce a new config
 option CRASH_HOTPLUG
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
 <20220321080422.56255-3-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220321080422.56255-3-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::27) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ded8b59-4e3f-4bed-4f5d-08da0cfb87b7
X-MS-TrafficTypeDiagnostic: SA1PR10MB5823:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB582363905C7B351913CA2C2097189@SA1PR10MB5823.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zks99JQ0PzBSEF7CBryoc9ZVD6AqdVeYyMES6+WFvbq/4wug5F9cO8VpbSIHRrMRII6dPk2MgflXq6boM2XZJDBkV3DptLuEG8sdLeuYgRLf6c1dS5RDinDWbhtTTj0lHcI35JG4PmGYL00ZVwd14KAAZ4VyISBFq4PZ2dGZZWQy7fEVu9E0FQU1qGhVRmuvD4S2t9InswrkOiNg5ann+MTqZNTq1UFfQAzvWJumiNAbswlBvtiOujPGILaeso0eTqoALQO4RS9f2WJ+oyfGgWawjXKVc4S+ZIDm9qJrKbAaiuiW2z+CTAXBqnJJLEEZMlu+b2dBxbFuATvhA0nzS5daFhNyMf7FM4VH0FfjRbAiyWAeVD+0Lv7LLtzkaW5WoQR3/ZsfivEo2Ai+4X4ebhpt4mjExMAZh0mDzE+pn/e0MkwSNod2wb1z9n7+uC1308HXjzAzMD4bkifGtolX+SAk/q4FIBdd25NvWKd7v8l7fH2H/0Ga5ZFxgtror8zs8pxyqE9ML+izO+0TJ4DNX3iNbmt25lPXAjUS0Z/hikjokjspWHQzHanVoUM0yIRpUJVYZQIqmOhQQfqklvl0d6gBPEBtLMrPpOcei45oIUU0tjekgAR7eX27f4losCootrVgrzybUf1Ex4BYk7qpNailgiF0ftyhjMQKOVzMtZwwTd0bZ4cGROOylVWWY2tXtudgtJxfZGr1wP/uDh20IWjbYrQF8I+ApQdF7ng3Ud6/d1Jr6kCAQyzMoWDjWexY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(66946007)(6506007)(53546011)(6666004)(66476007)(66556008)(8676002)(2616005)(4326008)(86362001)(31696002)(38100700002)(2906002)(6512007)(83380400001)(508600001)(316002)(8936002)(36756003)(5660300002)(186003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXdybnlQRnFsUWtvQVk0VlI3aExaV2JHSEpDekxSdkdHSmxNNzJ0dFo0ZTFm?=
 =?utf-8?B?RnRFZi9PQThIOEZnS1VGS2gySXBIQVo3cWpzS3JSVnpEbDgzMEd1UnIxWTFo?=
 =?utf-8?B?aU9tV3dkeUQxNEROYkJUNEZCL1ZKU3V5SUp5Tnl2MzR5b3RJMEhIb0JhWGpC?=
 =?utf-8?B?bC84cjJ4NUFGemdWWm5ONCtVUm92SGFJYVNFVGFDVlZyOXVlTGZHbElPSk9H?=
 =?utf-8?B?MVdEZXVqOVE5OXRHVXV4TU9zOENWMjd2ZXI5UDhIZG1uQytHK0V5aUpxKzVn?=
 =?utf-8?B?YWxtTVVZY3hiM0RTZkFiZk93WUhpV0JWV3M5aEMwOTVnRU9VYnd0SS9xekxk?=
 =?utf-8?B?VmF0TThSSWI0SVdUZW9XeUMvME1ERndTYVZ1T3diajBqbVg0K2dvYWlzTGVt?=
 =?utf-8?B?ZHQ5MU5heUF3cllWWE9kcEZKdjBJcVg2VERuS2owQ3Ixc3JvWXZSYkZxV0t1?=
 =?utf-8?B?U0RqSjJXOURoSDA4MHRFeXNjVFB1b3lza3REV1d0SXJoZS9LTW9maUFvQlBO?=
 =?utf-8?B?R1o0ZzZ0WFRscGxKek5EWlNvK2NqeGhNNW50MUNEMWFKVEVOY3ptVU1LS3Bs?=
 =?utf-8?B?djVBQVdoYXh0elFrVGhvMC9DN21LTktvRmgxdVllbllmd2wxQzZSRjRyS3p2?=
 =?utf-8?B?RVBLbGc2NTBpQTUvcjdjbXZhVWVpMXh6NVlFSEFXalB6dWhBeWs0ZWpTTlhj?=
 =?utf-8?B?Si80TmlEQ1VRYW05Z2c1V3JPZks5azRjMnFyMW1pZDdoNjA1Vmx4MHpRRjBJ?=
 =?utf-8?B?K0o0eEhzSzFHeEpPS0FPaHBjbzNPbXEwczFMOEJZbXhhNWd0dUxYWUJqVVYr?=
 =?utf-8?B?dEJkakQrSERnU0ZHQWNtejU4YTZoYXpZY1hkZnJ2ZFJWT1JtSHZBUlVlSXV4?=
 =?utf-8?B?NnNMbE1DNGNzS2hBOHZyc3FaeWJzbGhNcWQ1cWRFakg2MUZmSWw3UW9Zendo?=
 =?utf-8?B?ZzNvS2F5TUVkN0VjQktMSUZDdUJvZ0dtcDZzbERRZ2dEcUMrNUZWempTUlQx?=
 =?utf-8?B?bVo4MEo3UmVLbXJSTEtKVm5aWUR2bkFRTGxMZnJYc2Fka0JNL3kvV05QTzJO?=
 =?utf-8?B?cDI0WWhDNUdUT1ZKVFFESmd3dnpzODQ3cEdmaHpvdmhzQzZBTTVvdVBpR1I0?=
 =?utf-8?B?cXY2VlBHOFdCZXVXV1RsT0trbnpMRmdUcVZBUUY0eVZ6dWlvNVIrSitJeWxx?=
 =?utf-8?B?V0RablF4VWpvZTlvb240RHZGR0ZEQ2tHSXFSdStTby9OZ05zTFZlYU5DWWxx?=
 =?utf-8?B?NU9MbnloR0pLYlNUTUJvckU5REZZNWRRUjdRZFpiWExCRzVDOEtwczh5V0g3?=
 =?utf-8?B?VGdoU3g4MkF6Z1pIS0ZJVW5RWks1eW11Q3lMTzBWcG1nWDVtbTJZV29HbWl3?=
 =?utf-8?B?a2h4RUlJRGYveHVqZUdoWDlvTktkSGFNSXV0TDBMQ2kyNWF1WXd2K3QwZ3hl?=
 =?utf-8?B?U1lQUkFPeHBPczQ1K0FIakxlTXJzRU85OXNrK1FZd3hWblJCcVYraVZmV0pS?=
 =?utf-8?B?c25pYjdNbno3VE9zYjJEcHIydEs0eDN3clJmVlFwOERrdFB0ZytoWEs2RW5u?=
 =?utf-8?B?Y0FoL0dma3RZcVpxcFpaTUkxdFNuNk4zZFAwOWY4WFVvS1A3NkJLeUFlZ3pF?=
 =?utf-8?B?TFR0YlErVnlXS3QrT3Y0VEoxL3lqQm1BR28wK1p4aWZ1TmdQNno0NGNsR3B1?=
 =?utf-8?B?V2Nab0xGUTR3ZmFDbjJvdDZyMklLYkhHUHUveUllak9UekxtZ1AwbEhaMVpi?=
 =?utf-8?B?TTZiSlNPRVd3NVlaRlliSTdtWGl5aFFrbmhTZlJiTWtmczhNWVB3L1BGYWdy?=
 =?utf-8?B?VFpRUXd5dzVJYUwvdW9YMDlrQlp2NFhxWnBJa1YzWDRWNWdyOHFmK292emMy?=
 =?utf-8?B?L0M5MlhxbDFwNjJFRkNJNVRybUtJT0FjaUw0bzhiUk9lSWdrYUlmck1qbTNv?=
 =?utf-8?B?V0FrbDkwaVlrTTdHNmRIN3QwbysxS2RFa1VEcXhPSEpUZXNibzRPN2VIVUoz?=
 =?utf-8?B?Q2VSdjlJVVJsellIWllHZS9aODFsMTFBZW9XdGZnU0d3alRaMHNBdStmZDdw?=
 =?utf-8?Q?Iuwvgx?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ded8b59-4e3f-4bed-4f5d-08da0cfb87b7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 18:32:48.0858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujKSsi5NSQ5ZDg/Ga7FLyJtz6g8F8LDtIBFtADY0eVMHf63p3RRGdoYhBVd5Bz/4w1OKZSboNWr9H0QrjJLa16iS9w8v6xH/dJHoPvGldjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5823
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10295
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203230097
X-Proofpoint-GUID: YoNE5aF1MsXb0PNr2OZOHLA-qZy8mNpc
X-Proofpoint-ORIG-GUID: YoNE5aF1MsXb0PNr2OZOHLA-qZy8mNpc
X-Mailman-Approved-At: Thu, 24 Mar 2022 07:43:54 +1100
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
Cc: mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, bhe@redhat.com,
 hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/21/22 03:04, Sourabh Jain wrote:
> The option CRASH_HOTPLUG enables, in kernel update to kexec segments on
> hotplug events.
> 
> All the updates needed on the capture kernel load path in the kernel for
> both kexec_load and kexec_file_load system will be kept under this config.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>

Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>

> ---
>   arch/powerpc/Kconfig | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index b779603978e1..b816339ef8c7 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -623,6 +623,17 @@ config FA_DUMP
>   	  If unsure, say "y". Only special kernels like petitboot may
>   	  need to say "N" here.
>   
> +config CRASH_HOTPLUG
> +	bool "kernel updates of crash kexec segments"
> +	depends on CRASH_DUMP && (HOTPLUG_CPU) && KEXEC_FILE
> +	help
> +	  An efficient way to keep the capture kernel up-to-date with CPU
> +	  hotplug events. On hotplug event (CPU/memory) the kexec segments
> +	  of capture kernel becomes stale and need to be updated with latest
> +	  CPU and memory regions. In this method the kernel performs minimal
> +	  update to only relevant kexec segments on CPU hotplug event, instead
> +	  of triggering full capture reload from userspace using udev rule.
> +
>   config PRESERVE_FA_DUMP
>   	bool "Preserve Firmware-assisted dump"
>   	depends on PPC64 && PPC_POWERNV && !FA_DUMP
> 
