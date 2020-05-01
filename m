Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A91C0ECF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 09:25:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49D3gb0NPSzDrQJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 17:25:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam12-dm6-obe.outbound.protection.outlook.com
 (client-ip=40.107.243.40; helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=christian.koenig@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=ikYYZhIz; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49D3f062NCzDrPX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 17:24:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhHyX0AZyiHPCXk9R3pmj/uiae8fe/Bn13mWY5sH4+fY3pGYX6yapW/A6pk6YaLF3NvCqE6YLHMNPtwkrDmE0NNeD7o9fBZmucPJVNMbDmoYz+QUpew7LxHEJ+CoXXGFNPzxzNztPplCbH/bQd8Et13/b11JAClMQcWeC6/1rmPuyMMAhun7DEXlj/q/uA6zcX4B2xFxpl8CnY9i4czevO7H4Qso8ZvMTp46OttmnEZCNWv/BOm2fhw6YdbdSjrUzgUb1U+XRMGRdAUww1mqduoyPHrdSy3FRkkKDigSJwmxdB+lKpTjFUIFEHGfc30vIo8HvMgkoqPBM5CQkxbL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B93eGUqhSJcb/TxU5eKTKZDpn/uaqVQIktI/i8Ka48s=;
 b=S54E3edlcgZzLqlAaZ5grBsK5DIsVZzYnKju7MAZQJH9Stn0KVI9Drxk4Jn1sMgJpkPITqMSnIBzrjniaAEck6bJ0scUP7b/L1CkZXT7QQhTd5FUWTZd8pxYjIApXCVfAMSfh5RKLiQAuokENaQ1iguQOK5r183g/4T3EzRkZfb+ARR686eJUbjNkq77Hy6PQD99Ighymwe1ZDu3wEyrKRBspmYC71CwAfS6sJ0GMClZ2zPn7479uDyFgrHmQV2oR7conbhUjGs/RcD5RLWQoALXh3jw31b7+bfAdCW1AOxQmAgCB0JMzgpkfA+qpjnINCEmzZLo4k3Prnbtp2Pw7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B93eGUqhSJcb/TxU5eKTKZDpn/uaqVQIktI/i8Ka48s=;
 b=ikYYZhIzk+9S/WSt07t8RL5R4j/H1MIZm+1jm94s0mfSnIjHtm13v+YHONwsYXB9XCVOp3uJBTIYflx09go0NpBJ/0mMGPKYexFWj+jrus93UkIObwrDvGGz3+heFSQImEA1xPCer8cEuxUE0mMYP4WAK5vsZ3+YYNiPf0rgq88=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3979.namprd12.prod.outlook.com (2603:10b6:5:1cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Fri, 1 May
 2020 07:24:00 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2958.027; Fri, 1 May 2020
 07:24:00 +0000
Subject: Re: [PATCH V1 10/10] drm: Remove drm specific kmap_atomic code
To: ira.weiny@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Huang Rui <ray.huang@amd.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-11-ira.weiny@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d6d5ab74-5e16-6541-391b-63d993041fb8@amd.com>
Date: Fri, 1 May 2020 09:23:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200430203845.582900-11-ira.weiny@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0117.eurprd05.prod.outlook.com
 (2603:10a6:207:2::19) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0117.eurprd05.prod.outlook.com (2603:10a6:207:2::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 07:23:55 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 92219675-5dce-4296-ab40-08d7eda09de0
X-MS-TrafficTypeDiagnostic: DM6PR12MB3979:|DM6PR12MB3979:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3979C9274DEE4DD89C8BCFCF83AB0@DM6PR12MB3979.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0390DB4BDA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(6486002)(5660300002)(66556008)(66946007)(66476007)(478600001)(31696002)(52116002)(4326008)(2616005)(2906002)(36756003)(66574012)(31686004)(186003)(16526019)(7416002)(86362001)(110136005)(54906003)(81156014)(6666004)(8936002)(316002)(8676002)(6636002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lBe402xQIA3Sdt0kEjozEhDG8lvZE+9DoixgZPvN8Ddlhlb8SkD8mW4V/5HqCT+RJYE++a5SAg2wFIrGvGZdfb/11Pk+rLGXoN3/tHrcyIqAISSu6ICWYeMiQe6Xju/CSKmvlFRNTX7AQKZ5sHliIiNaXvSoAXhpFxVf2wz8SSSbC8Cn0a5Xf1WOQyQU+0EjrxIsxT+3Px4gRH2E4KSkKa5xYlJwoTPyiwNYzK5rbI0PjCXhXh22ChkGi6OqgRrjq3nEJS8Wjpc2kaOshY0i+ClRd+LTOFC9vVNOBiT5YUke6dSD/Qeq4F7xA4zVhwx4u7ZoEu0qn8IhjXFTfZPSxy+YshbpmK0gT7Fc6OmV2zBDC5oMu2xaUT7j/gXmD7/0jDD48PrkHIzuer7AXoWcPTbr0r99jSxBQ/RzVlOCo42cyaDoF6uP2UaOL5ABNzlL
X-MS-Exchange-AntiSpam-MessageData: R3DgwwF4U3pMWJRispIyksz600hlqqHayTAcc4rm2kkJMfHN54InhC1wGF/hgyJRIa8uw1qi2SbwWUKq8cet2/iYcZaxN8Rp5H5O29mlAsHrZ8dVzYWUw53pKYso0kvIAj01tpB5AtK8pHmxfI8wRtyymZUAUNtGrNHQKqcBTMc44LyJ2vnBsBnQX80YR+gKPydsbqrGnvoDZuYRGwWARMN7eD1Q7Ra9MPA/3iCIkIO30cfMTpcTU4iiDF2PeAYTWLp4C4CVsAGfAi60NCWttQcZolUZ7W6byloU1M1MUyJKwmeFBa44MkMa4R3OzKfOPOUxOholQeW0govsqipsq0VJyp54/Mni3LYnTNPVjnTOD7+WCmszuNglSU9gcoJEcjrI5nzUvk57Xgp2xujnR6meHC+TqGPxCgoXJqSrbPMJqK0JZzKswudhVp5VldWHS2qyd7/N/Zjt9ClDsk7ecbekgWv6qEcXBu+wVDyPh6f+kRlGu8woHgjmi1E25YdiTnkGnugXEs9af7vGPKj/Lj3EDiZG5qwRFH0DpuhOlf9ZIR5Q5dYDR32DozgXRbB998RU5tgag7WKPdmCv0H6P4iQs1A1Hcie8knszzNyf+Wo8AXZiAdNHP63J+C0fKAojNw1qQLquwPeWjnjWsRU5Nyc6MukzzzGoDW7zSROXiSTSdw5qnpQ0nNMwwTXQQ87H9xS0mNZOOticwjjrXNG8ZHCV3zrvZYX4zxcatwZBKYoFzoIaHgGj98P2iucfmV+8isJWJhFyhDN1xdMuc2/Jbux+x6U4UzoqyiD+SiBx747a7AdtTG7xN3FwDBxObQJDA8eJjH264VNE0hbimcm8UY3HeVTGP9IwtNnIDl+FS8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92219675-5dce-4296-ab40-08d7eda09de0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 07:23:59.9315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNdqnq5OanoMQf72+pz+Mg2CMDNf35w+fJuhxCPMSXYrivFeeNc8859SavFAjLI+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3979
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 30.04.20 um 22:38 schrieb ira.weiny@intel.com:
> From: Ira Weiny <ira.weiny@intel.com>
>
> kmap_atomic_prot() is now exported by all architectures.  Use this
> function rather than open coding a driver specific kmap_atomic.
>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Ah, yes looking into this once more this was on my TODO list for quite a 
while as well.

Patch is Reviewed-by: Christian König <christian.koenig@amd.com>, feel 
free to push it upstream through whatever channel you like or ping me if 
I should pick it up into drm-misc-next.

Regards,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c    | 56 ++--------------------------
>   drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 16 ++++----
>   include/drm/ttm/ttm_bo_api.h         |  4 --
>   3 files changed, 12 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 52d2b71f1588..f09b096ba4fd 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -257,54 +257,6 @@ static int ttm_copy_io_page(void *dst, void *src, unsigned long page)
>   	return 0;
>   }
>   
> -#ifdef CONFIG_X86
> -#define __ttm_kmap_atomic_prot(__page, __prot) kmap_atomic_prot(__page, __prot)
> -#define __ttm_kunmap_atomic(__addr) kunmap_atomic(__addr)
> -#else
> -#define __ttm_kmap_atomic_prot(__page, __prot) vmap(&__page, 1, 0,  __prot)
> -#define __ttm_kunmap_atomic(__addr) vunmap(__addr)
> -#endif
> -
> -
> -/**
> - * ttm_kmap_atomic_prot - Efficient kernel map of a single page with
> - * specified page protection.
> - *
> - * @page: The page to map.
> - * @prot: The page protection.
> - *
> - * This function maps a TTM page using the kmap_atomic api if available,
> - * otherwise falls back to vmap. The user must make sure that the
> - * specified page does not have an aliased mapping with a different caching
> - * policy unless the architecture explicitly allows it. Also mapping and
> - * unmapping using this api must be correctly nested. Unmapping should
> - * occur in the reverse order of mapping.
> - */
> -void *ttm_kmap_atomic_prot(struct page *page, pgprot_t prot)
> -{
> -	if (pgprot_val(prot) == pgprot_val(PAGE_KERNEL))
> -		return kmap_atomic(page);
> -	else
> -		return __ttm_kmap_atomic_prot(page, prot);
> -}
> -EXPORT_SYMBOL(ttm_kmap_atomic_prot);
> -
> -/**
> - * ttm_kunmap_atomic_prot - Unmap a page that was mapped using
> - * ttm_kmap_atomic_prot.
> - *
> - * @addr: The virtual address from the map.
> - * @prot: The page protection.
> - */
> -void ttm_kunmap_atomic_prot(void *addr, pgprot_t prot)
> -{
> -	if (pgprot_val(prot) == pgprot_val(PAGE_KERNEL))
> -		kunmap_atomic(addr);
> -	else
> -		__ttm_kunmap_atomic(addr);
> -}
> -EXPORT_SYMBOL(ttm_kunmap_atomic_prot);
> -
>   static int ttm_copy_io_ttm_page(struct ttm_tt *ttm, void *src,
>   				unsigned long page,
>   				pgprot_t prot)
> @@ -316,13 +268,13 @@ static int ttm_copy_io_ttm_page(struct ttm_tt *ttm, void *src,
>   		return -ENOMEM;
>   
>   	src = (void *)((unsigned long)src + (page << PAGE_SHIFT));
> -	dst = ttm_kmap_atomic_prot(d, prot);
> +	dst = kmap_atomic_prot(d, prot);
>   	if (!dst)
>   		return -ENOMEM;
>   
>   	memcpy_fromio(dst, src, PAGE_SIZE);
>   
> -	ttm_kunmap_atomic_prot(dst, prot);
> +	kunmap_atomic(dst);
>   
>   	return 0;
>   }
> @@ -338,13 +290,13 @@ static int ttm_copy_ttm_io_page(struct ttm_tt *ttm, void *dst,
>   		return -ENOMEM;
>   
>   	dst = (void *)((unsigned long)dst + (page << PAGE_SHIFT));
> -	src = ttm_kmap_atomic_prot(s, prot);
> +	src = kmap_atomic_prot(s, prot);
>   	if (!src)
>   		return -ENOMEM;
>   
>   	memcpy_toio(dst, src, PAGE_SIZE);
>   
> -	ttm_kunmap_atomic_prot(src, prot);
> +	kunmap_atomic(src);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> index bb46ca0c458f..94d456a1d1a9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -374,12 +374,12 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_line_data *d,
>   		copy_size = min_t(u32, copy_size, PAGE_SIZE - src_page_offset);
>   
>   		if (unmap_src) {
> -			ttm_kunmap_atomic_prot(d->src_addr, d->src_prot);
> +			kunmap_atomic(d->src_addr);
>   			d->src_addr = NULL;
>   		}
>   
>   		if (unmap_dst) {
> -			ttm_kunmap_atomic_prot(d->dst_addr, d->dst_prot);
> +			kunmap_atomic(d->dst_addr);
>   			d->dst_addr = NULL;
>   		}
>   
> @@ -388,8 +388,8 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_line_data *d,
>   				return -EINVAL;
>   
>   			d->dst_addr =
> -				ttm_kmap_atomic_prot(d->dst_pages[dst_page],
> -						     d->dst_prot);
> +				kmap_atomic_prot(d->dst_pages[dst_page],
> +						 d->dst_prot);
>   			if (!d->dst_addr)
>   				return -ENOMEM;
>   
> @@ -401,8 +401,8 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_line_data *d,
>   				return -EINVAL;
>   
>   			d->src_addr =
> -				ttm_kmap_atomic_prot(d->src_pages[src_page],
> -						     d->src_prot);
> +				kmap_atomic_prot(d->src_pages[src_page],
> +						 d->src_prot);
>   			if (!d->src_addr)
>   				return -ENOMEM;
>   
> @@ -499,9 +499,9 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
>   	}
>   out:
>   	if (d.src_addr)
> -		ttm_kunmap_atomic_prot(d.src_addr, d.src_prot);
> +		kunmap_atomic(d.src_addr);
>   	if (d.dst_addr)
> -		ttm_kunmap_atomic_prot(d.dst_addr, d.dst_prot);
> +		kunmap_atomic(d.dst_addr);
>   
>   	return ret;
>   }
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 0a9d042e075a..de1ccdcd5703 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -668,10 +668,6 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
>   int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
>   		struct ttm_bo_device *bdev);
>   
> -void *ttm_kmap_atomic_prot(struct page *page, pgprot_t prot);
> -
> -void ttm_kunmap_atomic_prot(void *addr, pgprot_t prot);
> -
>   /**
>    * ttm_bo_io
>    *

