Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2B01B76E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 15:24:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497vyn1M1pzDqVc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 23:24:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=19w6=6i=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497vwG73MWzDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 23:22:06 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 291E720767;
 Fri, 24 Apr 2020 13:22:04 +0000 (UTC)
Date: Fri, 24 Apr 2020 09:22:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 3/3] powerpc/kprobes: Check return value of
 patch_instruction()
Message-ID: <20200424092202.71cfc549@gandalf.local.home>
In-Reply-To: <e2fae53a-f00b-b692-d638-f75c8f04feb8@c-s.fr>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <3a132ac385340244b8d74179ac7bbbda7bf1f503.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <e2fae53a-f00b-b692-d638-f75c8f04feb8@c-s.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 23 Apr 2020 17:41:52 +0200
Christophe Leroy <christophe.leroy@c-s.fr> wrote:
  
> > diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
> > index 024f7aad1952..046485bb0a52 100644
> > --- a/arch/powerpc/kernel/optprobes.c
> > +++ b/arch/powerpc/kernel/optprobes.c
> > @@ -139,52 +139,67 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
> >   	}
> >   }
> >   
> > +#define PATCH_INSN(addr, instr)						     \
> > +do {									     \
> > +	int rc = patch_instruction((unsigned int *)(addr), instr);	     \
> > +	if (rc) {							     \
> > +		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
> > +				__func__, __LINE__,			     \
> > +				(void *)(addr), (void *)(addr), rc);	     \
> > +		return rc;						     \
> > +	}								     \
> > +} while (0)
> > +  
> 
> I hate this kind of macro which hides the "return".
> 
> What about keeping the return action in the caller ?
> 
> Otherwise, what about implementing something based on the use of goto, 
> on the same model as unsafe_put_user() for instance ?

#define PATCH_INSN(addr, instr) \
({
	int rc = patch_instruction((unsigned int *)(addr), instr);	     \
	if (rc)								     \
		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
				__func__, __LINE__,			     \
				(void *)(addr), (void *)(addr), rc);	     \
	rc;								     \
})


Then you can just do:

	ret = PATCH_INSN(...);
	if (ret)
		return ret;

in the code.

-- Steve
