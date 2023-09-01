Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 307257901E0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 20:04:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=dKGNzyzK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcmBZ73ZBz3c9d
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 04:04:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=dKGNzyzK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f400:7e8a::81b; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=mirimmad@outlook.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2081b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::81b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rcm9k3tsVz3bxL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Sep 2023 04:03:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqDrz3eFggw6AOAoyMp//Jt4wiYi0j627wvjTFCDfjOvwAIe9OtrRPE3KVKHgyFo2baGSh1OlMmofw2F2SBXNbTD7iXEzGJLH913SUA4jnY9zmbwp2INt6Ax6RXIbfxOsRJvwQZNQJmE5QSo1BAm46hiNM0cm+IiHekzS6fYME+1aprbjcfRASw8CV6pofW5im6mAL1AjkP8YsRz9CJiptqryZbfGWhhK3czqYs7R0rClqYbpSBzlGsFcR7TrvwRI0iNtZMafBYBTwD8CVbAAnAylCpxLatSxiXpg+vsqLHz0wsnuWj+KLbn7HkfufRfvoSWtV091iwzw7wSufgYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0FJYR6GtUGAEadg2dpfOHIguqpQFVo7Nz1AHHxUwgY=;
 b=ckF8z+GHJX1Xo4i10iGTnnfsyQuTSHle4SsmXEPbTroymjT0A6ImehGmMbqxDkUYaGChinjvbqV/jMAS86DNv+ndHD2pcb50EZGUCg+ALQCjiBKGl7/0ZlJDr1tn+7z+V6Ay4egfCsQjdY/QcDnZrk2Voeq2l505/ofsf4VgW+B6HLhf1Uvk/5IlovsEI4g0gFmCfg6lpI6Cgw2wnStZjEpGEA8gEWuNJf8WvELOh+zzbIh6m+boRXOe6r6uKRLNnhIeLshLevu4XNeATziQTSFstKKc8R7Xt0eSkcLgIASPU1x2fGC/RAAK4i4Qt/j/bpCVG8vkqOZmDREB7UWZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0FJYR6GtUGAEadg2dpfOHIguqpQFVo7Nz1AHHxUwgY=;
 b=dKGNzyzK2lLHHa0gP0xGCWAYu5hRnk/IXt4JuIz14hPRm4twj+Mj4lWSeqGK3bkRC4wdh1JWqvoXEj+AmAlCivJCWoaPMO46HASsIQKc8F3wMOPrlr2lLtloovq3QoJqdd6ZLqyL3EhcSsRQmwlJl63cqjlaILEBFM3mF4hJsBuFXbiSNexl+OEwjlcpEVrw0mBnFWn/q4ySSCe8Yipwwg8BLNKxbu8J/vL2v+J8qlL56qNB+f01Vo+pLL/iTWzMc2N4avxXyn6wosgMw6VjUbCRyzW2Q00F4BrvL0BzhPirQCyoAdyrW01Z4x9PDtmxm5ab9tjHTtY4l/1Si+c4PA==
Received: from CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10)
 by SN7PR12MB6957.namprd12.prod.outlook.com (2603:10b6:806:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Fri, 1 Sep
 2023 18:03:18 +0000
Received: from CY5PR12MB6455.namprd12.prod.outlook.com
 ([fe80::912:a56e:f6d2:86fa]) by CY5PR12MB6455.namprd12.prod.outlook.com
 ([fe80::912:a56e:f6d2:86fa%4]) with mapi id 15.20.6745.015; Fri, 1 Sep 2023
 18:03:18 +0000
Message-ID:  <CY5PR12MB64558C413B3D8A60AA5C202DC6E4A@CY5PR12MB6455.namprd12.prod.outlook.com>
Date: Fri, 1 Sep 2023 23:33:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] powerpc/powernv: use appropiate error code
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <CY5PR12MB64550ACC0B90FDD120D21E47C6E4A@CY5PR12MB6455.namprd12.prod.outlook.com>
 <fdb8d83d-84ce-76d6-db9a-bb232492170c@csgroup.eu>
From: Immad Mir <mirimmad@outlook.com>
In-Reply-To: <fdb8d83d-84ce-76d6-db9a-bb232492170c@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [E+IBbG3kYOKcJbF9K4f/oHmO8TH9bVtlRF+zqrPumx6KdPM5BhR/Gm9BcnA+GPAQ]
X-ClientProxiedBy: PN2PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::28) To CY5PR12MB6455.namprd12.prod.outlook.com
 (2603:10b6:930:35::10)
X-Microsoft-Original-Message-ID:  <1706716d-a52d-e991-cb80-611039697f7e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6455:EE_|SN7PR12MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6e0aad-2ab5-4ad9-cbe3-08dbab15b882
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vD9Nb4stEFRZ4r64IHCzwIuk0R4lBL/GWKGMqH9iWi2j7CVgrKWrXjXo9y2XImi1b07MFzb5oLJW3iXeGBmDhHnLCdWQvB30U4T/KNwLGBJVLHygYmyzwvGFAnxx3Ioy3xYokoFuzjWmr4EL3aUgaCwtGXk5SmVF0KEyZKLimB7UF13JXlf1PraRHbRmZHYMCugWjxapoU3aqZrpE9uw4uxxFG3pUQA0bDBSNxTdcF1jB5gZomAea6MIaqV/WjSqXOACea1yfDrho0Q/LGQXj1VNp+aLV2tjIuPSByLKoQBj71bvyPMnD1Kowp++iyCbk/6aguJMYr37dG8BcToyzrU7OS1plm3o7RjkD2tEPUZeBR9TjsyNBPdln603v/YrcivWxqUlIDGZxSPBOhEJdPvx2Q72DJ3ykGwHps8m2bu2KGgAMruIDzm28KqbdTnvMfqVOWoFEaaKwjG6vKLnIuSumRNfFm6dEmKH1x+5VitkNCrBvWu5btbK00wMVfQP4oYd4hJ06TxgppjhANHMZ9wPBSvd7bX7Ng43GpPNB6Y+USFefWtAv6rshErYR37o
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?L0F0dWdBOHBrelNCUHFDSEZpQzJFR2NBdXk5UlZCSWtaS0h4azNiRHpvMTk2?=
 =?utf-8?B?Q1lxVFVCQmg3VDdYVlBudFQzQi9zN0NJOERTb0lBSk0xWmF4aURubHM0dWNx?=
 =?utf-8?B?R052ZnhqTXMzOG00QnZJK1VCODkvQ0llaUhTbnl5Umw5Uy9HZjNwTEpGOWZZ?=
 =?utf-8?B?cElWYWpPQUYwbFUvejQ1TXZHZStBM2EreGFoMmN2SWJ5WGJqQ2N3UktBanlV?=
 =?utf-8?B?OFhNM3VUTEVvQm9ra1phVk1TQnp3OEdid3dVa3lUUGtwZHppZHpXOVk1YVVN?=
 =?utf-8?B?Y29oZlk0VXBFSmR0Y05hVTNnWU5ocHpKSjEzMmw4T0dUWEE4cHJOeE04L3la?=
 =?utf-8?B?SUUyOUJLWHlMYzFmZytZbndBdEJLT3M1VjQraERYMGFDWlplTm5oNUVQdDdh?=
 =?utf-8?B?c0czQ3hwMWllTUUvd1lPamdwUGJyc1U2aExjRTZJOHR1M2tRUVlPY3hQZXNh?=
 =?utf-8?B?VzNnUHVUckJ2cGtDSWQ1UWVFbU5BTlJkaEZ0NkxKQy9CZVBtU01INzNUNXhy?=
 =?utf-8?B?WGFGYko1YnBIa3FwMWNJa3hXSlZ5UXdoam9FaW1tV0JPeFpaV3Y1U1k2ZmQv?=
 =?utf-8?B?dlZXTE5ycm5CeVVha2dVK1VSWCthRGR2MVh3RWpKSTZPOWNmTTNKZTJ0TFZG?=
 =?utf-8?B?QnZIZy9kcGVwRHZHZ1J2Y3RIVzRqcmwzSHIvRWk1UDNVVkdnV0pMSjVkT2RM?=
 =?utf-8?B?ZXpESEwxM2FSSVQ0eWt5d3NSbkdxdGhGcXF4bXViekRrL2xUbTZibTYxQUhI?=
 =?utf-8?B?YWxOclRnM1JwaERBZTkvUzc0N21Uemc1Y04wei8rejZwcmlueFVYWTk4d09M?=
 =?utf-8?B?d0xsT2ZDWVVJRUl1QUVJMytBcWMxWENvOTEyQXpYSVJDSTZnZFk4VmViSjFl?=
 =?utf-8?B?QVppK2tWOU11UjIrdGtzNE5YRHZtN0p2RmRYdUFCMjBFTVRIT0RlSjFhekR4?=
 =?utf-8?B?MHRUemFldEQ4UUQrdWVVZVpwcHNMOVlLN2lkdEYvNXNWRDRnWndQN2MzYnZP?=
 =?utf-8?B?ZlRvUDNoRTZjREhhdXFLblhsKzc3QmkvWElCeDNBNVNwbnlVWlM2MklORkFU?=
 =?utf-8?B?dXJhTmwrazJBeGFWZWpnOXFRaGU2eW5KQlVyOEtxU3hrajZGM2ZuRnEyTHgx?=
 =?utf-8?B?SVJhOWZKejVGaWZoZ3dWa0JWc0wyWVV2bEZqRVpJeEtmZlZyUWxkQlgwVDFI?=
 =?utf-8?B?NUEvY0dCa2NTaEVQUHdMaGJyblN2dVYwN0E0MWc0QkhCT1lvWkVOUW5xcm5a?=
 =?utf-8?B?VkdnZURhZEo5TzJ4UmZkRlNUUm84c2ttR01tMEE1aEMrQURDNXY2S1daNWJ2?=
 =?utf-8?B?cFNHU2MxUS9pbHUyRTVKcFNBR3dyWDEwRlNDWmRLUlRZRDUwOWJJeGoxSlFl?=
 =?utf-8?B?NCtITmZQdWUxamNPRUlCSVVMbjZkeXZETXBMWm4xa1JYSmhaamF1MmRyejVB?=
 =?utf-8?B?STdEUlh3YUpBWFh5NU1nZEhla2NITkJBbWVGR1ZKbXIxMFlWWnZuUkVaN21P?=
 =?utf-8?B?dHMvdFE4TGlqS1hkNEFmZ0JOWW1mRS9yQlBLVjIrMnBwdlplaGRJTEllQzdW?=
 =?utf-8?B?c0UvQWRDZy9GZmUxcTRLSFJXTUQvVHZadEhWVC9HR2ZaWk9uODcyTWFlRGxL?=
 =?utf-8?B?dHpucndjN1NDRkFVY1h6d1JtQ0tRU3BjL3BBcis3Rm1YM3R6TEQwellUWDBp?=
 =?utf-8?B?djloSVVEMzc3ancvOWloT0FITU1OQUVMWVNPRlRvVUJzN016bEhHcHBBPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6e0aad-2ab5-4ad9-cbe3-08dbab15b882
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6455.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 18:03:18.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6957
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, Immad Mir <mirimmad17@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 01/09/23 11:10 pm, Christophe Leroy wrote:
>
> Le 01/09/2023 à 19:19, mirimmad@outlook.com a écrit :
>> [Vous ne recevez pas souvent de courriers de mirimmad@outlook.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> From: Immad Mir <mirimmad17@gmail.com>
>>
>> -1 is not a valid error code. This patch replaces it with -EPERM.
> Can you explain how it will work ?
> In scom_debug_init() rc is built by oring the value returned by
> scom_debug_init_one().
> What will be the result when oring some valid values with -EPERM ?
> It was working well with -1 because when you or -1 with anything you get
> -1 as result. But with your change I don't think it will work.


if EPERM is not always necessarily equal to 1, we can put a check in 
scom_debug_init before returning rc. If it is less than 1 (because AFAIK 
or-ring with negative number results back into the same negative number) 
we set rc equal to -1.

Immad.

>
> Christophe
>
>> Signed-off-by: Immad Mir <mirimmad17@gmail.com>
>> ---
>>    arch/powerpc/platforms/powernv/opal-xscom.c | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
>> index 262cd6fac..ce4b089dd 100644
>> --- a/arch/powerpc/platforms/powernv/opal-xscom.c
>> +++ b/arch/powerpc/platforms/powernv/opal-xscom.c
>> @@ -171,7 +171,7 @@ static int scom_debug_init_one(struct dentry *root, struct device_node *dn,
>>           if (IS_ERR(dir)) {
>>                   kfree(ent->path.data);
>>                   kfree(ent);
>> -               return -1;
>> +               return -EPERM;
>>           }
>>
>>           debugfs_create_blob("devspec", 0400, dir, &ent->path);
>> @@ -191,7 +191,7 @@ static int scom_debug_init(void)
>>
>>           root = debugfs_create_dir("scom", arch_debugfs_dir);
>>           if (IS_ERR(root))
>> -               return -1;
>> +               return -EPERM;
>>
>>           rc = 0;
>>           for_each_node_with_property(dn, "scom-controller") {
>> --
>> 2.40.0
>>
