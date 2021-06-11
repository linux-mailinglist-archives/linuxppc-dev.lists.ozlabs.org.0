Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E633A3C58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 08:54:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1Wm16LRqz309L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 16:54:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1Wlc23s8z3079
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 16:53:46 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0D2A168AFE; Fri, 11 Jun 2021 08:53:39 +0200 (CEST)
Date: Fri, 11 Jun 2021 08:53:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 09/16] ps3disk: use memcpy_{from,to}_bvec
Message-ID: <20210611065338.GA31210@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-10-hch@lst.de>
 <20210609014822.GT3697498@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609014822.GT3697498@iweiny-DESK2.sc.intel.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-arch@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 ceph-devel@vger.kernel.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Thomas Gleixner <tglx@linutronix.de>, Ilya Dryomov <idryomov@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 08, 2021 at 06:48:22PM -0700, Ira Weiny wrote:
> I'm still not 100% sure that these flushes are needed but the are not no-ops on
> every arch.  Would it be best to preserve them after the memcpy_to/from_bvec()?
> 
> Same thing in patch 11 and 14.

To me it seems kunmap_local should basically always call the equivalent
of flush_kernel_dcache_page.  parisc does this through
kunmap_flush_on_unmap, but none of the other architectures with VIVT
caches or other coherency issues does.

Does anyone have a history or other insights here?
