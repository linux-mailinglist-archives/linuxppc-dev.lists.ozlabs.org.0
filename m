Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C81CB082
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 22:51:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46klYD09P4zDqZQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 06:51:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="E7t56r4C"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46klWJ0L3rzDqSv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 06:50:03 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d965ef70000>; Thu, 03 Oct 2019 13:49:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 03 Oct 2019 13:49:59 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 03 Oct 2019 13:49:59 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Oct
 2019 20:49:58 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Oct 2019
 20:49:57 +0000
Subject: Re: [PATCH v5 00/11] Introduces new count-based method for tracking
 lockless pagetable walks
To: Leonardo Bras <leonardo@linux.ibm.com>, Peter Zijlstra
 <peterz@infradead.org>
References: <20191003013325.2614-1-leonardo@linux.ibm.com>
 <20191003072952.GN4536@hirez.programming.kicks-ass.net>
 <c46d6c7301314a2d998cffc47d69b404f2c26ad3.camel@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <99754d82-33c5-a54f-8607-b6bf151069d4@nvidia.com>
Date: Thu, 3 Oct 2019 13:49:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c46d6c7301314a2d998cffc47d69b404f2c26ad3.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1570135799; bh=8tX3/lygYnCsJanQP8X8WsxfvR7VJcUfXDFMU2I/nGk=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=E7t56r4CLhvhUPdEAoY67ZDe6oNO4KK3vWmxNrojsg4pYH3aDVGJaDvHpf43EargH
 6VLoRvpcEGsHy2m7jPwe1MAdsVJNi17Iz+qSjXfvvIkyjACUbiQusaP1jknD8WLbIV
 l0ucIoMQynb/6d7D3LoH9D2LrX48WHelHpcmAtp/6Otdk/Jw1tC380ZU7IZ1oNS5M6
 KspIyHKE8SsBbAwTdDqzzRES4O4MTX47Q3XHe2a17wWshTSg3w/LFAwUKVhNEdVhSz
 aDR4zE4TyLQiRd0IPEIj+tdpCYZzxgqc7okXUWc6YwhLmFMrPb1qR1mM2eEWq88TWN
 /BSPHMCl2A2Ug==
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, "Dmitry
 V. Levin" <ldv@altlinux.org>, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Christoph Lameter <cl@linux.com>, Ira Weiny <ira.weiny@intel.com>,
 Ingo Molnar <mingo@kernel.org>, Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch@vger.kernel.org, Santosh Sivaraj <santosh@fossix.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Allison Randal <allison@lohutok.net>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm-ppc@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Reza Arbab <arbab@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Al
 Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/3/19 1:36 PM, Leonardo Bras wrote:
> On Thu, 2019-10-03 at 09:29 +0200, Peter Zijlstra wrote:
>> On Wed, Oct 02, 2019 at 10:33:14PM -0300, Leonardo Bras wrote:
...
>> This is something entirely specific to Power, you shouldn't be touching
>> generic code at all.
> 
> Up to v4, I was declaring dummy functions so it would not mess up with
> other archs: http://patchwork.ozlabs.org/patch/1168779/
> 
> But I was recommended to create a generic function that could guide the
> way to archs: http://patchwork.ozlabs.org/patch/1168775/

Yes. And to clarify, I was assuming that the changes to mm/gup.c were 
required in order to accomplish your goals. Given that assumption, I 
wanted the generic code to be "proper", and that's what that feedback
is about.

If you can somehow do it entirely as an arch-specific thing, then probably
that's even better. Although the other questions about file-backed THP
make it sound like some rethinking across the board is required now.


thanks,
-- 
John Hubbard
NVIDIA
