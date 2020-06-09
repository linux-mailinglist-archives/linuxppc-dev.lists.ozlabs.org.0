Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 008401F3386
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:37:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzQT2JQrzDqRb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzDd3Z0BzDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDd0PKNz9sSy; Tue,  9 Jun 2020 15:28:32 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@ozlabs.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 kvm-ppc@vger.kernel.org
In-Reply-To: <20200528080456.87797-1-aneesh.kumar@linux.ibm.com>
References: <20200528080456.87797-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/book3s64/kvm: Fix secondary page table walk
 warning during migration
Message-Id: <159168034440.1381411.6881571282012348230.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:32 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 May 2020 13:34:56 +0530, Aneesh Kumar K.V wrote:
> This patch fix the below warning reported during migration.
> 
>  find_kvm_secondary_pte called with kvm mmu_lock not held
>  CPU: 23 PID: 5341 Comm: qemu-system-ppc Tainted: G        W         5.7.0-rc5-kvm-00211-g9ccf10d6d088 #432
>  NIP:  c008000000fe848c LR: c008000000fe8488 CTR: 0000000000000000
>  REGS: c000001e19f077e0 TRAP: 0700   Tainted: G        W          (5.7.0-rc5-kvm-00211-g9ccf10d6d088)
>  MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 42222422  XER: 20040000
>  CFAR: c00000000012f5ac IRQMASK: 0
>  GPR00: c008000000fe8488 c000001e19f07a70 c008000000ffe200 0000000000000039
>  GPR04: 0000000000000001 c000001ffc8b4900 0000000000018840 0000000000000007
>  GPR08: 0000000000000003 0000000000000001 0000000000000007 0000000000000001
>  GPR12: 0000000000002000 c000001fff6d9400 000000011f884678 00007fff70b70000
>  GPR16: 00007fff7137cb90 00007fff7dcb4410 0000000000000001 0000000000000000
>  GPR20: 000000000ffe0000 0000000000000000 0000000000000001 0000000000000000
>  GPR24: 8000000000000000 0000000000000001 c000001e1f67e600 c000001e1fd82410
>  GPR28: 0000000000001000 c000001e2e410000 0000000000000fff 0000000000000ffe
>  NIP [c008000000fe848c] kvmppc_hv_get_dirty_log_radix+0x2e4/0x340 [kvm_hv]
>  LR [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv]
>  Call Trace:
>  [c000001e19f07a70] [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv] (unreliable)
>  [c000001e19f07b50] [c008000000fd42e4] kvm_vm_ioctl_get_dirty_log_hv+0x33c/0x3c0 [kvm_hv]
>  [c000001e19f07be0] [c008000000eea878] kvm_vm_ioctl_get_dirty_log+0x30/0x50 [kvm]
>  [c000001e19f07c00] [c008000000edc818] kvm_vm_ioctl+0x2b0/0xc00 [kvm]
>  [c000001e19f07d50] [c00000000046e148] ksys_ioctl+0xf8/0x150
>  [c000001e19f07da0] [c00000000046e1c8] sys_ioctl+0x28/0x80
>  [c000001e19f07dc0] [c00000000003652c] system_call_exception+0x16c/0x240
>  [c000001e19f07e20] [c00000000000d070] system_call_common+0xf0/0x278
>  Instruction dump:
>  7d3a512a 4200ffd0 7ffefb78 4bfffdc4 60000000 3c820000 e8848468 3c620000
>  e86384a8 38840010 4800673d e8410018 <0fe00000> 4bfffdd4 60000000 60000000

Applied to powerpc/next.

[1/1] powerpc/book3s64/kvm: Fix secondary page table walk warning during migration
      https://git.kernel.org/powerpc/c/bf8036a4098d1548cdccf9ed5c523ef4e83e3c68

cheers
