Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C855EE6C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 22:45:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Md7my6y4fz3c1x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 06:45:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FRS4YOgm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FRS4YOgm;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md7mM2Kqcz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 06:45:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9E20FB821BC;
	Wed, 28 Sep 2022 20:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A01EC433C1;
	Wed, 28 Sep 2022 20:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664397916;
	bh=TUNfwWR1HJKegUyNHHt9zSljJ1tJhnGeXq9PyLq/f/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRS4YOgmIGbA0a2Oin8Y7efgYpOv/ySxdSQGwgck/sn+mYml4c0bqIYOprvM3TmrQ
	 vXPzYZ/PjKq65VgiM0AXU3FC+SLUjTzGXBOkp9GUr54cZ6f44Z7feBSwzMc7H3b93j
	 91QK40KRgO0WpYvf1goekKukYaG5FUB5vWuWvUvreN/l8v/nsktG8cfWwFR8KdC5by
	 euWuvg/vVZsb+w64TYIqzS4+MZaK8S0C7qE4xKjC+Tdk3sCLu+UaNNKbcW00Ioxuz4
	 BkLuVeHH0wkUdPO0i1M2+VQferEwq7Al4brv4QyuGtusnZHriTp6TGmD1tFHJHz+KC
	 vr+eBqzcjcb6Q==
Date: Wed, 28 Sep 2022 13:45:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [objtool] ca5e2b42c0: kernel_BUG_at_arch/x86/kernel/jump_label.c
Message-ID: <YzSyWWGsC0lGriYA@dev-arch.thelio-3990X>
References: <20220912082020.226755-12-sv@linux.ibm.com>
 <202209280801.2d5eebb5-yujie.liu@intel.com>
 <YzRr23Bn6qFDC7j0@dev-arch.thelio-3990X>
 <20220928191353.yu2o7rhkhpi3n74z@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928191353.yu2o7rhkhpi3n74z@treble>
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
Cc: kernel test robot <yujie.liu@intel.com>, lkp@intel.com, linux-kbuild@vger.kernel.org, aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, npiggin@gmail.com, Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, Sathvika Vasireddy <sv@linux.ibm.com>, rostedt@goodmis.org, jpoimboe@redhat.com, lkp@lists.01.org, mbenes@suse.cz, chenzhongjin@huawei.com, naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 28, 2022 at 12:13:53PM -0700, Josh Poimboeuf wrote:
> On Wed, Sep 28, 2022 at 08:44:27AM -0700, Nathan Chancellor wrote:
> > This crash appears to just be a symptom of objtool erroring throughout
> > the entire build, which means things like the jump label hacks do not
> > get applied. I see a flood of
> > 
> >   error: objtool: --mnop requires --mcount
> > 
> > throughout the build because the configuration has
> > CONFIG_HAVE_NOP_MCOUNT=y because CONFIG_HAVE_OBJTOOL_MCOUNT is
> > unconditionally enabled for x86_64 due to CONFIG_HAVE_OBJTOOL but
> > '--mcount' is only actually used when CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
> > is enabled so '--mnop' gets passed in without '--mcount'. This should
> > obviously be fixed somehow, perhaps by moving the '--mnop' addition into
> > the '--mcount' if, even if that makes the line really long.
> > 
> > A secondary issue is that it seems like if objtool encounters a fatal
> > error like this, it should completely fail the build to make it obvious
> > that something is wrong, rather than allowing it to continue and
> > generate a broken kernel, especially since x86_64 requires objtool to
> > build a working kernel at this point.
> 
> Grrr... I really dislike that objtool is capable of bricking the kernel
> like this.  We just saw something similar in RHEL.
> 
> IMO, we should just get rid of this "short JMP" feature in the jump
> label code, those saved three bytes aren't worth the pain.
> 
> But yes, we do need to fix that config issue.

Right, I actually see that the report I was CC'd on was a part of a
larger thread, where Naveen already suggested the fix for this problem,
which is not clang specific it seems:

https://lore.kernel.org/1663223588.wppdx3129x.naveen@linux.ibm.com/

> And yes, maybe fatal objtool warnings should cause a build failure.  We
> used to do that, but it brought a different sort of pain.  But if
> objtool is going to be in the kernel's critical boot path then I guess
> we have to do that.

Right, that was

  644592d32837 ("objtool: Fail the kernel build on fatal errors")

which was reverted in

  655cf86548a3 ("objtool: Don't fail the kernel build on fatal errors")

objtool should not error on warnings but it seems like it should error
for invalid option combinations and other misconfiguration problems? Did
this regress with commit b51277eb9775 ("objtool: Ditch subcommands")? I
can see that the return code of the subcommands would be passed back via
exit() (?) so objtool could fail the build if there was a true problem
but after that change, objtool_run() does not have its return code
checked so any errors that happen don't get passed back up. Perhaps just
the following diff would resolve this? I assume we would need to look at
all the different return values to know if this is safe though.

Cheers,
Nathan

diff --git a/tools/objtool/objtool.c b/tools/objtool/objtool.c
index a7ecc32e3512..cda649644e32 100644
--- a/tools/objtool/objtool.c
+++ b/tools/objtool/objtool.c
@@ -146,7 +146,5 @@ int main(int argc, const char **argv)
 	exec_cmd_init("objtool", UNUSED, UNUSED, UNUSED);
 	pager_init(UNUSED);
 
-	objtool_run(argc, argv);
-
-	return 0;
+	return objtool_run(argc, argv);
 }
