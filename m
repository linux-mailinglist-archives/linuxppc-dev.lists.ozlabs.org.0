Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95993757E5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:50:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbdMx4tYfz3brr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:50:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LCAVlZY8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.244.72;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=LCAVlZY8; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbdML1lvxz2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:50:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/HC+d9j1sEKpbymxfhil7VCuItCIAd4keEXyiEgoz2RaFIf1hklQ5zzjO9az+34OqHVZLSoMGWc4xPWLn16OK66su4d5M85bZGS6jI7xHR2+q4C6GfmZOGe0CtpAvMZrrAKthmtKMgwoqBGnnhnrGArWzq6SKuIzRSYVh2RY0ha1e+x97wJptkJlzRqVpqt6l+EbQNoAP0pufFdCjBqJfXeowcU6RVvTZzPAUT+4KG3lEIGPkFWu2SHUooaIMr76gw0ChOMmDqEubOOV+vxIfHpyCFMEnTYpivp6+3yBhT2fW/jiFU8P63qhSYvWS5krPt5tdWJDsqn/loxoTS3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVLWYEJoKYGXddORiVVn9D5vk11JrfFyAbRck+MT2CM=;
 b=SmRw33Ly6rDEEhV6wsuMCJyfCkYr8KYXHWV2D97sXlAzshDIH3Zb5sVm8rR7vlmVz3tekvZhZJGsK25P1DGXBZXdE8w5i+FlvinqBYhZC/qcP6Kl/f9UbbqVWEpYegMalrVwuiz2k19M4Vg95RmpUuFqn3yT8U3FOhPpvh3O+LeQdJCck35lOUu4UqSg3XphsiGxexQSGy+2+RPswcoHun7TERxA6Oyk+XuiaUm5oouOA/WmhawfE93N1U47IbIqrmlyV86F9QLzukFWCMMDLkI5Eq/ZZ3aRZEqcMJMg2ritqD8xlrjdEhBXTyni1Ws2hP0WW75hZ5K11A1GwP53PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVLWYEJoKYGXddORiVVn9D5vk11JrfFyAbRck+MT2CM=;
 b=LCAVlZY87OZfnXt755C2W6mYDItjDnfJChoRIBvXR89IyHc0a5t1Udyb6tow24aJa6yQzuP4hN/FeNYswuV38KIHj5duqwbfUBNG7BytjLmpzZhe0AOZLFO++RiI/lpN5e3lgdNof+J/MY5xzlLRK+yMeKsvJBwZ7BN/R0/ZRryZln58n6+vFOYzXSUdTSev/0M0F1HlxEx58ljCmBs3i8TKICzCoqGFTEBHMaFSJp1Vkaj2d2HBwGa14rYKV+YFjPb91diMGLniCK1yELw1JxcNwp+XDobxAtwJO10muSEuHk2fktmZjggtUUY8I37xxei9PzGJht3O7aBjR27NQw==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by BL0PR12MB2468.namprd12.prod.outlook.com (2603:10b6:207:44::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 15:50:14 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 15:50:14 +0000
From: "Zi Yan" <ziy@nvidia.com>
To: "David Hildenbrand" <david@redhat.com>
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
Date: Thu, 06 May 2021 11:50:08 -0400
X-Mailer: MailMate (1.14r5757)
Message-ID: <16962E62-7D1E-4E06-B832-EC91F54CC359@nvidia.com>
In-Reply-To: <3a51f564-f3d1-c21f-93b5-1b91639523ec@redhat.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
 <9D7FD316-988E-4B11-AC1C-64FF790BA79E@nvidia.com>
 <3a51f564-f3d1-c21f-93b5-1b91639523ec@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_EF181C5B-F560-456C-BCA4-7AD984E499FD_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [216.228.112.22]
X-ClientProxiedBy: MN2PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:208:236::28) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.63.7] (216.228.112.22) by
 MN2PR05CA0059.namprd05.prod.outlook.com (2603:10b6:208:236::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.11 via Frontend
 Transport; Thu, 6 May 2021 15:50:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a2db97e-f624-4c48-62e7-08d910a6a382
X-MS-TrafficTypeDiagnostic: BL0PR12MB2468:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2468B754CC1E5FE3B1B1021AC2589@BL0PR12MB2468.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y5G/mpktJwt+tvY6OagShcoWTPAMPS67CRSrkmgMOLWrtwO5cHehRs0Q8BmjmxWsFUC/KBfyjxjBxVl1/ROcsxXV1TQlk+x0FhgtGeg1Pf6ITt3Ahh/dMyZ326PEA4YMoxSv7pKYJhhsAdS5utRiUDZFyNKXI8aeTWao8pkbcy2+DclVvszVqDbEb5t+LuVcnw4jnm62hiB906ESESUO72lro7GW12JunOMXubu840LM8G8eqbRVO83ItgTwPdEkN2EdEER4ztFUZSVCMErAwOTqk/KVmsrSEAf6+gjpJHqAf3++uFxy5OEu3W/VERx7e3uoXJ1y5rWpKk8OBpADHmC81PWogvhJICH1I4EEvdDaF2lAeG/8ojNuM+odv62bMUvlPV2bLo5ao6X1KtTkMSvhpq7B5eIYoleKqpZplsnYrh+OdhsvsL/OMU2S7YFD/spwENFQpwu1yqrSsfFZIrro1BUKzSKwjxp/zIIakgBnbiVKgjyH7qUg5A5SLCRmlUSMC0+sbkkKgv0xek7N5MT/vX3AabgGyDxP9btn2CLvriOQx0qMMqk6fTqr6+h0yn6k3Cofc+zMgGwggDwYMB1cP1xn75aB675jplHa4AiTHkzOpUKwR2pshxgZE9yHB/kVHds73qMbqlyJRnhPVgdVj131TuxRmHzOKgr3LlM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(66946007)(235185007)(33656002)(8936002)(66476007)(2906002)(186003)(16526019)(66556008)(6916009)(956004)(2616005)(5660300002)(4326008)(8676002)(26005)(16576012)(7416002)(36756003)(478600001)(316002)(6486002)(53546011)(83380400001)(54906003)(38100700002)(33964004)(86362001)(72826003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?amN6YUpLNkIyRXdJNmFSRmVPVkdFVGdqcWd5eGlUVVlNTUg4NDdXUnlMdEFT?=
 =?utf-8?B?U3NYNWdER1gxdkt6R2ZHR3daamU5SlRIQkFsTFRFYS84V0tHWFpHVzJhVjRi?=
 =?utf-8?B?bGIxZ2YvNVFZemV3QUJGN2oxLzdxM2E2aEpDd1o4eWRGb09MUXdkaGU2bjR3?=
 =?utf-8?B?eVZPUFpIN1NDS1RIY0k5OXlZSENIMGNwQW1nWjhxNEpnekVTVXU3WFVVVXRx?=
 =?utf-8?B?UVZHOG5vUzFYbUI0VGc2YjVRTW50M2t2emlITHpkVkgwY3JqTGljckhOWkl0?=
 =?utf-8?B?YmJrT01uTms0L01BWldNOTNxSFdjYzAvRldNSlZBQ0tWT3VPNWtINk1XTUxG?=
 =?utf-8?B?L3JXU1RtQUFOcG1IbjcvclppdXJFS2VKazRyaG9RMDc5OUJIc1BLaHBDbEw1?=
 =?utf-8?B?aStUWEFKVDlTdUR6TEk4SndmV0l4MU1BM2dqdmZHU2RqOXhNdTQvNWxya1p3?=
 =?utf-8?B?QkhBRW8xMzJFOVA5bWF5akJTTjFwTVppQngxRHdXNDkwbWN3NC9IQVhPaUZk?=
 =?utf-8?B?U2JjWHVhazRvdldpbjEwd2hrdWYrQVB1R1AwR1lkWUs4YU5rN3htdDFJZGRz?=
 =?utf-8?B?QUljdFhUVmRwRWgzU1M3RFhCNTIzVEtoaG5PbUYyRUlQZWZHZlBzT3ZtMGQ2?=
 =?utf-8?B?UlloYzV5czU2N0c4aWpsUjkzNGxwMnE4STlWS0tIYVlRMS9LR2xSY0w4MU1h?=
 =?utf-8?B?a3F1WmRwT0hBLzBxT0xnNmJJSjJBQldlRWRCcG9ZdTE3bWJTTHJ0bEwyMzFF?=
 =?utf-8?B?dlM2TzRtZ3FJRWtnNDhiMFgvaG5zY0Y5eXBNSTFId3kwUjQzU3dUSUl3ajkr?=
 =?utf-8?B?ZERrcTlxYTR4NUtkamJZU0lFU0tpQXROeTZyb0g3YmRGMHRuMHloWWtYQUNC?=
 =?utf-8?B?WStpZEpZUWpNOVJ0T1lralZGWmtvOGErd01xTkoxNUhDbXc4eGFxQkFjUWdO?=
 =?utf-8?B?Zis0Y3plVCtYNndTRUdFd0VXQkRxRWt2eCs3K0JXYk9sdU5jdi9ZaSt3NUEw?=
 =?utf-8?B?WTRqS3VhenpVRWRVTm9mOU44QWFyMjZDNHR0WC9sbU1tRU5sR2ZiQ0tTV0tT?=
 =?utf-8?B?OUYrV09OZE9DY1hjZWRYN3VMZkVUR3NuVXEzeDlrZ2tRTHg4alJ0cmtsK1VX?=
 =?utf-8?B?dGRuSUJ1dExPbkM0YkNiVXNvV2tlV25qc01neG10ZlZ0cnpmRFBvSmQxNXUr?=
 =?utf-8?B?eDJveVJTZEZ1YWkvby9PQndoL0ZuQldiU0dyWEJBNGcwYjgySEN3Wk5HdWxl?=
 =?utf-8?B?ekppQ1JXb2NaSERJMDJsbWcxbWtvTEZaeTg4YkdmbHRTbmcvWVZFK0cxWWpi?=
 =?utf-8?B?KysxeStDQ1Z6V2VGL3pCV3RKWEo0MnhkMXBCakhMd0ZyQiszbzM3QUl2MTVw?=
 =?utf-8?B?QUNvQWpmRXEvZWp6UHk0N09STFZibU0wa29ubmNaTHJ0K1Z1RG8zdzdVR1Ez?=
 =?utf-8?B?U3JsSkJiajBtUlk3aUVaT1I1TklQbDVhd1NNbnB1RFlPdEU1cVJlSWpvS0JW?=
 =?utf-8?B?OHFBeHdGbVhvL09MSktKMmtwbHVNU0ZVSlh5amhUQ1NIdzFrVWFyeTdqS0pk?=
 =?utf-8?B?NHNzY2cwQUEzN2tIVDEvR0loaURQV0ZEeGNRNjRlcmVaWXVHYnpHazQ1MVBQ?=
 =?utf-8?B?QXFPOU5NL0RkWFFqNUlWNE1GUncycDVjcjhwMFRQQUM2NGR6S2luQ1VlSzcy?=
 =?utf-8?B?eW9hQURzVUhYVmIwcHM2VVNHM0cxQzNnWnVYbXZQNW82bm11cXVYRlpzYXo3?=
 =?utf-8?Q?TVVK0zxzGP/ol0BudmIpFc4urkN5Kdka5CEGccn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2db97e-f624-4c48-62e7-08d910a6a382
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 15:50:14.6251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSlfpw9kMOus/VnZHVM7zSMn6gYy3gYbyvASz5mWyiCkWbWBDH1hPjGsZAygXRag
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2468
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_EF181C5B-F560-456C-BCA4-7AD984E499FD_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 6 May 2021, at 11:40, David Hildenbrand wrote:

>>>> The last patch increases SECTION_SIZE_BITS to demonstrate the use of=
 memory
>>>> hotplug/hotremove subsection, but is not intended to be merged as is=
=2E It is
>>>> there in case one wants to try this out and will be removed during t=
he final
>>>> submission.
>>>>
>>>> Feel free to give suggestions and comments. I am looking forward to =
your
>>>> feedback.
>>>
>>> Please not like this.
>>
>> Do you mind sharing more useful feedback instead of just saying a lot =
of No?
>
> I remember reasoning about this already in another thread, no? Either y=
ou're ignoring my previous feedback or my mind is messing with me.

I definitely remember all your suggestions:

1. do not use CMA allocation for 1GB THP.
2. section size defines the minimum size in which we can add_memory(), so=
 we cannot increase it.

I am trying an alternative here. I am not using CMA allocation and not in=
creasing the minimum size of add_memory() by decoupling the memory block =
size from section size, so that add_memory() can add a memory block small=
er (as small as 2MB, the subsection size) than section size. In this way,=
 section size can be increased freely. I do not see the strong tie betwee=
n add_memory() and section size, especially we have subsection bitmap sup=
port.


=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_EF181C5B-F560-456C-BCA4-7AD984E499FD_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmCUEDAPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKvJMP/0lV2lDuyjt8qAFqOIf+9/FwjaI5D/Zp45sh
yG07rIN2WsKGzAXTeXMOy2wOZeFkUaYcO7TYTWB2ITMt0AM6ZoBQkHfH93RX1DYx
SKQuvCEHcA8gIzNidDjoDQxZhIXVFcPWqoe1INChH5YlydqRbxrMaRUEbNXFUkh2
Uyoa3KmmghZL+hCfTukkMkD0vzFU4kC6C3J61RBk2JulO6QB8BnVS2FhwoHLqKJE
yfnjvEAxYCjCveV8+L9JS/A4sdWEW+jIeFc9a1Ak0lFBIablXox2vAyyhJHqq9PE
/zyW8EUl+VrbT6B/xDenQMT5WwY0ggxdsjHzvXe4BcsHWSTZq6jFlW5dhlaqn/Rf
WhpRQYni21wq/A4zdF0SVp400TYOvmoBsf9haLygjUXT3rVHkJnd6ItZ6wa+QbPJ
mb3x6lQmNnKRiU5VZt/G8octH7m3O8153e3sT/6ffdE33NhQUC2ncJBCQB+BSflW
JgsOSizD13RI5TmuliD/JFhi37kMrkj4dCuK7hBWBZyHL8DKzCf6y3Iw1VIgyku1
6b9jWQCl4OVxSTyh2rrI0ulvjHbJNSCB+P8w+kQ66qEuZVjlOkKmbCCoL/64diDH
8gR3c2uSEGevWqZzX5Mt0u7C/HYAWqKN0TYpjcuQ0hL9xiYVz8dqdNo/lsfgk4q+
dXFzUKjn
=8W9n
-----END PGP SIGNATURE-----

--=_MailMate_EF181C5B-F560-456C-BCA4-7AD984E499FD_=--
