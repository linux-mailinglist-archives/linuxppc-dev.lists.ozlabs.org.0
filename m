Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A16684DA705
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 01:41:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJBKY1VRJz30NV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 11:41:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=EBYUADnZ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jx0go0yY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=EBYUADnZ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=jx0go0yY; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJBJk0bNpz2yLv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 11:40:32 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22FKiVtF011483; 
 Wed, 16 Mar 2022 00:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=djr6kN0TcawL+ku/NK2R0BtYVj8lg5bDD1C02JuafMc=;
 b=EBYUADnZPAOiAe6ii2Z0V+oPucuY/Cn266HvKd5+/l46tYcXVvj7/YitoCXO8zmROodR
 h6OJ5ORH5KnLf52aiKKxUKCdV2BiW5Mt4M8AgloktDvi6pR8RAqzTRn57DaA6SOhw3j4
 V9HrGVZHStjvj+iuXGRtDBzRs3hwncQWPiO+ZZvHbM+TwidRrOo3+/VqltYiP2hJQZQY
 B0oYHq5xATW7YHTcOwrc5bsbyngL35yzxKZaetRItMww9TbzIEWsbr3IEbVC27SHlkMi
 YHdtMgHIFsnI76td2YA9MQYKoSWw9BLR8fh/TqPbPODOYyO+FJnF+ijki5HCwbJU6RsJ Uw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5s6mref-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 00:39:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22G0W1lN149534;
 Wed, 16 Mar 2022 00:39:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by aserp3020.oracle.com with ESMTP id 3et64kc83y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 00:39:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCf1GgmtgU38mK3x65627G1OHXxN9fBlOrOzqvWNaC5H5COvyCcmdOi/ZxWSBB5pKMnGlUWX42HlduLuWgBnaKl8ca8mbOH5KWYvyBhcCYLDAkpGMx7gF5hv+0qt+un2SbrKfhCkjpoEsuSM2g7JqQ0OdIQgQsozeNguicDaxmIOupUPUwGJZq03vwEew2hCGVdIZfrCNvq7tZiGg7bFkhK0YpRWEre5VgSgyi2s5YLdw+Gp83SNKRSwZhrg9SBQj+yJCGpeO3KN4k45ZbZClb/b1KBFoER+ihdNVyQXbgop9n3Nu3miDvGSQ6BX00H29nSia21iZw1yzFTvW+iUfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djr6kN0TcawL+ku/NK2R0BtYVj8lg5bDD1C02JuafMc=;
 b=dtE4oz7YZxKUYUofSCCAVkvQRBm4EGM/hPwXLL+y9NNadZekU7K7NCy1glPwFLG6tKNbGLCyWFggYGVEY1m5AmBTrdjeRUlD/tVzz0yhas1nkgsF1rQHR5WUK+Z4whkfO3Qalq3KBO6sBLKrJ/EXIr25e2BcgX6B5PcE1mGX7X1A0do1YbwadmzmHwmeW9+tZM88uSU5I2S8Giuu1SOgfZuIG8iMyvFigOXZ9GA0kgCIXy+UAIO8j3rDkG2o67K71rApAusnhS1apVejtZsMy0GgCFA8kNGjZFwkhgbADbhzAsJGK698BOSzijRXFFh6gqYQ7D5F+WvA5aNYn/v5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djr6kN0TcawL+ku/NK2R0BtYVj8lg5bDD1C02JuafMc=;
 b=jx0go0yY6nbYsdwLI+pIXNpFlvP59jfq7l0bVX7CKVkiei3RaaIgql97qHG3X9Q6SjPE+zT8lHXm3lELEbP45kc5rvh+aIk61yv3tPKn8hjd6K133om7KrgJovt+eElqZfMuXs4YAlW9MRz5zLC79/P0bCNjWL2YQt4/uGaSieQ=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BY5PR10MB4147.namprd10.prod.outlook.com (2603:10b6:a03:20e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 00:39:51 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::1b2:b41c:b2f0:c755%9]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 00:39:51 +0000
Message-ID: <3a8cc553-4b60-b6bb-a2d8-2b33c4c1cf23@oracle.com>
Date: Tue, 15 Mar 2022 20:39:29 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 12/15] swiotlb: provide swiotlb_init variants that remap
 the buffer
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220314073129.1862284-1-hch@lst.de>
 <20220314073129.1862284-13-hch@lst.de>
 <4d800aa8-5e38-1ad9-284f-1754c83d0f8a@oracle.com>
 <20220315063618.GA1244@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220315063618.GA1244@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0075.namprd12.prod.outlook.com
 (2603:10b6:802:20::46) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e5cdd27-5357-4844-66be-08da06e57b07
X-MS-TrafficTypeDiagnostic: BY5PR10MB4147:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB414758A1650DD7DEDCA267AA8A119@BY5PR10MB4147.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uy1tmGQRi05CoYG/1TM0569ITNymGf/zYpC7r28gCMp0pa423BF75gvKu00jVL7g9ths/7kV+CPK19h2EJTCErXbcns4YEVEXELJl6tprFPrOtyJuCfCCjJ7TJrxqdlT87yL0toLjH2MQIp8RuCLBBX63CZin+2EOK66ceYJ6+1e59TDw8Of9zJ4fmh2uBaWjH+aGh5ULM322wwzr/TkD3w+H8TOKxGjYX5QV20Ev/Fe2oIe2PKRJWiyIloskXk03tRUtSc9U0hbKG8UtM4DLC5m0K4Ru1P9BkjP4zRH3poSKDSnRKVsy5mBy5JlepNhX+AlErQcPFa8uXFdq09eL1bITYtcx7s37h8D1cgRpOBQIqEEq2vjZHNs3XMjLdVLLi48XkL2TToqDp19eKdukQt9nIDcorhnfSvfkUuI2CbFPoV3U7ch6VCWI2ISLpWQbmJzMPG3LHE+FGZfmeydUzOGOmaE7HVgqdAQJUKlMnChBNC+GswPSQgW9LFrmrJdJ4R7AML6uyzZhnZW/r8DwF037RzPcuu6mjPfZc3410bgPuIkZLLLzd3RyTvEUCrTIXlAzbgzUS8Lax7HErG+HaG7jKJcLzyv4ws1ZOUmlicBCRQ9DCbBu8HTKr+CohONxpbIt/sVstytQygqJXUNpRpdlJSPBHbkY0Ty0wusYuKaCwYR1a1wC5RuZP2Zpe/hGLVr0UVPNoVjBlHLY6Lv+VtVL8MvcKl1DLVQF67GsHGoFgcVKviraS/FWpR5lI4A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(86362001)(31696002)(54906003)(316002)(6916009)(2616005)(53546011)(6506007)(6666004)(26005)(186003)(83380400001)(6512007)(8936002)(44832011)(7416002)(5660300002)(8676002)(66476007)(66556008)(4326008)(66946007)(2906002)(31686004)(38100700002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU45NTZoaENrVkdoL3U4SjRhTjJLRmxRR2VjYytKZXU4Q0RDWEZQMUE5RWNv?=
 =?utf-8?B?dDJ5WmVjZ1daVWd4cWNlekl4NG9aakhhZGV1NmxKcWl2VEJ3aWFvbE1Sc0R3?=
 =?utf-8?B?RTBEZitVaUVRSHJKNTZrQ0NQeEgralArK2p2c1Q5YUhVa1Yvb040alJUU204?=
 =?utf-8?B?dllEdi9Tc3M0d3lFM01hUEk5Z0JLNFZ0UlVsRlF2emFHMTVtTjdQcTJkYXds?=
 =?utf-8?B?eHZVaUxsdWUzQ05SNnhLRmxkcXF2ODlVblNHRHBmcFkzL2UwZVVwZXlNMEdy?=
 =?utf-8?B?T1A2QmhjTUZRWEZUTVlvRndpOERITUl4WC9WcnJINGNGblpKREJPZjArWlNt?=
 =?utf-8?B?TnBqMmZ3U0Eyd0p2cHNxMW54dytHd1JHY0VacldwaEFObVdpcTVicGxsUnQw?=
 =?utf-8?B?Q041ZFNBbkdwTDljNnhDYythc0h1dkVxazB1N0tlME5tR1B1WXlVeXFaNmNK?=
 =?utf-8?B?ZGxFRVY0OVNTZW1UeW82cGRQNjhQRzdpQTc1dHM1dWx3ZDBIUEdndnd5S001?=
 =?utf-8?B?enhlWHhHanZjQk9EK0pvaTJYVjRTenNwUmJ2NGFSMTBLZHhiN01heXg3R09R?=
 =?utf-8?B?VUdwSVZUL21PbkhVV1JXbklZMzJENkRQbGpmZVptWDRkWDhqbzluWWpOdFVX?=
 =?utf-8?B?dkxLUm92czJHTGo3QXpXekVFaXZKbTdrNnZuM0FGL0tLZldIZ2h3TkRpTHhw?=
 =?utf-8?B?aFpOOXl6OWxjR1FPWjhQcFdTN1F0K3RndlBER2E5U2ZFeEdDSWpaalNKYS92?=
 =?utf-8?B?OGFCZkp6eW16cHZCOVdNR1pTdTk0Kzk5ZmJPeXluTk5BNFpqdlF3d0FyKzdX?=
 =?utf-8?B?VkViRVFKa0s4bytINzc2UWRVM2EwOENiTWM5VEpnYWRUMGZhVHJMQ09ZVmN2?=
 =?utf-8?B?NVRkdGcvVDZjTzFXTDlrT0NRb3Z6ZnEzT3BCbG9lWERBUUxTbGxuNFozNWJj?=
 =?utf-8?B?Q2pGRFhYYy8ydmV2Q1VVcllRMnVpbk5KT0pmTFRkcGJnQnBHMGY0STh4OVFU?=
 =?utf-8?B?K1VId0ZManJkM09XZHBOdnNFYVNNNmpEd2FJMDM1VWxrZnJQbjl1eitJeTFN?=
 =?utf-8?B?N29nd05EQndrU3dMaGpvUXZOS0RVRjZpMHlLZ0p4TnhOUTlFbldjWlZ0MTgy?=
 =?utf-8?B?cG5EQldKb1Zhb0VhYkJ6cDFBUUx5anRlTjh6bStXOGFtRUdDS01hekd3U25Q?=
 =?utf-8?B?ZmkwRG5GZVBUTjd5SXhUc1FOUlRFd1Z3TVFOcXVFM3pyQUZiWE1hbHpqc0x1?=
 =?utf-8?B?V3dHM1gzQnAwM29PZG9yd2RYb1Bkb2Nhd1BkcnVTUVFTeldRQlZNcUZhRGhk?=
 =?utf-8?B?REltYTdidGE2Nm43MUxQWEl0QXA0RFdnZHkzVHY2OTNOemhLYlM5UFBKdDh5?=
 =?utf-8?B?dmJLSTZycGVhRG9PSGMxdEJVQndSN1FLM2tBYzZUS3k1VXdPTVhDT1IwWmhh?=
 =?utf-8?B?SWhicCtQdmJzVDc5dy9KVTNrREM2cXRxUnJoa3NNWVozeXZyblJJbVFXbDhr?=
 =?utf-8?B?YzQwMVVtZEttR0QzUjJCTVRHMFh6RDFqRlF6b3hQbzdDMXI1U29QM01WVzRB?=
 =?utf-8?B?c29mWGwwVzJyQVprSEdDdjRpWTdJaGZrTjlidzNYYWFNZlZRU3hQb0lwdkJs?=
 =?utf-8?B?SGp5TFRoYWN0QTFIZmR1OFJvcEQ0d1FUYjhOczkvSHBLNUMrUnJoTU5iVTlG?=
 =?utf-8?B?MENmTy9tTVRmUFFNUzhMdUdscFNQVFdkb25WdFIwcldSZzJlUHRjY1BYbTRC?=
 =?utf-8?B?NS92TE00QitoYmdkd3pIVGVPaG9ZMUlZOENadHpnQVcyellmSFExUVN6aEFh?=
 =?utf-8?B?Z3RaMWxXZHBLdDNCSVpraWpPSUZLNFRqc1VZNDYzbXd3aEI5bnlQRHF3emt6?=
 =?utf-8?B?MDBWd1VKcmZOVlk5eXVrQlNVL2xCV2RjS0JScS85TnFraCtEaVBEeWVua1BY?=
 =?utf-8?B?Uzd3cUc0YmhCeW1iYkNhN2x0aDFQcGEwT3pHRVIyV2hINFJhelFzajFmSE0w?=
 =?utf-8?B?LzdOVWVsTjNBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5cdd27-5357-4844-66be-08da06e57b07
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 00:39:51.0206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TF2vJtebLSAdleNi6D9YetFLcgmSTX4xMsfZC7SUCCVEZYWXQpsxgZnKXWVvpiGxky5mlpaee7FuakjCFAEO10lkRh1KySJSMuwMBNfLwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4147
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10287
 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160001
X-Proofpoint-GUID: eIH6PojFSQs8pjue0vLu4KGA-a1ppM4Y
X-Proofpoint-ORIG-GUID: eIH6PojFSQs8pjue0vLu4KGA-a1ppM4Y
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
 x86@kernel.org, linux-mips@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/15/22 2:36 AM, Christoph Hellwig wrote:

> @@ -271,12 +273,23 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
>   	 * allow to pick a location everywhere for hypervisors with guest
>   	 * memory encryption.
>   	 */
> +retry:
> +	bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
>   	if (flags & SWIOTLB_ANY)
>   		tlb = memblock_alloc(bytes, PAGE_SIZE);
>   	else
>   		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
>   	if (!tlb)
>   		goto fail;
> +	if (remap && remap(tlb, nslabs) < 0) {
> +		memblock_free(tlb, PAGE_ALIGN(bytes));
> +
> +		if (nslabs <= IO_TLB_MIN_SLABS)
> +			panic("%s: Failed to remap %zu bytes\n",
> +			      __func__, bytes);
> +		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));


I spoke with Konrad (who wrote the original patch --- f4b2f07b2ed9b469ead87e06fc2fc3d12663a725) and apparently the reason for 2MB was to optimize for Xen's slab allocator, it had nothing to do with IO_TLB_MIN_SLABS. Since this is now common code we should not expose Xen-specific optimizations here and smaller values will still work so IO_TLB_MIN_SLABS is fine.

I think this should be mentioned in the commit message though, probably best in the next patch where you switch to this code.

As far as the hunk above, I don't think we need the max() here: with IO_TLB_MIN_SLABS being 512 we may get stuck in an infinite loop. Something like

	nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
	if (nslabs <= IO_TLB_MIN_SLABS)
		panic()

should be sufficient.


> +		goto retry;
> +	}
>   	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
>   		goto fail_free_mem;
>   	return;
> @@ -287,12 +300,18 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
>   	pr_warn("Cannot allocate buffer");
>   }
>   
> +void __init swiotlb_init(bool addressing_limit, unsigned int flags)
> +{
> +	return swiotlb_init_remap(addressing_limit, flags, NULL);
> +}
> +
>   /*
>    * Systems with larger DMA zones (those that don't support ISA) can
>    * initialize the swiotlb later using the slab allocator if needed.
>    * This should be just like above, but with some error catching.
>    */
> -int swiotlb_init_late(size_t size, gfp_t gfp_mask)
> +int swiotlb_init_late(size_t size, gfp_t gfp_mask,
> +		int (*remap)(void *tlb, unsigned long nslabs))
>   {
>   	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
>   	unsigned long bytes;
> @@ -303,6 +322,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
>   	if (swiotlb_force_disable)
>   		return 0;
>   
> +retry:
>   	order = get_order(nslabs << IO_TLB_SHIFT);
>   	nslabs = SLABS_PER_PAGE << order;
>   	bytes = nslabs << IO_TLB_SHIFT;
> @@ -317,6 +337,16 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
>   
>   	if (!vstart)
>   		return -ENOMEM;
> +	if (remap)
> +		rc = remap(vstart, nslabs);
> +	if (rc) {
> +		free_pages((unsigned long)vstart, order);
> +
> +		if (IO_TLB_MIN_SLABS <= 1024)
> +			return rc;
> +		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));


Same here. (The 'if' check above is wrong anyway).

Patches 13 and 14 look good.


-boris



> +		goto retry;
> +	}
>   
>   	if (order != get_order(bytes)) {
>   		pr_warn("only able to allocate %ld MB\n",
