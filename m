Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6DC877280
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 18:49:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TsVsR5B2Qz3vdK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Mar 2024 04:49:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TsVrz4xyRz3cDR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Mar 2024 04:48:49 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 429HhSE3003665;
	Sat, 9 Mar 2024 11:43:28 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 429HhRAn003661;
	Sat, 9 Mar 2024 11:43:27 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 9 Mar 2024 11:43:26 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] tools/erf/util/annotate: Set register_char and memory_ref_char for powerpc
Message-ID: <20240309174326.GU19790@gate.crashing.org>
References: <20240309072513.9418-1-atrajeev@linux.vnet.ibm.com> <20240309072513.9418-3-atrajeev@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240309072513.9418-3-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All instructions with a primary opcode from 32 to 63 are memory insns,
and no others.  It's trivial to see whether it is a load or store, too
(just bit 3 of the insn).  Trying to parse disassembled code is much
harder, and you easily make some mistakes here.

On Sat, Mar 09, 2024 at 12:55:12PM +0530, Athira Rajeev wrote:
> To identify if the instruction has any memory reference,
> "memory_ref_char" field needs to be set for specific architecture.
> Example memory instruction:
> lwz     r10,0(r9)
> 
> Here "(" is the memory_ref_char. Set this as part of arch->objdump

What about "lwzx r10,0,r19", semantically exactly the same instruction?
There is no paren in there.  Not all instructions using parens are
memory insns, either, not in assembler code at least.

> To get register number and access offset from the given instruction,
> arch->objdump.register_char is used. In case of powerpc, the register
> char is "r" (since reg names are r0 to r31). Hence set register_char
> as "r".

cr0..cr7
r0..r31
f0..f31
v0..v31
vs0..vs63
and many other spellings.  Plain "0..63" is also fine.

The "0" in my lwzx example is a register field as well (and it stands
for "no register", not for "r0").  Called "(RA|0)" usually (incidentally,
see the parens there as well, oh joy).

Don't you have the binary code here as well, not just a disassembled
representation of it?  It is way easier to just use that, and you'll get
much better results that way :-)


Segher
