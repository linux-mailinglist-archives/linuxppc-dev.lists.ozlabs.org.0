Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3015A84CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 19:54:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHsJc41f4z3cCk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 03:54:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHsJ757y5z2xBF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 03:54:30 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 27VHp22H007556;
	Wed, 31 Aug 2022 12:51:02 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 27VHp1O9007550;
	Wed, 31 Aug 2022 12:51:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 31 Aug 2022 12:51:00 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 16/16] objtool/powerpc: Add --mcount specific implementation
Message-ID: <20220831175100.GS25951@gate.crashing.org>
References: <20220829055223.24767-1-sv@linux.ibm.com> <20220829055223.24767-17-sv@linux.ibm.com> <5da86617-53f1-d899-336a-53fe691e76ae@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5da86617-53f1-d899-336a-53fe691e76ae@csgroup.eu>
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 31, 2022 at 12:50:07PM +0000, Christophe Leroy wrote:
> Le 29/08/2022 à 07:52, Sathvika Vasireddy a écrit :
> > +	opcode = insn >> 26;
> > +
> > +	switch (opcode) {
> > +	case 18: /* bl */
> 
> case 18 is more than 'bl', it includes also 'b'.
> In both cases, the calculation of *immediate is the same.

It also is "ba" and "bla", sometimes written as "b[l][a]".

> It would therefore be more correct to perform the calculation and setup 
> of *immediate outside the 'if ((insn & 3) == 1)', that would avoid 
> unnecessary churn the day we add support for branches without link.
> 
> > +		if ((insn & 3) == 1) {
> > +			*type = INSN_CALL;
> > +			*immediate = insn & 0x3fffffc;
> > +			if (*immediate & 0x2000000)
> > +				*immediate -= 0x4000000;
> > +		}
> > +		break;
> > +	}

Does this handle AA=1 correctly at all?  That is valid both with and
without relocations, just like AA=0.  Same for AA=1 LK=0 btw.

If you only handle AA=0, the code should explicitly test for that.


Segher
