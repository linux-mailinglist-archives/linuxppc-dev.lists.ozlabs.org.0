Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAF25B8E49
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 19:45:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSSQm301Zz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 03:45:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSSQK1kG7z2xgN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 03:44:39 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28EHYR2K002376;
	Wed, 14 Sep 2022 12:34:27 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 28EHYPMf002375;
	Wed, 14 Sep 2022 12:34:25 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 14 Sep 2022 12:34:25 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC] Objtool toolchain proposal: -fannotate-{jump-table,noreturn}
Message-ID: <20220914173425.GZ25951@gate.crashing.org>
References: <20220909180704.jwwed4zhwvin7uyi@treble> <Yx8PcldkdOLN8eaw@nazgul.tnic> <alpine.LSU.2.20.2209121200120.8265@wotan.suse.de> <20220914000416.daxbgccbxwpknn2q@treble> <YyHecBM8D0i1lRu8@hirez.programming.kicks-ass.net> <alpine.LSU.2.20.2209141415340.8265@wotan.suse.de> <YyHrX/fTMwfv24W7@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyHrX/fTMwfv24W7@hirez.programming.kicks-ass.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Chen Zhongjin <chenzhongjin@huawei.com>, Michael Matz <matz@suse.de>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-toolchains@vger.kernel.org, Indu Bhagat <indu.bhagat@oracle.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 14, 2022 at 04:55:27PM +0200, Peter Zijlstra wrote:
> On Wed, Sep 14, 2022 at 02:28:26PM +0000, Michael Matz wrote:
> > Don't mix DWARF debug info with DWARF-based unwinding info, the latter 
> > doesn't imply the former.  Out of interest: how does ORC get around the 
> > need for CFI annotations (or equivalents to restore registers) and what 
> 
> Objtool 'interprets' the stackops. So it follows the call-graph and is
> an interpreter for all instructions that modify the stack. Doing that it
> konws what the stackframe is at 'most' places.

To get correct backtraces on e.g. PowerPC you need to emulate many of
the integer insns.  That is why GCC enables -fasynchronous-unwind-tables
by default for us.

The same is true for s390, aarch64, and x86 (unless 32-bit w/ frame
pointer).

The problem is that you do not know how to access anything on the stack,
whether in the current frame or in a previous frame, from a random point
in the program.  GDB has many heuristics for this, and it still does not
get it right in all cases.

> > makes it fast?  I want faster unwinding for DWARF as well, when there's 
> > feature parity :-)  Maybe something can be learned for integration into 
> > dwarf-unwind.
> 
> I think we have some details here:
> 
>  https://www.kernel.org/doc/html/latest/x86/orc-unwinder.html

It is faster because it does a whole lot less.  Is that still enough?
It's not clear (to me) what exact information it wants to provide :-(


Segher
