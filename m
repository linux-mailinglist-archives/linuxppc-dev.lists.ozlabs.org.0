Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ADC4CA5CC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 14:19:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7vpW3BTyz3brT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 00:19:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=KUOkXno7;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PJjdzF9T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=KUOkXno7; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=PJjdzF9T; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7vnf3LDFz3bTt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 00:18:29 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222CSxWF018990; 
 Wed, 2 Mar 2022 13:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=h5AZWSbOc0KTtdyh9+8qxRvai+pDBFNH4HZ/HB6BAL8=;
 b=KUOkXno7EkApM+0MHqwg6YyVzbCFkMbXsXDKyf+Naqjirx33GLBEo6wxDrjZZOOg1oju
 9htM+YCJ3eRng9MJHRxpeyBkoiZTl3aniVdrIk/OoEYBaQ+YonxY2PTtWIrmxED6moO5
 jpvkkwlgJtm+ZMZzzxgF+tlBKtT+ee621OLcQUbxjlSnevSXRQ9+dkgw12tA9rgcZz3/
 GLJch7DX6s3rADXLrcG6akxTsqPDJs/jKpaDeOzTCRb/dLU9rkCQ1jgAhkvYZNBBv51K
 h90WaBvLAHqhRQYxacK1aypIrTdqsE+F5+mRVKXi+yPC74AbkbOfsGdhIjoM9A/IMSdd 0A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ehbk9caq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Mar 2022 13:18:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 222DFgBL188140;
 Wed, 2 Mar 2022 13:18:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by userp3020.oracle.com with ESMTP id 3efdnq830r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Mar 2022 13:18:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqAhL5bqplMBWx1mtMp+PbbkOInJYc9I0Mu6ioVV0Rb11tGzAAmQt4tOOdBrtFfVXdNdvN0cndLJHXYlmOpdce72qRgfSkX9OFWpv3fbaDcE7EjjOqalzGWezrevkEj6jEdA+nFuyumWvEag7w2iiopuGaUzHVuHE/gonC14vOTi12uvT+SrmGIeInDBn8zlwQUXgZ3dfGdk4pH34jBDmmV6Xah0kxC//zUA9peoECc68ze4zGXCFgWsPPYRdgTsb8G6Krf6fEVFArsbzMaueHBcbZQT7AUa3W9trUj5LlJp+VSWheX1A4UzGR7SN9lojaTEg2uC9FN7NqzC8gYSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5AZWSbOc0KTtdyh9+8qxRvai+pDBFNH4HZ/HB6BAL8=;
 b=isWTqH+pDWOyRcp9oL1Q4s017qgkkEdl5k5h5h5y/N+DwjuwNTCbCrnHsi/4aQPGJBWCFsijuwBy2BQZx48TLJOgYtMDRQeDevRTAwN9N4MX5SzlLlABdXDI6j9Q7GwUR7pq0SYkFTOZJpAl1HWBqkqz+Y6D8+TlnfCIcfoMgi2dSjQ3KY+qG8y5ZMBYXBPLRsLhHT59rLOnnlfo5AwD3HOCwQ6DeAItv64sJIHMAQ829dkuheLcqscauwgkNcSGPCS99e1OI1z9LyXhTVDrNxs9Qb7P8eOKMJh5C91ho2HgbXVtd6pIYUGVDfx4DT3oyIWAY21ipEY/9nVJU3FEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5AZWSbOc0KTtdyh9+8qxRvai+pDBFNH4HZ/HB6BAL8=;
 b=PJjdzF9TjGobAabBfiYblK9ud/IR5xmGXzkTg/BKBXtFsh6cBFVybzGFBNzOOElhYNORP4YctGBcO7xXTQr2h+YAIN61DqVqYSlAGz1AozPZERD95kfaFkam0CK5Mm3BqvliUIYmDCeZqASw/20BYw/iKpGsglFqsjRb9X62hgY=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by SJ0PR10MB4638.namprd10.prod.outlook.com (2603:10b6:a03:2d8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 13:17:58 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7%3]) with mapi id 15.20.5038.015; Wed, 2 Mar 2022
 13:17:58 +0000
Message-ID: <c291ca70-18cd-8512-0691-8ceaf3009804@oracle.com>
Date: Wed, 2 Mar 2022 08:17:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Content-Language: en-US
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Christoph Hellwig <hch@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
In-Reply-To: <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0701CA0008.namprd07.prod.outlook.com
 (2603:10b6:803:28::18) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4932796-e73f-4ab3-a65a-08d9fc4f121a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4638:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4638BB9851E883CEEFF34C628A039@SJ0PR10MB4638.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GSPrzSH2xlMTDF39TgX04iEiL427bx6ScvIrBm9FKJJ9BdagNMgzrfG7U2X2opM5UG5sb//LklP9IamiJ396TQP8+pzssceq1eK3NegcFCv9Gj9cwtqJ0BGPNZpZBMVaJbsqF4LvCgX1NwLbKwIm2DpExnQhTOKMyqvQEXeJGuJGl0h33phdjMpRckHM2Q0tNvXSC1GZCPNeSCY0TQAfol+yT9ychJNeMBqXj4V+OwbB+yXO4Ig8P6FG80eszfQjiT8DeNXVyJn+rlY3YeYHC9tM0sSW8GS5hgHcHtkY9nM7ZLSvs46PIo8iiqDmAMUGlm8foPIeQyecQFAMK3p7++dPfqDeXIfEAjNTjNv7pEiFN/8m2tTr4zwhxHL9C5e47j66GYAR3/r1QwzLCp/QKYdTbrs3ulJTJK4Df1zu88oueqlgDSNbI+ShBSMS8MZ6iwAWFF4b73snXkFl3czvNFc6k+yUxygaJ9pwt+4HHKLiYqBJqDmyTefgVbZ4UAD/L4Joe6Vn5bB4FNJ366u9gg1yMZrIjTQGuICq8c5oD2CJnCSRoTA0vRNDkGrF8bt3BOQs5IrS2p4xP6bAFIXw77ekzCKiB3cZnLRjnVGPhxzlZ8fbTfTEbrWwnhVimV1FbGzzJH8pijZcJMCihZ+WbVbIcrO9o4tmabsOw8WnTyP7q7NNVjJx5tMZyDLEbIlmcDxCn62aQPkiBziDEwEy72CUXRsv7+XFizXu5W2dSQrNWrSLgdQdf+jTrjGOsssv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(4744005)(2616005)(44832011)(36756003)(8936002)(31686004)(6512007)(316002)(6666004)(6506007)(66556008)(8676002)(66946007)(38100700002)(5660300002)(7416002)(2906002)(66476007)(4326008)(53546011)(508600001)(86362001)(31696002)(6486002)(54906003)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NldFRjlua0Nya1NYZHg4WGpPMTVOcHVZWHlDQ1NSQjlqRVlYUzZJbVdiaWFV?=
 =?utf-8?B?Ujk2UjNmangwUm9rbWFtWlkzeU5JMlZLMW9oRGtsTE1rZkhBZzFYTXFjRXJh?=
 =?utf-8?B?VkJPc0RUeFlpY2R3Q005aldIU3g1QzdUUS9XWnRvVUJtcFc5RFh4SlRqdFVS?=
 =?utf-8?B?Q2FUbCtiRXg2ZTFaUEZ0S1BaeFZKeUdOdHRyY3FOVXJUM3ZxckUyMzE4Ymhp?=
 =?utf-8?B?SmJlY2RMOXJZdGdseFFtNEk1b3dsWTRPRHl2UnVLZktEaTdsK2Fmb1M1LzFk?=
 =?utf-8?B?QmJub3crMFgvUGFaZWFBc2RhSm9qVU9MRUZId2JQUzF0V2toclpPMkM1SlIx?=
 =?utf-8?B?bkRac1lJZDAyT1J6UEcvMTArYWtHUWt0M0FiZTRNWEo3WnZ5V3EyNUtDaDZv?=
 =?utf-8?B?QWY1dkpDK1hkc2lWWTY4N2dLM2tudzlvK3lSRUd0MWVEKzVkREVCTllNaHBm?=
 =?utf-8?B?YmNaN1RQM3M2Tk52aE1Hb1ZhWHd1VGo4aDZLZGU3amRRZ05UcnhmR0xCZ05M?=
 =?utf-8?B?MmU4eGdPS2NXcmpJQ3I5V2lpQ2lFWU1qSHVkZHorcTQ4amIrdFVpUGlXWklI?=
 =?utf-8?B?MVF4THBZanljWUFZUmRqWVNFcHk5ODVweEFXTHpGQk1yaGRvcmNaN2Y3dG1n?=
 =?utf-8?B?SGN2cWtEWGNHS0VBMGYrYUV4Vjd4WmFxOTltK1BWa2s2dnU3MEpla3VBTzhB?=
 =?utf-8?B?OGJOSnQwYUYxZmpIenZzdEVSdGZoWXJmR3d0c0ZTVEJXa2VyMUFOYW1JRDI2?=
 =?utf-8?B?bi9ySmhSZENOL0M5NnhIN0IyNmpXMFpXVUJubDZvem0zL2oxZzQyd1owVmlK?=
 =?utf-8?B?ajBsUEtpSW5CLzU0OUVXcWRFVHhiakpMSlFmbG9QWTg3M3RBTXNzRUI5RUQ5?=
 =?utf-8?B?ejlnU3pGcUpVUUdjeU1IZGY2R3JoMU5saEZqTi9aNUZDZDdoQXNuMkVHVkpw?=
 =?utf-8?B?bXUxazRya0FRWUZQem9CdEpVVWQwdTViM00xSzZ3WXNtT3VjQVpwRUhuOW85?=
 =?utf-8?B?V0Z2ZHRlUlBmNEJjcmx5NDJBVFQ3dkw0czBQdXdqWm9idHpzSW81WTdOQU9s?=
 =?utf-8?B?NXVEVmxGTmkvdTZuU2N6MkxmUkd1YmhGTHoxMmo5ZXROd0tYNWoyOFA1SHNE?=
 =?utf-8?B?djlndExlWGxoM2dKNnROcVVrZWV5UmVDK0t3dzk3VmlseUtsNEJTOFk4WGo1?=
 =?utf-8?B?V0VGblJXbk1lUU9VeWFpOFpUVDRhazFMTS9wK2x2UWNydlJqRnZ6VCtFb0dY?=
 =?utf-8?B?TmpPU1NMVEpmaE9qSUc1SXFNTXQyMlRNb1RncXAyTm5acGxSZ3NpaVYrZkcz?=
 =?utf-8?B?aGdtYmRFZkViRmdNNll3UWtlWkZrSWFTcWMyOVBBc3VXeTk0eFlyZWVzZ1Uw?=
 =?utf-8?B?ZzRFMCtkVFF3RnBmWG9XN1VIUEV2MWwrTHBjeUF2TXZQcWx1Qy9DSTBUS2l2?=
 =?utf-8?B?cjVWcjNUamMzNXVyNlV0dlNKbmVTTWwyL0daa28xemVTMTFCU0IyUkxjdzcx?=
 =?utf-8?B?elczeWJDMjRGanQ4dTFua05pMXhxTGwyTkVMUzYzZ1JhbVFqeXdVNjdjS3ox?=
 =?utf-8?B?anpacUx1TUMvOFp4KzFxQW5RL1pwL2lGRW93OTJIQ0RUSlZ3REUzc0dTdTZp?=
 =?utf-8?B?NEdraTVxVHp5UXJ4NzYvMG12OUw1cXY1VC9RbVZzc2ErSzVqcTQzcUJXdlJl?=
 =?utf-8?B?ZW5rcnBVT25PdWxPbURjci9kK3JzR0hRTks1RmlEZFdtSjI3dWg5Vlg1TS9z?=
 =?utf-8?B?V3JtOWJKWVNxc0pJQjB6a1ZtU1RMNUt5UzhyYVhGYU02SUo0U1J6a2ZrMjBO?=
 =?utf-8?B?QnNxRGpiTWJzTFQ2emFpR1Y5Z0NhWlpoYWY1dkd5QTFhZXdXOThNcHhicXpw?=
 =?utf-8?B?a2Zsa1I5a1pjcFVEMUhLWHlvRFhZU2U1SW1qcGEwbVhDWUpmR0xFL1YyZE1k?=
 =?utf-8?B?MFY3Z2RxU2w4VUdvMFVlclRIcWpleEVhMXBNNmlzNklza2kwRjZXdmZSZnVa?=
 =?utf-8?B?ZHRHSVZEZjFaMnBoK21mKzgvV3Z4VWJ6ZWRySUMxbUVuUUNDdU0rWTJ0R20w?=
 =?utf-8?B?QzNBaFRuQzRnZ0xSVm9jMGJ1VWZGTXVDbzFWWTA3bUllUnVQYURnd2xGaVAr?=
 =?utf-8?B?b2k0SDZFS0M2SEU1MUNGM1VrczNnUzhvanJ2bUMyWTBJWVFLY3ppdDBmUkRa?=
 =?utf-8?B?L3lHaE1WTjdldlh2b0wxNVU1NTVpcXlkb1g5UkM4bFJXRDVjRUNMeXFnZkhO?=
 =?utf-8?B?emQzUzlrVDBDNmZHamRRODhwMmZBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4932796-e73f-4ab3-a65a-08d9fc4f121a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 13:17:58.7382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/beoJh8t1PlWcUcQHqx6za+Kw9gl95udqHLb6qqo0jVoSqA4a35HPHMzUWroiGeh7iird5EjViww4xis1bb7qO+56SROha4g+ITOwXkKGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4638
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10273
 signatures=685966
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=922
 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020057
X-Proofpoint-GUID: BfdmuvdJ22S9UkowXG8e1KsBx8SAEAHX
X-Proofpoint-ORIG-GUID: BfdmuvdJ22S9UkowXG8e1KsBx8SAEAHX
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
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-riscv@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/2/22 8:15 AM, Boris Ostrovsky wrote:
>
>
> On 3/1/22 9:55 PM, Stefano Stabellini wrote:
>> On Tue, 1 Mar 2022, Christoph Hellwig wrote:
>>> Allow to pass a remap argument to the swiotlb initialization functions
>>> to handle the Xen/x86 remap case.  ARM/ARM64 never did any remapping
>>> from xen_swiotlb_fixup, so we don't even need that quirk.
>>>
>
>> Aside from that the rest looks OK. Also, you can add my:
>>
>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
>
>
> Not for me, I fail to boot with
>
> [   52.202000] bnxt_en 0000:31:00.0: swiotlb buffer is full (sz: 256 bytes), total 0 (slots), used 0 (slots)
>
> (this is iscsi root so I need the NIC).
>
>
> I bisected it to "x86: remove the IOMMU table infrastructure" but haven't actually looked at the code yet.
>

Again, this is as dom0. Baremetal is fine.


-boris

