Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CB1C1B8A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 19:20:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DJtX5vXLzDrNP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 03:20:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DJqw1PPbzDrN7
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 03:18:33 +1000 (AEST)
IronPort-SDR: GzQI3/AkpgxCMXic0j5U7yOLztcqurVUew5LT+CqfiDIwXcLPmvTvihTUBJGEx6NmALqOvqbtt
 9R88mgGktztg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 10:18:29 -0700
IronPort-SDR: R2OHZlJ5m4ujiSXIVvaGSStL0azGkDVM04Moca/qctbpNzEmR/lPEzkfc2x5+KowINCeguMIHy
 4dEJuDVXUKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,340,1583222400"; d="scan'208";a="405797056"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2020 10:18:28 -0700
Date: Fri, 1 May 2020 10:18:28 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V1 00/10] Remove duplicated kmap code
Message-ID: <20200501171828.GA673260@iweiny-DESK2.sc.intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200501085456.GL27858@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501085456.GL27858@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 01, 2020 at 01:54:56AM -0700, Christoph Hellwig wrote:
> In addition to the work already it the series, it seems like
> LAST_PKMAP_MASK, PKMAP_ADDR and PKMAP_NR can also be consolidated
> to common code.

Agreed, I mentioned in the cover letter there are similarities...

> 
> Also kmap_atomic_high_prot / kmap_atomic_pfn could move into common
> code, maybe keyed off a symbol selected by the actual users that
> need it.  It also seems like it doesn't actually ever need to be
> exported.

...  but these are not as readily obvious, at least to me.  I do see a pattern
but the differences seemed subtle enough that it would take a while to ensure
correctness.  So I'd like to see this series go in and build on it.

> 
> This in turn would lead to being able to allow io_mapping_map_atomic_wc
> on all architectures, which might make nouveau and qxl happy, but maybe
> that can be left for another series.

I agree, that this should be follow on patches.  I still need to fix the
bisect-ability and I don't want to bog down 0-day with a longer series.

Thanks for the review!
Ira

