Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2112D10214D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 10:56:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HLnV6FghzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 20:56:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=virtuozzo.com (client-ip=185.231.240.75; helo=relay.sw.ru;
 envelope-from=aryabinin@virtuozzo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=virtuozzo.com
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HLlN2hMZzDqZS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 20:54:37 +1100 (AEDT)
Received: from dhcp-172-16-25-5.sw.ru ([172.16.25.5])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <aryabinin@virtuozzo.com>)
 id 1iX0DD-0002dW-Cu; Tue, 19 Nov 2019 12:54:19 +0300
Subject: Re: [PATCH v11 1/4] kasan: support backing vmalloc space with real
 shadow memory
To: Daniel Axtens <dja@axtens.net>, Qian Cai <cai@lca.pw>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 glider@google.com, luto@kernel.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, dvyukov@google.com, christophe.leroy@c-s.fr
References: <20191031093909.9228-1-dja@axtens.net>
 <20191031093909.9228-2-dja@axtens.net> <1573835765.5937.130.camel@lca.pw>
 <871ru5hnfh.fsf@dja-thinkpad.axtens.net>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <952ec26a-9492-6f71-bab1-c1def887e528@virtuozzo.com>
Date: Tue, 19 Nov 2019 12:54:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <871ru5hnfh.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/18/19 6:29 AM, Daniel Axtens wrote:
> Qian Cai <cai@lca.pw> writes:
> 
>> On Thu, 2019-10-31 at 20:39 +1100, Daniel Axtens wrote:
>>>  	/*
>>>  	 * In this function, newly allocated vm_struct has VM_UNINITIALIZED
>>>  	 * flag. It means that vm_struct is not fully initialized.
>>> @@ -3377,6 +3411,9 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>>>  
>>>  		setup_vmalloc_vm_locked(vms[area], vas[area], VM_ALLOC,
>>>  				 pcpu_get_vm_areas);
>>> +
>>> +		/* assume success here */
>>> +		kasan_populate_vmalloc(sizes[area], vms[area]);
>>>  	}
>>>  	spin_unlock(&vmap_area_lock);
>>
>> Here it is all wrong. GFP_KERNEL with in_atomic().
> 
> I think this fix will work, I will do a v12 with it included.
 
You can send just the fix. Andrew will fold it into the original patch before sending it to Linus.



> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a4b950a02d0b..bf030516258c 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3417,11 +3417,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>  
>                 setup_vmalloc_vm_locked(vms[area], vas[area], VM_ALLOC,
>                                  pcpu_get_vm_areas);
> +       }
> +       spin_unlock(&vmap_area_lock);
>  
> +       /* populate the shadow space outside of the lock */
> +       for (area = 0; area < nr_vms; area++) {
>                 /* assume success here */
>                 kasan_populate_vmalloc(sizes[area], vms[area]);
>         }
> -       spin_unlock(&vmap_area_lock);
>  
>         kfree(vas);
>         return vms;
> 
> 
