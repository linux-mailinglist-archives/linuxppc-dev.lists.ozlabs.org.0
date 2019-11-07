Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B7DF2891
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 09:00:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477wmY6mtmzF3GK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 18:59:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477wd72sTHzF15Z
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 18:53:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="btTM+JO9"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 477snc6KMbz9sWx; Thu,  7 Nov 2019 16:45:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1573105540; bh=v04gpqPuQsMYJe1XTEi01nFH99poTytMgQDqvHAql10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=btTM+JO9ec0tnAra1rxspTAzuX4dmHSwx5F3iPKpRDE1Dyy7H2lCI89oVQBvfAAQ6
 ur1klG5Ekm5jzpUWTLAyOyJfJYPs4n1XrxybuX7LMqvepoNxTZMhhRZjboNtJJLraS
 L3rUCeqJ/N28fmgLbr+39yfvgI3hDzdJJEeHAEzXTsWT67aUSTjT2TrM9FRmsb2ZX+
 Dz+9847F24kuYlHhFHYRBvoYF5KLRww2/hDpxO5JiiYWtSEecVc8c34OzzZdGNegYn
 v0ZcRc24HBfiQUQXgmKhdq5Xpou5e2aLTaQ7WnAZ4YuiA/kofjJz6JiuTee/DVEPZ2
 FauPmtkkfgc8g==
Date: Thu, 7 Nov 2019 16:45:35 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v10 1/8] mm: ksm: Export ksm_madvise()
Message-ID: <20191107054535.GA2882@oak.ozlabs.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-2-bharata@linux.ibm.com>
 <20191106043329.GB12069@oak.ozlabs.ibm.com>
 <20191106064542.GB21634@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106064542.GB21634@in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 06, 2019 at 12:15:42PM +0530, Bharata B Rao wrote:
> On Wed, Nov 06, 2019 at 03:33:29PM +1100, Paul Mackerras wrote:
> > On Mon, Nov 04, 2019 at 09:47:53AM +0530, Bharata B Rao wrote:
> > > KVM PPC module needs ksm_madvise() for supporting secure guests.
> > > Guest pages that become secure are represented as device private
> > > pages in the host. Such pages shouldn't participate in KSM merging.
> > 
> > If we don't do the ksm_madvise call, then as far as I can tell, it
> > should all still work correctly, but we might have KSM pulling pages
> > in unnecessarily, causing a reduction in performance.  Is that right?
> 
> I thought so too. When KSM tries to merge a secure page, it should
> cause a fault resulting in page-out the secure page. However I see
> the below crash when KSM is enabled and KSM scan tries to kmap and
> memcmp the device private page.
> 
> BUG: Unable to handle kernel data access at 0xc007fffe00010000
> Faulting instruction address: 0xc0000000000ab5a0
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
> Modules linked in:
> CPU: 0 PID: 22 Comm: ksmd Not tainted 5.4.0-rc2-00026-g2249c0ae4a53-dirty #376
> NIP:  c0000000000ab5a0 LR: c0000000003d7c3c CTR: 0000000000000004
> REGS: c0000001c85d79b0 TRAP: 0300   Not tainted  (5.4.0-rc2-00026-g2249c0ae4a53-dirty)
> MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24002242  XER: 20040000
> CFAR: c0000000000ab3d0 DAR: c007fffe00010000 DSISR: 40000000 IRQMASK: 0 
> GPR00: 0000000000000004 c0000001c85d7c40 c0000000018ce000 c0000001c3880000 
> GPR04: c007fffe00010000 0000000000010000 0000000000000000 ffffffffffffffff 
> GPR08: c000000001992298 0000603820002138 ffffffffffffffff ffffffff00003a69 
> GPR12: 0000000024002242 c000000002550000 c0000001c8700000 c00000000179b728 
> GPR16: c00c01ffff800040 c00000000179b5b8 c00c00000070e200 ffffffffffffffff 
> GPR20: 0000000000000000 0000000000000000 fffffffffffff000 c00000000179b648 
> GPR24: c0000000024464a0 c00000000249f568 c000000001118918 0000000000000000 
> GPR28: c0000001c804c590 c00000000249f518 0000000000000000 c0000001c8700000 
> NIP [c0000000000ab5a0] memcmp+0x320/0x6a0
> LR [c0000000003d7c3c] memcmp_pages+0x8c/0xe0
> Call Trace:
> [c0000001c85d7c40] [c0000001c804c590] 0xc0000001c804c590 (unreliable)
> [c0000001c85d7c70] [c0000000004591d0] ksm_scan_thread+0x960/0x21b0
> [c0000001c85d7db0] [c0000000001bf328] kthread+0x198/0x1a0
> [c0000001c85d7e20] [c00000000000bfbc] ret_from_kernel_thread+0x5c/0x80
> Instruction dump:
> ebc1fff0 eba1ffe8 eb81ffe0 eb61ffd8 4e800020 38600001 4d810020 3860ffff 
> 4e800020 38000004 7c0903a6 7d201c28 <7d402428> 7c295040 38630008 38840008 

Hmmm, that seems like a bug in the ZONE_DEVICE stuff generally.  All
that ksm is doing as far as I can see is follow_page() and
kmap_atomic().  I wonder how many other places in the kernel might
also be prone to crashing if they try to touch device pages?

> In anycase, we wouldn't want secure guests pages to be pulled out due
> to KSM, hence disabled merging.

Sure, I don't disagree with that, but I worry that we are papering
over a bug here.

Paul.
