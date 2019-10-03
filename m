Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 811F5CB057
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 22:42:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46klLw0089zDqZw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 06:42:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="OvJoiMhG"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46klJf0TcTzDqYX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 06:40:49 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d965cc80000>; Thu, 03 Oct 2019 13:40:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 03 Oct 2019 13:40:40 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 03 Oct 2019 13:40:40 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Oct
 2019 20:40:40 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Oct 2019
 20:40:38 +0000
Subject: Re: [PATCH v5 01/11] asm-generic/pgtable: Adds generic functions to
 monitor lockless pgtable walks
To: Peter Zijlstra <peterz@infradead.org>, Leonardo Bras
 <leonardo@linux.ibm.com>
References: <20191003013325.2614-1-leonardo@linux.ibm.com>
 <20191003013325.2614-2-leonardo@linux.ibm.com>
 <20191003071145.GM4536@hirez.programming.kicks-ass.net>
 <20191003115141.GJ4581@hirez.programming.kicks-ass.net>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <c127ee98-094b-d5c0-0a42-6d01c16a72d9@nvidia.com>
Date: Thu, 3 Oct 2019 13:40:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003115141.GJ4581@hirez.programming.kicks-ass.net>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1570135241; bh=oygYxcAudWTOP6aOcR5gJi5qvCLemgS4yrH5ULKuCPM=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=OvJoiMhGmIDpiVNUmKclWvLO36Hu8mVLDqpSVxfPfxDWXLj1Qk/5tzPSf6+BvLm7X
 HRUA5Mhctx9Sc1Z5x6G1w2/73K8d4qxY6qeNP5M8cj786M3ap3d4QR9pBTAaBmDrby
 H3YMPNpBCkSyQC2dSpCe0dxg+9J5AqHgejWrIEuH09XsWwjshvUkQJ3ywDH98/Yppq
 6Sni4ipqB3M5ld/Y1KReGpdtZEZ5gITxBSrOdu2NL56bycs63l62mtl7jlF323b6ri
 UM4KhehiRZ+BCzZrBifRD6LZyOIcKdx6P35tDKFBbmCc9hFSegBapQxblpFYKQGbWn
 6FWA9PZbDvQZA==
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
 "Dmitry V. Levin" <ldv@altlinux.org>, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Christoph Lameter <cl@linux.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Santosh Sivaraj <santosh@fossix.org>, Davidlohr Bueso <dave@stgolabs.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Andrea Arcangeli <aarcange@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm-ppc@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Reza Arbab <arbab@linux.ibm.com>,
 Allison Randal <allison@lohutok.net>, Paul McKenney <Paul.McKenney@us.ibm.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Roman Gushchin <guro@fb.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/3/19 4:51 AM, Peter Zijlstra wrote:
> On Thu, Oct 03, 2019 at 09:11:45AM +0200, Peter Zijlstra wrote:
>> On Wed, Oct 02, 2019 at 10:33:15PM -0300, Leonardo Bras wrote:
...
> 
> I'm still really confused about this barrier. It just doesn't make
> sense.
> 
> If an interrupt happens before the local_irq_disable()/save(), then it
> will discard any and all speculation that would be in progress to handle
> the exception.
> 

Hi Peter,

So, would that imply that it's correct to apply approximately the following
patch:

diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
index 1adbb8a371c7..cf41eff37e24 100644
--- a/Documentation/memory-barriers.txt
+++ b/Documentation/memory-barriers.txt
@@ -2099,9 +2099,9 @@ INTERRUPT DISABLING FUNCTIONS
 -----------------------------
 
 Functions that disable interrupts (ACQUIRE equivalent) and enable interrupts
-(RELEASE equivalent) will act as compiler barriers only.  So if memory or I/O
-barriers are required in such a situation, they must be provided from some
-other means.
+(RELEASE equivalent) will act as full memory barriers. This is because, for
+all supported CPU architectures, interrupt arrival causes all speculative
+memory accesses to be discarded.
 
?

We're also discussing this over in [1] ("mm: don't expose non-hugetlb page to
fast gup prematurely"), so I'm adding Paul to this thread here as well.

[1] https://lore.kernel.org/r/20191002092447.GC9320@quack2.suse.cz

thanks,
-- 
John Hubbard
NVIDIA
