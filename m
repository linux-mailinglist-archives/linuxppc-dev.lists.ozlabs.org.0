Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1D52B5D47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 11:54:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cb2rN147kzDqGY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 21:54:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Cb2pG6wkzzDqR7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 21:52:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cb2pG5DPhz9sTR; Tue, 17 Nov 2020 21:52:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20201105134713.656160-1-clg@kaod.org>
References: <20201105134713.656160-1-clg@kaod.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: XIVE: Fix possible oops when
 accessing ESB page
Message-Id: <160560828682.349300.13298541133310387093.b4-ty@ellerman.id.au>
Date: Tue, 17 Nov 2020 21:52:38 +1100 (AEDT)
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
Cc: kvm@vger.kernel.org, Gustavo Romero <gromero@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 5 Nov 2020 14:47:13 +0100, Cédric Le Goater wrote:
> When accessing the ESB page of a source interrupt, the fault handler
> will retrieve the page address from the XIVE interrupt 'xive_irq_data'
> structure. If the associated KVM XIVE interrupt is not valid, that is
> not allocated at the HW level for some reason, the fault handler will
> dereference a NULL pointer leading to the oops below :
> 
>     WARNING: CPU: 40 PID: 59101 at arch/powerpc/kvm/book3s_xive_native.c:259 xive_native_esb_fault+0xe4/0x240 [kvm]
>     CPU: 40 PID: 59101 Comm: qemu-system-ppc Kdump: loaded Tainted: G        W        --------- -  - 4.18.0-240.el8.ppc64le #1
>     NIP:  c00800000e949fac LR: c00000000044b164 CTR: c00800000e949ec8
>     REGS: c000001f69617840 TRAP: 0700   Tainted: G        W        --------- -  -  (4.18.0-240.el8.ppc64le)
>     MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44044282  XER: 00000000
>     CFAR: c00000000044b160 IRQMASK: 0
>     GPR00: c00000000044b164 c000001f69617ac0 c00800000e96e000 c000001f69617c10
>     GPR04: 05faa2b21e000080 0000000000000000 0000000000000005 ffffffffffffffff
>     GPR08: 0000000000000000 0000000000000001 0000000000000000 0000000000000001
>     GPR12: c00800000e949ec8 c000001ffffd3400 0000000000000000 0000000000000000
>     GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>     GPR20: 0000000000000000 0000000000000000 c000001f5c065160 c000000001c76f90
>     GPR24: c000001f06f20000 c000001f5c065100 0000000000000008 c000001f0eb98c78
>     GPR28: c000001dcab40000 c000001dcab403d8 c000001f69617c10 0000000000000011
>     NIP [c00800000e949fac] xive_native_esb_fault+0xe4/0x240 [kvm]
>     LR [c00000000044b164] __do_fault+0x64/0x220
>     Call Trace:
>     [c000001f69617ac0] [0000000137a5dc20] 0x137a5dc20 (unreliable)
>     [c000001f69617b50] [c00000000044b164] __do_fault+0x64/0x220
>     [c000001f69617b90] [c000000000453838] do_fault+0x218/0x930
>     [c000001f69617bf0] [c000000000456f50] __handle_mm_fault+0x350/0xdf0
>     [c000001f69617cd0] [c000000000457b1c] handle_mm_fault+0x12c/0x310
>     [c000001f69617d10] [c00000000007ef44] __do_page_fault+0x264/0xbb0
>     [c000001f69617df0] [c00000000007f8c8] do_page_fault+0x38/0xd0
>     [c000001f69617e30] [c00000000000a714] handle_page_fault+0x18/0x38
>     Instruction dump:
>     40c2fff0 7c2004ac 2fa90000 409e0118 73e90001 41820080 e8bd0008 7c2004ac
>     7ca90074 39400000 915c0000 7929d182 <0b090000> 2fa50000 419e0080 e89e0018
>     ---[ end trace 66c6ff034c53f64f ]---
>     xive-kvm: xive_native_esb_fault: accessing invalid ESB page for source 8 !
> 
> [...]

Applied to powerpc/fixes.

[1/1] KVM: PPC: Book3S HV: XIVE: Fix possible oops when accessing ESB page
      https://git.kernel.org/powerpc/c/75b49620267c700f0a07fec7f27f69852db70e46

cheers
