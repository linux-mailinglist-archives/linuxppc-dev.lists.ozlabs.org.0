Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E884542D795
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 13:00:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVRJK3Lbjz3bN5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 22:00:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HVRHv5vmTz2yP6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 21:59:53 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 19EAuiWe016078;
 Thu, 14 Oct 2021 05:56:44 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 19EAuhWi016077;
 Thu, 14 Oct 2021 05:56:43 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 14 Oct 2021 05:56:43 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/dcr: Use cmplwi instead of 3-argument cmpli
Message-ID: <20211014105643.GF614@gate.crashing.org>
References: <20211014024424.528848-1-mpe@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211014024424.528848-1-mpe@ellerman.id.au>
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
Cc: ndesaulniers@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Oct 14, 2021 at 01:44:24PM +1100, Michael Ellerman wrote:
> In dcr-low.S we use cmpli with three arguments, instead of four
> arguments as defined in the ISA:
> 
> 	cmpli	cr0,r3,1024
> 
> This appears to be a PPC440-ism, looking at the "PPC440x5 CPU Core
> User’s Manual" it shows cmpli having no L field, but implied to be 0 due
> to the core being 32-bit. It mentions that the ISA defines four
> arguments and recommends using cmplwi.

It also corresponds to the old POWER instruction set, which had no L
field there, a reserved bit instead.  It used to be that -many allowed
these insns as well, but not anymore.

> Although gas is happy with the 3-argument version when building for
> 32-bit, the LLVM assembler is not and errors out with:

A GAS targeting powerpc64 isn't happy either, fwiw.

>   arch/powerpc/sysdev/dcr-low.S:27:10: error: invalid operand for instruction
>    cmpli 0,%r3,1024; ...
>            ^
> 
> Switching to the four argument version avoids any confusion when reading
> the ISA, fixes the issue with the LLVM assembler, and also means the
> code could be built 64-bit in future (though that's very unlikely).

You are actually now using to the extended opcode cmpwli (a much better
plan :-) )

Thanks,


Segher
