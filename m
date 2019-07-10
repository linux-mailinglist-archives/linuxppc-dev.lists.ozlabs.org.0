Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38255640E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 08:00:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k7pF00L0zDqdW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 16:00:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k7mY21DWzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 15:59:08 +1000 (AEST)
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1hl5cV-0004bB-Pv; Wed, 10 Jul 2019 07:58:23 +0200
Date: Wed, 10 Jul 2019 07:58:21 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Hoan Tran OS <hoan@os.amperecomputing.com>
Subject: Re: [PATCH 3/5] x86: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
In-Reply-To: <1c5bc3a8-0c6f-dce3-95a2-8aec765408a2@os.amperecomputing.com>
Message-ID: <alpine.DEB.2.21.1907100755010.1758@nanos.tec.linutronix.de>
References: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
 <1561501810-25163-4-git-send-email-Hoan@os.amperecomputing.com>
 <alpine.DEB.2.21.1906260032250.32342@nanos.tec.linutronix.de>
 <1c5bc3a8-0c6f-dce3-95a2-8aec765408a2@os.amperecomputing.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
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
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Open Source Submission <patches@amperecomputing.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
 Borislav Petkov <bp@alien8.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oscar Salvador <osalvador@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hoan,

On Wed, 10 Jul 2019, Hoan Tran OS wrote:
> On 6/25/19 3:45 PM, Thomas Gleixner wrote:
> > On Tue, 25 Jun 2019, Hoan Tran OS wrote:
> >> @@ -1567,15 +1567,6 @@ config X86_64_ACPI_NUMA
> >>   	---help---
> >>   	  Enable ACPI SRAT based node topology detection.
> >>   
> >> -# Some NUMA nodes have memory ranges that span
> >> -# other nodes.  Even though a pfn is valid and
> >> -# between a node's start and end pfns, it may not
> >> -# reside on that node.  See memmap_init_zone()
> >> -# for details.
> >> -config NODES_SPAN_OTHER_NODES
> >> -	def_bool y
> >> -	depends on X86_64_ACPI_NUMA
> > 
> > the changelog does not mention that this lifts the dependency on
> > X86_64_ACPI_NUMA and therefore enables that functionality for anything
> > which has NUMA enabled including 32bit.
> > 
> 
> I think this config is used for a NUMA layout which NUMA nodes addresses 
> are spanned to other nodes. I think 32bit NUMA also have the same issue 
> with that layout. Please correct me if I'm wrong.

I'm not saying you're wrong, but it's your duty to provide the analysis why
this is correct for everything which has NUMA enabled.

> > The core mm change gives no helpful information either. You just copied the
> > above comment text from some random Kconfig.
> 
> Yes, as it's a correct comment and is used at multiple places.

Well it maybe correct in terms of explaining what this is about, it still
does not explain why this is needed by default on everything which has NUMA
enabled.

Thanks,

	tglx
