Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8DA3E2C8E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 16:31:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh7Fj46Ywz3dGp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 00:31:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Gh7FJ2wlbz3bn8
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 00:30:58 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 176EQjC0006372;
 Fri, 6 Aug 2021 09:26:45 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 176EQikA006370;
 Fri, 6 Aug 2021 09:26:44 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 6 Aug 2021 09:26:43 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC PATCH 1/4] powerpc: Optimize register usage for esr register
Message-ID: <20210806142643.GU1583@gate.crashing.org>
References: <20210726143053.532839-1-sxwjean@me.com>
 <874kc3njxh.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874kc3njxh.fsf@mpe.ellerman.id.au>
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
Cc: ravi.bangoria@linux.ibm.com, sxwjean@me.com,
 Xiongwei Song <sxwjean@gmail.com>, aneesh.kumar@linux.ibm.com, oleg@redhat.com,
 npiggin@gmail.com, linux-kernel@vger.kernel.org, peterx@redhat.com,
 paulus@samba.org, efremov@linux.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 06, 2021 at 04:53:14PM +1000, Michael Ellerman wrote:
> But I'm not sure about the use of anonymous unions in UAPI headers. Old
> compilers don't support them, so there's a risk of breakage.

More precisely, it exists only since C11, so even with all not-so-ancient
compilers it will not work if the user uses (say) -std=c99, which still
is popular.

> I'd rather we didn't touch the uapi version.

Yeah.

> > -	err = ___do_page_fault(regs, regs->dar, regs->dsisr);
> > +	if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> > +		err = ___do_page_fault(regs, regs->dar, regs->esr);
> > +	else
> > +		err = ___do_page_fault(regs, regs->dar, regs->dsisr);
> 
> As Christophe said, I don't thinks this is an improvement.
> 
> It makes the code less readable. If anyone is confused about what is
> passed to ___do_page_fault() they can either read the comment above it,
> or look at the definition of pt_regs to see that esr and dsisr share
> storage.

Esp. since the affected platforms are legacy, yup.


Segher
