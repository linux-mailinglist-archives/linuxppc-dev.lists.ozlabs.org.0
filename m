Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8A81C19BC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 17:38:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DGc443hLzDrKh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 01:38:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DGYd4zYFzDrKb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 01:35:56 +1000 (AEST)
IronPort-SDR: PA9xaWjEMDUGVozALd+BpajI3nKJczhSICILTZPSMmpDiuNM+7Xj7DcKjnW/hp78a5VmfvNEC3
 wf+IBUHRa5Ow==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 08:35:52 -0700
IronPort-SDR: eiOWyZIKI7vO19DR7OCFr64BqstCK2TpjbIFtfZ8MAqSSlMpCoVlOTcj7hUJ1GBJabMYzWffE+
 Y8JGzvryIPoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; d="scan'208";a="460295055"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga006.fm.intel.com with ESMTP; 01 May 2020 08:35:52 -0700
Date: Fri, 1 May 2020 08:35:52 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: sparc-related comment, to Re: [PATCH V1 07/10] arch/kmap: Ensure
 kmap_prot visibility
Message-ID: <20200501153551.GA673107@iweiny-DESK2.sc.intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-8-ira.weiny@intel.com>
 <20200501084446.GG27858@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501084446.GG27858@infradead.org>
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

On Fri, May 01, 2020 at 01:44:46AM -0700, Christoph Hellwig wrote:
> > --- a/arch/sparc/mm/highmem.c
> > +++ b/arch/sparc/mm/highmem.c
> > @@ -33,6 +33,7 @@
> >  #include <asm/vaddrs.h>
> >  
> >  pgprot_t kmap_prot;
> > +EXPORT_SYMBOL(kmap_prot);
> 
> Btw, I don't see why sparc needs this as a variable, as there is just
> a single assignment to it.

Because sparc uses non-standard defines which I'm not familiar with.

        kmap_prot = __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);

SRMMU_ET_PTE and friends are defined in 

arch/sparc/include/asm/pgtsrmmu.h

Since I can't readily test sparc this was easier to put out than let 0-day
crank on the entire series checking if including that header in the common
header chain would be an issue.

> 
> If sparc is sorted out we can always make it a define, and use a define
> for kmap_prot that defaults to PAGE_KERNEL, avoiding a little
> more duplication.

Agreed.  But it seems easier as a follow up (for me with 0-day).  Perhaps
someone from sparc can weigh in on the specifics of those defines and why they
are different from the normal ones?  Or even provide a follow on patch?

Ira

