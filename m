Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA99C46B31D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 07:42:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7W1z6KLPz3bd0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 17:42:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YWEe5ZiM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=nathan@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YWEe5ZiM; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7W1G4pwKz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 17:41:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 13D1FCE19C0;
 Tue,  7 Dec 2021 06:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25477C341C3;
 Tue,  7 Dec 2021 06:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638859307;
 bh=POoGYJs9VhjJIKQ+d/5VPBduu92lNhleSKxgi2DOQT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YWEe5ZiMt32ognmzxj6DJ0DcSFzD2lPO8dNB4czF0KncAPlv18TyfQzfbsoG77Cgq
 Gm/Qnao1twKQv97m8txfaRTgvw+qLKWixyMSQq9z9EyIhxY7GwRe4X1iDM8Q8uB9cb
 Dk+pFayN8S/mkrX11KRxK1MvHkN7LuRF5AhWklucrohRI0GUYogfziC/nB2leTo3BN
 3Cn9WAq27HACplc4xftfTL1K9lvZSXMINxP83gjy/1eGQuwXxyLaOXdOD7Z7WanzQo
 SciFsHKdyNiHB2teEHI9q4C9YDEvMXjzyHFTVZHmp5hcAzKBDLQp1UxkR90t1QwUFy
 ZW1YewXG0sH8A==
Date: Mon, 6 Dec 2021 23:41:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 5/5] powerpc/inst: Optimise
 copy_inst_from_kernel_nofault()
Message-ID: <Ya8CJacaIHLyIAuG@archlinux-ax161>
References: <0d5b12183d5176dd702d29ad94c39c384e51c78f.1638208156.git.christophe.leroy@csgroup.eu>
 <202111300652.0yDBNvyJ-lkp@intel.com>
 <e7b67ca6-8cd1-da3c-c0f3-e05f7e592828@csgroup.eu>
 <87a6hlq408.fsf@mpe.ellerman.id.au>
 <YaZqs2tPxMzhgkAW@archlinux-ax161>
 <CAGG=3QX4k6MZ1qkT+sVAroJeBpbZBnOJauM_uJsu2uV1vnVObQ@mail.gmail.com>
 <CAGG=3QVQ9bwWWyKDN3_C2B0v7H6iZ4ZpNybXGCqbzwWrPjuPrg@mail.gmail.com>
 <87o85tnkzt.fsf@mpe.ellerman.id.au>
 <Ya7ntJ0ehZPy6HKA@archlinux-ax161>
 <861ec7f6-ba1f-2c7d-7e20-cad6e6bc1d1a@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <861ec7f6-ba1f-2c7d-7e20-cad6e6bc1d1a@csgroup.eu>
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kernel test robot <lkp@intel.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Bill Wendling <morbo@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 07, 2021 at 05:45:08AM +0000, Christophe Leroy wrote:
> 
> 
> Le 07/12/2021 à 05:48, Nathan Chancellor a écrit :
> > On Tue, Dec 07, 2021 at 02:37:26PM +1100, Michael Ellerman wrote:
> >> Bill Wendling <morbo@google.com> writes:
> >>> On Tue, Nov 30, 2021 at 10:38 AM Bill Wendling <morbo@google.com> wrote:
> >>>> On Tue, Nov 30, 2021 at 10:17 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >>>>> On Tue, Nov 30, 2021 at 10:25:43PM +1100, Michael Ellerman wrote:
> >>>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> >>>>>>> Le 29/11/2021 à 23:55, kernel test robot a écrit :
> >> ...
> >>>>>>>> All warnings (new ones prefixed by >>):
> >>>>>>>>
> >>>>>>>>      In file included from arch/powerpc/kernel/asm-offsets.c:71:
> >>>>>>>>      In file included from arch/powerpc/kernel/../xmon/xmon_bpts.h:7:
> >>>>>>>>>> arch/powerpc/include/asm/inst.h:165:20: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
> >>>>>>>>                      *inst = ppc_inst(val);
> >>>>>>>>                                       ^~~
> >>>>>>>>      arch/powerpc/include/asm/inst.h:53:22: note: expanded from macro 'ppc_inst'
> >>>>>>>>      #define ppc_inst(x) (x)
> >>>>>>>>                           ^
> >>>>>>>>      arch/powerpc/include/asm/inst.h:155:18: note: initialize the variable 'val' to silence this warning
> >>>>>>>>              unsigned int val, suffix;
> >>>>>>>>                              ^
> >>>>>>>>                               = 0
> >>>>>>>
> >>>>>>> I can't understand what's wrong here.
> >> ...
> >>>>>>>
> >>>>>>> I see no possibility, no alternative path where val wouldn't be set. The
> >>>>>>> asm clearly has *addr as an output param so it is always set.
> >>>>>>
> >>>>>> I guess clang can't convince itself of that?
> >> ...
> >>>>>
> >>>>> It certainly looks like there is something wrong with how clang is
> >>>>> tracking the initialization of the variable because it looks to me like
> >>>>> val is only used in the fallthrough path, which happens after it is
> >>>>> initialized via lwz.  Perhaps something is wrong with the logic of
> >>>>> https://reviews.llvm.org/D71314?  I've added Bill to CC (LLVM issues are
> >>>>> being migrated from Bugzilla to GitHub Issues right now so I cannot file
> >>>>> this upstream at the moment).
> >>>>>
> >>>> If I remove the casts of "val" the warning doesn't appear. I suspect
> >>>> that when I wrote that patch I forgot to remove those when checking.
> >>>> #include "Captain_Picard_facepalm.h"
> >>>>
> >>>> I'll look into it.
> >>>>
> >>> Small retraction. It's the "*(<cast>)&val" that's the issue. (I.e. the "*&")
> >>
> >> I guess for now I'll just squash this in as a workaround?
> >>
> >>
> >> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> >> index 631436f3f5c3..5b591c51fec9 100644
> >> --- a/arch/powerpc/include/asm/inst.h
> >> +++ b/arch/powerpc/include/asm/inst.h
> >> @@ -157,6 +157,9 @@ static inline int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
> >>   	if (unlikely(!is_kernel_addr((unsigned long)src)))
> >>   		return -ERANGE;
> > 
> > Could we add a version check to this and a link to our bug tracker:
> > 
> > /* https://github.com/ClangBuiltLinux/linux/issues/1521 */
> > #if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 140000
> 
> The robot reported the problem on:
> 
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 
> df08b2fe8b35cb63dfb3b49738a3494b9b4e6f8e)
> 
> Should it be CONFIG_CLANG_VERSION <= 140000 ?

The robot tests clang from tip of tree, rebuilding every week or so. The
fix is getting ready to land so it will be released in 14.0.0 final. We
have always written tip of tree version checks with the expectation that
if people are testing tip of tree clang, they are frequently rebuilding.
If that is not true, they need to be using released/stable versions,
otherwise the model is broken.

If that is too problematic, we could add a version check to Kconfig
(cannot think of a great name for the config off the top of my head)
that checks for this issue and ifdef on that. That might be nice in
case another instance of this crops up in the future.

Cheers,
Nathan

> > 
> >> +#ifdef CONFIG_CC_IS_CLANG
> >> +	val = suffix = 0;
> >> +#endif
> >>   	__get_kernel_nofault(&val, src, u32, Efault);
> >>   	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
> >>   		__get_kernel_nofault(&suffix, src + 1, u32, Efault);
> >>
> 
> Christophe
