Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E2A5EE4DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:14:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Md5lV4LV5z3c6C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 05:14:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kekBmyiz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kekBmyiz;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md5kx0Y1Kz2xJM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 05:14:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5BF54CE068A;
	Wed, 28 Sep 2022 19:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C75C433D6;
	Wed, 28 Sep 2022 19:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664392435;
	bh=pwdpaHy4JfFsu1FhFw+lb4jAa9ctSa587IaYVjG346A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kekBmyizrwLU4Bb7ZghMcKJLqaAM7DS5Mj1mXUok+G/cwsZu4oBNpQ2zxTP47YaE8
	 elMRowzgOD/0jZAIxpvjaG9qa8DcEDVP9JARRRClbbl9MGxZ+dV0fyqrw+EGomoXdL
	 hnwoZNx9TRgikCVqu2vd7hjZtnCiEz1lJOYO1j3Xba214+nXlOg0+J11a/wgmdqqTr
	 AReP0pFcQoBBQrgAPhbqze59HaiX7uNwdNY/oVkrPptv9/S/yqQaP+IMxPrYdW+Izd
	 Ikegucxc1JzGfzetgY2aCW1Ix0uA52BtKwUcSwvTLYye6ORa8Tgy2UYxZDv3WclL8t
	 fZRcd15XrhQtg==
Date: Wed, 28 Sep 2022 12:13:53 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [objtool] ca5e2b42c0: kernel_BUG_at_arch/x86/kernel/jump_label.c
Message-ID: <20220928191353.yu2o7rhkhpi3n74z@treble>
References: <20220912082020.226755-12-sv@linux.ibm.com>
 <202209280801.2d5eebb5-yujie.liu@intel.com>
 <YzRr23Bn6qFDC7j0@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YzRr23Bn6qFDC7j0@dev-arch.thelio-3990X>
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

On Wed, Sep 28, 2022 at 08:44:27AM -0700, Nathan Chancellor wrote:
> This crash appears to just be a symptom of objtool erroring throughout
> the entire build, which means things like the jump label hacks do not
> get applied. I see a flood of
> 
>   error: objtool: --mnop requires --mcount
> 
> throughout the build because the configuration has
> CONFIG_HAVE_NOP_MCOUNT=y because CONFIG_HAVE_OBJTOOL_MCOUNT is
> unconditionally enabled for x86_64 due to CONFIG_HAVE_OBJTOOL but
> '--mcount' is only actually used when CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
> is enabled so '--mnop' gets passed in without '--mcount'. This should
> obviously be fixed somehow, perhaps by moving the '--mnop' addition into
> the '--mcount' if, even if that makes the line really long.
> 
> A secondary issue is that it seems like if objtool encounters a fatal
> error like this, it should completely fail the build to make it obvious
> that something is wrong, rather than allowing it to continue and
> generate a broken kernel, especially since x86_64 requires objtool to
> build a working kernel at this point.

Grrr... I really dislike that objtool is capable of bricking the kernel
like this.  We just saw something similar in RHEL.

IMO, we should just get rid of this "short JMP" feature in the jump
label code, those saved three bytes aren't worth the pain.

But yes, we do need to fix that config issue.

And yes, maybe fatal objtool warnings should cause a build failure.  We
used to do that, but it brought a different sort of pain.  But if
objtool is going to be in the kernel's critical boot path then I guess
we have to do that.

-- 
Josh
