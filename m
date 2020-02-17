Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B2D160A31
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 06:58:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LYFq5CMjzDqhR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 16:58:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LYD26ZXXzDqS3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 16:57:20 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 01H5vDtM005906;
 Sun, 16 Feb 2020 23:57:14 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 01H5vCf8005905;
 Sun, 16 Feb 2020 23:57:12 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sun, 16 Feb 2020 23:57:12 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Treat unrecognized TM instructions
 as illegal
Message-ID: <20200217055712.GS22482@gate.crashing.org>
References: <20200213151532.12559-1-gromero@linux.ibm.com>
 <29b136e15c2f04f783b54ec98552d1a6009234db.camel@neuling.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29b136e15c2f04f783b54ec98552d1a6009234db.camel@neuling.org>
User-Agent: Mutt/1.4.2.3i
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 17, 2020 at 12:07:31PM +1100, Michael Neuling wrote:
> On Thu, 2020-02-13 at 10:15 -0500, Gustavo Romero wrote:
> > On P9 DD2.2 due to a CPU defect some TM instructions need to be emulated by
> > KVM. This is handled at first by the hardware raising a softpatch interrupt
> > when certain TM instructions that need KVM assistance are executed in the
> > guest. Some TM instructions, although not defined in the Power ISA, might
> > raise a softpatch interrupt. For instance, 'tresume.' instruction as
> > defined in the ISA must have bit 31 set (1), but an instruction that
> > matches 'tresume.' OP and XO opcodes but has bit 31 not set (0), like
> > 0x7cfe9ddc, also raises a softpatch interrupt, for example, if a code
> > like the following is executed in the guest it will raise a softpatch
> > interrupt just like a 'tresume.' when the TM facility is enabled:
> > 
> > int main() { asm("tabort. 0; .long 0x7cfe9ddc;"); }

> > and then treats the executed instruction as 'nop' whilst it should actually
> > be treated as an illegal instruction since it's not defined by the ISA.
> 
> The ISA has this: 
> 
>    1.3.3 Reserved Fields, Reserved Values, and Reserved SPRs
> 
>    Reserved fields in instructions are ignored by the pro-
>    cessor.
> 
> Hence the hardware will ignore reserved bits. For example executing your little
> program on P8 just exits normally with 0x7cfe9ddc being executed as a NOP.
> 
> Hence, we should NOP this, not generate an illegal.

It is not a reserved bit.

The IMC entry for it matches op1=011111 op2=1////01110 presumably, which
catches all TM instructions and nothing else (bits 0..5 and bits 21..30).
That does not look at bit 31, the softpatch handler has to deal with this.

Some TM insns have bit 31 as 1 and some have it as /.  All instructions
with a "." in the mnemonic have bit 31 is 1, all other have it reserved.
The tables in appendices D, E, F show tend. and tsr. as having it
reserved, which contradicts the individual instruction description (and
does not make much sense).  (Only tcheck has /, everything else has 1;
everything else has a mnemonic with a dot, and does write CR0 always).


Segher
