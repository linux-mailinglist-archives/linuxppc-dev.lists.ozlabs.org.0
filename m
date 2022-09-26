Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1B35EB464
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 00:15:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbxrx0jYLz2yx2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 08:15:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QndPviO5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.93.59; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QndPviO5;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbxrC5Y7Pz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:14:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsJGQ0Ql4OQ+m29ViM+ss8ESWfXCVyL6wBk6Tbpyo/q+HqbWO/CMcJpDU0C1iJWsy/OPCB19VKv9BZelODXX+9oJIBWzJ+QAAitpFvaOXkwgH++0p+AiX+mLNpAoc0uSAitUNez5SaUzpWG0p8nGvt2mzdsX1fe9y43jq05oafZCmwHEwjzvq8bvGutzjxc6js+fQ5NUwOZxvzUy1Qk9SCpR8N8E4eB3qnLedtifa569qJLj3mHnefqYaB0feJAxC8CWZfaBOh9dZfVqoRy2AKojyRGelv6ldv2j/E0iRWzeVGRZ31taBcS6MSaRQJh4RvqMgmDbsf+Nwbi+Ped2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2g+LvgGu5HmjnIQ4e+1YaJenZ4HHO0ohx4KHPWb0i8E=;
 b=BV3hLaCt3X7KvscbFiAEkBE0ydAUiT8uK6B9RA6hxr1rS/Spdur0KPFqQwEToe61xbSwifPkaqbqakyIhYMOQgNML3/R6lTNhbadUw6IHXHT2X7pC64ewOet1CB0q0TVEsSq+QnkKIpBJAWILdmwdezabi39n2aMkI63i+HPycq7MoWdp+U8f4AdhN55cCz24kHEFhYIL57c0yYXEj5vWBlZ9cHFxlO+qXEf+cTZSTOpwunLyQxD4/YsVhYO/cHjLkuiwf5DmDYExdg9IKsarhHIpOsw7pLNPOF6SwmdJ6+kCjZx/SUmY1VQKZEbJkyI5XZGx8Qj2gX0Tl2vRaB/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2g+LvgGu5HmjnIQ4e+1YaJenZ4HHO0ohx4KHPWb0i8E=;
 b=QndPviO56XxQJUoDJHQMA1km+h13U/EjWhc5+m12ObRTQuNmeZYdgMocYaSS4Vi3OUjfp+O/buxf+tEOPO929wjYO0EMyBHdAxDNlNVrpJh1kJU34kj+uG0rG3gKd/a1MpWaRtMyLbss8IIwpsn7TFg0B561PctlJ4pY9v9mtn+3uLujVD1F7Xjf2OWRzRo2eQM1AahJNgfg4hMFW8ElWUSdxkqYqHMOoiP7FGUMayeTRoLG7GjSEYmS0YdbGQJDgYTbNj6pCJ1rQ1vG+h8yKEsK7gID0qB6dYT++b9ePcNnp+uRvlcSxlajfgRL1+xhZzHbPkaGuSOABW8XTr0kmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by BN9PR12MB5383.namprd12.prod.outlook.com (2603:10b6:408:104::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Mon, 26 Sep
 2022 22:14:13 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::51d9:c02b:e5a1:254b]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::51d9:c02b:e5a1:254b%4]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 22:14:13 +0000
Message-ID: <6ff9dcc5-c34b-963f-f5e7-7038eecae98b@nvidia.com>
Date: Mon, 26 Sep 2022 15:14:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 6/7] nouveau/dmem: Evict device private memory during
 release
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <072e1ce590fe101a4cdbd5e91b1702efebb6d0fd.1664171943.git-series.apopple@nvidia.com>
 <881735bda9b1ba0ecf3648af201840233508f206.camel@redhat.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <881735bda9b1ba0ecf3648af201840233508f206.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::7) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|BN9PR12MB5383:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5d9840-5741-4d29-e200-08daa00c716f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Vg69X1cQAKzsLKXWR7uVyOU9iUyRbfBDv0NI8jjV8kGr75hFHbC+B1apucQUOrLgFt/SlJEh/iND3OkqZ/ZINp5BA+I+JB8PUHZ032UCWuF21bW/KPo7/QlRacKAxoAHMgn9XXQntW/hxZChViYKdJdfxvMeHdqxpGLPYC/Yh63pq+IzplPgQW0SZvHApGJBEhFLxRPxOhp4ZaudGp5kLjobpzhlEvoWHHUn5gu6eB//i6t4AFiyvJu7SKpVqCeTUW7mJB6GvTRWI1uHEvjrd2Rk4L8e30+A0W62/uHOSHII6xqMnfzrTq8hPz46bBUmSzb5S5mfQcumyH9WweI5Vxp2/7Z5OjZ7JhlZZvKtRnS1BKQt/kGxthh4pO8fPQsFoM+Q146814R24KYCRvUzPdE64HxvForfP/tYzLN6Qk8dduGnkia30ferRazT2iIlap7Bq7zKJSjJo3mqiA2XVUXZRuaxSf9vxy8VGjnxnyL1IZZOu64BxFauhnERdoV7AkDBEe1fNhBuw0mEMH5Qx2je3E+TO7Z24USJc7XjnAc0cttZxhkLlrb+01R+e1xgLaeoHt4R5mfyS0fM0vIZUCNVATlTxmbpwldTTUfihOL372B0ZHU37/P8Orb5pOlK629h+yWDeuSG5TuqbLdWYK/orHeNhBVRvTgm4lSmhcH3t4etJi642fHvYMOaNiWttkyY3XUmdVQRTWtlhfP7ZI38HV58/s4yxAw5lakDlYMXWuLcCPpdcmhINetfRG9bm7UKWqvnCJHnsunXbajpqY4GtCnbz7qwiHb8Mq+402w=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199015)(6486002)(478600001)(31686004)(2616005)(66476007)(66556008)(8676002)(4326008)(186003)(36756003)(53546011)(66946007)(6512007)(2906002)(7416002)(5660300002)(6506007)(54906003)(26005)(316002)(110136005)(6666004)(86362001)(8936002)(31696002)(38100700002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cGNJNVh5c2tXOWxzUXEwNUNGVldVblZCbHRTRUlJSWl0dEJkajY2RXI4TVZh?=
 =?utf-8?B?ZnFyTWgrOVowVmhiekN0UE5sQkplMmx2U2dkYjNqNTVCRUJmMllVcDQ3NkNj?=
 =?utf-8?B?L1VtcC8zRWJHWDIyTFU0U2gvekN6dCthQkVjUjhtYVhBaEhCUGxiVFJhSENm?=
 =?utf-8?B?N0NPaUUzSXFJdWpXSEMzRS9scVA3eXBMM3Y4K1hzMDBTOFlNQ2dHNTlJWWJp?=
 =?utf-8?B?ekxnUnZrZnpFRmtVMlNoVUNyMXRKQ29xb01IYXlYRkNGL2tZTXZKaCtBR2kx?=
 =?utf-8?B?NmNST1RoZjd4Wk42cGlzbW1wOExPQjBCcEVvb0Y5MHpLcWRVOGZYWVV3ZTBQ?=
 =?utf-8?B?cDNRbGQ1MDNvRUMvdGozL2lxU1FRV1VYOElZSzE4ek5idmpzR2E0MXd6Y1Ux?=
 =?utf-8?B?UjNoamlwY0R6c1YzQW00VjVoR0kwS0w2aGJZS1RJOHZaOWdiZVpxZ0U3U3dx?=
 =?utf-8?B?RXV2VVJRMEtVODRnYTBhS2JLVXVVTnpsZjNZaHYxWHI5b3c5Zm1FUGxsVjJm?=
 =?utf-8?B?Ymlqa29FZkppbWdKdTB1UXdvR0g1dWxld0xrcTF4Uk9PRUUyKy91ZWRzVldI?=
 =?utf-8?B?MzBKcnVXZE5ENFV3WE45WHY0TzNHTXRvK2k5RDF2Wm9zRlFqK1BCZWlZUTF3?=
 =?utf-8?B?ajBLdE5BRjA3OW83ZjlWTnNHTXk5VWNNVG5LSTd6dmFrWFYvVEw3MWFkNjRG?=
 =?utf-8?B?K2krTFpHWW5hZ3diY1l3V2tjWVppc0h4MllYa0dJemNNVXd0TUlZVUtEbUhZ?=
 =?utf-8?B?S2J6UG1ZUU5QWTB4Y2Vrd2hxdVlUV1dXNGloK2RxV3llVkJ6cU00RHVKNkdY?=
 =?utf-8?B?OVdpUm02Rjh5YzJoQVJDeXVhTTRKNDVpL2hDUXVBSTNTUnl0UzVxUU5kRDFi?=
 =?utf-8?B?RG1TTVFpdkNUQjRHQ1QvQzF1TjBYb0N2UXZNV2ovZ0pOTzFlbWljazRqaHhK?=
 =?utf-8?B?MmRuMHhDZjVFVHE1S1JUT3g4b2hQVzRyVDNJRFhCVDhlSTJKTkRIcmJLVjhB?=
 =?utf-8?B?UldhNXp1UFFyaGxMZk0vMW9nekNnTU1VZ0RlQVJVUGVFTHJXbHpNQ3dMMEFX?=
 =?utf-8?B?TW5CeE9oRnFZNWc1K2FRbWhWazJuckxwSFdlVmtHNzFXbHdyTk0zSFUyN0Fh?=
 =?utf-8?B?UldMdkhuRFpNRUdxbkVmVjZTZHQxNWNMcjBDd2MyaVhUOVM0d1JDeDJLVkVQ?=
 =?utf-8?B?c1ZRR1MzZDBOM29FeW1oRXhrYzBTNmQ0TmhJczh5RC9TTkgxR05sVWhuYW9j?=
 =?utf-8?B?cnZ6c204ZyszaVhmNGlaSGlsVU5BS1pYa0dhUkY2Q3FDQXpDR1AvcG05RlZD?=
 =?utf-8?B?a3M0NDMrbUdkYVJ4TW14YTBHbUNma1MxbThGT3Q5eUJZWlNRK1NTeHpsclVX?=
 =?utf-8?B?OHRDVEdvdjlRblBrMmVTNVovOGIyS2pzY0F0Q2JFWXpzRDk5TUQ0enc0OUd6?=
 =?utf-8?B?bGt6RlZSU0IrVTMyb0lvU1ArV3c0bzZLOVRRVHNaaUNXQitta0d0OEwzT0Za?=
 =?utf-8?B?RnJFN2FhUHVhdHRSM2FzOXlXaTBEdTJCYVpPOHVtOFpLc2lPWHFBNnFYZ0pS?=
 =?utf-8?B?YytKNUo2dTJqY3FuVk9TM0g0NG9QREM3U3RGV0o4MUlaZG1TcHhqTWRmRmp5?=
 =?utf-8?B?RVQ5SzlyaUxPTlRqWnRIYmVhdVI1d0tPWmEwMWNMV1k1MXQrV0ZGaXE4dEtY?=
 =?utf-8?B?UG9QdmFIOXUxUUgraXZ1eHpCVVVjck5NUW5LdjNmOTllVnFnTkIrTGV5Lzgx?=
 =?utf-8?B?RU5qQjBKUDF6U2pBWFJSYzA1MWk2U3VJNjkrL1BsSGtPQWtibE5JYUtLKzZo?=
 =?utf-8?B?Q0oyR3NiVThxLzhYcTdic1R6ZGoxRWZWcTM2cmx2U2JqK3B1S01HZU9kRnUy?=
 =?utf-8?B?Wm51NWdCYjdaR2h0TGREK0lwVVdaQmVtamlsOGJCR2xiZjEyNkNtelU5ZkE5?=
 =?utf-8?B?dHIzazd6Q3l3bzhNbmptM0RXdktWaUxVSjY3L2tpNVYwQkdreGczOUJIcUFo?=
 =?utf-8?B?K0ZZUmVnSjFpU2k0eFdMVnd3VXVIemgyNTY0cTNQZ09SRTVJUWhUSzFzZ2tF?=
 =?utf-8?B?dU1BR25nUHo2ZWRYWlBXY1dPK3ptM1RjcjNvZWo5cHVsWkJWYUZiOXZvTGJp?=
 =?utf-8?Q?e5LXjD0x1ZheO89uOIrgPG98K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5d9840-5741-4d29-e200-08daa00c716f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 22:14:13.1430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HDQQNZg2glLVeW+9HZ7gEyMW2/HvB9UejVgflsOwiimpDsVxpXp94mlS1oTzcuvqAeHONVaUbrsEGSL8qt3Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5383
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Dan Williams <dan.j.williams@intel.com>, amd-gfx@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Jason Gunthorpe <jgg@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/26/22 14:35, Lyude Paul wrote:
>> +	for (i = 0; i < npages; i++) {
>> +		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
>> +			struct page *dpage;
>> +
>> +			/*
>> +			 * _GFP_NOFAIL because the GPU is going away and there
>> +			 * is nothing sensible we can do if we can't copy the
>> +			 * data back.
>> +			 */
> 
> You'll have to excuse me for a moment since this area of nouveau isn't one of
> my strongpoints, but are we sure about this? IIRC __GFP_NOFAIL means infinite
> retry, in the case of a GPU hotplug event I would assume we would rather just
> stop trying to migrate things to the GPU and just drop the data instead of
> hanging on infinite retries.
> 
Hi Lyude!

Actually, I really think it's better in this case to keep trying
(presumably not necessarily infinitely, but only until memory becomes
available), rather than failing out and corrupting data.

That's because I'm not sure it's completely clear that this memory is
discardable. And at some point, we're going to make this all work with
file-backed memory, which will *definitely* not be discardable--I
realize that we're not there yet, of course.

But here, it's reasonable to commit to just retrying indefinitely,
really. Memory should eventually show up. And if it doesn't, then
restarting the machine is better than corrupting data, generally.


thanks,

-- 
John Hubbard
NVIDIA

