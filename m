Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D00BC1E0452
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 03:08:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Vf9Z4y50zDqTM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 11:08:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65;
 helo=hqnvemgate26.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=jyLqZWcs; dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Vf7p5jKjzDqP9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 11:07:02 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ecb1a230001>; Sun, 24 May 2020 18:06:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 24 May 2020 18:06:56 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 24 May 2020 18:06:56 -0700
Received: from [10.2.58.199] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 May
 2020 01:06:55 +0000
Subject: Re: [linux-next RFC v2] mm/gup.c: Convert to use
 get_user_{page|pages}_fast_only()
To: Souptick Joarder <jrdr.linux@gmail.com>, <paulus@ozlabs.org>,
 <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
 <akpm@linux-foundation.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <acme@kernel.org>, <mark.rutland@arm.com>,
 <alexander.shishkin@linux.intel.com>, <jolsa@redhat.com>,
 <namhyung@kernel.org>, <pbonzini@redhat.com>, <sfr@canb.auug.org.au>,
 <rppt@linux.ibm.com>, <aneesh.kumar@linux.ibm.com>, <msuchanek@suse.de>
References: <1590294434-19125-1-git-send-email-jrdr.linux@gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <c70dc7fa-352d-9f61-abb9-d578072978c9@nvidia.com>
Date: Sun, 24 May 2020 18:06:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590294434-19125-1-git-send-email-jrdr.linux@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590368804; bh=EEpIMRcGKaVO5bGQlnRAHw8rtGeOowsYueuXInSPi3s=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jyLqZWcsK7zNDpabMhHdo1b0AlaiipzNPL4HP1LNN3aAKN9MH4cdhH887Q6znc7zJ
 JRdw0a3NFx7dIJGfKB18HuE0seDEmQ4NNyi6MnWmVQVJOnpx0oa1cbNcN/bXjmiZ/5
 e80joKTWjrJ35JatB6ckm3S9A4Q0hp9dZMmFwumgFCoM1h1lBsmrEVbAUUAsUU1L2d
 HiFF/Wcjvzc1L/JFH3pVFbqDknUNJuha89i6LX4NIwNRZ9luqMFsNQJ4aHWuuPBSZn
 d6Hu/FUFFj73Yj8J/Zk9kJJtkF61iQhaaTt1SXhUOHDEyQxNiGrT55Eyj2aqcUqmIe
 OtHdXy5DJhJOg==
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-05-23 21:27, Souptick Joarder wrote:
> API __get_user_pages_fast() renamed to get_user_pages_fast_only()
> to align with pin_user_pages_fast_only().
> 
> As part of this we will get rid of write parameter. Instead caller
> will pass FOLL_WRITE to get_user_pages_fast_only(). This will not
> change any existing functionality of the API.
> 
> All the callers are changed to pass FOLL_WRITE.

This looks good. A few nits below, but with those fixed, feel free to
add:

     Reviewed-by: John Hubbard <jhubbard@nvidia.com>

> 
> There are few places where 1 is passed to 2nd parameter of
> __get_user_pages_fast() and return value is checked for 1
> like [1]. Those are replaced with new inline
> get_user_page_fast_only().
> 
> [1] if (__get_user_pages_fast(hva, 1, 1, &page) == 1)
> 

We try to avoid talking *too* much about the previous version of
the code. Just enough. So, instead of the above two paragraphs,
I'd compress it down to:

Also: introduce get_user_page_fast_only(), and use it in a few
places that hard-code nr_pages to 1.

...
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 93d93bd..8d4597f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1817,10 +1817,16 @@ extern int mprotect_fixup(struct vm_area_struct *vma,
>   /*
>    * doesn't attempt to fault and will return short.
>    */
> -int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
> -			  struct page **pages);
> +int get_user_pages_fast_only(unsigned long start, int nr_pages,
> +			unsigned int gup_flags, struct page **pages);

Silly nit:

Can you please leave the original indentation in place? I don't normally
comment about this, but I like the original indentation better, and it matches
the pin_user_pages_fast() below, too.

...
> @@ -2786,8 +2792,8 @@ static int internal_get_user_pages_fast(unsigned long start, int nr_pages,
>    * If the architecture does not support this function, simply return with no
>    * pages pinned.
>    */
> -int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
> -			  struct page **pages)
> +int get_user_pages_fast_only(unsigned long start, int nr_pages,
> +			unsigned int gup_flags, struct page **pages)


Same thing here: you've changed the original indentation, which was (arguably, but
to my mind anyway) more readable, and for no reason. It still would have fit within
80 cols.

I'm sure it's a perfect 50/50 mix of people who prefer either indentation style, and
so for brand new code, I'll remain silent, as long as it is consistent with either
itself and/or the surrounding code. But changing it back and forth is a bit 
aggravating, and best avoided. :)


thanks,
-- 
John Hubbard
NVIDIA
