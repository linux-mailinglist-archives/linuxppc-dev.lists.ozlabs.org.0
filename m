Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F2B597EC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 08:44:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7b375tzMz3cCL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 16:44:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=selector2 header.b=BbZ6Uxs4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=virtuozzo.com (client-ip=40.107.104.121; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=alexander.atanasov@virtuozzo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=selector2 header.b=BbZ6Uxs4;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2121.outbound.protection.outlook.com [40.107.104.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7b2P52mFz2yn5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 16:43:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKSA3uYCoyihwYy+nYvgPTDp806DNKDyyRrAC4HgEUMLoaBn3jP+pslfO0BWGt6DRqfFhtul4uYqzoVQASkPojTNYgYZ5nW50bbUH3+T1UGwJQKMq1nBH20C/ZuPvkY0D90axuWzNgUM/eiHk7Pwol5SVtQ9Vu1FagCaAzryfbOS7FA1yQw7YLqu77ytXwR3swRfPzXzlgTst2mcUi97NPO27VJY5CY5681tRVYplmUOXpCNgD8cUjABg8ksaTlLMLKM1hzqwBybM6H41lO3gDs/AR51vkIJrEZ4NPGoHNKg+McssI0pL1EEouUt8z4c8rGv0ScYYZQsRimiVtPPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYLYLf/glmri4PWUT3cOAHQ00t6csHjFqp4GnehsEtI=;
 b=fbKMNVzBNled1pxqAuPtBcNdovPkSsKJDyIeVY7bTnsTYygRlnKIayW4Z8GhWk3UKiemBapTyejOtOA+X3sCfvo1sSs1S/Hvb3qrx6p4UDtkuiXTnOwa0Jsl5RoknpKiVJ3YxyeEdWi7RNeIIwBJSS3weyjlL8vsuZiNsS0pO1y7SvYrRIa9gbv0AKF7wZGj14cH5ENtKNMDEKAg8JzTA5ckfw7JaIW+BNZYuVlY50evbqnsQVg8dX3LunbuiR0Df/kSYxJebFdCegr56r/Z2OcNPAKJeHeAZkYKotozdyO+3wnYrP+6FlrVZgVp8BuGMM0qtGXUOpP6e0Lh0dWw+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYLYLf/glmri4PWUT3cOAHQ00t6csHjFqp4GnehsEtI=;
 b=BbZ6Uxs4e81HCnEx+8BY4wm/y9Kq6wpPBtMu1ExdZ/w8nYA9d4Fi/T1WuZQEbmlKbzG7aU648p350fCn589XMakXBODG5a92lAIIQP3IksAK1hF+skm38dixkZUyPJRCfTmAzEAtQ3SGzntswljvoarGLzYgPE9fCaoNfjfbGHpBL9bC7zwMZ+ldBIcuWdRoQ3Ssf7YVausOGvKq895BlRWluwRSEILriru/qdX8h7nfgfrISjUH8diAkMs4iBl8lXTY2eeryh0H1Ic5Twn366dTplC6e9OOysq55eMhnmbnNDqf6rJ2uZ5nGPqVtcwvvGsquwrKNmodwVxnxpjFDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from VE1PR08MB4765.eurprd08.prod.outlook.com (2603:10a6:802:a5::16)
 by DU0PR08MB9106.eurprd08.prod.outlook.com (2603:10a6:10:470::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 06:43:33 +0000
Received: from VE1PR08MB4765.eurprd08.prod.outlook.com
 ([fe80::cce4:bfef:99c9:9841]) by VE1PR08MB4765.eurprd08.prod.outlook.com
 ([fe80::cce4:bfef:99c9:9841%5]) with mapi id 15.20.5525.019; Thu, 18 Aug 2022
 06:43:32 +0000
Message-ID: <e692b61d-7760-48bd-b22a-9ffa9162b4f7@virtuozzo.com>
Date: Thu, 18 Aug 2022 09:43:29 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 1/4] Make place for common balloon code
To: Ritesh Harjani <ritesh.list@gmail.com>
References: <20220816094117.3144881-1-alexander.atanasov@virtuozzo.com>
 <20220816094117.3144881-2-alexander.atanasov@virtuozzo.com>
 <20220818044123.q5yzdaszcxl7mcl6@riteshh-domain>
From: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
In-Reply-To: <20220818044123.q5yzdaszcxl7mcl6@riteshh-domain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To VE1PR08MB4765.eurprd08.prod.outlook.com
 (2603:10a6:802:a5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad0092db-501c-481b-cdee-08da80e4f7dc
X-MS-TrafficTypeDiagnostic: DU0PR08MB9106:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ydLlKIwFMd0GDCkjHSz3ilB0FwncTT2GqW7O+KAhQmlrUZcKGWTyQQosGbVtW0or2cvHmv/X+wRN5x1k15nNG5r3g4usMGoRTpHt5ydBhnyde4gSQxsDDjkkD3OQUwdn+ETCEqbFQjl9DJBqKZxFZVngeyv2daTEaKwgvtoOLKSTJQR5fszdzah5GABGmF06ufv/HDluwZ+r8On9n8hqi5R1vYYWbIxWJc1a3cfBdNwDbsF8ZKP1T5VyOZ93QTFMHKI43UJ1ZRdO8+Y25PNZlcDJkbQQU6cgc9NK5X/i4d5/uEJWxk/+8nws5oXWMu9/AXeUiweUo/vrBBcllz/0DA7mv40OGRjux80LC6G0y26QTF5KV/iTbLMeTY59gER2JnwV7rLTkmtyElhWXXVZ4dbRf5ddsXRNiAhgrhosvWiSrLy5CVnWIDpcpHJyCXaV58rxwD7lQNOoRl/XZeJXiagjmewUpoWXb+AG9zbl/WiVLkJxCPzq/gwcOgCaHxUx3ex9TIKFwHHw5t3a/C+nL+Fh5JWlkhy66bbX2meeNawlGT3sBTxCc6GwV7prxBLkRnb8bQI9zXMncOCj/i5I3qsgAe2tQL1cQvPioAueZbhZETiubJ6oARvNLz5wkjISB1GKwO2z8tZtmxkwAiLxQlwCldCKt2yFe6ffp7VvZa6lxWMrpN+/KPtLmSSC3ao7QJbHTkPmcVco74Gt7l1bnAyXmvhre3gzj8/Y91rMtKNd9QLhvZI9hGjsVkSpfDJ5ZeHoJCVBq8Xs/bls0v5D7rDENulrKH4L95fmTLz19cRAZXx/w6m1GHl1nNMuFgL4
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4765.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39850400004)(136003)(346002)(396003)(376002)(316002)(38350700002)(38100700002)(66556008)(31686004)(8676002)(36756003)(66946007)(66476007)(4326008)(52116002)(53546011)(6666004)(2906002)(186003)(44832011)(26005)(41300700001)(7416002)(6512007)(6506007)(83380400001)(86362001)(6486002)(54906003)(6916009)(478600001)(2616005)(8936002)(5660300002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UFZTb2NDSjZyVlJ3ZGI5bVNHazllaHBEMXJVd1NkSFFOd0FuekxicFhpUVBK?=
 =?utf-8?B?Y3B1cVNBemgwcENCbjR4ZkdzNXJRdFVjb1JIaXBrc0kveHZ2T1ZkV1d2ZmVo?=
 =?utf-8?B?TGhXa29VUnpwZmw3cnZjUVg4NlpJdDBadlBSQ0lDbVBwUUVENW13YSs3NVRJ?=
 =?utf-8?B?L3JvWFFJRG83UzNFcFB3SEh1R0dpUkVCLzI4ZGZSdStZZzQvNlkzbFRYenJB?=
 =?utf-8?B?M1p6TmpHbnk0T1BIcmMrbFEzUlEwNlNEWVRuWjRYeWJEbE5DZ0NaSTBXQStP?=
 =?utf-8?B?V0YwUkszdnczMHBQZEFpT1hBeWM4eHBNUURzTUU4VjBQa1dFODhnWUVjQWhm?=
 =?utf-8?B?cVVvODllbGFGUjdMZDFEajJlSmpTNENRNjNqV0Y4ZElyTTdhallFLzRNMGU5?=
 =?utf-8?B?dWVRYnV5d2ZsMDZBZnQ1bEs1ODNkOFZIMUlaNU9kOXRha0NiQ0xZUEk5UkJw?=
 =?utf-8?B?NmZDK3Bqc1dwclBOaXVGNTJML2ZBU2VFUFRrMmpKcEc5UWNNM0drb2pVUDUr?=
 =?utf-8?B?UytpL2pKK0RHaFJyUEEyZ1Y0Vjk4K1NDYlRKbGQ5UEpkUk9DaFlPcXVsdTh4?=
 =?utf-8?B?Wm1EN3QrQnZZQWZ6ZlEyM29mM0YwcDNBZDdudVVXR1puL253dC95R1lVcmhr?=
 =?utf-8?B?MW4yMGEvNEUveFJrR1QvVjB4UHB5Q2U1NFg4VWhoSGVPdHhEbWxOekRzeHRS?=
 =?utf-8?B?VXlWNXJ6Q2t1UjVjcFU3ZVI1UG8xMDQzSEpNTnJXTnBqMnRvOTlQN2VPa3hJ?=
 =?utf-8?B?NThORVdMMmdOQW9xTmltckZyQ1JKdzd1OWJ5dzM1c2c5YnVaWmkxNUFMVDJF?=
 =?utf-8?B?QnNpNTR2VEN5UVBINGxONnlpRjRDdTlqNmkvMWUrN1F4N0l4T09tVGlTY0Fy?=
 =?utf-8?B?TzlLT0d4UUl4M0VBUENMOUo2Z0lIWXNYZmpYYnJ1UjU4RWxESG9kUTE1Qy9x?=
 =?utf-8?B?UzB2VitwbGpUMVU3M0dGQlNGWm5rcjc4aFNRaFVWMzFiWEFLY3QxK0tQdFlk?=
 =?utf-8?B?cytYK09SaFZBOHltTnR5ZWlQTHNqaXZ3dXA3cEU2K3M0cWFjTk1PdGttUXBO?=
 =?utf-8?B?MnF4bmxyUnREY2hqeThUY1VwcDliSmdYc2JhZ2dMdnNmbUJDY1ZqQVMrZ2hq?=
 =?utf-8?B?RGl1ZjJGM3o5NlYwK2ZBZmZyZE02VEk4bWlJL01KUlM4NGlRU2E5WWh3Q1dk?=
 =?utf-8?B?WUY1NXZYN0dNOVllaUxsUzFlN2Qvb1h5NnMwMnFVQnFwdzR1ODlDNjh1L0Qv?=
 =?utf-8?B?QUhXTDBpdEM0ZEpoM1lJa09ER0VaZ1FGT2l4YTFVZTBCeVVMUkI2MEhzWlNS?=
 =?utf-8?B?NThZWU92d3BmdzJvL2RyZFJLNVdrRGthRWpUZGlYQ0Iyd2k1TlpHRWNPNm55?=
 =?utf-8?B?NVh1Q2VtWDhRdUYwaDdVNXdOUWRsalRocm1lNXg2ZkVJeDk1bFdYenJwY1pP?=
 =?utf-8?B?ZHBDcnBlNFFCYlBWeEJOcTFYS1JYbkFsWDRBeW9waEp0Sm1raWdEcjFUdVVl?=
 =?utf-8?B?S1dhVC9zVm1udlBCRWNvVVBTVGJKU3JZdWtMTFI1bGluVHZTaUhRcElUKzJX?=
 =?utf-8?B?OGhySGtmRGlRZkJHNTZXZXIyZndsYXkyNnNBV3hvZ0I0a3dNSXAyVWlzdTZC?=
 =?utf-8?B?anlRMDZBT2ZPcFRZak82OVJLci9vdVFOeTFWem9HT3BWZ3VDYmFpK1NBdURu?=
 =?utf-8?B?WXorV0UwcjRLQ01wUUJCVmFkWmZHRzBJa2xrSnM4cHNmMUdpWm9MQjl4NG5H?=
 =?utf-8?B?T0hDTnFCaHhDWHExN0owWjJEQlRaeXVRbnZGb3RITis5OUhPNGZJYnN2ZUx1?=
 =?utf-8?B?ejZlVVZSMlF3VFg3UGdYYTJBeGxCSE9RWW10UlJUSmtobDBob3ZmS1NyUS9w?=
 =?utf-8?B?UXQrSXZ0Q0l5bVBtRitCdTJUQnVzNTNKcVlXK2dIL2Z2ckNsdi9lV20yT0tH?=
 =?utf-8?B?aW5ZU0VFdjJ3VFlFVnVSZmpkenVPNEY2S3F0NTdVcUVTMDB2TU90RElPamtt?=
 =?utf-8?B?di9BNTAwWFdlWDAwNkYramE3V0l1SWFBZ2pGQW9sNFIyQWp0WGZ2blkyVmFn?=
 =?utf-8?B?SmcrVldXZEd0d1cvRnYwdXdQSWRiN3UzME1hcWpPQ1VDdjl6bXlVekpiZVFD?=
 =?utf-8?B?RE1qUVl2OTlhVHVPdDIzNG1oK3ZYcUFUTTNmcU1jdHk0Uy85bGYyNllSSnpw?=
 =?utf-8?Q?z5KyCKBa0MDL7cuvNmopxAo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0092db-501c-481b-cdee-08da80e4f7dc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4765.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 06:43:32.7563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KK9X8yKbgb9JPA0U9d+7wxzZZU6jTy9Bj27+raXbm/kzSj5/rSBDNpj2pprpMV5Asco5RilV4H2C1aqydI9N2jjj4Xamt1LqhHs89OMPsY6h5TG3O4VJgIs0TCz+0aK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9106
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
Cc: Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@openvz.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 18.08.22 7:41, Ritesh Harjani wrote:
> On 22/08/16 12:41PM, Alexander Atanasov wrote:
>> File already contains code that is common along balloon
>> drivers so rename it to reflect its contents.
>> mm/balloon_compaction.c -> mm/balloon_common.c
>>
>> Signed-off-by: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
>> ---
>>   MAINTAINERS                                              | 4 ++--
>>   arch/powerpc/platforms/pseries/cmm.c                     | 2 +-
>>   drivers/misc/vmw_balloon.c                               | 2 +-
>>   drivers/virtio/virtio_balloon.c                          | 2 +-
>>   include/linux/{balloon_compaction.h => balloon_common.h} | 2 +-
>>   mm/Makefile                                              | 2 +-
>>   mm/{balloon_compaction.c => balloon_common.c}            | 4 ++--
> 
>>   mm/migrate.c                                             | 2 +-
>>   mm/vmscan.c                                              | 2 +-
> I think we don't need balloon headers in above two files at all.
> I don't see any references of balloon functions in them.

...

> Since I don't often look into this side of code, it's better to confirm :)

Yes, you are right. It passed a visual and compile verification.
I will remove them in the next iteration. Thanks for pointing it out :)

-- 
Regards,
Alexander Atanasov

