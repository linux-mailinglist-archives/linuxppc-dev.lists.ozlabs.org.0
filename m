Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A61177B9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 21:47:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WwHY2LtDzDqP2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 07:47:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WwCF5vx4zDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 07:43:52 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 69ADB68BE1; Mon,  9 Dec 2019 21:43:45 +0100 (CET)
Date: Mon, 9 Dec 2019 21:43:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 0/6] Allow setting caching mode in arch_add_memory()
 for P2PDMA
Message-ID: <20191209204345.GA29265@lst.de>
References: <20191209191346.5197-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209191346.5197-1-logang@deltatee.com>
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 09, 2019 at 12:13:40PM -0700, Logan Gunthorpe wrote:
> This changes is pretty routine for most of the arches: x86_64, s390, arm64
> and powerpc simply need to thread the pgprot through to where the page tables
> are setup. x86_32 unfortunately sets up the page tables at boot so
> must use _set_memory_prot() to change their caching mode. ia64 and sh
> don't appear to have an easy way to change the page tables so, for now
> at least, we just return -EINVAL on such mappings and thus they will
> not support P2PDMA memory until the work for this is done.

ia64 and sh don't support ZONE_DEVICE mappings anyway as far as I know.

This generally looks fine to me.
