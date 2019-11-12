Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E64F9BE0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 22:17:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CLD80HBpzF5kH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 08:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="M+zD7DiT"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CL9g3QS8zF5TN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 08:15:02 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb20d50000>; Tue, 12 Nov 2019 13:15:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 13:14:58 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 13:14:58 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 21:14:57 +0000
Subject: Re: [PATCH v3 11/23] IB/{core,hw,umem}: set FOLL_PIN, FOLL_LONGTERM
 via pin_longterm_pages*()
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-12-jhubbard@nvidia.com>
 <20191112204449.GF5584@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <3513d317-8e29-006f-1624-e9aa94ce9ad5@nvidia.com>
Date: Tue, 12 Nov 2019 13:14:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191112204449.GF5584@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573593301; bh=IA5cc3Ug8y/Soy37I3lcgnCK4KJuS9HA5F969hpkGDk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=M+zD7DiTvJEHWyZUscBaWsNyvdd7nW2Z8MINjy6zlNtzbk8yDqUSKZUYoDkjLfsT1
 jhJdgaW8sOVEVYkkTrDIJJa4fwOit67TvUa2zybzBPmS46CYVBpq/47LCJQvGX/3++
 kN6TX/8r3rAiSK8yfXz19Ap8X1CeF0WYNvVBYngtzVePIwXr6m7SCdxfr4dOboh5Y+
 2hlHGc9hiYvLqwfEFqtP6wQ0eViLmw5Mlq+PhJcVMOubS+xNo9DKWwkDLrS4gEKUIZ
 bPZcwVTnmn5+kG5LhprB02X6C6BdeIO1M4uKbavcouV5mwBgzW09isv1UnQ87weLii
 Kt8d5q/apbk1g==
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
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
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


On 11/12/19 12:44 PM, Jason Gunthorpe wrote:
> On Mon, Nov 11, 2019 at 04:06:48PM -0800, John Hubbard wrote:
>> @@ -542,7 +541,7 @@ static int ib_umem_odp_map_dma_single_page(
>>  	}
>>  
>>  out:
>> -	put_user_page(page);
>> +	put_page(page);
>>  
>>  	if (remove_existing_mapping) {
>>  		ib_umem_notifier_start_account(umem_odp);
>> @@ -639,13 +638,14 @@ int ib_umem_odp_map_dma_pages(struct ib_umem_odp *umem_odp, u64 user_virt,
>>  		/*
>>  		 * Note: this might result in redundent page getting. We can
>>  		 * avoid this by checking dma_list to be 0 before calling
>> -		 * get_user_pages. However, this make the code much more
>> -		 * complex (and doesn't gain us much performance in most use
>> -		 * cases).
>> +		 * get_user_pages. However, this makes the code much
>> +		 * more complex (and doesn't gain us much performance in most
>> +		 * use cases).
>>  		 */
>>  		npages = get_user_pages_remote(owning_process, owning_mm,
>> -				user_virt, gup_num_pages,
>> -				flags, local_page_list, NULL, NULL);
>> +					       user_virt, gup_num_pages,
>> +					       flags, local_page_list, NULL,
>> +					       NULL);
>>  		up_read(&owning_mm->mmap_sem);
> 
> This is just whitespace churn? Drop it..
> 


Whoops, yes. It got there because of going through the pin*() conversion
and then a revert, and now it's just whitespace. I'll drop it, thanks for
catching that.


thanks,

John Hubbard
NVIDIA
