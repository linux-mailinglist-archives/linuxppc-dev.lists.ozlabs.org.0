Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEB01555F7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 11:43:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DX2Q1FFTzDqjd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 21:43:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.53.149; helo=2.mo2.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 6592 seconds by postgrey-1.36 at bilbo;
 Fri, 07 Feb 2020 21:41:49 AEDT
Received: from 2.mo2.mail-out.ovh.net (2.mo2.mail-out.ovh.net [188.165.53.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DX0s4D8YzDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 21:41:45 +1100 (AEDT)
Received: from player746.ha.ovh.net (unknown [10.110.171.215])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id C20561C90A2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 09:16:02 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id 27875F2E4372;
 Fri,  7 Feb 2020 08:15:57 +0000 (UTC)
Date: Fri, 7 Feb 2020 09:15:55 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH 18/18] powerpc/fault: Use analyse_instr() to check for
 store with updates to sp
Message-ID: <20200207091555.59442fac@bahia.lan>
In-Reply-To: <87immdu3je.fsf@dja-thinkpad.axtens.net>
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-19-jniethe5@gmail.com>
 <87immdu3je.fsf@dja-thinkpad.axtens.net>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2072218780129990999
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheeggdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejgeeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Dec 2019 01:11:33 +1100
Daniel Axtens <dja@axtens.net> wrote:

> Jordan Niethe <jniethe5@gmail.com> writes:
> 
> > A user-mode access to an address a long way below the stack pointer is
> > only valid if the instruction is one that would update the stack pointer
> > to the address accessed. This is checked by directly looking at the
> > instructions op-code. As a result is does not take into account prefixed
> > instructions. Instead of looking at the instruction our self, use
> > analyse_instr() determine if this a store instruction that will update
> > the stack pointer.
> >
> > Something to note is that there currently are not any store with update
> > prefixed instructions. Actually there is no plan for prefixed
> > update-form loads and stores. So this patch is probably not needed but
> > it might be preferable to use analyse_instr() rather than open coding
> > the test anyway.
> 
> Yes please. I was looking through this code recently and was
> horrified. This improves things a lot and I think is justification
> enough as-is.
> 

Except it doesn't work... I'm now experiencing a systematic crash of
systemd at boot in my fedora31 guest:

[    3.322912] systemd[1]: segfault (11) at 7ffff3eaf550 nip 7ce4d42f8d78 lr 9d82c098fc0 code 1 in libsystemd-shared-243.so[7ce4d4150000+2e0000]
[    3.323112] systemd[1]: code: 00000480 60420000 3c4c001e 3842edb0 7c0802a6 3d81fff0 fb81ffe0 fba1ffe8 
[    3.323244] systemd[1]: code: fbc1fff0 fbe1fff8 f8010010 7c200b78 <f801f001> 7c216000 4082fff8 f801ff71 

f801f001 is

0x1a8d78 <serialize_item_format+40>: stdu    r0,-4096(r1)

which analyse_instr() is supposed to decode as a STORE that
updates r1 so we should be good... Unfortunately analyse_instr()
forbids partial register sets, since it might return op->val
based on some register content depending on the instruction:

	/* Following cases refer to regs->gpr[], so we need all regs */
	if (!FULL_REGS(regs))
		return -1;

analyse_instr() was introduced with instruction emulation in mind, which
goes far beyond the need we have in store_updates_sp(). Especially the
fault path doesn't care for the register content at all...

Not sure how to cope with that correctly (refactor analyse_instr() ? ) but
until someone comes up with a solution, please don't merge this patch.

Cheers,

--
Greg

> Regards,
> Daniel
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >  arch/powerpc/mm/fault.c | 39 +++++++++++----------------------------
> >  1 file changed, 11 insertions(+), 28 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> > index b5047f9b5dec..cb78b3ca1800 100644
> > --- a/arch/powerpc/mm/fault.c
> > +++ b/arch/powerpc/mm/fault.c
> > @@ -41,37 +41,17 @@
> >  #include <asm/siginfo.h>
> >  #include <asm/debug.h>
> >  #include <asm/kup.h>
> > +#include <asm/sstep.h>
> >  
> >  /*
> >   * Check whether the instruction inst is a store using
> >   * an update addressing form which will update r1.
> >   */
> > -static bool store_updates_sp(unsigned int inst)
> > +static bool store_updates_sp(struct instruction_op *op)
> >  {
> > -	/* check for 1 in the rA field */
> > -	if (((inst >> 16) & 0x1f) != 1)
> > -		return false;
> > -	/* check major opcode */
> > -	switch (inst >> 26) {
> > -	case OP_STWU:
> > -	case OP_STBU:
> > -	case OP_STHU:
> > -	case OP_STFSU:
> > -	case OP_STFDU:
> > -		return true;
> > -	case OP_STD:	/* std or stdu */
> > -		return (inst & 3) == 1;
> > -	case OP_31:
> > -		/* check minor opcode */
> > -		switch ((inst >> 1) & 0x3ff) {
> > -		case OP_31_XOP_STDUX:
> > -		case OP_31_XOP_STWUX:
> > -		case OP_31_XOP_STBUX:
> > -		case OP_31_XOP_STHUX:
> > -		case OP_31_XOP_STFSUX:
> > -		case OP_31_XOP_STFDUX:
> > +	if (GETTYPE(op->type) == STORE) {
> > +		if ((op->type & UPDATE) && (op->update_reg == 1))
> >  			return true;
> > -		}
> >  	}
> >  	return false;
> >  }
> > @@ -278,14 +258,17 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
> >  
> >  		if ((flags & FAULT_FLAG_WRITE) && (flags & FAULT_FLAG_USER) &&
> >  		    access_ok(nip, sizeof(*nip))) {
> > -			unsigned int inst;
> > +			unsigned int inst, sufx;
> > +			struct instruction_op op;
> >  			int res;
> >  
> >  			pagefault_disable();
> > -			res = __get_user_inatomic(inst, nip);
> > +			res = __get_user_instr_inatomic(inst, sufx, nip);
> >  			pagefault_enable();
> > -			if (!res)
> > -				return !store_updates_sp(inst);
> > +			if (!res) {
> > +				analyse_instr(&op, uregs, inst, sufx);
> > +				return !store_updates_sp(&op);
> > +			}
> >  			*must_retry = true;
> >  		}
> >  		return true;
> > -- 
> > 2.20.1

