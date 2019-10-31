Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6A0EBB4C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 00:56:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4742Jt4Sc7zF6Qp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 10:55:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="Fl9ftqk4"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47426M2HFHzF4QR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 10:46:50 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbb726c0000>; Thu, 31 Oct 2019 16:46:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 31 Oct 2019 16:46:46 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 31 Oct 2019 16:46:46 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 31 Oct
 2019 23:46:45 +0000
Subject: Re: [PATCH 08/19] mm/process_vm_access: set FOLL_PIN via
 pin_user_pages_remote()
To: Ira Weiny <ira.weiny@intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-9-jhubbard@nvidia.com>
 <20191031233519.GH14771@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <7e79d9b5-772e-3628-4a60-65efc2f490c5@nvidia.com>
Date: Thu, 31 Oct 2019 16:46:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191031233519.GH14771@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1572565613; bh=Ni3MG24cn6KOx2mpKQf1IX0uBXAOxI/S5ACFQstwCH0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Fl9ftqk4J63wpZ0nmIiycLWCL11bYX50L+387BZ180hQh//V0Vp2ib5lF+gUyjqai
 BUNKoNlXTqc57g1YISa4wLoDF8FDUSOEDk//A2D/giSdADgbBgvBgvcIBixm1N1+Zk
 H8cgPXG2CeU33ioP0ErDWx6EuJtDE7b8cwg7DR730s9O71+39F8ouq+P6zklOCkkR4
 oDUx19ikJNj9J8uGqwUijC3VwpTpRuFvJG1fW6Ohvn+piDj3I1HEee28haJHWEOnTW
 Uwhe+F8yMyQV4WRYSdi28gKVURtaIyz8Dwtt8DEOye19K0wcNBp+Nz8BepqnA7FG/T
 4uFqHk6o1ZuLQ==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/31/19 4:35 PM, Ira Weiny wrote:
> On Wed, Oct 30, 2019 at 03:49:19PM -0700, John Hubbard wrote:
>> Convert process_vm_access to use the new pin_user_pages_remote()
>> call, which sets FOLL_PIN. Setting FOLL_PIN is now required for
>> code that requires tracking of pinned pages.
>>
>> Also, release the pages via put_user_page*().
>>
>> Also, rename "pages" to "pinned_pages", as this makes for
>> easier reading of process_vm_rw_single_vec().
> 
> Ok...  but it made review a bit harder...
> 

Yes, sorry about that. After dealing with "pages means struct page *[]"
for all this time, having an "int pages" just was a step too far for
me here. :)

Thanks for working through it. 


thanks,

John Hubbard
NVIDIA



> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> 


>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  mm/process_vm_access.c | 28 +++++++++++++++-------------
>>  1 file changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
>> index 357aa7bef6c0..fd20ab675b85 100644
>> --- a/mm/process_vm_access.c
>> +++ b/mm/process_vm_access.c
>> @@ -42,12 +42,11 @@ static int process_vm_rw_pages(struct page **pages,
>>  		if (copy > len)
>>  			copy = len;
>>  
>> -		if (vm_write) {
>> +		if (vm_write)
>>  			copied = copy_page_from_iter(page, offset, copy, iter);
>> -			set_page_dirty_lock(page);
>> -		} else {
>> +		else
>>  			copied = copy_page_to_iter(page, offset, copy, iter);
>> -		}
>> +
>>  		len -= copied;
>>  		if (copied < copy && iov_iter_count(iter))
>>  			return -EFAULT;
>> @@ -96,7 +95,7 @@ static int process_vm_rw_single_vec(unsigned long addr,
>>  		flags |= FOLL_WRITE;
>>  
>>  	while (!rc && nr_pages && iov_iter_count(iter)) {
>> -		int pages = min(nr_pages, max_pages_per_loop);
>> +		int pinned_pages = min(nr_pages, max_pages_per_loop);
>>  		int locked = 1;
>>  		size_t bytes;
>>  
>> @@ -106,14 +105,15 @@ static int process_vm_rw_single_vec(unsigned long addr,
>>  		 * current/current->mm
>>  		 */
>>  		down_read(&mm->mmap_sem);
>> -		pages = get_user_pages_remote(task, mm, pa, pages, flags,
>> -					      process_pages, NULL, &locked);
>> +		pinned_pages = pin_user_pages_remote(task, mm, pa, pinned_pages,
>> +						     flags, process_pages,
>> +						     NULL, &locked);
>>  		if (locked)
>>  			up_read(&mm->mmap_sem);
>> -		if (pages <= 0)
>> +		if (pinned_pages <= 0)
>>  			return -EFAULT;
>>  
>> -		bytes = pages * PAGE_SIZE - start_offset;
>> +		bytes = pinned_pages * PAGE_SIZE - start_offset;
>>  		if (bytes > len)
>>  			bytes = len;
>>  
>> @@ -122,10 +122,12 @@ static int process_vm_rw_single_vec(unsigned long addr,
>>  					 vm_write);
>>  		len -= bytes;
>>  		start_offset = 0;
>> -		nr_pages -= pages;
>> -		pa += pages * PAGE_SIZE;
>> -		while (pages)
>> -			put_page(process_pages[--pages]);
>> +		nr_pages -= pinned_pages;
>> +		pa += pinned_pages * PAGE_SIZE;
>> +
>> +		/* If vm_write is set, the pages need to be made dirty: */
>> +		put_user_pages_dirty_lock(process_pages, pinned_pages,
>> +					  vm_write);
>>  	}
>>  
>>  	return rc;
>> -- 
>> 2.23.0
>>
