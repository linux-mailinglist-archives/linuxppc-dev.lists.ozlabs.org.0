Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0974F3D82
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 22:08:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXzGl33lMz3bVd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 06:08:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=iRbvgUVV;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=m2Ae0RZw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=iRbvgUVV; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=m2Ae0RZw; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXzFv2swKz2y8R
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 06:07:25 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 235J403T000752; 
 Tue, 5 Apr 2022 20:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=tpyGPUaQuiPurYeYs3+V7jjavwWbv5TwRE7ClxjB0Ic=;
 b=iRbvgUVVCKoA47KcSmFzqbMjBt0jgctio9aCZaWNRqj3MbmCjumA6oJsNlbn+8WGNBPq
 u1E7eEbzu6NEbg+ZnHtRCsCiDY1sVHD1OrCDyl0N220iZLPiwpn2mIQeibs1IjXdrzRm
 H8XdWxCk6NcTE7ku3FdVu6fyYlU1Cp3gNIEqa8Ckj7VxjQHzicobz1AZl/DuS/XqxvVh
 dfTlHj6nsp8zjWHj3PnfhX8WVq6pix0/hEU6BskaOEZmM2AkvbDMOOiTM0RE9qu7Qjrj
 TciysJOUYRJvsglnO0bOyVzUDjuSABxT8JRnqsj3V2XzOk/X4yVDDD6xPmdgBTzFHhwC Pg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6e3sq1q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Apr 2022 20:06:58 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 235K6n1g024375; Tue, 5 Apr 2022 20:06:57 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f6cx3wnmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Apr 2022 20:06:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOKcn2DSgTC3axuoc+TpJfL6SESnqYVZ6yvwucBeIEwBDB9axAIOowFbrquNE95zsSxCNF2rEakEfgPe0VvueHifW8L+N2wgGvxkZHUik1LPQTgQdHRqRHaEmhsDHkqySVEp0/1YFyudrbAqHQOQOL+SagE8EejdzSwkRq/+fxxdVtHtA16n20C0Dcze0TlunSMMhzKUm6d3Yl/3WP9IMMgaIqmiadBj9mz2jbMcsM/j2mQJ9T6B7Wzb2k1CtbxcSYv1aBz5WFd9qoTetQp5UrlBFSt3j8NcFbv7F/Ll0j5ryKB61vcy7+g99CRivzruXOEIWZw/KnxD+YiTx95tXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpyGPUaQuiPurYeYs3+V7jjavwWbv5TwRE7ClxjB0Ic=;
 b=jAQjplybF0o1/1+o+tI2OxakyvTgrkNh64/hC7MVv9LK62nkbsFWKad8kxSwHECXWtEhGgrqJlM11Ai2qjsrOpfSTEGDeS9aB0CPj+cFIVaRI8vXka1LMX+Bbl3Wojaxk2vEkiPZfY+BfmlnIVEdfoybzTTtepq6VpAn9jpncyJKkZ+r/PvuNY5AUbl4nBg28p4fGrtUgv1X2N6jcIBkHzuy8iw9GG44h8HBrdNZbb31/QDtLl1dYeqTQlg4dgmloMTOlgvoSeVn6puHv9AVmYB7wWqEQ+TWhmjts/3AlXWf4cS1qxkS1rb6WqqqJeyz2UvdGKVQs4zBARTaG4YQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpyGPUaQuiPurYeYs3+V7jjavwWbv5TwRE7ClxjB0Ic=;
 b=m2Ae0RZwdw09NXr4y61452WcWEz6z9VXX45yPvQ/fBrjRBZnGaGBMBMjqX8E6WTj7Ose/Hk98No5Y4cI3BZTZWYGW1QvJxBe8CyxazKbqwAfh/Vy0MFTLEd6ygriKt3lYRqfuwbTmtBAmDiEokpZF3t4dvghWLS5JYK7dRUShyQ=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by CY4PR10MB1944.namprd10.prod.outlook.com (2603:10b6:903:124::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 20:06:53 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::4455:2c02:503:a182%9]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 20:06:53 +0000
Message-ID: <48526600-081d-7be1-88cc-cf47cdb0253b@oracle.com>
Date: Tue, 5 Apr 2022 16:06:47 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: cleanup swiotlb initialization v8
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20220404050559.132378-1-hch@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220404050559.132378-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0075.namprd05.prod.outlook.com
 (2603:10b6:803:22::13) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfb65ae6-d4eb-4655-1deb-08da173fd3bc
X-MS-TrafficTypeDiagnostic: CY4PR10MB1944:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB194415E6E4B957CD648A672B8AE49@CY4PR10MB1944.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+cpxbKZpHbCxNRNzdJZae/a2lC3ai+FqpOulMGFxU1EzjvUzyvmqerEFUbIRLzu/ARdOf7KnROHcTQtoSquZoxrF3pQ/Vykrk3R9gtZIqQXS/FwrmmbSl/Tsh0ZrxT4Gv+YqO/3XGpKOT9tZk4v6xAdINo0/e6EFnDv1JQYnZp8ESTEFG+8vtsGP8tDxp7y5LowKbBtDFojW0VWx6EgII82Uc0EXJfaY8bE/iwOFzOcLnX3YDHPj7er1vAGMz3cO7wHKL0t4jzuA+t392Fr9oFQSnjAkuj2fRkImXIXPQN5MPAFTk1/PDYfxFGK596VvnjYDaubPcjOjBI/DkCjx+8jPXXmrp0ZhtR5EXfhgNLG7jWZ5ZqBoEv45nC8qqsPkw0hbssk9Qz1X4KJHqmhZpiYQn5HtYQkQuhw1FL16ah0rgfakc1BNxkK0uCapTNlPGR5t+ffEkvEkVAShjFjx2zdKPiCAmDwjlu91Z3F99q/9zWDgsfTNYGPlzOjCJ+iuHUcbCKLwZX2RUpQ4hkBgz7moEvBAslzE5IMabuYd67me/jAq8lz5KHRuDMkNeiOwaoAfajkJ7jWrS96K45HZpByyNYBaz6F/oh1rPYvyJc/1vSiTzbPUUrfq/DHId9R+Lqfbhz91Oz6nJi7ZJ89MPT2LjPwbXbmfpUK16n/n8DJm0jMXyl9kKOuCCk2Qz33rodEKN//4kZ3OQmrV9XFHDeQXQE1GoOtVFfLhsaLCj80DyjRRaL3MSnbcL3+nmIlvhFvQWeZTROZdcO3C6R+682s4xsFhCv54BIPay55iw4Fex/Al1KLdcZBeYYOYgPADG6savMQAla1Gi687kB9Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(38100700002)(54906003)(6486002)(31686004)(966005)(8676002)(5660300002)(6512007)(6506007)(44832011)(31696002)(316002)(4744005)(7416002)(8936002)(86362001)(4326008)(66476007)(66946007)(66556008)(36756003)(508600001)(6666004)(186003)(26005)(2616005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yncrb3FyUWVnNU4xdDJFU1YyU1hJT1VzZ2xwUWhVRjhETG4rUU1CMnpXaVpm?=
 =?utf-8?B?QkQzOWthYnFyVUtIb3BmRVM0UnFhSmQyTUxyMGkvYXhyTFBwSVZKaTIvSkZD?=
 =?utf-8?B?VjNsenE3WVBhVHZuSGdGV3VlcGdjUjdFYkRTb1dnQkFOR2kzTjVaKzVmc2hs?=
 =?utf-8?B?TjFHdGUyZkVKMkVXVTZKN2VkRWJia0wrK0hwUFNpaFVydGt4eHJLcHg5Q3h3?=
 =?utf-8?B?OXZqaE1wMUExZXN1NEdzTElWZFNNM2lsL1RIODdtaWNHSGhQKzAxdjR2Umpw?=
 =?utf-8?B?UVVRbzQ3dlpEWVExSjRTTjE0LzZ5eUJqU3daMThUT1ZiK2JQcEVLODlkVUxv?=
 =?utf-8?B?em13Mmd1TXVBYzdsWG1pN2lUU05CcldBWm5oUS9PaFRrNXVBckJBWTNIV093?=
 =?utf-8?B?M205eDhxMm90ZUpUV2tsRmxERitVcnRoS2dUN1hEYU1ZZ2o1bUNhSWgvbGoz?=
 =?utf-8?B?c1JhaWtwZFlIaE5UbjNQQmxZZUZSNDRYZ0xOVG9LWjkwVHBxT2lEOXRENDJJ?=
 =?utf-8?B?aTdxNDBKNWgxQzVkYmhTMTVEYU40VlNUQU4rd1V1ckRldWFjQnhMcENVVk42?=
 =?utf-8?B?d2lsaG1SUlFnQmNRTjEwMFZsMmovQTBFKy9zdFFFNmN4amJjcGIzR2NLc2tv?=
 =?utf-8?B?V3lHbEppL0Z0eGZ1d1Q5bmtIcTVieE5oQWZ5Nm5vUUZjTElXYStwMlBSbCtZ?=
 =?utf-8?B?QkFqYTM4bzJjd1VqWjEwclhQdXEzRytwZmRBcnNPUUJMdy9IZmtlMEU2Y1RB?=
 =?utf-8?B?NmRZSHlPUlRTaXh1WXA2S0l0ay8raHVVNjBDb1dPZjh3NGVpSXVvRmQ1elZM?=
 =?utf-8?B?ZmY4WDJIQ0lyS3I1TFNkT3BpcWo4MmZKUFZPMWJOV01Gd0Q1TEJySUJXSmsy?=
 =?utf-8?B?aTZIVXBvZ2hDbkc3bmtzUUhBM2hZbXhOcm5DOHUvTWkwaUo1WmRjVWJ0UkJI?=
 =?utf-8?B?ZFZnak8weGNXcFhvVG0vS2hFQmFRM2VQRDAxcXc1Ym51Y3hmTUJyaG1ReHF5?=
 =?utf-8?B?SGhhcHBDdHF4VERacDVjdSt0NEZwN1F1S0VBNGk2VmpIc0JDMFBMd3o5Vm4r?=
 =?utf-8?B?dnBKK1U4K0pEQ280QnRrM084dDZ0NDFLMWFQTTY3M0Zpd2QyR285dnZ2NUpC?=
 =?utf-8?B?RFVIa2RNMmgzcjBteFYxY25qREtGbDd2NXZ0OFRBWlpyUm1sOTJjYWQ3d0tH?=
 =?utf-8?B?WHJmVTB2SG1oS1B3c3p5L0tKVnZqVFJjL1B0N1VnbFlDcEhlb2NJMmx5dHdD?=
 =?utf-8?B?QkNmQjNrRm15cWh5azV1VXhvN0ZPWC8rZlpQSUttclArN0FMcUFXVWQvZTVx?=
 =?utf-8?B?NmtSUmM4Q2RrMFo4SEdkZWhTbGp0N1Q3WFdmS0pLMTNXTVdsMWNsUUg2YmVH?=
 =?utf-8?B?UHVTZWFzYnZBTVgrS1BFd0wzenhqVG9TSVpFUXc4ZUwyK2Z4eHdDemZwaXZB?=
 =?utf-8?B?RXkyN1F3QXV6bjVPZUZqNkMra1JrK2cxaTZ3OEhNTks2dWhleVJTSTBnMkw3?=
 =?utf-8?B?K0laVEFvVVZ1VjhJQWtUcC9iRWcxUWhMR0YzR3dRYjNnVzMvam9tRzk5RGIz?=
 =?utf-8?B?NS9IVldSWjRBUUp1ZGtrN3ZneDduV1VkVEJ1aVFLMkNNOE5qNTJqNHhjbDlW?=
 =?utf-8?B?ZmVKWUxObE8vNzdseGM3a1QyOVB6bDYrUkcvSjRRaTcwVFdacGxzRDNWalZM?=
 =?utf-8?B?b3M5Q2RWQ2FJU2xuaDE1R1FIK05idGx0RXNiMUtvYkpiQy80RVRQWTY0c1Fo?=
 =?utf-8?B?RnJlbURFRWU5M081aGt3VGZrcWJ5cHRiOUgvMlhockN3eWhZaEZ6ZlZvMnJK?=
 =?utf-8?B?L0ttaW5IUnhjc0JWbXZqc1BPbTZQRHY3cWg1V2ZUakxJcWl5dW80R0FuMWtK?=
 =?utf-8?B?UUx5MEJSMnhuTjlQVEdUejh3Ukx2NEtud0o4QkZsNDRJMTN4R3gxMDZlNWpZ?=
 =?utf-8?B?dnczWGZ1SDlJK0xJUWxLVURQeVRTeDlkSW1yRzRkUlRmZDZxbGJ0bnhPRHN1?=
 =?utf-8?B?VTJMdTVWUjVkNStYdzBwMU82ZzVTc29TK0V6MitDVnZhdDBrOHZNSURwM0ZD?=
 =?utf-8?B?dFg3cVNHUWtVTmhwek1zb05aSmZKb0htczlvanFwanozRk93b2hGaHNWOSs4?=
 =?utf-8?B?NXBpOGw2SzZZdE02RFN0dW5GdDBrTzQ1REtZL2JpMEQvcTlvem9jbEtSU3l1?=
 =?utf-8?B?RUhTRjc5WnZZcmdnVFRuK1ppQUFuN3hLTnd2em00Sm0ydjVRQklqSkFmTWlF?=
 =?utf-8?B?T2pNeExvRHhJUEhrc2tVbUNhWjJISGYyTTVCbTlMUXZjdWVoN2MxNFZwcVRj?=
 =?utf-8?B?eWZZZksySEgzeXdLRDNyZTNxazlWQjdwZHp6b3FZZ2FNajQ0U24xM2tGbzBm?=
 =?utf-8?Q?F5vfS0BXsu13G3CI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb65ae6-d4eb-4655-1deb-08da173fd3bc
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 20:06:53.1401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26PS2iFudTEwClAtcgKRg5KleMgRBZRcEFhH7JvxTxGfOrIXMFGLIhWKpq6YDwAbTDAeX00qe5O1YrWF9VGHWpvJK8W2USnVBlTcNmvQORQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1944
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-05_06:2022-04-04,
 2022-04-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204050113
X-Proofpoint-ORIG-GUID: GaJrNkL8mc8evtqJEYSbwuP_D3hzpQ0B
X-Proofpoint-GUID: GaJrNkL8mc8evtqJEYSbwuP_D3hzpQ0B
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
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-riscv@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 4/4/22 1:05 AM, Christoph Hellwig wrote:
> Hi all,
>
> this series tries to clean up the swiotlb initialization, including
> that of swiotlb-xen.  To get there is also removes the x86 iommu table
> infrastructure that massively obsfucates the initialization path.
>
> Git tree:
>
>      git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup
>
> Gitweb:
>
>      http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-init-cleanup




Tested-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


