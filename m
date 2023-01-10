Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB4A663F87
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 12:53:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrq2T2M6mz3fCW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 22:53:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrq1v6pwHz3c6W
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 22:52:51 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 30ABjQic021510;
	Tue, 10 Jan 2023 05:45:26 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 30ABjNkV021509;
	Tue, 10 Jan 2023 05:45:23 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 10 Jan 2023 05:45:23 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <20230110114523.GP25951@gate.crashing.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org> <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com> <20230109222337.GM25951@gate.crashing.org> <CAKwvOdn3En6kdGBmDF4nFYpMgR0Dx0cgaTH1pPZdEcAJTZWaPg@mail.gmail.com> <Y7y2izKLUYr7giKj@dev-arch.thelio-3990X>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7y2izKLUYr7giKj@dev-arch.thelio-3990X>
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
Cc: kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 09, 2023 at 05:51:23PM -0700, Nathan Chancellor wrote:
> So for this patch, I have
> 
>   When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
>   warns:
> 
>     clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> 
>   The compiler's '-s' flag is a linking option (it is passed along to the
>   linker directly), which means it does nothing when the linker is not
>   invoked by the compiler. The kernel builds all .o files with either '-c'
>   or '-S', which do not run the linker, so '-s' can be safely dropped from
>   ASFLAGS.
> 
> as a new commit message. Is that sufficient for everyone? If so, I'll
> adjust the s390 commit to match, as it is the same exact problem.

Almost?  -S doesn't write .o files, it writes a .s file.  To go from an
assembler file (.s, or .S if you want to run the C preprocessor on non-C
code for some strange reason, the assembler macro facilities are vastly
superior) to an object file is just -c as well.

> Alternatively, if '-s' should actually remain around, we could move it
> to ldflags-y, which is added in patch 7. However, I assume that nobody
> has noticed that it has not been doing its job for a while, so it should
> be safe to remove.

+1


Segher
