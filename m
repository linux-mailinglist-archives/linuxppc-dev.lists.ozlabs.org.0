Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF61E5379
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 03:56:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XW5k4kkNzDqS9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 11:56:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XW2v628YzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 11:54:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=WW4eXuaX; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49XW2v33Djz9sSW; Thu, 28 May 2020 11:54:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1590630855; bh=9OLYNNPQjdguwPbxnpBX8hPcEU4YisHQPmlaIH0dD48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WW4eXuaXjYjt/oDCZGuzp1pCLHr8njw4YJ2MIcYCKI9R77scX6ontzurBrvA9gd4R
 ldDWZLAvUhGoY60TGNmHEuR4TspMM1QP/zFTiwwDs2faRDMHs6bJWoBEERv+Sip92E
 2sWC/wMFa860EYCeahfZTsP8b9SsdW380Xdz9klRm9ips13/Ywiab2ICmaWUIbYwvR
 tglvJHrhkTo7i3zMFXhE6uBep3xLS4ia7+tWLeXDYQV1Hkg+foARcNef4SynAml30T
 EMEgV8jEgP1P7qRUtfBvyNKajZE2JPdG1k05+YGTBLBCAkPXzKdPeJfbzi8jgwmLBQ
 lgpwNoGNCm8Tw==
Date: Thu, 28 May 2020 11:43:38 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 09/22] powerpc/kvm/book3s: Add helper to walk
 partition scoped linux page table.
Message-ID: <20200528014338.GC307798@thinks.paulus.ozlabs.org>
References: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
 <20200505071729.54912-10-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505071729.54912-10-aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 05, 2020 at 12:47:16PM +0530, Aneesh Kumar K.V wrote:
> The locking rules for walking partition scoped table is different from process
> scoped table. Hence add a helper for secondary linux page table walk and also
> add check whether we are holding the right locks.

This patch is causing new warnings to appear when testing migration,
like this:

[  142.090159] ------------[ cut here ]------------
[  142.090160] find_kvm_secondary_pte called with kvm mmu_lock not held 
[  142.090176] WARNING: CPU: 23 PID: 5341 at arch/powerpc/include/asm/kvm_book3s_64.h:644 kvmppc_hv_get_dirty_log_radix+0x2e4/0x340 [kvm_hv]
[  142.090177] Modules linked in: xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables bpfilter overlay binfmt_misc input_leds raid_class scsi_transport_sas sch_fq_codel sunrpc kvm_hv kvm
[  142.090188] CPU: 23 PID: 5341 Comm: qemu-system-ppc Tainted: G        W         5.7.0-rc5-kvm-00211-g9ccf10d6d088 #432
[  142.090189] NIP:  c008000000fe848c LR: c008000000fe8488 CTR: 0000000000000000
[  142.090190] REGS: c000001e19f077e0 TRAP: 0700   Tainted: G        W          (5.7.0-rc5-kvm-00211-g9ccf10d6d088)
[  142.090191] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 42222422  XER: 20040000
[  142.090196] CFAR: c00000000012f5ac IRQMASK: 0 
               GPR00: c008000000fe8488 c000001e19f07a70 c008000000ffe200 0000000000000039 
               GPR04: 0000000000000001 c000001ffc8b4900 0000000000018840 0000000000000007 
               GPR08: 0000000000000003 0000000000000001 0000000000000007 0000000000000001 
               GPR12: 0000000000002000 c000001fff6d9400 000000011f884678 00007fff70b70000 
               GPR16: 00007fff7137cb90 00007fff7dcb4410 0000000000000001 0000000000000000 
               GPR20: 000000000ffe0000 0000000000000000 0000000000000001 0000000000000000 
               GPR24: 8000000000000000 0000000000000001 c000001e1f67e600 c000001e1fd82410 
               GPR28: 0000000000001000 c000001e2e410000 0000000000000fff 0000000000000ffe 
[  142.090217] NIP [c008000000fe848c] kvmppc_hv_get_dirty_log_radix+0x2e4/0x340 [kvm_hv]
[  142.090223] LR [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv]
[  142.090224] Call Trace:
[  142.090230] [c000001e19f07a70] [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv] (unreliable)
[  142.090236] [c000001e19f07b50] [c008000000fd42e4] kvm_vm_ioctl_get_dirty_log_hv+0x33c/0x3c0 [kvm_hv]
[  142.090292] [c000001e19f07be0] [c008000000eea878] kvm_vm_ioctl_get_dirty_log+0x30/0x50 [kvm]
[  142.090300] [c000001e19f07c00] [c008000000edc818] kvm_vm_ioctl+0x2b0/0xc00 [kvm]
[  142.090302] [c000001e19f07d50] [c00000000046e148] ksys_ioctl+0xf8/0x150
[  142.090305] [c000001e19f07da0] [c00000000046e1c8] sys_ioctl+0x28/0x80
[  142.090307] [c000001e19f07dc0] [c00000000003652c] system_call_exception+0x16c/0x240
[  142.090309] [c000001e19f07e20] [c00000000000d070] system_call_common+0xf0/0x278
[  142.090310] Instruction dump:
[  142.090312] 7d3a512a 4200ffd0 7ffefb78 4bfffdc4 60000000 3c820000 e8848468 3c620000 
[  142.090317] e86384a8 38840010 4800673d e8410018 <0fe00000> 4bfffdd4 60000000 60000000 
[  142.090322] ---[ end trace 619d45057b6919e0 ]---

Indeed, kvm_radix_test_clear_dirty() tests the PTE dirty bit
locklessly, and only takes the kvm->mmu_lock once it finds a dirty
PTE.  I think that is important for performance, since on any given
scan of the guest real address space we may only find a small
proportion of the guest pages to be dirty.

Are you now relying on the kvm->mmu_lock to protect the existence of
the PTEs, or just their content?

Paul.
