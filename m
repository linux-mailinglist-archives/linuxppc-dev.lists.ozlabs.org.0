Return-Path: <linuxppc-dev+bounces-5685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB4CA21EDB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 15:15:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjkh568djz30Gm;
	Thu, 30 Jan 2025 01:15:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738160117;
	cv=none; b=kaxjp6U/vTSNTb/fIaL07DiTk2UfDLCb0Wjx88f33yi/UPZHWS+k0G2kTAG/WZhgQ+JPaobDvFiN4Fk58R9sTIfLqa5BVOwJnuH9KilFI2gYoqtrFqQAXhUgBlJF8He4+xscZBX7E+iVgs0TzaPY1sFQaZD7KXeztPUwgcv38xKECE8Q7Gw/7XB+BmUPB8bkybiIrGBxKixlGUCInwrvjFLX9LIoGwYPReElRt8bh5IwIO1Q8TV/BXvjhKZEdCa19d5WXxbZn3eGh51Nxa8vhLTCskv88ljqmyszP15oGMOBrZCHFX5TA+ZwMZuKdSsq0dTyhHA9QO1IFQS4MoPuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738160117; c=relaxed/relaxed;
	bh=cPf6f3fhf4DbA/nOxevbkm/6Cm4rtrde793t8EYlWCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIRUY9y5F8Df7pv1Pu0nZaQIJfXdkLT7lXlO0viTr6p+yo9DL2XkalZjE97vm1cM30N+no/bv3Dvbax2Dd2W+XZkKUYKg9Q/WhbF2GCFuiuZ0eKjHja0xm7xXT94NJBCpXZuhrUqWfHOi2m8qJDAAFW85QMsExT2nD8ISSCPgAhnMm3jYsNMf3nR2r2OlOBabR1bJuwe0fEUReeZVW8BuyEU4uGtnu3WiTPM5Vpdnk+eEPD9ppw1qRcrhNjWOeZwD/facqWi3Y5yzQopep3GhTQEVnKrEMAta5RldjLoY8SH0OdW6it5r67bUtSBgX+mw/TH6IWURVtdGWLU3Gro7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjkh46DHKz305v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 01:15:16 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 22C3F72C97D;
	Wed, 29 Jan 2025 17:15:14 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 12E937CCB3A; Wed, 29 Jan 2025 16:15:14 +0200 (IST)
Date: Wed, 29 Jan 2025 16:15:14 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] powerpc: change syscall error return scheme
Message-ID: <20250129141513.GA21809@strace.io>
References: <20250129132148.301937-1-npiggin@gmail.com>
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
In-Reply-To: <20250129132148.301937-1-npiggin@gmail.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Wed, Jan 29, 2025 at 11:21:41PM +1000, Nicholas Piggin wrote:
> Hi,
> 
> I've been toying with the seccomp vs syscall return value problems, and
> wonder if something like this approach could give us a simpler alternative.
> Basically all the core code uses -errno return value, then we convert it
> to the powerpc convention at the last minute when returning.
> 
> This seems to pass the seccomp_bpf test cases when applied with the set
> syscall info ptrace patches
> 
> https://lore.kernel.org/lkml/20250113171054.GA589@strace.io/
> 
> With patch 1 of that series reverted.
> 
> One concern is working out exact details of what tracers can see and
> trying to ensure it doesn't break some corner case.

Does the strace test suite also pass with your changes?
My bet is it doesn't pass because do_syscall_trace_leave() is called
with a different state of struct pt_regs.

As I wrote yesterday, the traditional powerpc sc syscall return ABI is
exposed to user space not just when returning to user space, but, besides
that, at syscall exit tracepoint (trace_sys_exit), ptrace syscall exit
stop (ptrace_report_syscall_exit), and PTRACE_EVENT_SECCOMP stop
(__secure_computing).

There could be other points where this is exposed.  For example, on many
architectures the tracer can specify syscall error return value also at
ptrace syscall entry stop (ptrace_report_syscall_entry), but powerpc does
not implement this.


-- 
ldv

