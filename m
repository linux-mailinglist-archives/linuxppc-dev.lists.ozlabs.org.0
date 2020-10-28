Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8649D29CFE4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 13:24:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLnn54xGtzDqTy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 23:24:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=1im01t3j; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLnl7577wzDqFM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 23:22:27 +1100 (AEDT)
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A1702470A;
 Wed, 28 Oct 2020 12:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603887744;
 bh=Lr1BM+VW6ajXZ7BXxVkd5/Y50jW7UBQ7IyfJE4pxvbc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1im01t3jg6XLnQ4t88jFGyjzvs+ZIk4/rFUDH74Y7mcgp2hP2qxTFC8UySBuUYtE9
 u6gUgHROWu15mNV2JA7LSO7BQZVSuhi5Y33PU4pj91Fm+m4ekLRfSEgCkjbLtBEgrv
 IAOdJsmH151mptkBB/WbzhQhvbykxlMVYr1bucrs=
Date: Wed, 28 Oct 2020 14:22:09 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Message-ID: <20201028122209.GH1428094@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
 <20201027083816.GG1154158@kernel.org>
 <e5fc62b6-f644-4ed5-de5b-ffd8337861e4@redhat.com>
 <20201028110945.GE1428094@kernel.org>
 <5805fdd9-14e5-141c-773b-c46d2da57258@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5805fdd9-14e5-141c-773b-c46d2da57258@redhat.com>
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
Cc: "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "cl@linux.com" <cl@linux.com>, "will@kernel.org" <will@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "rientjes@google.com" <rientjes@google.com>, "Brown,
 Len" <len.brown@intel.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 28, 2020 at 12:17:35PM +0100, David Hildenbrand wrote:
> On 28.10.20 12:09, Mike Rapoport wrote:
> > On Tue, Oct 27, 2020 at 09:46:35AM +0100, David Hildenbrand wrote:
> > > On 27.10.20 09:38, Mike Rapoport wrote:
> > > > On Mon, Oct 26, 2020 at 06:05:30PM +0000, Edgecombe, Rick P wrote:
> > > > 
> > > > > Beyond whatever you are seeing, for the latter case of new things
> > > > > getting introduced to an interface with hidden dependencies... Another
> > > > > edge case could be a new caller to set_memory_np() could result in
> > > > > large NP pages. None of the callers today should cause this AFAICT, but
> > > > > it's not great to rely on the callers to know these details.
> > 
> > > > A caller of set_memory_*() or set_direct_map_*() should expect a failure
> > > > and be ready for that. So adding a WARN to safe_copy_page() is the first
> > > > step in that direction :)
> > > > 
> > > 
> > > I am probably missing something important, but why are we saving/restoring
> > > the content of pages that were explicitly removed from the identity mapping
> > > such that nobody will access them?
> > 
> > Actually, we should not be saving/restoring free pages during
> > hibernation as there are several calls to mark_free_pages() that should
> > exclude the free pages from the snapshot. I've tried to find why the fix
> > that maps/unmaps a page to save it was required at the first place, but
> > I could not find bug reports.
> > 
> > The closest I've got is an email from Rafael that asked to update
> > "hibernate: handle DEBUG_PAGEALLOC" patch:
> > 
> > https://lore.kernel.org/linux-pm/200802200133.44098.rjw@sisk.pl/
> > 
> > Could it be that safe_copy_page() tries to workaround a non-existent
> > problem?
> > 
> 
> Clould be! Also see
> 
> https://lkml.kernel.org/r/38de5bb0-5559-d069-0ce0-daec66ef2746@suse.cz
> 
> which restores free page content based on more kernel parameters, not based
> on the original content.

Ah, after looking at it now I've run kernel with DEBUG_PAGEALLOC=y and
CONFIG_INIT_ON_FREE_DEFAULT_ON=y and restore crahsed nicely.

[   27.210093] PM: Image successfully loaded
[   27.226709] Disabling non-boot CPUs ...                                      
[   27.231208] smpboot: CPU 1 is now offline                                    
[   27.363926] kvm-clock: cpu 0, msr 5c889001, primary cpu clock, resume        
[   27.363995] BUG: unable to handle page fault for address: ffff9f7a40108000   
[   27.367996] #PF: supervisor write access in kernel mode                      
[   27.369558] #PF: error_code(0x0002) - not-present page                       
[   27.371098] PGD 5ca01067 P4D 5ca01067 PUD 5ca02067 PMD 5ca03067 PTE 800ffffff
fef7060                                                                         
[   27.373421] Oops: 0002 [#1] SMP DEBUG_PAGEALLOC PTI                          
[   27.374905] CPU: 0 PID: 1200 Comm: bash Not tainted 5.10.0-rc1 #5            
[   27.376700] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14
.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014                                 
[   27.379879] RIP: 0010:clear_page_rep+0x7/0x10          
[   27.381218] Code: e8 be 88 75 00 44 89 e2 48 89 ee 48 89 df e8 60 ff ff ff c6
 03 00 5b 5d 41 5c c3 cc cc cc cc cc cc cc cc b9 00 02 00 00 31 c0 <f3> 48 ab c3
 0f 1f 44 00 00 31 c0 b9 40 00 00 00 66 0f 1f 84 00 00                          
[   27.386457] RSP: 0018:ffffb6838046be08 EFLAGS: 00010046                      
[   27.388011] RAX: 0000000000000000 RBX: ffff9f7a487c0ec0 RCX: 0000000000000200
[   27.390082] RDX: ffff9f7a4c788000 RSI: 0000000000000000 RDI: ffff9f7a40108000
[   27.392138] RBP: ffffffff8629c860 R08: 0000000000000000 R09: 0000000000000007
[   27.394205] R10: 0000000000000004 R11: ffffb6838046bbf8 R12: 0000000000000000
[   27.396271] R13: ffff9f7a419a62a0 R14: 0000000000000005 R15: ffff9f7a484f4da0
[   27.398334] FS:  00007fe0c3f6a700(0000) GS:ffff9f7abf800000(0000) knlGS:0000000000000000                                                                     
[   27.400717] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033                
[   27.402432] CR2: ffff9f7a40108000 CR3: 000000000859a001 CR4: 0000000000060ef0
[   27.404485] Call Trace:                                                      
[   27.405326]  clear_free_pages+0xf5/0x150                                     
[   27.406568]  hibernation_snapshot+0x390/0x3d0                                
[   27.407908]  hibernate+0xdb/0x240                                            
[   27.408978]  state_store+0xd7/0xe0                                           
[   27.410078]  kernfs_fop_write+0x10e/0x1a0                                    
[   27.411333]  vfs_write+0xbb/0x210                                            
[   27.412423]  ksys_write+0x9c/0xd0                      
[   27.413488]  do_syscall_64+0x33/0x40                                         
[   27.414636]  entry_SYSCALL_64_after_hwframe+0x44/0xa9                        
[   27.416150] RIP: 0033:0x7fe0c364e380                                         
 66 0f 1f 44 00 00 83 3d c9 23 2d 00 00 75 10 b8 01 00 00 00 0f 05 <48> 3d 01 f0
 ff ff 73 31 c3 48 83 ec 08 e8 fe dd 01 00 48 89 04 24
[   27.422500] RSP: 002b:00007ffeb64bd0c8 EFLAGS: 00000246 ORIG_RAX: 00000000000
00001
[   27.424724] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007fe0c364e380
[   27.426761] RDX: 0000000000000005 RSI: 0000000001eb6408 RDI: 0000000000000001
[   27.428791] RBP: 0000000001eb6408 R08: 00007fe0c391d780 R09: 00007fe0c3f6a700
[   27.430863] R10: 0000000000000004 R11: 0000000000000246 R12: 0000000000000005
[   27.432920] R13: 0000000000000001 R14: 00007fe0c391c620 R15: 0000000000000000
[   27.434989] Modules linked in:
[   27.436004] CR2: ffff9f7a40108000
[   27.437075] ---[ end trace 424c466bcd2bfcad ]---



> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.
