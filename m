Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 193365AB00E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 14:48:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJyPk2jpYz3brh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 22:48:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJyPG3fcDz2yYj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 22:47:44 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 282CeGbE005773;
	Fri, 2 Sep 2022 07:40:16 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 282CeEKR005772;
	Fri, 2 Sep 2022 07:40:14 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 2 Sep 2022 07:40:14 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/math_emu/efp: Include module.h
Message-ID: <20220902124014.GM25951@gate.crashing.org>
References: <20220831152014.3501664-1-nathan@kernel.org> <efd56f3e-bc8c-5da5-559d-e0bc6b21fa5b@csgroup.eu> <20220901194705.GI25951@gate.crashing.org> <ae2ee2d8-ec0a-d0ab-2c5a-b9a8c7579093@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae2ee2d8-ec0a-d0ab-2c5a-b9a8c7579093@csgroup.eu>
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
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "patches@lists.linux.dev" <patches@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 02, 2022 at 08:43:49AM +0000, Christophe Leroy wrote:
> Le 01/09/2022 à 21:47, Segher Boessenkool a écrit :
> > On Thu, Sep 01, 2022 at 05:41:33AM +0000, Christophe Leroy wrote:
> >> I think it would be worth a GCC bug report.
> > 
> > We need a stand-alone testcase for this.  When you have created one, at
> > least 98% of the time you discover the bug is in user code after all.
> > 
> > Which is a very good thing, it means the problem can be fixed simpler,
> > cheaper, and a lot faster :-)
> 
> Easy to reproduce with a .c file that has a single line:
> 
> non_existing_macro(xxx);

That was fast (and cheap and simple) :-)

> Apparently that's due to the -w option in arch/powerpc/math_emu/Makefile:
> 
> 	ccflags-y = -w
> 
> Was introduced by commit d2b194ed8208 ("powerpc/math-emu: Use kernel 
> generic math-emu code")
> 
> If I understand correctly it means 'ignore all warnings'. Then it seems 
> CLANG doesn't honor that request.

'-w'
     Inhibit all warning messages.

GCC's initial commit has this already (1992).


Segher
