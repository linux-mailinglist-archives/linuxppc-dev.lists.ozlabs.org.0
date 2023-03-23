Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 883806C675E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 12:58:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj3lD2TPQz3f8m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 22:58:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=di1GojWF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::628; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=di1GojWF;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj3kH1SRCz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 22:57:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKEXOuve3wrQZxek8Ll9ZT/rzcuoaLSWT5DYNWW8DgXK1UXK0+B8JiR4YHHglXKkcPFLB/4/8w1NjzQSkx6wFqgXW07HyavJWzLhlY8NlnIl5jsU5kbzn9ZgyuTRVuHdcAu7Z7AEH9E/aoplsA11Z66om8afGXg+JeLPM9icjK+8g8Dk7fGYuXtr19tKeFUSJ6NyUoACTJxpa/WFqEKX7IcfKHMSMDBJ/hyxIf6wFhGpbeiRh8ZHdcPXC5nsl20aGv4qAOu3xU6opmXuFGUuZy+80suQbfhA89u4jm/FAasYfQsiUz+YhrSlymisX3zVls5zOO4Me0HbcrbgsBgw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhezvfbvljyqjR/WIEkceKdPBbqTdjVj9sWf3/vb8N0=;
 b=IXkwwH9gbfDl1YDgpmxHXFymsvrQcBXJSSWcPRtohYdXF0n7NBwC1UnlmFUYFCiva4aSU7BWLkLFzy5nG8VO9fIFR6yGU3gGI9O9lRij5nZ/X3z5hfcE1zLLJtmSEI4pMfeEyS/EENVzCY2iiDDoGzAs7dNxjwl9zbelUasa5jzslbxvpeZH2WzIqsvpRyWTDiGY/kqkZqXlIU0ZPc8fMkwxCnjp8EeLjGiivLxyptZjhpg+WuAq+rhmlsjKrxN0+OgIPg6TBi0UplvAjmjOj7KOO9wxCrWvyT1olQVnvG67RK3gzVOUd3tQoRypsFT5CAFBwfC2LgsW9VzVy3ZcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhezvfbvljyqjR/WIEkceKdPBbqTdjVj9sWf3/vb8N0=;
 b=di1GojWFBOXUeZKYoWUgZzQVaG0dvQ1ErgK2sK8V+Ym9sp85xm6GKXiZ4oQ9hZY7EDFEroe5bpqVxQugapjiz6EhaC7O0tr7pZeVRzpUHs4BBqjMpwtlWzxPFdLzv1m7QmgJhT2uWyPmlQtcM9jKpl82rkpSIkMfsKqOSx96y9McYlO2vqg9g+nEPd7ANd0LwtYNpv3ufDloiNBaGzRxMqtA6ody7OLE23PLbwcBydVb/57h3teQQMqLzMlWyz30snwPEUIhQMOHXBlmFUcyjr7lsyr4hB65vK5N76wZAaHLsxvSzPhTIxmUJqSAaJhfL9FvCAFNgDnVHxm/BdAXFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 11:57:18 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::bb0b:f14a:c49a:9cd7]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::bb0b:f14a:c49a:9cd7%4]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 11:57:18 +0000
From: Zi Yan <ziy@nvidia.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 02/14] arm64: drop ranges in definition of
 ARCH_FORCE_MAX_ORDER
Date: Thu, 23 Mar 2023 07:57:13 -0400
X-Mailer: MailMate (1.14r5937)
Message-ID: <0A14E221-C078-4EFF-84FA-8E326685D8D5@nvidia.com>
In-Reply-To: <ZBwr0bXdtOtKKila@kernel.org>
References: <20230323092156.2545741-1-rppt@kernel.org>
 <20230323092156.2545741-3-rppt@kernel.org> <ZBwmxbRJrF8RxZEp@arm.com>
 <ZBwr0bXdtOtKKila@kernel.org>
Content-Type: multipart/signed;
 boundary="=_MailMate_C0B9CB2B-1F3E-4990-8124-8C2C5E7E129D_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR19CA0063.namprd19.prod.outlook.com
 (2603:10b6:208:19b::40) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|MW4PR12MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: a72a7b43-bedc-43b6-5156-08db2b95c06e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6daAaho0uxEjGqSjlOgqngxZXD/eu8S4YbWLOLpqSVMM2TBm5pb9ivLuuJael4nHpzYWDT9qvWx8dyLCAwxmbdPdZ3AqN1eXfJZ5fSlFx8PsPcdDhGjZ4ErgUPIXYV9Gjp1WMtEwcQHtTECwM4aNNOMdgOPb03gYQmh8FwhbN+WBb6uMESZZ+Sq2NO3smshbPuVn1aeEdon2R0uVBSFc3nCW9oJxe807xuVTR0dLY7pg9PcT57oaKcCSlPnyqo3sYef50KH9SPGdBo5wMei0RoN1cN2tmnLUV7xCetEtuTsK9mWOfQrrYP4U5M25oem/r+egafYsY4RY97lgvBz3NXIXOM+x6cmE1Q4Yj4RJSRfL+pfMUADSIvyBYz25LroGXFpoGa6JoWdM0mWib6XnLmh4pAepFHbOMZmEaeWkHKrpy8F8cDMsGDnoFe+LdKfaHPLgpkTKVAh5I+7TL20IB74Jd5gbV6fDTvPOQQ21l4NGREpd9vTvtnbLuppfqRM/epV5rBjIdxffbDgGGpORBoTJTepXZK/HJt8JBPuLcXYx/VyMVd6iw0ewAE/jGtiJnETMUa6NOU6nlsFSwZe/JcZS0u+m2rRthfWF3XBFRpywpNuBJA7O767KVZtr3VIkQujaXKnskaGh6FHe8VpKhd6Iu6bDaouaglGxtiEPXK1TIiFZ6wm9+CR/dhhYKAHWNWfCmcWetQFEayoaIPPuFD2DTAsHPumf53SVCiEDKW1BCoa/DbCyBd2OsyvhDb73XnC5/Q6mAyrsxTkicrp9Xw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199018)(53546011)(6506007)(6512007)(26005)(5660300002)(7416002)(6666004)(235185007)(83380400001)(41300700001)(2906002)(316002)(2616005)(33656002)(54906003)(38100700002)(66946007)(66476007)(66556008)(36756003)(8936002)(186003)(4326008)(6916009)(478600001)(6486002)(966005)(86362001)(8676002)(45980500001)(72826004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?BHfFNfRO9aaz3Cn0SehS2uK6mxbPsqicJlsxZ4EEdYHqG44tm99d+Z9UdorR?=
 =?us-ascii?Q?NZV7f6ZT1gbjwMZVH2DKeMLR3XqN1bokZnPCvpZkOOSLLvn67HPZ4XBVWHiD?=
 =?us-ascii?Q?J2hrKilMAAA7fIiVU+LIQlaJb+uTPm2/pTLIBoxYBicG0VfOtBND10ERGW1e?=
 =?us-ascii?Q?PeG9S/lTD+hH3GKnYWY226WFgM+H4RMTWUFMwAd+5QA67XodLqRCtSK2x2Up?=
 =?us-ascii?Q?SGzEG0FjxBLaK5bGhIZ/HVtu7XrOCbpSDJKW7orAU/OqjUlJHBlsxrs7V87d?=
 =?us-ascii?Q?3Y+hpIGml8fUpSQskHaYCnAnzWVFLr8FpFLV+2ZhszHRFmpNbs1n63NHCfju?=
 =?us-ascii?Q?bTWBTnPKDWxbdCcYd1umzWH3N5xPeRBftLzy9uwjjDbM9rn+wtg3PfcKnPJj?=
 =?us-ascii?Q?tbai1wAiPhaCiavcesODeR6B4O6NJ47yfK/aBZDzcdGui4VN7NE17sMwnaGT?=
 =?us-ascii?Q?dZtQWjlspiGLc1A5KwvNo55+a3SmTgkMfFb3EJOR/rZBQSE4z/PlpaEJAlzE?=
 =?us-ascii?Q?XGKmEBLkef7YoTlTWhLjY1foDCGnxBdPIAiIO3RzPgRhRRqJgZagPeJokyVe?=
 =?us-ascii?Q?Cqle4zaS1dso5UN8NgWy7LqxbpoZeUp2ZEN7mCQ7exbCevA5sbZkDV2y2zwX?=
 =?us-ascii?Q?jpxq3lHdBLxfR253rpiuJy90wjiGke8x1bs3y8Tav20SvY+mntlP92P3sKiB?=
 =?us-ascii?Q?wUbofiHdq/RBTsubYE0v83eM+pnfmK8hzvV5TDegKgzoMEyRDGM97UVkwjnd?=
 =?us-ascii?Q?HmbYp2BXPiqVO4HnST64bt+5nOkNi8WvRpeWWO5FaM1WIAkZEv1QKes47RjF?=
 =?us-ascii?Q?d41nFeevIS8nxfr3WQ7ge4n9hPSIRzYOlvrcyYAI2hOrR/ivYTru0Ct97Kio?=
 =?us-ascii?Q?pPWdbe4Ed8DoNcYiRktv1k16dGZU602AaBRXP/7Et89fy0pEslCgZbLTyioE?=
 =?us-ascii?Q?c0Ft935qJ6z9FHuRLQjWokBRwMXqMCqfuQRwz63YfB1RKJR4Ao3NXAgikZDh?=
 =?us-ascii?Q?skSm345LMplgpHvY5yB5wHJVZmO+xXa7kCU36NguPvIJ2+RwkacsAtt34dgZ?=
 =?us-ascii?Q?8mtzloQ17AgJQ/lIme7dNKTgIrEZq3ygp/ogThoqxjVuhFkytW2o8YJLdFDK?=
 =?us-ascii?Q?ItMILmTISHCPGKk+H5ZZebd1mZmoWJbht4lU6xCvskegNpu9yYq0bYo7oPrh?=
 =?us-ascii?Q?N+3IJuPztNV7f+4aI+mhA6awcseu0ABeLFfZBIQdgUiV5c9+A7q7S7ovkHFI?=
 =?us-ascii?Q?R2DhdcZUbO4R8948ggH39EMLkSJ2huvsZRa4PaLbcC5OO7E3J+WkQg5BHmY8?=
 =?us-ascii?Q?92zlgULsmGQP+XaxTCgd9o8gY+0rxpaHG6OwlhTJxIan0ELbg9FWxVjCn6Xg?=
 =?us-ascii?Q?r4KltsrHdOsa7WCLjEHuvl+wc9Pit+tLFhq3eRL/7ftQqFFaUKg2ktF+oI1G?=
 =?us-ascii?Q?fOf7oOWX3RzPNN96Kna2zK7bYkAuqx6GyQTlLPlxIsZcI5gOdkd3Nvvx4lfb?=
 =?us-ascii?Q?oo9hLSmV9BPIgmuN+ekwV5AeAFBCSKTbb6MBniHN1Mo4U27txDDm3KNnvlZp?=
 =?us-ascii?Q?dR0jE10uqzaq16NT/7UQs/q1NnMvfiCREa/bM7em?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72a7b43-bedc-43b6-5156-08db2b95c06e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 11:57:18.2883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87bgU0V8bYcFk/2/HtSZuiZjO/r4PHTMp98USqB1FFkti+RM0889AFUG70/XSfo1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_C0B9CB2B-1F3E-4990-8124-8C2C5E7E129D_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 23 Mar 2023, at 6:37, Mike Rapoport wrote:

> On Thu, Mar 23, 2023 at 10:15:33AM +0000, Catalin Marinas wrote:
>> On Thu, Mar 23, 2023 at 11:21:44AM +0200, Mike Rapoport wrote:
>>> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>>>
>>> It is not a good idea to change fundamental parameters of core memory=

>>> management. Having predefined ranges suggests that the values within
>>> those ranges are sensible, but one has to *really* understand
>>> implications of changing MAX_ORDER before actually amending it and
>>> ranges don't help here.
>>>
>>> Drop ranges in definition of ARCH_FORCE_MAX_ORDER
>>>
>>> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>> ---
>>>  arch/arm64/Kconfig | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>> index e60baf7859d1..bab6483e4317 100644
>>> --- a/arch/arm64/Kconfig
>>> +++ b/arch/arm64/Kconfig
>>> @@ -1489,9 +1489,7 @@ config XEN
>>>  config ARCH_FORCE_MAX_ORDER
>>>  	int "Maximum zone order" if ARM64_4K_PAGES || ARM64_16K_PAGES
>>>  	default "13" if ARM64_64K_PAGES
>>> -	range 11 13 if ARM64_16K_PAGES
>>>  	default "11" if ARM64_16K_PAGES
>>> -	range 10 15 if ARM64_4K_PAGES
>>>  	default "10"
>>
>> I don't mind rewriting the help text as in the subsequent patch but I'=
d
>> keep the ranges as a safety measure. It's less wasted time explaining =
to
>> people why some random max order doesn't work. Alternatively, we can
>> drop the ranges but make this option configurable only if EXPERT.
>
> I like the EXPERT alternative more. I'll add it in v2.

I got an error report from kernel test robot, which set -1 to ARCH_FORCE_=
MAX_ORDER
via random config generator[1].

Does the EXPERT option prevent kernel test robot from generating such con=
fig?
Or we should fix random config generator?

[1] https://lore.kernel.org/linux-mm/91E887E4-0867-421F-9C75-FB9CFF15C33A=
@nvidia.com/


--
Best Regards,
Yan, Zi

--=_MailMate_C0B9CB2B-1F3E-4990-8124-8C2C5E7E129D_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmQcPpkPHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhU9EYP/R6RuN1pPr5jRFyo4D+2nLzmk6uOP2JexQ6T
6fnLGGr4kraIULDhfR1OqB9bJl25FyMrS6GpsJckpg7FQkXxffvVmdAFFv8MHhyF
/Yag0WuKNuozliOMeL2WW4qLrlk+wS41ipvi5s1vqJQKjfvjB4bNrL4ELh+wAso3
6mVTpnad6XsJJxZ70i2QMD0hOOA/GnSTyFw7/h4Wm0BS+sTV3amC7DvIE3Tx1XVG
uFxBHjOsSe0UXUuo+Z5ZQZSqdkmfvzzY35/NzOBYx1v0aVWUueXsdTLFrukWEPJu
AQA1NIqcxz+p7+OxgNrNiyGQIr9aroJb5jgfjenXjcat8lsiTFqW6lZmKviaQ+w+
Bpur3EgYyQOiZFf6ox99WXbJONqPhSwVG36+Vsu9ACj/oCzmBNwlUtOuQn62Q50M
Ct2k4j/UmhDPBCXZpHWLwqGTwhvqs3uSIOMPqZe0qaXAd6MJw1sPqa8h6MV5+Vf9
mWBApZod3ekSrRR8GKuKortn8Wm0Lh/KtdxAn5vWRV6UKq3wgSJTHwPwJjKVsa/Q
q02bSlYj3SgmnbkFbHK4S0x6Bf8p1R6XreCW5nLnv5NuPiKeG9yLkqOJk5d7uqmY
Z8gVdSyn1DAQ98Qs+VXDP6uYrt0Sq3/uqEdHgwWSYaCA0vmzzlQoRcheTh+n9Cq2
F6T7/BJg
=WfgP
-----END PGP SIGNATURE-----

--=_MailMate_C0B9CB2B-1F3E-4990-8124-8C2C5E7E129D_=--
