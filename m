Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B45843757AD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:40:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbd7g5NYRz3ckt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:40:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=O/pSaiWa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.92.62;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=O/pSaiWa; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbd4V4DC0z3brs
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:37:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPN3Vtq71/AIplxqLw1M7kkASYtj2ER1h6bC3BecQ3Y6UP+G0/OVaXIRMQcb/a1mE9+oACP/azbSOyLHi851hO9IE/qLVLgMcgf4YXY0zviwV6Tf86R2leYG8GqevEWmyW0hknv1S+SyadubAgp5BduywgNVF1PbfTsy1fwHUb+e+FSx5imuSzBqxagTEfHOc/OAWYEIHJh2n24c4OJPNDGzR0E3NCEuxTomOhpGjHNUdPamSiQHSpQcuh8I+UgqtFgy3E58DmGMpQn4xSse+cTV/+3GTerlofaXcb2cXLFKOYkvOqGJ76kIncCld81VPrp+8Wj78WAEQqaP69llxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgtgXQrH0EO88ortFz8WULLNVVyBTVnkFegymJEXa3Q=;
 b=NqYCZAmNBr46NxV9zqePvCFwW2657BbqsAC0EZP5ohvrzUWwqwSCYA2czz6G/P4r9yzU8XIVurdq3/PxXLakucrTo0dRgw9uE76sj4QokAwJ9ykZCEKtI/ud5QA2jObbil+svlKLGc1KuPPIQVg9CwpPKps6JYbz9lqAnYqkxmQuDsIu3HKZ4ikuSxMPzERVNyX7tpgpOY4yxGhZDArDYs9qXY1iVVvRizqBFA1uE2mqbnVWFyZv/Dmlh+cfnoMi4ATpTFZvl/7R0pTCFDsUeE9bJDsg5y+TXUX/n/r3ZicPQkaBusxV4ouvoKPTNehVMP6JOZBxaWa8c3JfUncODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgtgXQrH0EO88ortFz8WULLNVVyBTVnkFegymJEXa3Q=;
 b=O/pSaiWa+POdtJGLv6NwkRVJdEbjuZ1cYIgqsjaKgGCvCGneSb+HlYLSly87+06ZTCoPn/RXw8wrv8bKqhELSmQsFUc+djtMv+4JEns9grGwvD6wOCIei54kAlGhOzs1/JyOZmn2L+tcxwyh+p7cZ5rtNt4XbOH29F8lsCyZkuOM2CYoHi4hwIIiuoWXwxzQaZmm3RSf+0Jj3a5zcS63byDRb7ulHKoLBzAlQtgEy4g+W3ofePiNLx8dk1eOcNh93pWaGq5Lj8wah4oMnH8/lCJ2ODnvOQUmTFnTQvutU95h8YrNBVdB7Y41vRYKzrCIPn9DzflgEjVJuugIPcZtmQ==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by BL0PR12MB4994.namprd12.prod.outlook.com (2603:10b6:208:1ca::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 15:37:23 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::ccd7:fb49:6f2d:acf2%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 15:37:23 +0000
From: "Zi Yan" <ziy@nvidia.com>
To: "David Hildenbrand" <david@redhat.com>
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
Date: Thu, 06 May 2021 11:37:15 -0400
X-Mailer: MailMate (1.14r5757)
Message-ID: <9D7FD316-988E-4B11-AC1C-64FF790BA79E@nvidia.com>
In-Reply-To: <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_20560B3D-9CB2-4483-BBC2-6D4DFD4AF167_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-Originating-IP: [216.228.112.22]
X-ClientProxiedBy: BL0PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:207:3c::36) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.63.7] (216.228.112.22) by
 BL0PR02CA0023.namprd02.prod.outlook.com (2603:10b6:207:3c::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Thu, 6 May 2021 15:37:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7fd83b3-25bd-4039-0d7e-08d910a4d798
X-MS-TrafficTypeDiagnostic: BL0PR12MB4994:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4994BB42D1312F0B96A1C969C2589@BL0PR12MB4994.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XdMIeQjcux8kuF2n7FdEPxCPIW0Ahg7w+nU92aITKeHR2XvjgXFz0KWxosMltpW7A3opBQMhi2SbX6I+QYYmTRcRNANV1XA2GkmfjGFk7pcBu2nmRHe7WjyKC2+5y09bF9oeezPhWdTQOhwrifK9uZvZ7NTe+jF1VjJvzyfScVk3N3v1XRbrANr26Txx1L/YIHjsrphWyUWHyhDdPkQ1o7yEamSetbnRCrp4tE5IpevNkZnxO6WsI11zstA7I0uvggPFXgDyp6hr+oK4VVZ8Skndco1UEBnhdkOyMF3AZGx8sjaQp5I0JXaBpc58Ka2FrtPPUv9Fb3vYRf94OFa0+jPushGtULOuCbxTFPBbBQyQAhWbHPcjjaueEaK5w0m+sr1lR0eYmZGHvrwvZ8TWPiKXyPPjxwQzFcfmAk+5so8rL5wPmX6Edn+/UP8o9tocjpJBvmkUMeqRgWl7hVwDGmVODbxhIzv5H284zhReWQvmkCXkqV8wfkbh0vmY4dHoOBCclVrcUSqCaQU0jDdicCLeooBYDqeszo37zs2RWGEtZZv3yJ2KVXBUa8guuFkl+ZHo5lwY6NLkGKZBneRL/tv1jMS46SeV9KPZJcLOexYFQdkUBQFIdPJjgRFpYkxMx6djulYkligPHGFc/2X3N+buqBTBXhoULgIZcxoN/Kg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(4326008)(6486002)(5660300002)(8676002)(16576012)(86362001)(66476007)(54906003)(33656002)(8936002)(316002)(6666004)(33964004)(2906002)(235185007)(66946007)(66556008)(186003)(956004)(36756003)(6916009)(83380400001)(7416002)(2616005)(16526019)(26005)(478600001)(38100700002)(53546011)(45980500001)(72826003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dGRRTE52d2RoNEIxRGphaFZBWUJkVnBPRmxTcVhtKzhkQlJqOXdmSUFSSURk?=
 =?utf-8?B?N1gyL1lUYnpIaHVySjBXTkg5amJBaU80ZmVwbHl1bFdUaitIV0YvMnRXeUFy?=
 =?utf-8?B?Vm5YVGJnSDM0QUpMeFRJdC9lQ0JWdVg5alBuYVkyNkdQREU3ZzVtTVE5MHdi?=
 =?utf-8?B?M0VZWGRtNXlFeVBQVlZ1VmxRUVA5SnJoOXFNbnkrVk1GV0tLakNIZkVnYllF?=
 =?utf-8?B?ZU5RKzQrWjJZNVdSQTJoZG0rRVUvQlEwWG5jWWRick1xRzlsZWpSdndkK2lx?=
 =?utf-8?B?WFhmNjd4RGV6R01zeUw4TVZEb2s4YmZTMzRTbTBNc0VkKzhXOHZGa01iQ0ox?=
 =?utf-8?B?S2dzZTY0Qnl4bkZLcjA3aEJRcVNnYWZ2aHZ0WExKWEhaL2Y0dmdrcFlVcklw?=
 =?utf-8?B?T2duNUwwOWhEbm5icDI3dUZhVXpuQU5LNllyc2w0c3VnS01UYzYzaDk2NVhE?=
 =?utf-8?B?OTZ0TkV5MXBYYkI5YitsVHBVcDBnRkZQMmdJeDl4a2tnQ01DWExydzBzOFk1?=
 =?utf-8?B?V29iVHA1TU1sTEw5a0xGOVdySndTNHMySUc0ZXRsSU44aFVyM1J6UTFCbUVR?=
 =?utf-8?B?UzVBbXM5Szk5dFFMMjBZa3hyZlZlQmo5ZFp4YUxmVVlrdmdldkF3anRoSGVq?=
 =?utf-8?B?L2pZbVRXMzJ5R3ZvRWpQWkR4dEJJMURVaVNlUHJZVlFPdmxFT3p4bUxDcW9y?=
 =?utf-8?B?WUUyeVlGY3VSaCt4R1Q5NGVRRHBzYnFKSkVKN2VwZXd2SHVkbDBJQ0lPSnlG?=
 =?utf-8?B?YjlLUm5XS1l5eUEvYlRrM2VMVXA2MG1GSFJaazNRSWttWi9sWGdnWFdOK1Uw?=
 =?utf-8?B?dTB0dzlsQktBSkVHZ1hDZzJiTVF4VFFoNk01bk5GeGo4MGNWTDk4dmRSUTJJ?=
 =?utf-8?B?b2VHMXR1QTNhQWhQNFRHYmU1YzFDM0tzaExaemZiVEJzcmdibzVoWjNDSnVE?=
 =?utf-8?B?M05qSCtBSUlkclUyd0xkQzU5MTBhOGo3eTFTa3Vud3E3VmxVQUJ0MWF3d0tk?=
 =?utf-8?B?NzdBRitHanpaR3hUK1drKzBZYlVuQWtyeXlnQWpmVllnTnFWYnVEUExOVFVa?=
 =?utf-8?B?WFM5cis3OVdtQzVyWVJUenBlY2FLdUlzcmlIaEZUQTVBdXJlM0EyMGhkRU42?=
 =?utf-8?B?a014K21tcXB0N3EwNVZDM3J0dGdLcnE2RWVEamxtSTRIb21BYlIvQUl2M2dk?=
 =?utf-8?B?NmN0TW1yQmlVNEhueWdGU3lMOGVMTEQ5ZEZyYlArRU96QVdQc2lMb2dQNmRQ?=
 =?utf-8?B?dkUvL0JzaVp3bTgzdXFmeUJIelJYTUM3cTJIakR4MlgzRTJJZml2MWVUT1ZH?=
 =?utf-8?B?N0pqWVZhakFka2lsQURwdXhRT0JKVHhkdzFSWWVHUUpIZnJJR0JtWE9MTkI5?=
 =?utf-8?B?Tzd5ZkdnZXh3TVNBYWJ5bkpyS1Q0RHZGYllLcDBzYms5eWhZb2VUaDBMTmFN?=
 =?utf-8?B?eTgrOVRkaUNxRHg3MHdDaXhFODYyaUdhRWVMYjhoOEw4Vkh1d0pIbytrdE92?=
 =?utf-8?B?ZGJDcmU3c2tieFphY0RMMzU4TUsyL1l4WS9lL2lnYmx5K2pMT2l3QkpuQzBr?=
 =?utf-8?B?SDYvUm91VnZvSUozMklUWEZ4OFphK05XSnhXeGVSRWJxUGcxMDlOUllnclAv?=
 =?utf-8?B?bDZmSm51RmJYUThPUm1DYmpMV09rYVpqVW9Gb3NTdnNVcGdZUWh5dEZmSCtm?=
 =?utf-8?B?K01hTEkxU2pVUWV6eG44Ry9SeGxCUUM0ZEo5WGdPR2tzU2ZabW1KL3h5NVRE?=
 =?utf-8?Q?Nm65QYelq9kdq8rTbEyKO8MFTGkTf9ZkcWEbCL6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fd83b3-25bd-4039-0d7e-08d910a4d798
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 15:37:23.0191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNB+l+qCGPOQn+A24ccGxUE74zg+DrPhKUQ76HxLzLDutu2gyCP8Y4Tv/cdSjPc+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4994
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

--=_MailMate_20560B3D-9CB2-4483-BBC2-6D4DFD4AF167_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 6 May 2021, at 11:31, David Hildenbrand wrote:

> On 06.05.21 17:26, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> Hi all,
>>
>> This patchset tries to remove the restriction on memory hotplug/hotrem=
ove
>> granularity, which is always greater or equal to memory section size[1=
].
>> With the patchset, kernel is able to online/offline memory at a size i=
ndependent
>> of memory section size, as small as 2MB (the subsection size).
>
> ... which doesn't make any sense as we can only online/offline whole me=
mory block devices.

Why limit the memory block size to section size? Patch 3 removes the rest=
riction
by using (start_pfn, nr_pages) to allow memory block size goes below sect=
ion size.
Also we have subsection bitmap available to tell us which subsection is o=
nline,
there is no reason to force memory block size to match section size.

>
>>
>> The motivation is to increase MAX_ORDER of the buddy allocator and pag=
eblock
>> size without increasing memory hotplug/hotremove granularity at the sa=
me time,
>
> Gah, no. Please no. No.
>
>> so that the kernel can allocator 1GB pages using buddy allocator and u=
tilizes
>> existing pageblock based anti-fragmentation, paving the road for 1GB T=
HP
>> support[2].
>
> Not like this, please no.
>
>>
>> The patchset utilizes the existing subsection support[3] and changes t=
he
>> section size alignment checks to subsection size alignment checks. The=
re are
>> also changes to pageblock code to support partial pageblocks, when pag=
eblock
>> size is increased along with MAX_ORDER. Increasing pageblock size can =
enable
>> kernel to utilize existing anti-fragmentation mechanism for gigantic p=
age
>> allocations.
>
> Please not like this.
>
>>
>> The last patch increases SECTION_SIZE_BITS to demonstrate the use of m=
emory
>> hotplug/hotremove subsection, but is not intended to be merged as is. =
It is
>> there in case one wants to try this out and will be removed during the=
 final
>> submission.
>>
>> Feel free to give suggestions and comments. I am looking forward to yo=
ur
>> feedback.
>
> Please not like this.

Do you mind sharing more useful feedback instead of just saying a lot of =
No?

Thanks.


=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_20560B3D-9CB2-4483-BBC2-6D4DFD4AF167_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmCUDSsPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKuzEP/jmIOHHfzAPAXeBAyTyp5XWNQJbjDR7uTubU
wbuJC5jOofGdiSKypbdGSB5ta/srQPxD8wEeXFfBDKgTeL438WTPlchWYTQE0rst
hzSVWGQYddrh5V3BGXqRTRoUIIJicIVo053gqojjoDhxNWnCA+xThcoIpFoIADe3
PlG5o4CQjzfE+vjawuuiCRhSW8vlFg0Sxyg2TV1T47IMdvogvazYSJVuhuUp/5l2
iOfaartwDXifmb+88qMGXuulvThLlD5I7eXCqrs/Y1AtkW3O++cwmCOSwKrT/9r9
6vs3fRel0PSM66B2lLpWynmv0EjtQbSW2yq7RMBswI62WhjwSNaieTtLX+1VG+tT
19MlmlrAdg97LIkWRh97si6z1xTsh7C712gPLXfijBPebruYtVts3XDSDwTS982+
1HIEYnnM7BUDxvoZ8F1zRTHIauSioFyV1IhJnYxhfamYBtZzAfbbT/hOsi28nVZ7
6PXf4oyJeLLcjlbQ+9MROFbbwZNhDoABW3iIfwalNL0IdErLP8Uh34AF2YOLdKOy
Xv2hWs+1SNnhqZH1XfHRvFFxdte2P/rpXVh7qR48MfPw/58bWGgnLJvwNecighkm
vLE6VBMxUjtTI9N5gu+KqCJwNIvhGGfUCffA+e9UQ5xPrB7NgkH4W2kDMpocCiUE
hODKA/KB
=h9b6
-----END PGP SIGNATURE-----

--=_MailMate_20560B3D-9CB2-4483-BBC2-6D4DFD4AF167_=--
