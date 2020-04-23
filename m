Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B49831B5B7A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 14:33:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Gtf1FMrzDqL2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 22:33:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=sakari.ailus@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497DDD1Y8SzDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 20:33:31 +1000 (AEST)
IronPort-SDR: St6lJdFz3bdfo/pRuTj19WtqymIml1y3Un+vgNY9vjbE3osP4Me/MNjl0Ld59eYX7Dd1mmZX+9
 NZXBj052il+Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 03:32:15 -0700
IronPort-SDR: Tbx4AP8Zju7uVt+bsFFBuorEKEDp+DufEyq0utUZQmn5wkfXhsC5SmipnzOBUDHfLSF+NGOyYH
 O/V5r9IH1k5g==
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="247718369"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 03:32:10 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 158F7204C6; Thu, 23 Apr 2020 13:32:08 +0300 (EEST)
Date: Thu, 23 Apr 2020 13:32:08 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/29] staging: media: ipu3: use vmap instead of
 reimplementing it
Message-ID: <20200423103207.GO5381@paasikivi.fi.intel.com>
References: <20200414131348.444715-1-hch@lst.de>
 <20200414131348.444715-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414131348.444715-5-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:31:03 +1000
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, linaro-mm-sig@lists.linaro.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 03:13:23PM +0200, Christoph Hellwig wrote:
> Just use vmap instead of messing with vmalloc internals.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
