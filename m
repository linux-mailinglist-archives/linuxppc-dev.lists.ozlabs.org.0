Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7636CB44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 10:50:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q7Bf28LBzDqK9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 18:50:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45q73R6Yw4zDqRx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 18:44:19 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D492968B05; Thu, 18 Jul 2019 10:44:16 +0200 (CEST)
Date: Thu, 18 Jul 2019 10:44:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v3 5/6] fs/core/vmcore: Move sev_active() reference to
 x86 arch code
Message-ID: <20190718084416.GD24562@lst.de>
References: <20190718032858.28744-1-bauerman@linux.ibm.com>
 <20190718032858.28744-6-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718032858.28744-6-bauerman@linux.ibm.com>
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
Cc: linux-s390@vger.kernel.org, Mike Anderson <andmike@linux.ibm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Alexey Dobriyan <adobriyan@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Lendacky <Thomas.Lendacky@amd.com>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2019 at 12:28:57AM -0300, Thiago Jung Bauermann wrote:
> Secure Encrypted Virtualization is an x86-specific feature, so it shouldn't
> appear in generic kernel code because it forces non-x86 architectures to
> define the sev_active() function, which doesn't make a lot of sense.
> 
> To solve this problem, add an x86 elfcorehdr_read() function to override
> the generic weak implementation. To do that, it's necessary to make
> read_from_oldmem() public so that it can be used outside of vmcore.c.
> 
> Also, remove the export for sev_active() since it's only used in files that
> won't be built as modules.

I have to say I find the __weak overrides of the vmcore files very
confusing and which we'd have a better scheme there.  But as this fits
into that scheme and allows to remove the AMD SME vs SEV knowledge from
the core I'm fine with it.

Reviewed-by: Christoph Hellwig <hch@lst.de>
