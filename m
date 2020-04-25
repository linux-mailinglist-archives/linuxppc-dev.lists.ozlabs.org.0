Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D183E1B86EF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 16:14:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498Y1f4GgtzDqXR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 00:13:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=orc5=6j=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498XsQ6bkbzDqHm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 00:06:50 +1000 (AEST)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A714720704;
 Sat, 25 Apr 2020 14:06:46 +0000 (UTC)
Date: Sat, 25 Apr 2020 10:06:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 3/3] powerpc/kprobes: Check return value of
 patch_instruction()
Message-ID: <20200425100645.7aa85ee0@oasis.local.home>
In-Reply-To: <e743c9db-847a-2612-bf36-c23a57a056c5@c-s.fr>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <3a132ac385340244b8d74179ac7bbbda7bf1f503.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <e2fae53a-f00b-b692-d638-f75c8f04feb8@c-s.fr>
 <20200424092202.71cfc549@gandalf.local.home>
 <1587751684.agx3nt8uvf.naveen@linux.ibm.com>
 <e743c9db-847a-2612-bf36-c23a57a056c5@c-s.fr>
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

On Sat, 25 Apr 2020 10:11:56 +0000
Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
> Sure it's be more explicit, but then more lines also. 3 lines for only 
> one really usefull.
> 
> With goto, I would look like:
> 
> diff --git a/arch/powerpc/kernel/optprobes.c 
> b/arch/powerpc/kernel/optprobes.c
> index 046485bb0a52..938208f824da 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -139,14 +139,14 @@ void arch_remove_optimized_kprobe(struct 
> optimized_kprobe *op)
>   	}
>   }
> 
> -#define PATCH_INSN(addr, instr)						     \
> +#define PATCH_INSN(addr, instr, label)						     \

With the explicit label as a parameter, makes it more evident that it
will do something (like jump) with that label.

I like this solution the best!

-- Steve


>   do {									     \
>   	int rc = patch_instruction((unsigned int *)(addr), instr);	     \
>   	if (rc) {							     \
>   		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
>   				__func__, __LINE__,			     \
>   				(void *)(addr), (void *)(addr), rc);	     \
> -		return rc;						     \
> +		goto label;						     \
>   	}								     \
>   } while (0)
> 
