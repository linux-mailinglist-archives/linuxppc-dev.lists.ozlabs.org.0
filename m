Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F0E75FCD6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:01:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=iUh3Wr2E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8mf12mNfz30Kf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:01:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=iUh3Wr2E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3nk6-zaykdlcpbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8md53sD7z2yVM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:00:39 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2683548c37cso3875a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690218036; x=1690822836;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RiFFb9olEr1IXMurVCQB0i8J9xB8UVFiN6yE37xYj5w=;
        b=iUh3Wr2Es7ZayOSlRIyCXv0ISRPLliUqI/wxpz9npizX1RGnl3Zt97AZrYUR8pVjnH
         OwuM0g2/mnG2Ws1vH1RTNrF8tqURzEVkr4hahdERkph4Nww3rEaO/unCqdjsW1luIjbU
         y9Vd6q8CcxdQP+GEmRHglSZNO6vM+UxAwTBpxBMCbqTq0hlf3MD2sKnPBjpHoFEjKPFr
         Tmb3ea8A/X/JO92m7TD8v5eZc4l7fpKAQniXW7MS+8KISe8P4Nbdl//npN/iD7LNKC4a
         rVBOiRv2FN5pQA6p+V2In5eaYYH21fAVeDedlt36+Mezc1EEot9BPPcgeqHdCs8LHv6O
         cdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690218036; x=1690822836;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RiFFb9olEr1IXMurVCQB0i8J9xB8UVFiN6yE37xYj5w=;
        b=YkIhq3eeRs4m9x/L8FS7xrrfip1Z6v/Gxe0RNmbJrMJiGVM4y9rhiQiVrVGDbjME5z
         TrS7clPPnsVFOLJBqkK/XnNoY5VT4BP19gmBbRms2tbtp9jYmk4x4d1N+LKfxdsXJHCx
         cmCjpI3nM4dXImGM16E9pz+LyPt2wcXaHtigLaiWI5zNOqMoi6H0NIDvzZnfLTik7rvo
         BMKaGJaxjsOqfvF45ZqA5OytZtq0mr01l7JbhYln6rwxAW3St8TRTOX92UC4HURlPr9A
         kwMHTGGjrff1TBXkooQxlYXewkh6XqLwXqG2X3XkFUNcNfEmprly/7mXEbdBegvtvByn
         4V5w==
X-Gm-Message-State: ABy/qLY1alSaZDBxVbHUuhChHoXhiF5uh0/5Z38lk1gR4q6JuZVUcXmp
	kj5GFnKlY8etZdfvqj7eW+7f63XbERo=
X-Google-Smtp-Source: APBJJlGFNY8Nsd+UpmzZCGDOgI47OKk03bkzsFP32ko2G/RNTdNXayC/49Rk0sPPfbjIVmYJcM3mAoRuscc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2308:b0:1b8:80c9:a98e with SMTP id
 d8-20020a170903230800b001b880c9a98emr42778plh.13.1690218036394; Mon, 24 Jul
 2023 10:00:36 -0700 (PDT)
Date: Mon, 24 Jul 2023 10:00:34 -0700
In-Reply-To: <110f1aa0-7fcd-1287-701a-89c2203f0ac2@amd.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <110f1aa0-7fcd-1287-701a-89c2203f0ac2@amd.com>
Message-ID: <ZL6uMk/8UeuGj8CP@google.com>
Subject: Re: [RFC PATCH v11 00/29] KVM: guest_memfd() and per-page attributes
From: Sean Christopherson <seanjc@google.com>
To: "Nikunj A. Dadhania" <nikunj@amd.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 24, 2023, Nikunj A. Dadhania wrote:
> On 7/19/2023 5:14 AM, Sean Christopherson wrote:
> > This is the next iteration of implementing fd-based (instead of vma-based)
> > memory for KVM guests.  If you want the full background of why we are doing
> > this, please go read the v10 cover letter[1].
> > 
> > The biggest change from v10 is to implement the backing storage in KVM
> > itself, and expose it via a KVM ioctl() instead of a "generic" sycall.
> > See link[2] for details on why we pivoted to a KVM-specific approach.
> > 
> > Key word is "biggest".  Relative to v10, there are many big changes.
> > Highlights below (I can't remember everything that got changed at
> > this point).
> > 
> > Tagged RFC as there are a lot of empty changelogs, and a lot of missing
> > documentation.  And ideally, we'll have even more tests before merging.
> > There are also several gaps/opens (to be discussed in tomorrow's PUCK).
> 
> As per our discussion on the PUCK call, here are the memory/NUMA accounting 
> related observations that I had while working on SNP guest secure page migration:
> 
> * gmem allocations are currently treated as file page allocations
>   accounted to the kernel and not to the QEMU process.

We need to level set on terminology: these are all *stats*, not accounting.  That
distinction matters because we have wiggle room on stats, e.g. we can probably get
away with just about any definition of how guest_memfd memory impacts stats, so
long as the information that is surfaced to userspace is useful and expected.

But we absolutely need to get accounting correct, specifically the allocations
need to be correctly accounted in memcg.  And unless I'm missing something,
nothing in here shows anything related to memcg.

>   Starting an SNP guest with 40G memory with memory interleave between
>   Node2 and Node3
> 
>   $ numactl -i 2,3 ./bootg_snp.sh
> 
>     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
>  242179 root      20   0   40.4g  99580  51676 S  78.0   0.0   0:56.58 qemu-system-x86
> 
>   -> Incorrect process resident memory and shared memory is reported

I don't know that I would call these "incorrect".  Shared memory definitely is
correct, because by definition guest_memfd isn't shared.  RSS is less clear cut;
gmem memory is resident in RAM, but if we show gmem in RSS then we'll end up with
scenarios where RSS > VIRT, which will be quite confusing for unaware users (I'm
assuming the 40g of VIRT here comes from QEMU mapping the shared half of gmem
memslots).

>   Accounting of the memory happens in the host page fault handler path,
>   but for private guest pages we will never hit that.
> 
> * NUMA allocation does use the process mempolicy for appropriate node 
>   allocation (Node2 and Node3), but they again do not get attributed to 
>   the QEMU process
> 
>   Every 1.0s: sudo numastat  -m -p qemu-system-x86 | egrep -i "qemu|PID|Node|Filepage"   gomati: Mon Jul 24 11:51:34 2023
> 
>   Per-node process memory usage (in MBs)
>   PID                               Node 0          Node 1          Node 2          Node 3           Total
>   242179 (qemu-system-x86)           21.14            1.61           39.44           39.38          101.57
>   Per-node system memory usage (in MBs):
>                             Node 0          Node 1          Node 2          Node 3           Total
>   FilePages                2475.63         2395.83        23999.46        23373.22        52244.14
> 
> 
> * Most of the memory accounting relies on the VMAs and as private-fd of 
>   gmem doesn't have a VMA(and that was the design goal), user-space fails 
>   to attribute the memory appropriately to the process.
>
>   /proc/<qemu pid>/numa_maps
>   7f528be00000 interleave:2-3 file=/memfd:memory-backend-memfd-shared\040(deleted) anon=1070 dirty=1070 mapped=1987 mapmax=256 active=1956 N2=582 N3=1405 kernelpagesize_kB=4
>   7f5c90200000 interleave:2-3 file=/memfd:rom-backend-memfd-shared\040(deleted)
>   7f5c90400000 interleave:2-3 file=/memfd:rom-backend-memfd-shared\040(deleted) dirty=32 active=0 N2=32 kernelpagesize_kB=4
>   7f5c90800000 interleave:2-3 file=/memfd:rom-backend-memfd-shared\040(deleted) dirty=892 active=0 N2=512 N3=380 kernelpagesize_kB=4
> 
>   /proc/<qemu pid>/smaps
>   7f528be00000-7f5c8be00000 rw-p 00000000 00:01 26629                      /memfd:memory-backend-memfd-shared (deleted)
>   7f5c90200000-7f5c90220000 rw-s 00000000 00:01 44033                      /memfd:rom-backend-memfd-shared (deleted)
>   7f5c90400000-7f5c90420000 rw-s 00000000 00:01 44032                      /memfd:rom-backend-memfd-shared (deleted)
>   7f5c90800000-7f5c90b7c000 rw-s 00000000 00:01 1025                       /memfd:rom-backend-memfd-shared (deleted)

This is all expected, and IMO correct.  There are no userspace mappings, and so
not accounting anything is working as intended.

> * QEMU based NUMA bindings will not work. Memory backend uses mbind() 
>   to set the policy for a particular virtual memory range but gmem 
>   private-FD does not have a virtual memory range visible in the host.

Yes, adding a generic fbind() is the way to solve silve.
