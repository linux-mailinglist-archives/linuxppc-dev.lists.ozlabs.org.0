Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB83505EAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 21:44:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khy7h4z06z3bmR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 05:44:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=k7rl=u4=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khy7F463Qz2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 05:44:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6281060F5A;
 Mon, 18 Apr 2022 19:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510EBC385A1;
 Mon, 18 Apr 2022 19:44:20 +0000 (UTC)
Date: Mon, 18 Apr 2022 15:44:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v1 07/22] powerpc/ftrace: Use patch_instruction() return
 directly
Message-ID: <20220418154418.72ccc00c@gandalf.local.home>
In-Reply-To: <1650262058.altfknhzto.naveen@linux.ibm.com>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <b4505e936e1aee411f7132a27791cf138102f35f.1648131740.git.christophe.leroy@csgroup.eu>
 <1650262058.altfknhzto.naveen@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 Apr 2022 11:51:16 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> > --- a/arch/powerpc/kernel/trace/ftrace.c
> > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > @@ -78,10 +78,7 @@ ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_t new)
> >  	}
> > 
> >  	/* replace the text with the new text */
> > -	if (patch_instruction((u32 *)ip, new))
> > -		return -EPERM;
> > -
> > -	return 0;
> > +	return patch_instruction((u32 *)ip, new);  
> 
> I think the reason we were returning -EPERM is so that ftrace_bug() can 

That is correct.

> throw the right error message. That will change due to this patch, 
> though I'm not sure how much it matters. -EFAULT and -EPERM seem to 
> print almost the same error message.

In these cases it helps to know the type of failure, as the way to debug it
is different.

-EFAULT: It failed to read it the location. This means that the memory is
likely not even mapped in, or the pointer is way off.

-EINVAL: Means that what was read did not match what was expected (the code
was already updated, pointing to the wrong location, or simply the
calculation of what to expect is incorrect).

-EPERM: Means the write failed. What was read was expected, but the
permissions to write have not been updated properly.

Differentiating the three is crucial to looking at where the issue lies
when an ftrace_bug() triggers.

-- Steve
