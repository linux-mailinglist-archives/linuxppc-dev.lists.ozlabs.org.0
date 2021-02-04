Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 635AB30F290
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 12:42:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWc971wtLzDsTf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 22:42:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWbXG4zZMzDwnC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 22:13:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kxhb1SPM; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWbXF1dsXz9sXV;
 Thu,  4 Feb 2021 22:13:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612437229;
 bh=rwhtIo2G03JfiwkA2DyZ7iXjFo2rzlpj42vxSJMaqLY=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=kxhb1SPMr/5k/LUxXWPgijScRy92ABDlRTUgBqE0R42XovonB3ZQzaAMGNX1T2Zg5
 ZkLHFYCGyZmu7auPI7xzmu5EX6HbJkINKDCnl5c1sW2XnTkqvRIrloHPamfbUiDrWR
 REuT9Yy1+cQck2OMsSpXEHPQmLBRAo7liGusK+TpDseuXWSxbsn2aIf+dbMtgKUL3k
 dVjKSZdIE008kMjF3MR9mMaXAH0VyN8nZvVmnd1cS9SARY3xCVdbE3SZvLpLFIWDYB
 foJ5CmL5lY1q3e01r3Ff1tVdYXlrIOu4Zg6dQE2Cm/Ilhma3tOX4EUXE+0awFjkB4b
 ft/Z16ZmBw10Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, "Christopher M. Riedl"
 <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc64/idle: Fix SP offsets when saving GPRs
In-Reply-To: <1612429032.j2hz14yfcw.astroid@bobo.none>
References: <C90JVYFOGWU0.1C2DRATSDH0FM@geist>
 <1612429032.j2hz14yfcw.astroid@bobo.none>
Date: Thu, 04 Feb 2021 22:13:48 +1100
Message-ID: <87eehwozkj.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Christopher M. Riedl's message of February 4, 2021 4:59 pm:
>> On Sat Jan 30, 2021 at 7:44 AM CST, Nicholas Piggin wrote:
>>> Excerpts from Michael Ellerman's message of January 30, 2021 9:32 pm:
>>> > "Christopher M. Riedl" <cmr@codefail.de> writes:
>>> >> The idle entry/exit code saves/restores GPRs in the stack "red zone"
>>> >> (Protected Zone according to PowerPC64 ELF ABI v2). However, the offset
>>> >> used for the first GPR is incorrect and overwrites the back chain - the
>>> >> Protected Zone actually starts below the current SP. In practice this is
>>> >> probably not an issue, but it's still incorrect so fix it.
>>> > 
>>> > Nice catch.
>>> > 
>>> > Corrupting the back chain means you can't backtrace from there, which
>>> > could be confusing for debugging one day.
>>>
>>> Yeah, we seem to have got away without noticing because the CPU will
>>> wake up and return out of here before it tries to unwind the stack,
>>> but if you tried to walk it by hand if the CPU got stuck in idle or
>>> something, then we'd get confused.
>>>
>>> > It does make me wonder why we don't just create a stack frame and use
>>> > the normal macros? It would use a bit more stack space, but we shouldn't
>>> > be short of stack space when going idle.
>>> > 
>>> > Nick, was there a particular reason for using the red zone?
>>>
>>> I don't recall a particular reason, I think a normal stack frame is
>>> probably a good idea.
>> 
>> I'll send a version using STACKFRAMESIZE - I assume that's the "normal"
>> stack frame :)
>> 
>
> I think STACKFRAMESIZE is STACK_FRAME_OVERHEAD + NVGPRs. LR and CR can 
> be saved in the caller's frame so that should be okay.

TBH I didn't know/had forgotten we had STACKFRAMESIZE.

The safest is SWITCH_FRAME_SIZE, because it's calculated based on
pt_regs (which can change size):

	DEFINE(SWITCH_FRAME_SIZE, STACK_FRAME_OVERHEAD + sizeof(struct pt_regs));

But the name is obviously terrible for your usage, and it will allocate
a bit more space than you need, because pt_regs has more than just the GPRs.

>> I admit I am a bit confused when I saw the similar but much smaller
>> STACK_FRAME_OVERHEAD which is also used in _some_ cases to save/restore
>> a few registers.
>
> Yeah if you don't need to save all nvgprs you can use caller's frame 
> plus a few bytes in the minimum frame as volatile storage.
>
> STACK_FRAME_OVERHEAD should be 32 on LE, but I think the problem is a 
> lot of asm uses it and hasn't necessarily been audited to make sure it's 
> not assuming it's bigger.

Yeah it's a total mess. See this ~3.5 year old issue :/

https://github.com/linuxppc/issues/issues/113

> You could actually use STACK_FRAME_MIN_SIZE for new code, maybe we add
> a STACK_FRAME_MIN_NVGPR_SIZE to match and use that.

Something like that makes me nervous because it's so easy to
accidentally use one of the macros that expects a full pt_regs.

I think ideally you have just two options.

Option 1:

You use:
  STACK_FRAME_WITH_PT_REGS = STACK_FRAME_MIN_SIZE + sizeof(struct pt_regs)

And then you can use all the macros in asm-offsets.c generated with
STACK_PT_REGS_OFFSET.


Option 2:

If you want to be fancy you manually allocate your frame with just
the right amount of space, but with the size there in the code, so for
example the idle code that wants 19 GPRs would do:

	stdu	r1, -(STACK_FRAME_MIN_SIZE + 8 * 19)(r1)

And then it's very obvious that you have a non-standard frame size and
need to be more careful.

cheers
