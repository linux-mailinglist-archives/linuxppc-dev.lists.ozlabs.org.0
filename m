Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E301E374A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 06:28:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WyWn4BzkzDqVF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 14:28:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WyLj6q0pzDqRw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 14:21:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Uuow4kSI; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49WyLh5X25z9sSd; Wed, 27 May 2020 14:21:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1590553260; bh=cwG4p+fURpnXHo+TvskpLnMDdkg5NzfuxIxjhvAlZBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uuow4kSIZoBpudeIAEjeRUhg6WZ/qKlgzuTlrmt7o1LcuYWuviCtfSzgYEdaCVTDf
 HAujJrHQXHdA0LzSL8BShz4enX0Vd4uuPREjUq+a+z0B/fgwO2PFq6AWXHr8Q5NDPq
 lqZbFHZy4loznYFO8KrR6x4ud3PsAqRkMxXOJOHhdpYGqntmDbd9EsxLiCMkGbjIJ7
 civPT9ubEaEe0bvn2Atua3R8FbSDPEPpOnnFiOjL9Q/Za6Mrzlmfuj3cG2FGUgJD6z
 uR7jXTJwQnTnhXHn50MT6Df5rSaZMpV4OsQgdjlLJw/VPlTNhcuHiJzSB6Af23sprs
 b/mgQEtnVQbOA==
Date: Wed, 27 May 2020 14:19:53 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] powerpc/kvm/radix: ignore kmemleak false positives
Message-ID: <20200527041953.GF293451@thinks.paulus.ozlabs.org>
References: <20200513133915.1040-1-cai@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513133915.1040-1-cai@lca.pw>
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 catalin.marinas@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 13, 2020 at 09:39:15AM -0400, Qian Cai wrote:
> kvmppc_pmd_alloc() and kvmppc_pte_alloc() allocate some memory but then
> pud_populate() and pmd_populate() will use __pa() to reference the newly
> allocated memory.
> 
> Since kmemleak is unable to track the physical memory resulting in false
> positives, silence those by using kmemleak_ignore().
> 
> unreferenced object 0xc000201c382a1000 (size 4096):
>  comm "qemu-kvm", pid 124828, jiffies 4295733767 (age 341.250s)
>  hex dump (first 32 bytes):
>    c0 00 20 09 f4 60 03 87 c0 00 20 10 72 a0 03 87  .. ..`.... .r...
>    c0 00 20 0e 13 a0 03 87 c0 00 20 1b dc c0 03 87  .. ....... .....
>  backtrace:
>    [<000000004cc2790f>] kvmppc_create_pte+0x838/0xd20 [kvm_hv]
>    kvmppc_pmd_alloc at arch/powerpc/kvm/book3s_64_mmu_radix.c:366
>    (inlined by) kvmppc_create_pte at arch/powerpc/kvm/book3s_64_mmu_radix.c:590
>    [<00000000d123c49a>] kvmppc_book3s_instantiate_page+0x2e0/0x8c0 [kvm_hv]
>    [<00000000bb549087>] kvmppc_book3s_radix_page_fault+0x1b4/0x2b0 [kvm_hv]
>    [<0000000086dddc0e>] kvmppc_book3s_hv_page_fault+0x214/0x12a0 [kvm_hv]
>    [<000000005ae9ccc2>] kvmppc_vcpu_run_hv+0xc5c/0x15f0 [kvm_hv]
>    [<00000000d22162ff>] kvmppc_vcpu_run+0x34/0x48 [kvm]
>    [<00000000d6953bc4>] kvm_arch_vcpu_ioctl_run+0x314/0x420 [kvm]
>    [<000000002543dd54>] kvm_vcpu_ioctl+0x33c/0x950 [kvm]
>    [<0000000048155cd6>] ksys_ioctl+0xd8/0x130
>    [<0000000041ffeaa7>] sys_ioctl+0x28/0x40
>    [<000000004afc4310>] system_call_exception+0x114/0x1e0
>    [<00000000fb70a873>] system_call_common+0xf0/0x278
> unreferenced object 0xc0002001f0c03900 (size 256):
>  comm "qemu-kvm", pid 124830, jiffies 4295735235 (age 326.570s)
>  hex dump (first 32 bytes):
>    c0 00 20 10 fa a0 03 87 c0 00 20 10 fa a1 03 87  .. ....... .....
>    c0 00 20 10 fa a2 03 87 c0 00 20 10 fa a3 03 87  .. ....... .....
>  backtrace:
>    [<0000000023f675b8>] kvmppc_create_pte+0x854/0xd20 [kvm_hv]
>    kvmppc_pte_alloc at arch/powerpc/kvm/book3s_64_mmu_radix.c:356
>    (inlined by) kvmppc_create_pte at arch/powerpc/kvm/book3s_64_mmu_radix.c:593
>    [<00000000d123c49a>] kvmppc_book3s_instantiate_page+0x2e0/0x8c0 [kvm_hv]
>    [<00000000bb549087>] kvmppc_book3s_radix_page_fault+0x1b4/0x2b0 [kvm_hv]
>    [<0000000086dddc0e>] kvmppc_book3s_hv_page_fault+0x214/0x12a0 [kvm_hv]
>    [<000000005ae9ccc2>] kvmppc_vcpu_run_hv+0xc5c/0x15f0 [kvm_hv]
>    [<00000000d22162ff>] kvmppc_vcpu_run+0x34/0x48 [kvm]
>    [<00000000d6953bc4>] kvm_arch_vcpu_ioctl_run+0x314/0x420 [kvm]
>    [<000000002543dd54>] kvm_vcpu_ioctl+0x33c/0x950 [kvm]
>    [<0000000048155cd6>] ksys_ioctl+0xd8/0x130
>    [<0000000041ffeaa7>] sys_ioctl+0x28/0x40
>    [<000000004afc4310>] system_call_exception+0x114/0x1e0
>    [<00000000fb70a873>] system_call_common+0xf0/0x278
> 
> Signed-off-by: Qian Cai <cai@lca.pw>

Thanks, applied to my kvm-ppc-next branch.

Paul.
