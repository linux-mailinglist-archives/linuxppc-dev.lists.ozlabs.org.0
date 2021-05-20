Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4598B38B6B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 21:07:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmK421PGYz3bsL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 05:07:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QVhP6oL6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.223.65;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=QVhP6oL6; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmK3V2VvZz2yyr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 05:06:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ+swhaf8sI+MXYTuDd1TYwxgSyCUOaiGgB5genAMIbpAWxHbba2XqXY5sDrtHiP/I88uZO7G2hn7hYm8hMnYoPH18NCYorG+dkAhxWjEmVdCsCMbW+0mhSS6MSpr3AS8dfvCT07W63COLU0ziOzGJPIOgXcS0LXXe0/R/2ZqVVM1OvNL7NMs88YdUaWXiC+nFH1nQtmcpfL0PfBgQ7eJk+nuk44xHaqG/xZ3HWEWUwZ10947KOWSanv9hqZzE3SWXU4EB5bgLOBT+ogrVfYoWIgtRtETGaQxG6Ug6+TQ8Pt6HAAI+QEXlLC5c3CB4YnkMBWoOf7cVg2QqB+19xpnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjbKb90csQgxyLRACnNwQ8Sy51WuJbxQoEgPHgqdFUU=;
 b=AvUmjxs30QhzBMxKx7zNf5SQcxD9LfWgvCgakee8/nR1FB0fJSPErmaTT4ar81X29m30jJunEMWEf9avesvKQEsp4PiYjWacBOCT+YliXKW79rfyBmMfWtVWWhX9XH1nXqkci/aw9sscB4renMsSyIAidF7HGYGw3ven8D6t5W0GqpAdPn8T9577Av6hLNNZ0Ek5mtMDYzQ2/ODli24hOrFgMI1v99nwUac1C43JHt9ObgLuoLdSJD7W25mYV7mKyE7Cgl/JtydbP3TJt2FgcNzod9Y3CD4dtgyrLYF2z558o2q9Qr2Q6d5dTyA0qRIMvDlTu//HltEgqz4kIAjHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjbKb90csQgxyLRACnNwQ8Sy51WuJbxQoEgPHgqdFUU=;
 b=QVhP6oL6w2lvGVl0xL/yb5enCykTnFbit3NY3Ny783yUAlda4sZ27cduHG3OBdxHGI53KYfJ56yF+oPIebaXsmFK2Au/zfHoPfHUrVZEnX3pxgofh6/R2ou2y2nqdBBnqOIUMLAZXBX5TqPVb7MDjBZ5tt43kvwaomz2iwgQVsg2rI62gR5FBRPWXqN2jbLQl/wf+gdiuN/x1ycP17gDxMVPBPtcXi5JuNVNLtP1AkkonwB/KUsVrZfQunX2gMWyPgd3H34eKVU6UBUY9PibFTUoHjEbAz/TaurP+Q1VV8ZM7nqNAfXYxiU59G/zVnsRq0zFexA0/nHgLoIaVcv5jw==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB3710.namprd12.prod.outlook.com (2603:10b6:208:16d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 19:06:37 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2%7]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 19:06:37 +0000
From: Zi Yan <ziy@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v5 3/9] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
Date: Thu, 20 May 2021 15:06:30 -0400
X-Mailer: MailMate (1.14r5806)
Message-ID: <4CE7132C-3800-456B-91DA-613391361B94@nvidia.com>
In-Reply-To: <YKZ49Nrz2OojQUBR@t490s>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-4-aneesh.kumar@linux.ibm.com>
 <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain> <87mtsrqqk0.fsf@linux.ibm.com>
 <YKXHA8/HmP6HXngO@t490s> <6e0dbb76-2b33-53f1-246e-30cec2b871e2@linux.ibm.com>
 <YKZaLHurH9nJWvbj@t490s> <e6525655-2e51-a0c0-fe54-596cfae9ce21@linux.ibm.com>
 <87o8d5le4q.fsf@linux.ibm.com> <YKZ49Nrz2OojQUBR@t490s>
Content-Type: multipart/signed;
 boundary="=_MailMate_DE17EC09-DF1F-4138-802E-E02A60908704_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [216.228.112.21]
X-ClientProxiedBy: MN2PR16CA0038.namprd16.prod.outlook.com
 (2603:10b6:208:234::7) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.60.96] (216.228.112.21) by
 MN2PR16CA0038.namprd16.prod.outlook.com (2603:10b6:208:234::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 19:06:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13151335-f3d4-4c33-7768-08d91bc26431
X-MS-TrafficTypeDiagnostic: MN2PR12MB3710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3710E8453414C924AACC2201C22A9@MN2PR12MB3710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fyW596EggyH9CUShiUC8u5raLHtErXXMSp7HNewTJ3B7OtIzc/kh2kjW2l+vIpFbxQU1b/bRrKZYuU9HFWDs1EJ4xWEqx7o6KultYnnyhYvygsBsElT8XL7aIKOJm25vc40iWSIcvmkSPZ+NN8655ptCV8cUhJJQWiLd+Nbnhf8xqcFFyyGypBfYZum391o9bmaiMpKOE3M5kxJsZ44wYZaRlEKsVbuA7ya0G6mTkXM5gZ/BDl2Roet2u0mOurpiLH0SDedpLnKglS4G9Pv39NeU4ZKylNV213/a9jyCaXixYYCZ13Clmjhx2jABV1T5xvxoYudrJZlvOMeCanXjJGLQhZMjZyo97dffB6+SxRa4nTbRrxA9ZkkAsOFuZApQZh44VZLRqAp2eIfPBV1/fqlSx4vg/57Qa7l82cz74qfCvfS5lNBFHghp7cPJJu8eyiBeaSFyt8kaBML7QmdtnVo6cu/ve1zVRuuxdixRZEryC1rYk4CysgqL+fEte31iupaiEefV8KPwdPE3fn8LyrZqdmkXeLb8bnVvW7B1jHLgwqtQKQ7OozcWpltuMrE3OnyjptZkZ/1ezuKalyAIcTCxCZbtkGkfvJtFUK4ahgDc70/ooCLjFnXMAEzyE/UUz3Rc4HzDx83dBQ+L1DxCiALOGXKncV8CfZHRBJGBJRRH/HlQrG8cqgMAU5JKEVIWBsIYJbTMJbVAbBVUD5aP4XfMTsjflz5wwkK8tTBh8XS6PBaL9vwoQfl94ELWaSRF8pXOQaCP8Iuu3Y10RHCaIErXQdARoakh2HALJ7LClOa6MBTJbVn6cHtNFPkW+8UF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(15650500001)(86362001)(36756003)(8676002)(966005)(66476007)(956004)(66556008)(478600001)(8936002)(66946007)(33656002)(4326008)(2906002)(6486002)(33964004)(7416002)(2616005)(21480400003)(38100700002)(316002)(5660300002)(16576012)(53546011)(54906003)(83380400001)(6916009)(16526019)(26005)(186003)(235185007)(6666004)(60764002)(45980500001)(72826003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWlvSVppVmM3ZnAwejEzcUtscDJwbUhieERFcVZ5Tm45MGJBSmkwUzQ1UlEy?=
 =?utf-8?B?ckl0QnVLQlpDTW96NHZ2ZGVQQjBXVFloR1YyS2V0eUVTSzZkRFBXRTRGbHFl?=
 =?utf-8?B?TmRBUHhzUGtheVlGYlpPMGtJTkZkVm1lNDRqU3kzbWhSeVNjNGo1WHpsNXJM?=
 =?utf-8?B?WENYb29pRDlUMUpMc01YclczWmIyYWtHU0oveHFPVFIvY3B3d2hXU1p4djk5?=
 =?utf-8?B?SzA5ZEJqaTlMTVZxWldTeVQ0YktuNU1RZmhPeDN3K2kra3pIZUhsY20vZ0ZB?=
 =?utf-8?B?ZjVMTFNUSU5aKzF5TmFUUHVlNTNSZjI1VG5aOUtUcFBZNmtJMTIrdDNCKzhp?=
 =?utf-8?B?NTJuS28rWG1Bak9UVU94MVR3R3hsSVh5OFVjSW90VEF5RCtqK1V2cTh1b0ZQ?=
 =?utf-8?B?azB4MXIzYlNRQ3liMGVZeVNxT1hwRjZkbXpoWVNZVnVkK2lad0Y0clJjUlk5?=
 =?utf-8?B?QTFSUzUwUGExZVE2YTQvOXlieXJBeVN2RzNLL1owZXdOeERBWm1XL3hUT3VQ?=
 =?utf-8?B?bW9zU1BuT282RWFRaEUycUZMWWtuZko5WGtLTXRmV09RWXgzbEVZdEZSZVlp?=
 =?utf-8?B?bDRZWVNxeDVhZlVCc1JIOFJocWxPcmw3MzJDcDJRTnRxWXRRanhwUEN6L1VV?=
 =?utf-8?B?aXFvUXM3eUdwcjB3d3lRakdqdVVoaGxnQnRSSy83R1BLZGNZN3dvMXJRamhy?=
 =?utf-8?B?REErTmthclVlSkU5alhaanBrY2R4aW50clhFRUVNOFBON01OU2prcU5FN3pO?=
 =?utf-8?B?dVBTSTY1VHVOeTdBMVJFS2JpaHAyOVBjU2NwY29vY21xdktJbTh2dm9uTCtW?=
 =?utf-8?B?NFNqTzZzQ2c4VDJCTzdjL3NBaEVkV2xpZzBURkxuK3N4b0JXbXlhWXBoL0Vr?=
 =?utf-8?B?S2J4MjVXdWtVdGdaRDI2eXhaMDFpa3BiNHJ2ZENPZ2l6WFRVaFlnTEVQalNC?=
 =?utf-8?B?bDE1dzBQYVRpazRlWU5mVGVyZW50VWxCdUdOc2w2MThmQTJ5Skt1NmhSamp3?=
 =?utf-8?B?ZnFhUEhYelBuQjUyS2FUM0ZrYXhoOW16dUdjLzZGWkxDNCszL1FVMXArbWxK?=
 =?utf-8?B?SnZHb3NZZXdlaDR6V3JQRHZzMUdUa0l1NGVCWkorR0FyS0JMRW9VWlNUaHNT?=
 =?utf-8?B?VFpoanlnbUhUd2NMbUpaRE93ZmtqMHdWNU44RlNPTHQ2VlpqazFFZ1lZcVdE?=
 =?utf-8?B?ZkY5bFZTWVdkSDJhUnZBRVpnMHJPdmVEUkJjMWx6SFhEZWdwWERUTkZrS0JQ?=
 =?utf-8?B?UThoYXZyMjVubXdEZGdVcGQvUk1OVHhKLzNHOUtRbXVxNVlIMFBwcFpuZzRQ?=
 =?utf-8?B?Nmk3dWNULzEyeXJzTWhUSE9xQWxrUEVnanJsTVdud0NxU25aNTh4akdqcExi?=
 =?utf-8?B?UU92ZG13U043eG0vejZhQVhhZDlCVGtBSCtPcDVIUVNvOGZsUWNmUjhnU2JU?=
 =?utf-8?B?d3ZEVEp4bnhFQllXS1Arb2hXWTE3RFljaXlXelAwZlhrTzVJZlp2b3oyS0s5?=
 =?utf-8?B?Mk04ZUxLNlJzWmg5SVRianoyMUs0Nys3WGZCcHVhaDRSa0cxaENDUmRDVlkw?=
 =?utf-8?B?ZDcxUkR3Q1JUdDlrVXBrckNLVjJLL2VYMXhha2RGaFRBbWE5OHVoRUsxSHpj?=
 =?utf-8?B?ZU5NODgwU2R1aWRTSVQxbURIVVBoUStPbVI3YU9YQVk0Q1dXejhCZXVrVHRh?=
 =?utf-8?B?T2IxWElaTGxQYzFpUDdCcU1YRncveHQxMnJxT3pPazBEVVRncWN6UENNK2hi?=
 =?utf-8?Q?+g8PyQoo1VeH9CM+12ufcyKbtw0d2NDmjvLYBCG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13151335-f3d4-4c33-7768-08d91bc26431
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 19:06:37.2871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZR95HtZmfUJQCi1FATWyQimIDp2BfvtJRMybBNVXIwnDH/lq9QdhBK3z2BifGPo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3710
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kaleshsingh@google.com,
 npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_DE17EC09-DF1F-4138-802E-E02A60908704_=
Content-Type: text/plain; charset=UTF-8; markup=markdown
Content-Transfer-Encoding: quoted-printable

On 20 May 2021, at 10:57, Peter Xu wrote:

> On Thu, May 20, 2021 at 07:07:57PM +0530, Aneesh Kumar K.V wrote:
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>
>>> On 5/20/21 6:16 PM, Peter Xu wrote:
>>>> On Thu, May 20, 2021 at 01:56:54PM +0530, Aneesh Kumar K.V wrote:
>>>>>> This seems to work at least for my userfaultfd test on shmem, howe=
ver I don't
>>>>>> fully understand the commit message [1] on: How do we guarantee we=
're not
>>>>>> moving a thp pte?
>>>>>>
>>>>>
>>>>> move_page_tables() checks for pmd_trans_huge() and ends up calling
>>>>> move_huge_pmd if it is a THP entry.
>>>>
>>>> Sorry to be unclear: what if a huge pud thp?
>>>>
>>>
>>> I am still checking. Looking at the code before commit
>>> c49dd340180260c6239e453263a9a244da9a7c85, I don't see kernel handling=

>>> huge pud thp. I haven't studied huge pud thp enough to understand
>>> whether c49dd340180260c6239e453263a9a244da9a7c85 intent to add that
>>> support.
>>>
>>> We can do a move_huge_pud() like we do for huge pmd thp. But I am not=

>>> sure whether we handle those VMA's earlier and restrict mremap on the=
m?
>>
>> something like this? (not even compile tested). I am still not sure
>> whether this is really needed or we handle DAX VMA's in some other for=
m.
>
> Yeah maybe (you may want to at least drop that extra "case HPAGE_PUD").=

>
> It's just that if with CONFIG_HAVE_MOVE_PUD (x86 and arm64 enables it b=
y
> default so far) it does seem to work even with huge pud, while after th=
is patch
> it seems to be not working anymore, even with your follow up fix.
>
> Indeed I saw CONFIG_HAVE_MOVE_PUD is introduced a few months ago so bre=
aking
> someone seems to be unlikely, perhaps no real user yet to mremap() a hu=
ge pud
> for dax or whatever backend?
>
> Ideally maybe rework this patch (or series?) and repost it for a better=
 review?
> Agree the risk seems low.  I'll leave that to you and Andrew to decide.=
=2E

It seems that the mremap function for 1GB DAX THP was not added when 1GB =
DAX THP
was implemented[1]. I guess no one is using mremap on 1GB DAX THP. Maybe =
we want
to at least add a warning or VM_BUG_ON to catch this or use Aneesh=E2=80=99=
s move_huge_pud()
to handle the situation properly?

[1] https://lore.kernel.org/linux-ext4/148545012634.17912.139517636064103=
03827.stgit@djiang5-desk3.ch.intel.com/


=E2=80=94
Best Regards,
Yan, Zi

--=_MailMate_DE17EC09-DF1F-4138-802E-E02A60908704_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmCmszYPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqK9BAP/AgWiKf2ZnYLRxNij+dYb/HHzHxhArqJiM5h
ejuk5rlSM8O/yeSl8GvWRYTU7SUhw5wAmSbr3R9hXdJM8M5GFfVDk1JwGs9XMD3R
H0hIsPqFvLzEkGhVBIoBdkqb9Xy+QSEfS6/bkqaYhKKbSln9GkC/o0ygjS15FnD+
PY7++lmQIA8XgP6COGCDbWhaUB5I2elVe7oQbaBZ/q9m0FgHA4BhbwvZhMq0f7ze
M7hAOFRTlXbMtjbfaypYGYPMMSVyvvtOih62hsy6rVSDwNpq2ezAveC1KWnXIOYZ
77qCx5vNd2xx5nzkplviIA6GpV1GxEGm9/wgcItU5JHM9wgX5RDe9vxm1fiLP5FJ
kkNX4gq9lEv2OEanhboq6X+h/dUj84m7oj2Xu+3h4vRs0IzOoQFcZt4Ur9OdU0Fh
rHmNxkgGjBd3dhLAVsyT6TxlRU6UQYULcWLNicB/B1comePITECALuM1TGC0/J12
fO0/DGLDLgqgoS6Zd7Rhe7BYGV+wMAm/H/BqoNYNQyHObHHuDkejMJ96DtA76FL0
oCCvl26lG8C9FtLPc4I7fdH+dZL5gUGlWevnUNPycG8aNrV5eJ5PfcOwmlCgyNDQ
Sb1MbYIx1rg7ugxW4UbLiUV2Z+ufa9dxx6KFWFt4BGIrtiAIeAEwP2BISbD+I37E
U//1qIkE
=vRDk
-----END PGP SIGNATURE-----

--=_MailMate_DE17EC09-DF1F-4138-802E-E02A60908704_=--
