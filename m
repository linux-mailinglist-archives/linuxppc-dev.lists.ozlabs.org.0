Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC22E2A65
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Dec 2020 09:19:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D2KcB3WqYzDqMK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Dec 2020 19:19:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=dingtianhong@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D2KZb2K1gzDqM6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Dec 2020 19:18:10 +1100 (AEDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D2K6y53PWz15hnb;
 Fri, 25 Dec 2020 15:57:46 +0800 (CST)
Received: from [10.174.177.80] (10.174.177.80) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Fri, 25 Dec 2020 15:58:22 +0800
Subject: Re: [PATCH v9 11/12] mm/vmalloc: Hugepage vmalloc mappings
To: Nicholas Piggin <npiggin@gmail.com>, <linux-mm@kvack.org>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20201205065725.1286370-1-npiggin@gmail.com>
 <20201205065725.1286370-12-npiggin@gmail.com>
From: Ding Tianhong <dingtianhong@huawei.com>
Message-ID: <7db7564c-0600-33d9-68d9-61fa6fc1bc0d@huawei.com>
Date: Fri, 25 Dec 2020 15:58:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201205065725.1286370-12-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.80]
X-CFilter-Loop: Reflected
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Zefan Li <lizefan@huawei.com>, Jonathan
 Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> +again:
> +	size = PAGE_ALIGN(size);
> +	area = __get_vm_area_node(size, align, VM_ALLOC | VM_UNINITIALIZED |
>  				vm_flags, start, end, node, gfp_mask, caller);
>  	if (!area)
>  		goto fail;
>  
> -	addr = __vmalloc_area_node(area, gfp_mask, prot, node);
> +	addr = __vmalloc_area_node(area, gfp_mask, prot, shift, node);
>  	if (!addr)
> -		return NULL;
> +		goto fail;
>  
>  	/*
>  	 * In this function, newly allocated vm_struct has VM_UNINITIALIZED
> @@ -2788,8 +2878,19 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
>  	return addr;
>  
>  fail:
> -	warn_alloc(gfp_mask, NULL,
> +	if (shift > PAGE_SHIFT) {
> +		free_vm_area(area);
> +		shift = PAGE_SHIFT;
> +		align = real_align;
> +		size = real_size;
> +		goto again;
> +	}
> +
Hi, Nicholas:

I met a problem like this:

[   67.103584] ------------[ cut here ]------------
[   67.103884] kernel BUG at vmalloc.c:2892!
[   67.104387] Internal error: Oops - BUG: 0 [#1] SMP
[   67.104942] Process insmod (pid: 1161, stack limit = 0x(____ptrval____))
[   67.105356] CPU: 2 PID: 1161 Comm: insmod Tainted: G           O      4.19.95+ #9
[   67.105702] Hardware name: linux,dummy-virt (DT)
[   67.106006] pstate: a0000005 (NzCv daif -PAN -UAO)
[   67.106285] pc : free_vm_area+0x78/0x80
[   67.106549] lr : free_vm_area+0x58/0x80

it looks like when __vmalloc_area_node failed, the area is already released, and the free_vm_area
will release the vm area again, so trigger the problem.

3405         ret = remove_vm_area(area->addr);
3406         BUG_ON(ret != area);
3407         kfree(area);


Ding
> +	if (!area) {
> +		/* Warn for area allocation, page allocations already warn */
> +		warn_alloc(gfp_mask, NULL,
>  			  "vmalloc: allocation failure: %lu bytes", real_size);
> +	}
>  	return NULL;
>  }
>  
> 

