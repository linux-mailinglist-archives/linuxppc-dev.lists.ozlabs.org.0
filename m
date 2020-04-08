Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E041A2687
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 17:58:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y87c5tprzDqQt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 01:58:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y7lX6ZXvzDqSs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 01:40:40 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0BEE968C65; Wed,  8 Apr 2020 17:40:34 +0200 (CEST)
Date: Wed, 8 Apr 2020 17:40:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH 02/28] staging: android: ion: use vmap instead of
 vm_map_ram
Message-ID: <20200408154033.GA28499@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408124833.13032-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408124833.13032-1-hdanton@sina.com>
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 syzkaller-bugs@googlegroups.com, bpf@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 08, 2020 at 08:48:33PM +0800, Hillf Danton wrote:
> > -	void *addr = vm_map_ram(pages, num, -1, pgprot);
> > +	void *addr = vmap(pages, num, VM_MAP);
> 
> A merge glitch?
> 
> void *vmap(struct page **pages, unsigned int count,
> 	   unsigned long flags, pgprot_t prot)

Yes, thanks for the headsup, you were as fast as the build bot :)

Fixed now.
