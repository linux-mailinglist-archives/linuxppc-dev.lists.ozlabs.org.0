Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A82A16DA5B3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 00:24:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pswz7458Yz3fXR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 08:24:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=11FswRw5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eaa::62b; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=hamza.mahfooz@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=11FswRw5;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Psp2L69Q1z3fRl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 03:11:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8HE/9vYza0He3zqmKCDCHNvomIt2yGh9By+lA0oFRLL5XzZZhllfgHxRQxzL03UoI2sAhAyL+xzw80fG49XsX19mi8MBDADWcqvgon0eGB8lcsgvQa7gjFNNPNSCNghdgCM1r2NJPNrJbqFLUUk9AyzdhRHbsbjW2m6T7ww/N2T73DHXDJFDR94y+dlP7TERARySfhakcV6Dcx73DeK8MDMUotYdEmz8Pr4a2X3ZR+KQbRivUM41AArKqYcYzIb5tCtUDHFPYi9bswY/GeE6k5h6BNU3C28A7iYcYo8ogZ8EBMzu250lYqqn2oIizGToxzyLpFVFca4gGUwoL3Szg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qs22qxjAuqDmCGH80DSq+qPz8n01+P81j6sW5hrO9Cc=;
 b=Ik90bbu4dkN0fUrpihwvRa08XRMezEvYoi90meXu+VhUWR0Xf+y5D7hsd7l2sKu7fHER0Mqw7/d/jEZ2G94LqjOa4b6w3WFEhKknTK2Ucsn1uah7/9YyrYsraqZITNQrxPbeWDm+3gxoVel04LT5LQJu44omVmyMPG59hhB/69B6knOEWPKVNJraAOW3Eea+fsbKwkiwKPESsECdKmUEiGHRFROe/ZP7qTBfVdPA9a+8Nf/65w2Ip5pYFOyQ0rOKECFVaPu9EOdze+FfHThxCAZOquzaH++DVMvWseH5DgH9EcUfmIWT4xwGhimN9+ZmowS/XNgmtOJX0qmjkIIbnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qs22qxjAuqDmCGH80DSq+qPz8n01+P81j6sW5hrO9Cc=;
 b=11FswRw52Ze1Lu+8hWkkOYoqSjZxg+8UYNoY0miJ+2D/Sf9Ae/B9KFhY+aT2kFAD8aGAFPP3jRJZrpXi1H8QSo/XFwZ4HZgTpCn/fwDhKUY5BdOapJFAWB5q2KXNEZ59TCq6IM9GDdZMBrYuWgpaXSSVIJDSMqJo6Y2mpdLmNoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 IA1PR12MB6257.namprd12.prod.outlook.com (2603:10b6:208:3e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 17:11:24 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 17:11:24 +0000
Message-ID: <155c1057-d928-9037-9847-58cdbe7cf537@amd.com>
Date: Thu, 6 Apr 2023 13:12:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] powerpc/64: Always build with 128-bit long double
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20230404102847.3303623-1-mpe@ellerman.id.au>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230404102847.3303623-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::16) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|IA1PR12MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb20389-26a3-460c-8e2c-08db36c1f355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TTEJlO6ts2I71eyb0dHUkpLjSor6MXgs6HfnZZ3HLQL6uvpcqcXf+9yBk1E4w2GdI4l5TZlc5F1xjOXTV0+SMejGsmtLajkUPICj87WT3XRghH1QBZugmR4XoHCm3khmk+wmIfBGhFl0dPGxE30WfGi3YCLkDivSBbK39PRQ7D4EnJl9YM8cRa9d6opbcwr+a6sX0BBn+khOrdtyEA37ub2PDmoMjsMSsV9oA1hYmZsss4fnE+/3go950HQaJhNATpw+iy57Sa//lICfR19Ns5vJTadubn6hjiUdg+h3qs/55LNivjjOs83uuO+RLAy7xMiRPIHqiPwdAA90OQFuYJn1p31Kqi0IFuM0zYLHeuz43iT63kqfWM6peYFAbt7nG9Z/KKEio009W1NogabFI7XFYDwhtlAiBwqaos6iYLUBpNBK3sLi3bfclRV7ObicXF1twUwN+q+kLDIVv1HIV7HBrR6+ZZh/A/MMN+wxliJY1BiowjindQKB4uXmyJMsL6lrVdz21a2COcrHvjGA+qDtNCtGNLHrrtWpmMEYJ/C30Al7rSkzUZADnhRr0V/yhxWgEYqS6jazVGNPy5jIuHEoaXENvjpdGtXEDaijGJjzmZdU94JKZk9dxFCp9g5PFthvtLS534YjiNseuSPboR4Ddlqady5KmxjLfVrCmQXChyeQX/OiwkE0W0lkygTn
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6280.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(2906002)(36756003)(6512007)(6486002)(316002)(966005)(53546011)(6506007)(26005)(2616005)(478600001)(66476007)(66946007)(31686004)(186003)(86362001)(8676002)(66556008)(83380400001)(6666004)(4326008)(31696002)(41300700001)(5660300002)(44832011)(38100700002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UjBaRVR1VFFuQ0owME5FdHlXTXI2K2lZWlcrMnVwU2pqdkZaMWFrMllWTG4r?=
 =?utf-8?B?V045RFl6citFUnZHenNmRUhQRVM5RVdFK2JoQWpYUkFrZGdhWWZtWGdlZlhT?=
 =?utf-8?B?aEtoRGlWRHdvbFM0cFQwTHVnZFhXSElQU1VjOWVaNkJKaEhMYTU5UlBzdkVF?=
 =?utf-8?B?aHdGUk1SZ1BCVE9CbGVtVmx0YnBsQjNiWThwT2l2UStpL1RRZUdZSm1oU2VI?=
 =?utf-8?B?QmVQQUZqRlFqRytrV3JaVmNzSVdrcmdlOEhWcldta3NseFFlRHJ4ZmNwcldz?=
 =?utf-8?B?cmMzWG9mSDVQQVJrckw1RFVtTXY0a0MvMW1WdjJLVU9SZllnVmx6R1hJQ0xY?=
 =?utf-8?B?VjVHbC94YmM5N00zdDZCMU8weHRPNkpJTWQ5azZEK2Z2Y2pWTDN1Tkk1QW51?=
 =?utf-8?B?emFHVmljbldiKzRXYnRXN2JOWDF1VUovdTUxS2JGOWc2dlNhNVNqSkJpMFBV?=
 =?utf-8?B?bSthSmZtWktPelU0L2Yza2lUcCt4KzM5TlVkc0hlaXVIQnlBMzFhZEJUVThH?=
 =?utf-8?B?cFp0RnhsejlicW5mR3BwYXRZNFRLNjQxbDBHSHFTMHNLa1Y0TmpsMEJEakJp?=
 =?utf-8?B?Qzh4SHNncTVVUnZ4dzhseUI3STQ4cGdRQ1NDdTBudkY2ckZTWmo5anBvUlY0?=
 =?utf-8?B?UXhZZ2NYd1NhaDh5Rlp4MjZsNzlaZzAxR2ZtMGppT29FeXJMSGVMT0w3VVIy?=
 =?utf-8?B?THdjT21wcEdNNW5aOUJTb2JhbEpoRWVLWDJtQ0pOYTBYOHlvYjlTdlI0ZFVT?=
 =?utf-8?B?Y0ZodkNkSi95VUI3RXNua3lQYWUreGZBNHBYZGtSUUxCdWNBaEx3VkJNRlgx?=
 =?utf-8?B?TjAvNGVXV0ZuU0J2N3o4UEhTSTNnYVpkc3E5OGxadEppU3FGZG56cFBHcThN?=
 =?utf-8?B?WXdWZmEzT0VvZ2t6eXlxbmRuOFFGR3IzRmpoM1lMZDluQWFSYnJBM2U0eVlQ?=
 =?utf-8?B?TVh0Ynp0TTVuK1p3WnNLTHB4Yit6Z3k0TzdrRE1ieHRRVDFxWlpjTjF1c1Zl?=
 =?utf-8?B?YmlNcjVCeTltY2lzQ1BaeUx5VFpkay9EU1ZBcWloSVpkOUhnN2tHR2ZHMHFU?=
 =?utf-8?B?anE5Z2tEY0JyZEI3OHl6NjlvM0F5cUh6L1c1M2pCdFdCNWpQUDJ1ZnVUZ3V6?=
 =?utf-8?B?MVVXdWJBMkZVSmhHZC9RbUM3OHZPTDVzOER3UmZYc0pIKzUzN3orNUFzSFlG?=
 =?utf-8?B?c0Z6eThMNU5Nckt1NUpPTEgxQkdyZUtnYS9FbUhLZnNBNERkNitNZVhhT1VL?=
 =?utf-8?B?dFRPYkdGYVlkdkVqbEpHY1ZXSlZlRUVRSGx5cUsrOWMzcVhXVURYdDlFMGgz?=
 =?utf-8?B?ZXN1aDJQN0hzMi8wS3o3Uk5iU1RJNzdoNzhhdUlnMGg0V3B3UUdwMk45MU9z?=
 =?utf-8?B?Z2JpUFBRckx2SnJla1RjM2M0ZXFxeVdHb0luM2haYUNCbzhucElXdGhocE51?=
 =?utf-8?B?YVlFbGE5TE9qSGRIeWozQ3RVS0dUQ0gxWXVYdyt3QmNwbENYalBQbnZ5a3lz?=
 =?utf-8?B?NVB5UmU5eDdZaVcvUjI0L3JoUzlXdjZRS2pOYjh5THUxNWVuZW0zM0V1ZFli?=
 =?utf-8?B?VDlGVUFhUVQyVHRlSGxJak1rYmM3K2p4NXQ0b0xZQUtuTkNoSDA1dlVTZUJX?=
 =?utf-8?B?bjlPTzByd0hUU0RVdFN2M0ZZWGV6NHo1NEZJNG9FNmVMRzc4TnZwSWVORU50?=
 =?utf-8?B?UUZBSGpKMWxDT0c5UUpHaGtHMWZvRXduNms4TDJhNG1zODJISkUzOHhaakRS?=
 =?utf-8?B?Nmh5SkxSaXNWbk5zdHpxa3J0S2FIMjlzREJ0UFRXc2tYSWZYUmI1cTRnYnNr?=
 =?utf-8?B?eTJMYmQ5MnM0SGdtZkR2Q2FqL0Rha255VTVsUUVmM3V2K2taUlhoU2t3STFR?=
 =?utf-8?B?RHhXWmovek8zZWNoWG5IaGR3a1Y5VTVnYkxFRDkyZzQ0ZnZuRmhOSjFQaC9w?=
 =?utf-8?B?emV4eElldnFMclo0WENWODVWS3FtZW01Nm1TeXMya0psVFVJQ3NoZWNFYmhP?=
 =?utf-8?B?cWJhbk1Ha0Q3eWlMQXVlV3BORmt6ZDU0cWthNmxsNnFOYlhMWUVhcWdQa3U5?=
 =?utf-8?B?S095QXZCMGpYNUxja2JNdXF5SWVaM2xiVEowZkU3YkVWa3c5bXpDOXlVVkI2?=
 =?utf-8?Q?BnenJVQdCN2sAhFfCL2eQRvbU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb20389-26a3-460c-8e2c-08db36c1f355
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 17:11:24.5750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vG9Y5+DUDlNx6vxSVzBfSBYS7mNyNmyWOOuUj4eUXrBI8MvHZOrmww9bW8jX6CY5WQGfLgfrSpzt8FOQJ+tGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6257
X-Mailman-Approved-At: Fri, 07 Apr 2023 08:23:52 +1000
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
Cc: dan@danny.cz, daniel@octaforge.org, amd-gfx@lists.freedesktop.org, tpearson@raptorengineering.com, alexdeucher@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 4/4/23 06:28, Michael Ellerman wrote:
> The amdgpu driver builds some of its code with hard-float enabled,
> whereas the rest of the kernel is built with soft-float.
> 
> When building with 64-bit long double, if soft-float and hard-float
> objects are linked together, the build fails due to incompatible ABI
> tags.
> 
> In the past there have been build errors in the amdgpu driver caused by
> this, some of those were due to bad intermingling of soft & hard-float
> code, but those issues have now all been fixed since commit c92b7fe0d92a
> ("drm/amd/display: move remaining FPU code to dml folder").
> 
> However it's still possible for soft & hard-float objects to end up
> linked together, if the amdgpu driver is built-in to the kernel along
> with the test_emulate_step.c code, which uses soft-float. That happens
> in an allyesconfig build.
> 
> Currently those build errors are avoided because the amdgpu driver is
> gated on 128-bit long double being enabled. But that's not a detail the
> amdgpu driver should need to be aware of, and if another driver starts
> using hard-float the same problem would occur.
> 
> All versions of the 64-bit ABI specify that long-double is 128-bits.
> However some compilers, notably the kernel.org ones, are built to use
> 64-bit long double by default.
> 
> Apart from this issue of soft vs hard-float, the kernel doesn't care
> what size long double is. In particular the kernel using 128-bit long
> double doesn't impact userspace's ability to use 64-bit long double, as
> musl does.
> 
> So always build the 64-bit kernel with 128-bit long double. That should
> avoid any build errors due to the incompatible ABI tags. Excluding the
> code that uses soft/hard-float, the vmlinux is identical with/without
> the flag.
> 
> It does mean any code which is incorrectly intermingling soft &
> hard-float code will build without error, so those bugs will need to be
> caught by testing rather than at build time.
> 
> For more background see:
>    - commit d11219ad53dc ("amdgpu: disable powerpc support for the newer display engine")
>    - commit c653c591789b ("drm/amdgpu: Re-enable DCN for 64-bit powerpc")
>    - https://lore.kernel.org/r/dab9cbd8-2626-4b99-8098-31fe76397d2d@app.fastmail.com
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

If you'd prefer to have this go through the amdgpu branch, please let
me know.

> ---
>   arch/powerpc/Kconfig                | 4 ----
>   arch/powerpc/Makefile               | 1 +
>   drivers/gpu/drm/amd/display/Kconfig | 2 +-
>   3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index fc4e81dafca7..3fb2c2766139 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -291,10 +291,6 @@ config PPC
>   	# Please keep this list sorted alphabetically.
>   	#
>   
> -config PPC_LONG_DOUBLE_128
> -	depends on PPC64 && ALTIVEC
> -	def_bool $(success,test "$(shell,echo __LONG_DOUBLE_128__ | $(CC) -E -P -)" = 1)
> -
>   config PPC_BARRIER_NOSPEC
>   	bool
>   	default y
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 12447b2361e4..4343cca57cb3 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -133,6 +133,7 @@ endif
>   endif
>   CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
>   CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
> +CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mlong-double-128)
>   
>   # Clang unconditionally reserves r2 on ppc32 and does not support the flag
>   # https://bugs.llvm.org/show_bug.cgi?id=39555
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 0c9bd0a53e60..e36261d546af 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -8,7 +8,7 @@ config DRM_AMD_DC
>   	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
>   	select SND_HDA_COMPONENT if SND_HDA_CORE
>   	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
> -	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128 || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> +	select DRM_AMD_DC_DCN if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
>   	help
>   	  Choose this option if you want to use the new display engine
>   	  support for AMDGPU. This adds required support for Vega and
-- 
Hamza

