Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 789A76643F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 16:03:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrvGC2x19z3c7k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 02:03:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CoepT9JQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CoepT9JQ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrvFF0LTGz3c79
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 02:02:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C78ECB81698;
	Tue, 10 Jan 2023 15:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CFAC433EF;
	Tue, 10 Jan 2023 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673362969;
	bh=sKgWysTb+sBvYEAqYlhx7Bnltvv0i7EhCIfzFtUqpQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CoepT9JQfZEoRk+MtW+ITnAysDwdWSmN7GF9I2qzH1rU3SEI/ahWHway48lRTQxEJ
	 8zDm645kDIwo5u0UgwxnIZfYmmiwLC2wbSGGmIiEr/BLtxeqFaqDkKX3DWpEYmti/7
	 mI8yQ7hLP/rDPYqKVTs82G88op92N7U6t2fMwqO6HZHrp0R0l0L+lXjmry9SkWFFkJ
	 urlSO5eCEWDWmWWolyG1BKDa0tWenOzPFUgN4JrBuHdCjbR7e4eCctSqjH955+P9h4
	 ZaW2VxD+J1wkLtqv4FoLY3gwlbgMJ5NCkNKTmVyjswYub9hN9n7C/0jwF0HaL1NuBz
	 koAtRsViexyBw==
Date: Tue, 10 Jan 2023 08:02:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <Y71+FxR58VjDim5v@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
 <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
 <20230109222337.GM25951@gate.crashing.org>
 <CAKwvOdn3En6kdGBmDF4nFYpMgR0Dx0cgaTH1pPZdEcAJTZWaPg@mail.gmail.com>
 <Y7y2izKLUYr7giKj@dev-arch.thelio-3990X>
 <20230110114523.GP25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110114523.GP25951@gate.crashing.org>
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
Cc: kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 10, 2023 at 05:45:23AM -0600, Segher Boessenkool wrote:
> On Mon, Jan 09, 2023 at 05:51:23PM -0700, Nathan Chancellor wrote:
> > So for this patch, I have
> > 
> >   When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> >   warns:
> > 
> >     clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> > 
> >   The compiler's '-s' flag is a linking option (it is passed along to the
> >   linker directly), which means it does nothing when the linker is not
> >   invoked by the compiler. The kernel builds all .o files with either '-c'
> >   or '-S', which do not run the linker, so '-s' can be safely dropped from
> >   ASFLAGS.
> > 
> > as a new commit message. Is that sufficient for everyone? If so, I'll
> > adjust the s390 commit to match, as it is the same exact problem.
> 
> Almost?  -S doesn't write .o files, it writes a .s file.  To go from an
> assembler file (.s, or .S if you want to run the C preprocessor on non-C
> code for some strange reason, the assembler macro facilities are vastly
> superior) to an object file is just -c as well.

Heh, right, that is what I get for not paying attention and rushing at
the end of my day :) thanks for being pendantic, I will get that ironed
out for v2, which I should have out later today or tomorrow, time
permitting.

Cheers,
Nathan
