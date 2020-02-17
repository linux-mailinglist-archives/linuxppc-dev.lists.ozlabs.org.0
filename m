Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEC1160BC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 08:40:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LbWX43qrzDqgf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 18:40:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LbRy2h55zDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 18:37:50 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 01H7bigW011077;
 Mon, 17 Feb 2020 01:37:44 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 01H7bhPL011072;
 Mon, 17 Feb 2020 01:37:43 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 17 Feb 2020 01:37:43 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Treat unrecognized TM instructions
 as illegal
Message-ID: <20200217073743.GT22482@gate.crashing.org>
References: <20200213151532.12559-1-gromero@linux.ibm.com>
 <29b136e15c2f04f783b54ec98552d1a6009234db.camel@neuling.org>
 <20200217055712.GS22482@gate.crashing.org>
 <1752a0c735a455c5d3ca09209f5a52748c8f7116.camel@neuling.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1752a0c735a455c5d3ca09209f5a52748c8f7116.camel@neuling.org>
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

On Mon, Feb 17, 2020 at 05:23:07PM +1100, Michael Neuling wrote:
> > > Hence, we should NOP this, not generate an illegal.
> > 
> > It is not a reserved bit.
> > 
> > The IMC entry for it matches op1=011111 op2=1////01110 presumably, which
> > catches all TM instructions and nothing else (bits 0..5 and bits 21..30).
> > That does not look at bit 31, the softpatch handler has to deal with this.
> > 
> > Some TM insns have bit 31 as 1 and some have it as /.  All instructions
> > with a "." in the mnemonic have bit 31 is 1, all other have it reserved.
> > The tables in appendices D, E, F show tend. and tsr. as having it
> > reserved, which contradicts the individual instruction description (and
> > does not make much sense).  (Only tcheck has /, everything else has 1;
> > everything else has a mnemonic with a dot, and does write CR0 always).
> 
> Wow, interesting. 
> 
> P8 seems to be treating 31 as a reserved bit (with the table definition rather
> than the individual instruction description). I'm inclined to match P8 even
> though it's inconsistent with the dot mnemonic as you say.

"The POWER8 core ignores the state of reserved bits in the instructions
(denoted by “///” in the instruction definition) and executes the
instruction normally. Software should set these bits to ‘0’ per the
Power ISA." (p8 UM, 3.1.1.3; same in the p9 UM).


Segher
