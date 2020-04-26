Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1751B9481
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 00:25:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499Mt45SzVzDqWQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 08:25:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499MrD5JDZzDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 08:23:38 +1000 (AEST)
IronPort-SDR: 6i7hIDkO5APHZMklw/vJchLQv9pemK7xpQ3jcQqrewrtp1eA/eeuga3hlCnCU4TGSazuA3a7gO
 IakFA//z4YQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2020 15:23:35 -0700
IronPort-SDR: 8yV2Y6IG5lNoT1jn6/HH2CElcZY0fcyD0N/RoyhP0ObnAngZTUc4uRHLGC5CCH89hOtD39Sa16
 WtvX0Mtzph+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,321,1583222400"; d="scan'208";a="458601785"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga006.fm.intel.com with ESMTP; 26 Apr 2020 15:23:34 -0700
Date: Sun, 26 Apr 2020 15:23:34 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/5] arch/kmap: Remove redundant arch specific kmaps
Message-ID: <20200426222333.GA135929@iweiny-DESK2.sc.intel.com>
References: <20200426055406.134198-1-ira.weiny@intel.com>
 <20200426055406.134198-3-ira.weiny@intel.com>
 <20200426071715.GA22024@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426071715.GA22024@infradead.org>
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
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 26, 2020 at 12:17:15AM -0700, Christoph Hellwig wrote:
> On Sat, Apr 25, 2020 at 10:54:03PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The kmap code for all the architectures is almost 100% identical.
> > 
> > Lift the common code to the core.  Use ARCH_HAS_KMAP to indicate if an
> > arch needs a special kmap.
> 
> Can you add a kmap_flush_tlb hook that csky and mips define, and the
> just entirely consolidate the code instead?

Sure that seems to work.

Ira
