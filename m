Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0139009A2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 17:53:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vwm2b6ZkRz3cZx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 01:53:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vwm266R2pz30TB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2024 01:53:18 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 457Ffa1j010762;
	Fri, 7 Jun 2024 10:41:36 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 457FfXv6010759;
	Fri, 7 Jun 2024 10:41:33 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 7 Jun 2024 10:41:33 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: vdso: fix building with wrong-endian toolchain
Message-ID: <20240607154133.GD19790@gate.crashing.org>
References: <20240607061629.530301-1-arnd@kernel.org> <87frtoq5yz.fsf@mail.lhotse>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frtoq5yz.fsf@mail.lhotse>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 07, 2024 at 10:42:44PM +1000, Michael Ellerman wrote:
> I use the korg toolchains every day, and kisskb uses them too.
> 
> What commit / defconfig are you seeing the errors with?
> 
> Is it just the 12.3.0 toolchain or all of them? I just tested 12.3.0
> here and it built OK.
> 
> I guess you're building on x86 or arm64? I build on ppc64le, I wonder if
> that makes a difference.

The core problem of course is pre-processing a linker script with the
C preprocessor (although linker scripts themselves have much more
capable facilities for this), and by doing this as-if it was a piece of
assembler code that for some strange reason you want fed through the C
preprocessor (as .S file).

What is it the C preprocessor is wanted for here?  Is there nothing
better that can be done?

> The patch is probably OK regardless, but I'd rather understand what the
> actual problem is.

Yeah.  The problem was found later in the thread (the CPP env var, or
shell var anyway, not sure what it is here) was set.  Fun and
surprising!  If you do nnot like such fun all that much, reduce the
surface of eternal surprise?  (I don't like saying "attack surface", but
that is what it is as well).


Segher
