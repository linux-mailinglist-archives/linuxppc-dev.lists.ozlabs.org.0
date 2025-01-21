Return-Path: <linuxppc-dev+bounces-5448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD27A17DEA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 13:42:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycn112fkWz30CF;
	Tue, 21 Jan 2025 23:42:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737463365;
	cv=none; b=RdIPteCGmoSWU1bxUTFQlWuhDWSwV0v9F+aQBPC685r2l5iBcobPi9kfAGXIrDhPXhq3BWKOgQGsGtCAxo5D/xX/i2p/ln+XNftYwCiQC9yi0zKcAZkvuBTDUHPJjxxZpD7G+F0rkcJjXVAJ8fHtU2Tfk9ZxU7TpUUqy2Qegzq9FoQgzh9QTlJyazcmVq7PEPyhhyhuK54QrvInKlLfxGjSULF+kM3IFmolR8AvpBAoB4YnSh9GFybSUnMYCygGGZgpDIseahfKx8mf2CnTEtE2BTnp3tp5XWCF6qYpCQXSe8dwdXestEEOGEEMakzv2wMw7uPhk7+OCjq8VCMYvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737463365; c=relaxed/relaxed;
	bh=ElzcEOMbqI6rsbSd/v5ohUIx9bgu9RhjqMKmQWslgmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eS49v1lKHcoP7FBq4dAq+Op3cdeMsOW5btcPC85mJyDs94NUbHM361C/c8nQEG6/VTeZrj6r7Mpj/GygkFRqu8Z91UfS+mk9IB57BEKeaKYZbNyqIR9HoYr3M/U00XOsQ/8qKRSGPP9LQs1uOfw6iP7oiDxZjTNSaCNp0TJSThsYP51r7v5g6KkeF059fxyJ6y71YNFE0MGW43vHoo9I1l4V5mGlrqqmxq8PaPXShHhy/7GbVq0iP4PpMGhJRWdNchZSw0UgyaIN+EVCHK+orIsb0xBY8ZQnoqdt4dSXhRgellefz9pmh0qVe9URrbB6x5a0QJNckwjUExItufd3Cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycn0z6Ghzz30CD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 23:42:43 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 2740B72C8F5;
	Tue, 21 Jan 2025 15:42:41 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id F18D57CCB3A; Tue, 21 Jan 2025 14:42:40 +0200 (IST)
Date: Tue, 21 Jan 2025 14:42:40 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
Message-ID: <20250121124240.GA26746@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250120171249.GA17320@strace.io>
 <70dc8099-e725-4069-9b3a-af31578278e2@linux.ibm.com>
 <70cb8e5b-7ee5-494a-a02a-ef286f8c970c@csgroup.eu>
 <697c1f59-80d7-4958-a8c1-e988f657d437@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <697c1f59-80d7-4958-a8c1-e988f657d437@linux.ibm.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 21, 2025 at 05:55:40PM +0530, Madhavan Srinivasan wrote:
> On 1/21/25 4:58 PM, Christophe Leroy wrote:
> > Le 21/01/2025 à 12:13, Madhavan Srinivasan a écrit :
> >> On 1/20/25 10:42 PM, Dmitry V. Levin wrote:
> >>> On Mon, Jan 20, 2025 at 02:51:38PM +0100, Christophe Leroy wrote:
> >>>> Le 14/01/2025 à 18:04, Dmitry V. Levin a écrit :
> >>>>> On Mon, Jan 13, 2025 at 06:34:44PM +0100, Christophe Leroy wrote:
> >>>>>> Le 13/01/2025 à 18:10, Dmitry V. Levin a écrit :
> >>>>>>> Bring syscall_set_return_value() in sync with syscall_get_error(),
> >>>>>>> and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
> >>
> >> Sorry for getting to this thread late.
> >>
> >> Tried the series without this patch in
> >>
> >> 1) power9 PowerNV system and in power10 pSeries lpar
> >>
> >> # ./set_syscall_info
> >> TAP version 13
> >> 1..1
> >> # Starting 1 tests from 1 test cases.
> >> #  RUN           global.set_syscall_info ...
> >> #            OK  global.set_syscall_info
> >> ok 1 global.set_syscall_info
> >> # PASSED: 1 / 1 tests passed.
> >> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> >>
> >> and in both case set_syscall_info passes.
> >> Will look at it further.
> > 
> > I guess it works because power9/10 are using scv not sc for system call, hence using the new ABI ?
> 
> yeah, I guess.
> This is from the a Power8 pSeries lpar without this patch
> 
> # ./set_syscall_info 
> TAP version 13
> 1..1
> # Starting 1 tests from 1 test cases.
> #  RUN           global.set_syscall_info ...
> # set_syscall_info.c:428:set_syscall_info:wait #5: unexpected stop signal 11
> # set_syscall_info: Test terminated by assertion
> #          FAIL  global.set_syscall_info
> not ok 1 global.set_syscall_info
> # FAILED: 0 / 1 tests passed.
> # Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0

I've enhanced error diagnostics of the test a bit.  Inspired by this
powerpc bug, in the next iteration of the patchset the test would also
invoke PTRACE_GET_SYSCALL_INFO right after PTRACE_SET_SYSCALL_INFO to
check whether the changes are applied by the kernel correctly.
Without the fix, in non-svc case the test would complain this way:

# set_syscall_info.c:119:set_syscall_info:Expected exp_exit->rval (-38) == info->exit.rval (38)
# set_syscall_info.c:120:set_syscall_info:wait #4: PTRACE_GET_SYSCALL_INFO #2: exit stop mismatch


-- 
ldv

