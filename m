Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C348C4C8B11
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 12:44:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7FlB6XnTz3c2P
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 22:44:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7Fkk0705z2yph
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 22:43:41 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5C51F68AFE; Tue,  1 Mar 2022 12:43:35 +0100 (CET)
Date: Tue, 1 Mar 2022 12:43:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH 08/12] x86: centralize setting SWIOTLB_FORCE when guest
 memory encryption is enabled
Message-ID: <20220301114335.GA2881@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-9-hch@lst.de>
 <8e623a11-d809-4fab-401c-2ce609a9fc14@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e623a11-d809-4fab-401c-2ce609a9fc14@citrix.com>
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 01, 2022 at 11:39:29AM +0000, Andrew Cooper wrote:
> This isn't really "must".  The guest is perfectly capable of sharing
> memory with the hypervisor.
> 
> It's just that for now, bounce buffering is allegedly faster, and the
> simple way of getting it working.

Yeah, I guess you щould just share/unshare on demand.  But given that
this isn't implemented it is a must in the current kernel.  But if
you want a different wording suggest one and I'll put it in.
