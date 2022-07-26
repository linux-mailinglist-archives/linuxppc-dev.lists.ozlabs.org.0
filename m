Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A8B58136F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 14:53:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LscJs3LRXz3c42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 22:53:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RKk784qW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LscJD3XDdz2xss
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 22:52:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RKk784qW;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LscJ82K76z4x1f;
	Tue, 26 Jul 2022 22:52:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658839944;
	bh=B916ZcEZ9GmnXmUiRbVq64ufE40/Q4+3V/8q6CB5IQQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RKk784qW/sFilGMxVB+erhrDdNo+bb7KJuokq3+WjoghfEAMNEpDqk8gKkEn/Aukv
	 BDYQqOukZ8sRPjvindt+xmlnprJDxZ4Qbo0EEdCXEIs3eC7ocerW9PnGoH01j7F7Ul
	 At8d1X8tkycx2ruFjSgKlLDMxegqN4LBoOfxkWyhyxRW3ybaLaxP11cD+wZWe9lfer
	 FTh32rG18+VV9O9DV0U/BraUQ+LafYpHU2HagzE1PvriwuS90rVTrrZKwek1KoWVR8
	 LV5Cfpf7g0NQ50pLVd75q6SBM5PGMDZOja381Y7AjWStqAEhGvcvLxtUANeHnjTezZ
	 JzYFVMxc4VUHQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/2] powerpc/64s: Make POWER10 and later use
 pause_short in cpu_relax loops
In-Reply-To: <20220720132132.903462-2-npiggin@gmail.com>
References: <20220720132132.903462-1-npiggin@gmail.com>
 <20220720132132.903462-2-npiggin@gmail.com>
Date: Tue, 26 Jul 2022 22:52:19 +1000
Message-ID: <8735eoavek.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> We want to move away from using SMT prioroty updates for cpu_relax, and
> use a 'wait' instruction which is similar to x86. As well as being a
> much better fit for what everybody else uses and tests with, priority
> nops are stateful which is nasty (interrupts have to consider they might
> be taken at a different priority), and they're expensive to execute,
> similar to a mtSPR which can effect other threads in the pipe.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Unfortunately qemu TCG does not emulate pause_short properly and will
> cause hangs.

That _really_ sucks for testing, being able to use qemu is a huge
benefit. I can boot test multiple kernels per minute using qemu, vs
multiple minutes per kernel using real hardware.

> I have a patch for it but not merged yet. But if we tune
> qspinlock code it would be best to do it with this patch.

What's the urgency on this patch? Can we wait for the qemu change to
land? I guess Qemu 8 is not due until next year? :/

cheers
