Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1921F9BA3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 17:11:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lvtd4NbfzDqcL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 01:11:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=fenghua.yu@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lvV90Y9RzDqMw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 00:53:50 +1000 (AEST)
IronPort-SDR: i9WgiRhyqXY33+R/kP1bQ+PHlwOG7hEMIeGlwRt9Vn83t2z1HJVXkZWtRWueg+yVaJZSERofQT
 GNZLG5f9MUeg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 07:53:46 -0700
IronPort-SDR: hBkuUtQL8+lhTWXLYi651EBCBrGOEnQVfzIuldPKgK9Hg1HqC5sQmkx3kq2cejv4s2HjL2N4xD
 LCQ6U6PgIXpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; d="scan'208";a="382567032"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2020 07:53:46 -0700
Date: Mon, 15 Jun 2020 07:53:46 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 00/12] x86: tag application address space for devices
Message-ID: <20200615145345.GA13792@romley-ivt3.sc.intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <20200615075202.GI2497@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615075202.GI2497@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: Dave Hansen <dave.hansen@intel.com>, H Peter Anvin <hpa@zytor.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86 <x86@kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, Ingo Molnar <mingo@redhat.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Sohil Mehta <sohil.mehta@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tony Luck <tony.luck@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Peter,
On Mon, Jun 15, 2020 at 09:52:02AM +0200, Peter Zijlstra wrote:
> On Fri, Jun 12, 2020 at 05:41:21PM -0700, Fenghua Yu wrote:
> 
> > This series only provides simple and basic support for ENQCMD and the MSR:
> > 1. Clean up type definitions (patch 1-3). These patches can be in a
> >    separate series.
> >    - Define "pasid" as "unsigned int" consistently (patch 1 and 2).
> >    - Define "flags" as "unsigned int"
> > 2. Explain different various technical terms used in the series (patch 4).
> > 3. Enumerate support for ENQCMD in the processor (patch 5).
> > 4. Handle FPU PASID state and the MSR during context switch (patches 6-7).
> > 5. Define "pasid" in mm_struct (patch 8).
> > 5. Clear PASID state for new mm and forked and cloned thread (patch 9-10).
> > 6. Allocate and free PASID for a process (patch 11).
> > 7. Fix up the PASID MSR in #GP handler when one thread in a process
> >    executes ENQCMD for the first time (patches 12).
> 
> If this is per mm, should not switch_mm() update the MSR ? I'm not
> seeing that, nor do I see it explained why not.

PASID value is per mm and all threads in a process have the same PASID
value in the MSR. However, the MSR is per thread and is context switched
by XSAVES/XRSTROS in patches 6-7.

Thanks.

-Fenghua
