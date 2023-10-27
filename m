Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC997D951C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:22:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XALkcJro;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGzHD0vgZz3cSY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:22:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XALkcJro;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzb0sDFz3cS5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401304;
	bh=O7LMhrQKx9S72GAst1xavvrM8px3t3q7AB2aD4pY3w8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XALkcJroRygDjEG3pxdLJizqBXOP0u25VKdT7t77/wY+k4C+/ioC/JVndNORsBDoT
	 7691e1SnNKVxZC1WOa6lY1xTGsRKXoMxHBvsH7hpkich2bw5TQ1G8loR7MNhpULKFT
	 HAx2oAVL5rC4ngMzH+bvOKaSfBUo8STHgUABMf5NDFCmUVWN1PQg8rhEH0rcYK7/Rt
	 3RwMQEOgfXklcYqFe/Q8lHHymVmecAaFdNv8HGAu5yhOelx+gGcUeJiHw3pdLMw3lZ
	 /dU04fWvmUDtAIZGnX7t2mMGcDAW/wtk3xtxmtWr4lf74H0Dqiqwuxax9Rmz5P9SfG
	 JW2OmiOHa3M4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzW6Snqz4xWK;
	Fri, 27 Oct 2023 21:08:23 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20231016124305.139923-1-npiggin@gmail.com>
References: <20231016124305.139923-1-npiggin@gmail.com>
Subject: Re: (subset) [PATCH 0/6] powerpc/qspinlock: Fix yield latency bug and other
Message-Id: <169840079683.2701453.18141545904760773435.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, "Nysal Jan K . A" <nysal@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 16 Oct 2023 22:42:59 +1000, Nicholas Piggin wrote:
> This fixes a long-standing latency bug in the powerpc qspinlock
> implementation that quite a few people have reported and helped
> out with debugging.
> 
> The first patch is a minimal fix that avoids the problem. The
> other patches are streamlining and improvements after the fix.
> 
> [...]

Applied to powerpc/next.

[2/6] powerpc/qspinlock: stop queued waiters trying to set lock sleepy
      https://git.kernel.org/powerpc/c/f6568647382c667912245c8d07aa26c9c6d4d0c8
[3/6] powerpc/qspinlock: propagate owner preemptedness rather than CPU number
      https://git.kernel.org/powerpc/c/fd8fae50c9c6117c4e05954deab2cc515508666b
[4/6] powerpc/qspinlock: don't propagate the not-sleepy state
      https://git.kernel.org/powerpc/c/fcf77d44274b96a55cc74043561a4b3151b9ad24
[5/6] powerpc/qspinlock: Propagate sleepy if previous waiter is preempted
      https://git.kernel.org/powerpc/c/1e6d5f725738fff83e1c3cbdb8547142eb8820c2
[6/6] powerpc/qspinlock: Rename yield_propagate_owner tunable
      https://git.kernel.org/powerpc/c/b629b541702b082d161c307c9d7d9867911fc933

cheers
