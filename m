Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E5368C9F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 07:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRN4g5h2Gz2yjD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 15:24:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nnE7ci27;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.237.82; helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thomas.lendacky@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nnE7ci27; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRN475KLzz2xfk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 15:23:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJdvkTTJk+AUHTv+SJXmJv5YBSjkEE6GJ3NrLHWN5EwKhs9o4R3xEC3XME339IuM0Q+Up5e50VN2Zc2/Zj/BdF5DhBjcQssU+RkX59g7Z2oR0lHrAs5EL7XhcFddtkww93R98A47Q8hYbyBY4TFieYPzXsNHtb+xJ1ca7htsTsJKzYRgvzYxjgRcLCdSyLRIYzDXakUmdVe09hbVTLARZNPn4zQE/4Zt3WWwsr15mtG40sLk50/UAMh0vf/Flp6A3tVQdYFZyyK6SO1a34h9k85LrgcXB5iKSGi7PZOm+p4VdKSC1GUybUFhnPOjfdUMR+1hll2egiSnNElWMaN7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY4G4M8QTTcCTu/5KMbW8BSCWDpoABobgoE4sdkLTIw=;
 b=eYbjiwkYASj4izCcquz/ond7cNB12CCIbqdenUlz2ttrTPGkuyVltP0epsGdOE8oasEX4cUinYjSNiBkka3/8A9ovHh8ZPnrINv1Wslll5sTXLNn/i43F+ECCA99nWVUtVvfRH97kAdOGm+X3B6hvAeoQna2qo+VMYgG380CA9oVstMKFFEcm5JDLPvJJI/jEDM02+3+fR3476U6OJNqrxTHt68McQyG0OcnHPMYMC1tbCczaNpcqMAe1P4v96qXsay8XvzSzbGsXObSVOANGjc4RAFlWmwXemXMtxyh3qqtZl/cplzKWXth5YGb4cAyUF8y0cMhqMf/G6shIMpPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY4G4M8QTTcCTu/5KMbW8BSCWDpoABobgoE4sdkLTIw=;
 b=nnE7ci27nax07zSmhJ9DhEgFZ83vanxETRrbD3Ux87v8vrsUBKH6MSYcmNfY5F+AD6xB5z2Pf23hRPO/e+n2WA5K2J/4IJ32RSX1uMYt+B4Xl++/DuPyfCj0pYxQYFQ/gZZvtNIFZJtxkgyQliGn3NseDClhDCQhb/jcym4U1So=
Authentication-Results: lists.linux-foundation.org; dkim=none (message not
 signed) header.d=none;lists.linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB2796.namprd12.prod.outlook.com (2603:10b6:5:50::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.19; Fri, 23 Apr 2021 05:23:25 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4065.023; Fri, 23 Apr
 2021 05:23:25 +0000
Subject: Re: [PATCH 7/7] swiotlb: don't override the command line in
 swiotlb_adjust_size
To: Christoph Hellwig <hch@lst.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20210422071921.1428607-1-hch@lst.de>
 <20210422071921.1428607-8-hch@lst.de>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <5df0f10e-4c70-6554-6cb8-10ea3acde92b@amd.com>
Date: Fri, 23 Apr 2021 00:23:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210422071921.1428607-8-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN4PR0201CA0016.namprd02.prod.outlook.com
 (2603:10b6:803:2b::26) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN4PR0201CA0016.namprd02.prod.outlook.com (2603:10b6:803:2b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 05:23:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9580de32-2a97-4345-a99f-08d90617eb6a
X-MS-TrafficTypeDiagnostic: DM6PR12MB2796:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27964A541A6E4DF9FC753A39EC459@DM6PR12MB2796.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bf/52Jsd8+fIuaD8hODKcjIlZ35D/mOa5AN0kL0R+btQvaRgBKlBwkKcKZTZ509cPE6g0nO5Chra7vjW/7Vl0jOK909ydqOEM+Od90Qo4O3+8/SF3eR6SxW6IH70VfGH8Ukvr30UQ+SLHGHg/zZsPKzqSgwvMw6dRyAKtmjIFeoUybiY5+vIjZJKX/TEi3gPi68GeQXKkqdvCXauFl5ix1d5BmLjmSPIQDpYtmjE4tkmdIWiaNjYOgEIcZPWjskKfE//Hkh8WviiesFDE7Xwt3iKhv8ktKuIyiJBz0EUo8mihZvSPUWgwF1F+NhRFRIMEh/hHGY+95FqdIKYCHfZNn6VLZ5b3G9tk2ovVVx8UdZDvMa1FlRneI6VlY9/mbZIhDpv1Yr4GYFXXvDJTLnidPeOVy+sxHWJspBL6/5Wxa4zYELbzyS3w5jOU9WMOqjWoFX3lliBcxcnI2/tbBwX53m82ShrH8aO/TjEvL7LnOKtVjGA+yzhB3dCZMeV+MPQ6Yzm7mTXh1rxPnIXqgY/PSWy4UG3/MRZ9WsqJ4UToziLQQWTN6dtoSM7Si8rCN7ZDm9EiIEoraUKZJN4IEMo+Ma98xifrRdlkNxKVbI8NuD9ul8hnTeeIcwzQRY1AyuhB4BLgip92cqtE7iEhFDuT+dgZiQYsJLHEiI7zHADmdx1RQgIBCqE8f8OotnrijR5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(2616005)(6506007)(316002)(38100700002)(16526019)(86362001)(66476007)(36756003)(8676002)(186003)(53546011)(5660300002)(83380400001)(31696002)(2906002)(66946007)(66556008)(8936002)(54906003)(31686004)(4326008)(26005)(956004)(7416002)(110136005)(6486002)(478600001)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDg4MVM4Wm1oNldrYWlmSUF1VnU2YUw2T1UyNnp3cDVnNjdOTW5UZVJuZ0l6?=
 =?utf-8?B?NFZrM2JRSnBSTG5nckZ2NFJhY2RJWFFRblREbUEyeGFiMEk3dXRnSkM2Z09V?=
 =?utf-8?B?VExScmo0VDQyODVYVFd3clR1dGpsVzdIT3FmclJ5eHFwNE8rZXdXWVVUQzdu?=
 =?utf-8?B?TEFIRzRRbDFKNlpzdWVpQVZYelpJa1lKK2IrV0hTLzJMbFBUeHVPT3BHaGJr?=
 =?utf-8?B?M3ZtdU8zdjdnZCtHQXAxRjArS3B6QnBRemtTWEQ2L0g0czFLdExsYVZyNUVB?=
 =?utf-8?B?VExkTWlha3lMS3BxaHMvaHNxc1BhYWM4TXVNaFdWS1lML2J3NGZ1aWFDeVc3?=
 =?utf-8?B?L1FZcytVN3FWVVYxUkxuaFV0OXc2Q3QzbjlBS296d2oxalVOV1l4VzVKQUlU?=
 =?utf-8?B?cG5DRzc5UnEzUVlJaVp3M0hRbEtsbEhLdVRwRzdPNEhsQmR2ZVVvYXA0MGlp?=
 =?utf-8?B?UGk4dTBtRjdpbXZvR040dXVFWjlGbUNSS255WlA1dGtpYVc5ZkhZU1I4K0lJ?=
 =?utf-8?B?c0lGc01rV3pZclorS2ZiUmFKTHZLaU1WLzhZQmpNWVBSbXZFY2J3ZThMQmRo?=
 =?utf-8?B?YjN2cngrcVF6aDkzUit4ZDBQWDREeklwVGwxSDM3UlhKeUJCK3JyUTRQZ1pk?=
 =?utf-8?B?eE83akcxUnVOem9EVFAxWWZDQ2hZZVc1L25LOVRNZ3MyMHBEOHBoc2tFTjVW?=
 =?utf-8?B?U0RGVDdEOCswTElDK05yVHlhdnVKcW5MemMzSUJQZkxQT3F3ZEY3eDkzVmtw?=
 =?utf-8?B?YkRqbXdtK1lSdGtIaDA1TnFPZ1lzOVR6VG5JYWxOeDJuQnYrKzFVVGlHS3lF?=
 =?utf-8?B?S3NHcytWWTlYYXlpeVIxd29iSHMweW5pemhCek44c2tUc0VMWFpnRFFTS3FE?=
 =?utf-8?B?VzIwK3VNTWxmZ3N0QUpWWWIweTl1c05UWjJZMVIvbWJyQ0cvcTZqeXpEeERH?=
 =?utf-8?B?YVlvUDZwblU1VHBEdGd0UlphT0xCRFM1SFR3aUFzVHJzcS9BVjdObTh5R0NK?=
 =?utf-8?B?aUJ6TVgzQ3ZpS3V5WFBPY0F5VXhYSk9VbVRDT3cyOUJOZXlRRGprMDNKRVUr?=
 =?utf-8?B?SFk1dDlObi83VFhxbDU4NURhbEpQNDY2R0J0bmFMN1QreXNXV011bDAxbmFB?=
 =?utf-8?B?UEtpNWhURGluUHA2eEJiUEM5YTR4WjRCeUxGVlNLYnJzMzhUQStDVk4rTUtE?=
 =?utf-8?B?T1hFMzVVdXY5VGJnNWhHWm4vSWhTZEZxcEp2VHM4TURwWTMvVG1WNjRudWJz?=
 =?utf-8?B?dmxJSW4zbVVDaXR0RE9LQVhKcEFqWlowTFEyODgxODRRcmtSbWtqYXluSEJq?=
 =?utf-8?B?MWtZWnFPT2w3SGtNZnJzT0JySFNMU0RkcFg0emtzbnhmSk80OHpUdk9uRVpr?=
 =?utf-8?B?dEpvbWx2cjl3bllxcFBtczBDc2lwV1B3ZnlvemsxR2lmRHpvY2t0ZHBwckJ2?=
 =?utf-8?B?NERvMFVRSHgvVjRzT0ZuS0F3Q29tbC9LMUpLMWxia3lMeU5SdWlIVzJCZFZB?=
 =?utf-8?B?VytzTzZJazlrenNjYVBkZ3BrMGtMckp2NDJiOEFSRnZPRDFhcU9WVWJuYkFm?=
 =?utf-8?B?dTY5Y1FhTVM1SUVXUHNBaUxYVjVsSWtaNDdhL3kzR2ljQnVQVDNBYjlDNG1q?=
 =?utf-8?B?eFUvblVuV2dKc25NSm1GbmIyc0hVUVUxS0VWb0hNY3NNa3pXdjRYemwrdHFa?=
 =?utf-8?B?OGdNSTN3UHAzeEZobm13Rkdia25vWWVxMjF5MTNheTIyeVVBNmJkWXRoUDhM?=
 =?utf-8?Q?lIpBtONcmB8FHK55uAD/HHLKYuPZOe9K6ylXBhC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9580de32-2a97-4345-a99f-08d90617eb6a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 05:23:25.6554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKhf6JG5RsavOCQixlYfMrOKmHaxxw8ROenFmKCOT5gI1AVR++Eg3ftKamtjIrBKqDmSnUxMcgxqX4xvgkHsxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2796
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
Cc: Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/22/21 2:19 AM, Christoph Hellwig wrote:
> When the user specified an explicit swiotlb size on the command line,
> the achitecture code should not override it.
> 
> Fixes: 2cbc2776efe4 ("swiotlb: remove swiotlb_nr_tbl")
> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I tested this patchset and I'm not able to get the override via the
command line or via the SEV adjustment function. Looking at the code,
swiotlb_default_size is initialized, so the call to swiotlb_adjust_size()
always returns without setting the new size.

Thanks,
Tom

> ---
>  kernel/dma/swiotlb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 87d06ddf4753f3..aef02a3825b494 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -106,7 +106,9 @@ void swiotlb_set_max_segment(unsigned int val)
>  
>  unsigned long swiotlb_size_or_default(void)
>  {
> -	return swiotlb_default_size;
> +	if (swiotlb_default_size)
> +		return swiotlb_default_size;
> +	return IO_TLB_DEFAULT_SIZE;
>  }
>  
>  void __init swiotlb_adjust_size(unsigned long size)
> @@ -116,6 +118,8 @@ void __init swiotlb_adjust_size(unsigned long size)
>  	 * architectures such as those supporting memory encryption to
>  	 * adjust/expand SWIOTLB size for their use.
>  	 */
> +	if (swiotlb_default_size)
> +		return;
>  	swiotlb_default_size = ALIGN(size, IO_TLB_SEGSIZE << IO_TLB_SHIFT);
>  	pr_info("SWIOTLB bounce buffer size adjusted to %luMB",
>  		swiotlb_default_size >> 20);
> 
