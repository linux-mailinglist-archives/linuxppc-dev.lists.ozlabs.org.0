Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C6786D071
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 18:23:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlyjJ5GXmz3vj0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 04:23:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlyhq4lV5z3vbj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 04:22:35 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 41THKQaE023760;
	Thu, 29 Feb 2024 11:20:27 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 41THKPD7023758;
	Thu, 29 Feb 2024 11:20:25 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 29 Feb 2024 11:20:25 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/5] powerpc/64s: Use .machine power4 around dcbt
Message-ID: <20240229172025.GV19790@gate.crashing.org>
References: <20240229122521.762431-1-mpe@ellerman.id.au> <20240229122521.762431-2-mpe@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229122521.762431-2-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 11:25:18PM +1100, Michael Ellerman wrote:
> There are multiple decodings for the "dcbt" mnemonic, so the assembler
> has to pick one.
> 
> That requires passing -many to the assembler, which is not recommended.
> 
> Without -many the clang 14 / binutils 2.38 build fails with:
> 
>   arch/powerpc/kernel/exceptions-64s.S:2976: Error: junk at end of line: `0b01010'
>   clang: error: assembler command failed with exit code 1 (use -v to see invocation)
> 
> Fix it by adding .machine directives around the use of dcbt to specify
> which encoding is desired.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Looks good, thanks!

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
