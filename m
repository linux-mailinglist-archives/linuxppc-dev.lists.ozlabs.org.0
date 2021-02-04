Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C52BF30ECFB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 08:09:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWV6X0123zDwsB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 18:09:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.59;
 helo=mta-06-3.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from MTA-06-3.privateemail.com (mta-06-3.privateemail.com
 [198.54.127.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWV4f2phLzDwpk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 18:08:01 +1100 (AEDT)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id 78EE66009C;
 Thu,  4 Feb 2021 02:07:57 -0500 (EST)
Received: from localhost (unknown [10.20.151.215])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id 23E4960099;
 Thu,  4 Feb 2021 07:07:57 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH] powerpc64/idle: Fix SP offsets when saving GPRs
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Nicholas Piggin" <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>
Date: Thu, 04 Feb 2021 00:59:37 -0600
Message-Id: <C90JVYFOGWU0.1C2DRATSDH0FM@geist>
In-Reply-To: <1612014056.e1qcnzac7c.astroid@bobo.none>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Jan 30, 2021 at 7:44 AM CST, Nicholas Piggin wrote:
> Excerpts from Michael Ellerman's message of January 30, 2021 9:32 pm:
> > "Christopher M. Riedl" <cmr@codefail.de> writes:
> >> The idle entry/exit code saves/restores GPRs in the stack "red zone"
> >> (Protected Zone according to PowerPC64 ELF ABI v2). However, the offse=
t
> >> used for the first GPR is incorrect and overwrites the back chain - th=
e
> >> Protected Zone actually starts below the current SP. In practice this =
is
> >> probably not an issue, but it's still incorrect so fix it.
> >=20
> > Nice catch.
> >=20
> > Corrupting the back chain means you can't backtrace from there, which
> > could be confusing for debugging one day.
>
> Yeah, we seem to have got away without noticing because the CPU will
> wake up and return out of here before it tries to unwind the stack,
> but if you tried to walk it by hand if the CPU got stuck in idle or
> something, then we'd get confused.
>
> > It does make me wonder why we don't just create a stack frame and use
> > the normal macros? It would use a bit more stack space, but we shouldn'=
t
> > be short of stack space when going idle.
> >=20
> > Nick, was there a particular reason for using the red zone?
>
> I don't recall a particular reason, I think a normal stack frame is
> probably a good idea.

I'll send a version using STACKFRAMESIZE - I assume that's the "normal"
stack frame :)

I admit I am a bit confused when I saw the similar but much smaller
STACK_FRAME_OVERHEAD which is also used in _some_ cases to save/restore
a few registers.

>
> Thanks,
> Nick

