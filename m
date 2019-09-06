Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80926ABDCB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 18:34:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q36m1mzgzDrDr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 02:34:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q34y2vBXzDr8s
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2019 02:32:48 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7402B68B20; Fri,  6 Sep 2019 18:32:41 +0200 (CEST)
Date: Fri, 6 Sep 2019 18:32:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v7 1/7] kvmppc: Driver to manage pages of secure guest
Message-ID: <20190906163241.GA12516@lst.de>
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190822102620.21897-2-bharata@linux.ibm.com>
 <20190829083810.GA13039@lst.de> <20190830034259.GD31913@in.ibm.com>
 <20190902075356.GA28967@lst.de> <20190906113639.GA8748@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906113639.GA8748@in.ibm.com>
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

On Fri, Sep 06, 2019 at 05:06:39PM +0530, Bharata B Rao wrote:
> > Also is bit 56+ a set of values, so is there 1 << 56 and 3 << 56 as well?  Seems
> > like even that other patch doesn't fully define these "pfn" values.
> 
> I realized that the bit numbers have changed, it is no longer bits 60:56,
> but instead top 8bits. 
> 
> #define KVMPPC_RMAP_UVMEM_PFN   0x0200000000000000
> static inline bool kvmppc_rmap_is_uvmem_pfn(unsigned long *rmap)
> {
>         return ((*rmap & 0xff00000000000000) == KVMPPC_RMAP_UVMEM_PFN);
> }

In that overall scheme I'd actually much prefer something like (names
just made up, they should vaguely match the spec this written to):

static inline unsigned long kvmppc_rmap_type(unsigned long *rmap)
{
	return (rmap & 0xff00000000000000);
}

And then where you check it you can use:

	if (kvmppc_rmap_type(*rmap) == KVMPPC_RMAP_UVMEM_PFN)

and where you set it you do:

	*rmap |= KVMPPC_RMAP_UVMEM_PFN;

as in the current patch to keep things symmetric.
