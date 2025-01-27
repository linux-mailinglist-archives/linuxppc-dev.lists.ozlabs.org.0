Return-Path: <linuxppc-dev+bounces-5592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B0BA1D520
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 12:13:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhQl02ZC9z301B;
	Mon, 27 Jan 2025 22:13:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737976396;
	cv=none; b=iG0qNUN25l0/Wfzq2yV1fOyC4KY9yZBVGLpDiFYpPcHG/Q6ywlhxFOJU00CJ87hA+14yg9eU74xK6N/jDN/WqHXJ73mK5slQVM5K9v5Tt9g3fCgWundh9k5mSUPlIyvNI0ufv8ffkZNio71doYCuLGoPaSO/z4Aeb/x4Eb6F1yVhnJTopOnYYquHnf+FhrReJAAoqvqonsZ/HpWZdND0dtSK0HNJ9pc5wJsLPp8E3Lb/U7jiEmWoq5FvwkDlHFSPiZlj5CvK7Dq51rYmte4YomqJoi7GWixDV++Ut0yWe0XIYMnV/qtsBwkcWY5qJMYs30RE0GGUr3ED5Rp27WxpYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737976396; c=relaxed/relaxed;
	bh=vWWQofWWKYl33ZLLsk1AyfT68+M86SZrA1aqi1IoXv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2Wv3wqKlv08QFtjAPF5gZIR757laIyXwSxY8GtnbCUt9fKHw3dvToRau95+sTEb5pLo/vJngaHQ8f9iwUv6p2vQ463qd/SmV0Kh60mzk9mHIdcRHiTwFHmbjUQHsfplL9GDts/7WRLsC03e025ggYa4S6SlRucHBo6/uYZq46F2HUcJs6XAKo54d8XAcvmCf4JAkoztcHsJBtfbSqUZLiQuhlTzoCe+Xd3l7lfrlbuikrpQYYAZ5fRlf6v3OIQ8LS1TBXxHtyE/v/lMDyi9h9779kxFWnuKfdlnXBN97V6g4BHq9YB+mjcMZ9xJR0Q85GW3p9jbixnoF/NX64AHZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhQkz3JzKz3011
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 22:13:14 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id D10AF72C8CC;
	Mon, 27 Jan 2025 14:13:10 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id C56D77CCB3A; Mon, 27 Jan 2025 13:13:10 +0200 (IST)
Date: Mon, 27 Jan 2025 13:13:10 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Alexey Gladkov <legion@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
Message-ID: <20250127111310.GA29522@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io>
 <20250123234321.GA23582@strace.io>
 <Z5OvMgjMd3xzx4mS@example.org>
 <87ikq3jddt.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikq3jddt.fsf@mpe.ellerman.id.au>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Jan 25, 2025 at 11:18:06PM +1100, Michael Ellerman wrote:
> Alexey Gladkov <legion@kernel.org> writes:
> >
> ...
> > I'm not a powerpc expert but shouldn't be used regs->gpr[3] via a
> > regs_return_value() in system_call_exception() ?
> 
> Yes I agree.
> 
> > notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
> > {
> > ...
> > 		r0 = do_syscall_trace_enter(regs);
> > 		if (unlikely(r0 >= NR_syscalls))
> > 			return regs->gpr[3];
> 
> This is the case where we're expecting the r3 value to be a negative
> error code, to match the in-kernel semantics. But after this change it
> would be a positive error value. It is probably harmless with the
> current code structure, but that's just luck.

I'm afraid that's not just luck.  do_seccomp() from the very beginning
supports both the generic kernel -ERRORCODE return value ABI and the
powerpc sc syscall return ABI, thanks to syscall_exit_prepare() that
converts the former to the latter.  Given that this inconsistency was
exposed to user space via PTRACE_EVENT_SECCOMP tracers for so many years,
I suppose backwards compatibility has to be provided.  Consequently, since
the point of __secure_computing() invocation and up to the point of
conversion in syscall_exit_prepare(), gpr[3] may be set according to
either of these two ABIs.  Unfortunately, this means any future attempt
to avoid the inconsistency would be inherently incomplete.

For this reason, I doubt it would make sense to include into the patch
any changes that are needed only to address this consistency issue.


-- 
ldv

