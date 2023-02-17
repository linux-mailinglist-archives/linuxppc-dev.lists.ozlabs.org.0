Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4369A5E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 08:06:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ2t75l0Bz3fBJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 18:06:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DJF32EQ6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DJF32EQ6;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ2sC6zPRz3cfY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 18:05:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 46E2E6153D;
	Fri, 17 Feb 2023 07:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D325C433D2;
	Fri, 17 Feb 2023 07:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676617547;
	bh=O915DOYblEyhW+IM9kfJrC5Kx0YW+/xEUBLvVzqTRHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJF32EQ62vBBuE/ud1MiiQ+QL7F2YGbh57J/qyJGT36uXd3jQdoZuLGs2zQDnczBZ
	 cTWwK1CzprnIwPHNvGO0yQQWkK4tJ8bSUCQvH4iUiwrdSUDGjeYf6q1/YadglkYiqg
	 ljb04zIEYmzqWt98Z3cvUnAfx7i7+BHZRFZmIukRDZDFL5SP+Nh0m1JYgaxd10g/vf
	 Vyk6xCO6ikrDID1CXoEItJC2YzTjrt7ck/B5hRXN6Um/yX9VRdd8DytdnT5LeQA33N
	 rHmmXCE34tROYWOqagmoG8+m1FM6/ZQ5Mv9hR8gtzF9V2uCL6cmD6CHfIkAED2alF3
	 Kuq1YFS/h4aIw==
Date: Thu, 16 Feb 2023 23:05:44 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build warning after merge of the powerpc tree
Message-ID: <20230217070544.uhe337i5xsgwsum4@treble>
References: <20230216144031.45b1fc12@canb.auug.org.au>
 <20230216180607.w666rnbtm5fumziq@treble>
 <87k00hysyy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87k00hysyy.fsf@mpe.ellerman.id.au>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023 at 12:35:17PM +1100, Michael Ellerman wrote:
> Josh Poimboeuf <jpoimboe@kernel.org> writes:
> > On Thu, Feb 16, 2023 at 02:40:31PM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >> 
> >> After merging the powerpc tree, today's linux-next build (powerpc
> >> pseries_le_defconfig) produced this warning:
> >> 
> >> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x6128: unannotated intra-function call
> >> 
> >> I have no idea what caused this.
> >
> > Adding Sathvika and Christophe.
> >
> > The short term fix would be something like the below, but...
> >
> > If powerpc objtool is only doing mcount, does it even make sense to run
> > objtool on asm files?  If so, there are probably a lot more cleanups
> > needed for the asm code.
> 
> I would like to enable more of the objtool checks eventually, although I
> don't have a timeline for that. But I'd prefer to keep checking the asm
> code seeing as we've already enabled that.

Sounds good for now, though as you get more objtool features there will
need to be more changes.

For example a lot of the callable functions are annotated with _GLOBAL()
rather than SYM_FUNC_{START,END}.  The latter adds the function size,
which objtool needs in several cases.  It also has particular rules
about when to use SYM_FUNC_* vs SYM_CODE_*, etc to make the code more
structured.

> > So I'm thinking either we should cleanup all the powerpc asm code with
> > annotations like below, or we should try to make objtool mcount-mode
> > ignore asm files.
> 
> I think we have most of the code annotated already, this is a new
> warning because that code is newly refactored by a commit I applied.
> 
> I'll have to fix my build scripts to error out on objtool warnings.

Likewise, I'll need to add some powerpc cross-compiles to my testing.

If we get too many of these powerpc warnings, we may be looking to
recruit more objtool maintainers ;-)

-- 
Josh
