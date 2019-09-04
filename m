Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2D7A7EC1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 11:03:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NdCw4SXFzDqlw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 19:03:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nd9z5F8qzDqh3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 19:02:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46Nd9z3shVz8t0n
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 19:02:15 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46Nd9z3djPz9sDB; Wed,  4 Sep 2019 19:02:15 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46Nd9z09GMz9s4Y
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Sep 2019 19:02:14 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x848m77k144983
 for <linuxppc-dev@ozlabs.org>; Wed, 4 Sep 2019 05:02:10 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ut9qs16tw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 04 Sep 2019 05:02:09 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Wed, 4 Sep 2019 10:02:08 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Sep 2019 10:02:04 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x84923Z259244638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 09:02:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01AB442056;
 Wed,  4 Sep 2019 09:02:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56EDD4204B;
 Wed,  4 Sep 2019 09:02:01 +0000 (GMT)
Received: from [9.109.198.170] (unknown [9.109.198.170])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Sep 2019 09:02:01 +0000 (GMT)
Subject: Re: [PATCH v5 02/31] powerpc/fadump: move internal code to a new file
To: Hari Bathini <hbathini@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630266000.8896.13603358349585118846.stgit@hbathini.in.ibm.com>
 <871rwxskjo.fsf@mpe.ellerman.id.au>
 <7823769a-9e2c-9ae7-d12e-7d5e42f51355@linux.ibm.com>
From: Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>
Date: Wed, 4 Sep 2019 14:32:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7823769a-9e2c-9ae7-d12e-7d5e42f51355@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19090409-0012-0000-0000-000003468270
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090409-0013-0000-0000-00002180D3A3
Message-Id: <3c6bacc2-777d-a66c-0c43-79b9fbe76c15@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-04_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040091
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver <oohall@gmail.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/3/19 9:35 PM, Hari Bathini wrote:
> 
> 
> On 03/09/19 4:39 PM, Michael Ellerman wrote:
>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>> Make way for refactoring platform specific FADump code by moving code
>>> that could be referenced from multiple places to fadump-common.c file.
>>>
>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>> ---
>>>  arch/powerpc/kernel/Makefile        |    2 
>>>  arch/powerpc/kernel/fadump-common.c |  140 ++++++++++++++++++++++++++++++++++
>>>  arch/powerpc/kernel/fadump-common.h |    8 ++
>>>  arch/powerpc/kernel/fadump.c        |  146 ++---------------------------------
>>>  4 files changed, 158 insertions(+), 138 deletions(-)
>>>  create mode 100644 arch/powerpc/kernel/fadump-common.c
>>
>> I don't understand why we need fadump.c and fadump-common.c? They're
>> both common/shared across pseries & powernv aren't they?
> 
> The convention I tried to follow to have fadump-common.c shared between fadump.c,
> pseries & powernv code while pseries & powernv code take callback requests from
> fadump.c and use fadump-common.c (shared by both platforms), if necessary to fullfil
> those requests...
> 
>> By the end of the series we end up with 149 lines in fadump-common.c
>> which seems like a waste of time. Just put it all in fadump.c.
> 
> Yeah. Probably not worth a new C file. Will just have two separate headers. One for
> internal code and one for interfacing with other modules...
> 
> [...]
> 
>>> + * Copyright 2019, IBM Corp.
>>> + * Author: Hari Bathini <hbathini@linux.ibm.com>
>>
>> These can just be:
>>
>>  * Copyright 2011, Mahesh Salgaonkar, IBM Corporation.
>>  * Copyright 2019, Hari Bathini, IBM Corporation.
>>
> 
> Sure.
> 
>>> + */
>>> +
>>> +#undef DEBUG
>>
>> Don't undef DEBUG please.
>>
> 
> Sorry! Seeing such thing in most files, I thought this was the convention. Will drop
> this change in all the new files I added.
> 
>>> +#define pr_fmt(fmt) "fadump: " fmt
>>> +
>>> +#include <linux/memblock.h>
>>> +#include <linux/elf.h>
>>> +#include <linux/mm.h>
>>> +#include <linux/crash_core.h>
>>> +
>>> +#include "fadump-common.h"
>>> +
>>> +void *fadump_cpu_notes_buf_alloc(unsigned long size)
>>> +{
>>> +	void *vaddr;
>>> +	struct page *page;
>>> +	unsigned long order, count, i;
>>> +
>>> +	order = get_order(size);
>>> +	vaddr = (void *)__get_free_pages(GFP_KERNEL|__GFP_ZERO, order);
>>> +	if (!vaddr)
>>> +		return NULL;
>>> +
>>> +	count = 1 << order;
>>> +	page = virt_to_page(vaddr);
>>> +	for (i = 0; i < count; i++)
>>> +		SetPageReserved(page + i);
>>> +	return vaddr;
>>> +}
>>
>> I realise you're just moving this code, but why do we need all this hand
>> rolled allocation stuff?
> 
> Yeah, I think alloc_pages_exact() may be better here. Mahesh, am I missing something?

We hook up the physical address of this buffer to ELF core header as
PT_NOTE section. Hence we don't want these pages to be moved around or
reclaimed.

Thanks,
-Mahesh.

