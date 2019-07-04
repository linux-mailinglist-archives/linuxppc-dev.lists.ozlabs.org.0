Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 201095FA2A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 16:35:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fgVl5XqkzDqJM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 00:35:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fgRp6yzbzDqQ6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 00:32:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45fgRp1ZJ1z9sPH;
 Fri,  5 Jul 2019 00:32:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/mm/nvdimm: Add an informative message if we fail
 to allocate altmap block
In-Reply-To: <874l46nhtj.fsf@linux.ibm.com>
References: <20190629073813.12973-1-aneesh.kumar@linux.ibm.com>
 <CAOSf1CH_X7TG7Cato4hBt+U5=5HHHwR3hXQYC-z_GiBQiWnB1w@mail.gmail.com>
 <874l46nhtj.fsf@linux.ibm.com>
Date: Fri, 05 Jul 2019 00:32:36 +1000
Message-ID: <874l413m63.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> "Oliver O'Halloran" <oohall@gmail.com> writes:
>
>> On Sat, Jun 29, 2019 at 5:39 PM Aneesh Kumar K.V
>> <aneesh.kumar@linux.ibm.com> wrote:
>>>
>>> Allocation from altmap area can fail based on vmemmap page size used. Add kernel
>>> info message to indicate the failure. That allows the user to identify whether they
>>> are really using persistent memory reserved space for per-page metadata.
>>>
>>> The message looks like:
>>> [  136.587212] altmap block allocation failed, falling back to system memory
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>  arch/powerpc/mm/init_64.c | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
>>> index a4e17a979e45..57c0573650dc 100644
>>> --- a/arch/powerpc/mm/init_64.c
>>> +++ b/arch/powerpc/mm/init_64.c
>>> @@ -194,8 +194,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>>                  * fail due to alignment issues when using 16MB hugepages, so
>>>                  * fall back to system memory if the altmap allocation fail.
>>>                  */
>>> -               if (altmap)
>>> +               if (altmap) {
>>>                         p = altmap_alloc_block_buf(page_size, altmap);
>>> +                       if (!p)
>>
>>> +                               pr_info("altmap block allocation failed, " \
>>> +                                       "falling back to system memory");
>>
>> I think this is kind of misleading. If you're mapping a large amount
>> of memory you can have most of the vmemmap backing allocated from the
>> altmap and one extra block allocated from normal memory. E.g. If you
>> have 32MB of altmap space, one 16MB block will be allocated from the
>> altmap, but the 2nd 16MB block is probably unusable due to the
>> reserved pages at the start of the altmap. Maybe this should be a
>> pr_debug() so it's only printed along with the "vmemmap_populate ..."
>> message above?
>
> Will switch to pr_debug. What I really wanted was an indication of which
> pfn device failed to allocate  per page meata data in the device. But
> we really don't have device details here and we don't end up calling
> this function if there is already a 16MB mapping in DRAM for this area.
>
>>
>> Also, isn't kernel style to keep printf()s, even long ones, on one line?
>
> I was not sure. It do print to kernel log in one line.

It should be one line so it's easy to grep for the error string.

cheers
