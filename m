Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 527294C16CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 16:30:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3g3V56Yxz3bd4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 02:30:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K3g351Hlxz2yMx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 02:30:24 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 21NFRJFj001983;
 Wed, 23 Feb 2022 09:27:19 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 21NFRJU4001982;
 Wed, 23 Feb 2022 09:27:19 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 23 Feb 2022 09:27:19 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 3/3] powerpc: lib: sstep: fix build errors
Message-ID: <20220223152719.GF614@gate.crashing.org>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-3-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223135820.2252470-3-anders.roxell@linaro.org>
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
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 02:58:20PM +0100, Anders Roxell wrote:
> Building tinyconfig with gcc (Debian 11.2.0-16) and assembler (Debian
> 2.37.90.20220207) the following build error shows up:
> 
> {standard input}: Assembler messages:
> {standard input}:10576: Error: unrecognized opcode: `stbcx.'
> {standard input}:10680: Error: unrecognized opcode: `lharx'
> {standard input}:10694: Error: unrecognized opcode: `lbarx'
> 
> Rework to add assembler directives [1] around the instruction.  The
> problem with this might be that we can trick a power6 into
> single-stepping through an stbcx. for instance, and it will execute that
> in kernel mode.
> 
> [1] https://sourceware.org/binutils/docs/as/PowerPC_002dPseudo.html#PowerPC_002dPseudo

Wow, no wonder you think you need quotes after reading that.  I'll try
to get that fixed.

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
