Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB97A5B5970
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 13:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR4R24S8Cz3c7P
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:40:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR4QZ3vWwz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 21:40:05 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28CBVGtH009422;
	Mon, 12 Sep 2022 06:31:16 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 28CBVEwA009421;
	Mon, 12 Sep 2022 06:31:14 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 12 Sep 2022 06:31:14 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [RFC] Objtool toolchain proposal: -fannotate-{jump-table,noreturn}
Message-ID: <20220912113114.GV25951@gate.crashing.org>
References: <20220909180704.jwwed4zhwvin7uyi@treble>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909180704.jwwed4zhwvin7uyi@treble>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org, Chen Zhongjin <chenzhongjin@huawei.com>, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, linux-toolchains@vger.kernel.org, Indu Bhagat <indu.bhagat@oracle.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri, Sep 09, 2022 at 11:07:04AM -0700, Josh Poimboeuf wrote:
> 2) Noreturn functions:
>    
>    There's no reliable way to determine which functions are designated
>    by the compiler to be noreturn (either explictly via function
>    attribute, or implicitly via a static function which is a wrapper
>    around a noreturn function.)

Or just a function that does not return for any other reason.

The compiler makes no difference between functions that have the
attribute and functions that do not.  There are good reasons to not
have the attribute on functions that do in fact not return.  The
not-returningness of the function may be just an implementation
accident, something you do not want part of the API, so it *should* not
have that attribute; or you may want the callers to a function to not be
optimised according to this knowledge (you cannot *prevent* that, the
compiler can figure it out it other ways, but still) for any other
reason.

>    This information is needed because the
>    code after the call to such a function is optimized out as
>    unreachable and objtool has no way of knowing that.

Since June we (GCC) have -funreachable-traps.  This creates a trap insn
wherever control flow would otherwise go into limbo.


Segher
