Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FD16CA68B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 15:55:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlZ8b2Zy5z3fT4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 00:55:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FiC99RbS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlZ7h3Lf7z30QS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 00:54:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FiC99RbS;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PlZ7h212Bz4x7v;
	Tue, 28 Mar 2023 00:54:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1679925296;
	bh=uWnl/m0Dw2ehpGVs2HiZ4txwkbY4GaZnOPnOtL2Xd14=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=FiC99RbS8fhQkhvDgf4lv6X64xpQnghza9fPGFd2Lpbp2cq2VPVagP4qDBES0aL0u
	 PMRnB6GJ2jvdXnq4hCeat34L5PXYygp/AeOzAfZpvSdpytpEG0aWGz0c/+3JiSBrn4
	 dLMc5wu/NOQLw/0fBdOnRZaqkUk8I2pKvRabRvdLcQ4bSC6B1Jl2nqzwP69lDVObY0
	 vEnJHdVN4HrTt9yOwpXyHb7BNlMbIKZqssSf9PV+ie/B7v10GGzcxZ3mUc1YTwE1ES
	 sVAkAiXckU9guW8LPhy2lzBXh2KiE4gh89XruinDFyhtyYTXur+KT5j0+CrJWLwm6J
	 8CJ6Xebcii9Rw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: don't try to copy ppc for task with NULL pt_regs
In-Reply-To: <CRGYHQ3C77DV.1PXS812TV997N@bobo>
References: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
 <CRGYHQ3C77DV.1PXS812TV997N@bobo>
Date: Tue, 28 Mar 2023 00:54:55 +1100
Message-ID: <87wn32cn9s.fsf@mpe.ellerman.id.au>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Mon Mar 27, 2023 at 8:15 AM AEST, Jens Axboe wrote:
>> Powerpc sets up PF_KTHREAD and PF_IO_WORKER with a NULL pt_regs, which
>> from my (arguably very short) checking is not commonly done for other
>> archs. This is fine, except when PF_IO_WORKER's have been created and
>> the task does something that causes a coredump to be generated. Then we
>> get this crash:
>
> Hey Jens,
>
> Thanks for the testing and the patch.
>
> I think your patch would work, but I'd be inclined to give the IO worker
> a pt_regs so it looks more like other archs and a regular user thread.
>
> Your IO worker bug reminded me to resurrect some copy_thread patches I
> had and I think they should do that
>
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2023-March/256271.html
>
> I wouldn't ask you to test it until I've at least tried, do you have a
> test case that triggers this?

I hit it once on one machine while running the mtr test from the other
thread. I'm not sure what leads to it failing that way rather than the
usual case of the mariadb test just printing an error.

I've got your series applied and am testing it now.

cheers
