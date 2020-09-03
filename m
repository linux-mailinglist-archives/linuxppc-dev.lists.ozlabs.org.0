Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2457F25C6EA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 18:33:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj5w43LZQzDqrV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 02:33:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj4x572zKzDrBH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 01:49:13 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5E5A767357; Thu,  3 Sep 2020 17:49:09 +0200 (CEST)
Date: Thu, 3 Sep 2020 17:49:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 14/14] powerpc: remove address space overrides using
 set_fs()
Message-ID: <20200903154909.GA23023@lst.de>
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142242.925828-15-hch@lst.de>
 <e7d2d231-5658-a4d3-0495-2af62f34aa34@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7d2d231-5658-a4d3-0495-2af62f34aa34@csgroup.eu>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 03, 2020 at 05:43:25PM +0200, Christophe Leroy wrote:
>
>
> Le 03/09/2020 à 16:22, Christoph Hellwig a écrit :
>> Stop providing the possibility to override the address space using
>> set_fs() now that there is no need for that any more.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>
>
>>   -static inline int __access_ok(unsigned long addr, unsigned long size,
>> -			mm_segment_t seg)
>> +static inline bool __access_ok(unsigned long addr, unsigned long size)
>>   {
>> -	if (addr > seg.seg)
>> -		return 0;
>> -	return (size == 0 || size - 1 <= seg.seg - addr);
>> +	if (addr >= TASK_SIZE_MAX)
>> +		return false;
>> +	return size == 0 || size <= TASK_SIZE_MAX - addr;
>>   }
>
> You don't need to test size == 0 anymore. It used to be necessary because 
> of the 'size - 1', as size is unsigned.
>
> Now you can directly do
>
> 	return size <= TASK_SIZE_MAX - addr;
>
> If size is 0, this will always be true (because you already know that addr 
> is not >= TASK_SIZE_MAX

True.  What do you think of Linus' comment about always using the
ppc32 version on ppc64 as well with this?
