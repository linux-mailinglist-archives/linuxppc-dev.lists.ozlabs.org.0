Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 021F288BEC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 11:07:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zoTbS1Em;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3lq45VL1z3vcV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 21:07:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zoTbS1Em;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2418::700; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3lpJ6s4Qz3cy4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 21:07:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlHJlrfEMvuWzHDlOrmpMjiG80/dBj2Ht8Xym6E2Ld2yAMnzCpGUivo0skYFrxKIVajcPTkfd34gNlN3SjwupNXbviIn9wKvl3qgzs4+LL6z0UUZS7IuY8A3muZj7F3pHOpPl1AqTJnWE8k4emYrL9zBxhTS5R7JWAIah5vPccC5KEv6MonZdZMtlE/URwYyHsE38oLMVvwcusZUUso69sFos9VnnhfiHGF6aRajGE+HVkksGax0E26xqYwBi9YGFTZD+n9MhI8sgDCmekvcL8l4tGsMvjHVBSREh4tFuWEdwb9+pb98E/WqAAZaabMWSJe2yKrG1934qokoSRIEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCZcqiQX/KGmjB7Thv3ntO08cG61XMpTYWhL49fL5hY=;
 b=iBY7dc+FUynsnHTVl+rLa6LygvqI7+ObJ0VMcp72+IV9ar2FsUUbEMHWRZeKwCkznATcOLao2Prk3/mZ8knncF/h1dAtJI1pVXwRgSF9YXF3yEYLWp1YIYE9E6AMezkvlnOhYhvFgYtW5MaOb6vJGjz3XgESZYPxYE01qNLxXvGtg84sVmS6d60Q8ryS7ZwwcceGW6De4FSZEBXYV6J5YoWd+I5lrwckAEGiVntuN9JdHLRQEWX8T8HYdnjWL4MPhYlF+uKZaSS5blk3obiOKt6oy9Rj45JiGMuXhDBr+2k91vwOwu7bGyPr2GrsmG0329bNDg9PkPUA87sEfWeByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCZcqiQX/KGmjB7Thv3ntO08cG61XMpTYWhL49fL5hY=;
 b=zoTbS1EmCZWFpacyEWlWDnoAVBokGX22BaFND4t8am+ZbA9YkmQkfW4OV1qc8XLbepe+088vA1FJbts3iDUdsgaKppYCR5d/58obqgiJ/PyiTI3TqASIdmZkqj1RTLZ+OxVl3eZEPVDzhyHN9QfjH+b0sH1a+c1DK5jvtIaGrpc=
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 by IA1PR12MB8555.namprd12.prod.outlook.com (2603:10b6:208:44f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 10:06:41 +0000
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c2c5:a349:ed66:b28]) by SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c2c5:a349:ed66:b28%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 10:06:41 +0000
Message-ID: <1a2b604e-6e1b-4da9-ac2f-e2f2c80054ce@amd.com>
Date: Tue, 26 Mar 2024 15:36:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing Xfeatures
 information to x86 core files
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com> <202403140850.5659C0F4@keescook>
From: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
In-Reply-To: <202403140850.5659C0F4@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0245.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::10) To SJ1PR12MB6124.namprd12.prod.outlook.com
 (2603:10b6:a03:459::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6124:EE_|IA1PR12MB8555:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iZJumW9HgAFn9PMKdUDpo5la0RLXOjBVx6tsFP43BBsgUHkQr6KGrdvO3svbamTvTisdv0A3zH9d9di3vw2qFGGQRQWp92yaEIcK2MyuABNIanc/DZ7chVBxAjgyg4SRFcltOwPWVxbqDo3bWCa5bkoDH85jHF5cYY2LVv0P+Fzd8GZ1hG912F6Y27dGw5kXxLyN+a2ZWN99CwNIdXnsPlBGAS1QvcZslCTKw93qUna2kGAkvLGpAYQtErT0j2CaOIoEXpTUgQuFrYCq+V0dCU8fNQfLTrmU7oGqmZIkygEZaHSegsvvrLQ9LOWm/HjpGizCnhdYZgp9pZwiHr66PCdbPX3l6H9NpYtNlRslIm8RoPmfRY6B+ekEtdQp/MlWRUDnT0U8OxYdRgqrJ8/CLrpTvpGsN1QtrnnXx6s/XIr98XsLnqkfsd27hkfNjfxNi6EoV4ABjWs+prJfX1QVduxFOLABJCg2avE2tlJX1UGN/Tyx9JC2YHiY7QbBdq+5FKJRGgfK53M6mkWcblgYd0mDg6d23gGAkUlHU2U7VQ89/Gn/c5OAJNGBuNvZm0QZbYcAUm4KgCCeIihHygztUDD2H3zhvT6VljsRKWEnwRFz1V7auxQKBEbKBARFep88gJ/FjaS+1kbqUthaM+crjKO5kczHkgrdiH7kzQU50EA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?amlUNjFXNzJ3b1JHbk0ya1NSNjVHRVROR2FNc0pyT1c5QVh0Ky82clhLc1lQ?=
 =?utf-8?B?d1Q1Z05ITHlyQVhMVFJoUWNxdHlxUDluYk8vU1htd0g0TE41WkdFWHpTV3Bl?=
 =?utf-8?B?bURZclB0b3MvbWl0bmQ4cldPZ2Q4RDZUc3BQa2IyaHVTUXh3L2owbVJPTXN4?=
 =?utf-8?B?ZVlkaHZ3cUV3T1kvTjNaRUlRVExSazNiS09wZFBnWHlETGw3OVJCRUd3ak82?=
 =?utf-8?B?U0NsVFRNdDVEczJVeGY1b21xeEhxVDdUZHVoMjBrcGtrMkZSbEo5TU5RaVBR?=
 =?utf-8?B?bTNqUThQVVpvMkxkcHBYQ21nV2RNOXZqVUNuaU5JaUFiZTBvYzhnSElkT1lN?=
 =?utf-8?B?dFlpRU5sZUlJTE1BSGtxbWs4ZjhldU5MSzhNVWMzNEJMaFdxZW9lc3kxZWJD?=
 =?utf-8?B?aG84UzZ3ZVJpMzEyNEU3Sm5wT0xwQktaSTZhdHVuTEdEZzJMcXEvSkpnbHR2?=
 =?utf-8?B?Q2M1cE03T0JFSHNYRVFweDB3em5KWXIrK0tVT0JSK0ZLaXg4QnlpREhubzM0?=
 =?utf-8?B?SVhSVUZKODR3dC9OWi9vMG5sL2JBNlVDSFlXUnJaUGk2bUpWRmRnMFJpeFZG?=
 =?utf-8?B?R2JHQ3RmaVVGSlZlUWNSdGwwVUM2ZUtOWHVGcytLWWxBdnZUOElvN2g1dUZR?=
 =?utf-8?B?L1ZuWm1kYnlieUljSmJpdGtiWEdrWkx0VlFtci9MWUh4NkxWL0lwdjhDY2ZY?=
 =?utf-8?B?UTk0TTB2ekxhQ1FNamx4Vm5MM0VQV3hwUGJQc0pZL3Y2N3lqeitIbFRRem5F?=
 =?utf-8?B?dmdNUkF3WElZaGVjUHc5b2kxT2FYU0ZzbE05U2lFUjVzUG5IOHd1dUVHcklB?=
 =?utf-8?B?WkIyZDI0K1g2SlJhUHBjK3o1QmN5UUxtWHdrdWdwMk1vb2Z1cUxHQXE5OHVX?=
 =?utf-8?B?S0F2VnREZzRyS2ZaWFhEUGN5RlE3a3NRRGtUVW5BNi9FZzBZYTFuVDhMUFlF?=
 =?utf-8?B?anJ0bzQ5ZFgyN2tjTFpsRXhhVGROaUpVdkd1dnVzMEw1dE9ZUC9CblhPZ01y?=
 =?utf-8?B?d3ZIZnpiU3BTNm1FNFZrcGtmMGpFYno4R0M2R1d0QkVGM3NVTVN2N1haUXhj?=
 =?utf-8?B?ekYvWTVLUjEyZzNYclcyRjFnbjAwanZLbWtrZTJaMHRlWjQ0LzV1eFd1aVh2?=
 =?utf-8?B?dm9WQWs3dFMzYlVRTjVUTTZ6YjNUL0ViMnRFR3FlRERvRGdDa0FjQ0Zybktx?=
 =?utf-8?B?SndOKzNWTytKY0h4WVp6QkIzRk5GUW5YalRlQ0Q3Ymk1eVk3bDd1MmdPc3Y0?=
 =?utf-8?B?MG9XZGpGQ3R1UUpKbXhHQnRwMFdnVlJkeW9rTFRIK2QvNkhJeHVSN3F1ai9H?=
 =?utf-8?B?QkdhbGNwY3o1S3FHT0x6aVE0azNiV1RTYTBxaHIyVkxOQTRnRXZtT05IWXdq?=
 =?utf-8?B?Z3FMbjFCVUpmQ2xKWmhndE9JMVU2VkNwVHpBMVBnK3VQUEJjenNyTWx6Tm5H?=
 =?utf-8?B?TmxvUnJEakJ6Umw1em9CS1UwYUZnWFlpSEFtWGV0eUg4ZnJVSDVvUjRmZnQ5?=
 =?utf-8?B?c1dES05aeExxTjJrRjYvUVFjem94RDJ0TDJybzdTZ2g0RnllZFFzU0RNQXU0?=
 =?utf-8?B?ZjVJbWRXRFk5U1Yyb0tNblMxQ1JqWXJ2REtaZnFaVXBUVnNHejl0VjdZZGRZ?=
 =?utf-8?B?UDJWeHgrVUJNeGwxV0NaMTIvbnNLTU8zVVFPTnM2dXYrcEZLSHRoNThjVXdn?=
 =?utf-8?B?RmFEd2JDeTc5V3VwbE50S2kxekgzK3BoMUJQRGowN28vRW1HK0tGb1M3eFJI?=
 =?utf-8?B?NzREZEpHMnJuT1h4VjFYYVlDQ1Q5d1BXM1NTZy9ZY3RaL3oyVjc0ZXJJQVBF?=
 =?utf-8?B?ZFR3TzJHTEdHZUxzd1ZPSXJBcFRFVDdhT0NUcTBmaXVKc3UvTHhJWVZLQStD?=
 =?utf-8?B?MWVBWFA0U0dQTEw5Mi9YeXpJTVJiN2p5eFJCcHJ6QmFjdEFNTlhhTndrNnc5?=
 =?utf-8?B?SWNaSi9DcUVCUUFqOFN3dVFmL1Q0aTFRR3pkd2JPZ21qSDBxbTRoRDBRTlQ5?=
 =?utf-8?B?eGtDd0J6Q3VwZldzSlV0VkNYMTZraUF5Sk5kZU5OcVBSa0wyTE1NSzN0MVEy?=
 =?utf-8?B?d3h3L2R2dENkWXkwc3k5MTNPVFZkaXZnSlJZM1pCMGpXTTRheXNsYTNFOTNV?=
 =?utf-8?Q?PlXID0VRltIjHWIdRgRzUWh2n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c1d0fd-4728-45ce-2f7f-08dc4d7c6ea0
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 10:06:41.0119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgiD5X4SumZXyZv/PAUOXuuBwqnrLhGgQ/B8J4NVt7TzRBQA+Rc4JVRm/4LhcnclEB+3QSPVJ2nlXmkz18DTIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8555
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
Cc: "matz@suse.de" <matz@suse.de>, "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "jhb@freebsd.org" <jhb@freebsd.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Petkov, Borislav" <Borislav.Petkov@amd.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "George, Jini Susan" <JiniSusan.George@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> Otherwise looks reasonable, though I see Dave has feedback to address
> too. :)
>
> Thanks for working on this!
>
> -Kees
Thank you for the review.
I will address all this on next version.

thanks,
vigneshbalu.

> --
> Kees Cook
