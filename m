Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 844BA8D19E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 12:56:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467mj75YySzDqsC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 20:56:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467mft2y4XzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 20:54:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467mfs4Z3Mz9sN1;
 Wed, 14 Aug 2019 20:54:13 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v3 08/16] powerpc/pseries/svm: Use shared memory for
 LPPACA structures
In-Reply-To: <87sgq6gium.fsf@morokweng.localdomain>
References: <20190806052237.12525-1-bauerman@linux.ibm.com>
 <20190806052237.12525-9-bauerman@linux.ibm.com>
 <875zn2sgqs.fsf@concordia.ellerman.id.au>
 <87sgq6gium.fsf@morokweng.localdomain>
Date: Wed, 14 Aug 2019 20:54:12 +1000
Message-ID: <87tvakqap7.fsf@concordia.ellerman.id.au>
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
>>> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
>>>
>>> LPPACA structures need to be shared with the host. Hence they need to be in
>>> shared memory. Instead of allocating individual chunks of memory for a
>>> given structure from memblock, a contiguous chunk of memory is allocated
>>> and then converted into shared memory. Subsequent allocation requests will
>>> come from the contiguous chunk which will be always shared memory for all
>>> structures.
>>>
>>> While we are able to use a kmem_cache constructor for the Debug Trace Log,
>>> LPPACAs are allocated very early in the boot process (before SLUB is
>>> available) so we need to use a simpler scheme here.
>>>
>>> Introduce helper is_svm_platform() which uses the S bit of the MSR to tell
>>> whether we're running as a secure guest.
>>>
>>> Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
>>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>> ---
>>>  arch/powerpc/include/asm/svm.h | 26 ++++++++++++++++++++
>>>  arch/powerpc/kernel/paca.c     | 43 +++++++++++++++++++++++++++++++++-
>>>  2 files changed, 68 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/svm.h
>>> new file mode 100644
>>> index 000000000000..fef3740f46a6
>>> --- /dev/null
>>> +++ b/arch/powerpc/include/asm/svm.h
>>> @@ -0,0 +1,26 @@
>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>> +/*
>>> + * SVM helper functions
>>> + *
>>> + * Copyright 2019 Anshuman Khandual, IBM Corporation.
>>
>> Are we sure this copyright date is correct?
>
> I may be confused about which year the copyright refers to. I thought it
> was the year when the patch was committed. If it is the first time the
> patch was published then this one should be 2018.

I'm not a lawyer etc. but AIUI the date above is about the authorship,
ie. when it was originally written, not when it was published or
committed.

In general I don't think it matters too much, but in this case I'm
pretty sure Anshuman can't have possibly written it in 2019 on behalf of
IBM :)

So we can either change the date to 2018, or drop his name and just say
it's copyright 2019 by IBM.

cheers
