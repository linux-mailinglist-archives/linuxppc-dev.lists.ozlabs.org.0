Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C72E5E71D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 04:22:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYbWh0cVrz3dq8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 12:22:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DHqAZ4CP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.244.73; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DHqAZ4CP;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYbVp4L6Rz3c7t
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 12:21:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDYOz74rPWZLbwKe57CRQ6O/66rwXEVfrtWsgqWM83toDZg+fYTHG/YmAHhto6zNYT2zppJEGJEbPJxXkkO0+lR/6VsXO+6crux9w5WK80nGjXFZnjLXCypkEGNZbViYHw2awWNxUVjrtTwMnFZE5RSB2vX4m72/29ksmJYZvfLLLDHqLgF9Q1pfn7aLk8N/qJYTjTltXHv9Hu9UoeP1NNd4PbcssU3voaTtH2t1zAyeHo2BDer8HWMK3RGtbU+Zt8YesfMexN0B10OJvhP3/sZ2THB6g4tiaF7OheYbwdY/V4gJx/DUmR2tN1yAlXLlWwR7SX+NFisMi3pGyedENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8iioLFs6B92++I0DhPs9LAeQLfXw03cABUKMTkRccE=;
 b=hJbaKrg6keBmq1ubA++mAzzB6BUb6aqZwNOldfl/gNFX2rv3X9q5a8thB5B5yP81dzzpKIiv9xmL5PNNA0ybMWYOq8E3l8sSxRdGIDNmElu3Hvu3Uf8D5EmPliucCRggTtZVlUt8EWixr3sk8ZNW0QhhqQE1vtwriZCNd3Fo7LQV9TSeYz672X72Ab2y+Qb0Njju1Ct+jVF91hjwBXp/nDwqRiqEojRPdi8x42JFYMobhsfftdrVAwownqq1uB0gX7/Ws4hVUhwXLGO++6GmyAKUeYixhVYC5akjR5WlLTZUgzWm237iIQb9I0bZ+SbqjImtT/Vb5uVBRS6xydJdtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8iioLFs6B92++I0DhPs9LAeQLfXw03cABUKMTkRccE=;
 b=DHqAZ4CPhMaA2lRIukd9d/+LgMrKHOtEa2HsoBvbqsnmJB0QDMCekfRAOb2eqMMme8Oei4W7PE67rBM9oVKoKzMY0ZRlgpqpTvy4lO67kKlQbh+XbBrkYN1K3tj+0ILtypTp4y4X96eYCQG1Mubkiy9MiR25d2iT4QGyWzAMz3wYlI9AIqm+GSrZ5gaeTVYhfzHdWI8fWHuRreBd71SynHys7EuSl3tW2USbESc5V4Jmb3cSIaAGJ/kNf3LLwVllZK9gKwCTs5iYU0w5o6zVPMtZgAu+ccHmqxSOBHDviQ1drgdUl266lBVap3XL+z4iNZzzNoZ0VzCnwzrtvBfAYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4140.namprd12.prod.outlook.com (2603:10b6:5:221::13)
 by BL1PR12MB5898.namprd12.prod.outlook.com (2603:10b6:208:396::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Fri, 23 Sep
 2022 02:20:59 +0000
Received: from DM6PR12MB4140.namprd12.prod.outlook.com
 ([fe80::e0c5:bb15:a743:7ddb]) by DM6PR12MB4140.namprd12.prod.outlook.com
 ([fe80::e0c5:bb15:a743:7ddb%3]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 02:20:59 +0000
Message-ID: <60fa5b16-021e-1e54-7e06-39bbb871eaef@nvidia.com>
Date: Thu, 22 Sep 2022 19:20:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 3/3] checkpatch: warn on usage of VM_BUG_ON() and other
 BUG variants
Content-Language: en-US
To: Joe Perches <joe@perches.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-4-david@redhat.com>
 <d0c59eb8-baca-26fd-5f10-4a1f89bcf7b9@nvidia.com>
 <3179f4545d3f71358da3e6c6ee18085af601b2eb.camel@perches.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <3179f4545d3f71358da3e6c6ee18085af601b2eb.camel@perches.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::49) To DM6PR12MB4140.namprd12.prod.outlook.com
 (2603:10b6:5:221::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4140:EE_|BL1PR12MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: 656eeae4-ef55-4292-2707-08da9d0a4129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+xOLqGb4p1VKLVTGD21TQU6Bq4wNvaw4KTI8gOG7l/Yk+5wb4bhGu2dQEJe8aLIskop+JDzu9hah49vXnmifCpYebnaQOmrX7XQ2TKYM6b7VIrdVleSjm73BgbARqkwcDyjMTKVWkv3SKgPGuqaak+fAX+0XjvrjqPuxDGJqcKU6gj8Dz1kaGkwoKoaZbfGyka0PZmbsD2jcYJ1oNEw41q208pUvyqSf4WGMXJNh0n2K6t6/trc1So8EyFX+1Me3HCwOFb5shboaFWlEDCyekkpb1QepGOwLgiF9uvp26I9nF0I3dUri0UX5jBZlZc0TAjSUMND15/ZlXdXFdA3VxNaBEEWAZtIwD8iI0qnlk0ubhSrgJ0SKbshipKC3hkl3abqNhnhvfboJ2vNb9WIqjJ4adBfaYi3NSLaeHXox39oriE6FFtxHEDur4CycqqGz28Noq2egnQWik5KRrMG+f96eoREbiDyVShDJgbBdii9uDWFAFtXvQbqRYF5VwEoiaasYv2kC8hTUheUreA77L8q6rwayTKICzjAQenuoofBellX6riUAMeSfDqv1N4U8ApbLXa1z9S/Gy5Y+QvpDzuzrG5pR+WPoeLxdGBEydlrHXixWStj0DtpJRIFXSB0Nd2uSlg5JEChQm4SmvAeYh/pasIIL9ZT4BoRfv05Pu0WiXLIQ8PvqbxiJBE3UiNns/q9gF0B5VSQIptS4AQ4+vgt1Ro8Ystuicgq9+M+dJfbWT+n3GQJayw0FtARcNnajTV/xpSoNtDincQosTrbbUlbc3vvhs53OiJRsb677F5Y=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(6506007)(26005)(53546011)(6666004)(6486002)(41300700001)(6512007)(478600001)(2616005)(83380400001)(186003)(5660300002)(2906002)(7416002)(316002)(110136005)(8936002)(54906003)(66946007)(4326008)(8676002)(66476007)(66556008)(66899012)(38100700002)(31686004)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RnNPaGtGSjhjQ1d3VGlhNjVkVVRsQU96Rm4rc295eTJ4dFRyOUZYRlExTjBi?=
 =?utf-8?B?T2hNQlRObXVQZFhtNlBFckVXQXVFNDR1TURld010Wm96YU1ad1lEa2tjRjds?=
 =?utf-8?B?ODNObHM3NlJXZEt4K1JZeVFYa3FCbXZKcmZGK2J0K0lZSk9PWCsvYXo1UDlB?=
 =?utf-8?B?UEpYeDJadmExaElvK1NTUlFzTnlyWEM0d3RWT0pkTVIvd1dRWDlncGdmcjBr?=
 =?utf-8?B?UkIrd0Npbkxxc1NtVHlmM3N5aEJ5VUFzdmZHVkNEWmZzTEJVVStSdHYyOE92?=
 =?utf-8?B?cGJ6VzAyWFRpRjRzSjNCeGtndGdQNkR0NUZsbmdzVE5ZNlB1SG1DMGl2c0VP?=
 =?utf-8?B?bUpEbkE3TkNMZzUrZU0vVWFDMHk4dk9OL3hYaUxmdEY1d0UrdVBzM2svRDJB?=
 =?utf-8?B?RG92UlpyS3ArcFJMRXlydzJjS2g3K3lmQXR3alZzamJ3UVNtcW9rblJDVzlT?=
 =?utf-8?B?OGQ2UDVGUmxuUlJJVkNxY1ZtQW84dGdacTJuS2VRd2FXSkNEYzRQZlFqc3Z0?=
 =?utf-8?B?emZTc1laSU8vMU1HNHUySDFjRnNoOTdnUDhTWmVFL0NOZEI2U1hpU0N4UUZ4?=
 =?utf-8?B?UTBuSk9aeit6Q3MwYUtPbEVQSlIzR24wMkVIazlvcTJwUUNNUG1XcmJJS3lL?=
 =?utf-8?B?VVlKeC9OaUI1UDFBbkhhTDdQeTVwckl6YWxjUUVZQXJObHZ6VGdpdk9OUGt2?=
 =?utf-8?B?T3M0UkY3MWJwaENPaUVOd1RaODdxTm9TWXczV2JPby9aUFBPbmlWcGwrT1Qr?=
 =?utf-8?B?dUZveDV4ZkVYNStmWWVIWUNzMnhTZkxqTE1KSVYrVUEvRDgxaUh6NldmamdC?=
 =?utf-8?B?dlphSmlhc056NGpsUXM0OVNSVWFvdUlNaUxIckFPNHRUQmRCQkxsT0dDMzRx?=
 =?utf-8?B?WS9lSjJmT3JoNlZkcFpEcDgralFkakt2TjducTdsbUF3dVlSdzBhdlcvbG9o?=
 =?utf-8?B?SkZnSHlXYTYwakR6WG5VUlBFaG41UFRhTjFTTk9DNFFJWi95TTRjTjV3M1Bp?=
 =?utf-8?B?NWhja0U2SUJvMkduc3BFRW5LcWFCTW94aExFb21vRHJvRFFETXZsR3B2c2ds?=
 =?utf-8?B?M3ZqcXFTMlNYR3V4cDRvSVRxK2JGTzd2blE1eWFqUlVaTkxEd3FxY0NYalRv?=
 =?utf-8?B?YWRiKzE0MCtSTWZuWmxlTUxZeWc3QWJGQ09EL0FVZE5yZDY2V2xjc0trelA0?=
 =?utf-8?B?QnowRHVwYk45cm5MVHhoZGxDSHhIWnAxNUZYZ2RQVGVJMTVkb3QxUzB0ckRq?=
 =?utf-8?B?UG1xWEpvVWNwcVFmSUlEM2FaSzNjYVpvU2l4NlltTGFtN3h5a2s3bS9oNGZV?=
 =?utf-8?B?ZXZCVVJ4a1BzSWVpQWJudkFlWDhGOTlxQnRHZWczMEhreVFpcjVpR29CVlBP?=
 =?utf-8?B?Q2ZsQ0lJZEtzMDRuZWVLRlhBVzBOcG9hUDZleDJYS1plclRzOGpGYjFHaCty?=
 =?utf-8?B?UVpWdzZrdDR5NmpNcEVjSHJIVVN1dzNmbk13OVFtb2d3MWFRbTAvQXk1VVZ4?=
 =?utf-8?B?S25sS1FXVUczNDdRbjg4cnN4M1FtbU4wYUFUeXFqVEdwczEzYVdmb0NvRTBX?=
 =?utf-8?B?dGtyUXp3QWx4amJQai9sdjhBcHJyNFU0bDNvWXNjczB3Ryt3YW1TbjRhL21M?=
 =?utf-8?B?Z1pkSkZKL00vTW9hZUdidUZ0bG1CU1Zoa0lERE05UDR1eVByUi9GUzFwRlpT?=
 =?utf-8?B?eDZZV21pUTBSOHlmaTlqc0tIY3h4ajVsN2VvWXo3ZExzbW54YjYwV2QrZ1Vh?=
 =?utf-8?B?cEZoT3E4MExNZXAwTjh1eEU2SFliTy9kWUpFb2NXZ25mLzhUSTJyTFdCQWpq?=
 =?utf-8?B?SzlBaytUUWx1RHNXejVjNnZ4QndJTDhzam02S3NFdWtkSlR4VzJETVhoUFhU?=
 =?utf-8?B?MmFXclV4TW9FTWdMYjZzMnljR1RxWWxqdWtTNWlIdHJNNlBleURtUnJhTnpB?=
 =?utf-8?B?eVpTT1cvdTNZcFdZMC9TK0tuL1Z2eGlEU01VSUZrUHFpTGtBMjFsdjlwZXp5?=
 =?utf-8?B?anN1eTV3d0RVamp2OTU5YzNiem5YUHQ3YzdLYmxDdzFWc3Z2TWRyZDZESmx0?=
 =?utf-8?B?YlJ2MlFRbFQzVnR0ZUFQQ1A3cUppd3U2SnRlRVdEUVRURWhYYTdkYU40eWpC?=
 =?utf-8?Q?wl5QOo/fHbq7/Qgzz577BLjMy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 656eeae4-ef55-4292-2707-08da9d0a4129
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 02:20:59.6670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Te6oJrffCtnTSwx97hzHDtGYOfEYDQxNqnZIZglKsfH5kYBcYqvW7K3yniZbDdSQohZYqLnINEda3LKPdJJUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5898
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
Cc: Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Nicholas Piggin <npiggin@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/22/22 19:11, Joe Perches wrote:
>> Should this be a separate patch? Adding a bunch of exceptions to the BUG() rules is 
>> a separate and distinct thing from adding VM_BUG_ON() and other *BUG*() variants to
>> the mix.
> 
> Not in my opinion.

OK, then. :)

> 
>>>  			my $msg_level = \&WARN;
>>>  			$msg_level = \&CHK if ($file);
>>>  			&{$msg_level}("AVOID_BUG",
>>> -				      "Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()\n" . $herecurr);
>>> +				      "Do not crash the kernel unless it is unavoidable - use WARN_ON_ONCE & recovery code (if reasonable) rather than BUG() or variants.\n" . $herecurr);
>>
>> Here's a requested tweak, to clean up the output and fix punctuation:
>>
>> "Avoid crashing the kernel--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants.\n" . $herecurr);
> 
> Fixing punctuation here would be removing the trailing period as checkpatch
> only has periods for multi-sentence output messages.

OK, let's do that too. 

> 
> And I think that "Do not crash" is a stronger statement than "Avoid crashing"
> so I prefer the original suggestion but it's not a big deal either way.

Yes, stronger wording is better. So how about this:

"Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants\n" . $herecurr);


thanks,

-- 
John Hubbard
NVIDIA

