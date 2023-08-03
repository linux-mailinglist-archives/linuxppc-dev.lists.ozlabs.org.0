Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 668B876E657
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 13:04:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Zk1HY4iM;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZJe2RSlX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGmFP3bMRz3btp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 21:04:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Zk1HY4iM;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZJe2RSlX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=suse.cz (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGmDX1w7yz3bNq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 21:03:37 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C5EC421980;
	Thu,  3 Aug 2023 11:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1691060607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELFTahEoHWF3OWY1nmXyZ3K1aLk6cFNvnoHkAihu/Mw=;
	b=Zk1HY4iMRP9uheCuU2Gwd5DiqLAsx6L/pbJrWVbGs2G5tg+EI9ElS+gE66dB2FTHm11UF8
	qWgiTyTJQ7yRAiBtoBdi2fqPMtREOO8my04MU6Xu8b+lwvm6aj++D29U6Bm4b38Thm1sQ5
	PdGs2uwSRTJt8ojn16bv8gGCtOwUUxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1691060607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELFTahEoHWF3OWY1nmXyZ3K1aLk6cFNvnoHkAihu/Mw=;
	b=ZJe2RSlXii++jrPpaFNL6iXhx+JwVqn0T8np7kqzxyJSLwbPFRd7+wdefPUF3yIddEHPpo
	hddKSxL+A16bWFAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34D39134B0;
	Thu,  3 Aug 2023 11:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id VY8NDH+Jy2RAJQAAMHmgww
	(envelope-from <vbabka@suse.cz>); Thu, 03 Aug 2023 11:03:27 +0000
Message-ID: <d6ee67a2-b5b9-7287-bc62-b250c1872ed5@suse.cz>
Date: Thu, 3 Aug 2023 13:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC PATCH v11 00/29] KVM: guest_memfd() and per-page attributes
Content-Language: en-US
To: nikunj@amd.com, Sean Christopherson <seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <110f1aa0-7fcd-1287-701a-89c2203f0ac2@amd.com> <ZL6uMk/8UeuGj8CP@google.com>
 <2f98a32c-bd3d-4890-b757-4d2f67a3b1a7@amd.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <2f98a32c-bd3d-4890-b757-4d2f67a3b1a7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, l
 inux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/26/23 13:20, Nikunj A. Dadhania wrote:
> Hi Sean,
> 
> On 7/24/2023 10:30 PM, Sean Christopherson wrote:
>> On Mon, Jul 24, 2023, Nikunj A. Dadhania wrote:
>>> On 7/19/2023 5:14 AM, Sean Christopherson wrote:
>>>> This is the next iteration of implementing fd-based (instead of vma-based)
>>>> memory for KVM guests.  If you want the full background of why we are doing
>>>> this, please go read the v10 cover letter[1].
>>>>
>>>> The biggest change from v10 is to implement the backing storage in KVM
>>>> itself, and expose it via a KVM ioctl() instead of a "generic" sycall.
>>>> See link[2] for details on why we pivoted to a KVM-specific approach.
>>>>
>>>> Key word is "biggest".  Relative to v10, there are many big changes.
>>>> Highlights below (I can't remember everything that got changed at
>>>> this point).
>>>>
>>>> Tagged RFC as there are a lot of empty changelogs, and a lot of missing
>>>> documentation.  And ideally, we'll have even more tests before merging.
>>>> There are also several gaps/opens (to be discussed in tomorrow's PUCK).
>>>
>>> As per our discussion on the PUCK call, here are the memory/NUMA accounting 
>>> related observations that I had while working on SNP guest secure page migration:
>>>
>>> * gmem allocations are currently treated as file page allocations
>>>   accounted to the kernel and not to the QEMU process.
>> 
>> We need to level set on terminology: these are all *stats*, not accounting.  That
>> distinction matters because we have wiggle room on stats, e.g. we can probably get
>> away with just about any definition of how guest_memfd memory impacts stats, so
>> long as the information that is surfaced to userspace is useful and expected.
>> 
>> But we absolutely need to get accounting correct, specifically the allocations
>> need to be correctly accounted in memcg.  And unless I'm missing something,
>> nothing in here shows anything related to memcg.
> 
> I tried out memcg after creating a separate cgroup for the qemu process. Guest 
> memory is accounted in memcg.
> 
>   $ egrep -w "file|file_thp|unevictable" memory.stat
>   file 42978775040
>   file_thp 42949672960
>   unevictable 42953588736 
> 
> NUMA allocations are coming from right nodes as set by the numactl.
> 
>   $ egrep -w "file|file_thp|unevictable" memory.numa_stat
>   file N0=0 N1=20480 N2=21489377280 N3=21489377280
>   file_thp N0=0 N1=0 N2=21472739328 N3=21476933632
>   unevictable N0=0 N1=0 N2=21474697216 N3=21478891520
> 
>> 
>>>   Starting an SNP guest with 40G memory with memory interleave between
>>>   Node2 and Node3
>>>
>>>   $ numactl -i 2,3 ./bootg_snp.sh
>>>
>>>     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
>>>  242179 root      20   0   40.4g  99580  51676 S  78.0   0.0   0:56.58 qemu-system-x86
>>>
>>>   -> Incorrect process resident memory and shared memory is reported
>> 
>> I don't know that I would call these "incorrect".  Shared memory definitely is
>> correct, because by definition guest_memfd isn't shared.  RSS is less clear cut;
>> gmem memory is resident in RAM, but if we show gmem in RSS then we'll end up with
>> scenarios where RSS > VIRT, which will be quite confusing for unaware users (I'm
>> assuming the 40g of VIRT here comes from QEMU mapping the shared half of gmem
>> memslots).
> 
> I am not sure why will RSS exceed the VIRT, it should be at max 40G (assuming all the
> memory is private)
> 
> As per my experiments with a hack below. MM_FILEPAGES does get accounted to RSS/SHR in top
> 
>     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
>    4339 root      20   0   40.4g  40.1g  40.1g S  76.7  16.0   0:13.83 qemu-system-x86
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index f456f3b5049c..5b1f48a2e714 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -166,6 +166,7 @@ void mm_trace_rss_stat(struct mm_struct *mm, int member)
>  {
>         trace_rss_stat(mm, member);
>  }
> +EXPORT_SYMBOL(mm_trace_rss_stat);
> 
>  /*
>   * Note: this doesn't free the actual pages themselves. That
> diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
> index a7e926af4255..e4f268bf9ce2 100644
> --- a/virt/kvm/guest_mem.c
> +++ b/virt/kvm/guest_mem.c
> @@ -91,6 +91,10 @@ static struct folio *kvm_gmem_get_folio(struct file *file, pgoff_t index)
>                         clear_highpage(folio_page(folio, i));
>         }
> 
> +       /* Account only once for the first time */
> +       if (!folio_test_dirty(folio))
> +               add_mm_counter(current->mm, MM_FILEPAGES, folio_nr_pages(folio));

I think this alone would cause "Bad rss-counter" messages when the process
exits, because there's no corresponding decrement when page tables are torn
down. We would probably have to instantiate the page tables (i.e. with
PROT_NONE so userspace can't really do accesses through them) for this to
work properly.

So then it wouldn't technically be "unmapped private memory" anymore, but
effectively still would be. Maybe there would be more benefits, like the
mbind() working. But where would the PROT_NONE page tables be instantiated
if there's no page fault? During the ioctl? And is perhaps too much (CPU)
work for little benefit? Maybe, but we could say it makes things simpler and
can be optimized later?

Anyway IMHO it would be really great if the memory usage was attributable
the usual way without new IOCTLs or something. Each time some memory appears
"unaccounted" somewhere, it causes confusion.

> +
>         folio_mark_accessed(folio);
>         folio_mark_dirty(folio);
>         folio_mark_uptodate(folio);
> 
> We can update the rss_stat appropriately to get correct reporting in userspace.
> 
>>>   Accounting of the memory happens in the host page fault handler path,
>>>   but for private guest pages we will never hit that.
>>>
>>> * NUMA allocation does use the process mempolicy for appropriate node 
>>>   allocation (Node2 and Node3), but they again do not get attributed to 
>>>   the QEMU process
>>>
>>>   Every 1.0s: sudo numastat  -m -p qemu-system-x86 | egrep -i "qemu|PID|Node|Filepage"   gomati: Mon Jul 24 11:51:34 2023
>>>
>>>   Per-node process memory usage (in MBs)
>>>   PID                               Node 0          Node 1          Node 2          Node 3           Total
>>>   242179 (qemu-system-x86)           21.14            1.61           39.44           39.38          101.57
>>>
>>>   Per-node system memory usage (in MBs):
>>>                             Node 0          Node 1          Node 2          Node 3           Total
>>>   FilePages                2475.63         2395.83        23999.46        23373.22        52244.14
>>>
>>>
>>> * Most of the memory accounting relies on the VMAs and as private-fd of 
>>>   gmem doesn't have a VMA(and that was the design goal), user-space fails 
>>>   to attribute the memory appropriately to the process.
>>>
>>>   /proc/<qemu pid>/numa_maps
>>>   7f528be00000 interleave:2-3 file=/memfd:memory-backend-memfd-shared\040(deleted) anon=1070 dirty=1070 mapped=1987 mapmax=256 active=1956 N2=582 N3=1405 kernelpagesize_kB=4
>>>   7f5c90200000 interleave:2-3 file=/memfd:rom-backend-memfd-shared\040(deleted)
>>>   7f5c90400000 interleave:2-3 file=/memfd:rom-backend-memfd-shared\040(deleted) dirty=32 active=0 N2=32 kernelpagesize_kB=4
>>>   7f5c90800000 interleave:2-3 file=/memfd:rom-backend-memfd-shared\040(deleted) dirty=892 active=0 N2=512 N3=380 kernelpagesize_kB=4
>>>
>>>   /proc/<qemu pid>/smaps
>>>   7f528be00000-7f5c8be00000 rw-p 00000000 00:01 26629                      /memfd:memory-backend-memfd-shared (deleted)
>>>   7f5c90200000-7f5c90220000 rw-s 00000000 00:01 44033                      /memfd:rom-backend-memfd-shared (deleted)
>>>   7f5c90400000-7f5c90420000 rw-s 00000000 00:01 44032                      /memfd:rom-backend-memfd-shared (deleted)
>>>   7f5c90800000-7f5c90b7c000 rw-s 00000000 00:01 1025                       /memfd:rom-backend-memfd-shared (deleted)
>> 
>> This is all expected, and IMO correct.  There are no userspace mappings, and so
>> not accounting anything is working as intended.
> Doesn't sound that correct, if 10 SNP guests are running each using 10GB, how would we know who is using 100GB of memory?
> 
>> 
>>> * QEMU based NUMA bindings will not work. Memory backend uses mbind() 
>>>   to set the policy for a particular virtual memory range but gmem 
>>>   private-FD does not have a virtual memory range visible in the host.
>> 
>> Yes, adding a generic fbind() is the way to solve silve.
> 
> Regards,
> Nikunj
> 

