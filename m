Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B0CA5076
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 09:55:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MMpK1x3bzDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 17:55:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MMmF2Y7hzDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 17:54:03 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3F54F227A8A; Mon,  2 Sep 2019 09:53:56 +0200 (CEST)
Date: Mon, 2 Sep 2019 09:53:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v7 1/7] kvmppc: Driver to manage pages of secure guest
Message-ID: <20190902075356.GA28967@lst.de>
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190822102620.21897-2-bharata@linux.ibm.com>
 <20190829083810.GA13039@lst.de> <20190830034259.GD31913@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830034259.GD31913@in.ibm.com>
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 30, 2019 at 09:12:59AM +0530, Bharata B Rao wrote:
> On Thu, Aug 29, 2019 at 10:38:10AM +0200, Christoph Hellwig wrote:
> > On Thu, Aug 22, 2019 at 03:56:14PM +0530, Bharata B Rao wrote:
> > > +/*
> > > + * Bits 60:56 in the rmap entry will be used to identify the
> > > + * different uses/functions of rmap.
> > > + */
> > > +#define KVMPPC_RMAP_DEVM_PFN	(0x2ULL << 56)
> > 
> > How did you come up with this specific value?
> 
> Different usage types of RMAP array are being defined.
> https://patchwork.ozlabs.org/patch/1149791/
> 
> The above value is reserved for device pfn usage.

Shouldn't all these defintions go in together in a patch?  Also is bi
t 56+ a set of values, so is there 1 << 56 and 3 << 56 as well?  Seems
like even that other patch doesn't fully define these "pfn" values.

> > No need for !! when returning a bool.  Also the helper seems a little
> > pointless, just opencoding it would make the code more readable in my
> > opinion.
> 
> I expect similar routines for other usages of RMAP to come up.

Please drop them all.  Having to wade through a header to check for
a specific bit that also is set manually elsewhere in related code
just obsfucates it for the reader.

> > > +	*mig->dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> > > +	return 0;
> > > +}
> > 
> > I think you can just merge this trivial helper into the only caller.
> 
> Yes I can, but felt it is nicely abstracted out to a function right now.

Not really.  It just fits the old calling conventions before I removed
the indirection.

> > Here we actually have two callers, but they have a fair amount of
> > duplicate code in them.  I think you want to move that common
> > code (including setting up the migrate_vma structure) into this
> > function and maybe also give it a more descriptive name.
> 
> Sure, I will give this a try. The name is already very descriptive, will
> come up with an appropriate name.

I don't think alloc_and_copy is very helpful.  It matches some of the
implementation, but not the intent.  Why not kvmppc_svm_page_in/out
similar to the hypervisor calls calling them?  Yes, for one case it
also gets called from the pagefault handler, but it still performs
these basic page in/out actions.

> BTW this file and the fuction prefixes in this file started out with
> kvmppc_hmm, switched to kvmppc_devm when HMM routines weren't used anymore.
> Now with the use of only non-dev versions, planning to swtich to
> kvmppc_uvmem_

That prefix sounds fine to me as well.
