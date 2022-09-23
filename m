Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 452735E71F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 04:38:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYbtK6tLNz3c6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 12:38:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S9o9f2fQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.220.73; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S9o9f2fQ;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYbsb51VQz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 12:37:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4D9yxYm/5yEeA6grxRRWuQ64DJMigKrhzRKYWX6/KNPO9Iqee+s1hg2+LGWWYMgucUsJh34BBugZjjBaYUGuB9FheNv43iHVZxY2rU8rNZEtHJmVdMMviAQYCjlDD+4G0O6RHO6XAcLkZrUOEuYkKh4sJkB6k98tiG650H4CHkI30PEZgTbV3mRTQUzpCyvtAN8B4VbnWohreVxSB2bZJkkJV2HYOVpGpSgVbGhjp2m6qzxMFggb5Fhbyzgyxqz6iCxeLIRLGuBxNasizQh38pHdJw7I/wPTtTtJyvv7Gju3mbIwgYkLwz5wlhp01RZuD6ygNPkSW7k7n69l6fLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wzn0D/MxUnhnYZZ3jU8TuIWHSyX6ZWseANC8UQDdc9c=;
 b=kRW4W0w6znP0cW236x3yOh3cQVFSdnFzgTgYUiqjKwMUYIPNW2VrcsUtuqaC+y8RiO5VytbC+Ihe8owyxzXj1DjszMHwf1UedBtUH0ARzdTL3/vOpkFNrpPZxQuIt0KqXjw3qTZAR1e9cZgfw8k0aDzMIc9Diko6eNQoLFbvqE3+GLZXLuEu4eDxpREcxfpHAdVRvnkihh+3qSF7abvy4KWFoTvbzK8qlGLnYDjaiNPAGtLuVWt56AjNFGEX2nMVxfVRidf606Db3d+bYlN+h25zKwILsNvQq/JaTV00HdanompiYJ/TGanIN/8B3hNwpMLbRJurvsmZKuTQnei27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wzn0D/MxUnhnYZZ3jU8TuIWHSyX6ZWseANC8UQDdc9c=;
 b=S9o9f2fQBWyIoM7rARGzeFET6jHxpyJZm1BNGeUbYq1B5cRK2fW4wKE17VG6+bVmkaB0Ri+4HZBP4keP5MXMGnkDktvIEERGHZNyabYRQdVJV1b2AZ+76PbjBtebYH7CFV8OdUgSb+jAdRoLu+dSoFoZNpAq9pMS0aeSlnZkb8LJbTWebomeIvzbkzAJ/wGm3lVxicSWQLtMZ7TEJPXkjPZ+/Yy+kjZiNqabcJ1DqXdZo7oH1LQYh1Z02CQJGArvx+mHpNdjMhoQysEKXtF2CdlFEIWFbT9PZ8+vuBVsZ41/ric68ewfoAHXpHamzynUbLm7pYVH1+4CHJrbvupjVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by DM6PR12MB4266.namprd12.prod.outlook.com (2603:10b6:5:21a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 02:37:17 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::6405:bafc:2fd6:2d55]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::6405:bafc:2fd6:2d55%7]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 02:37:17 +0000
Message-ID: <1c80fd5b-52af-0729-1930-bcc2729c5626@nvidia.com>
Date: Thu, 22 Sep 2022 19:37:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 1/3] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-2-david@redhat.com>
 <3dcbcc7b-9ca0-1465-5a73-075a1c151331@nvidia.com>
In-Reply-To: <3dcbcc7b-9ca0-1465-5a73-075a1c151331@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0095.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::36) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|DM6PR12MB4266:EE_
X-MS-Office365-Filtering-Correlation-Id: a1726f05-2020-462d-c7b9-08da9d0c87cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	R+ES0j//v6wqhp38ff93eyqAPuf2ObucWuqWJruge8/AYkzn8TgvubgRLgT2D5Wxzpsd/yMNGRCheYIMYNe8j3GJJhuDGu1cM5ga1+3FLPjRP7ZvOtM5Cl2ur0MvLjKBo4WnmOr4kqZnyltzjUunR70PbicaO0oT30ucasS79IKKTqNyz8Xj0WBn+1PAlp3sgm99UnBAqNzLjJ6nmtSpvaJ0DF4FBHEXWkdGodM6nkmuhx5eziJYG8xpJ5uvIsaLsagexkuWaWbLROnAxNmgeQbOs+kEmIgJbAK4VwF7MMq/eA4mM5Lp67K8kuDKc10tF/yOi52uPqmTj/h98kwKpfbIPXMc7866YQpl3Dfr0CcrDehkFuBewRh7en5hDO0UNLrANHv827pDEfQPoSZg/hTHq18venwRLtjMz7OlmbtjNEUormkmwuBWAoWqgkP/8ZrdHbg7nzhjBjtt6L0TCbU14EdhBW9F9JM3qgDGnQ+Q1tG8E5Vn4aeQbY2tkjnypPuDon6r0+vNboT97NBVpH32lIS9Q5qWNOdfpJCp+ttJS4SIqpbb6uUHYf/gGWydkRmDVHXGKjHRTc+P1uu68vlLF/cW5MdyWBPlb3Dg0lHsHdw6uUgBmrWPAO/OG44LALdxpWctX8p6ApY+63qo8TJOtKE+rM5uZAK/MZ5aCUiGdWzizkxOSE1e0J3PHmv5Mas031xJBcjOiz6y/pDOcapDKUMVhJKnkfPrEgxGs/aAIwd2/G2WYB6Vda6oUAf1eT8K6b9fMjZUKgPcDr22vzU9qv8tbfsV/QLm54TvE+Q=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199015)(26005)(6512007)(54906003)(2906002)(6506007)(36756003)(4326008)(53546011)(6666004)(2616005)(186003)(31696002)(86362001)(66556008)(66946007)(66476007)(558084003)(316002)(41300700001)(8936002)(8676002)(5660300002)(7416002)(38100700002)(478600001)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dDhVUDFOSWNicW1nOXRYT0RHL0lpVi9ZckZtRXZOL2IxV2hsV1Rvb0RtN3NL?=
 =?utf-8?B?bFdTeG5FWkZHSENUM0toWTgxbVdsVUdZMmRSaXJrcENaZmhibFF2ZFJvbkZO?=
 =?utf-8?B?VUhnZ3YvQmw3dTFCdmRaV0l6cUNEM2dkdFRIb2ZBZENOQWtFV3h4L3N2ci9u?=
 =?utf-8?B?Z2hGSUlQckZBd2Q1YmN5bUE1dXcwVFFacGJ4bmthM1I0QXI3aGg3Zk1VRHc1?=
 =?utf-8?B?RW9CdFh4cU1kVCtGQW01WVNBRVVjbGV6aHVEOG1Sa3BUMGJjVG03d2preTYz?=
 =?utf-8?B?cXBHOWgySDFSSzNIbTVVREpNZCt2d3BkWURvMHEvOVJWWHVJTTV4aWNKZlY2?=
 =?utf-8?B?WW9XWkZOeVpRZFhkMUhWNkNRRDBxY05UdEpjVDV5YWpEaVNCdkdJTURzdDQv?=
 =?utf-8?B?N2dsaXBqNnRyQW5lUVF4cDZmc2Z3VmU1OVhHS2FpYThnOUwxbTNDV21iWkxm?=
 =?utf-8?B?c3NORjBXcGNhL2RHK3dSREVuOFZrdG10Qk9VSmJENW9ZVHdLcThZbTEyZ1I3?=
 =?utf-8?B?YVcxTkV2RFJ1cEJ1cWhSSkR5ZDg5QjAyeFg0WUIrUHJabTlqOFJxdTNMKzdI?=
 =?utf-8?B?eXV0NjdRK2h6cndEK3g4dFBib24vTHR5aTNMRVJhVXFhOEovRWhwSjFKelgy?=
 =?utf-8?B?YllXWGFNQ0tuKzdPQjIzamNRZG40ZFIxSmovbTlIRGpnQUxqbEV1SUUzQ0Fz?=
 =?utf-8?B?V3lFekNCK3ZPL3RBY3R6MzNHcXozRnF3ZEk0eUY1V1lRWkd2TmI2ZFFEYmwz?=
 =?utf-8?B?cmxtUWR2djlEQ1daWDlqYmhFZWhCSVZscForN3BGNkFDRmJuS3NiclNjWG1C?=
 =?utf-8?B?UEkvK1RhWjdxYTdCMVJhRGhVQkk3Qkt5N0krV1FneGUzRG1KeFhGMWNjU2lQ?=
 =?utf-8?B?cVFHK2VOV2p5RDJCY3F1YUp4STdSVG5QSnhXaGtyazNiN0JUUnVxRzgvcmdn?=
 =?utf-8?B?TXhndEk0WXFGOWd6ZEI4U3FvZUMxZjlkaXFITmlaNEEyb2JiU1AzUWlpaVBs?=
 =?utf-8?B?YlFkWVZRSmI4eVJWQ3QvNDgvNHQ5UGQrY2FUakxpQ0NqQm9LcHo1ZEJ3WWpF?=
 =?utf-8?B?T2lDdmtpVWdaemU1VlJzS2lFQzAzbG5hblNwZDRnck50bEFZYzQzTWp0Z0hL?=
 =?utf-8?B?bTJIejZtcktXNFVONU85OStCOXhIZnByVGttMGV3YVlmc3lDTjBkL2VialFm?=
 =?utf-8?B?Z0hsZGljTlNoeFgvZjFrZ1VVYjRFU09KUXZwdzdxcVEwcUpiMHpFenl0Ty9n?=
 =?utf-8?B?aEpTbDdNYlBVaHVaMzU5aUlHU25uQW9aVFJNWXV4dVJobUxrL0I5TGp5K1py?=
 =?utf-8?B?dERJVUlnN05MMDZlcUk1TEZHcmQwditqakhHcVZsNHB2N2hqRWIvR0tabnVv?=
 =?utf-8?B?cmJ1VFB0Vk80RVRqOFVWY2M2c0pqUmdmSkszRXY5M2ZXeTEwYmt6WEVLczBG?=
 =?utf-8?B?MEV1RUJEWXdrOUIzYUlCT0pmclVsRTl5U1pUODZqYWNUVXJPZDJQdVJ1ZnhZ?=
 =?utf-8?B?cExic1B2K21KYmZUWHgxZ1F5di93WWxHUlV0bHpWOEg3U3o3T2RKLzVaNnN2?=
 =?utf-8?B?MG9WT2E2TWhOeFRlL0FUM2pWdlY0cDZNSldTU1dveGJ1TDVwVHJpbzRCNmlS?=
 =?utf-8?B?Yk5zL1orVGh1SDZPZTd5MUNWM1k5WnZTbXpzWEw1ZUM2OGpWWng2b0FyejJS?=
 =?utf-8?B?QnJsWE0rUk8veEg5aC9KUFAwblhxWGtEQXJ1MzI5S3JaSUphL01Lajg4dnNL?=
 =?utf-8?B?TWFWSFIwY1FQS01nWjFtY0ZiSk1KbjFVV3QyWG5hT0x1U3JsWXNHMzZKU3JX?=
 =?utf-8?B?bWtRNUg2R21LcWxnSmpzWUpMUnY1cVZnOWlOSjRyLzFVTm5nczZ2N1U2WmFm?=
 =?utf-8?B?U0h1NlVxM0d5eGZsQlJMYkFJcmQwR3V5d1Q3cDRrcGY3VTZmcWNVSVA5M2tZ?=
 =?utf-8?B?MTkremF4a0RHcjZSL25FeHE3d3ZlT2NVeTlPZVFxd1RFQzQ0MVdGZFhNSWp4?=
 =?utf-8?B?aHZQVlB6Q1Q5dzJqdVRRbkgzd1Rva2lTZGl3RW9TOTBtd3BTSWdBcURmZGUr?=
 =?utf-8?B?d29BdTJBMTJRYW16Vms1bXA5aE5DRnU1NmZjVmovQ1daS0M1a0htcTNualVO?=
 =?utf-8?B?Q3EraGF6VEpxNlVESDFBUFNjdHM1RWRMenhhcWM1SXhvRWU0dUQwVUptTEU5?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1726f05-2020-462d-c7b9-08da9d0c87cd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 02:37:17.0862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeJ6i/4X/FTiOmkLjdXiJhWmM+ZAilk3oSwa0zPo+06YbsdmTk98qZG2HNgeZ5FByDU3huHSUJ9B8mOgs5H51Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4266
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

On 9/22/22 19:26, John Hubbard wrote:
> 
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> 

I forgot to mention that I had applied your fix to Akira's
issue, before reviewing. So that fix works and builds and
looks nice too.

thanks,

-- 
John Hubbard
NVIDIA

