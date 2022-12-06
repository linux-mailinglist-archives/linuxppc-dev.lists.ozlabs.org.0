Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC53644F46
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 00:05:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRbbk1knQz3bg8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 10:05:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kkv+1tXl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRbZn68C5z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 10:04:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kkv+1tXl;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NRbZh51h9z4xRB;
	Wed,  7 Dec 2022 10:04:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1670367853;
	bh=i4X8sL0bl2XU4t178WS/XhXyjh2USW6mg0PhifARJKs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kkv+1tXlusCRi6tMW/2tPjgwJFduaF1FXcUB0ogbs/B7OBczzKsltcG5Fdg5/0ZH7
	 Q0u+UyPWRCkcThMBpJ2tuyrxYpXn622zGJRn9O7ZtuAe5/1zQ0zu3A8OJ2MVJbG3AA
	 4KtmfD2/9jF80rvdLACO4jAFaNDN9Vqxa/TdRiXjEWQg3h+nGIKkOZf8G7yQl/ZoPw
	 KHCYKmjD42AqrYaoGvoPqkd6SqD1avYq11GlHqUcGbplhVy2CWvMUbF0gL0xsh8/NV
	 gKubmu9iELTm4uCGwquj/UPBWDmAmbPD5QjieCyu/cMCy/SEi/hagtkcJJlGJ91dFL
	 ZhAkKEGYxgyew==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 5/5] powerpc: mm: support page table check
In-Reply-To: <20221118002146.25979-5-rmclure@linux.ibm.com>
References: <20221118002146.25979-1-rmclure@linux.ibm.com>
 <20221118002146.25979-5-rmclure@linux.ibm.com>
Date: Wed, 07 Dec 2022 10:04:09 +1100
Message-ID: <87fsdsrv6e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rohan McLure <rmclure@linux.ibm.com> writes:
> On creation and clearing of a page table mapping, instrument such calls
> by invoking page_table_check_pte_set and page_table_check_pte_clear
> respectively. These calls serve as a sanity check against illegal
> mappings.
>
> Enable ARCH_SUPPORTS_PAGE_TABLE_CHECK for all ppc64, and 32-bit
> platforms implementing Book3S.
>
> Change pud_pfn to be a runtime bug rather than a build bug as it is
> consumed by page_table_check_pud_{clear,set} which are not called.
>
> See also:
>
> riscv support in commit 3fee229a8eb9 ("riscv/mm: enable
> ARCH_SUPPORTS_PAGE_TABLE_CHECK")
> arm64 in commit 42b2547137f5 ("arm64/mm: enable
> ARCH_SUPPORTS_PAGE_TABLE_CHECK")
> x86_64 in commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
> check")
>
> Reviewed-by: Russell Currey <ruscur@russell.cc>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

This blows up for me when checking is enabled. This is a qemu pseries
KVM guest on a P9 host, booting Fedora 34. I haven't dug into what is
wrong yet.

cheers


[    0.600480][   T63] ------------[ cut here ]------------
[    0.600546][   T63] kernel BUG at mm/page_table_check.c:115!
[    0.600596][   T63] Oops: Exception in kernel mode, sig: 5 [#1]
[    0.600645][   T63] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[    0.600703][   T63] Modules linked in:
[    0.600736][   T63] CPU: 0 PID: 63 Comm: systemd-bless-b Not tainted 6.1.0-rc2-00178-gf0c0e10f5162 #65
[    0.600803][   T63] Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,git-5b4c5a hv:linux,kvm pSeries
[    0.600885][   T63] NIP:  c0000000004a7d58 LR: c0000000004a7d74 CTR: 0000000000000000
[    0.600942][   T63] REGS: c0000000067635e0 TRAP: 0700   Not tainted  (6.1.0-rc2-00178-gf0c0e10f5162)
[    0.601008][   T63] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 44424420  XER: 00000003
[    0.601088][   T63] CFAR: c0000000004a7d4c IRQMASK: 0
[    0.601088][   T63] GPR00: c0000000004a7d74 c000000006763880 c000000001332500 c000000003a00408
[    0.601088][   T63] GPR04: 0000000000000001 0000000000000001 8603402f000000c0 0000000000000000
[    0.601088][   T63] GPR08: 00000000000005e0 0000000000000001 c000000002702500 0000000000002000
[    0.601088][   T63] GPR12: 00007fffbc810000 c000000002a20000 0000000040000000 0000000040000000
[    0.601088][   T63] GPR16: 0000000040000000 0000000000000000 0000000000000000 0000000040000000
[    0.601088][   T63] GPR20: ff7fffffffffefbf 0000000000000000 c000000003555a00 0000000000000001
[    0.601088][   T63] GPR24: c0000000028dda60 c00c000000020ac0 c0000000082a1100 c00c0000000bd000
[    0.601088][   T63] GPR28: 0000000000000001 c0000000026fcf60 0000000000000001 c000000003a00400
[    0.601614][   T63] NIP [c0000000004a7d58] page_table_check_set.part.0+0xc8/0x170
[    0.601675][   T63] LR [c0000000004a7d74] page_table_check_set.part.0+0xe4/0x170
[    0.601734][   T63] Call Trace:
[    0.601764][   T63] [c000000006763880] [c0000000067638c0] 0xc0000000067638c0 (unreliable)
[    0.601825][   T63] [c0000000067638c0] [c000000000087c28] set_pte_at+0x68/0x210
[    0.601884][   T63] [c000000006763910] [c000000000483fd8] __split_huge_pmd+0x7f8/0x11c0
[    0.601947][   T63] [c000000006763a20] [c000000000485908] vma_adjust_trans_huge+0x158/0x2d0
[    0.602006][   T63] [c000000006763a70] [c00000000040b5dc] __vma_adjust+0x13c/0xbe0
[    0.602067][   T63] [c000000006763b80] [c00000000040d708] __split_vma+0x158/0x270
[    0.602128][   T63] [c000000006763bd0] [c00000000040d938] do_mas_align_munmap.constprop.0+0x118/0x610
[    0.602196][   T63] [c000000006763cd0] [c000000000416228] sys_mremap+0x3c8/0x850
[    0.602255][   T63] [c000000006763e10] [c00000000002fab8] system_call_exception+0x128/0x330
[    0.602314][   T63] [c000000006763e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
[    0.602384][   T63] --- interrupt: 3000 at 0x7fffbd94f86c
[    0.602425][   T63] NIP:  00007fffbd94f86c LR: 0000000000000000 CTR: 0000000000000000
[    0.602481][   T63] REGS: c000000006763e80 TRAP: 3000   Not tainted  (6.1.0-rc2-00178-gf0c0e10f5162)
[    0.602546][   T63] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44004422  XER: 00000000
[    0.602635][   T63] IRQMASK: 0
[    0.602635][   T63] GPR00: 00000000000000a3 00007ffff2c4e670 00007fffbda37000 00007fffbc400000
[    0.602635][   T63] GPR04: 0000000000410000 0000000000010000 0000000000000001 0000000000000000
[    0.602635][   T63] GPR08: 00007fffbc410000 0000000000000000 0000000000000000 0000000000000000
[    0.602635][   T63] GPR12: 0000000000000000 00007fffbc937d50 0000000000000000 0000000000000000
[    0.602635][   T63] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.602635][   T63] GPR20: 000000000000046b 00000000003fffff 00007ffff2c4e7e8 0000000000400000
[    0.602635][   T63] GPR24: 0000000000000000 0000000000000000 0000000000000480 0000000000410000
[    0.602635][   T63] GPR28: 00007fffbc400000 0000000000000000 0000000000010000 0000000000100000
[    0.603146][   T63] NIP [00007fffbd94f86c] 0x7fffbd94f86c
[    0.603186][   T63] LR [0000000000000000] 0x0
[    0.603226][   T63] --- interrupt: 3000
[    0.603256][   T63] Code: 0b090000 7c0004ac 7d201828 31290001 7d20192d 40c2fff4 7c0004ac 2c090001 7f89e378 41810008 39200000 5529063e <0b090000> e93d0000 37deffff 7fff4a14
[    0.603384][   T63] ---[ end trace 0000000000000000 ]---
