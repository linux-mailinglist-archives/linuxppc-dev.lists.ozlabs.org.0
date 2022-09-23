Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D92635E71BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 04:07:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYbBD694Jz3c8c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 12:07:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GNpVZe1+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.220.79; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GNpVZe1+;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYb9V1HRWz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 12:06:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBjtxg6G1ROgl/bBfr9AMut/Ym5TJ8WslHhKTzUtBWOJB9Rn4M+Q+Rs47qQcU0KVJliNZME/PQum+KL1XAEOlrYBuFtlBXQWIRG6f8NO5Of3YBUwOHMrNTcuN5/gsZeuUhalambHkFKvkcJmiP5xLZZiwJY4gH25CnDzGRzHVTX6W/3tEIyM/oYTvr/wLCkRTzFRWlOnIQUAox1lbTSqkrg1C3HqYDFp9DNxCyUjfoieEnCgkZhiPGBoWYDv7HBkKe//aTU3pMtu7I1nSnkrFCeLluyrY2MHbR4+aV/YeV/OWMgMjx9PvmRGDT9VjkKBy0pb+XYgjmqo7o+yBQFh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buFa+WQw/q1/AAhXQgBnAGV7XGvGJ0obkpDaCo/dQzE=;
 b=ZGQ7sA0x1mxeC79SG8AsukL7biP+Aeo2NTVVckixUZRqPukIoSbV+LVnI75toY8KAzW8EeftEJ5GJnGPwgnypaGZ2DZriOF6qLbWWBKgEpzvNdfKGqZ0Bnb90Y6xStaSiBU3yIKIA8dJmfGfyIB6g/YVGHU3D00TqdcLdGZ+XoGSt2YVVVidlOEidcucDWYc9XzAJRJIhWsecd7nNG3MqMT0ALFoEhNODX3rT1EYqjTWQI2V+x4hrboRva8lfJOIAqp3FNRiKZfLUDRNsn16bjPyC9Uw1nmUJ6zx2c0n0UZ+f3/bEEV0+HOtYZ7TlaF2ICNdbZNyuzZmXz4L0LjW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buFa+WQw/q1/AAhXQgBnAGV7XGvGJ0obkpDaCo/dQzE=;
 b=GNpVZe1+kdSaOc1GCTMZ+Px6lsg13hcNIy/iQ0Ywcld9ftIH8bNldDZx1qV3MaWmCrrFJVKoiVgug4f8M3KUKvICMz0Kb53i4kf+i6XKHNY/MelO4qSgxgLvxGK8YBVdxeg1hhc9wwsijL4cXF48bjLz2XI2Pf5WbC0a4AugfTiTPAAsWvq1l7A8LvminW+cNkOSYVc4yci8VZzF6HwqzBRo3sJynCqeylqfXs2TLowWEkcjODteFvxh82V5KSPt4RAFx2s6kFSCCsGjrQcMBrDSKtoL64rvEpSQBmqb7dCUA6wUvqb6P1tDVy03LVMmuzFm9W27GRrqV0LZ8nKdsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4140.namprd12.prod.outlook.com (2603:10b6:5:221::13)
 by PH7PR12MB6612.namprd12.prod.outlook.com (2603:10b6:510:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 02:06:00 +0000
Received: from DM6PR12MB4140.namprd12.prod.outlook.com
 ([fe80::e0c5:bb15:a743:7ddb]) by DM6PR12MB4140.namprd12.prod.outlook.com
 ([fe80::e0c5:bb15:a743:7ddb%3]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 02:05:59 +0000
Message-ID: <d0c59eb8-baca-26fd-5f10-4a1f89bcf7b9@nvidia.com>
Date: Thu, 22 Sep 2022 19:05:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 3/3] checkpatch: warn on usage of VM_BUG_ON() and other
 BUG variants
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-4-david@redhat.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20220920122302.99195-4-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To DM6PR12MB4140.namprd12.prod.outlook.com
 (2603:10b6:5:221::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4140:EE_|PH7PR12MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 271e93ad-9713-47b8-75f2-08da9d082846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gsXoAKb7vTen1Jf/hlXxUgxLTOYkLbE+2OS3EIo8Dwd0NKUy2xPNHJ7h4JS3Cvngi3YrJ2FKqD1kaXDzB18XWaccEdBlKBpyib5JYUSjLHzY23Ww5MWQUeLeAPFsEJosTNgzdpXpj4rdC/+JOvawtqnnnq4CA8ZrCDPMOiQUVYLqWQmW4pmCDdsS/5S+PBAjk0msNcjlslYLGil9A05iCVm8c+taXRga/tSLFw8Ezscot/0dl2ZEhLdlCVGw/kj6c0eDu3uYTFsEqGRs3HKDH4jHlxUHbOjPB83CIHd5UZ7g/+Dn0Ble+91ntK7lutf6Oi5iBsNl2WSPsBcX9nV+Bq+rNS+S2gZFOeXQgPDGn5jvuQYuO7YAM/gsuZaOcDznXIQFstbyJ3dpju3RZFVnHhveroXzZF1w56Hr8/Ij9mZjtXNlymGg2oZwL6YnMNr/mQLZVI1ME+lIOTE8TvifV8SgLonj1FqwWYKhxVAao//6QHyXDynPJJddLpupTozMZ1QCh0r3g8VFbhG1ae2vnO/WoCsk6XcPCyQ6M6CTFOnKD9NMpWq2iErE574Yy4IRcuF2egc1dFds3LlkNGnpHNErlTmyxKIUqGt9itC+Ewo7/eABXdXhvAXnVYuxBGXHciT37GXaKmqx5EAuDz+Ei+4BJ86wmHBiNfx+PGqPZQJD4es2q/u3nXTAu9wtd7IUXl2xLw41HdhKWGlRjxWGfEp9R+yo9mmm2M0xCOIABUmGFWAicS8PRsPaQ6YN5YYDhayQ724vACF3IgIYid/XEujgk4p+kv/biVMavwlA1iSe6aC0jptObAwkW9l4zmbM88s9jiYcabyD9uIXtd/OmXRi2qlgS08BLGWvi1KRRxsnhjCH5m4ZD3RMln7xxYYi
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(31696002)(8676002)(66476007)(66556008)(86362001)(6512007)(66946007)(2906002)(8936002)(7416002)(5660300002)(4326008)(6666004)(41300700001)(53546011)(6506007)(2616005)(186003)(83380400001)(26005)(316002)(54906003)(478600001)(966005)(6486002)(38100700002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bVdUclBiaytLMW9OOXpmeXJkNjlRZ2FDZE1Uc1VPNVlNTFVsSXJwQVg0elBm?=
 =?utf-8?B?SDhHZjdub2dUNHVENnFTbm5yUDBPeTZ2WDE2OTNlMHpUeFFsYkJhOXJMTlJT?=
 =?utf-8?B?SWRKa1B5TG42Y1pFZXlncXA1a2wySy9QTlN5L0lBc25NbXVZMUNKa0gvUGlC?=
 =?utf-8?B?Q01kM3FVT1NnbjZmR0pETWpwOGhqMWpqVFBvM0VoRHM4WmlUYzFtZHNLN2xu?=
 =?utf-8?B?aG53K1Z4c283VGFxOEJYeVFlUFk5T3p5elFOUGRaM3YvMGxlSVpwZ0M5bW1Q?=
 =?utf-8?B?UWF4Q1cyRXJ6MndtK2c5QUM0NStib0pBODNFTWJKeXFzUkdJdDlmMks2czJn?=
 =?utf-8?B?SmVEYTVxQUdDT2pWSEdhVCtYWFhZRGNodHFOd0pKQ3c1aEZJaGJKU0ZQMkxO?=
 =?utf-8?B?Zys3ZDlGbmR4VGVyUC81cnRqMExlNER0VEJ0R2NvNGt1aDk3YklDSmZzVVg0?=
 =?utf-8?B?RWN6SExrOXRGcVdpNlVVRWQ0cnhvSDYwSXg3YTZoaGhtQlI3NEFMNTFod1V5?=
 =?utf-8?B?VENSRnFoRThjY0xIalRxTUprZld6eG0rZllncTBvT2QyeXdUVndQMkJhQTNR?=
 =?utf-8?B?WnhMQVRJTExROTBPcmp5clBYOFZhTHZraGM0WlZXSmJVUnFQc3gxcVRSMVM0?=
 =?utf-8?B?dW5TdlVaRHYrbGpXcnNqWFp1SEtNV3Zndk1weklEcDFjcW10VHdWTzArRXRW?=
 =?utf-8?B?NHhpMStQUnVOS1dqR2E1YWtLcU1UaGlRNW1TZno5Ry9mbnpDM2tabElUUXVi?=
 =?utf-8?B?b1ovRGc5L3V0OCthanpBN3Mwd2ZYYVpVNHRIa3MxSFA0dGdITm0wL3MzNmll?=
 =?utf-8?B?NnBHNmxMMmRYTlNoTUFrRE9qV2VMZHpFazBiUjFwclgyMXc3bURGM1U3Y2My?=
 =?utf-8?B?Nm9hOTdlQndlaTlWWmNEUklQWEd4dzRCbXk5UzgvL3JCbHBTenFrVnJIVGpk?=
 =?utf-8?B?Y0d1dkFzdUl2bmRLRENGaTc3Y2I1YVlXaGVFaDErYjZ3TlNXYnRzYW1qZ0lM?=
 =?utf-8?B?dW1paVdkMkJSb3VwV3oxMTJsSjUvM1hEZE1EY0lkbU9yMWFQMFNSRFowb3Q3?=
 =?utf-8?B?d0l3OTRLME1LcTdyOHgrN0g1MEV4S0lDcXd6eEg1OUUwMTdFQ250YVZ0ZjFG?=
 =?utf-8?B?MnpFL1NBSU5SV25nUUhPUUpPT1oxNS9IMTNIcnZvcnZ0NE5rSS9ETVJvWXFE?=
 =?utf-8?B?TG5jUnlxVEdqK2ZpajloYmczWXh4YTR3Ulh3SFJIZUVkUjNnZ3pCbTdiOEpw?=
 =?utf-8?B?R2ZrSEwwOEh0K2UxWDFNZm1XcW1rNVM2M085UnhCNk9OUkgreXkxUUYwSEpQ?=
 =?utf-8?B?dnpSK1FJUVRJNjlzc0h2a1l5cWh1TmVHQmFSMTBYbkdWVUpSa0NmaWY4TTd0?=
 =?utf-8?B?SWZUVVF5Szh2VXUvcUFOU3lmMzRVYWtlVlhGMHNYOTVDeW00ZGRCNis4SnAz?=
 =?utf-8?B?Nm9aaGhJcVh2eTQ3UFB2UFlKTWxSMlRLOHo2T2tvR2gyQytjMk5kUXVOeS9u?=
 =?utf-8?B?b2kxY1JXN1lSNEt1ZnhVNXUzYjdtTVh5VXNaMnM0WUVucGp0TXBWOXBLSDFP?=
 =?utf-8?B?RVZGM0JwWjlKV1MvZVJqc0dkT0lXUlgrckk5cC9FR3RBVFNablUrSW1uTFB0?=
 =?utf-8?B?eVRqSnlGYW1TNFJOMGFnODJZQWh1dXhCRGZjMldQbndoRXB1SXJ1VDJTUVFO?=
 =?utf-8?B?QUNBU0I4MUtveDVnQWxIK2srMW5HYnRhTytGbHY1Z1BsaUJ5VmR2N0xaWmd4?=
 =?utf-8?B?ZGRDZHhKZDI2SFdQMjNHQ1c3VldlSEF5Q0VDellQNDk5SVRaeU9VMmxCdkIx?=
 =?utf-8?B?cHhWNGQzekhlU3RPanFZeHRueWhLSFVtczRKeUlQZ0tmeDBCSjJ6RmFZRHA1?=
 =?utf-8?B?QXNPdTZQb0xmUk10V1ROZGVOV2lQNFN5U0NteVVCdnQydUVrTmxwa2RYRVMx?=
 =?utf-8?B?QjNlRjAyVXQ1Tjhtd1RWc1J3OTJrdS9WYzI1S29iR2JGWmJycExIaUxlcXov?=
 =?utf-8?B?ZnB3WFBESU1JSUwyWmJ5b3lkcVJRR1pMNy9MSndjN09aUVdONm0vTHVTTWIz?=
 =?utf-8?B?NVBnU1NDWGFPS2kyWTVMcEtaN1VsT1F0MEZEOFp1eEVwSkhLbDNPNVArZmV3?=
 =?utf-8?Q?rd+0TaP8hN/lJ4qFBclYpb5GO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 271e93ad-9713-47b8-75f2-08da9d082846
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 02:05:59.2363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hd+k5PYSAZczENF704qH+V0VZcJDYABccKYxDp7B97yLDjnrEkwEjCn5n6+0RMLZL8EMQT273QVJ9xPEoAWg3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6612
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Nicholas Piggin <npiggin@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/20/22 05:23, David Hildenbrand wrote:
> checkpatch does not point out that VM_BUG_ON() and friends should be
> avoided, however, Linus notes:
> 
>     VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
>     no different, the only difference is "we can make the code smaller
>     because these are less important". [1]
> 
> So let's warn on VM_BUG_ON() and other BUG variants as well. While at it,
> make it clearer that the kernel really shouldn't be crashed.
> 
> As there are some subsystem BUG macros that actually don't end up crashing
> the kernel -- for example, KVM_BUG_ON() -- exclude these manually.
> 
> [1] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  scripts/checkpatch.pl | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 79e759aac543..21f3a79aa46f 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -4695,12 +4695,12 @@ sub process {
>  			}
>  		}
>  
> -# avoid BUG() or BUG_ON()
> -		if ($line =~ /\b(?:BUG|BUG_ON)\b/) {
> +# do not use BUG() or variants
> +		if ($line =~ /\b(?!AA_|BUILD_|DCCP_|IDA_|KVM_|RWLOCK_|snd_|SPIN_)(?:[a-zA-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/) {

Should this be a separate patch? Adding a bunch of exceptions to the BUG() rules is 
a separate and distinct thing from adding VM_BUG_ON() and other *BUG*() variants to
the mix.

>  			my $msg_level = \&WARN;
>  			$msg_level = \&CHK if ($file);
>  			&{$msg_level}("AVOID_BUG",
> -				      "Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()\n" . $herecurr);
> +				      "Do not crash the kernel unless it is unavoidable - use WARN_ON_ONCE & recovery code (if reasonable) rather than BUG() or variants.\n" . $herecurr);

Here's a requested tweak, to clean up the output and fix punctuation:

"Avoid crashing the kernel--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants.\n" . $herecurr);


thanks,

-- 
John Hubbard
NVIDIA

