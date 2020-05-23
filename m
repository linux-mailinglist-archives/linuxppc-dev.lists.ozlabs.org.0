Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 637BE1DFB5C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 00:32:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Tylk1qBYzDqdd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 08:32:18 +1000 (AEST)
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
 header.s=n1 header.b=Cwt4TkD+; dkim-atps=neutral
X-Greylist: delayed 312 seconds by postgrey-1.36 at bilbo;
 Sun, 24 May 2020 08:24:02 AEST
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TyZB4FjJzDqg8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 08:24:02 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec9a1360000>; Sat, 23 May 2020 15:18:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sat, 23 May 2020 15:18:43 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sat, 23 May 2020 15:18:43 -0700
Received: from [10.2.58.199] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 23 May
 2020 22:18:42 +0000
Subject: Re: [linux-next RFC] mm/gup.c: Convert to use
 get_user_pages_fast_only()
To: Souptick Joarder <jrdr.linux@gmail.com>, Matthew Wilcox
 <willy@infradead.org>
References: <1590252072-2793-1-git-send-email-jrdr.linux@gmail.com>
 <20200523172519.GA17206@bombadil.infradead.org>
 <CAFqt6zZfrdRB5pbHo5nu668yQUaTV9DbV3ZTeFq-UEKjs0X8XQ@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <cf449b49-d0c0-ecc7-6d7e-49839e39a0e9@nvidia.com>
Date: Sat, 23 May 2020 15:18:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFqt6zZfrdRB5pbHo5nu668yQUaTV9DbV3ZTeFq-UEKjs0X8XQ@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590272311; bh=KNeUET6ZqCIyI9UZKaBTYlfqbZe/t6UNks+R9XJfCno=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Cwt4TkD+SRsndYeDIexNBQBRvg71Jf3carwopFfOFRQZU/XX3jc1s4L8CK6LSvNu9
 igcBSKLXoY11kK9llmBoxO0eek+dIVv3AnrfVg7u9UIsrs2+4xhzDbhIKYaJMjeKoB
 t0zSCJ/ptoyGAvq/C16Ci6KFqzOAvjDaFURLjGXOpuT0cdm+gt/io2ndzf19ZOh61/
 lRurd0PF5Yu8vOHYit0KwqIpsCf/RAs3DUsjL8mVarDbe0vKugfltvegoWKrRkQ4sc
 8zktnTWWYhN1RvLHLyInM5jcF4L9prlh3S+P8THBuRVyHlobOxYUn+Se5uEwZTR0ic
 WowIo+tzSmS2w==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, kvm@vger.kernel.org,
 pbonzini@redhat.com, Linux-MM <linux-mm@kvack.org>,
 Peter Zijlstra <peterz@infradead.org>, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, namhyung@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-05-23 12:35, Souptick Joarder wrote:
...
>> Everything you have done here is an improvement, and I'd be happy to
>> see it go in (after fixing the bug I note below).
>>
>> But in reading through it, I noticed almost every user ...
>>
>>> -     if (__get_user_pages_fast(hva, 1, 1, &page) == 1) {
>>> +     if (get_user_pages_fast_only(hva, 1, FOLL_WRITE, &page) == 1) {
>>
>> passes '1' as the second parameter.  So do we want to add:
>>
>> static inline bool get_user_page_fast_only(unsigned long addr,
>>                  unsigned int gup_flags, struct page **pagep)
>> {
>>          return get_user_pages_fast_only(addr, 1, gup_flags, pagep) == 1;
>> }
>>
> Yes, this can be added. Does get_user_page_fast_only() naming is fine ?


It seems like a good name to me. And I think that the new wrapper call is
a good move, too.

I did pause and reflect for a moment about the number gup/pup API calls we
are building up, but that's merely an indication of the wide usage of this
functionality. So it all feels about right.


thanks,
-- 
John Hubbard
NVIDIA
